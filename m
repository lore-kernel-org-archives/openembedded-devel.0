Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEE47914A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:32:42 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id y130-v6so4740651yby.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y6Nt8qrWeX8yISWUgHBXg0QzGbiBcN1PgG5OTydX9co=;
	b=dXSsCYeGvMlqSbbl7dV1OZja+TYhOyRnlOq4pp9rwfWna6kQs5FV6YGb2IRykyY+6D
	oYvtaVZxIjZKSaa6/NIIlZnfGUnA5HQ9rNFlpMq00Q/rgFitYY8Y9IZXdN9G2k1D8P4U
	rWq9rtyICJbeVwLD0AqT/Da38oH3RZn9Nqs81/mmae/kAT+21Pft6pnc+dmh25q+ByIB
	wWYTGNgDcYNS269nOeS2ks910mLldglzXZCjSHNuJ/mV2hj3nXItiOHV7wA2CS1uwuQZ
	YDCzVy1WquAwR8KRrn4Allycz0vjvefmnalVPM5/tGLS/tO1weA+4xpCu7uMLfjXrO9G
	CeLA==
X-Gm-Message-State: AOUpUlGNICdU1yAmc0vlOI5Q0Du++tEdNwewLKI2aMuVtDX5g4+c3lC4
	0uvaUR49rhfi75+uZ8U2TkMS/WL1
X-Google-Smtp-Source: AA+uWPyD73cEo6EtnhMrakrXhKJXVob0kG3pc6gQ3OtVSs407bcsHqzmmHG1gTJdJXGZ0kkz0GM2QQ==
X-Received: by 2002:a25:8685:: with SMTP id
	z5-v6mr26091767ybk.458.1534779162839; 
	Mon, 20 Aug 2018 08:32:42 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z193-v6sm1496775ywd.90.2018.08.20.08.32.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:32:42 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:32:34 +0100
Message-Id: <20180820153234.10990-5-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153234.10990-1-git@andred.net>
References: <20180820153234.10990-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 5/5] openjdk-8: add aarch32 port 8u172b11
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
X-List-Received-Date: Mon, 20 Aug 2018 15:32:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the aarch64 build, we import the specific aarch32 port when
building for ARMv7. We also add all the necessary patches to:
* compile using gcc v8
* compile against musl

This was tested on:
* QEMU with cortex A7 emulation (using glibc)
* real hardware (using musl)

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2: add missing signed-off-by
---
 .../openjdk-8-release-172b11-aarch32.inc      | 58 +++++++++++++++++++
 .../openjdk-8-release-172b11-aarch64.inc      |  2 +
 .../openjdk-8-release-172b11-common.inc       | 34 +++++++++--
 .../openjdk/openjdk-8-release-172b11.inc      |  7 ++-
 recipes-core/openjdk/openjdk-8_172b11.bb      |  2 +
 recipes-core/openjdk/openjre-8_172b11.bb      |  2 +
 ...ot-aarch32-fix-missing-return-values.patch | 53 +++++++++++++++++
 ...-hotspot-disable-agent-build-common.patch} | 41 ++-----------
 ...spot-disable-agent-build-pt2-aarch32.patch | 51 ++++++++++++++++
 ...0005-hotspot-disable-agent-build-pt2.patch | 51 ++++++++++++++++
 ...ux-remove-glibc-dependencies-common.patch} | 19 +-----
 ...-remove-glibc-dependencies-pt2-aarch.patch | 36 ++++++++++++
 ..._linux-remove-glibc-dependencies-pt2.patch | 34 +++++++++++
 ... => openjdk8-fix-shark-build-common.patch} | 38 ------------
 ...openjdk8-fix-shark-build-pt2-aarch32.patch | 11 ++++
 .../openjdk8-fix-shark-build-pt2.patch        | 38 ++++++++++++
 16 files changed, 379 insertions(+), 98 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch
 rename recipes-core/openjdk/patches-openjdk-8/{musl-0005-hotspot-disable-agent-build.patch => musl-0005-hotspot-disable-agent-build-common.patch} (55%)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2.patch
 rename recipes-core/openjdk/patches-openjdk-8/{musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch => musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch} (79%)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch
 rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build.patch => openjdk8-fix-shark-build-common.patch} (93%)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
new file mode 100644
index 0000000..9cc2083
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
@@ -0,0 +1,58 @@
+require openjdk-8-release-172b11-common.inc
+
+COMPATIBLE_HOST = "^$"
+COMPATIBLE_HOST_armv7a = "arm"
+COMPATIBLE_HOST_armv7ve = "arm"
+
+CORBA_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[corba.md5sum] = "557b94847d8fade14c048cb0a96ed035"
+SRC_URI[corba.sha256sum] = "366fa9aaf11d75f74e8c6bdf9cab9214cf66b0eac1ca40f2789b3ba442929708"
+
+HOTSPOT_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[hotspot.md5sum] = "37d796794234f38fa71339ba78368b80"
+SRC_URI[hotspot.sha256sum] = "5f89f8ba9a099a2d84b4ca6bd49553ce4efe1b29d55de9134809b7b59b6c9ce3"
+
+JAXP_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[jaxp.md5sum] = "2dc311a7c0d6483226cdc5e501b1f8d0"
+SRC_URI[jaxp.sha256sum] = "f62db09a41213b5b5d1886c1aeabe43def09235de1d60af518213b9acea4fdca"
+
+JAXWS_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[jaxws.md5sum] = "fbd81e288d1ee5df631f213c130f21bb"
+SRC_URI[jaxws.sha256sum] = "bac66e848ee48c6fef6130db4bb6879dbd64c550c1f42e4676ab6a2c3ee4fab8"
+
+JDK_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[jdk.md5sum] = "b8003e6f1714617461f3eb7ee8b1efee"
+SRC_URI[jdk.sha256sum] = "0a7eef6fef2b457bef3bd1d24031234bbb9d74a5fca2f65e1603278cd9d393a0"
+
+LANGTOOLS_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[langtools.md5sum] = "e38f50b0113b3a956ac4917720655e93"
+SRC_URI[langtools.sha256sum] = "9ca88fcfe5a07861de693ff3b38d03f063a7937576cd93116ea6b4a4bd7894d5"
+
+NASHORN_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[nashorn.md5sum] = "c191cc92996fcb271254fc0a4f3eb7c9"
+SRC_URI[nashorn.sha256sum] = "853bb3162fefa989fa0c31848cb990d8e5698ccd8a2a336dbf98bde35eb5241d"
+
+OPENJDK_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
+SRC_URI[openjdk.md5sum] = "25398ccf25633a878dca54a8d606e48e"
+SRC_URI[openjdk.sha256sum] = "8c8e515ebcceded4b90187b4bdaf129b63ae6e64ddfe4f05a60df0694235b9e7"
+
+PACKAGECONFIG_append_armv7a = " client"
+PACKAGECONFIG_append_armv7ve = " client"
+
+do_install_append() {
+    if [ -d ${D}${JDK_HOME} ] ; then
+        sed -e 's,^\(-server ERROR$\),# \1,' \
+            -e 's,^-client IGNORE,-client ERROR,' \
+            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
+            -i ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+    if [ -d ${D}${JRE_HOME} ] ; then
+        sed -e 's,^\(-server ERROR$\),# \1,' \
+            -e 's,^-client IGNORE,-client ERROR,' \
+            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
+            -i ${D}${JRE_HOME}/lib/${JDK_ARCH}/jvm.cfg
+    fi
+}
+
+JDK_ARCH_armv7a = "aarch32"
+JDK_ARCH_armv7ve = "aarch32"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
index dddae6a..f0f4655 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
@@ -1,5 +1,7 @@
 require openjdk-8-release-172b11-common.inc
 
+COMPATIBLE_HOST = "aarch64"
+
 CORBA_CHANGESET_aarch64 = "3a04a7c080af"
 SRC_URI[corba.md5sum] = "758b29d6cf714fd894df8674afd78e17"
 SRC_URI[corba.sha256sum] = "564113dbeadc57ac5831ccc056e0b920adbd3b74558cf750aa899f5de25ceb5e"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index 8e94a4f..f736bd3 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -33,30 +33,50 @@ HOTSPOT_UB_PATCH_prepend_aarch64 = "\
     file://0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch \
     file://0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch \
 "
+HOTSPOT_UB_PATCH_append_armv7a = " file://0001-hotspot-aarch32-fix-missing-return-values.patch"
+HOTSPOT_UB_PATCH_append_armv7ve = " file://0001-hotspot-aarch32-fix-missing-return-values.patch"
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
 # by Roman Kennke (rkennke at redhat.com)
 LIBPNG_NEON_PATCH = "file://openjdk8-fix-libpng-neon-build.patch;striplevel=0"
 LIBPNG_NEON_PATCH_aarch64 = ""
+
 PATCHES_URI_append_class-target = "\
     file://openjdk8-restrict-to-staging-dir.patch;striplevel=0 \
-    file://openjdk8-fix-shark-build.patch;striplevel=0 \
+    file://openjdk8-fix-shark-build-common.patch;striplevel=0 \
+    ${FIX_SHARK_BUILD_PT2_PATCH} \
     file://openjdk8-fix-shark-stdc++11.patch;striplevel=0 \
     file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;striplevel=0 \
     file://openjdk8-fix-adlc-flags.patch;striplevel=0 \
     file://openjdk8-add-missing-linker-flags.patch;striplevel=0 \
 "
+FIX_SHARK_BUILD_PT2_PATCH = "file://openjdk8-fix-shark-build-pt2.patch;striplevel=0"
+FIX_SHARK_BUILD_PT2_PATCH_armv7a = "file://openjdk8-fix-shark-build-pt2-aarch32.patch;striplevel=0"
+FIX_SHARK_BUILD_PT2_PATCH_armv7ve = "file://openjdk8-fix-shark-build-pt2-aarch32.patch;striplevel=0"
+
 PATCHES_URI_append_libc-musl = "\
-    file://musl-0001-hotspot-stop-using-obsolete-isnanf.patch \
+    ${OBSOLETE_ISNANF_PATCH} \
     file://musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch \
     file://musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch \
     file://musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch \
-    file://musl-0005-hotspot-disable-agent-build.patch \
-    file://musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch \
+    file://musl-0005-hotspot-disable-agent-build-common.patch \
+    ${DISABLE_AGENT_BUILD_PT2} \
+    file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch \
+    ${REMOVE_GLIBC_DEPENDENCIES_PT2} \
     file://musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch \
     file://musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch \
     file://musl-0009-jdk-musl-has-gethostby_r.patch \
 "
+OBSOLETE_ISNANF_PATCH = "file://musl-0001-hotspot-stop-using-obsolete-isnanf.patch"
+OBSOLETE_ISNANF_PATCH_armv7a = ""
+OBSOLETE_ISNANF_PATCH_armv7ve = ""
+DISABLE_AGENT_BUILD_PT2 = "file://musl-0005-hotspot-disable-agent-build-pt2.patch"
+DISABLE_AGENT_BUILD_PT2_armv7a = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
+DISABLE_AGENT_BUILD_PT2_armv7ve = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
+REMOVE_GLIBC_DEPENDENCIES_PT2 = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch"
+REMOVE_GLIBC_DEPENDENCIES_PT2_armv7a = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
+REMOVE_GLIBC_DEPENDENCIES_PT2_armv7ve = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
+
 PATCHES_URI_append_libc-musl_aarch64 = " file://hotspot-remaining-musl-fixes-aarch64.patch"
 
 # Name of the directory containing the compiled output
@@ -72,10 +92,14 @@ BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
 TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"
 
 # Enable zero mode for arm based builds, as normal hotspot fails to build
-PACKAGECONFIG_append_arm = " zero"
+PACKAGECONFIG_append_armv4 = " zero"
+PACKAGECONFIG_append_armv5 = " zero"
+PACKAGECONFIG_append_armv6 = " zero"
 
 OPENJDK_ARCH_PORT = "jdk8u"
 OPENJDK_ARCH_PORT_aarch64 = "aarch64-port"
+OPENJDK_ARCH_PORT_armv7a = "aarch32-port"
+OPENJDK_ARCH_PORT_armv7ve = "aarch32-port"
 OPENJDK_HG_U = "jdk8u"
 OPENJDK_HG_URL = "http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
 
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11.inc b/recipes-core/openjdk/openjdk-8-release-172b11.inc
index fdf7b39..b308e50 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11.inc
@@ -1,7 +1,10 @@
 require openjdk-8-release-172b11-common.inc
 
-# We do not yet work for aarch64.
-COMPATIBLE_HOST = "^(?!aarch64).*"
+# We do not yet work for aarch64, and we make sure
+# to use the aarch32 port for ARMv7.
+COMPATIBLE_HOST = "^(?!(aarch64)).*$"
+COMPATIBLE_HOST_armv7a = "^$"
+COMPATIBLE_HOST_armv7ve = "^$"
 
 CORBA_CHANGESET = "875a75c440cd"
 SRC_URI[corba.md5sum] = "66242dd6e749f39a5ef6add34f5ecb2f"
diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
index 9c2a7a1..c1c6e1e 100644
--- a/recipes-core/openjdk/openjdk-8_172b11.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -1,5 +1,7 @@
 INC_FILE_SUFFIX = ""
 INC_FILE_SUFFIX_aarch64 = "-aarch64"
+INC_FILE_SUFFIX_armv7a = "-aarch32"
+INC_FILE_SUFFIX_armv7ve = "-aarch32"
 require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index 220dc01..dd29691 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -1,5 +1,7 @@
 INC_FILE_SUFFIX = ""
 INC_FILE_SUFFIX_aarch64 = "-aarch64"
+INC_FILE_SUFFIX_armv7a = "-aarch32"
+INC_FILE_SUFFIX_armv7ve = "-aarch32"
 require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch
new file mode 100644
index 0000000..bedc448
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch
@@ -0,0 +1,53 @@
+From 658adc5b6567e9a6df56beabb8d226a9b4d8e762 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Thu, 16 Aug 2018 02:27:44 +0100
+Subject: [PATCH] hotspot/aarch32: fix missing return values
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp | 3 +++
+ hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp       | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp b/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
+index cd291bf2..4ba98c68 100644
+--- a/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
++++ b/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
+@@ -158,16 +158,19 @@ static Register as_reg(LIR_Opr op) {
+ Address LIR_Assembler::as_Address(LIR_Address* addr) {
+   // as_Address(LIR_Address*, Address::InsnDataType) should be used instead
+   ShouldNotCallThis();
++  return Address();
+ }
+ 
+ Address LIR_Assembler::as_Address_hi(LIR_Address* addr) {
+   // as_Address_hi(LIR_Address*, Address::InsnDataType) should be used instead
+   ShouldNotCallThis();
++  return Address();
+ }
+ 
+ Address LIR_Assembler::as_Address_lo(LIR_Address* addr) {
+   // as_Address_lo(LIR_Address*, Address::InsnDataType) should be used instead
+   ShouldNotCallThis();
++  return Address();
+ }
+ 
+ Address LIR_Assembler::as_Address(LIR_Address* addr, Register tmp, Address::InsnDataType type) {
+diff --git a/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp b/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
+index 979d53c9..c0b1a4c7 100644
+--- a/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
++++ b/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
+@@ -87,6 +87,7 @@ address Relocation::pd_call_destination(address orig_addr) {
+   }
+ 
+   ShouldNotReachHere();
++  return NULL;
+ }
+ 
+ void Relocation::pd_set_call_destination(address x) {
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-common.patch
similarity index 55%
rename from recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch
rename to recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-common.patch
index 24342b5..9126495 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-common.patch
@@ -1,7 +1,7 @@
 From 19b1d6b4dc64a1c44a8f90776a489eee5c76463d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:12:08 +0000
-Subject: [PATCH 5/9] hotspot: disable agent build
+Subject: [PATCH] hotspot: disable agent build (common)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -11,25 +11,10 @@ the agent needs thread_db, which doesn't exist in musl
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: André Draszik <andre.draszik@jci.com>
 ---
- common/autoconf/jdk-options.m4           | 2 +-
- hotspot/make/linux/makefiles/defs.make   | 4 ++++
- hotspot/make/linux/makefiles/sa.make     | 2 +-
- hotspot/make/linux/makefiles/saproc.make | 2 ++
- 4 files changed, 8 insertions(+), 2 deletions(-)
+ hotspot/make/linux/makefiles/defs.make | 4 ++++
+ hotspot/make/linux/makefiles/sa.make   | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/common/autoconf/jdk-options.m4 b/common/autoconf/jdk-options.m4
-index a8f71705..036963ac 100644
---- a/common/autoconf/jdk-options.m4
-+++ b/common/autoconf/jdk-options.m4
-@@ -151,7 +151,7 @@ AC_DEFUN_ONCE([JDKOPT_SETUP_JVM_VARIANTS],
-   AC_SUBST(JVM_VARIANT_ZEROSHARK)
-   AC_SUBST(JVM_VARIANT_CORE)
- 
--  INCLUDE_SA=true
-+  INCLUDE_SA=false
-   if test "x$JVM_VARIANT_ZERO" = xtrue ; then
-     INCLUDE_SA=false
-   fi
 diff --git a/hotspot/make/linux/makefiles/defs.make b/hotspot/make/linux/makefiles/defs.make
 index 3af5878a..d10bab95 100644
 --- a/hotspot/make/linux/makefiles/defs.make
@@ -65,24 +50,6 @@ index 66a7b945..61cc7244 100644
  	   $(MAKE) -f sa.make $(GENERATED)/sa-jdi.jar; \
  	fi
  
-diff --git a/hotspot/make/linux/makefiles/saproc.make b/hotspot/make/linux/makefiles/saproc.make
-index 6579c8e1..8f29004c 100644
---- a/hotspot/make/linux/makefiles/saproc.make
-+++ b/hotspot/make/linux/makefiles/saproc.make
-@@ -62,11 +62,13 @@ endif
- # if $(AGENT_DIR) does not exist, we don't build SA
- # also, we don't build SA on Itanium or zero.
- 
-+ifeq (0,1)
- ifneq ($(wildcard $(AGENT_DIR)),)
- ifneq ($(filter-out ia64 zero,$(SRCARCH)),)
-   BUILDLIBSAPROC = $(LIBSAPROC)
- endif
- endif
-+endif
- 
- ifneq ($(ALT_SASRCDIR),)
- ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
 -- 
 2.16.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch
new file mode 100644
index 0000000..cb893e5
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch
@@ -0,0 +1,51 @@
+From 5fa42493fd2dafb3bf9cf5a8a2be57e743eeafb8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Wed, 15 Aug 2018 13:50:04 +0100
+Subject: [PATCH] hotspot: disable agent build (pt2: aarch32)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+the agent needs thread_db, which doesn't exist in musl
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ common/autoconf/jdk-options.m4           | 2 +-
+ hotspot/make/linux/makefiles/saproc.make | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/common/autoconf/jdk-options.m4 b/common/autoconf/jdk-options.m4
+index 56fa4198..4675f0b5 100644
+--- a/common/autoconf/jdk-options.m4
++++ b/common/autoconf/jdk-options.m4
+@@ -151,7 +151,7 @@ AC_DEFUN_ONCE([JDKOPT_SETUP_JVM_VARIANTS],
+   AC_SUBST(JVM_VARIANT_ZEROSHARK)
+   AC_SUBST(JVM_VARIANT_CORE)
+ 
+-  INCLUDE_SA=true
++  INCLUDE_SA=false
+   if test "x$JVM_VARIANT_ZERO" = xtrue; then
+     INCLUDE_SA=false
+   fi
+diff --git a/hotspot/make/linux/makefiles/saproc.make b/hotspot/make/linux/makefiles/saproc.make
+index ea52011e..f87d2cdb 100644
+--- a/hotspot/make/linux/makefiles/saproc.make
++++ b/hotspot/make/linux/makefiles/saproc.make
+@@ -62,11 +62,13 @@ endif
+ # if $(AGENT_DIR) does not exist, we don't build SA
+ # also, we don't build SA on Itanium or zero.
+ 
++ifeq (0,1)
+ ifneq ($(wildcard $(AGENT_DIR)),)
+ ifneq ($(filter-out aarch32 ia64 zero,$(SRCARCH)),)
+   BUILDLIBSAPROC = $(LIBSAPROC)
+ endif
+ endif
++endif
+ 
+ ifneq ($(ALT_SASRCDIR),)
+ ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2.patch
new file mode 100644
index 0000000..4b0b0f0
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build-pt2.patch
@@ -0,0 +1,51 @@
+From 19b1d6b4dc64a1c44a8f90776a489eee5c76463d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Tue, 27 Feb 2018 15:12:08 +0000
+Subject: [PATCH] hotspot: disable agent build (pt2)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+the agent needs thread_db, which doesn't exist in musl
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ common/autoconf/jdk-options.m4           | 2 +-
+ hotspot/make/linux/makefiles/saproc.make | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/common/autoconf/jdk-options.m4 b/common/autoconf/jdk-options.m4
+index a8f71705..036963ac 100644
+--- a/common/autoconf/jdk-options.m4
++++ b/common/autoconf/jdk-options.m4
+@@ -151,7 +151,7 @@ AC_DEFUN_ONCE([JDKOPT_SETUP_JVM_VARIANTS],
+   AC_SUBST(JVM_VARIANT_ZEROSHARK)
+   AC_SUBST(JVM_VARIANT_CORE)
+ 
+-  INCLUDE_SA=true
++  INCLUDE_SA=false
+   if test "x$JVM_VARIANT_ZERO" = xtrue ; then
+     INCLUDE_SA=false
+   fi
+diff --git a/hotspot/make/linux/makefiles/saproc.make b/hotspot/make/linux/makefiles/saproc.make
+index 6579c8e1..8f29004c 100644
+--- a/hotspot/make/linux/makefiles/saproc.make
++++ b/hotspot/make/linux/makefiles/saproc.make
+@@ -62,11 +62,13 @@ endif
+ # if $(AGENT_DIR) does not exist, we don't build SA
+ # also, we don't build SA on Itanium or zero.
+ 
++ifeq (0,1)
+ ifneq ($(wildcard $(AGENT_DIR)),)
+ ifneq ($(filter-out ia64 zero,$(SRCARCH)),)
+   BUILDLIBSAPROC = $(LIBSAPROC)
+ endif
+ endif
++endif
+ 
+ ifneq ($(ALT_SASRCDIR),)
+ ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
+-- 
+2.16.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch
similarity index 79%
rename from recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch
rename to recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch
index 4abd558..74cd422 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch
@@ -1,16 +1,11 @@
 From a02a9fbc3f1fed181504bdb5b0a16863247f92fc Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 10:11:51 +0000
-Subject: [PATCH 6/9] hotspot: os_linux: remove glibc dependencies
+Subject: [PATCH] hotspot: os_linux: remove glibc dependencies (common)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-* gnu/libc-version.h doesn't exist in musl
-    | hotspot/src/os/linux/vm/os_linux.cpp:97:11: fatal error: gnu/libc-version.h: No such file or directory
-    |  # include <gnu/libc-version.h>
-    |            ^~~~~~~~~~~~~~~~~~~~
-
 * dlvsym() is a GNU extension and doesn't exist in musl
     | hotspot/src/os/linux/vm/os_linux.cpp:2846:13: error: 'dlvsym' was not declared in this scope
     |    void *f = dlvsym(handle, name, "libnuma_1.1");
@@ -23,21 +18,13 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: André Draszik <andre.draszik@jci.com>
 ---
- hotspot/src/os/linux/vm/os_linux.cpp | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
+ hotspot/src/os/linux/vm/os_linux.cpp | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
 
 diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
 index 044a70a6..3137796a 100644
 --- a/hotspot/src/os/linux/vm/os_linux.cpp
 +++ b/hotspot/src/os/linux/vm/os_linux.cpp
-@@ -94,7 +94,6 @@
- # include <string.h>
- # include <syscall.h>
- # include <sys/sysinfo.h>
--# include <gnu/libc-version.h>
- # include <sys/ipc.h>
- # include <sys/shm.h>
- # include <link.h>
 @@ -530,6 +529,13 @@ void os::Linux::hotspot_sigmask(Thread* thread) {
  // detecting pthread library
  
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch
new file mode 100644
index 0000000..512af52
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch
@@ -0,0 +1,36 @@
+From 2915f7f56b99fa130942acb4289c9b5310075adc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Fri, 2 Mar 2018 10:11:51 +0000
+Subject: [PATCH] hotspot: os_linux: remove glibc dependencies (pt2: aarch32)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* gnu/libc-version.h doesn't exist in musl
+    | hotspot/src/os/linux/vm/os_linux.cpp:97:11: fatal error: gnu/libc-version.h: No such file or directory
+    |  # include <gnu/libc-version.h>
+    |            ^~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ hotspot/src/os/linux/vm/os_linux.cpp | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
+index 8656357d..555b3a15 100644
+--- a/hotspot/src/os/linux/vm/os_linux.cpp
++++ b/hotspot/src/os/linux/vm/os_linux.cpp
+@@ -94,9 +94,6 @@
+ # include <string.h>
+ # include <syscall.h>
+ # include <sys/sysinfo.h>
+-#ifndef __UCLIBC__
+-# include <gnu/libc-version.h>
+-#endif
+ # include <sys/ipc.h>
+ # include <sys/shm.h>
+ # include <link.h>
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch
new file mode 100644
index 0000000..91a653c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch
@@ -0,0 +1,34 @@
+From a02a9fbc3f1fed181504bdb5b0a16863247f92fc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Fri, 2 Mar 2018 10:11:51 +0000
+Subject: [PATCH] hotspot: os_linux: remove glibc dependencies (common)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* gnu/libc-version.h doesn't exist in musl
+    | hotspot/src/os/linux/vm/os_linux.cpp:97:11: fatal error: gnu/libc-version.h: No such file or directory
+    |  # include <gnu/libc-version.h>
+    |            ^~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ hotspot/src/os/linux/vm/os_linux.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
+index 044a70a6..3137796a 100644
+--- a/hotspot/src/os/linux/vm/os_linux.cpp
++++ b/hotspot/src/os/linux/vm/os_linux.cpp
+@@ -94,7 +94,6 @@
+ # include <string.h>
+ # include <syscall.h>
+ # include <sys/sysinfo.h>
+-# include <gnu/libc-version.h>
+ # include <sys/ipc.h>
+ # include <sys/shm.h>
+ # include <link.h>
+-- 
+2.16.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch
similarity index 93%
rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch
rename to recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch
index f241361..ece7f14 100644
--- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch
@@ -92,19 +92,6 @@
      _thread->metadata_handles()->push((Metadata*)_value);              \
    } else {                                                             \
      _thread = NULL;                                                    \
---- hotspot/src/cpu/zero/vm/entry_zero.hpp.orig
-+++ hotspot/src/cpu/zero/vm/entry_zero.hpp
-@@ -26,6 +26,10 @@
- #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
- #define CPU_ZERO_VM_ENTRY_ZERO_HPP
- 
-+#include "utilities/globalDefinitions.hpp"
-+#include "utilities/exceptions.hpp"
-+#include "interpreter/cppInterpreter.hpp"
-+
- class ZeroEntry {
-  public:
-   ZeroEntry() {
 --- hotspot/src/share/vm/shark/sharkEntry.hpp.orig
 +++ hotspot/src/share/vm/shark/sharkEntry.hpp
 @@ -27,6 +27,7 @@
@@ -115,31 +102,6 @@
  
  class SharkContext;
  
---- hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp.orig
-+++ hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp
-@@ -30,6 +30,10 @@
- 
- #ifdef CC_INTERP
- 
-+#ifdef TARGET_ARCH_zero
-+#include "entry_zero.hpp"
-+#endif
-+
- class CppInterpreterGenerator: public AbstractInterpreterGenerator {
-   protected:
-   // shared code sequences
---- hotspot/src/cpu/zero/vm/nativeInst_zero.cpp.orig
-+++ hotspot/src/cpu/zero/vm/nativeInst_zero.cpp
-@@ -26,6 +26,9 @@
- #include "precompiled.hpp"
- #include "assembler_zero.inline.hpp"
- #include "memory/resourceArea.hpp"
-+#ifdef CC_INTERP
-+#include "entry_zero.hpp"
-+#endif
- #include "nativeInst_zero.hpp"
- #include "oops/oop.inline.hpp"
- #include "runtime/handles.hpp"
 --- hotspot/src/share/vm/shark/llvmHeaders.hpp.orig
 +++ hotspot/src/share/vm/shark/llvmHeaders.hpp
 @@ -35,7 +35,11 @@
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch
new file mode 100644
index 0000000..b09745c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch
@@ -0,0 +1,11 @@
+--- hotspot/src/cpu/zero/vm/entry_zero.hpp
++++ hotspot/src/cpu/zero/vm/entry_zero.hpp
+@@ -26,6 +26,8 @@
+ #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
+ #define CPU_ZERO_VM_ENTRY_ZERO_HPP
+ 
++#include "utilities/globalDefinitions.hpp"
++#include "utilities/exceptions.hpp"
+ #include "interpreter/cppInterpreter.hpp"
+ 
+ class ZeroEntry {
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
new file mode 100644
index 0000000..018640b
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
@@ -0,0 +1,38 @@
+--- hotspot/src/cpu/zero/vm/entry_zero.hpp.orig
++++ hotspot/src/cpu/zero/vm/entry_zero.hpp
+@@ -26,6 +26,10 @@
+ #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
+ #define CPU_ZERO_VM_ENTRY_ZERO_HPP
+ 
++#include "utilities/globalDefinitions.hpp"
++#include "utilities/exceptions.hpp"
++#include "interpreter/cppInterpreter.hpp"
++
+ class ZeroEntry {
+  public:
+   ZeroEntry() {
+--- hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp.orig
++++ hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp
+@@ -30,6 +30,10 @@
+ 
+ #ifdef CC_INTERP
+ 
++#ifdef TARGET_ARCH_zero
++#include "entry_zero.hpp"
++#endif
++
+ class CppInterpreterGenerator: public AbstractInterpreterGenerator {
+   protected:
+   // shared code sequences
+--- hotspot/src/cpu/zero/vm/nativeInst_zero.cpp.orig
++++ hotspot/src/cpu/zero/vm/nativeInst_zero.cpp
+@@ -26,6 +26,9 @@
+ #include "precompiled.hpp"
+ #include "assembler_zero.inline.hpp"
+ #include "memory/resourceArea.hpp"
++#ifdef CC_INTERP
++#include "entry_zero.hpp"
++#endif
+ #include "nativeInst_zero.hpp"
+ #include "oops/oop.inline.hpp"
+ #include "runtime/handles.hpp"
-- 
2.18.0


