Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99D0C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 12:26:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.78456.1720441589219849512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 05:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3jLaN9l;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367b6e5ffbfso1142273f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720441588; x=1721046388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8sn9L8J/TEKNmMKffAzLs44iAuZEBL5WgcxCyEOQU=;
        b=l3jLaN9l6wO8Nngqo8r/c0dcITSUVowiF81CSPKIpU9hmUt7qhTIhboyHEO76TC//1
         g7uR96ZvWjn5TeEpC7dWMzAZjlJJDoOGTKZ4GVo+xvyLTnwgPASzfJRZ5iMQmISS8SwN
         7q/TGyyyCwvHlFVo9JI/dayvqDGQN1GvINnATc8vSFeSXBRb0AxW4sCFpPPlPaEloXBp
         ChsqMQzKIu4p7ogfXAFUe6Vh4nkGvrHCR4ZJlf4B1Ql7Z7xlIwafoWtAk+Xoq1LXn1Ym
         JuzBoKV7wTOQR+F1deSfB+OWPFDw9Qlwn6RwQXxSPSE4KpaQgfv3h0AYKo4u6gEbnDRO
         g5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441588; x=1721046388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz8sn9L8J/TEKNmMKffAzLs44iAuZEBL5WgcxCyEOQU=;
        b=Pds5+B3JbImZjlkRR9vS2vlhyP+qjGTmlPcbQV4NRohp7KB9PkVVLJIdKGAP0ZPo84
         YYb2gZlOJ7L9HUfgbsrX1m3cvI8n40Vdn0/tVufhUJHnr7OaVCMlK2UkRtumQgL7LUYd
         ywUiHEE2NGAr745HL0ic3VNp2+h+zh4s8eBaLmvy9WafGDvwQlcJE4NLSouE1oLbHv0d
         WRDVPbsOY0W3KlCv80PSC44S8NiyVEt90sktmgt6DCF95v5yY8XGgzvXSGZi8xyH6his
         snAFI2cpIL8wgm7sVf9EtrjajUY4nOs+NCwJXHm3Q/9ZvVll9et8ccxOdeoiC4n7vyLE
         Drsw==
X-Gm-Message-State: AOJu0YwYGGG4tHAWEt91ePRcthxkz7xBG9N2JfMHPJn93t3CrPk59O3L
	kVSFDMK/y3gL1OuR/j0ZrWeizM4K3NdoUs/nmyop1IEXRs5efDwXK+8tDQ==
X-Google-Smtp-Source: AGHT+IHuize5xgDcrGLRDajbivRAB280wO/rlHZQJ0GUIMf7A9AxATtr3QSyiCdBzJ03nMKc87N4MA==
X-Received: by 2002:a5d:5045:0:b0:367:437f:177f with SMTP id ffacd0b85a97d-3679dd66ce7mr7607622f8f.55.1720441586752;
        Mon, 08 Jul 2024 05:26:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d62sm27661778f8f.105.2024.07.08.05.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:26:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] giflib: fix build with gold and avoid imagemagick-native dependency
Date: Mon,  8 Jul 2024 14:10:52 +0200
Message-ID: <20240708121052.3509495-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 12:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111265

* avoid imagemagick-native like upstream did in:
  https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...x_to_convert_binary_used_in_Makefile.patch | 42 -------------------
 ...Makefile-fix-typo-in-soname-argument.patch | 34 +++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  8 ++--
 3 files changed, 39 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch

diff --git a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
deleted file mode 100644
index a01b28ac6d..0000000000
--- a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Subject: Modify binary name "convert" to "convert.im7"
-
-The change is needed to resolve the below compilation error
-after giflib version upgrade. Log data follows:
-| DEBUG: Executing shell function do_compile
-| NOTE: make -j 8
-| make -C doc
-| make[1]: Entering directory '../giflib/5.2.2/giflib-5.2.2/doc'
-| convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
-| make[1]: convert: No such file or directory
-| make[1]: *** [Makefile:46: giflib-logo.gif] Error 127
-| make[1]: Leaving directory '../giflib/5.2.2/giflib-5.2.2/doc'
-| make: *** [Makefile:93: all] Error 2
-| ERROR: oe_runmake failed
-
-Added dependency on ImageMagick which includes "convert" utility,
-to ensure availability of required tool during compilation process.
-
-This patch updates the binary name used in Makefile from
-"convert" to "convert.im7" for resizing the logo image used in HTML
-documentation as Imagemagick installs binary in this format.
-
-Below commits justify the cause of adding the suffix to binaries
-provided by ImageMagic package:
-https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=dcbb49f707e7ad9bf755dd3275ffc442154b8144
-https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=6e0c24e9b3f9d430dec57f61f8c12c74bca5375d
-
-Signed-off-by:   Bhabu Bindu <bhabubindu@kpit.com>
-Upstream-Status: Inappropriate [OE specific]
-
-===================================================================
---- a/doc/Makefile
-+++ b/doc/Makefile
-@@ -43,7 +43,7 @@
- 
- # Logo image file for HTML docs
- giflib-logo.gif: ../pic/gifgrid.gif
--	convert $^ -resize 50x50 $@
-+	convert.im7 $^ -resize 50x50 $@
- 
- # Philosophical choice: the website gets the internal manual pages
- allhtml: $(XMLALL:.xml=.html) giflib-logo.gif
diff --git a/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch b/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
new file mode 100644
index 0000000000..dc87ed60b9
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
@@ -0,0 +1,34 @@
+From 7f0cd4b6b56183b0afbefd01425e5ebd2b8733b4 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 8 Jul 2024 13:18:11 +0200
+Subject: [PATCH] Makefile: fix typo in soname argument
+
+* introduced in:
+  https://sourceforge.net/p/giflib/code/ci/b65c7ac2905c0842e7977a7b51d83af4486ca7b8/
+  there is no LIBUTILMAJOR variable only LIBUTILSOMAJOR leading to:
+
+  ld: fatal error: -soname: must take a non-empty argument
+  collect2: error: ld returned 1 exit status
+
+  with some linkers like GOLD
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://sourceforge.net/p/giflib/code/merge-requests/17/]
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 87966a9..41b149e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -109,7 +109,7 @@ $(LIBUTILSO): $(UOBJECTS) $(UHEADERS)
+ ifeq ($(UNAME), Darwin)
+ 	$(CC) $(CFLAGS) -dynamiclib -current_version $(LIBVER) $(OBJECTS) -o $(LIBUTILSO)
+ else
+-	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,$(LIBUTILMAJOR) -o $(LIBUTILSO) $(UOBJECTS)
++	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,$(LIBUTILSOMAJOR) -o $(LIBUTILSO) $(UOBJECTS)
+ endif
+ 
+ libutil.a: $(UOBJECTS) $(UHEADERS)
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 7d8a175fe3..aa47f93095 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -5,14 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
 CVE_PRODUCT = "giflib_project:giflib"
 
-DEPENDS = "xmlto-native imagemagick-native"
+DEPENDS = "xmlto-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
-           file://add_suffix_to_convert_binary_used_in_Makefile.patch"
+           https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
+           file://0001-Makefile-fix-typo-in-soname-argument.patch \
+"
 
+SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
 SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"
 
-
 do_install() {
     # using autotools's default will end up in /usr/local
     oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
-- 
2.45.2


