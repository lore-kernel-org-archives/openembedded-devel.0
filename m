Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RHb5j-0002YN-AA
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 14:54:23 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 198A1CD33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 14:48:28 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvRrAFa6ok5T4zkNPGdsb2JhbABDmiKOfhkBAQEBNzKBbgFRAQojMB9LCi0Jh3kGpHkBjRWDNoUKBJQJkV0
X-IronPort-AV: E=Sophos;i="4.69,391,1315173600"; d="scan'208";a="134950912"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	nazgul.atmel.com) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 22 Oct 2011 14:48:28 +0200
From: ulf_samuelsson@telia.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Oct 2011 14:48:26 +0200
Message-Id: <1319287706-3451-1-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Ulf Samuelsson <ulf_samuelsson@telia.com>
Subject: [PATCH] python-2.6.6:	Fix python-2.6.6 build failure on linux-3.x
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
X-List-Received-Date: Sat, 22 Oct 2011 12:54:23 -0000

From: Ulf Samuelsson <ulf_samuelsson@telia.com>

python-2.6.6 build will crash when host is running linux kernel 3.x.

Fix backported from openembedded-core.
meta/recipes-devtools/python/python/07-linux3-regen-fix.patch

Signed-Off-By:	Ulf Samuelsson <ulf.samuelsson@telia.com>
---
 .../python/python-2.6.6/07-linux3-regen-fix.patch  |   19 +++++++++++++++++++
 recipes/python/python_2.6.6.bb                     |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 recipes/python/python-2.6.6/07-linux3-regen-fix.patch

diff --git a/recipes/python/python-2.6.6/07-linux3-regen-fix.patch b/recipes/python/python-2.6.6/07-linux3-regen-fix.patch
new file mode 100644
index 0000000..ef360c5
--- /dev/null
+++ b/recipes/python/python-2.6.6/07-linux3-regen-fix.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Without this patch it calls cross-compiled python if host is running linux-3.0
+python$EXE ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
+| ./regen: line 3: /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.6.6-nk2.8/Python-2.6.6/python: cannot execute binary file
+
+diff -uNr Python-2.6.6.orig//Lib/plat-linux3/regen Python-2.6.6/Lib/plat-linux3/regen
+--- Python-2.6.6.orig//Lib/plat-linux3/regen 1970-01-01 01:00:00.000000000 +0100
++++ Python-2.6.6/Lib/plat-linux3/regen 2001-08-09 14:48:17.000000000 +0200
+@@ -0,0 +1,8 @@
++#! /bin/sh
++case `uname` in
++Linux*) ;;
++*) echo Probably not on a Linux system 1>&2
++ exit 1;;
++esac
++set -v
++h2py -i '(u_long)' /usr/include/sys/types.h /usr/include/netinet/in.h /usr/include/dlfcn.h
+
diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
index eacc5c2..5b47fec 100644
--- a/recipes/python/python_2.6.6.bb
+++ b/recipes/python/python_2.6.6.bb
@@ -3,7 +3,7 @@ DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
            ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 # set to .0 on every increase of INC_PR
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
@@ -14,6 +14,7 @@ SRC_URI = "\
   file://04-default-is-optimized.patch \
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
+  file://07-linux3-regen-fix.patch \
   file://ipv6-cross.patch \
   file://python-module-rpath-fix.patch \
   file://sitecustomize.py \
-- 
1.7.5.4



