Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq2-0006GI-Ux
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:03 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5ED8922325A8;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 55FE622325AB;
	Sat, 18 Feb 2012 22:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:47 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C68E03C4BD; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:14 +0100
Message-Id: <1329600022-8027-5-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 04/12][oe-classic] icedtea6-native: add linux kernel version 3 support
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:03 -0000

* bump PR

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 .../icedtea-support_linux_3.patch                  |   19 +++++++++++++++++++
 recipes/icedtea/icedtea6-native_1.7.10.bb          |    4 +++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.10/icedtea-support_linux_3.patch

diff --git a/recipes/icedtea/icedtea6-native-1.7.10/icedtea-support_linux_3.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-support_linux_3.patch
new file mode 100644
index 0000000..925ca6c
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-support_linux_3.patch
@@ -0,0 +1,19 @@
+# HG changeset patch
+# User andrew
+# Date 1309217125 -3600
+# Node ID f7e8b10f51c6a622520b55df0c644fb09ec78542
+# Parent  b8227c320dec384a94026fcaa650b0ebd4eef13b
+Allow building HotSpot with any Linux 3 version.
+
+diff -r b8227c320dec -r f7e8b10f51c6 make/linux/Makefile
+--- openjdk/hotspot/make/linux/Makefile	Wed Jun 15 18:56:52 2011 +0100
++++ openjdk/hotspot/make/linux/Makefile	Tue Jun 28 00:25:25 2011 +0100
+@@ -230,7 +230,7 @@
+ # Solaris 2.5.1, 2.6).
+ # Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
+ 
+-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%
++SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%
+ OS_VERSION := $(shell uname -r)
+ EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
+ 
diff --git a/recipes/icedtea/icedtea6-native_1.7.10.bb b/recipes/icedtea/icedtea6-native_1.7.10.bb
index 77c6232..a637bf0 100644
--- a/recipes/icedtea/icedtea6-native_1.7.10.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.10.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
 	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
@@ -24,6 +24,7 @@ ICEDTEA_PATCHES = "\
 	file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
 	file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-unbreak-float.patch;apply=no \
+	file://icedtea-support_linux_3.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -33,4 +34,5 @@ export DISTRIBUTION_PATCHES = "\
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
 	patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-support_linux_3.patch \
 	"
-- 
1.7.9


