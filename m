Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MuSlm-0007Mh-4C
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2009 17:13:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 166C51416BA9;
	Sun,  4 Oct 2009 17:07:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8fnCd9pOWr0; Sun,  4 Oct 2009 17:07:19 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 0051C1416BA8;
	Sun,  4 Oct 2009 17:07:17 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
Date: Sun, 04 Oct 2009 17:12:15 +0200
Message-Id: <1254669135.4755.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] python: fix -dbg QA error
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
X-List-Received-Date: Sun, 04 Oct 2009 15:13:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Attached patch should fix the -dbg QA error in Angstrom with
python-2.6.1 (the default). If the -dbg package is listed first in the
list, then it wins all files listed without need of complicated
expressions excluding config/.debug.

ERROR: QA Issue with python-distutils: non debug package contains .debug directory: python-distutils path /work/armv5te-angstrom-linux-gnueabi/python-2.6.1-ml7.0/install/python-distutils/usr/lib/python2.6/config/.debug/libpython2.6.a
ERROR: QA run found fatal errors. Please consider fixing them.

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
index 8d9272e..fe0e385 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -12,7 +12,7 @@ import time
 VERSION = "2.6.2"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20090812"
+__version__ = "20091004"
 
 class MakefileMaker:
 
@@ -70,16 +70,17 @@ class MakefileMaker:
         provideLine += '"'
 
         self.out( provideLine )
-        self.out( "" )       
+        self.out( "" )
 
         #
         # generate package line
         #
 
-        packageLine = 'PACKAGES="'
+        packageLine = 'PACKAGES="python-core-dbg '
         for name in self.packages:
-            packageLine += "%s " % name
-        packageLine += ' python-modules"'
+            if name != 'python-core-dbg':
+                packageLine += "%s " % name
+        packageLine += 'python-modules"'
 
         self.out( packageLine )
         self.out( "" )
@@ -161,7 +162,7 @@ if __name__ == "__main__":
     "lib-dynload/xreadlines.so types.* ${bindir}/python*" )
 
     m.addPackage( "python-core-dbg", "Python core module debug information", "python-core",
-    "lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
+    "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
 
     m.addPackage( "python-devel", "Python Development Package", "python-core",
     "${includedir} ${libdir}/libpython2.6.so config" ) # package
diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 00eda6b..cee12c8 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -1,13 +1,13 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../contrib/python/generate-manifest-2.6.py' Version 20090812 (C) 2002-2009 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../../contrib/python/generate-manifest-2.6.py' Version 20091004 (C) 2002-2009 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
 PROVIDES+="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-core-dbg python-resource python-json python-devel python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio "
 
-PACKAGES="python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-core-dbg python-resource python-json python-devel python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  python-modules"
+PACKAGES="python-core-dbg python-profile python-threading python-distutils python-doctest python-stringold python-codecs python-ctypes python-pickle python-datetime python-core python-io python-compiler python-compression python-re python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-devel python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-curses python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio python-modules"
 
 DESCRIPTION_python-profile="Python Basic Profiling Support"
 RDEPENDS_python-profile="python-core python-textutils"
@@ -87,7 +87,7 @@ FILES_python-tests="${libdir}/python2.6/test "
 
 DESCRIPTION_python-core-dbg="Python core module debug information"
 RDEPENDS_python-core-dbg="python-core"
-FILES_python-core-dbg="${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
+FILES_python-core-dbg="${libdir}/python2.6/config/.debug ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
 
 DESCRIPTION_python-resource="Python Resource Control Interface"
 RDEPENDS_python-resource="python-core"
diff --git a/recipes/python/python.inc b/recipes/python/python.inc
index 5791297..7e61f79 100644
--- a/recipes/python/python.inc
+++ b/recipes/python/python.inc
@@ -4,7 +4,7 @@ LICENSE = "PSF"
 SECTION = "devel/python"
 PRIORITY = "optional"
 # bump this on every change in contrib/python/generate-manifest-2.6.py
-INC_PR = "ml7"
+INC_PR = "ml8"
 
 DEFAULT_PREFERENCE = "-26"
 


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



