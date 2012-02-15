Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rxea1-0004tA-1L
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 14:07:29 +0100
Received: by eaal10 with SMTP id l10so282398eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mIxtR9AgIWyuYVf0m6nPZnQHqPs8aBabVtu8iOcmObo=;
	b=pRxnrycvDyLuVT6HgYtzdgs5GPgnXFHjMGWfMKmXG2QUis6VF+mwBM9UUJAxkTzquf
	c2auogE/qh6CXrsfdau1Bmde/pfJn6BH688Uj8zcfkqfNHGy781CLwlofPtgLJDT/rof
	F0AaUo/30q8kotTZC+TgcbicevtGm7nJLAPmo=
Received: by 10.213.33.72 with SMTP id g8mr258341ebd.8.1329310757384;
	Wed, 15 Feb 2012 04:59:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm10996875eei.1.2012.02.15.04.59.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 04:59:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2012 13:59:08 +0100
Message-Id: <fe6268a256b83d07e711e08db66b2610fd2b4f8e.1329310622.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329310622.git.Martin.Jansa@gmail.com>
References: <cover.1329310622.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/2] webkit-efl: resolve build error with missing eina lib when linked by gold
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 13:07:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ore-add-EINA_LIBRARIES-to-shell-build-for.patch |   28 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    2 +
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
new file mode 100644
index 0000000..6958b9e
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
@@ -0,0 +1,28 @@
+From 079acc344dc12818d8b56bf80a42065d8429f7ef Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Feb 2012 09:56:53 +0100
+Subject: [PATCH] JavaScriptCore: add EINA_LIBRARIES to shell build for Efl
+
+* needed for libwtf_efl
+* otherwise fails with ../wtf/libwtf_efl.so.0.1.0: error: undefined reference to 'eina_module_free'
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/shell/PlatformEfl.cmake |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/Source/JavaScriptCore/shell/PlatformEfl.cmake b/Source/JavaScriptCore/shell/PlatformEfl.cmake
+index c35af2d..ef3f437 100644
+--- a/Source/JavaScriptCore/shell/PlatformEfl.cmake
++++ b/Source/JavaScriptCore/shell/PlatformEfl.cmake
+@@ -1,6 +1,7 @@
+ LIST(APPEND JSC_LIBRARIES
+     ${Glib_LIBRARIES}
+     ${ECORE_LIBRARIES}
++    ${EINA_LIBRARIES}
+     ${CMAKE_DL_LIBS}
+ )
+ 
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 77aef02..c0e346c 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -11,6 +11,7 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
 
 SRCREV = "105069"
 PV = "1.7.3+svnr${SRCPV}"
+PR = "r1"
 
 SRCREV_FORMAT = "source"
 
@@ -18,6 +19,7 @@ SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
+  file://0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch \
   file://CMakeLists.txt \
 "
 
-- 
1.7.8.4



