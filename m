Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1Oe9aY-0005SA-IT
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:34:42 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Wed, 28 Jul 2010 12:34:19 -0400
Message-ID: <4C505C08.8050603@tycoelectronics.com>
Date: Wed, 28 Jul 2010 12:34:16 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.142.1280333371.17151.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.142.1280333371.17151.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt4 recipe fix; fixes configure so compiler is, detected properly, and QXMLPatterns gets built
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
X-List-Received-Date: Wed, 28 Jul 2010 16:34:43 -0000
Content-Type: multipart/mixed; boundary="------------030609090508090306000301"

--------------030609090508090306000301
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

>
>
> this patch removes the patch you want to add. Is that correct? Could 
> you add
> the "More Info" to the top of the patch as well? Could you also 
> include the
> failure you are seeing?
>
I have fixed the patch (common error, had reversed the order of 
arguments to diff).
http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix/Qt4-recipe-compiler-fix.patch

Please see attachments.

Another user requested using git-diff.     My changes are in an overlay 
directory, so git-diff will not work.    How do I get a git-format diff 
from the normal diff program?


Also, you ask to "include the failure you are seeing", here it is (from 
log.do_configure.*):

./configure: line 6406: $(OE_QMAKE_CXX): command not found


The configure script needs to use the contents of the ${OE_QMAKE_CXX}  
variable, but is instead trying to use $(OE_QMAKE_CXX), because that is 
what QMAKE_CXX is set to in the .pro file, and in the resultant Makefile.

The above failure results in compiler features not being tested, and 
ultimately QtXmlPatterns doesn't get turned on (I don't know what other 
features might get disabled, but this is one that I needed).

Regards,
Jay




--------------030609090508090306000301
Content-Type: text/x-diff; name="Qt4-recipe-compiler-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="Qt4-recipe-compiler-fix.patch"

--- 2010-06-23/openembedded/recipes/qt4/qt-4.6.0.inc	2010-06-23 16:50:01.000000000 -0400
+++ local/recipes/qt4/qt-4.6.0.inc	2010-07-28 09:43:19.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
--- 2010-06-23/openembedded/recipes/qt4/qt-4.6.2.inc	2010-06-23 16:50:01.000000000 -0400
+++ local/recipes/qt4/qt-4.6.2.inc	2010-07-28 09:43:16.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
--- 2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc	2010-06-23 16:50:01.000000000 -0400
+++ local/recipes/qt4/qt4-embedded.inc	2010-07-28 09:43:31.000000000 -0400
@@ -12,6 +12,7 @@
 QT_LIBINFIX = "E"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
--- 2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc	2010-06-29 16:11:40.000000000 -0400
+++ local/recipes/qt4/qt4-x11-free.inc	2010-07-28 09:44:02.000000000 -0400
@@ -8,6 +8,7 @@
 INC_PR = "r18"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \

--------------030609090508090306000301
Content-Type: text/x-diff; name="configure-conf_compiler-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="configure-conf_compiler-fix.patch"

Index qt-everywhere-opensource-src-4.6.0.orig/configure
===================================================================
--- qt-everywhere-opensource-src-4.6.0/configure.orig	2009-12-10 15:49:49.000000000 -0500
+++ qt-everywhere-opensource-src-4.6.0/configure	2009-12-10 15:50:20.000000000 -0500
@@ -2917,6 +2917,7 @@
 fi
 
 QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
+eval QMAKE_CONF_COMPILER=$(echo $QMAKE_CONF_COMPILER | sed "s/(/{/" | sed "s/)/}/")
 TEST_COMPILER="$CC"
 [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
 

--------------030609090508090306000301--
