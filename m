Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mCG-0007M2-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:54 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAQ-0002QQ-5n by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:45 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAP-0008L5-6i
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:40 +0100
Message-Id: <249b97a7c95194e12f71138280a967fa0d0ea9ae.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300979039.git.stefan@buglabs.net>
References: <cover.1300979039.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 3/7] icedtea6-native: update to 1.7.10 version
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
X-List-Received-Date: Thu, 24 Mar 2011 15:11:56 -0000

From: Henning Heinold <h.heinold@tarent.de>

* remove sizer.patch we will use qemu on openjdk
* delete 1.7.6 recipe for security reasons
* update angstroem-jalimo to prefer 1.7.10

Signed-off-by: Henning Heinold <h.heinold@tarent.de>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/distro/include/angstrom-jalimo.conf           |    2 +-
 .../build-hacks-native.patch                       |    0
 .../disable-library-checks.patch                   |    0
 .../icedtea-ecj-disable-compilation.patch          |    0
 .../icedtea-ecj-fix-freetype.patch                 |    0
 .../icedtea-ecj-fix-zlib.patch                     |    0
 .../icedtea-fix-jar-path.patch                     |    0
 .../icedtea-hotspot-make-arch-sane-for-x86.patch   |    0
 .../icedtea-javac-in.patch                         |    0
 .../icedtea-jdk-sane-x86-arch.patch                |    0
 .../icedtea-sane-x86-arch-name.patch               |    0
 .../icedtea-unbreak-float.patch                    |    0
 .../icedtea-jdk-build-sizer-32-on-amd64.patch      |   36 --------------------
 ...6-native_1.7.6.bb => icedtea6-native_1.7.10.bb} |    5 +--
 14 files changed, 3 insertions(+), 40 deletions(-)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/build-hacks-native.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/disable-library-checks.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-disable-compilation.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-fix-freetype.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-fix-zlib.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-fix-jar-path.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-hotspot-make-arch-sane-for-x86.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-javac-in.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-jdk-sane-x86-arch.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-sane-x86-arch-name.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-unbreak-float.patch (100%)
 delete mode 100644 recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-build-sizer-32-on-amd64.patch
 rename recipes/icedtea/{icedtea6-native_1.7.6.bb => icedtea6-native_1.7.10.bb} (86%)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index 9ba4c70..e116053 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
 PREFERRED_PROVIDER_classpath = "classpath"
 
 PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8.5"
-PREFERRED_VERSION_icedtea6-native = "1.7.6"
+PREFERRED_VERSION_icedtea6-native = "1.7.10"
 
 # Stage JAR files not into ARCH related dirs
 STAGING_DIR_JAVA = "${STAGING_DIR}/java"
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/build-hacks-native.patch b/recipes/icedtea/icedtea6-native-1.7.10/build-hacks-native.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/build-hacks-native.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/build-hacks-native.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/disable-library-checks.patch b/recipes/icedtea/icedtea6-native-1.7.10/disable-library-checks.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/disable-library-checks.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/disable-library-checks.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-disable-compilation.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-disable-compilation.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-disable-compilation.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-disable-compilation.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-fix-freetype.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-freetype.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-fix-freetype.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-freetype.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-fix-zlib.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-zlib.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-ecj-fix-zlib.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-zlib.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-fix-jar-path.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-fix-jar-path.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-fix-jar-path.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-fix-jar-path.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-hotspot-make-arch-sane-for-x86.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-make-arch-sane-for-x86.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-hotspot-make-arch-sane-for-x86.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-make-arch-sane-for-x86.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-javac-in.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-javac-in.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-javac-in.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-javac-in.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-sane-x86-arch.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-jdk-sane-x86-arch.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-sane-x86-arch.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-jdk-sane-x86-arch.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-sane-x86-arch-name.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-sane-x86-arch-name.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-sane-x86-arch-name.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-sane-x86-arch-name.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-unbreak-float.patch b/recipes/icedtea/icedtea6-native-1.7.10/icedtea-unbreak-float.patch
similarity index 100%
rename from recipes/icedtea/icedtea6-native-1.7.6/icedtea-unbreak-float.patch
rename to recipes/icedtea/icedtea6-native-1.7.10/icedtea-unbreak-float.patch
diff --git a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-build-sizer-32-on-amd64.patch b/recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-build-sizer-32-on-amd64.patch
deleted file mode 100644
index 3baeb5d..0000000
--- a/recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-build-sizer-32-on-amd64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Build the xawt sizer.32 binary on Linux/x86_64 so we can use it when
-compiling openjdk for 32-bit platforms.
-
---- openjdk/jdk/make/sun/xawt/Makefile.orig	2011-01-08 01:53:22.000000000 -0500
-+++ openjdk/jdk/make/sun/xawt/Makefile	2011-01-11 15:12:17.000000000 -0500
-@@ -184,6 +184,22 @@
- 
- else # !solaris
- 
-+ifeq ($(PLATFORM), linux)
-+
-+ifeq ($(ARCH), amd64)
-+# On amd64 we generate both 32 and 64-bit sizers in spite of ARCH_DATA_MODEL.
-+SIZERS = $(SIZER).32 $(SIZER).64
-+SIZERS_C = $(SIZER_32_C) $(SIZER_64_C)
-+SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32 $(WRAPPER_GENERATOR_DIR)/sizes.64
-+CFLAGS_32 = $(CFLAGS) -m32
-+else # !amd64
-+SIZERS = $(SIZER).32
-+SIZERS_C = $(SIZER_32_C)
-+SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
-+endif # amd64
-+
-+else # !linux
-+
- ifeq ($(ARCH_DATA_MODEL), 32)
- SIZERS = $(SIZER).32
- SIZERS_C = $(SIZER_32_C)
-@@ -194,6 +210,7 @@
- SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
- endif # 32
- 
-+endif # linux
- endif # solaris
- 
- # XXX Hack for 6185483 - use hard-coded sizes.
diff --git a/recipes/icedtea/icedtea6-native_1.7.6.bb b/recipes/icedtea/icedtea6-native_1.7.10.bb
similarity index 86%
rename from recipes/icedtea/icedtea6-native_1.7.6.bb
rename to recipes/icedtea/icedtea6-native_1.7.10.bb
index 126f2f4..c55e197 100644
--- a/recipes/icedtea/icedtea6-native_1.7.6.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.10.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
 	"
 SRC_URI[ojdk.md5sum] = "078fe0ab744c98694decc77f2456c560"
 SRC_URI[ojdk.sha256sum] = "2019a4c3d2d14620caa78d7df49fd987a041066b4631bde4fd8424033f3c1785"
-SRC_URI[iced.md5sum] = "0a865e883987665ffcb34db9dd9b35c2"
-SRC_URI[iced.sha256sum] = "b28c8bd39d9bd8a28efaaa38280288a3faa6bec0d756323c0555ad3d8c5d77f5"
+SRC_URI[iced.md5sum] = "0d61041e46253d089f1b30114716012d"
+SRC_URI[iced.sha256sum] = "dbca9d7598352d178651c8cc28ff887c59a27f0125785a58e9f9723611137f78"
 
 ICEDTEA_PATCHES = "\
 	file://icedtea-ecj-disable-compilation.patch;apply=no \
@@ -24,7 +24,6 @@ ICEDTEA_PATCHES = "\
 	file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
 	file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-unbreak-float.patch;apply=no \
-	file://icedtea-jdk-build-sizer-32-on-amd64.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
-- 
1.7.4.1



