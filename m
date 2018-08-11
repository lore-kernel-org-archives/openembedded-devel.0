Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D58EA78E30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2018 14:59:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h9-v6so10666107wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2018 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XaU1PoOOrUW13DMf8357TOO/py/xIa222Nu4I80usDg=;
	b=fPFxN0gKC2DtqqwqlLwHwni3aBVruYtaH/kPL4GluG/qSr4lTdrKjF0qns6K9f9vWu
	vGslnlQli2wvRQUYKReMcmwvWHymSqNcJwbBN7yI3XpTGzIRSOMzmpkA2b0rT98ixxQx
	jJJRPtiil14uB6uqzqPs3BjpMGsAMnrDKYBv6bR7EsvcYEcheMIJ7GiH+T8qHnY7Dtvi
	wP2dTJiBx4uqqF/u9/iVsN1YZMDqFqvYDWERKVp9sI9Ucb1gFOMbkHmtBL2Ilt2lFBy2
	9rhGWizAEvxUXquX2TpK2N/llpsEns+acL3mApZqmeJJQvmCDXHcYbcxWXzoP/HtX7dg
	678g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XaU1PoOOrUW13DMf8357TOO/py/xIa222Nu4I80usDg=;
	b=CTgA7lKxJ2i4pq8gzRTacUVgupf6H5Q9akm/n5b8s1d3IYs8XkxsxWYlMBvx8yoz0T
	wXqd/i63NCxRTzsGFEKCo+dN3KwjhGbcCx2mz2V6Ft9Rvjc+7wLdHGrnDS4NJTg1b/Rf
	Zcn6/WwhJgib/nQ5mrPzKKy4ZiS7y4kXpP5rIQSrtXCX9iZG/LRab7Tb+JfjepaAhABq
	q8SxWOAKeE8Zpn1Sr27MT++fYaVIMKc3PNYMDwikXfjM8FkkjSGH0QborD+vjR9xYGlB
	bic6XPpYS3Idwu9wqICF43uE/0mloiNPoXdV32+M6Jj3Aggfu7Ukps1Cq1rN85G4rzDC
	ke1A==
X-Gm-Message-State: AOUpUlFTvlkCxUFuxbmIM96jvEjODvWz+5fK3W8KF1Ma/1Yc1owSI1nA
	c60ulDxsNFPhDH8SQkHMQBG40wKA
X-Google-Smtp-Source: AA+uWPwwlo4yrNlCf1VPwXONUA0j+Ps3ksi6EU0H+LwSLofN53sdWAScXlLAA4zMkMU5qsZyOzdMIA==
X-Received: by 2002:adf:a789:: with SMTP id
	j9-v6mr6485209wrc.277.1533999561584; 
	Sat, 11 Aug 2018 07:59:21 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w8-v6sm10914892wrp.72.2018.08.11.07.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 Aug 2018 07:59:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Aug 2018 14:58:27 +0000
Message-Id: <20180811145827.11578-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] android-tools: fix build with glibc-2.28
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Aug 2018 14:59:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...sb_linux.c-fix-build-with-glibc-2.28.patch | 24 +++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
new file mode 100644
index 0000000000..15401d1524
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
@@ -0,0 +1,24 @@
+From cb80906bd3869bba370a088e4634ae4a8093fdd8 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 11 Aug 2018 13:23:37 +0000
+Subject: [PATCH] usb_linux.c: fix build with glibc-2.28
+
+* include sysmacros for major, minor
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ adb/usb_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/adb/usb_linux.c b/adb/usb_linux.c
+index f16bdd036..c8a773244 100644
+--- a/adb/usb_linux.c
++++ b/adb/usb_linux.c
+@@ -22,6 +22,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
++#include <sys/sysmacros.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <errno.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 780ecaa11a..a85e8b6652 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -47,6 +47,7 @@ SRC_URI = " \
     file://ext4_utils.mk;subdir=${BPN} \
     file://fastboot.mk;subdir=${BPN} \
     file://mkbootimg.mk;subdir=${BPN} \
+    file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


