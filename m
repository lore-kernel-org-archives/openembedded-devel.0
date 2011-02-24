Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsQZ4-0005sb-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 03:04:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 49CC2314DC81
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:03:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 375Zl33jzXoF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:02:55 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id C3D2D314CA15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:02:54 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 24 Feb 2011 02:02:54 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 02:02:54 +0000
Message-Id: <1298512974-1229-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] python-2.6: python-xml depends on python-elementtree
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
X-List-Received-Date: Thu, 24 Feb 2011 02:04:45 -0000

* Fixes the following error:

  import xml.etree.cElementTree
  File "/usr/lib/python2.6/xml/etree/cElementTree.py", line 3, in <module>
  from _elementtree import *
  ImportError: No module named _elementtree

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 contrib/python/generate-manifest-2.6.py |    4 ++--
 recipes/python/python-2.6-manifest.inc  |    4 ++--
 recipes/python/python_2.6.6.bb          |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
index 28a7226..1b11266 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -12,7 +12,7 @@ import time
 VERSION = "2.6.6"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20110214"
+__version__ = "20110222"
 
 class MakefileMaker:
 
@@ -347,7 +347,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
     "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
 
-    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-core ${PN}-elementtree ${PN}-re",
     "lib-dynload/pyexpat.so xml xmllib.*" ) # package
 
     m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 89c9be4..febaaa2 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../contrib/python/generate-manifest-2.6.py' Version 20110214 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: 'contrib/python/generate-manifest-2.6.py' Version 20110222 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -254,7 +254,7 @@ RDEPENDS_${PN}-unixadmin="${PN}-core"
 FILES_${PN}-unixadmin="${libdir}/python2.6/lib-dynload/nis.so ${libdir}/python2.6/lib-dynload/grp.so ${libdir}/python2.6/lib-dynload/pwd.so ${libdir}/python2.6/getpass.* "
 
 DESCRIPTION_${PN}-xml="Python basic XML support."
-RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
+RDEPENDS_${PN}-xml="${PN}-core ${PN}-elementtree ${PN}-re"
 FILES_${PN}-xml="${libdir}/python2.6/lib-dynload/pyexpat.so ${libdir}/python2.6/xml ${libdir}/python2.6/xmllib.* "
 
 DESCRIPTION_${PN}-xmlrpc="Python XMLRPC Support"
diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
index c8d1c56..3c054bb 100644
--- a/recipes/python/python_2.6.6.bb
+++ b/recipes/python/python_2.6.6.bb
@@ -3,7 +3,7 @@ DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
            ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 # set to .0 on every increase of INC_PR
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-- 
1.7.2.3



