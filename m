Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UNrDV-0007jr-1K
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 22:57:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DD2C0D20D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 22:40:00 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 22:39:51 +0200
Message-Id: <1365107991-16963-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1365106410-9481-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1365106410-9481-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH v2] libvpx: do not hardcode -mfloat-api=softfp for ARM builds
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
X-List-Received-Date: Thu, 04 Apr 2013 20:57:05 -0000

| Configuring for target 'armv7-linux-gcc'
|   enabling armv7
|   enabling armv6
|   enabling armv5te
|   enabling fast_unaligned
| Unable to invoke compiler: arm-oe-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv7a -O2 -pipe -g -feliminate-unused-debug-types -fPIC -march=armv7-a -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -O3 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wdeclaration-after-statement -Wdisabled-optimization -Wpointer-arith -Wtype-limits -Wcast-qual -Wno-unused
|
| Configuration failed. This could reflect a misconfiguration of your
| toolchains, improper options selected, or another problem. If you
| don't see any useful error messages above, the next step is to look
| at the configure error log file (config.err) to determine what
| configure was trying to do when it died.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../libvpx/do-not-hardcode-softfp-float-api.patch  | 28 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch b/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch
new file mode 100644
index 0000000..d871694
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float-api.patch
@@ -0,0 +1,28 @@
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: Inappopriate [upstream has it done in other way]
+
+Problem is solved upstream but we have quite old version so backporting patches
+is waste of time.
+
+---
+ build/make/configure.sh |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- libvpx-v0.9.5.orig/build/make/configure.sh
++++ libvpx-v0.9.5/build/make/configure.sh
+@@ -659,12 +659,12 @@ process_common_toolchain() {
+         if enabled iwmmxt || enabled iwmmxt2
+             then
+                 check_add_asflags -mcpu=${tgt_isa}
+             elif enabled armv7
+             then
+-                check_add_cflags -march=armv7-a -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp  #-ftree-vectorize
+-        check_add_asflags -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp  #-march=armv7-a
++                check_add_cflags -march=armv7-a -mcpu=cortex-a8 -mfpu=neon   #-ftree-vectorize
++        check_add_asflags -mcpu=cortex-a8 -mfpu=neon   #-march=armv7-a
+             else
+                 check_add_cflags -march=${tgt_isa}
+                 check_add_asflags -march=${tgt_isa}
+             fi
+ 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb b/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
index 2236524..878d5e2 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6e8dee932c26f2dab503abf70c96d8bb"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://libvpx-configure-support-blank-prefix.patch \
+            file://do-not-hardcode-softfp-float-api.patch \
             file://CVE-2010-4203.patch \
             "
 
-- 
1.8.1.2



