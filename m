Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0DDC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 13:34:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.11756.1718372061348061289
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 06:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=if8360Ou;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-705bf368037so1934573b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718372060; x=1718976860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ve9vy4pc93cxd6RHGv1/025AVtANeec6KaCDUEo9VEU=;
        b=if8360OuCnzVCp1WYEZrJNXYrHgLvA9+e12uVfkrSrkTl82+nDCF/9TxhRnzgSGTM7
         ecdcwLj4PkWrqXDrYFvzsCrvMAoHW0pIkjs0LbSvg2ZGA5OHEgKCFjutlIQNRXOcjvaY
         KBfQT7PovF9l1TdWmKn1W349HBh/qIleZH9UH5OjBsu/NI1jCWrVNC/9Rmp4cUZiA+5R
         8XhomrL8vLXLNf31HFq+nn370yjJjGtlZHNmvLKmStDxFiyDF4wmakfTDkaqIKJ5qIix
         B5BBGakaLeTc4lSVz3wPwIEE+mcexFyFVfohymSlqk8VNS7Fxtroryu4CSfxnZHSFPXM
         lXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718372060; x=1718976860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ve9vy4pc93cxd6RHGv1/025AVtANeec6KaCDUEo9VEU=;
        b=TABPQQhoY/b+rnrsWTBoxQ6yykgHzjmHAaMUNuzDR3CgoVQMLZNKYd4GWEeJqxcqMh
         u7L+ZCBdm0/Y5JMykx/81F3vaE3HX/D866cIN9uf8RE5A5g6GDN4TRqxL2j7QNu8hf2c
         8CRa0W8nNWT+HqkcYJuPU3TCoBySZPqtF3MLh6I9HBElYi4kUbN/FE8SyT/JMrE0cCj5
         x+J69EnUOHR1plzMrv1An22yFfeAw0sEDCszFosr1INVXgakUrF69TTXKOKK14PWHeqG
         PcqosEQsqL3ulYb2aVrl2FKlDyrtgOBKy2j8AZS0FpZBQ/on4vZ6PbjLneq2g52O6Dzr
         Czaw==
X-Gm-Message-State: AOJu0YySam2p2bR/OsT8bolO7Bqc+T1XI/pDXO4r86MEnVSCPuLY05Gx
	N0hJiGlbONQP8cKqTsFVGYOGFnaW+9sLiswUd6WH0U0E1Dj+KmlZD5zm2nk=
X-Google-Smtp-Source: AGHT+IHmA133T0HcylifR2H2MCk14MWRjHsCfKq/AHcQmjUoJG0aFMIGYdPVtr6XfXwVcLXZzV9LrQ==
X-Received: by 2002:a05:6a20:3949:b0:1b6:4151:6158 with SMTP id adf61e73a8af0-1bae802b510mr3170050637.47.1718372060035;
        Fri, 14 Jun 2024 06:34:20 -0700 (PDT)
Received: from L-17494.kpit.com ([103.146.224.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d19esm3015761b3a.122.2024.06.14.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 06:34:19 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bindu.bhabu@kpit.com
Cc: Nikhil R <nikhil.r@kpit.com>,
	Bhabu Bindu <bhabubindu@kpit.com>
Subject: [oe][meta-oe][kirkstone][PATCH] giflib: upgrade to version 5.2.2
Date: Fri, 14 Jun 2024 19:04:12 +0530
Message-Id: <20240614133412.636283-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 13:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110908

Upgrade to latest version giflib v5.2.2.

This version fixes bugs listed in link below:
Link: https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS

Fixes for CVE-2023-48161, CVE-2022-28506, CVE-2023-39742
Link: https://clients.neighbourhood.ie/yocto/1-40.html#:~:text=CVE%2D2023%2D39742%3A%20giflib%3Agiflib%2Dnative

Added dependency on ImageMagick which includes "convert" utility,
to ensure availability of required tool during compilation process.

Add patch to rename binary used in Makefile from
"convert" to "convert.im7" as installed by imagemagick package.

Drop CVE-2022-28506.patch as it is fixed in this version.

Signed-off-by: Bhabu Bindu <bhabubindu@kpit.com>
---
 .../giflib/files/CVE-2022-28506.patch         | 40 ------------------
 ...x_to_convert_binary_used_in_Makefile.patch | 42 +++++++++++++++++++
 .../{giflib_5.2.1.bb => giflib_5.2.2.bb}      |  7 ++--
 3 files changed, 46 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb => giflib_5.2.2.bb} (72%)

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
deleted file mode 100644
index 221e10811..000000000
--- a/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 368f28c0034ecfb6dd4b3412af4cc589a56e0611 Mon Sep 17 00:00:00 2001
-From: Matej Muzila <mmuzila@redhat.com>
-Date: Mon, 30 May 2022 09:04:27 +0200
-Subject: [PATCH] Fix heap-buffer overflow (CVE-2022-28506)
-
-There is a heap buffer overflow in DumpScreen2RGB() in gif2rgb.c.  This
-occurs when a crafted gif file, where size of color table is < 256 but
-image data contains pixels with color code highier than size of color
-table. This causes oferflow of ColorMap->Colors array.
-
-Fix the issue by checking if value of each pixel is within bounds of
-given color table. If the value is out of color table, print error
-message and exit.
-
-Fixes: #159
-
-Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/5b74cdd9c1285514eaa4675347ba3eea81d32c65/]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
----
- gif2rgb.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gif2rgb.c b/gif2rgb.c
-index 8d7c0ff..d9a469f 100644
---- a/gif2rgb.c
-+++ b/gif2rgb.c
-@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
-             GifRow = ScreenBuffer[i];
-             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
-             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
-+                /* Check if color is within color palete */
-+                if (GifRow[j] >= ColorMap->ColorCount)
-+                {
-+                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
-+                }
-                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
-                 *BufferP++ = ColorMapEntry->Red;
-                 *BufferP++ = ColorMapEntry->Green;
--- 
-2.25.1
diff --git a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
new file mode 100644
index 000000000..a01b28ac6
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
@@ -0,0 +1,42 @@
+Subject: Modify binary name "convert" to "convert.im7"
+
+The change is needed to resolve the below compilation error
+after giflib version upgrade. Log data follows:
+| DEBUG: Executing shell function do_compile
+| NOTE: make -j 8
+| make -C doc
+| make[1]: Entering directory '../giflib/5.2.2/giflib-5.2.2/doc'
+| convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
+| make[1]: convert: No such file or directory
+| make[1]: *** [Makefile:46: giflib-logo.gif] Error 127
+| make[1]: Leaving directory '../giflib/5.2.2/giflib-5.2.2/doc'
+| make: *** [Makefile:93: all] Error 2
+| ERROR: oe_runmake failed
+
+Added dependency on ImageMagick which includes "convert" utility,
+to ensure availability of required tool during compilation process.
+
+This patch updates the binary name used in Makefile from
+"convert" to "convert.im7" for resizing the logo image used in HTML
+documentation as Imagemagick installs binary in this format.
+
+Below commits justify the cause of adding the suffix to binaries
+provided by ImageMagic package:
+https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=dcbb49f707e7ad9bf755dd3275ffc442154b8144
+https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=6e0c24e9b3f9d430dec57f61f8c12c74bca5375d
+
+Signed-off-by:   Bhabu Bindu <bhabubindu@kpit.com>
+Upstream-Status: Inappropriate [OE specific]
+
+===================================================================
+--- a/doc/Makefile
++++ b/doc/Makefile
+@@ -43,7 +43,7 @@
+ 
+ # Logo image file for HTML docs
+ giflib-logo.gif: ../pic/gifgrid.gif
+-	convert $^ -resize 50x50 $@
++	convert.im7 $^ -resize 50x50 $@
+ 
+ # Philosophical choice: the website gets the internal manual pages
+ allhtml: $(XMLALL:.xml=.html) giflib-logo.gif
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
similarity index 72%
rename from meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 011ca1ffb..7d8a175fe 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
 CVE_PRODUCT = "giflib_project:giflib"
 
-DEPENDS = "xmlto-native"
+DEPENDS = "xmlto-native imagemagick-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
-           file://CVE-2022-28506.patch"
+           file://add_suffix_to_convert_binary_used_in_Makefile.patch"
+
+SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"
 
-SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
 
 do_install() {
     # using autotools's default will end up in /usr/local
-- 
2.25.1


