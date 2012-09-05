Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9H7M-0000sm-GE
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:02:12 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 98D514ED72;
	Wed,  5 Sep 2012 12:19:56 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 15:50:56 +0100
Message-Id: <1346856658-18087-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCHv3 1/3] libplist: add upstream patch to fix parallel make issue
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
X-List-Received-Date: Wed, 05 Sep 2012 15:02:12 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../libimobiledevice/files/fix-parallel-make.patch  | 21 +++++++++++++++++++++
 .../libimobiledevice/libplist_1.8.bb                |  5 ++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch

diff --git a/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
new file mode 100644
index 0000000..f6ef6f4
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
@@ -0,0 +1,21 @@
+From 335b25febd4c864ad0ac08479f5cd43fc21b7d73 Mon Sep 17 00:00:00 2001
+From: Nikias Bassen
+Date: Mon, 09 Jul 2012 21:17:15 +0000
+Subject: Fix building with parallel build makeopts
+
+---
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0bad840..155994e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -57,6 +57,8 @@ ADD_SUBDIRECTORY( plutil )
+ ADD_SUBDIRECTORY( include )
+ ADD_SUBDIRECTORY( test )
+ 
++ADD_DEPENDENCIES( plist libcnary )
++
+ IF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
+ 	ADD_SUBDIRECTORY( swig )
+ ENDIF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
+--
+cgit v0.9.0.2
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 9c218fb..2da8058 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -8,7 +8,10 @@ DEPENDS = "libxml2 glib-2.0 swig python"
 
 inherit cmake pkgconfig
 
-SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2"
+SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
+           file://fix-parallel-make.patch \
+"
+
 SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
 SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
 
-- 
1.7.12



