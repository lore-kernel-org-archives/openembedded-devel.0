Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1913.1795113423231586524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qvCdJlRZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a07078200fso84827b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113422; x=1795718222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENccA9Y/+lG02UVA4kJA3ys6/ru2f9mjV0lgJ9jCHvQ=;
        b=qvCdJlRZ/OYc+GU+2XrOe3iQMYk6ZtwrqPQ+PlyTNPLjkGLnGISleX0WTEGPQVesOL
         NRlkUl+a6vI3GaGt0uGCOfD1mpijnjBczCVPFL0VBxPYWvesdNQA/MCXtSHmKgbaraoP
         FUQAAnf1nOZujjObluBoN6cnd0AtT1u+GyhKNvJZPpNW+HvErMYV/2cgNz9vS0YhvxXE
         MDiPkVSqtMNTMgodfvCxpTG4JGzd4rR9e8MaFUz+5B9abytbiwzgsaO3BKADKipRTIFq
         LLv5YtAP1r8pdaJf9RysCWP9sMl14c3SKclcG23Q0lQHd1QIuS1lUZCXJrZg4cSLsTBW
         mILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113422; x=1795718222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENccA9Y/+lG02UVA4kJA3ys6/ru2f9mjV0lgJ9jCHvQ=;
        b=yEp7UT9a8P2IDAmeA7owhfoUCuhGHkK0ps/kVakEJAbanKv1kNTVcCALpoV/je3lPf
         N0ZMbtKAPtNB8BWSK3uS14/rb6kv6wgKvcPX5UEEM+8IWIYvRlg0uBe6JmMLcMPm+b9O
         +x1qJnl0nq68+HkclSA9Q7WtjaTWMNn/1FwWSBh8bB/b3QR/xX3rQj4aeiwt9pXYpiuV
         2xrCgmCKr+SW4SzrAhfm+kiGXBl4ifoJw2KsfJHrK9LtddotPkM6qz0BSk7xf4X0K2jw
         f8nEnjvybvjmwEEALNUjRzycDtRvWyhPdO/ooAFYDtosdTZl6pMtU3wAkevAGmomz60j
         jbMg==
X-Gm-Message-State: APuU4Z9giLSNRDvLbluQxVDMoz4R4LxCY6tGyPXdtXHgcFAo0EGqgXhq
	RAu+cV0yvIvzfIY2eqSl2fhTyr3p+WfSya32q6xI5xHeZuGomhGFD6w/6y3Tug==
X-Gm-Gg: AYBFou3KyKm8YNNqN93KEy6hiBtXla11+GGepjBGitcdmmzrfKZIH8BRTuITaMFBInS
	aVDrKNKAz8uW0sMdK2mY2j2xIrE3nnKUcejNZ/K3lpRQT82xHyGGy+7P76ZSMi3wpcIwERxiKdy
	YARRhxn+u47rf3GhqjMVziHSqxWo1Y2zAC98XAvwu3f++Q9D7x0vlwce1zKodYSilo1yCkXdsIw
	bkiWgujBqgJYfRGhb+1z26zXlCorSn+Zmnt/JeKF9XMnarPriqABLQ/leZM5OO1f8QpbPpP8v7V
	r5WXjI70Aejr53LOUPNE/rnWKtLYSL6nAhjUnp0ATzW0wTDCYRMSl7Dxdgs3E3DUjWM87yoaQJS
	A2em61Ie1UAG+Wi0V1ifLgpjzqOtvM/1Jz+v+9A7E4fqgIbK/TMyE232up5AZ+lF4hBDDIlobsq
	kJAlDM6ukJBGHHygYUeELMftqCNnao9Z3dSVidrQNKghJI5Xo6pRq26iK37YX225MQwR3HZRLCN
	ApCEWYiajKXuY1pCr1IBLlGZcOcCnkzQA3F0mqUoNGzate3pQU9VZbT5OvvghvsY6QPMd674Xq3
	YOAzSS4jC5DchFGj/C3Ma8BC3gveJa9ADhO6CjbbroEHlMgcgstrK1y1aowm4A==
X-Received: by 2002:a05:6a00:1ad3:b0:893:1336:4816 with SMTP id d2e1a72fcca58-8c87d809a46mr467149b3a.57.1795113422552;
        Thu, 19 Nov 2026 10:37:02 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 26/64] hdf5: patch CVE-2026-120757
Date: Fri, 20 Nov 2026 07:32:54 +1300
Message-ID: <28dbc625a3b20166159912c5cbf45860d20a6185.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132716
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
index 390884e618..3cfce91bff 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
            file://CVE-2026-120756.patch \
+           file://CVE-2026-120757.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
