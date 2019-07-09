Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CD04D7E79F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 12:38:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 05:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="170580958"
Received: from chiajenx-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.228])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 05:38:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 00:38:33 +1200
Message-Id: <47c6250a3340ec5e5129738561470d3f24ae9278.1562675891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562675891.git.paul.eggleton@linux.intel.com>
References: <cover.1562675891.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] upm: update to 2.0.0
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
X-List-Received-Date: Tue, 09 Jul 2019 12:38:52 -0000
Content-Transfer-Encoding: 8bit

Changelog:

  https://github.com/intel-iot-devkit/upm/blob/master/docs/changelog.md

Dropped a couple of patches merged upstream and updated PV to match
convention for git recipes (+git rather than -git).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-Replace-strncpy-with-memcpy.patch    |  49 ------
 .../upm/upm/0001-Use-stdint-types.patch       | 139 ++++++++++++++++++
 ...lude-sys-types.h-for-uint-definition.patch |  33 -----
 meta-oe/recipes-extended/upm/upm_git.bb       |   7 +-
 4 files changed, 142 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-Use-stdint-types.patch
 delete mode 100644 meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch b/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
deleted file mode 100644
index 4b17087ef8..0000000000
--- a/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d314f26e024aaf15bf4ab22ceb98501148d0eac8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 May 2018 19:53:33 -0700
-Subject: [PATCH] Replace strncpy with memcpy
-
-gcc8 detects that strncpy is overwiritng the null terminating character
-the source strings are already initialized to 0 so memcpy would do the same
-job
-
-Fixes
-rn2903.c:153:5: error: 'strncpy' output may be truncated copying 16 bytes from a string of length 511 [-Werror=stringop-truncation]
-     strncpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ecezo/ecezo.c   | 2 +-
- src/rn2903/rn2903.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ecezo/ecezo.c b/src/ecezo/ecezo.c
-index 6a195fc1..56c6dab3 100644
---- a/src/ecezo/ecezo.c
-+++ b/src/ecezo/ecezo.c
-@@ -488,7 +488,7 @@ int ecezo_send_command(const ecezo_context dev, char *cmd, char *buffer,
-     // our write buffer
-     char writeBuffer[ECEZO_MAX_BUFFER_LEN];
- 
--    strncpy(writeBuffer, cmd, ECEZO_MAX_BUFFER_LEN);
-+    memcpy(writeBuffer, cmd, ECEZO_MAX_BUFFER_LEN-1);
-     writeBuffer[ECEZO_MAX_BUFFER_LEN - 1] = 0;
- 
-     int writelen = strlen(writeBuffer);
-diff --git a/src/rn2903/rn2903.c b/src/rn2903/rn2903.c
-index f30a33ae..01a011da 100644
---- a/src/rn2903/rn2903.c
-+++ b/src/rn2903/rn2903.c
-@@ -150,7 +150,7 @@ static rn2903_context _rn2903_postinit(rn2903_context dev,
-         rn2903_close(dev);
-         return NULL;
-     }
--    strncpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
-+    memcpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
- 
-     return dev;
- }
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-extended/upm/upm/0001-Use-stdint-types.patch b/meta-oe/recipes-extended/upm/upm/0001-Use-stdint-types.patch
new file mode 100644
index 0000000000..40856fcf0d
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-Use-stdint-types.patch
@@ -0,0 +1,139 @@
+From 5a1e731d71d577f56a2c013e4a75a8e90188e63b Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 9 Jul 2019 05:21:59 -0700
+Subject: [PATCH] Use stdint types
+
+Fixes compilation with musl.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ src/bma250e/bma250e.cxx   | 16 ++++++++--------
+ src/bmg160/bmg160.cxx     | 10 +++++-----
+ src/bmi160/bosch_bmi160.h |  2 +-
+ src/bmm150/bmm150.cxx     |  8 ++++----
+ 4 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/src/bma250e/bma250e.cxx b/src/bma250e/bma250e.cxx
+index a8792782..1b3ecdd8 100644
+--- a/src/bma250e/bma250e.cxx
++++ b/src/bma250e/bma250e.cxx
+@@ -195,35 +195,35 @@ BMA250E::BMA250E(std::string initStr) : mraaIo(initStr)
+             fifoConfig(mode, axes);
+         }
+         if(tok.substr(0, 20) == "setInterruptEnable0:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(20), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(20), nullptr, 0);
+             setInterruptEnable0(bits);
+         }
+         if(tok.substr(0, 20) == "setInterruptEnable1:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(20), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(20), nullptr, 0);
+             setInterruptEnable1(bits);
+         }
+         if(tok.substr(0, 20) == "setInterruptEnable2:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(20), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(20), nullptr, 0);
+             setInterruptEnable2(bits);
+         }
+         if(tok.substr(0, 17) == "setInterruptMap0:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setInterruptMap0(bits);
+         }
+         if(tok.substr(0, 17) == "setInterruptMap1:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setInterruptMap1(bits);
+         }
+         if(tok.substr(0, 17) == "setInterruptMap2:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setInterruptMap2(bits);
+         }
+         if(tok.substr(0, 16) == "setInterruptSrc:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(16), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(16), nullptr, 0);
+             setInterruptSrc(bits);
+         }
+         if(tok.substr(0, 26) == "setInterruptOutputControl:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(26), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(26), nullptr, 0);
+             setInterruptOutputControl(bits);
+         }
+         if(tok.substr(0, 26) == "setInterruptLatchBehavior:") {
+diff --git a/src/bmg160/bmg160.cxx b/src/bmg160/bmg160.cxx
+index 1a0939f8..2438c399 100644
+--- a/src/bmg160/bmg160.cxx
++++ b/src/bmg160/bmg160.cxx
+@@ -173,23 +173,23 @@ BMG160::BMG160(std::string initStr) : mraaIo(initStr)
+             fifoConfig(mode, axes);
+         }
+         if(tok.substr(0, 20) == "setInterruptEnable0:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(20), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(20), nullptr, 0);
+             setInterruptEnable0(bits);
+         }
+         if(tok.substr(0, 17) == "setInterruptMap0:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setInterruptMap0(bits);
+         }
+         if(tok.substr(0, 17) == "setInterruptMap1:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setInterruptMap1(bits);
+         }
+         if(tok.substr(0, 16) == "setInterruptSrc:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(16), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(16), nullptr, 0);
+             setInterruptSrc(bits);
+         }
+         if(tok.substr(0, 26) == "setInterruptOutputControl:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(26), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(26), nullptr, 0);
+             setInterruptOutputControl(bits);
+         }
+         if(tok.substr(0, 26) == "setInterruptLatchBehavior:") {
+diff --git a/src/bmi160/bosch_bmi160.h b/src/bmi160/bosch_bmi160.h
+index 87ca2249..cd9efe6f 100644
+--- a/src/bmi160/bosch_bmi160.h
++++ b/src/bmi160/bosch_bmi160.h
+@@ -81,7 +81,7 @@ typedef	int16_t s16;/**< used for signed 16bit */
+ typedef	int32_t s32;/**< used for signed 32bit */
+ typedef	int64_t s64;/**< used for signed 64bit */
+ 
+-typedef	u_int8_t u8;/**< used for unsigned 8bit */
++typedef	uint8_t u8;/**< used for unsigned 8bit */
+ typedef	u_int16_t u16;/**< used for unsigned 16bit */
+ typedef	u_int32_t u32;/**< used for unsigned 32bit */
+ typedef	u_int64_t u64;/**< used for unsigned 64bit */
+diff --git a/src/bmm150/bmm150.cxx b/src/bmm150/bmm150.cxx
+index 234ebf92..02436788 100644
+--- a/src/bmm150/bmm150.cxx
++++ b/src/bmm150/bmm150.cxx
+@@ -170,19 +170,19 @@ BMM150::BMM150(std::string initStr) : mraaIo(initStr)
+             setOpmode(opmode);
+         }
+         if(tok.substr(0, 19) == "setInterruptEnable:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(19), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(19), nullptr, 0);
+             setInterruptEnable(bits);
+         }
+         if(tok.substr(0, 19) == "setInterruptConfig:") {
+-            u_int8_t bits = (u_int8_t)std::stoul(tok.substr(19), nullptr, 0);
++            uint8_t bits = (uint8_t)std::stoul(tok.substr(19), nullptr, 0);
+             setInterruptConfig(bits);
+         }
+         if(tok.substr(0, 17) == "setRepetitionsXY:") {
+-            u_int8_t reps = (u_int8_t)std::stoul(tok.substr(17), nullptr, 0);
++            uint8_t reps = (uint8_t)std::stoul(tok.substr(17), nullptr, 0);
+             setRepetitionsXY(reps);
+         }
+         if(tok.substr(0, 16) == "setRepetitionsZ:") {
+-            u_int8_t reps = (u_int8_t)std::stoul(tok.substr(16), nullptr, 0);
++            uint8_t reps = (uint8_t)std::stoul(tok.substr(16), nullptr, 0);
+             setRepetitionsZ(reps);
+         }
+         if(tok.substr(0, 14) == "setPresetMode:") {
diff --git a/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch b/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
deleted file mode 100644
index a0a47411d7..0000000000
--- a/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 48a580bd402cf6a3ee9e42013653219bfeb3caf6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 Jun 2018 18:39:16 -0700
-Subject: [PATCH] include sys/types.h for uint definition
-
-uint is defined in sys/types.h, therefore this
-header needs to be included, it gets exposed with
-musl where this header is not getting included indirectly
-as it is happening when building on glibc
-
-Fixes build errors on musl e.g.
-upm/src/kx122/kx122.hpp:456:31: error: 'uint' has not been declared
-|        void setBufferThreshold(uint samples);
-|                                ^~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/intel-iot-devkit/upm/pull/656]
- src/kx122/kx122.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/kx122/kx122.h b/src/kx122/kx122.h
-index 1622ed50..56e5215e 100644
---- a/src/kx122/kx122.h
-+++ b/src/kx122/kx122.h
-@@ -31,6 +31,7 @@ extern "C"{
- #include <assert.h>
- #include <unistd.h>
- #include <math.h>
-+#include <sys/types.h>
- 
- #include <mraa/i2c.h>
- #include <mraa/spi.h>
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 8854a33bcb..a6b379ec36 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -7,13 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 DEPENDS = "libjpeg-turbo mraa"
 
-SRCREV = "dc45cd78595c7c24c8a8574c63bb48b5bb99c5aa"
-PV = "1.6.0-git${SRCPV}"
+SRCREV = "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
+PV = "2.0.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
-           file://0001-Replace-strncpy-with-memcpy.patch \
-           file://0001-include-sys-types.h-for-uint-definition.patch \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
+           file://0001-Use-stdint-types.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.20.1


