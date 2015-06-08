Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECA8757CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 22:43:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2015 15:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,576,1427785200"; d="scan'208";a="505105200"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 15:43:49 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 15:42:40 +0000
Message-Id: <ad965b122b1e2ecc4848bb54b163d083f962d32f.1433777512.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
References: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
References: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
Subject: [meta-oe][PATCH 3/3][dizzy] p7zip: backport to dizzy for compatibility with iot-devkit
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
X-List-Received-Date: Mon, 08 Jun 2015 22:43:49 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...do_not_override_compiler_and_do_not_strip.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb     | 17 ++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
 create mode 100644 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb

diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
new file mode 100644
index 0000000..a3b02c5
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
@@ -0,0 +1,31 @@
+do not override compiler and do not strip
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
+--- p7zip_9.20.1/makefile.machine	2011-03-13 12:54:57.000000000 +0100
++++ p7zip_9.20.1/makefile.machine	2015-02-03 08:39:44.427696944 +0100
+@@ -4,14 +4,14 @@
+ 
+ OPTFLAGS=-O
+ 
+-ALLFLAGS=${OPTFLAGS} -pipe -s \
++ALLFLAGS=${OPTFLAGS} -pipe \
+     	-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
+ 	-DNDEBUG -D_REENTRANT -DENV_UNIX \
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
index 0000000..be706e1
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "7-zip is a commandline utility handling 7z archives."
+HOMEPAGE = "http://www.7-zip.org/"
+LICENSE = "LGPL-2.1+ & unRAR"
+LIC_FILES_CHKSUM = "file://DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a \
+                    file://DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"
+
+SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
+          file://do_not_override_compiler_and_do_not_strip.patch"
+SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
+SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
+
+S = "${WORKDIR}/${BPN}_${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/bin/* ${D}${bindir}
+}
-- 
1.8.4.5


