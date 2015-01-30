Return-Path: <raphael.freudiger@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 35EE56072F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 07:36:11 +0000 (UTC)
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.14.3/8.14.3) with ESMTP id t0U7a6oY001530
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 08:36:06 +0100
Received: from localhost.localdomain (MD1AT2FC.ww002.siemens.net
	[139.16.78.251])
	by mail3.siemens.de (8.14.3/8.14.3) with ESMTP id t0U7a6TP020432;
	Fri, 30 Jan 2015 08:36:06 +0100
From: Raphael Freudiger <raphael.freudiger@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2015 08:34:09 +0100
Message-Id: <1422603250-24453-1-git-send-email-raphael.freudiger@siemens.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Raphael Freudiger <raphael.freudiger@siemens.com>
Subject: [meta-oe][PATCH v2] p7zip: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jan 2015 07:36:14 -0000

p7zip is the command line version of 7-Zip for Unix/Linux.

Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/licenses/unRAR                             |   41 ++++++++++++++++++++
 .../p7zip/files/do_not_override_compiler.patch     |   24 ++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb     |   23 +++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 meta-oe/licenses/unRAR
 create mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_compiler.patch
 create mode 100644 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb

diff --git a/meta-oe/licenses/unRAR b/meta-oe/licenses/unRAR
new file mode 100644
index 0000000..5f78b72
--- /dev/null
+++ b/meta-oe/licenses/unRAR
@@ -0,0 +1,41 @@
+ ******    *****   ******   unRAR - free utility for RAR archives
+ **   **  **   **  **   **  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ ******   *******  ******    License for use and distribution of
+ **   **  **   **  **   **   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ **   **  **   **  **   **         FREE portable version
+                                   ~~~~~~~~~~~~~~~~~~~~~
+
+      The source code of unRAR utility is freeware. This means:
+
+   1. All copyrights to RAR and the utility unRAR are exclusively
+      owned by the author - Alexander Roshal.
+
+   2. The unRAR sources may be used in any software to handle RAR
+      archives without limitations free of charge, but cannot be used
+      to re-create the RAR compression algorithm, which is proprietary.
+      Distribution of modified unRAR sources in separate form or as a
+      part of other software is permitted, provided that it is clearly
+      stated in the documentation and source comments that the code may
+      not be used to develop a RAR (WinRAR) compatible archiver.
+
+   3. The unRAR utility may be freely distributed. No person or company 
+      may charge a fee for the distribution of unRAR without written
+      permission from the copyright holder.
+
+   4. THE RAR ARCHIVER AND THE UNRAR UTILITY ARE DISTRIBUTED "AS IS".
+      NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  YOU USE AT 
+      YOUR OWN RISK. THE AUTHOR WILL NOT BE LIABLE FOR DATA LOSS, 
+      DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING
+      OR MISUSING THIS SOFTWARE.
+
+   5. Installing and using the unRAR utility signifies acceptance of
+      these terms and conditions of the license.
+
+   6. If you don't agree with terms of the license you must remove
+      unRAR files from your storage devices and cease to use the
+      utility.
+
+      Thank you for your interest in RAR and unRAR.
+
+
+                                            Alexander L. Roshal
\ No newline at end of file
diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler.patch b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler.patch
new file mode 100644
index 0000000..c97a1ee
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler.patch
@@ -0,0 +1,24 @@
+do not override compiler
+
+The default makefile sets the compiler to g++ or gcc. This leads to a wrong architecture when cross-compiling.
+Remove the hardcoded compiler and just append the flags to CXX and CC.
+
+Upstream-Status: Pending
+Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
+Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
+
+Index: p7zip_9.20.1/makefile.machine
+=====================================================================
+--- p7zip_9.20.1.orig/makefile.machine	2011-03-13 12:54:57.000000000 +0100
++++ p7zip_9.20.1/makefile.machine	2014-11-12 16:20:22.880349826 +0100
+@@ -10,8 +10,8 @@
+ 	-D_7ZIP_LARGE_PAGES \
+ 	$(LOCAL_FLAGS)
+ 
+-CXX=g++ $(ALLFLAGS)
+-CC=gcc $(ALLFLAGS)
++CXX+=$(ALLFLAGS)
++CC+=$(ALLFLAGS)
+ CC_SHARED=-fPIC
+ LINK_SHARED=-fPIC -shared
+ 
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
new file mode 100644
index 0000000..d70cd66
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "7-zip is a commandline utility handling 7z archives."
+HOMEPAGE = "http://www.7-zip.org/"
+LICENSE = "LGPL-2.1+ & unRAR"
+LIC_FILES_CHKSUM = "file://./DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a"
+LIC_FILES_CHKSUM = "file://./DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"
+PR = "r1"
+
+SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
+          file://do_not_override_compiler.patch"
+
+S = "${WORKDIR}/${PN}_${PV}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/bin/* ${D}${bindir}    
+}
+
+
+SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
+SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
-- 
1.7.10.4


