Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OeCkb-0001cT-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 21:57:16 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Wed, 28 Jul 2010 15:56:54 -0400
Message-ID: <4C508B82.5060005@tycoelectronics.com>
Date: Wed, 28 Jul 2010 15:56:50 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.147.1280337399.17151.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.147.1280337399.17151.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt4 recipe fix; fixes configure so compiler is, detected, properly, and QXMLPatterns gets built
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
X-List-Received-Date: Wed, 28 Jul 2010 19:57:19 -0000
Content-Type: multipart/mixed; boundary="------------020800040303070505070404"

--------------020800040303070505070404
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Patch produced with 'diff -Naur', as per Henning Heinold's request:


--------------020800040303070505070404
Content-Type: text/x-diff; name="Qt4-recipe-compiler-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="Qt4-recipe-compiler-fix.patch"

diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/files/configure-conf_compiler-fix.patch /home/oe/local/recipes/qt4/files/configure-conf_compiler-fix.patch
--- /home/oe/2010-06-23/openembedded/recipes/qt4/files/configure-conf_compiler-fix.patch	1969-12-31 19:00:00.000000000 -0500
+++ /home/oe/local/recipes/qt4/files/configure-conf_compiler-fix.patch	2010-07-28 09:42:06.000000000 -0400
@@ -0,0 +1,12 @@
+Index qt-everywhere-opensource-src-4.6.0.orig/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.6.0/configure.orig	2009-12-10 15:49:49.000000000 -0500
++++ qt-everywhere-opensource-src-4.6.0/configure	2009-12-10 15:50:20.000000000 -0500
+@@ -2917,6 +2917,7 @@
+ fi
+ 
+ QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
++eval QMAKE_CONF_COMPILER=$(echo $QMAKE_CONF_COMPILER | sed "s/(/{/" | sed "s/)/}/")
+ TEST_COMPILER="$CC"
+ [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
+ 
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.0.inc /home/oe/local/recipes/qt4/qt-4.6.0.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.0.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt-4.6.0.inc	2010-07-28 09:43:19.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.2.inc /home/oe/local/recipes/qt4/qt-4.6.2.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.2.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt-4.6.2.inc	2010-07-28 09:43:16.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc /home/oe/local/recipes/qt4/qt4-embedded.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt4-embedded.inc	2010-07-28 09:43:31.000000000 -0400
@@ -12,6 +12,7 @@
 QT_LIBINFIX = "E"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc /home/oe/local/recipes/qt4/qt4-x11-free.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc	2010-06-29 16:11:40.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt4-x11-free.inc	2010-07-28 09:44:02.000000000 -0400
@@ -8,6 +8,7 @@
 INC_PR = "r18"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \

--------------020800040303070505070404--
