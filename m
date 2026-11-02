Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15063.1793633327831822633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=pZUmYy1c;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=O0P3QujF;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793633324; x=1794238124;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=vpZxzMBPtgYJchPDyz3AISrTviYpbuvKtDFXS0CkKTI=;
	b=pZUmYy1c/2bO0PFwcQ3OlhmdnNAQGPEFgCaaqx87VK5WBJyLRtSEKZsm0J+PWcf9BrgKTYAdUgU4K
	 b9hAkGA0T7gHDjHcg9626zoD8oAlwhZV6bMQF2YBAoxK9RtotQLsKlXJHu5TlvHJN4NmBkBe3HZXcq
	 vN4bbhpp4OEEtQx1hHSLwY9EXsnucYbwWuz2E3tzaNCtGPicVoRH/VJqiROONlpKK3LDbmavfvtxvF
	 UGxKdrJGc1fAAnXuXb9g+uk2zxkEfFPC9MxwOk5sH6bYTADNXTxCJxEPfbuXkwyJAjt6xBWCGjB5IX
	 PBTtKwTL0g34qIM3Hj4xSwUPCczdwQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793633324; x=1794238124;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=vpZxzMBPtgYJchPDyz3AISrTviYpbuvKtDFXS0CkKTI=;
	b=O0P3QujFQajmWf3QFLFoMcuBzB73SKFkY13fzuTWXsivqPi20E1sFD5w3g0U4rRDB3nU7FpBVpC5B
	 XANx5VqAg==
X-HalOne-ID: 15b05e6e-d6d2-11f1-9d40-df8125a0c701
Received: from xps-13.fritz.box (unknown [2a02:8070:2788:1201:3ae8:8dff:62fd:6b5f])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 15b05e6e-d6d2-11f1-9d40-df8125a0c701;
	Mon, 02 Nov 2026 15:28:43 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [meta-oe][PATCH v2] leancrypto: add Linux kernel module recipe
Date: Mon,  2 Nov 2026 16:28:41 +0100
Message-ID: <20261102152841.69012-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 16:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131751
Content-Type: text/plain; charset="utf-8"

Add leancrypto-module to build and package leancrypto.ko
independently of the userspace library.

Move common source and license metadata into leancrypto.inc and include the
submitted upstream patch to generate headers using the target kernel
architecture instead of the build host.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 ...t-architecture-for-generated-headers.patch | 164 ++++++++++++++++++
 .../leancrypto/leancrypto-module_1.9.1.bb     |  25 +++
 .../recipes-crypto/leancrypto/leancrypto.inc  |  10 ++
 .../leancrypto/leancrypto_1.9.1.bb            |  22 +--
 4 files changed, 207 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-architecture-for-generated-headers.patch
 create mode 100644 meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
 create mode 100644 meta-oe/recipes-crypto/leancrypto/leancrypto.inc

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-architecture-for-generated-headers.patch b/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-architecture-for-generated-headers.patch
new file mode 100644
index 0000000000..1ce848265e
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-architecture-for-generated-headers.patch
@@ -0,0 +1,164 @@
+From 47aedd8d985b94dc35836925c123cb705985796b Mon Sep 17 00:00:00 2001
+From: Ayoub Zaki <ayoub.zaki@embetrix.com>
+Date: Sun, 1 Nov 2026 16:55:00 +0100
+Subject: [PATCH] linux_kernel: use target architecture for generated headers
+
+Derive the architecture from the target kernel configuration and pass it
+to the AWK generators instead of querying uname -m.
+This prevents cross builds from using the build host's settings.
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/leancrypto/pull/79]
+Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
+---
+ linux_kernel/Kbuild.autogen        | 28 ++++++++++++++++++++++------
+ linux_kernel/README.md             |  8 ++++++++
+ linux_kernel/lc_ascon_hash.awk     |  7 ++-----
+ linux_kernel/lc_hash.h.awk         |  9 +++------
+ linux_kernel/lc_memory_support.awk | 11 ++++-------
+ 5 files changed, 39 insertions(+), 24 deletions(-)
+
+diff --git a/linux_kernel/Kbuild.autogen b/linux_kernel/Kbuild.autogen
+index e5052406d..da6d5d05a 100644
+--- a/linux_kernel/Kbuild.autogen
++++ b/linux_kernel/Kbuild.autogen
+@@ -3,6 +3,17 @@
+ 
+ # Generic support files
+ 
++# Use the target kernel configuration not the build host architecture
++ifdef CONFIG_X86_64
++lc_target_arch := x86_64
++else ifdef CONFIG_ARM
++lc_target_arch := arm
++else ifdef CONFIG_ARM64
++lc_target_arch := aarch64
++else
++lc_target_arch := generic
++endif
++
+ clean-files := $(obj)/lc_memory_support.h $(obj)/lc_hash.h
+ 
+ $(obj)/posix_support.o: $(obj)/lc_memory_support.h
+@@ -10,16 +21,19 @@ $(obj)/posix_support.o: $(obj)/lc_memory_support.h
+ targets += lc_memory_support.h
+ 
+ quiet_cmd_build_lc_memory_support = GEN     $@
+-      cmd_build_lc_memory_support = awk -f $(src)/lc_memory_support.awk $< > $@
+-$(obj)/lc_memory_support.h: $(src)/../internal/api/lc_memory_support.h.in FORCE
++      cmd_build_lc_memory_support = awk -v target_arch=$(lc_target_arch) \
++	-f $(src)/lc_memory_support.awk $< > $@
++$(obj)/lc_memory_support.h: $(src)/../internal/api/lc_memory_support.h.in \
++			  $(src)/lc_memory_support.awk FORCE
+ 	$(call if_changed,build_lc_memory_support)
+ 
+ $(obj)/leancrypto_kernel.o: $(obj)/lc_hash.h
+ targets += lc_hash.h
+ 
+ quiet_cmd_build_lc_hash = GEN     $@
+-      cmd_build_lc_hash = awk -f $(src)/lc_hash.h.awk $< > $@
+-$(obj)/lc_hash.h: $(src)/../hash/api/lc_hash.h.in FORCE
++      cmd_build_lc_hash = awk -v target_arch=$(lc_target_arch) \
++	-f $(src)/lc_hash.h.awk $< > $@
++$(obj)/lc_hash.h: $(src)/../hash/api/lc_hash.h.in $(src)/lc_hash.h.awk FORCE
+ 	$(call if_changed,build_lc_hash)
+ 
+ 
+@@ -103,8 +117,10 @@ clean-files += $(obj)/lc_ascon_hash.h
+ 
+ 
+ quiet_cmd_build_lc_ascon_hash = GEN     $@
+-      cmd_build_lc_ascon_hash = awk -f $(src)/lc_ascon_hash.awk $< > $@
+-$(obj)/lc_ascon_hash.h: $(src)/../hash/api/lc_ascon_hash.h.in FORCE
++      cmd_build_lc_ascon_hash = awk -v target_arch=$(lc_target_arch) \
++	-f $(src)/lc_ascon_hash.awk $< > $@
++$(obj)/lc_ascon_hash.h: $(src)/../hash/api/lc_ascon_hash.h.in \
++		      $(src)/lc_ascon_hash.awk FORCE
+ 	$(call if_changed,build_lc_ascon_hash)
+ 
+ 
+diff --git a/linux_kernel/README.md b/linux_kernel/README.md
+index 45ae377cc..17ff76b16 100644
+--- a/linux_kernel/README.md
++++ b/linux_kernel/README.md
+@@ -21,6 +21,14 @@ directory `linux_kernel`:
+ 
+ 2. the leancrypto library is provided with `leancrypto.ko`
+ 
++For cross-compilation set `KDIR` to the configured and prepared target kernel
++build directory and pass the kernel architecture and compiler prefix:
++
++```sh
++make KDIR=/path/to/target/kernel/build ARCH=arm64 \
++	CROSS_COMPILE=aarch64-linux-gnu-
++```
++
+ ## Build in Tree
+ 
+ When the use of leancrypto as a kernel module is insufficient, e.g. when its
+diff --git a/linux_kernel/lc_ascon_hash.awk b/linux_kernel/lc_ascon_hash.awk
+index e1fed4cf6..e3c048511 100644
+--- a/linux_kernel/lc_ascon_hash.awk
++++ b/linux_kernel/lc_ascon_hash.awk
+@@ -1,9 +1,6 @@
+-# Set the Ascon memory size
+-BEGIN {
+-	"uname -m" | getline host
+-}
++# Set the Ascon memory size for target_arch
+ {
+-	if (host=="x86_64") {
++	if (target_arch=="x86_64") {
+ 		gsub("mesondefine LC_DEF_ASCON_AVX512", "define LC_DEF_ASCON_AVX512", $0) ;
+ 	} else {
+ 		gsub("mesondefine LC_DEF_ASCON_AVX512", "undef LC_DEF_ASCON_AVX512", $0) ;
+diff --git a/linux_kernel/lc_hash.h.awk b/linux_kernel/lc_hash.h.awk
+index d26e36304..0a83bade2 100644
+--- a/linux_kernel/lc_hash.h.awk
++++ b/linux_kernel/lc_hash.h.awk
+@@ -1,9 +1,6 @@
+-# Set the hash alignment value
+-BEGIN {
+-	"uname -m" | getline host
+-}
++# Set the hash alignment value for target_arch
+ {
+-	if (host=="x86_64") {
++	if (target_arch=="x86_64") {
+ 		# This value has to be limited to 32 as otherwise the hash
+ 		# algorithms fail to register since their state is larger than
+ 		# HASH_MAX_DESCSIZE - this is an arbitrary defined value in
+@@ -14,7 +11,7 @@ BEGIN {
+ 		# implementation as it requires an alignment of the buffer to
+ 		# 512 bits.
+ 		gsub("@hash_common_alignment@", "32", $0) ;
+-	} else if (host=="arm") {
++	} else if (target_arch=="arm") {
+ 		gsub("@hash_common_alignment@", "32", $0) ;
+ 	} else {
+ 		gsub("@hash_common_alignment@", "8", $0) ;
+diff --git a/linux_kernel/lc_memory_support.awk b/linux_kernel/lc_memory_support.awk
+index b3480a7e2..4b346a742 100644
+--- a/linux_kernel/lc_memory_support.awk
++++ b/linux_kernel/lc_memory_support.awk
+@@ -1,17 +1,14 @@
+-# Set the XOR alignment value
+-BEGIN {
+-	"uname -m" | getline host
+-}
++# Set the XOR alignment value for target_arch
+ {
+-	if (host=="x86_64") {
++	if (target_arch=="x86_64") {
+ 		gsub("mesondefine LC_DEF_HOST_X86_64", "define LC_DEF_HOST_X86_64", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "undef LC_DEF_HOST_ARM32_NEON", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_AARCH64", "undef LC_DEF_HOST_AARCH64", $0) ;
+-	} else if (host=="arm") {
++	} else if (target_arch=="arm") {
+ 		gsub("mesondefine LC_DEF_HOST_X86_64", "undef LC_DEF_HOST_X86_64", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "define LC_DEF_HOST_ARM32_NEON", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_AARCH64", "undef LC_DEF_HOST_AARCH64", $0) ;
+-	} else if (host=="aarch64") {
++	} else if (target_arch=="aarch64") {
+ 		gsub("mesondefine LC_DEF_HOST_X86_64", "undef LC_DEF_HOST_X86_64", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "undef LC_DEF_HOST_ARM32_NEON", $0) ;
+ 		gsub("mesondefine LC_DEF_HOST_AARCH64", "define LC_DEF_HOST_AARCH64", $0) ;
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
new file mode 100644
index 0000000000..ea74347792
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Leancrypto Linux kernel module"
+DESCRIPTION = "Standalone Linux kernel module providing PQC-resistant algorithms"
+
+require leancrypto.inc
+
+SRC_URI += "file://0001-linux_kernel-use-target-architecture-for-generated-headers.patch"
+
+inherit module
+
+B = "${S}/linux_kernel"
+
+MAKE_TARGETS = "modules"
+# Also apply when a custom Kbuild.config is supplied
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR} \
+                 CONFIG_LEANCRYPTO=m \
+                 CONFIG_LEANCRYPTO_TEST_MODULES=n \
+"
+
+# Supply Kbuild.config to SRC_URI in a bbappend to select algorithms
+# Otherwise retain upstream settings
+do_configure() {
+    if [ -f ${UNPACKDIR}/Kbuild.config ]; then
+        install -m 0644 ${UNPACKDIR}/Kbuild.config ${B}/Kbuild.config
+    fi
+}
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto.inc b/meta-oe/recipes-crypto/leancrypto/leancrypto.inc
new file mode 100644
index 0000000000..fdccdb5a77
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto.inc
@@ -0,0 +1,10 @@
+HOMEPAGE = "https://leancrypto.org"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=581f53c96a634ae7f241516370a8f1ee \
+    file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
+    file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
+"
+
+SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
index 17f7f0a7f7..b732fc5764 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
@@ -3,21 +3,15 @@ DESCRIPTION = "leancrypto is a cryptographic library that exclusively contains \
 PQC-resistant cryptographic algorithms. It is lean, has minimal dependencies, \
 supports stack-only operation and provides optimized implementations for \
 ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
-HOMEPAGE = "https://leancrypto.org"
-LICENSE = "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=581f53c96a634ae7f241516370a8f1ee \
-    file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
-    file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
-    "
 SECTION = "libs"
-SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
-           file://leancrypto-tests.sh \
-           file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
-           file://0002-Linker-script-Handle-a-missing-.init-section.patch \
-           file://0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch \
-           "
-SRCREV = "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"
+
+require leancrypto.inc
+
+SRC_URI += "file://leancrypto-tests.sh \
+            file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
+            file://0002-Linker-script-Handle-a-missing-.init-section.patch \
+            file://0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch \
+"
 
 inherit pkgconfig meson
 
-- 
2.53.0

