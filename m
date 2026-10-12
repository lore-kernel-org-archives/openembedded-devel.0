Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9130CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:13 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3526.1791763870877980195
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FcHv0cHP;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso311109a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763870; x=1792368670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcA8hh3M98vJCTJzI9euS/gus0y3Gzf5/hG2K1IrN2g=;
        b=FcHv0cHPYcBcFrITtRl2weELBxiPC9gzOFmVJe4ySAMee3Ry3ck8mSI9i3lmkHq3pO
         DZzvzQg8Rb9kbZbidcjeWWedXGaMEZkJWCqVQdhAZqKzD8BzP+07VhG6620ODWZrMUcY
         +oiW8kULn4mOutZbXBdquJlHIMO8u1gvHenwKHYhqXKMCZMbogc+we37vOqHZ231Ad3o
         PwW7mAmK5XFJv3l9cK3ND+3hNJhbqAkkn+WGR3+MnTOrDEbbl90JlQuDXtXB4TMSsUa/
         7vp8tjRQ7ZTQmXdNir5GMU3YwqXq2+oHRjJmojl5VtnR1yF7mmMjVKRzjyTUyLgbUw5p
         pi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763870; x=1792368670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcA8hh3M98vJCTJzI9euS/gus0y3Gzf5/hG2K1IrN2g=;
        b=G7PXk8DRixCoQW9UD6wYZaXamhnh1xFf7UYj0UMYZONg6BR1dgO820nBVpBkGpI1GZ
         1HS0hAPG3aSTpgaHpgAugPzUmSUwS8WR7ojkjcUuj9S4g05K/mdKAWzcQjY5qklffKX3
         un/sGeIJrAQT6zY8cNaAeiR+NHg5dYLscm76tUYssjdHKzCiHlGzGR0IV9UxT4Z+0kab
         AscS4TjH9R1RpCL7UevQXG8xERwDfQUBUsEp+d6s4PMyh6ZgWBieuaOw5/bCkR1Vxp2Y
         cqEr576nXoGAzSBwPcntIF+qkI929j9MQc3rf+bJFaWo8XzM8i76Z3IqJtFkcfgDjgLv
         BteA==
X-Gm-Message-State: AFq9FYKvDT1MD/9XLsscXgOGvqkRG9/RzfeqTPx2IAO11KnV2AwMJKxY
	famdWyaqSDqPztD4PKSuztxs9owb9Am39ZUoXiC181dioSBSTRQzpOwVnT63Gdyt8ac=
X-Gm-Gg: AYBFou1gSHCOoSFKe/oFJTszb2vzlqDROh/Hzu1pGGUKZbewELBKhU7hfeHGR0jfLGm
	N+Ya8a+ijhakLtGcM3yqu0MQCGIr6jr5ZLj9FCcqhmXZE2aZtMAP+W9Gc14edQgNjyWMRY83esd
	/Hc1E1svvVSJoNbWOJa5Vty0u5/4i3IMXaaKYom4y2/RA6VboUhegNvG96dJkTz0lfIQkmd3krm
	Auw5rqP4IQmIbltBv7AGWo/0YUOz7Z3fERdUzxbvTuw1vgZnLd9e05905lEAgcxz2xN45TMzEi1
	d/kTh8qrIGhMzjq+OuYUayWhXW57nuK+jkbMPhZzYTV/6BXfj0vFYHkqaZCUDsOwy2j1hZ7jB7j
	WxQuC1+u8o5WHC3bb+VlavBeDEO3cm6ead/qAvASMIDbpcMtHqWOKwpjs1aPuI1X7NMAY306iOS
	WcUMEjz8jyD0UrB4bW9OXgVDJQZ7IRJaGVrG5RG9eqobnl+y44PZq0oVBkQqiqtIc8wb74NMak6
	SGB7c8YaXPVHtPJHUEzUIiCJ4NMcfp4F3e53oo=
X-Received: by 2002:a17:90b:2d0b:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ab3af7177amr6174008a91.47.1791763870220;
        Sun, 11 Oct 2026 17:11:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 21/28] hdf5: patch CVE-2026-17574
Date: Mon, 12 Oct 2026 13:09:59 +1300
Message-ID: <20261012001007.2541673-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130746

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
 

