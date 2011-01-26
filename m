Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA49-00069H-Dq
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:26:01 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so1578416bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=f8QY41P5Ap+Vm6UBaeU8SumapMmuXEVrFBaPY/aJuVo=;
	b=BhUrLh7D0WViVgTrkE8uo41Vcl/X67LhGIizvD1c6GKM+Szkg10zEoGLYGPnwsXAhb
	QhLsge0Muw8JJf5aBVzBdqBuF7wn9UXUql9EJ543xfr8Hiq9kQMyhkLRP8KqJRYowA+J
	cAN4fj5AfWNyfRO4UpQ8a4p2seDIE/8v9GpcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sx3v/b7W8LxzA0hH5dgTyHyYftKfffxcWz+Tra4f2/irYDJS6Qbm7FmdOTZ4v3MOzF
	JX4QShfK6dkMjW/yRlSmARegIoarBzVuOj5soQXBOe+3eo/pn9GKX+RK5azdHJd6LisJ
	Li+0xR46/M9Mly+isqIs9B9uaCzxAwJNuVw5Y=
Received: by 10.204.123.7 with SMTP id n7mr762254bkr.33.1296065619579;
	Wed, 26 Jan 2011 10:13:39 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id j11sm7647452bka.12.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002Vy-Nh; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:24 +0100
Message-Id: <1296065612-9637-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 1/9] fakeroot: add 1.14.5, mv 1.12.4 to obsolete
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
X-List-Received-Date: Wed, 26 Jan 2011 18:26:01 -0000

The other old recipes should be removed.
- oplinux suggests 1.7.1 which is not available anymore
- chinook-compat, maemo5-compat pin 1.9.6

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch  |   15 +++++++++++
 .../fakeroot-1.14.5/quiet-getopt-check.patch       |   12 +++++++++
 recipes/fakeroot/fakeroot-native_1.12.4.bb         |   21 ----------------
 recipes/fakeroot/fakeroot.inc                      |   16 ++++++++++++
 recipes/fakeroot/fakeroot_1.12.4.bb                |   26 --------------------
 recipes/fakeroot/fakeroot_1.14.5.bb                |   10 +++++++
 .../obsolete/fakeroot/fakeroot-native_1.12.4.bb    |   21 ++++++++++++++++
 recipes/obsolete/fakeroot/fakeroot_1.12.4.bb       |   26 ++++++++++++++++++++
 8 files changed, 100 insertions(+), 47 deletions(-)
 create mode 100644 recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
 create mode 100644 recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
 delete mode 100644 recipes/fakeroot/fakeroot-native_1.12.4.bb
 create mode 100644 recipes/fakeroot/fakeroot.inc
 delete mode 100644 recipes/fakeroot/fakeroot_1.12.4.bb
 create mode 100644 recipes/fakeroot/fakeroot_1.14.5.bb
 create mode 100644 recipes/obsolete/fakeroot/fakeroot-native_1.12.4.bb
 create mode 100644 recipes/obsolete/fakeroot/fakeroot_1.12.4.bb

diff --git a/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch b/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
new file mode 100644
index 0000000..72e7528
--- /dev/null
+++ b/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
@@ -0,0 +1,15 @@
+This is not needed, kept just for reference.
+
+--- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
++++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:10:02.897300394 +0100
+@@ -30,8 +30,8 @@ fatal ()
+ }
+ 
+ # strip /bin/fakeroot to find install prefix
+-FAKEROOT_PREFIX=@prefix@
+-FAKEROOT_BINDIR=@bindir@
++FAKEROOT_BINDIR=`dirname $0`
++FAKEROOT_PREFIX=`dirname ${FAKEROOT_BINDIR}`
+ 
+ USEABSLIBPATH=@LDPRELOADABS@
+ LIB=lib@fakeroot_transformed@@DLSUFFIX@
diff --git a/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch b/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
new file mode 100644
index 0000000..bcb9083
--- /dev/null
+++ b/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
@@ -0,0 +1,12 @@
+busybox provided getopt prints the help-text on stderr.
+--- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
++++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:11:50.059891996 +0100
+@@ -43,7 +43,7 @@ export FAKED_MODE
+ 
+ libfound=no
+ 
+-GETOPTEST=`getopt --version`
++GETOPTEST=`getopt --version 2> /dev/null`
+ case $GETOPTEST in
+ getopt*) # GNU getopt
+     FAKE_TEMP=`getopt -l lib: -l faked: -l unknown-is-real -l fd-base: -l version -l help -- +l:f:i:s:ub:vh "$@"`
diff --git a/recipes/fakeroot/fakeroot-native_1.12.4.bb b/recipes/fakeroot/fakeroot-native_1.12.4.bb
deleted file mode 100644
index e6add2b..0000000
--- a/recipes/fakeroot/fakeroot-native_1.12.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require fakeroot_${PV}.bb
-
-SRC_URI += "file://fix-prefix.patch"
-S = "${WORKDIR}/fakeroot-${PV}"
-
-inherit native
-
-EXTRA_OECONF = "--program-prefix="
-
-# Compatability for the rare systems not using or having SYSV
-python () {
-    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
-        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
-}
-
-NATIVE_INSTALL_WORKS = "1"
-
-RDEPENDS_${PN} = "util-linux-native"
-
-SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
-SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/recipes/fakeroot/fakeroot.inc b/recipes/fakeroot/fakeroot.inc
new file mode 100644
index 0000000..af71e24
--- /dev/null
+++ b/recipes/fakeroot/fakeroot.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Gives a fake root environment"
+HOMEPAGE = "http://fakeroot.alioth.debian.org"
+SECTION = "base"
+LICENSE = "GPL"
+INC_PR = "r0"
+inherit autotools
+BBCLASSEXTEND = "native"
+
+SRC_URI = "\
+  file://configure-libtool.patch \
+"
+# previous versions did the following for -native, but why? Not needed..
+#SRC_URI_append_virtclass-native = "file://fix-prefix.patch"
+
+# fakeroot needs getopt which is provided by the util-linux package
+RDEPENDS_${PN} = "util-linux"
diff --git a/recipes/fakeroot/fakeroot_1.12.4.bb b/recipes/fakeroot/fakeroot_1.12.4.bb
deleted file mode 100644
index c265749..0000000
--- a/recipes/fakeroot/fakeroot_1.12.4.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Gives a fake root environment"
-HOMEPAGE = "http://fakeroot.alioth.debian.org"
-SECTION = "base"
-LICENSE = "GPL"
-PR = "r2"
-
-SRC_URI = "\
-  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
-  file://configure-libtool.patch \
-"
-	    
-inherit autotools
-
-do_install_append() {
-        install -d ${D}${includedir}/fakeroot
-        install -m 644 *.h ${D}${includedir}/fakeroot
-        install -d ${D}${libdir}/libfakeroot/
-        oe_libinstall -so libfakeroot ${D}${libdir}/libfakeroot/
-}
-
-# fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS_${PN} = "util-linux"
-
-
-SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
-SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/recipes/fakeroot/fakeroot_1.14.5.bb b/recipes/fakeroot/fakeroot_1.14.5.bb
new file mode 100644
index 0000000..ff6844d
--- /dev/null
+++ b/recipes/fakeroot/fakeroot_1.14.5.bb
@@ -0,0 +1,10 @@
+require fakeroot.inc
+PR = "${INC_PR}.0"
+
+SRC_URI =+ "\
+  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
+  file://quiet-getopt-check.patch \
+"
+
+SRC_URI[md5sum] = "659a1f3a36554abfc2a3eaad2fdc0604"
+SRC_URI[sha256] = "b035c834944bf9482027f48c388de8492e96609825265ac03f05408d0b3aae68"
diff --git a/recipes/obsolete/fakeroot/fakeroot-native_1.12.4.bb b/recipes/obsolete/fakeroot/fakeroot-native_1.12.4.bb
new file mode 100644
index 0000000..e6add2b
--- /dev/null
+++ b/recipes/obsolete/fakeroot/fakeroot-native_1.12.4.bb
@@ -0,0 +1,21 @@
+require fakeroot_${PV}.bb
+
+SRC_URI += "file://fix-prefix.patch"
+S = "${WORKDIR}/fakeroot-${PV}"
+
+inherit native
+
+EXTRA_OECONF = "--program-prefix="
+
+# Compatability for the rare systems not using or having SYSV
+python () {
+    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
+        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
+RDEPENDS_${PN} = "util-linux-native"
+
+SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
+SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/recipes/obsolete/fakeroot/fakeroot_1.12.4.bb b/recipes/obsolete/fakeroot/fakeroot_1.12.4.bb
new file mode 100644
index 0000000..c265749
--- /dev/null
+++ b/recipes/obsolete/fakeroot/fakeroot_1.12.4.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Gives a fake root environment"
+HOMEPAGE = "http://fakeroot.alioth.debian.org"
+SECTION = "base"
+LICENSE = "GPL"
+PR = "r2"
+
+SRC_URI = "\
+  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
+  file://configure-libtool.patch \
+"
+	    
+inherit autotools
+
+do_install_append() {
+        install -d ${D}${includedir}/fakeroot
+        install -m 644 *.h ${D}${includedir}/fakeroot
+        install -d ${D}${libdir}/libfakeroot/
+        oe_libinstall -so libfakeroot ${D}${libdir}/libfakeroot/
+}
+
+# fakeroot needs getopt which is provided by the util-linux package
+RDEPENDS_${PN} = "util-linux"
+
+
+SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
+SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
-- 
1.7.2.3



