Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF95C60DFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 16:14:02 +0000 (UTC)
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s06GE2RU013148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jan 2014 08:14:03 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1W0CoU-0006pV-LV
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jan 2014 11:14:02 -0500
Date: Mon, 6 Jan 2014 11:14:02 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140106161402.GA26244@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java] Missing dependencies
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
X-List-Received-Date: Mon, 06 Jan 2014 16:14:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From d088588c1489cd4a059d99e46142f0ba65dd7c65 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 6 Jan 2014 08:12:16 -0500
Subject: [PATCH 1/1] Missing dependencies in some java packages

classpath-native and jamvm-native both needs to depend on java-initial
openjdk-7 and jamvm-native both needs to inherit pkgconfig

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-core/classpath/classpath-native_0.99.bb | 4 ++--
 recipes-core/jamvm/jamvm.inc                    | 4 ++--
 recipes-core/jamvm/jamvm_git.bb                 | 2 +-
 recipes-core/openjdk/openjdk-7-common.inc       | 2 +-
 recipes-core/openjdk/openjdk-common.inc         | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index ece10c3..2a09557 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,9 +1,9 @@
 require classpath-native.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
-DEPENDS += "ecj-initial"
+DEPENDS += "ecj-initial virtual/java-initial"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://sun-security-getproperty.patch;striplevel=0 \
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index ee0e5c0..13d26fc 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "zlib classpath virtual/javac-native libffi"
+DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial"
 DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial libffi-native"
 
 RDEPENDS_${PN} = "classpath"
@@ -21,7 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "
 
 
-inherit java autotools update-alternatives
+inherit java autotools update-alternatives pkgconfig
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 88df6fc..af77356 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -6,7 +6,7 @@ require jamvm.inc
 SRCREV = "0972452d441544f7dd29c55d64f1ce3a5db90d82"
 PV = "1.5.5+1.6.0-devel+git${SRCPV}"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
            file://jamvm-jni_h-noinst.patch \
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 206bf12..ec3488a 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -1,7 +1,7 @@
 require openjdk-common.inc
 ICEDTEA = "icedtea-${ICEDTEA_VERSION}"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = " \
   ${ICEDTEA_URI} \
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index a993ea0..97947b5 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,7 +17,7 @@ DEPENDS_append_libc-uclibc = " virtual/libiconv "
 # because structure sizes and/or alignment may differ.
 DEPENDS_append = " qemu-native "
 
-inherit java autotools gettext qemu
+inherit java autotools gettext qemu pkgconfig
 
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
-- 
1.8.4.3


