Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Dec 2019 13:47:58 UTC
Received: from jax4mhfb01.myregisteredsite.com
	(jax4mhfb01.myregisteredsite.com [64.69.218.94])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB877F977
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:47:58 +0000 (UTC)
Received: from jax4mhob07.myregisteredsite.com
	(jax4mhob07.myregisteredsite.com [64.69.218.87])
	by jax4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	xB6DgvcH008122 for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Dec 2019 08:42:58 -0500
Received: from mailpod.hostingplatform.com
	(atl4qobmail02pod0.registeredsite.com [10.30.71.204])
	by jax4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	xB6DgsRf029306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Dec 2019 08:42:54 -0500
Received: (qmail 11128 invoked by uid 0); 6 Dec 2019 13:42:54 -0000
X-TCPREMOTEIP: 81.173.50.109
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@81.173.50.109)
	by 0 with ESMTPA; 6 Dec 2019 13:42:54 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 14:42:50 +0100
Message-Id: <20191206134250.18364-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][meta-qt4][PATCH] qt4: Apply build fix for GCC8 to both x11 and embedded variants
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
X-List-Received-Date: Fri, 06 Dec 2019 13:47:59 -0000

The fix to remove "volatile" also applies to the x11 version of Qt, so apply the
patch for both variants by moving it to the common qt4-${PV} include file. This fixes
that the 32-bit version of qt4-x11 fails to build with the same error as qt4-embedded.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 recipes-qt4/qt4/qt4-4.8.7.inc    | 1 +
 recipes-qt4/qt4/qt4-embedded.inc | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
index eea6061..fae7df8 100644
--- a/recipes-qt4/qt4/qt4-4.8.7.inc
+++ b/recipes-qt4/qt4/qt4-4.8.7.inc
@@ -28,6 +28,7 @@ SRC_URI = "http://download.qt-project.org/archive/qt/4.8/${PV}/qt-everywhere-ope
            file://0035-Add-nios2-support.patch \
            file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
 	   file://0037-fix-configure-with-icu60.patch \
+           file://0038-3rdparty-javascriptcore-JITStubs.cpp-allow-builds-of.patch \
            file://gcc-version.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
diff --git a/recipes-qt4/qt4/qt4-embedded.inc b/recipes-qt4/qt4/qt4-embedded.inc
index 5298d65..9c2d9da 100644
--- a/recipes-qt4/qt4/qt4-embedded.inc
+++ b/recipes-qt4/qt4/qt4-embedded.inc
@@ -12,7 +12,6 @@ QT_BASE_LIB  ?= "libqt-embedded"
 # Set necessary variables in the profile
 SRC_URI += "file://qte.sh \
             file://0033-configure-support-c-0x-standard-for-directfd.patch \
-            file://0038-3rdparty-javascriptcore-JITStubs.cpp-allow-builds-of.patch \
 "
 
 QT_EMBEDDED_FLAGS ?= " \
-- 
2.17.1


