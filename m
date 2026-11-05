Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6633.1793913787768174590
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=M12HOMTM;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso3199542eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913787; x=1794518587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRGkqx275ZALr91aZdE1fHm0mnzExbQ5waabp5PY95Y=;
        b=M12HOMTMehn7Rss1B2g//1EpSJsuATcfINcSqyTYqJ5vhiSCzSVtZtZIkYVznVYBgj
         TzI9q88qQ819B4D6ThAbEKvrYjwx7AkDdmyMM/cEX3VuKA4WMnqoQt8I9wkx0sq0q/Gq
         ud9U8tL9FdqCVAZMaRtFWmVzSIohCxWUJA6G+5XB7nJehrbdtRz5v/eoeruJA8DVzn4B
         +Wse2IuErohWBwbEa41htYYmPDMjIKK3p76ZP90b/sZg57x8dcXL8svEovHHuRyVjT9c
         scMTJ3bp0YewMRNKfK680rPq8cToUrYhNvoy5vsG85vea95+XqlFQAn0G5pq0GAGSL8j
         UMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913787; x=1794518587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRGkqx275ZALr91aZdE1fHm0mnzExbQ5waabp5PY95Y=;
        b=AGLiarPSs4itXtgRVPl725gKiVcbbEUn3CLduqWnRKM5/h5TJ4UZFcwzNqjsn5esJM
         Qrn48izeHDpawGr40V3qnpkGDHFXQsMOU3PRy0xSab6GE/0hAnA5Ib4BdJqoUhCbS4RF
         pB4e7ym9DK4jOd1CiPf6TpelHhtCW8MU8yX0o2wEUlEFmJMkM7ptkbYB0ykg2f4K6HM8
         6r+XhhwgXi7IQxH6KRQqRiBjNVi7bfTftyTmQZufrwFAGbpUNfRLPww0mYJ2x4h1YKnf
         GPFSVXOov1N8Gbow9yL56ETtwSUYMqkbMJEw8iiyJyhk7byHbnU+yltM9UNx+cq9OQdv
         5smw==
X-Gm-Message-State: APuU4Z8KqV/9jNe9ctTaTJ9DszZOmid0cGZLg6V6OdB3dpkt2LN/tihp
	jcND22ofwecm5NgJP7xSQSyDZHIilwvZvkk7a7E6W1UzVzbiG8k/6BxeHrroVg==
X-Gm-Gg: AYBFou2cZgarPga8bLR3BkUJMtyP4okwpcxYBmEhiOD1qwNKsQWGsBlOfCqlnRIPhF6
	diXtS8hINiFFwA5CqkNn6vMMvMPl/JNnwP4L+QWTJwdZr+7aV/YsTpajn8OTcydR+hZkxxn+TA+
	c/Q8XK0JhGYHpQGZfLshbwdJaLFET6FA2LutdYGk2v8CcNqlIhWV8e69yzkm2ofox6QRzpi9E8W
	QSU/znlllRAHkwW5E7zeg3gdoM9SbzXbhEkMaCqrLmAsGMMRphv0RVytzNVtIxSDcTt9DX2ilYa
	03M8NL2A4rg3bcFPb3b3cHDXKJMoCJo/cFn0o/f8H4mUjNaoyd4xBbgkXOaCMQjtPDJ8WUeaY6y
	HtIGpioNc5LSeCwfnuOVHznFBTv6x/Ss8hQLXjh69BJ+Om//L2weatIc7HkRL2XtFJI6i+E/a0o
	2UOVkiRDaP9dvbZ63hnVQrnTnFSsx3N4UblqhKesSZebnwJ1YbXsSGG+RZHFU/Z/vWuONmbVFnJ
	KQ8sGax3HsZqtMyqwtckI8qQFQIkDxH5vvER3/bSKOzZ/QG+8A/yNiNN1EHAACuSp4Z/M/LLo0+
	AYMG6olrhRt/rx8EYX7KYQ2f/3FdxhTynOpw+GDi7wcawXnjB7NGph5FSFC4OA==
X-Received: by 2002:a05:7301:1408:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-36f7611b716mr446944eec.24.1793913786923;
        Thu, 05 Nov 2026 13:23:06 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/14] hdf5: patch CVE-2026-120757
Date: Fri,  6 Nov 2026 10:22:42 +1300
Message-ID: <20261105212250.490188-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131943
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
index 2b89c6925b..8777345a72 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
            file://CVE-2026-120756.patch \
+           file://CVE-2026-120757.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
