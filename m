Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BEAC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9371.1788343581524036043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=StOEr/iR;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398e9698a70so833760a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343581; x=1788948381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBOq2A9SdyvOtz0tMobbgUjhrli/Ut35z6szyUGUDVM=;
        b=StOEr/iRReRzSL81jYvq1LOkKcr3TgrAbM9qFNlPv7dx6/6WWjjFR2EGcxLLtNjtnZ
         V1QepttYHoWkzXgO14gkoAQgGqKPJBoG3J7zx0x30YVM+ErZqz+iAGfUZqMeghhCQAvP
         G/IZz2Uv82T4KUpRyh71LVXvOWUQPvzxqYJ85hhiwoPbqRF7S9az3Tv9avP/KrF8m07e
         LubAzSrppS9oaLxAnvXlhuNPAgVObDKooWmTRCxuNX65dUT1Vi4jZE60hSnN5wVq3Rcq
         nbw/29CYlEaj1tkTNGs8t6AKFvpaiv2+VN7IjzivResqZ5lAWgIyf8i0ndO21I+KsOJi
         rKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343581; x=1788948381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBOq2A9SdyvOtz0tMobbgUjhrli/Ut35z6szyUGUDVM=;
        b=UtUqzNhv86aA16m22A5QO2GK8t4f+QS+7EjTBL266SFic6P8XX1j4+VT+itnKQ4qvM
         kqVEhorrtg/r8kVKPEk9KzI5y7C/09/n0cQ8jUtTM9awNPp+5fQ9kKp67vObDfaepzwZ
         cQOy+x5y0gs39SK2sa4nE5wKd//zu38usV9yqoKwtoFUVJspH/hddcX7T1omRgkOif/+
         c7Qe71NzQQ8GRPSnwrPzOi5jAQeS0lECoLNGEAAMhs9N+zIkiEAYuAcRTb9YWE/M2DN1
         1YSI+VwoZ7nrDvnbHzzb3BIaNCs7nBMXspX/jJbIDw3OahjbftBryQ1qjPAEs3W65w9T
         vPxg==
X-Gm-Message-State: AFuF++n9UewSmlgJVLCO+L6H+LLO+0ymdccoGlG73heVb5IR3Y8cMv/k
	yw+IhLTG7CxxLDR4TqA2lgWjuAzpdr5eUfgU1bSn92zNAz1/tTmzCvhx084LPYIe
X-Gm-Gg: AYBFou28sraEV3v/u9MqGc623XvcGURx529psvYJRfmn1eU/y511ttCaCWLDQcKNA6V
	pe7dFdnvFhI57QxvTbRQ4Npd8TQcsyXZdJrP1DEhdhWbPxMjmPjxiOxFtg38qe6MAswJw3EJGiZ
	xZE8fL8zyGJlYIrX5j68dFSiabWCii+GwdiHROveQO3/MZyFpItlHaDhPX4aGVtP1RZHaAxhR6p
	OHhaLtNvSzr8zsSPp/V9LkyAd6rFWPhDLnPq1ozVWaJxw++tMJL8lEsqPhEqMp0cboGjkhjVdn2
	3RHcp+pCv5eWfOaHoQTpTBceERk4kHhmBAp1LC+z8USaX/KHgV7AZiBWBHbBkzjoX6mCIQl4S85
	6fBhu0qlXOAOluaHnBrsH5mOpf/YoeaVzhsnisxhE9SZKLFAH2IQ1cXkxkx6hDD7CJJ/oiOeW+6
	dwiPU0Hf/iPKH/Bx7SyqVLc2OJx+2zexkzk8C99rh2CeHkB/tfhIbyyr74UeoIFvxJ2Z+B2ji8
X-Received: by 2002:a17:90b:3e8d:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39aedf4c655mr4355493a91.10.1788343580507;
        Wed, 02 Sep 2026 03:06:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 25/28] hdf5: patch CVE-2026-17574
Date: Wed,  2 Sep 2026 22:05:07 +1200
Message-ID: <20260902100511.2105916-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129656

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-17574

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
index c49d5819be..8b5b842fa0 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
+           file://CVE-2026-17574.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

