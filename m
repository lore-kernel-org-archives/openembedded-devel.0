Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 544FD6C1A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:01:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="48180595"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2018 17:01:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1CA1E4B6ED4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 17:01:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 15 Nov 2018 17:01:52 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Nov 2018 02:00:53 +0800
Message-ID: <1542304853-36738-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 1CA1E4B6ED4F.AB7D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-java][PATCH] openjdk-8: 172b11 -> 181b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 09:01:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1) Upgrade openjdk-8 from 172b11 to 181b13

2) Modify openjdk8-add-missing-linker-flags.patch for new version

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...native_172b11.bb => openjdk-8-native_181b13.bb} |  0
 recipes-core/openjdk/openjdk-8-release-172b11.inc  | 39 -------------------
 ...32.inc => openjdk-8-release-181b13-aarch32.inc} |  2 +-
 ...64.inc => openjdk-8-release-181b13-aarch64.inc} |  2 +-
 ...mon.inc => openjdk-8-release-181b13-common.inc} |  2 +-
 recipes-core/openjdk/openjdk-8-release-181b13.inc  | 39 +++++++++++++++++++
 .../{openjdk-8_172b11.bb => openjdk-8_181b13.bb}   |  0
 .../{openjre-8_172b11.bb => openjre-8_181b13.bb}   |  0
 .../openjdk8-add-missing-linker-flags.patch        | 44 ++++++++++++----------
 9 files changed, 66 insertions(+), 62 deletions(-)
 rename recipes-core/openjdk/{openjdk-8-native_172b11.bb => openjdk-8-native_181b13.bb} (100%)
 delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11.inc
 rename recipes-core/openjdk/{openjdk-8-release-172b11-aarch32.inc => openjdk-8-release-181b13-aarch32.inc} (98%)
 rename recipes-core/openjdk/{openjdk-8-release-172b11-aarch64.inc => openjdk-8-release-181b13-aarch64.inc} (97%)
 rename recipes-core/openjdk/{openjdk-8-release-172b11-common.inc => openjdk-8-release-181b13-common.inc} (99%)
 create mode 100644 recipes-core/openjdk/openjdk-8-release-181b13.inc
 rename recipes-core/openjdk/{openjdk-8_172b11.bb => openjdk-8_181b13.bb} (100%)
 rename recipes-core/openjdk/{openjre-8_172b11.bb => openjre-8_181b13.bb} (100%)

diff --git a/recipes-core/openjdk/openjdk-8-native_172b11.bb b/recipes-core/openjdk/openjdk-8-native_181b13.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-native_172b11.bb
rename to recipes-core/openjdk/openjdk-8-native_181b13.bb
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11.inc b/recipes-core/openjdk/openjdk-8-release-172b11.inc
deleted file mode 100644
index b308e50..0000000
--- a/recipes-core/openjdk/openjdk-8-release-172b11.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-require openjdk-8-release-172b11-common.inc
-
-# We do not yet work for aarch64, and we make sure
-# to use the aarch32 port for ARMv7.
-COMPATIBLE_HOST = "^(?!(aarch64)).*$"
-COMPATIBLE_HOST_armv7a = "^$"
-COMPATIBLE_HOST_armv7ve = "^$"
-
-CORBA_CHANGESET = "875a75c440cd"
-SRC_URI[corba.md5sum] = "66242dd6e749f39a5ef6add34f5ecb2f"
-SRC_URI[corba.sha256sum] = "f1618be7ad88619c7d7c1eed9800c528d0646e1c9f039e20a57b3e72ae3d3512"
-
-HOTSPOT_CHANGESET = "32ba4d2121c1"
-SRC_URI[hotspot.md5sum] = "a3e1d2f91ba8873f71e9a72043e2644a"
-SRC_URI[hotspot.sha256sum] = "680b1f5100786910bfceeef90ce28d74fcf6eacfdd3b92dfc76dcf3216060e99"
-
-JAXP_CHANGESET = "30586bb50743"
-SRC_URI[jaxp.md5sum] = "b413b1cb709d74e513f13c586215366d"
-SRC_URI[jaxp.sha256sum] = "ba36dd8ad72ff3d8bda38b7d6773037e18c3c68ebadd61f1e1f7fc167a506baa"
-
-JAXWS_CHANGESET = "452a6a5a878e"
-SRC_URI[jaxws.md5sum] = "5c3c4d1fec19398128cf818aef5486a9"
-SRC_URI[jaxws.sha256sum] = "89aa34e6bc3410a85ea697aa4ae70c21f7099efdacef78a6e5a46747421e86f9"
-
-JDK_CHANGESET = "5ccc572f4ffe"
-SRC_URI[jdk.md5sum] = "29dd4772e3862193e56007a0bb0d6886"
-SRC_URI[jdk.sha256sum] = "4d1758ceec155fcd2cd786f11071ed614947a9720373d704221d78ed98beadec"
-
-LANGTOOLS_CHANGESET = "34ee52bc68a4"
-SRC_URI[langtools.md5sum] = "b195802f2aaa5c95c06cc50021bb42a6"
-SRC_URI[langtools.sha256sum] = "0403bd2c9a45e4c0dc2148907028e0cdfd087be512e6d6b3763a01411936663a"
-
-NASHORN_CHANGESET = "7efd6152328e"
-SRC_URI[nashorn.md5sum] = "3aa4b31fdbf330baf28194e21697b8d6"
-SRC_URI[nashorn.sha256sum] = "8b5cbd29e9dbace477a57d7c07a127312dd3cf6b8e648b0b64026616d12c6862"
-
-OPENJDK_CHANGESET = "33d274a7dda0"
-SRC_URI[openjdk.md5sum] = "105f62e8f22a68b8c4151c68a447f76e"
-SRC_URI[openjdk.sha256sum] = "bf49215fe1e43e6f110470c911fce32722c843e03efb68e40cc7a832eb80faea"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-181b13-aarch32.inc
similarity index 98%
rename from recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
rename to recipes-core/openjdk/openjdk-8-release-181b13-aarch32.inc
index 9cc2083..8972d5d 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
+++ b/recipes-core/openjdk/openjdk-8-release-181b13-aarch32.inc
@@ -1,4 +1,4 @@
-require openjdk-8-release-172b11-common.inc
+require openjdk-8-release-181b13-common.inc
 
 COMPATIBLE_HOST = "^$"
 COMPATIBLE_HOST_armv7a = "arm"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-181b13-aarch64.inc
similarity index 97%
rename from recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
rename to recipes-core/openjdk/openjdk-8-release-181b13-aarch64.inc
index f0f4655..bdc6707 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-181b13-aarch64.inc
@@ -1,4 +1,4 @@
-require openjdk-8-release-172b11-common.inc
+require openjdk-8-release-181b13-common.inc
 
 COMPATIBLE_HOST = "aarch64"
 
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-181b13-common.inc
similarity index 99%
rename from recipes-core/openjdk/openjdk-8-release-172b11-common.inc
rename to recipes-core/openjdk/openjdk-8-release-181b13-common.inc
index 0cda4bb..ac7da06 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-181b13-common.inc
@@ -48,7 +48,7 @@ PATCHES_URI_append_class-target = "\
     file://openjdk8-fix-shark-stdc++11.patch;striplevel=0 \
     file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;striplevel=0 \
     file://openjdk8-fix-adlc-flags.patch;striplevel=0 \
-    file://openjdk8-add-missing-linker-flags.patch;striplevel=0 \
+    file://openjdk8-add-missing-linker-flags.patch;striplevel=1 \
 "
 FIX_SHARK_BUILD_PT2_PATCH = "file://openjdk8-fix-shark-build-pt2.patch;striplevel=0"
 FIX_SHARK_BUILD_PT2_PATCH_armv7a = "file://openjdk8-fix-shark-build-pt2-aarch32.patch;striplevel=0"
diff --git a/recipes-core/openjdk/openjdk-8-release-181b13.inc b/recipes-core/openjdk/openjdk-8-release-181b13.inc
new file mode 100644
index 0000000..6328442
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-181b13.inc
@@ -0,0 +1,39 @@
+require openjdk-8-release-181b13-common.inc
+
+# We do not yet work for aarch64, and we make sure
+# to use the aarch32 port for ARMv7.
+COMPATIBLE_HOST = "^(?!(aarch64)).*$"
+COMPATIBLE_HOST_armv7a = "^$"
+COMPATIBLE_HOST_armv7ve = "^$"
+
+CORBA_CHANGESET = "a4d1d2b0da63"
+SRC_URI[corba.md5sum] = "56b7864ea61e585172802c7585f3cd00"
+SRC_URI[corba.sha256sum] = "c24f08511d450c5a3f453d5f051d2012908e6e83c60ddb7ebe03f7228d1e2500"
+
+HOTSPOT_CHANGESET = "eed8e846c982"
+SRC_URI[hotspot.md5sum] = "f3fc138b225f0d14d24adeda1bd0caf7"
+SRC_URI[hotspot.sha256sum] = "7990ea1c5270c64b1e7219625562710943fc96ba929fb545e406dfc43e73dfb7"
+
+JAXP_CHANGESET = "79cd9a0e041e"
+SRC_URI[jaxp.md5sum] = "53b63d4cb7e877c760beb34f8dc0bced"
+SRC_URI[jaxp.sha256sum] = "e116881e64dcdd76fc2fd4c6ec0dc1ed7114fdffe81e2d424b4375843a448072"
+
+JAXWS_CHANGESET = "2a12eb329cb9"
+SRC_URI[jaxws.md5sum] = "f1c6c04b7509478b943a8f97f790cb59"
+SRC_URI[jaxws.sha256sum] = "5dfb679e5d00718b8ff4fda710b231303b30ef953b0f6826a75c670249b23f6c"
+
+JDK_CHANGESET = "0cb452d66676"
+SRC_URI[jdk.md5sum] = "2c043499ef52901a797468ab00384583"
+SRC_URI[jdk.sha256sum] = "2e25583342215cd65e234a7694698fcfa93535acc055fc51f680b7a36fcecfed"
+
+LANGTOOLS_CHANGESET = "e910eba1327d"
+SRC_URI[langtools.md5sum] = "72b981b7baaf1dcb0b31ea0f86357c22"
+SRC_URI[langtools.sha256sum] = "494bca0c728909b3c55c1e097d68ca327f38f2f042455b8250a9d22d73de2d64"
+
+NASHORN_CHANGESET = "382400935513"
+SRC_URI[nashorn.md5sum] = "4468ba6c1b802aecc4a0842b57c2e747"
+SRC_URI[nashorn.sha256sum] = "e98672d441ec0bbffa59f58d667079a6b22c3ac9ff2554c9e5d7728a5443afc3"
+
+OPENJDK_CHANGESET = "ead7f893fb2c"
+SRC_URI[openjdk.md5sum] = "f38298ee4dd565c1c55447fd45e79c8c"
+SRC_URI[openjdk.sha256sum] = "f5618b6f7222bd3eac7cfd815f761c8a15cadd2eed2ecd08f1cf55d5c0284964"
diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_181b13.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8_172b11.bb
rename to recipes-core/openjdk/openjdk-8_181b13.bb
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_181b13.bb
similarity index 100%
rename from recipes-core/openjdk/openjre-8_172b11.bb
rename to recipes-core/openjdk/openjre-8_181b13.bb
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
index 92f29b0..2404865 100644
--- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
@@ -7,51 +7,55 @@ failures due to a bad hash style.
 Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
 
 Upstream-Status: Pending
+
+Update for 181b13.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  hotspot/make/linux/makefiles/jsig.make   | 2 +-
  hotspot/make/linux/makefiles/saproc.make | 2 +-
  hotspot/make/linux/makefiles/vm.make     | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git hotspot/make/linux/makefiles/jsig.make hotspot/make/linux/makefiles/jsig.make
-index ce29eb1..e1d6c07 100644
---- hotspot/make/linux/makefiles/jsig.amake
-+++ hotspot/make/linux/makefiles/jsig.make
+diff --git a/hotspot/make/linux/makefiles/jsig.make b/hotspot/make/linux/makefiles/jsig.make
+index 5831bbc..bc9357d 100644
+--- a/hotspot/make/linux/makefiles/jsig.make
++++ b/hotspot/make/linux/makefiles/jsig.make
 @@ -44,7 +44,7 @@ LIBJSIG_MAPFILE = $(MAKEFILES_DIR)/mapfile-vers-jsig
  # cause problems with interposing. See CR: 6466665
  # LFLAGS_JSIG += $(MAPFLAG:FILENAME=$(LIBJSIG_MAPFILE))
-
--LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE)
-+LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
-
+ 
+-LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) $(LDFLAGS_NO_EXEC_STACK)
++LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) $(LDFLAGS_NO_EXEC_STACK) $(EXTRA_LDFLAGS) 
+ 
  # DEBUG_BINARIES overrides everything, use full -g debug information
  ifeq ($(DEBUG_BINARIES), true)
-diff --git hotspot/make/linux/makefiles/saproc.make hotspot/make/linux/makefiles/saproc.make
-index 7c6e4a8..369a0ba 100644
---- hotspot/make/linux/makefiles/saproc.make
-+++ hotspot/make/linux/makefiles/saproc.make
+diff --git a/hotspot/make/linux/makefiles/saproc.make b/hotspot/make/linux/makefiles/saproc.make
+index 6579c8e..b81cef3 100644
+--- a/hotspot/make/linux/makefiles/saproc.make
++++ b/hotspot/make/linux/makefiles/saproc.make
 @@ -73,7 +73,7 @@ ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
  else
  ALT_SAINCDIR=
  endif
 -SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE)
 +SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
-
+ 
  SAARCH ?= $(BUILDARCH)
-
-diff --git hotspot/make/linux/makefiles/vm.make hotspot/make/linux/makefiles/vm.make
+ 
+diff --git a/hotspot/make/linux/makefiles/vm.make b/hotspot/make/linux/makefiles/vm.make
 index 1a48df9..72f8d11 100644
---- hotspot/make/linux/makefiles/vm.make
-+++ hotspot/make/linux/makefiles/vm.make
+--- a/hotspot/make/linux/makefiles/vm.make
++++ b/hotspot/make/linux/makefiles/vm.make
 @@ -122,7 +122,7 @@ CFLAGS += $(CFLAGS/NOEX)
-
+ 
  # Extra flags from gnumake's invocation or environment
  CFLAGS += $(EXTRA_CFLAGS)
 -LFLAGS += $(EXTRA_CFLAGS)
 +LFLAGS += $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)
-
+ 
  # Don't set excutable bit on stack segment
  # the same could be done by separate execstack command
---
+-- 
 2.7.4
 
-- 
2.7.4




