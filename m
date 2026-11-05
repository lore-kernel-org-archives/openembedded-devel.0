Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5197.1793909169981804168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jIGGHUa7;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1adbf62dd31so3095770c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909169; x=1794513969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLyO4K4cO4WIExw6NDm1jqbfy6Qfj5uFqYtxy1/CseE=;
        b=jIGGHUa7fSTDDw39SS8ebpl07cO+96V+lJDIayl+j3s+OTix0h6kESn9O7gtJXlFKR
         MnPxZgO5f95eHnYQstb5It9psvJEzT4BXtzLZluvcm/ZgCL791dMXRPDf6vXdP+qK/uz
         hz0Z7te7FsAWM+HNYz0vw1n4GQiJ1hns0/cjRF3VOpxRTRgB9lLiIhpJYM6jmZXD0147
         q1Lp5JKSq5GVYFK/rh0TiIaCGtX1rg6QLj5rC/U1XM3bgf6ey8HsEs3LZ0JQ/dYMn05d
         eS2KpxCXkeuuTxOhlNqPIrg2KF1eWTtpEo1PR1tqVOJfvU5MLN7NLfxrMvqZQSA7XmPB
         SSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909169; x=1794513969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLyO4K4cO4WIExw6NDm1jqbfy6Qfj5uFqYtxy1/CseE=;
        b=FDx5KxJ7tuAYHyFe1pwTYBCYjJpF9pwprbJ8aakskFmr9is0AQnEB9Y3s++7gka6e5
         ytRnRhZ2DscWyWXBa4wuJ9T7RZhgAQzp+BYc8CwPsx5t2xwqaKwMzo2OjL9jxJZM3Ub1
         aqQVY//3NBNHCWUeKRuVFUcTfuFa7kGVDmoNMthYl8TZLxseXiTUfkiJukRgnfL+vdFO
         e3+gLxahmjeSVMYcZykViD/aJvfSbNiA29Hpu7P+6GpRIReW89x84wAEacLtIX+14MmD
         QyBEaHgZbbVwG3cfUw23xMOwoALtmGhE+VgII9A0IlHzUqxSVgg+lWEfBivLVfgkS5ue
         AYlw==
X-Gm-Message-State: APuU4Z+oDOF6ncd/cH+lD3tPYEkqy8HDnb78ksvXjCBDLW8potq5VAHY
	hW+7MME96PJ4LyAZmq4U8uBrc+dfZqMvWaqnKGnWPASqy4rDrMc09tWuFaJVwA==
X-Gm-Gg: AYBFou2YA236akgWG9LQn5GZYvM2I9sXdE2BYGTZ5hoRbe1pkrzr94gAhWFHqmjErt+
	FFjeHT86TK3Fv2w+ttyIe0B1wh+s0YDfRz6ldF9/1Xubf+nZzi+Gj2KxDN3AbK+ZiWqfi9nzfBh
	7X17ub/pTPEZuptfy5doBdhTOcFutHYouyxxsTaLPYyxkBA8gqYEz+9jSuXN4at5L/OT6FSB61t
	EZhvW7GTVkZISqels9xqpkyxkwEaIkCQnPe+k+UvK33lT7noohozJKWcVQJKcK0l81AjOHXqp20
	lnYhiJRyF5zbfHKCt8heZsqFcdSSHEmlzp3/VTdmjpXpBz19kMAYME1zz4u8t99roZd0UiV27bR
	nlwcqWuQclskukCXfNDaLp9nvDI0IPwh7XbRQybkaEaY0piZqwjBfJ08eoh2DjhQGua8mcHL99p
	Lc7viATJFDsK+mTQzU9muYX7AIyo1FmYtYWpYrLdK6+TGH82SKmbAO5KRwnrOGtlw9xpvVP4pdG
	HF77JZSUZ4ZqD1Gfic5hegBcxi0Cd/6oyiFFAxlSa6QFx4+RO0fRPa8FynbSfltu+p8Zmzq4NdL
	JtyGpopM5/AXlcLKgdSO7QmaPJQ8TUpJJD1X0V1rUoYx2exOKhgC5EEIUTmYZCsY
X-Received: by 2002:a05:7023:90b:b0:195:866:aff1 with SMTP id a92af1059eb24-1b25d34a822mr74521c88.25.1793909169143;
        Thu, 05 Nov 2026 12:06:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/9] hdf5: patch CVE-2026-120757
Date: Fri,  6 Nov 2026 09:05:49 +1300
Message-ID: <20261105200552.81303-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131934
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120757

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120757.patch          | 63 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
new file mode 100644
index 0000000000..886d6d946b
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
@@ -0,0 +1,63 @@
+From fa4c737d41c1c86638525a290b5576c8966090d0 Mon Sep 17 00:00:00 2001
+From: Nayyar <nayyar@bugqore.com>
+Date: Thu, 8 Oct 2026 18:57:14 +0530
+Subject: [PATCH] reject malformed external link data in H5L__extern_traverse
+ (#6708)
+
+* validate external link data before parsing in traversal
+
+(cherry picked from commit 8117f4c75fdfb5e759ad73ce62d7ef4584130acd)
+
+CVE: CVE-2026-120757
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/8117f4c75fdfb5e759ad73ce62d7ef4584130acd]
+
+Dropped changes to the test and CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Lexternal.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/src/H5Lexternal.c b/src/H5Lexternal.c
+index 793825d1c3d..5f874d53177 100644
+--- a/src/H5Lexternal.c
++++ b/src/H5Lexternal.c
+@@ -93,7 +93,7 @@ static const H5L_class_t H5L_EXTERN_LINK_CLASS[1] = {{
+  */
+ static hid_t
+ H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, const void *_udata,
+-                     size_t H5_ATTR_UNUSED udata_size, hid_t lapl_id, hid_t H5_ATTR_UNUSED dxpl_id)
++                     size_t udata_size, hid_t lapl_id, hid_t H5_ATTR_UNUSED dxpl_id)
+ {
+     H5P_genplist_t    *plist;                              /* Property list pointer */
+     H5G_loc_t          root_loc;                           /* Location of root group in external file */
+@@ -121,6 +121,18 @@ H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, cons
+     /* Sanity checks */
+     assert(p);
+ 
++    /* The udata holds a version/flags byte followed by two NULL-terminated
++     * strings (file name and object path).  The strings are located below with
++     * strlen(), so validate the buffer against udata_size first: it must have
++     * room for both strings and end on a NULL terminator.  A malformed link
++     * from a corrupted file would otherwise read past the udata buffer.  This
++     * matches the checks in H5Lunpack_elink_val().
++     */
++    if (udata_size <= 2)
++        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data too small");
++    if (p[udata_size - 1] != '\0')
++        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data is not NULL-terminated");
++
+     /* Check external link version & flags */
+     if (((*p >> 4) & 0x0F) > H5L_EXT_VERSION)
+         HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "bad version number for external link");
+@@ -131,7 +143,9 @@ H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, cons
+     /* Gather some information from the external link's user data */
+     file_name = (const char *)p;
+     fname_len = strlen(file_name);
+-    obj_name  = (const char *)p + fname_len + 1;
++    if ((fname_len + 1) >= (udata_size - 1))
++        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data has no object path");
++    obj_name = (const char *)p + fname_len + 1;
+ 
+     /* Get the plist structure */
+     if (NULL == (plist = H5P_object_verify(lapl_id, H5P_LINK_ACCESS, true)))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 7afba18084..3e978a75ac 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
            file://CVE-2026-120756.patch \
+           file://CVE-2026-120757.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
