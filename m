Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxu-0006mW-Cl
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 613944036DE74;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 59AD34036DE6D;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmoVHC2cMkYK; Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 306164036DE74;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006UZ-Vs; Wed, 21 Jul 2010 16:07:22 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:09 +0200
Message-Id: <1279721232-24744-19-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 18/21] jamvm: backport version 1.5.3 from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:43 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum is already in conf/checksums.ini
---
 recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch |   13 +++++++++++++
 recipes/jamvm/jamvm-native.inc                     |   10 +++++++---
 recipes/jamvm/jamvm-native_1.5.3.bb                |    8 ++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch
 create mode 100644 recipes/jamvm/jamvm-native_1.5.3.bb

diff --git a/recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch b/recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch
new file mode 100644
index 0000000..f0884fd
--- /dev/null
+++ b/recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch
@@ -0,0 +1,13 @@
+Index: jamvm-1.5.3/src/Makefile.am
+===================================================================
+--- jamvm-1.5.3.orig/src/Makefile.am	2009-09-29 09:29:13.386565473 +0200
++++ jamvm-1.5.3/src/Makefile.am	2009-09-29 09:33:47.702565852 +0200
+@@ -23,7 +23,7 @@
+ DIST_SUBDIRS = os arch interp
+ 
+ bin_PROGRAMS = jamvm
+-include_HEADERS = jni.h
++noinst_HEADERS = jni.h
+ 
+ lib_LTLIBRARIES = libjvm.la
+ noinst_LTLIBRARIES = libcore.la
diff --git a/recipes/jamvm/jamvm-native.inc b/recipes/jamvm/jamvm-native.inc
index ff2dba6..6f8d223 100644
--- a/recipes/jamvm/jamvm-native.inc
+++ b/recipes/jamvm/jamvm-native.inc
@@ -1,10 +1,14 @@
 require jamvm.inc 
 
-DEPENDS = "zlib-native classpath-native ecj-initial"
-RDEPENDS = ""
+DEPENDS = "zlib-native classpath-native ecj-initial libffi-native"
+RDEPENDS_${PN} = ""
 
 PROVIDES = "virtual/java-native"
 
+# Use libffi instead of handcoded JNI calling code. This code seems to have issues which only randomly
+# trigger a segfault.
+EXTRA_OECONF += "--enable-ffi"
+
 RPROVIDES_jamvm = ""
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
@@ -18,7 +22,7 @@ inherit native
 S = "${WORKDIR}/jamvm-${PV}"
 
 do_install_append() {
-  ln -sf jamvm ${STAGING_BINDIR}/java
+        ln -sf jamvm ${STAGING_BINDIR}/java
 }
 
 # Enforce usage of ecj-initial.
diff --git a/recipes/jamvm/jamvm-native_1.5.3.bb b/recipes/jamvm/jamvm-native_1.5.3.bb
new file mode 100644
index 0000000..d0ab533
--- /dev/null
+++ b/recipes/jamvm/jamvm-native_1.5.3.bb
@@ -0,0 +1,8 @@
+# Note: You *must* use this together with classpath-native 0.98. Otherwise it won't work!
+
+require jamvm-native.inc
+
+PR = "r2"
+
+SRC_URI += "file://jamvm-1.5.3-jni_h-noinst.patch;patch=1"
+
-- 
1.7.0.4



