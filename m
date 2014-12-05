Return-Path: <awais.belal@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC8372327
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:41:50 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so556839pde.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bOzo3+NvAzADGgZo/zRdrq+8Dys5NqGDhPe6er2G2oU=;
	b=VITmU4Tb7UCafH3dkuiqFYireBofYBCIbnAgTf5Q6TqgF2+2iu6fz7+HY4xNO3ePR/
	dTaWVCz2JTQ+HBGiPHmW5A4wIdxXHkAGBN2OEpCvoKHrhHMumBz2pOG0Q1Niq1g0Av0E
	9VePUORJmiIXDgpLvWQiAfHT2sUl/6GiNQoxKEbSybMqNNd8853GD6CM4nLTC2+2zmZK
	DiJaaouydWocidqye2kbt/pe6OiWXfl5uFXPz1fBt40N7X9SbkwpyFniJZg99AUSBPyW
	gPfKdXmU1J1j6+veQWFVCmwgqM4RYtqDTvwaXdS2k+hFAx+SkAft0zZL+50ilulIhMpP
	LwLA==
X-Received: by 10.68.132.225 with SMTP id ox1mr34507316pbb.85.1417779711593;
	Fri, 05 Dec 2014 03:41:51 -0800 (PST)
Received: from awais-Precision-M4700.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id e2sm19308425pdo.11.2014.12.05.03.41.49
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 03:41:51 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
X-Google-Original-From: Awais Belal <awais_belal@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Dec 2014 16:41:43 +0500
Message-Id: <1417779703-18453-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] enca: fix broken automake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Dec 2014 11:41:51 -0000

The added patch fixes the usage of AM_ICONV macro and
comes straight from the Buildroot source tree.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../enca/enca/libenca-003-iconv.patch              |   28 ++++++++++++++++++++
 meta-oe/recipes-support/enca/enca_1.9.bb           |    3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch

diff --git a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
new file mode 100644
index 0000000..dbf0fb8
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
@@ -0,0 +1,28 @@
+From 7e144495093187143a3d1589f74c2eac37e4d790 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sun, 4 May 2014 15:49:28 +0200
+Subject: [PATCH] libiconv.m4: Fix AM_ICONV macro usage
+
+This patch come straight from the Buildroot source tree.
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ m4/libiconv.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/libiconv.m4 b/m4/libiconv.m4
+index fc8c6f8..3a59549 100644
+--- a/m4/libiconv.m4
++++ b/m4/libiconv.m4
+@@ -17,7 +17,7 @@ AC_REQUIRE([AC_C_CONST])dnl
+ dnl
+ 
+ dnl Use standard iconv test
+-AM_ICONV
++m4_pattern_allow([AM_ICONV])
+ CONVERTOR_LIBS="$CONVERTOR_LIBS $LIBICONV"
+ 
+ dnl Compile iconvcap.c and run it to determine what encodings iconv actually
+-- 
+1.9.3
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index efea5a3..184b27e 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -11,7 +11,8 @@ SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}
     file://configure-hack.patch \
     file://dont-run-tests.patch \
     file://configure-remove-dumbness.patch \
-    file://makefile-remove-tools.patch "
+    file://makefile-remove-tools.patch \
+    file://libenca-003-iconv.patch "
 
 SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
 SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
-- 
1.7.9.5


