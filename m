Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C9CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32811.1792043028213912555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ow2IjqIC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db80fcdf8bso28337675ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043027; x=1792647827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMMahbzhy1XoR1ziQmNzT+BVMB04l01VmUJFI9PAABM=;
        b=ow2IjqICn+2cvGSADDp3ij9BEwmG93japp/+ci31jhkNXueUuMyWlxS7DTYWfhGoRz
         Gl0/KXYoFjzvvHjoduaU7qrhNsQAyYuCIGws/L1CfA8Jz2savGUhau1h3/GcUN399zKa
         AozRa1q1XI91/aZzm8ozAVnA7NtISm19XlP04qcTKOXKWtkYtzl8XHNcHXX9nX/z+uVV
         yvVHJ4pvyEGmVwwI3bZuHKhiAsfUlkEXLEC+pZM+GedI4XMLqcsV3QQsA0NQOahMwQXq
         W/74V1p6J2cNBqW1V0KtrmSsCJpmtqrkVK3ioHV3fkyusQtRQbUsps2JkLParbSXcEPv
         v6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043027; x=1792647827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CMMahbzhy1XoR1ziQmNzT+BVMB04l01VmUJFI9PAABM=;
        b=nSKQkfJEv+5uSe5C6TXEg4oUA5kZasOEGEVKJGqvho7dTtSPWbLnbOSi1XGiyTTJlI
         X/Op0tYryeMr9N6/tV9loDk913tG+BWXfpsk7nCq5yGpQ6KIXWn4UCdCDtSG7yeLFWQ5
         hK8rryW0WN8ZRxNG5QCIs8a5MFoPbANKXsPaGkAkcTNmIUg+IVY+ZeUnVKLBEOpCKCpR
         S7cgyG3gWnUp6QzQdLaMjnQxMl+9Co51GaxDVbxuRlWE0xdiN61A0xWHW9BSVf9Zy/VE
         NEr/azvuDa/xn1qUmNCsINvz8QHo7Hf1crDVORstB4qnmI+lkYYuILQdQcBnxmve9Xfu
         k7Og==
X-Gm-Message-State: AFq9FYL2NTv6wFEuuc1/PO6XOLdI0358qof3OnRQ96zC+wf74gtjc1I8
	19jnqPdEms+N5Gi6djVoHvVWDqmavLPjrYlzbZ06n+AiC06xCd26iICGlVG5Pg==
X-Gm-Gg: AYBFou14C9Quu9OJvH/HNWumLIPbQbpR61cuPGCzd2lWpWn+wP1gWKTwBdAJ+attEUn
	Ra6x+bb/IMKlBGU2qnVqh821VUOFE7zubtDYN5lMMNDggnW+jwvXv/67mmTlM5Uap1C5Oq23vof
	IoyguZA+MHQGioGQUl90ZEXaI6Fg05CQWGCdZVKerMVArrQITc5WEpOGJQRQhy41k2nAzwrteeR
	iouZIOzEO5RaZl6eDfKQHvAJWDrzXVXe1tQJLTXVoGAzRX4zYUVelzPKjdWFkZtBPsrujDKW4CR
	bOyiwW5ERec2Kr1HyBrli3EpM2bd8KDlbbnr86m6WCsNhRO3sUc9G34I+RVQJFl5HPCaBNTmQ/m
	va4t/jyu604TzQX+ewLix0mqF537mOfYgYLdyMflHkkpJohPkuQ3OCIIKDPoRZwLnBkw9akUwSj
	Ysdi2k5ZfEiqsQelNCTR+S98/BAaY97Bem0mEErc1cdKu2CXm9+2BsBvZSG1sv0WPP/jJHLcEUO
	IyrEZbF7eh1nmLRJBPPWcw=
X-Received: by 2002:a17:903:19ee:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2e8428a1e4emr140752545ad.20.1792043027531;
        Wed, 14 Oct 2026 22:43:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 27/82] hdf5: patch CVE-2026-17574
Date: Thu, 15 Oct 2026 18:41:15 +1300
Message-ID: <20416114defddc27ae84fe2db99a77e1936b1ed2.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130947

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
index 0000000000..0ae79a2811
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
index df0192a091..12c9852fd0 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
+           file://CVE-2026-17574.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

