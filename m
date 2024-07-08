Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D8EC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 12:29:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.78510.1720441786557628463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 05:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PO2gxp8s;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4257a390a4eso27349825e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720441785; x=1721046585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8sn9L8J/TEKNmMKffAzLs44iAuZEBL5WgcxCyEOQU=;
        b=PO2gxp8sQR/mNaGmMLV4bvf2S97maeDoJq3zLpp2FCyvkxJpT5j6YHqEM3o1UlZuH0
         cl91hn7aj870iQ6lqJsj84JQncSK0y9mIoqWL+0jpbJu/1BIZLTSpqA2lgEU4NM0/ZJO
         e6mAlB71va0Vf5bksVddKQvruLx3j8Hi5ZP8Z+4cW0cFMQ9D5A9ykqUYEvaiw1pc6C3G
         7ZvC5MsON577L0Sv5xziQimJL8BuyPSh1ryniLxmexVfgOczs4L6y4hiDghWoHfVz9FF
         VZ7izaNDQlUbeuJRo4nJY6O03oADfKknCFc5lIctrnS2vt6bAXOrlxIFOQ2ebHlYfjvm
         bjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441785; x=1721046585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz8sn9L8J/TEKNmMKffAzLs44iAuZEBL5WgcxCyEOQU=;
        b=pfyR8M64o0UlfUPVv4aJ2Xsy8msp7kNzFNhSNw+u8Vkiek3kQriQmCoRlY2e0Q4SK+
         ZbEQAwIiCY+rtCgecBVP7Qa63bxj7kWdaEY9WKgC9+Pt8o9GXzuMu820/Yo7aO6PpSb8
         r0f+S5TDnXGVklg7kNb2lYEnVIvWG/vAoA7xmLHjouVdb+Q/QN1K6+KCZ2/m1eSKTU/D
         dFQ/Lx2CGdL86O1BGp/hAuslMmLpscMdLiqMEyjrdsHK2I2Qbb0m0XfyZVM3du0SIk7a
         e3frrcwshDGMk6qCO3aJG9TjUX8KZNFXYU2MVUH8J4o4f+YUYSNMkquxR2Z/YW8SC/op
         QMcw==
X-Gm-Message-State: AOJu0YzXGvoohbfSxLmz5juJPzxDuJACyg4UH6LwL2e9oVg9uUVybfSp
	dXDkbvEKUyIjysqLcIor0uJW+BOB4KqS8XQmOMS8rHX6pzfKGvRovFzamA==
X-Google-Smtp-Source: AGHT+IFG/UY01FBAoRP8wD+St/th1E8rmY/fg5Yta2kfARMAFm2KupCL9+PWmC0nEwsdrBgxWZxOiQ==
X-Received: by 2002:a05:600c:22d8:b0:426:61f6:2e38 with SMTP id 5b1f17b1804b1-42661f62e9bmr36674975e9.35.1720441784743;
        Mon, 08 Jul 2024 05:29:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca618sm163183095e9.29.2024.07.08.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:29:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nikhil R <nikhil.r@kpit.com>,
	Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] giflib: fix build with gold and avoid imagemagick-native dependency
Date: Mon,  8 Jul 2024 14:29:46 +0200
Message-ID: <20240708122946.4194073-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 12:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111266

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


