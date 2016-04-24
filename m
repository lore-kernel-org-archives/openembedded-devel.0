Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC2270018
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 14:18:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so17997316wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cmBVRO/kAE1hhApoURc+zqt2+XbZdsQa5vS0g6QjUfI=;
	b=BKx3PJrHN2vDA8ugMcSGk0/exGS7ny7sPX5f5dkM1/DN3b/qzOPm8oi4zqvNR155Wo
	Oq5O4S1jOUUk//lMjMRwZPmonevlA4jL3umoVgehfwSEF63Zf0Rh8tvpi0Cd8rI9sEGg
	wWZBuXE2CDfi6kWmP96wuanQvk89d8JebyYBrWYOS240NIv3FEazNTJr/KWOBuiyMRvm
	D6L9W+uZnj61WtsGv5eL1Jl4GfhPoAidIw/2P7BcKdHs1gkzFg0Iu7HC1dTk0NJc+Tfi
	uW0EAROM8u2iQTV5WjF2uqI08PvQQX+M9U86n7XrlL+1WmOF+L5983rtp2uhH3CGsvqy
	xMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cmBVRO/kAE1hhApoURc+zqt2+XbZdsQa5vS0g6QjUfI=;
	b=ZIrbGWDyYX8bYxU7ymb+4weG3afhUHX20KSE2N019zZ23fl1bywl4gvwc6uXk5hGwk
	4K5lb1EiGOb0YFB36Mgi1ivdUk+J2uoyZEQxiTcsKkBWMfDy/fI91nJObrAkYIWUUG1R
	TzCfavfJbLnj3FUszqFc/c1RHaHZ7Gk5BNXXYuqm7XiAxrKFEKDFiq3x3e4kJXpyao7C
	ztPhTMdOyvQ6hHfUBvTl2WhPeWnhHumooHyTMKrZLmZNJOU4AhyvlxyPoajiTRZYdewm
	itbet/BieU/Jetumv/ANKdwJg5/9aIJehFimysnhd7s7cocAxDIjnkJjF8ywzPgrV2B5
	wPGw==
X-Gm-Message-State: AOPr4FV9gVx8FHQ6xEg0dQR4LhBZQ2w3fQVQw91sTBranMSph0EnwDhBfeurnPfrklMYOA==
X-Received: by 10.28.46.67 with SMTP id u64mr7268971wmu.95.1461507508078;
	Sun, 24 Apr 2016 07:18:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A19FB.dip0.t-ipconnect.de.
	[91.10.25.251]) by smtp.googlemail.com with ESMTPSA id
	gt7sm18710562wjc.1.2016.04.24.07.18.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Apr 2016 07:18:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2016 16:18:14 +0200
Message-Id: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/3] poppler: update to 0.4.1
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
X-List-Received-Date: Sun, 24 Apr 2016 14:18:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* remove leftover patches
* run tested against evince and qpdfview

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fix-qt4e-library-dependencies.patch            | 28 ----------------------
 .../{poppler_0.37.0.bb => poppler_0.41.0.bb}       |  4 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.37.0.bb => poppler_0.41.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch b/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
deleted file mode 100644
index f67e1f5..0000000
--- a/meta-oe/recipes-support/poppler/poppler-0.35.0/fix-qt4e-library-dependencies.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Configuration changes needed to allow building with QT4-embedded
-
-Index: poppler-0.35.0/configure.ac
-===================================================================
---- poppler-0.35.0.orig/configure.ac
-+++ poppler-0.35.0/configure.ac
-@@ -654,17 +654,17 @@ AC_ARG_ENABLE(poppler-qt4,
-               enable_poppler_qt4="try")
- if test x$enable_poppler_qt4 = xyes; then
-   PKG_CHECK_MODULES(POPPLER_QT4, 
--	            QtCore >= 4.7.0 QtGui >= 4.7.0 QtXml >= 4.7.0)
-+	            QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0)
-   PKG_CHECK_MODULES(POPPLER_QT4_TEST, 
--	            QtTest >= 4.7.0)
-+	            QtTestE >= 4.7.0)
- elif test x$enable_poppler_qt4 = xtry; then
-   PKG_CHECK_MODULES(POPPLER_QT4,
--                    QtCore >= 4.7.0 QtGui >= 4.7.0 QtXml >= 4.7.0,
-+                    QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0,
-                     [enable_poppler_qt4="yes"],
-                     [enable_poppler_qt4="no"])
-   if test x$enable_poppler_qt4 = xyes; then
-     PKG_CHECK_MODULES(POPPLER_QT4_TEST,
--                    QtTest >= 4.7.0,
-+                    QtTestE >= 4.7.0,
-                     [enable_poppler_qt4="yes"],
-                     [enable_poppler_qt4="no"])
-   fi
diff --git a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb b/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.37.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.41.0.bb
index 2c6b1a9..4320408 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
 "
-SRC_URI[md5sum] = "c635e1742202cbbd9182cb0255d95652"
-SRC_URI[sha256sum] = "b89f9c5eae3bbb1046b0f767714afd75eca102a0406a3a30856778d42a685bee"
+SRC_URI[md5sum] = "849a8bd6af5794efb961b70418414e5a"
+SRC_URI[sha256sum] = "420abaab63caed9e1ee28964a0ba216d1979506726164bc99ad5ade289192a1b"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.5.5


