Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481C4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5104.1791839464976541718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UuUbJNgQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1300634a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839464; x=1792444264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcA8hh3M98vJCTJzI9euS/gus0y3Gzf5/hG2K1IrN2g=;
        b=UuUbJNgQTQ0p6noJJjZ9YYRWNYcdqExtEHG1c/ab+Z8AUh1OTjuo5HGil1kErapSQr
         CC9gvELasg3E27GwqCLwxdbncXf5Y5/sCPey59qcupBMD63OLBG3TXCZWxoDfb8AECZs
         nRAsMffNqmtEVv3W+w6f/NcA/t1lOJu6mRtcvFpq+bRmN0MxNso9f/RW6Erw3T0g5x2j
         WiSPrV5dvUAGfPQyw+Q6B8Kd+iyyktMbCx9EumEHF3m9I3FHK/VOAUSBCDKanQeLNbdD
         qUk9GyOX4C1q2s9dxSxRvDNK+L59EY0sedjoOpEy8KHvRDmcVkzg2B9yQeW91LgdTw1R
         fNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839464; x=1792444264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcA8hh3M98vJCTJzI9euS/gus0y3Gzf5/hG2K1IrN2g=;
        b=b1GrWOHvc5gEfFlCbd2ZpjC7ZWvTVi0KBKZRmmaAIwZrBK90UCZje3NA8QJxDsURO7
         JP+CxycHiomoW612phQrxPLYbW80sL4Dj41fm71kIHbD+PRd1I3wqFXpaYFzgEZxHZWD
         HP1ElsYdQkD/LD7OqJ1fXX70I3X9pyc4D5roIbLNK/p6IHSLGxFDWizQEywF1Mb3ziye
         kwaopmi06g0nX81h8EF7gw38i8I1h7OU9hwsqVFHk/shCSztQZz3Ew3g5g0EvfFu41D7
         /SiqIp8nZSTQqiZOGcUQq49o2fWp0rH17VMTFRJBC3MaYr9FBhBmYHNwMwecu/5BwK73
         +ajw==
X-Gm-Message-State: AFq9FYIPe2KG21a+aHFEy7u1yZdUNHNSvhteQvhH7cSQArHAv/HtNYmW
	Nv1Ka/JIJLhHScD0/LZo9flNXVlVDENMnIxRJdZJlJZgkzuXhIk0v2+MEXFDmAKX
X-Gm-Gg: AYBFou3QAgrnTJMi6p3YN/SFMj8v55O4KnT5GLpiXyiwt2XSu4uDmcC/VvxhCA3He4e
	LhRMUBLG95L0P34V6ASM291u8qQxGBA2BIRafqtUxgPpU4KwX/IjD66pWkNP1kBMNpZEHcqAQYm
	erFOfKFykgpRK+f4cHaRoBfC0wnu2Q/qEWoOJD1VfwVbStUSKqC3NW25FVbFNSHO3uM5LQu78cI
	mo7EnH0+nmIyuhtL0Sc554Y/jJKTqjHCvzpjQg/8vovP4wHjzk+c/A8zYkdiNSVrfQ0l72EZ+dW
	GzCNoLKQUp0OwYY97SDustwuu/9DEP1+JC3W1d31bVyk1b6qmQRJVDSx3yQeDF8YtYv5rLpVIso
	mMeKLq/3ghGNLQMcIwrGcj3M27foRpxjl/iAu+MtFmVP6LbZfnhOD2JD03fYd9RRraugC/Huc3J
	uNkwwuy1F1ARgdnXvXMqWDiiNfKAh7/km83PS3tJMMT/oZjfnFl+LR27EwJL3BcNj9O55f+TxlG
	F7lQZbtzREnLRCUGf5/MlocE0jNsMk9OhY88iY=
X-Received: by 2002:a17:90b:224e:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3ab3af75ac1mr7814998a91.51.1791839464279;
        Mon, 12 Oct 2026 14:11:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 18/43] hdf5: patch CVE-2026-17574
Date: Tue, 13 Oct 2026 10:09:42 +1300
Message-ID: <20261012211009.3352822-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130788

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-17574

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 637f437de908d10e8a3118888740a286c2cd1f06)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-17574.patch           | 65 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
new file mode 100644
index 00000000000..0ae79a2811a
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
@@ -0,0 +1,65 @@
+From e374b227c277e100d9bfa3b1fe5c0b60cdff6c43 Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Thu, 28 May 2026 17:26:57 +0200
+Subject: [PATCH] Validate VL datatype type during decode and check file
+ pointer in H5T_set_loc (#6395)
+
+H5O__dtype_decode_helper() reads vlen.type from the file without
+validation. With corrupted HDF5 files (e.g. from fuzzing), this field
+can have an invalid value that is neither H5T_VLEN_SEQUENCE nor
+H5T_VLEN_STRING, which later triggers assert(0) in H5T__vlen_set_loc()
+(debug builds) or a NULL pointer dereference / SEGV in release builds.
+
+Fix by:
+1. Adding a validation check in H5O__dtype_decode_helper() immediately
+   after reading the vlen.type field, returning an error if the value
+   is invalid.
+2. Adding a NULL file pointer check in H5T_set_loc() before calling
+   H5T__vlen_set_loc() when loc == H5T_LOC_DISK, so the low-level
+   assert(file) invariant is never violated.
+
+This fixes the root cause at the decode level where the bad value
+enters the system, as requested in review of #6378 and #6385.
+
+Found by OSS-Fuzz via the matio fuzzer (ClusterFuzz testcase
+5366895365914624).
+
+(cherry picked from commit 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc)
+
+CVE: CVE-2026-17574
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Odtype.c | 2 ++
+ src/H5T.c      | 5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index d6405cdb86..6e622f3ebc 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -751,6 +751,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+              */
+             /* Set the type of VL information, either sequence or string */
+             dt->shared->u.vlen.type = (H5T_vlen_type_t)(flags & 0x0f);
++            if (dt->shared->u.vlen.type != H5T_VLEN_SEQUENCE && dt->shared->u.vlen.type != H5T_VLEN_STRING)
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL, "invalid VL datatype type");
+             if (dt->shared->u.vlen.type == H5T_VLEN_STRING) {
+                 dt->shared->u.vlen.pad  = (H5T_str_t)((flags >> 4) & 0x0f);
+                 dt->shared->u.vlen.cset = (H5T_cset_t)((flags >> 8) & 0x0f);
+diff --git a/src/H5T.c b/src/H5T.c
+index 3b2e391a53..e2c9ba9791 100644
+--- a/src/H5T.c
++++ b/src/H5T.c
+@@ -6953,6 +6953,11 @@ H5T_set_loc(H5T_t *dt, H5VL_object_t *file, H5T_loc_t loc)
+                         ret_value = changed;
+                 } /* end if */
+ 
++                /* Validate file pointer for disk-based VL types */
++                if (loc == H5T_LOC_DISK && NULL == file)
++                    HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                                "NULL file pointer for disk-based VL datatype");
++
+                 /* Mark this VL sequence */
+                 if ((changed = H5T__vlen_set_loc(dt, file, loc)) < 0)
+                     HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "Unable to set VL location");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index df0192a0911..12c9852fd02 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
+           file://CVE-2026-17574.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

