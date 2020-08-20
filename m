Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.107325.1597920133522967568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=RuxrF62t;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597920133; x=1629456133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3m3XfIr/sv1md9FbB94RCKqx1PICiasJIlyqFQSxILU=;
  b=RuxrF62t5AiUiZmprbdb6o6UymO26vpHOEK3xrwxhVGTvmBqu+rWqE3W
   PpvClrmjidSGNhTPyo/tZQ1bwnonavkyr6+pNSDYQMGIQEebn3qQ/59oA
   OoAv6WtiRZddJCY0DN4FBX8ur3HlixbbQwQwZUqqAtMOwc5hMWD8392uG
   9kgYlHpMwIaS4+fPA6v4LJdfGRRlPUfi34G6XC50ZIppe0FgHxKV2hTov
   DH1XxhrUgO0gJ4Wv2XF5n4emdzSLJdsEjo7calYPNOigOVMIN8u0/5oYy
   UC9NAm1AwWitfXJha8EPr5qoBrtdmdu9RySIOdx/KdLm4rUjGiYbA/4tS
   Q==;
IronPort-SDR: K7NvHQqgf2f4wQhK+iTf/pPrIeSseuT7dMVqYNdsBu5s0TW7KBCSBzO9POlNm2kcmXnEg55OrF
 hIhtWf2Ip9w4ZoPl8aV1MZTWeFyjB4k6xr+AKvkO37Xo7r7IhQxfXCINXnKJWJN6IsVNuiWxuO
 XHH2Um5ny0lHIb/nVP8XrvBt3z7KOLykSIUrpowboRJ4iCLtWsdEbURg0hWZYWLv1gb5d3YF/z
 FzR9vPciUrjkvgm82OZpEwEreAtUXUd1vPkpyo1c5KHpSSFKLAnCzscMhc+ASCMDZVU/cVbXyU
 WjQ=
X-IronPort-AV: E=Sophos;i="5.76,332,1592863200"; 
   d="scan'208";a="26247787"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH] openjdk-8: update to latest ga version 265
Date: Thu, 20 Aug 2020 12:41:58 +0200
Message-ID: <20200820104158.64100-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch related changes:
 * The hotspot patch 1004 was mainlined in changeset 3a3803a0c789 [1] and
   is therfore dropped.
 * The jdk patch 2010 was mainlined in changeset c4418d567028 [2] and is
   therefore dropped.
 * Rename hotspot/aarch64 patches to start with number 1401.
 * Rename hotspot/aarch32 patches to start with number 1201.
 * Merge aarch32-hotspot-fix-shark-build-pt2.patch and
   openjdk8-fix-shark-build-pt2.patch to hotspot patch 1013 as they were
   the same.

[1] https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/3a3803a0c789
[2] https://hg.openjdk.java.net/jdk8u/jdk8u/jdk/rev/c4418d567028

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...-native_252.bb => openjdk-8-native_265.bb} |   0
 .../openjdk/openjdk-8-release-aarch32.inc     |  18 +-
 .../openjdk/openjdk-8-release-aarch64.inc     |  18 +-
 .../openjdk/openjdk-8-release-common.inc      |  44 ++---
 recipes-core/openjdk/openjdk-8-release.inc    |  16 +-
 .../{openjdk-8_252.bb => openjdk-8_265.bb}    |   0
 .../{openjre-8_252.bb => openjre-8_265.bb}    |   0
 ...low-using-a-system-installed-libjpeg.patch |   4 +-
 ...llow-using-a-system-installed-libpng.patch |   4 +-
 ...uild-on-as-needed-toolchains-generic.patch |   4 +-
 .../0004-don-t-expect-fqpn-for-make.patch     |   4 +-
 ...005-autoconf-filter-aclocal-copy-too.patch |   4 +-
 .../0006-autoconf-handle-extra-output.patch   |   4 +-
 ...-assembler-flag-handling-in-makefile.patch |   4 +-
 ...0008-autoconf-fix-shark-build-common.patch |   4 +-
 ...o-in-favour-of-openembedded-package-.patch |   4 +-
 ...move-shell-variables-from-autoheader.patch |   4 +-
 ...otspot-fix-crash-on-JNI_CreateJavaVM.patch |   6 +-
 ...hotspot-use-correct-include-for-poll.patch |   2 +-
 ...otspot-don-t-rely-on-old-SysV-SIGCLD.patch |   2 +-
 ...-patch-to-fix-misuses-of-strncpy-str.patch | 172 ------------------
 ...rn-type-issues-introduced-by-806165.patch} |  12 +-
 ...ro-build-requires-disabled-warnings.patch} |   8 +-
 ...eturn-statement-in-__sync_val_compa.patch} |   4 +-
 ...ot-Turn-on-the-Wreturn-type-warning.patch} |  16 +-
 ...tspot-handle-format-error-for-GCC-7.patch} |   4 +-
 ...atch => 1009-hotspot-fix-adlc-flags.patch} |   4 +-
 ...1010-hotspot-fix-shark-build-common.patch} |  14 +-
 ...011-hotspot-restrict-to-staging-dir.patch} |   4 +-
 ...ch => 1012-hotspot-enable-Wno-error.patch} |   4 +-
 ...missing-includes-for-shark-build-pt2.patch |  32 ++++
 ...t-aarch32-fix-missing-return-values.patch} |  16 +-
 ...otspot-aarch32-remaining-musl-fixes.patch} |  11 +-
 ...dd-missing-return-value-to-LIR_Asse.patch} |  18 +-
 ...otspot-aarch64-remaining-musl-fixes.patch} |  18 +-
 ...mparison-between-pointer-and-integer.patch |  12 +-
 ...low-using-a-system-installed-libjpeg.patch |  24 +--
 ...llow-using-a-system-installed-libpng.patch |  16 +-
 ...004-jdk-use-correct-include-for-poll.patch |  32 ++--
 ...5-jdk-use-correct-include-for-signal.patch |  14 +-
 ...jdk-disable-backtrace-musl-build-fix.patch |   8 +-
 .../2007-jdk-no-genx11-in-headless.patch      |   8 +-
 .../2008-jdk-no-unused-deps.patch             |  18 +-
 ...-instead-of-ld-for-genSocketOptionRe.patch |  29 +++
 ...f-ld-to-link-genSocketOptionRegistry.patch |  13 --
 .../2010-Remove-usage-of-sys-sysctl.h.patch   |  39 ----
 .../aarch32-hotspot-fix-shark-build-pt2.patch |  11 --
 .../openjdk8-fix-shark-build-pt2.patch        |  11 --
 48 files changed, 268 insertions(+), 450 deletions(-)
 rename recipes-core/openjdk/{openjdk-8-native_252.bb => openjdk-8-native_265.bb} (100%)
 rename recipes-core/openjdk/{openjdk-8_252.bb => openjdk-8_265.bb} (100%)
 rename recipes-core/openjdk/{openjre-8_252.bb => openjre-8_265.bb} (100%)
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
 rename recipes-core/openjdk/patches-openjdk-8/{1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch => 1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch} (91%)
 rename recipes-core/openjdk/patches-openjdk-8/{1006-hotspot-Zero-build-requires-disabled-warnings.patch => 1005-hotspot-Zero-build-requires-disabled-warnings.patch} (95%)
 rename recipes-core/openjdk/patches-openjdk-8/{1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch => 1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch} (93%)
 rename recipes-core/openjdk/patches-openjdk-8/{1008-hotspot-Turn-on-the-Wreturn-type-warning.patch => 1007-hotspot-Turn-on-the-Wreturn-type-warning.patch} (96%)
 rename recipes-core/openjdk/patches-openjdk-8/{1009-hotspot-handle-format-error-for-GCC-7.patch => 1008-hotspot-handle-format-error-for-GCC-7.patch} (89%)
 rename recipes-core/openjdk/patches-openjdk-8/{1010-hotspot-fix-adlc-flags.patch => 1009-hotspot-fix-adlc-flags.patch} (92%)
 rename recipes-core/openjdk/patches-openjdk-8/{1011-hotspot-fix-shark-build-common.patch => 1010-hotspot-fix-shark-build-common.patch} (97%)
 rename recipes-core/openjdk/patches-openjdk-8/{1012-hotspot-restrict-to-staging-dir.patch => 1011-hotspot-restrict-to-staging-dir.patch} (85%)
 rename recipes-core/openjdk/patches-openjdk-8/{1013-hotspot-enable-Wno-error.patch => 1012-hotspot-enable-Wno-error.patch} (88%)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
 rename recipes-core/openjdk/patches-openjdk-8/{aarch32-hotspot-fix-missing-return-values.patch => 1201-hotspot-aarch32-fix-missing-return-values.patch} (80%)
 rename recipes-core/openjdk/patches-openjdk-8/{aarch32-hotspot-remaining-musl-fixes.patch => 1202-hotspot-aarch32-remaining-musl-fixes.patch} (77%)
 rename recipes-core/openjdk/patches-openjdk-8/{aarch64-hotspot-Fix-further-functions-with-a-missing.patch => 1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch} (72%)
 rename recipes-core/openjdk/patches-openjdk-8/{aarch64-hotspot-remaining-musl-fixes.patch => 1402-hotspot-aarch64-remaining-musl-fixes.patch} (74%)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch

diff --git a/recipes-core/openjdk/openjdk-8-native_252.bb b/recipes-core/openjdk/openjdk-8-native_265.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-native_252.bb
rename to recipes-core/openjdk/openjdk-8-native_265.bb
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
index 62dc866..1366ba5 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch32.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
@@ -4,31 +4,31 @@ COMPATIBLE_HOST = "^$"
 COMPATIBLE_HOST_armv7a = "arm"
 COMPATIBLE_HOST_armv7ve = "arm"
 
-CHANGESET_ID="20200415"
+CHANGESET_ID="20200729"
 
 CORBA_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[corba.sha256sum] = "e8dab3ffbc39fec724604b8c65408f32dcca1682769077c5b4f71b571938fe26"
+SRC_URI[corba.sha256sum] = "ade9cc2019f274efa8192a10b5ff5ca689671862c93b167f64fbac0673b1ee14"
 
 HOTSPOT_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[hotspot.sha256sum] = "7aebf690a05746e4fbcdcd75ac4e67acb2f0b087bba3bcb064675468626f5822"
+SRC_URI[hotspot.sha256sum] = "2ce8c243c25f1607273fab7261203485926144b240a9a2f3298e7eaaad502f35"
 
 JAXP_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxp.sha256sum] = "44883e0e836ee5fa2fcb4df936bafcfad69c57d05876d44ecefc5b3cb6b085c0"
+SRC_URI[jaxp.sha256sum] = "d318addf2fbab69c588c61bf86b128d491271c9c27bebbb69cab6bfbf0967990"
 
 JAXWS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxws.sha256sum] = "34f6cf3eb34c0c310e0cc31b876b189fd6b2e2c2dcc1066af5347f3a0873d2d3"
+SRC_URI[jaxws.sha256sum] = "452bd7be71bc7da65554da97c35470fb3c2f18228cbbf2ae01dd7ccdfeb55394"
 
 JDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jdk.sha256sum] = "f89688b5673ed75b1bebfd530a979788a4cbe942ce39eb38784f8c9e1303012b"
+SRC_URI[jdk.sha256sum] = "b7068f3d21b060b4ffd9951eb07d9e24e6415d5ad49d1cc20c897f7d88349212"
 
 LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[langtools.sha256sum] = "18357720e3b924dea2f171235ae06e753aeef7958a3ce7a2a8d41fa6e2c90454"
+SRC_URI[langtools.sha256sum] = "9ff01c83c40acedfb87ce566d88d135a5c92f5cc7ca110d5f5895305346f7968"
 
 NASHORN_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[nashorn.sha256sum] = "abd6ccf28278ce5775eebada339228fe2e3380d57d009179acdd7026adb21448"
+SRC_URI[nashorn.sha256sum] = "a752ebdeea4382f0d0c005861eea59c8b90a3488497974c2abc8915d4673cd0f"
 
 OPENJDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[openjdk.sha256sum] = "06d141aa01b80aa0c167167081e2139b3edf5af764cf17bbe9e1b57bf4f585ab"
+SRC_URI[openjdk.sha256sum] = "f42a7536ea7c76711e5b7caa0f42c8797145e68f0881f8fa9b8517ff48d0d747"
 
 PACKAGECONFIG_append_armv7a = " client"
 PACKAGECONFIG_append_armv7ve = " client"
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
index 86dffff..7a6d9e3 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
@@ -2,28 +2,28 @@ require openjdk-8-release-common.inc
 
 COMPATIBLE_HOST = "aarch64"
 
-CHANGESET_ID="b09"
+CHANGESET_ID="b01"
 
 CORBA_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[corba.sha256sum] = "13ce2345dec4390a7ed61066275528c1d4fe246abb3ffc16bdfd93c0e8ead193"
+SRC_URI[corba.sha256sum] = "43636545f3a4ad08e11728d20472d0bc8bb05b4833f9ab2bdcd0d195f8b6f96c"
 
 HOTSPOT_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[hotspot.sha256sum] = "80dd8b1289905252f5f9d97ba2302fe4b77a76851709f10d429848750b709c66"
+SRC_URI[hotspot.sha256sum] = "4ddf5e0e2e7840211849bf13ffafeda69696c1477ae1720c802e3182d87798fd"
 
 JAXP_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxp.sha256sum] = "a52f5497318980f379ce05ff8e638a0ae0ce7265d8922ddfb731d26989faf161"
+SRC_URI[jaxp.sha256sum] = "215920996bffd3cf7ebfd14f767b3f302503cddf82c1c0a63759764426c03938"
 
 JAXWS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxws.sha256sum] = "1db8876408222a8eec8432bd9778559ea80cae36a2c6dead32723279d1622741"
+SRC_URI[jaxws.sha256sum] = "96d8c429e4286184e008b6ee20942f6abaf01c014bc384a441552f7eb521ec5f"
 
 JDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jdk.sha256sum] = "abc7a1eec87ac330bebfa8ec4a3db72c27b63aa50175abfade580a46b7f2d865"
+SRC_URI[jdk.sha256sum] = "f0b882d16ef766ebce0e0106e54034a14ef5cd15dae2aff4695c199f6a84bce1"
 
 LANGTOOLS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[langtools.sha256sum] = "c4e3dd471372dad5a545ec038104c7706fa02da452275ce118ad7e38e418a57a"
+SRC_URI[langtools.sha256sum] = "a115bd03600093658dc9da549122e553fd6ce6cb7f317fb4461e15efad8ab140"
 
 NASHORN_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[nashorn.sha256sum] = "956ef3a52dc97fb28aeeeb9ccbd371c2b7f14e253fd63d1f98bb1bf87ddf1929"
+SRC_URI[nashorn.sha256sum] = "43ba2d8b825cf521e6ffb429f8578afc9ca7d90d6daf9bd2b22d598fb532d871"
 
 OPENJDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[openjdk.sha256sum] = "b7b933ff2b8c0ee17eb6dbd02beb8769e7dfe15c50ab2fdeef55666e4b12cbe7"
+SRC_URI[openjdk.sha256sum] = "dd46927e9821a69083feaff2161cce19d2cbbc2549be6c28da996ddba52b0d11"
diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index 1d69812..564ca50 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -19,38 +19,34 @@ PATCHES_URI = "\
     file://2006-jdk-disable-backtrace-musl-build-fix.patch \
     file://2007-jdk-no-genx11-in-headless.patch \
     file://2008-jdk-no-unused-deps.patch \
-    file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch \
+    file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch \
     file://2010-Remove-usage-of-sys-sysctl.h.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
     file://1002-hotspot-use-correct-include-for-poll.patch \
     file://1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch \
-    file://1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
-    file://1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch \
-    file://1006-hotspot-Zero-build-requires-disabled-warnings.patch \
-    file://1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
-    file://1008-hotspot-Turn-on-the-Wreturn-type-warning.patch \
-    file://1009-hotspot-handle-format-error-for-GCC-7.patch \
-    file://1013-hotspot-enable-Wno-error.patch \
+    file://1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch \
+    file://1005-hotspot-Zero-build-requires-disabled-warnings.patch \
+    file://1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
+    file://1007-hotspot-Turn-on-the-Wreturn-type-warning.patch \
+    file://1008-hotspot-handle-format-error-for-GCC-7.patch \
+    file://1012-hotspot-enable-Wno-error.patch \
 "
 HOTSPOT_UB_PATCH_append_class-target = "\
-    file://1010-hotspot-fix-adlc-flags.patch \
-    file://1011-hotspot-fix-shark-build-common.patch \
-    file://1012-hotspot-restrict-to-staging-dir.patch \
+    file://1009-hotspot-fix-adlc-flags.patch \
+    file://1010-hotspot-fix-shark-build-common.patch \
+    file://1011-hotspot-restrict-to-staging-dir.patch \
 "
 HOTSPOT_UB_PATCH_prepend_aarch64 = "\
-    file://aarch64-hotspot-Fix-further-functions-with-a-missing.patch \
+    file://1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch \
 "
-HOTSPOT_UB_PATCH_append_armv7a = " file://aarch32-hotspot-fix-missing-return-values.patch"
-HOTSPOT_UB_PATCH_append_armv7ve = " file://aarch32-hotspot-fix-missing-return-values.patch"
+HOTSPOT_UB_PATCH_append_armv7a = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
+HOTSPOT_UB_PATCH_append_armv7ve = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
 
 PATCHES_URI_append_class-target = "\
-    ${FIX_SHARK_BUILD_PT2_PATCH} \
+    file://1013-hotspot-add-missing-includes-for-shark-build-pt2.patch \
 "
-FIX_SHARK_BUILD_PT2_PATCH = "file://openjdk8-fix-shark-build-pt2.patch;striplevel=0"
-FIX_SHARK_BUILD_PT2_PATCH_armv7a = "file://aarch32-hotspot-fix-shark-build-pt2.patch;striplevel=0"
-FIX_SHARK_BUILD_PT2_PATCH_armv7ve = "file://aarch32-hotspot-fix-shark-build-pt2.patch;striplevel=0"
 
 PATCHES_URI_append_libc-musl = "\
     ${OBSOLETE_ISNANF_PATCH} \
@@ -75,14 +71,14 @@ REMOVE_GLIBC_DEPENDENCIES_PT2 = "file://musl-0006-hotspot-os_linux-remove-glibc-
 REMOVE_GLIBC_DEPENDENCIES_PT2_armv7a = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
 REMOVE_GLIBC_DEPENDENCIES_PT2_armv7ve = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
 
-PATCHES_URI_append_libc-musl_armv7a = " file://aarch32-hotspot-remaining-musl-fixes.patch"
-PATCHES_URI_append_libc-musl_armv7ve = " file://aarch32-hotspot-remaining-musl-fixes.patch"
-PATCHES_URI_append_libc-musl_aarch64 = " file://aarch64-hotspot-remaining-musl-fixes.patch"
+PATCHES_URI_append_libc-musl_armv7a = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
+PATCHES_URI_append_libc-musl_armv7ve = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
+PATCHES_URI_append_libc-musl_aarch64 = " file://1402-hotspot-aarch64-remaining-musl-fixes.patch"
 
 # remove aarch32 & aarch64 mainlined patches
-PATCHES_URI_remove_armv7a = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
-PATCHES_URI_remove_armv7ve = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
-PATCHES_URI_remove_aarch64 = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
+PATCHES_URI_remove_armv7a = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
+PATCHES_URI_remove_armv7ve = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
+PATCHES_URI_remove_aarch64 = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
 
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/openjdk/openjdk-8-release.inc
index ddbd8c9..5660c17 100644
--- a/recipes-core/openjdk/openjdk-8-release.inc
+++ b/recipes-core/openjdk/openjdk-8-release.inc
@@ -7,25 +7,25 @@ COMPATIBLE_HOST_armv7a = "^$"
 COMPATIBLE_HOST_armv7ve = "^$"
 
 CORBA_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[corba.sha256sum] = "97513397015ca62953c6afa3ba925b1dabc0238d47f3a2b81c2bd5b683d4d050"
+SRC_URI[corba.sha256sum] = "a3adf57f7d50155bb83926afc2ca0007c6f17602660bacaff67201dd886b379f"
 
 HOTSPOT_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[hotspot.sha256sum] = "80a91f421bbe750f5e8c66b74f77fb79f31cce2f6e9e1cfe8407d773bb1ed57d"
+SRC_URI[hotspot.sha256sum] = "b4f6ab5466fc73f6e015d5394b4204453a109dc532e8bbac069c46c109545ce6"
 
 JAXP_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxp.sha256sum] = "ead123b56c1c5d4c381665da6c0858cd9b11c69b8afc7494f9831980bc71bc92"
+SRC_URI[jaxp.sha256sum] = "d8e6a5bf406bf32f7806081907bd299098f13ade00260a737d3c141bcc2890a9"
 
 JAXWS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxws.sha256sum] = "ef6532ac77e7e4333283c09c87b6923fbaa91b8bca6770f06494c3bb1643455e"
+SRC_URI[jaxws.sha256sum] = "436a0aaecda8f2cc66ef2cbccea34a85887e5646fff60036473c08f975a68e33"
 
 JDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jdk.sha256sum] = "7203ded24a10843ac8e84269ad8ac347f29b1dd950f7e0bb9739ddcb8280b8fb"
+SRC_URI[jdk.sha256sum] = "f9ca5bcda71f91d087d7483c1ae53d266a92f9691836f1cbbfaa37a9993f1f9b"
 
 LANGTOOLS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[langtools.sha256sum] = "6e2329e3f15c0fd23da47cd8f454cb49cdae0b12c951eb2910061fa95acb8ea4"
+SRC_URI[langtools.sha256sum] = "ea33875d91addd8f6dd52afe5cfa11c108f0e378df8451ed22a4e6767576c899"
 
 NASHORN_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[nashorn.sha256sum] = "195237fd89f34c27bf98c3a8bfda64bbc799a014e83907062a8b4e10bd4f2021"
+SRC_URI[nashorn.sha256sum] = "660148fab294a98147d346209e19b6dcf82807588d3c8c54abfc1262c95043d4"
 
 OPENJDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[openjdk.sha256sum] = "a83f8daa2afece63bf7ae95cfbca91ef765424c40b9f5b45e4a3c2d4da0f7a95"
+SRC_URI[openjdk.sha256sum] = "b5fd22b2f4a0a59611373e5f1ffc423d26e62ea38f1084a80a401beb6bd04d88"
diff --git a/recipes-core/openjdk/openjdk-8_252.bb b/recipes-core/openjdk/openjdk-8_265.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8_252.bb
rename to recipes-core/openjdk/openjdk-8_265.bb
diff --git a/recipes-core/openjdk/openjre-8_252.bb b/recipes-core/openjdk/openjre-8_265.bb
similarity index 100%
rename from recipes-core/openjdk/openjre-8_252.bb
rename to recipes-core/openjdk/openjre-8_265.bb
diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
index e9662eb..10e5756 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
@@ -1,4 +1,4 @@
-From 836aad60652299a26341b46a4a9a2e6c418b6947 Mon Sep 17 00:00:00 2001
+From 7f505a0a0b34580fbb9c1f0d6a06e8ae486088c6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:36:53 +0000
 Subject: [PATCH 01/10] Allow using a system-installed libjpeg
@@ -73,5 +73,5 @@ index 6d803f9..d2732eb 100644
  
    ###############################################################################
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
index ed8ecfa..7a840e1 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
@@ -1,4 +1,4 @@
-From ed79dc49323cc08e81b3699817825f66b1af0ce2 Mon Sep 17 00:00:00 2001
+From 36bb38c31724a3d24ba215ee2de76985fc09bead Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Thu, 2 Jan 2020 13:40:50 +0100
 Subject: [PATCH 02/10] Allow using a system-installed libpng
@@ -76,5 +76,5 @@ index d2732eb..727f018 100644
    #
    # Check for the zlib library
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
index 0e3359c..1736829 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
@@ -1,4 +1,4 @@
-From 4cde9ea2adf8c57168a299f11625083d1822b0de Mon Sep 17 00:00:00 2001
+From 862b38ca47d0fa1b953d11f245c44cf176ce9104 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 12 Mar 2018 15:40:58 +0000
 Subject: [PATCH 03/10] build: fix build on --as-needed toolchains (generic)
@@ -87,5 +87,5 @@ index d961cf3..92f8033 100644
  	  $(MT) -nologo -manifest $$($1_GEN_MANIFEST) -outputresource:$$@;#1
          endif
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
index db00b24..9b4605d 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
@@ -1,4 +1,4 @@
-From f4c93547119c7550626e1b2ae2b750ea4f83b3fe Mon Sep 17 00:00:00 2001
+From 5eab9b7dfef9c906f7543ef2fcb2dceeef8b8628 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:42:43 +0100
 Subject: [PATCH 04/10] don't expect fqpn for make
@@ -29,5 +29,5 @@ index 4ee9cdd..c20ea76 100644
        AC_MSG_ERROR([The specified make (by MAKE=$MAKE) is not GNU make 3.81 or newer.])
      fi
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
index 262f0b7..05c54a9 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
@@ -1,4 +1,4 @@
-From b8bab47b58be4a0102011825c2ee3dd2c6427d08 Mon Sep 17 00:00:00 2001
+From 307281e9a66f391c737b03cf8ce021474f5eaabd Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:44:25 +0100
 Subject: [PATCH 05/10] autoconf: filter aclocal copy too
@@ -21,5 +21,5 @@ index c20ea76..8e06cd2 100644
            | $TR -d '\n'`
        if test "x$filtered_files" != x; then
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
index c5fa4bf..3aa0c4e 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
@@ -1,4 +1,4 @@
-From cf40c00dfd6d2299055c0e8415525d2da5e7cd4a Mon Sep 17 00:00:00 2001
+From a861d45b40ed3b08dad9aef86dc8ba21fdc4e324 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Thu, 2 Jan 2020 13:45:42 +0100
 Subject: [PATCH 06/10] autoconf: handle extra output
@@ -26,5 +26,5 @@ index 5be15b8..0d1a6e1 100644
              # Extra M4 quote needed to protect [] in grep expression.
              [FOUND_VERSION_78=`echo $BOOT_JDK_VERSION | grep  '\"1\.[78]\.'`]
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
index c99d599..7a3bc88 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
@@ -1,4 +1,4 @@
-From ec3aa8ae1159ff5ef37fae1ba470cf1886aa8d79 Mon Sep 17 00:00:00 2001
+From 4ba108476c0756ab567235d692c80acf477c310e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
 Date: Thu, 2 Jan 2020 13:49:02 +0100
 Subject: [PATCH 07/10] fix assembler flag handling in makefile
@@ -32,5 +32,5 @@ index 92f8033..46a1be9 100644
    # On windows we need to create a resource file
    ifeq ($(OPENJDK_TARGET_OS), windows)
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
index b783613..09305f0 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
@@ -1,4 +1,4 @@
-From c530da1c0269d1e9a875670943446876227fdb71 Mon Sep 17 00:00:00 2001
+From e945d20be2b7b12d234ff467d3d988c9811d3cad Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:51:40 +0100
 Subject: [PATCH 08/10] autoconf: fix shark build (common)
@@ -33,5 +33,5 @@ index 727f018..91d2b5c 100644
          if test "${LLVM_LIBS}" != ""; then
            LLVM_LIBS="${LLVM_LIBS} "
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
index 14fccd1..ecc69bd 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
@@ -1,4 +1,4 @@
-From a5f2646a9dd0f7191e9e0aa5eba5fdd9d70d1671 Mon Sep 17 00:00:00 2001
+From ff6e6f4ea3a782e499a872f5de6f80335b9bafb5 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:53:50 +0100
 Subject: [PATCH 09/10] prevent debuginfo in favour of openembedded package
@@ -150,5 +150,5 @@ index 46a1be9..b4ea2c6 100644
      endif
  
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
index 57099ec..1a95961 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
@@ -1,4 +1,4 @@
-From 0d22dccb4de73d274b90e2647702b92958374bc1 Mon Sep 17 00:00:00 2001
+From 13a668aa69c201cc740400174c4be3c58fdc4df5 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:55:29 +0100
 Subject: [PATCH 10/10] autoconf: remove shell variables from autoheader
@@ -42,5 +42,5 @@ index 8e06cd2..c220bba 100644
  
  AC_DEFUN_ONCE([BASIC_SETUP_LOGGING],
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
index 2393869..760c9e4 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
@@ -1,4 +1,4 @@
-From d01c03bb68692365f1cf8c8e79c42b7452b83928 Mon Sep 17 00:00:00 2001
+From ca63ab55217cbef6aea495139f766922c61e50b2 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Sun, 17 Feb 2019 22:38:33 -0800
 Subject: [PATCH 1001/1013] hotspot: fix crash on JNI_CreateJavaVM
@@ -19,10 +19,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
-index 03cabfefb..4f28cc1fb 100644
+index c477851c1..47eef1e7c 100644
 --- a/hotspot/src/os/linux/vm/os_linux.cpp
 +++ b/hotspot/src/os/linux/vm/os_linux.cpp
-@@ -3192,7 +3192,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
+@@ -3227,7 +3227,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
      uintptr_t stack_extent = (uintptr_t) os::Linux::initial_thread_stack_bottom();
      unsigned char vec[1];
  
diff --git a/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
index 19e12fb..95c7d75 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
@@ -1,4 +1,4 @@
-From 0fdafd1b0cf7c9abc956d0dbe611f7aa7186c70b Mon Sep 17 00:00:00 2001
+From 5f8b64ed6697443f3abb12773e3fb1ac6b545c8a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 1002/1013] hotspot: use correct include for poll
diff --git a/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
index b4c64c6..f0794ed 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
@@ -1,4 +1,4 @@
-From 43292d7d298432228ef270696921af7a5d73a833 Mon Sep 17 00:00:00 2001
+From 0d367dbb17112939f81286f2c600b7e00e226bcb Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:00:55 +0000
 Subject: [PATCH 1003/1013] hotspot: don't rely on old SysV SIGCLD
diff --git a/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
deleted file mode 100644
index 69b85aa..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From 1beb42da8445e9ca6c8560f8c78cac185fffb64d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
-Date: Fri, 10 Aug 2018 14:54:45 +0100
-Subject: [PATCH 1004/1013] hotspot: backport patch to fix misuses of
- strncpy/strncat
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Various small fixes around strncpy and strncat
-
-Compilation using gcc >= 8 fails because of errors regarding
-misuse of string functions.
-Fix them using a backport from openjdk-10
-
-Modelled after http://hg.openjdk.java.net/jdk-updates/jdk10u/rev/b1608535e50f
-
-Signed-off-by: André Draszik <andre.draszik@jci.com>
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- agent/src/os/linux/libproc_impl.c       |  7 ++++++-
- src/share/tools/hsdis/hsdis.c           |  1 +
- src/share/vm/compiler/compileBroker.hpp |  3 ++-
- src/share/vm/compiler/disassembler.cpp  |  1 +
- src/share/vm/runtime/arguments.cpp      | 13 ++++++-------
- src/share/vm/utilities/ostream.cpp      | 12 ++++++++----
- src/share/vm/utilities/vmError.cpp      |  9 +--------
- 7 files changed, 25 insertions(+), 21 deletions(-)
-
-diff --git a/hotspot/agent/src/os/linux/libproc_impl.c b/hotspot/agent/src/os/linux/libproc_impl.c
-index ca791c95d..73a15ce35 100644
---- a/hotspot/agent/src/os/linux/libproc_impl.c
-+++ b/hotspot/agent/src/os/linux/libproc_impl.c
-@@ -159,7 +159,12 @@ lib_info* add_lib_info_fd(struct ps_prochandle* ph, const char* libname, int fd,
-       return NULL;
-    }
- 
--   strncpy(newlib->name, libname, sizeof(newlib->name));
-+   if (strlen(libname) >= sizeof(newlib->name)) {
-+     print_debug("libname %s too long\n", libname);
-+     return NULL;
-+   }
-+   strcpy(newlib->name, libname);
-+
-    newlib->base = base;
- 
-    if (fd == -1) {
-diff --git a/hotspot/src/share/tools/hsdis/hsdis.c b/hotspot/src/share/tools/hsdis/hsdis.c
-index 7bef1040f..1907d479e 100644
---- a/hotspot/src/share/tools/hsdis/hsdis.c
-+++ b/hotspot/src/share/tools/hsdis/hsdis.c
-@@ -438,6 +438,7 @@ static void parse_caller_options(struct hsdis_app_data* app_data, const char* ca
-     }
-     p = q;
-   }
-+  *iop = '\0';
- }
- 
- static void print_help(struct hsdis_app_data* app_data,
-diff --git a/hotspot/src/share/vm/compiler/compileBroker.hpp b/hotspot/src/share/vm/compiler/compileBroker.hpp
-index ad37ff173..16e0ba3aa 100644
---- a/hotspot/src/share/vm/compiler/compileBroker.hpp
-+++ b/hotspot/src/share/vm/compiler/compileBroker.hpp
-@@ -173,7 +173,8 @@ class CompilerCounters : public CHeapObj<mtCompiler> {
-     // these methods should be called in a thread safe context
- 
-     void set_current_method(const char* method) {
--      strncpy(_current_method, method, (size_t)cmname_buffer_length);
-+      strncpy(_current_method, method, (size_t)cmname_buffer_length-1);
-+      _current_method[cmname_buffer_length-1] = '\0';
-       if (UsePerfData) _perf_current_method->set_value(method);
-     }
- 
-diff --git a/hotspot/src/share/vm/compiler/disassembler.cpp b/hotspot/src/share/vm/compiler/disassembler.cpp
-index 93cd9e854..e7b32cd6b 100644
---- a/hotspot/src/share/vm/compiler/disassembler.cpp
-+++ b/hotspot/src/share/vm/compiler/disassembler.cpp
-@@ -295,6 +295,7 @@ address decode_env::handle_event(const char* event, address arg) {
-         strlen((const char*)arg) > sizeof(buffer) - 1) {
-       // Only print this when the mach changes
-       strncpy(buffer, (const char*)arg, sizeof(buffer) - 1);
-+      buffer[sizeof(buffer) - 1] = '\0';
-       output()->print_cr("[Disassembling for mach='%s']", arg);
-     }
-   } else if (match(event, "format bytes-per-line")) {
-diff --git a/hotspot/src/share/vm/runtime/arguments.cpp b/hotspot/src/share/vm/runtime/arguments.cpp
-index 7c85a0da8..ea4026b98 100644
---- a/hotspot/src/share/vm/runtime/arguments.cpp
-+++ b/hotspot/src/share/vm/runtime/arguments.cpp
-@@ -3456,7 +3456,7 @@ void Arguments::fix_appclasspath() {
-     }
- 
-     char* copy = AllocateHeap(strlen(src) + 1, mtInternal);
--    strncpy(copy, src, strlen(src) + 1);
-+    strcpy(copy, src);
- 
-     // trim all trailing empty paths
-     for (char* tail = copy + strlen(copy) - 1; tail >= copy && *tail == separator; tail--) {
-@@ -3835,17 +3835,16 @@ static char* get_shared_archive_path() {
-     if (end != NULL) *end = '\0';
-     size_t jvm_path_len = strlen(jvm_path);
-     size_t file_sep_len = strlen(os::file_separator());
--    shared_archive_path = NEW_C_HEAP_ARRAY(char, jvm_path_len +
--        file_sep_len + 20, mtInternal);
-+    const size_t len = jvm_path_len + file_sep_len + 20;
-+    shared_archive_path = NEW_C_HEAP_ARRAY(char, len, mtInternal);
-     if (shared_archive_path != NULL) {
--      strncpy(shared_archive_path, jvm_path, jvm_path_len + 1);
--      strncat(shared_archive_path, os::file_separator(), file_sep_len);
--      strncat(shared_archive_path, "classes.jsa", 11);
-+      jio_snprintf(shared_archive_path, len, "%s%sclasses.jsa",
-+        jvm_path, os::file_separator());
-     }
-   } else {
-     shared_archive_path = NEW_C_HEAP_ARRAY(char, strlen(SharedArchiveFile) + 1, mtInternal);
-     if (shared_archive_path != NULL) {
--      strncpy(shared_archive_path, SharedArchiveFile, strlen(SharedArchiveFile) + 1);
-+      strcpy(shared_archive_path, SharedArchiveFile);
-     }
-   }
-   return shared_archive_path;
-diff --git a/hotspot/src/share/vm/utilities/ostream.cpp b/hotspot/src/share/vm/utilities/ostream.cpp
-index 1b00f829a..4daea2b7e 100644
---- a/hotspot/src/share/vm/utilities/ostream.cpp
-+++ b/hotspot/src/share/vm/utilities/ostream.cpp
-@@ -342,15 +342,19 @@ void stringStream::write(const char* s, size_t len) {
-       assert(rm == NULL || Thread::current()->current_resource_mark() == rm,
-              "stringStream is re-allocated with a different ResourceMark");
-       buffer = NEW_RESOURCE_ARRAY(char, end);
--      strncpy(buffer, oldbuf, buffer_pos);
-+      if (buffer_pos > 0) {
-+        memcpy(buffer, oldbuf, buffer_pos);
-+      }
-       buffer_length = end;
-     }
-   }
-   // invariant: buffer is always null-terminated
-   guarantee(buffer_pos + write_len + 1 <= buffer_length, "stringStream oob");
--  buffer[buffer_pos + write_len] = 0;
--  strncpy(buffer + buffer_pos, s, write_len);
--  buffer_pos += write_len;
-+  if (write_len > 0) {
-+    buffer[buffer_pos + write_len] = 0;
-+    memcpy(buffer + buffer_pos, s, write_len);
-+    buffer_pos += write_len;
-+  }
- 
-   // Note that the following does not depend on write_len.
-   // This means that position and count get updated
-diff --git a/hotspot/src/share/vm/utilities/vmError.cpp b/hotspot/src/share/vm/utilities/vmError.cpp
-index 49b978a02..97c5e33f2 100644
---- a/hotspot/src/share/vm/utilities/vmError.cpp
-+++ b/hotspot/src/share/vm/utilities/vmError.cpp
-@@ -450,14 +450,7 @@ void VMError::report(outputStream* st) {
- #else
-          const char *file = _filename;
- #endif
--         size_t len = strlen(file);
--         size_t buflen = sizeof(buf);
--
--         strncpy(buf, file, buflen);
--         if (len + 10 < buflen) {
--           sprintf(buf + len, ":%d", _lineno);
--         }
--         st->print(" (%s)", buf);
-+         st->print(" (%s:%d)", file, _lineno);
-        } else {
-          st->print(" (0x%x)", _id);
-        }
--- 
-2.26.2
-
diff --git a/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
similarity index 91%
rename from recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
rename to recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
index ce86997..b36dc37 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
@@ -1,7 +1,7 @@
-From 0ba0fdd1596b31af69abc2fc1a9d96e77ab61a0c Mon Sep 17 00:00:00 2001
+From de5bf18a604e8213fe5a6510a37783c134af90c6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:40:34 +0100
-Subject: [PATCH 1005/1013] hotspot: fix -Wreturn-type issues introduced by
+Subject: [PATCH 1004/1013] hotspot: fix -Wreturn-type issues introduced by
  8061651
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -24,10 +24,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
-index f43dc5ed7..8d7523c55 100644
+index bc3ff540d..29532ab11 100644
 --- a/hotspot/src/share/vm/prims/jvm.cpp
 +++ b/hotspot/src/share/vm/prims/jvm.cpp
-@@ -908,7 +908,7 @@ JVM_END
+@@ -918,7 +918,7 @@ JVM_END
  JVM_ENTRY(jboolean, JVM_KnownToNotExist(JNIEnv *env, jobject loader, const char *classname))
    JVMWrapper("JVM_KnownToNotExist");
  #if INCLUDE_CDS
@@ -36,7 +36,7 @@ index f43dc5ed7..8d7523c55 100644
  #else
    return false;
  #endif
-@@ -918,7 +918,7 @@ JVM_END
+@@ -928,7 +928,7 @@ JVM_END
  JVM_ENTRY(jobjectArray, JVM_GetResourceLookupCacheURLs(JNIEnv *env, jobject loader))
    JVMWrapper("JVM_GetResourceLookupCacheURLs");
  #if INCLUDE_CDS
@@ -45,7 +45,7 @@ index f43dc5ed7..8d7523c55 100644
  #else
    return NULL;
  #endif
-@@ -928,7 +928,7 @@ JVM_END
+@@ -938,7 +938,7 @@ JVM_END
  JVM_ENTRY(jintArray, JVM_GetResourceLookupCache(JNIEnv *env, jobject loader, const char *resource_name))
    JVMWrapper("JVM_GetResourceLookupCache");
  #if INCLUDE_CDS
diff --git a/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
similarity index 95%
rename from recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch
rename to recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
index cddd4bf..d3b165a 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
@@ -1,7 +1,7 @@
-From 69d92c4763bd8c1545fb29af7fc54f6f58b87a65 Mon Sep 17 00:00:00 2001
+From 90d017563e2d030a8fbeb31eca294d342a8559de Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:45:24 +0100
-Subject: [PATCH 1006/1013] hotspot: Zero build requires disabled warnings
+Subject: [PATCH 1005/1013] hotspot: Zero build requires disabled warnings
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -119,7 +119,7 @@ index d22ea1141..cbee43baa 100644
  
  void os::Linux::set_fpu_control_word(int fpu) {
 diff --git a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
-index 39f77f858..b9c73dc48 100644
+index 94bc83a30..b3ba526f2 100644
 --- a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
 +++ b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
 @@ -1,5 +1,5 @@
@@ -136,7 +136,7 @@ index 39f77f858..b9c73dc48 100644
 +    return false; // silence compile warning
    }
  
-   // These routines are only used on cpu architectures that
+   bool pd_get_top_frame_for_profiling(frame* fr_addr,
 -- 
 2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
similarity index 93%
rename from recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch
rename to recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
index 79e3b7a..6ab8ee0 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
@@ -1,7 +1,7 @@
-From 8f0a48544832278f9b6503dae1a03b05da41b8fc Mon Sep 17 00:00:00 2001
+From 253f6cc9ca4f2cd9564028fa24b9306d9258a8fa Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:46:33 +0100
-Subject: [PATCH 1007/1013] hotspot: Missing return statement in
+Subject: [PATCH 1006/1013] hotspot: Missing return statement in
  __sync_val_compare_and_swap_8
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
diff --git a/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
similarity index 96%
rename from recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch
rename to recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
index d8eae8b..dce251a 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
@@ -1,7 +1,7 @@
-From b9273263a4ddc38c61bf0e59819bc9503495b5a1 Mon Sep 17 00:00:00 2001
+From d7256ea11ba0c2160df59d40eea247c1a83ce1fb Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:48:32 +0100
-Subject: [PATCH 1008/1013] hotspot: Turn on the -Wreturn-type warning
+Subject: [PATCH 1007/1013] hotspot: Turn on the -Wreturn-type warning
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -61,7 +61,7 @@ index f42d1a288..c8f4ee161 100644
  
  #ifndef PRODUCT
 diff --git a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
-index 1a7375afc..fbf51b040 100644
+index c35d8677f..65c3165ca 100644
 --- a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
 +++ b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
 @@ -541,6 +541,7 @@ JVM_handle_linux_signal(int sig,
@@ -117,10 +117,10 @@ index ec97077b7..2621a7d62 100644
  
  Symbol* SymbolTable::lookup_only(const char* name, int len,
 diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-index da2717d36..5253afc22 100644
+index 05b196aeb..7f8ab9143 100644
 --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
 +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-@@ -229,15 +229,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
+@@ -234,15 +234,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
                   class_name->as_C_string(),
                   class_loader.is_null() ? "null" : class_loader->klass()->name()->as_C_string()));
    if (FieldType::is_array(class_name)) {
@@ -179,10 +179,10 @@ index 0698eb40e..354293924 100644
  
    Symbol* klass_name_at(int which);  // Returns the name, w/o resolving.
 diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
-index 8d7523c55..4034a8589 100644
+index 29532ab11..8ba488e15 100644
 --- a/hotspot/src/share/vm/prims/jvm.cpp
 +++ b/hotspot/src/share/vm/prims/jvm.cpp
-@@ -4343,7 +4343,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
+@@ -4357,7 +4357,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
      JVM_DTraceProvider* providers))
    JVMWrapper("JVM_DTraceActivate");
    return DTraceJSDT::activate(
@@ -218,7 +218,7 @@ index d5bea29c3..50578ad63 100644
  
  
 diff --git a/hotspot/src/share/vm/services/memTracker.hpp b/hotspot/src/share/vm/services/memTracker.hpp
-index 7ad2b71f4..182084373 100644
+index 8ea859ddb..535147f8c 100644
 --- a/hotspot/src/share/vm/services/memTracker.hpp
 +++ b/hotspot/src/share/vm/services/memTracker.hpp
 @@ -64,7 +64,7 @@ class MemTracker : AllStatic {
diff --git a/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
similarity index 89%
rename from recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
rename to recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
index daa43a7..bdeb766 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
@@ -1,7 +1,7 @@
-From 3c9da574b8610a0a1f4bdd8a2cb44a6aee8e3a89 Mon Sep 17 00:00:00 2001
+From b620c78bbe2b10b952d8f291f345bab12cfe4b5e Mon Sep 17 00:00:00 2001
 From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
 Date: Fri, 21 Sep 2018 10:44:06 +0200
-Subject: [PATCH 1009/1013] hotspot: handle format error for GCC >= 7
+Subject: [PATCH 1008/1013] hotspot: handle format error for GCC >= 7
 
 Upstream-Status: Pending
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
similarity index 92%
rename from recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch
rename to recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
index eba2b11..3c2bbbd 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
@@ -1,7 +1,7 @@
-From 7f0202182455d5705501dda97e86aa99506b13b4 Mon Sep 17 00:00:00 2001
+From 5aba5bcf8fb4c7d7493662dd89689809fb401433 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
 Date: Thu, 2 Jan 2020 10:19:29 +0100
-Subject: [PATCH 1010/1013] hotspot: fix adlc flags
+Subject: [PATCH 1009/1013] hotspot: fix adlc flags
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
similarity index 97%
rename from recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch
rename to recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
index f00d56b..da93cbe 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
@@ -1,7 +1,7 @@
-From 2a9fddfb3370278f021858f28524dd83f1d6d1aa Mon Sep 17 00:00:00 2001
+From cfc5c9089f82bc94fca2407aae6b1ffc4b60955f Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 10:22:19 +0100
-Subject: [PATCH 1011/1013] hotspot: fix shark build (common)
+Subject: [PATCH 1010/1013] hotspot: fix shark build (common)
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
@@ -22,7 +22,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  14 files changed, 123 insertions(+), 12 deletions(-)
 
 diff --git a/hotspot/make/Makefile b/hotspot/make/Makefile
-index 5765f1e36..f8ff9ecd9 100644
+index ad195763b..53b5ea046 100644
 --- a/hotspot/make/Makefile
 +++ b/hotspot/make/Makefile
 @@ -525,7 +525,7 @@ $(EXPORT_INCLUDE_DIR)/%:			$(SHARK_BUILD_DIR)/../generated/jvmtifiles/%
@@ -79,10 +79,10 @@ index 4707cc96e..a2b297ca0 100644
          flow_block(blk, temp_vector, temp_set);
          if (failing()) return; // Watch for bailouts.
 diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-index 5253afc22..ecb30cdef 100644
+index 7f8ab9143..91818bf25 100644
 --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
 +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-@@ -2300,6 +2300,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2362,6 +2362,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
      spe = NULL;
      // Must create lots of stuff here, but outside of the SystemDictionary lock.
      m = Method::make_method_handle_intrinsic(iid, signature, CHECK_(empty));
@@ -90,7 +90,7 @@ index 5253afc22..ecb30cdef 100644
      if (!Arguments::is_interpreter_only()) {
        // Generate a compiled form of the MH intrinsic.
        AdapterHandlerLibrary::create_native_wrapper(m);
-@@ -2309,6 +2310,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2371,6 +2372,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
                     "out of space in CodeCache for method handle intrinsic", empty);
        }
      }
@@ -98,7 +98,7 @@ index 5253afc22..ecb30cdef 100644
      // Now grab the lock.  We might have to throw away the new method,
      // if a racing thread has managed to install one at the same time.
      {
-@@ -2322,9 +2324,11 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2384,9 +2386,11 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
    }
  
    assert(spe != NULL && spe->method() != NULL, "");
diff --git a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
similarity index 85%
rename from recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
rename to recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
index 92af81d..7c8c979 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
@@ -1,7 +1,7 @@
-From 1f9bb32ae75517a7ce53a5e3bf4395f8826cec48 Mon Sep 17 00:00:00 2001
+From 5588f79a4a625591589e28eb73acaf4b49f48b62 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 10:23:38 +0100
-Subject: [PATCH 1012/1013] hotspot: restrict to staging dir
+Subject: [PATCH 1011/1013] hotspot: restrict to staging dir
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-enable-Wno-error.patch b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
similarity index 88%
rename from recipes-core/openjdk/patches-openjdk-8/1013-hotspot-enable-Wno-error.patch
rename to recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
index cdfe364..492d9d7 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-enable-Wno-error.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
@@ -1,7 +1,7 @@
-From beeb3ed0855f1a2a6075da0ff2f93dc5654ab1d5 Mon Sep 17 00:00:00 2001
+From c36d56682baeab713038d9050a3abf6c1af3e92d Mon Sep 17 00:00:00 2001
 From: Richard Leitner <richard.leitner@skidata.com>
 Date: Thu, 20 Aug 2020 09:39:23 +0200
-Subject: [PATCH 1013/1013] hotspot: enable -Wno-error
+Subject: [PATCH 1012/1013] hotspot: enable -Wno-error
 
 As we don't want to deal with compiler warnings in OpenEmbedded disable
 them for now.
diff --git a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
new file mode 100644
index 0000000..000c474
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
@@ -0,0 +1,32 @@
+From c9ed701f0553f95f90a7a12b773ca580e9034ede Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Thu, 20 Aug 2020 10:10:55 +0200
+Subject: [PATCH 1013/1013] hotspot: add missing includes for shark build (pt2)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ src/cpu/zero/vm/entry_zero.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hotspot/src/cpu/zero/vm/entry_zero.hpp b/hotspot/src/cpu/zero/vm/entry_zero.hpp
+index 73987f061..c5f50672b 100644
+--- a/hotspot/src/cpu/zero/vm/entry_zero.hpp
++++ b/hotspot/src/cpu/zero/vm/entry_zero.hpp
+@@ -26,6 +26,8 @@
+ #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
+ #define CPU_ZERO_VM_ENTRY_ZERO_HPP
+ 
++#include "utilities/globalDefinitions.hpp"
++#include "utilities/exceptions.hpp"
+ #include "interpreter/cppInterpreter.hpp"
+ 
+ class ZeroEntry {
+-- 
+2.26.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-missing-return-values.patch b/recipes-core/openjdk/patches-openjdk-8/1201-hotspot-aarch32-fix-missing-return-values.patch
similarity index 80%
rename from recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-missing-return-values.patch
rename to recipes-core/openjdk/patches-openjdk-8/1201-hotspot-aarch32-fix-missing-return-values.patch
index bedc448..d4294d2 100644
--- a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-missing-return-values.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1201-hotspot-aarch32-fix-missing-return-values.patch
@@ -1,19 +1,21 @@
-From 658adc5b6567e9a6df56beabb8d226a9b4d8e762 Mon Sep 17 00:00:00 2001
+From f4d687a4d6ddb08cae3bcce46257ea57544294c0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Thu, 16 Aug 2018 02:27:44 +0100
-Subject: [PATCH] hotspot/aarch32: fix missing return values
+Subject: [PATCH 1201/1202] hotspot/aarch32: fix missing return values
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+Upstream-Status: Pending
 Signed-off-by: André Draszik <andre.draszik@jci.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
- hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp | 3 +++
- hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp       | 1 +
+ src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp | 3 +++
+ src/cpu/aarch32/vm/relocInfo_aarch32.cpp       | 1 +
  2 files changed, 4 insertions(+)
 
 diff --git a/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp b/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
-index cd291bf2..4ba98c68 100644
+index 8aae15af2..76b6f1fe9 100644
 --- a/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
 +++ b/hotspot/src/cpu/aarch32/vm/c1_LIRAssembler_aarch32.cpp
 @@ -158,16 +158,19 @@ static Register as_reg(LIR_Opr op) {
@@ -37,7 +39,7 @@ index cd291bf2..4ba98c68 100644
  
  Address LIR_Assembler::as_Address(LIR_Address* addr, Register tmp, Address::InsnDataType type) {
 diff --git a/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp b/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
-index 979d53c9..c0b1a4c7 100644
+index 979d53c98..c0b1a4c7a 100644
 --- a/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
 +++ b/hotspot/src/cpu/aarch32/vm/relocInfo_aarch32.cpp
 @@ -87,6 +87,7 @@ address Relocation::pd_call_destination(address orig_addr) {
@@ -49,5 +51,5 @@ index 979d53c9..c0b1a4c7 100644
  
  void Relocation::pd_set_call_destination(address x) {
 -- 
-2.18.0
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-remaining-musl-fixes.patch b/recipes-core/openjdk/patches-openjdk-8/1202-hotspot-aarch32-remaining-musl-fixes.patch
similarity index 77%
rename from recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-remaining-musl-fixes.patch
rename to recipes-core/openjdk/patches-openjdk-8/1202-hotspot-aarch32-remaining-musl-fixes.patch
index 1140887..12137c1 100644
--- a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-remaining-musl-fixes.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1202-hotspot-aarch32-remaining-musl-fixes.patch
@@ -1,7 +1,7 @@
-From 4bab4a4468a59e303e8d05a409a07a24c2342452 Mon Sep 17 00:00:00 2001
+From 4726119a39e937ab1a70335a6bc89645742d44fd Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 20 Aug 2018 12:38:38 +0100
-Subject: [PATCH] hotspot: remaining musl fixes (aarch32)
+Subject: [PATCH 1202/1202] hotspot/aarch32: remaining musl fixes
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -14,12 +14,13 @@ Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: André Draszik <andre.draszik@jci.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
- hotspot/src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp | 1 -
+ src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/hotspot/src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp b/hotspot/src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp
-index 052a423c..93a315e4 100644
+index 2883fc17f..162504301 100644
 --- a/hotspot/src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp
 +++ b/hotspot/src/os_cpu/linux_aarch32/vm/os_linux_aarch32.cpp
 @@ -75,7 +75,6 @@
@@ -31,5 +32,5 @@ index 052a423c..93a315e4 100644
  #define REG_FP 29
  #define SPELL_REG_SP "sp"
 -- 
-2.11.0
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-Fix-further-functions-with-a-missing.patch b/recipes-core/openjdk/patches-openjdk-8/1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch
similarity index 72%
rename from recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-Fix-further-functions-with-a-missing.patch
rename to recipes-core/openjdk/patches-openjdk-8/1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch
index 0216c68..e4aa48f 100644
--- a/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-Fix-further-functions-with-a-missing.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch
@@ -1,8 +1,8 @@
-From 3dffe06da016a959f1d8c3afc292ab92a9d4d137 Mon Sep 17 00:00:00 2001
+From 2e611155c42352c1a0c15078681c6712711f6c01 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 17:03:56 +0100
-Subject: [PATCH] hotspot/aarch64: Fix further functions with a missing return
- value.
+Subject: [PATCH 1401/1402] hotspot/aarch64: Add missing return value to
+ LIR_Assembler::as_Address
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,17 +15,19 @@ Content-Transfer-Encoding: 8bit
 |# Parent  3ade0115344b77e6d00462044e0cf68722685bfe
 PR3519: Fix further functions with a missing return value.
 
-Signed-off-by: André Draszik <andre.draszik@jci.com>
 Upstream-Status: Backport
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
- hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp | 1 +
+ src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp b/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
-index 4e98cb39..bbc81b4a 100644
+index 7b85119c3..074e71a7d 100644
 --- a/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
 +++ b/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
-@@ -205,6 +205,7 @@ Address LIR_Assembler::as_Address(LIR_Address* addr, Register tmp) {
+@@ -207,6 +207,7 @@ Address LIR_Assembler::as_Address(LIR_Address* addr, Register tmp) {
        return Address(base, tmp, Address::lsl(addr->scale()));
      }
    }
@@ -34,5 +36,5 @@ index 4e98cb39..bbc81b4a 100644
  
  Address LIR_Assembler::as_Address_hi(LIR_Address* addr) {
 -- 
-2.18.0
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-remaining-musl-fixes.patch b/recipes-core/openjdk/patches-openjdk-8/1402-hotspot-aarch64-remaining-musl-fixes.patch
similarity index 74%
rename from recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-remaining-musl-fixes.patch
rename to recipes-core/openjdk/patches-openjdk-8/1402-hotspot-aarch64-remaining-musl-fixes.patch
index 436f012..2aafd82 100644
--- a/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-remaining-musl-fixes.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1402-hotspot-aarch64-remaining-musl-fixes.patch
@@ -1,7 +1,7 @@
-From 8e8e79c136fe56db119fd9a76fb881e96727c840 Mon Sep 17 00:00:00 2001
+From 033183cd3598ff8ba4a40ef529dfad89c6226ca6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:33:17 +0000
-Subject: [PATCH] hotspot: remaining musl fixes (aarch64)
+Subject: [PATCH 1402/1402] hotspot/aarch64: remaining musl fixes
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,24 +12,26 @@ Content-Transfer-Encoding: 8bit
 |            ^~~~~~~~~~~~~~~
 
 Upstream-Status: Inappropriate [OE specific]
+
 Signed-off-by: André Draszik <andre.draszik@jci.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
- hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp | 2 +-
+ src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
-index 8b985693..23f196cd 100644
+index 27dcbfa97..33779ae57 100644
 --- a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
 +++ b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
-@@ -75,7 +75,7 @@
+@@ -72,7 +72,7 @@
  # include <pwd.h>
  # include <poll.h>
  # include <ucontext.h>
 -# include <fpu_control.h>
 +# include <linux/types.h>  /* provides __u64 */
  
- #ifdef BUILTIN_SIM
- #define REG_SP REG_RSP
+ #define REG_FP 29
+ 
 -- 
-2.16.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
index 38d3019..ce4b385 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
@@ -1,7 +1,7 @@
-From 46ea1c28b53bf5fd2be03fa1d78936f6a1e70fc4 Mon Sep 17 00:00:00 2001
+From d2942510d891c58bd095a57bdd903145d3d95955 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 11:13:08 +0000
-Subject: [PATCH 2001/2008] jdk: comparison between pointer and integer
+Subject: [PATCH 2001/2009] jdk: comparison between pointer and integer
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,7 +28,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  3 files changed, 13 insertions(+), 14 deletions(-)
 
 diff --git a/jdk/src/share/native/java/net/net_util.c b/jdk/src/share/native/java/net/net_util.c
-index b1b8223a6..2eee6261a 100644
+index b1b8223a63..2eee6261ac 100644
 --- a/jdk/src/share/native/java/net/net_util.c
 +++ b/jdk/src/share/native/java/net/net_util.c
 @@ -108,7 +108,7 @@ jobject getInet6Address_scopeifname(JNIEnv *env, jobject iaObj) {
@@ -99,7 +99,7 @@ index b1b8223a6..2eee6261a 100644
              int scope;
  
 diff --git a/jdk/src/share/native/java/net/net_util.h b/jdk/src/share/native/java/net/net_util.h
-index c8a5e68c4..176ca586e 100644
+index c8a5e68c49..176ca586ee 100644
 --- a/jdk/src/share/native/java/net/net_util.h
 +++ b/jdk/src/share/native/java/net/net_util.h
 @@ -64,12 +64,12 @@ JNIEXPORT void JNICALL initInetAddressIDs(JNIEnv *env);
@@ -120,7 +120,7 @@ index c8a5e68c4..176ca586e 100644
  extern void setInetAddress_addr(JNIEnv *env, jobject iaObj, int address);
  extern void setInetAddress_family(JNIEnv *env, jobject iaObj, int family);
 diff --git a/jdk/src/solaris/native/java/net/Inet6AddressImpl.c b/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
-index 0a51a365f..dcc348cf1 100644
+index 0a51a365fd..dcc348cf1f 100644
 --- a/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
 +++ b/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
 @@ -392,7 +392,7 @@ Java_java_net_Inet6AddressImpl_lookupAllHostAddr(JNIEnv *env, jobject this,
@@ -142,5 +142,5 @@ index 0a51a365f..dcc348cf1 100644
                      goto cleanupAndReturn;
                  }
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
index 4d1df8a..d00b73a 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
@@ -1,7 +1,7 @@
-From aef9a3f955f6e189b2a24b9f79ccb396275d4fa3 Mon Sep 17 00:00:00 2001
+From bd5665d4aa962107eb3d51d20d8b8971d9fca044 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:36:53 +0000
-Subject: [PATCH 2002/2008] jdk: Allow using a system-installed libjpeg
+Subject: [PATCH 2002/2009] jdk: Allow using a system-installed libjpeg
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -30,10 +30,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  5 files changed, 51 insertions(+), 26 deletions(-)
 
 diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
-index a06bfd6db..12b9da11d 100644
+index 9368a9d508..7fffcafc70 100644
 --- a/jdk/make/lib/Awt2dLibraries.gmk
 +++ b/jdk/make/lib/Awt2dLibraries.gmk
-@@ -695,21 +695,24 @@ $(BUILD_LIBLCMS): $(BUILD_LIBAWT)
+@@ -702,21 +702,24 @@ $(BUILD_LIBLCMS): $(BUILD_LIBAWT)
  
  ##########################################################################################
  
@@ -64,7 +64,7 @@ index a06bfd6db..12b9da11d 100644
  # Suppress gcc warnings like "variable might be clobbered by 'longjmp'
  # or 'vfork'": this warning indicates that some variable is placed to
  # a register by optimized compiler and it's value might be lost on longjmp().
-@@ -721,37 +724,50 @@ endif
+@@ -728,37 +731,50 @@ endif
  #      $(shell $(EXPR) $(CC_MAJORVER) \> 4 \| \
  #          \( $(CC_MAJORVER) = 4 \& $(CC_MINORVER) \>= 3 \) )
  #  ifeq ($(CC_43_OR_NEWER), 1)
@@ -129,7 +129,7 @@ index a06bfd6db..12b9da11d 100644
  
  ##########################################################################################
  
-@@ -1142,6 +1158,13 @@ ifndef BUILD_HEADLESS_ONLY
+@@ -1149,6 +1165,13 @@ ifndef BUILD_HEADLESS_ONLY
      GIFLIB_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/giflib
    endif
  
@@ -143,7 +143,7 @@ index a06bfd6db..12b9da11d 100644
    ifneq ($(OPENJDK_TARGET_OS), macosx)
      LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/awt/splashscreen
    else
-@@ -1198,11 +1221,13 @@ ifndef BUILD_HEADLESS_ONLY
+@@ -1205,11 +1228,13 @@ ifndef BUILD_HEADLESS_ONLY
        EXCLUDE_FILES := imageioJPEG.c jpegdecoder.c pngtest.c, \
        LANG := C, \
        OPTIMIZATION := LOW, \
@@ -160,7 +160,7 @@ index a06bfd6db..12b9da11d 100644
        VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
        RC_FLAGS := $(RC_FLAGS) \
 diff --git a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
-index 8f58f5b3e..fcbab8260 100644
+index 8f58f5b3e6..fcbab82602 100644
 --- a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
 +++ b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
 @@ -89,7 +89,7 @@ public class JPEGImageReader extends ImageReader {
@@ -173,7 +173,7 @@ index 8f58f5b3e..fcbab8260 100644
                  }
              });
 diff --git a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
-index 6a33bd5a1..dca189ed8 100644
+index 6a33bd5a15..dca189ed85 100644
 --- a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
 +++ b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
 @@ -177,7 +177,7 @@ public class JPEGImageWriter extends ImageWriter {
@@ -186,7 +186,7 @@ index 6a33bd5a1..dca189ed8 100644
                  }
              });
 diff --git a/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java b/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
-index 872ffc019..5965a186b 100644
+index 872ffc0197..5965a186b9 100644
 --- a/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
 +++ b/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
 @@ -56,7 +56,7 @@ public class JPEGImageDecoder extends ImageDecoder {
@@ -199,7 +199,7 @@ index 872ffc019..5965a186b 100644
                  }
              });
 diff --git a/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c b/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
-index 7e1d8c99d..8cac61da3 100644
+index 7e1d8c99d7..8cac61da32 100644
 --- a/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
 +++ b/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
 @@ -51,7 +51,7 @@
@@ -212,5 +212,5 @@ index 7e1d8c99d..8cac61da3 100644
  #undef MAX
  #define MAX(a,b)        ((a) > (b) ? (a) : (b))
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
index 13d3045..eb79183 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
@@ -1,7 +1,7 @@
-From bdf8cb302ab7c8f11b676f93da482cd4a9405ce4 Mon Sep 17 00:00:00 2001
+From f74002f805b000df6565418d9e8416edbe86be25 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:43:04 +0000
-Subject: [PATCH 2003/2008] jdk: Allow using a system-installed libpng
+Subject: [PATCH 2003/2009] jdk: Allow using a system-installed libpng
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -24,10 +24,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  2 files changed, 10 insertions(+), 5 deletions(-)
 
 diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
-index 12b9da11d..cd8b94cd8 100644
+index 7fffcafc70..7f42e09ce4 100644
 --- a/jdk/make/lib/Awt2dLibraries.gmk
 +++ b/jdk/make/lib/Awt2dLibraries.gmk
-@@ -1148,7 +1148,6 @@ endif
+@@ -1155,7 +1155,6 @@ endif
  ifndef BUILD_HEADLESS_ONLY
    LIBSPLASHSCREEN_DIRS := \
      $(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg \
@@ -35,7 +35,7 @@ index 12b9da11d..cd8b94cd8 100644
      $(JDK_TOPDIR)/src/share/native/sun/awt/splashscreen
  
    ifeq ($(USE_EXTERNAL_LIBGIF), true)
-@@ -1165,6 +1164,13 @@ ifndef BUILD_HEADLESS_ONLY
+@@ -1172,6 +1171,13 @@ ifndef BUILD_HEADLESS_ONLY
      LIBJPEG_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg
    endif
  
@@ -49,7 +49,7 @@ index 12b9da11d..cd8b94cd8 100644
    ifneq ($(OPENJDK_TARGET_OS), macosx)
      LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/awt/splashscreen
    else
-@@ -1222,12 +1228,12 @@ ifndef BUILD_HEADLESS_ONLY
+@@ -1229,12 +1235,12 @@ ifndef BUILD_HEADLESS_ONLY
        LANG := C, \
        OPTIMIZATION := LOW, \
        CFLAGS := $(LIBSPLASHSCREEN_CFLAGS) $(CFLAGS_JDKLIB) \
@@ -65,7 +65,7 @@ index 12b9da11d..cd8b94cd8 100644
        VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
        RC_FLAGS := $(RC_FLAGS) \
 diff --git a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
-index 3599433e4..5bf002ea1 100644
+index 3599433e42..5bf002ea17 100644
 --- a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
 +++ b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
 @@ -25,8 +25,7 @@
@@ -79,5 +79,5 @@ index 3599433e4..5bf002ea1 100644
  
  #define SIG_BYTES 8
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
index 365b4d6..9895771 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
@@ -1,7 +1,7 @@
-From 48d7384387394820f2f5e8bdc2982c242568b548 Mon Sep 17 00:00:00 2001
+From d7f59185f159d8323b79d015c95e8c2fc99a8cbe Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
-Subject: [PATCH 2004/2008] jdk: use correct include for poll
+Subject: [PATCH 2004/2009] jdk: use correct include for poll
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -39,10 +39,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  10 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/jdk/src/aix/native/java/net/aix_close.c b/jdk/src/aix/native/java/net/aix_close.c
-index 8c070e4b7..126f4d7d4 100644
+index 90d57b42f0..fbeb73efa4 100644
 --- a/jdk/src/aix/native/java/net/aix_close.c
 +++ b/jdk/src/aix/native/java/net/aix_close.c
-@@ -51,7 +51,7 @@
+@@ -54,7 +54,7 @@
  #include <unistd.h>
  #include <errno.h>
  
@@ -52,7 +52,7 @@ index 8c070e4b7..126f4d7d4 100644
  /*
   * Stack allocated by thread when doing blocking operation
 diff --git a/jdk/src/aix/native/sun/nio/ch/AixPollPort.c b/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
-index 70064b890..c10c602b6 100644
+index 70064b890e..c10c602b6b 100644
 --- a/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
 +++ b/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
 @@ -34,7 +34,7 @@
@@ -65,7 +65,7 @@ index 70064b890..c10c602b6 100644
  #include <fcntl.h>
  #include <stddef.h>
 diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
-index 71cbdf8ce..170957e73 100644
+index 373c5e3625..9aafbc09e5 100644
 --- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
 +++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
 @@ -28,7 +28,7 @@
@@ -78,10 +78,10 @@ index 71cbdf8ce..170957e73 100644
  #include <netinet/tcp.h>        /* Defines TCP_NODELAY, needed for 2.6 */
  #include <netinet/in.h>
 diff --git a/jdk/src/solaris/native/java/net/bsd_close.c b/jdk/src/solaris/native/java/net/bsd_close.c
-index af57cef30..64d040887 100644
+index 89a20707c4..511ab845a8 100644
 --- a/jdk/src/solaris/native/java/net/bsd_close.c
 +++ b/jdk/src/solaris/native/java/net/bsd_close.c
-@@ -36,7 +36,7 @@
+@@ -38,7 +38,7 @@
  #include <sys/uio.h>
  #include <unistd.h>
  #include <errno.h>
@@ -91,10 +91,10 @@ index af57cef30..64d040887 100644
  /*
   * Stack allocated by thread when doing blocking operation
 diff --git a/jdk/src/solaris/native/java/net/linux_close.c b/jdk/src/solaris/native/java/net/linux_close.c
-index 98e1ce098..85fba135f 100644
+index eacc2afd15..159ca132c4 100644
 --- a/jdk/src/solaris/native/java/net/linux_close.c
 +++ b/jdk/src/solaris/native/java/net/linux_close.c
-@@ -34,7 +34,7 @@
+@@ -36,7 +36,7 @@
  #include <sys/uio.h>
  #include <unistd.h>
  #include <errno.h>
@@ -104,7 +104,7 @@ index 98e1ce098..85fba135f 100644
  /*
   * Stack allocated by thread when doing blocking operation
 diff --git a/jdk/src/solaris/native/java/net/net_util_md.h b/jdk/src/solaris/native/java/net/net_util_md.h
-index a48446de9..8915b68aa 100644
+index a48446de9c..8915b68aae 100644
 --- a/jdk/src/solaris/native/java/net/net_util_md.h
 +++ b/jdk/src/solaris/native/java/net/net_util_md.h
 @@ -33,7 +33,7 @@
@@ -117,7 +117,7 @@ index a48446de9..8915b68aa 100644
  
  
 diff --git a/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c b/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
-index 6860a167b..20849dabc 100644
+index 6860a167bb..20849dabcf 100644
 --- a/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
 +++ b/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
 @@ -28,7 +28,7 @@
@@ -130,7 +130,7 @@ index 6860a167b..20849dabc 100644
  #include <sys/time.h>
  
 diff --git a/jdk/src/solaris/native/sun/nio/ch/Net.c b/jdk/src/solaris/native/sun/nio/ch/Net.c
-index 73560ad6c..a3720055c 100644
+index 73560ad6c6..a3720055c4 100644
 --- a/jdk/src/solaris/native/sun/nio/ch/Net.c
 +++ b/jdk/src/solaris/native/sun/nio/ch/Net.c
 @@ -23,7 +23,7 @@
@@ -143,7 +143,7 @@ index 73560ad6c..a3720055c 100644
  #include <sys/socket.h>
  #include <string.h>
 diff --git a/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c b/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
-index 375aaa485..7606e9ba8 100644
+index 375aaa4850..7606e9ba82 100644
 --- a/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
 +++ b/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
 @@ -32,7 +32,7 @@
@@ -156,7 +156,7 @@ index 375aaa485..7606e9ba8 100644
  
  #include "sun_nio_fs_LinuxWatchService.h"
 diff --git a/jdk/src/solaris/transport/socket/socket_md.c b/jdk/src/solaris/transport/socket/socket_md.c
-index 33e062e08..819fcabdb 100644
+index 33e062e087..819fcabdb8 100644
 --- a/jdk/src/solaris/transport/socket/socket_md.c
 +++ b/jdk/src/solaris/transport/socket/socket_md.c
 @@ -37,7 +37,7 @@
@@ -169,5 +169,5 @@ index 33e062e08..819fcabdb 100644
  
  #include "socket_md.h"
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
index 32bde99..23ad075 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
@@ -1,7 +1,7 @@
-From 606c807be8e01a4cc99a02b50717d9bce141e8a2 Mon Sep 17 00:00:00 2001
+From 7a4979357c2efadda572162c097c5c8a19d27543 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
-Subject: [PATCH 2005/2008] jdk: use correct include for signal
+Subject: [PATCH 2005/2009] jdk: use correct include for signal
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -34,7 +34,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c b/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
-index c0d585796..c4abb7ae5 100644
+index c0d5857962..c4abb7ae5d 100644
 --- a/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
 +++ b/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
 @@ -32,7 +32,7 @@
@@ -47,7 +47,7 @@ index c0d585796..c4abb7ae5 100644
  /* Also defined in src/aix/native/java/net/aix_close.c */
  #define INTERRUPT_SIGNAL (SIGRTMAX - 1)
 diff --git a/jdk/src/macosx/javavm/export/jvm_md.h b/jdk/src/macosx/javavm/export/jvm_md.h
-index 012bb1bab..0b5757683 100644
+index 012bb1babe..0b57576833 100644
 --- a/jdk/src/macosx/javavm/export/jvm_md.h
 +++ b/jdk/src/macosx/javavm/export/jvm_md.h
 @@ -60,7 +60,7 @@
@@ -60,7 +60,7 @@ index 012bb1bab..0b5757683 100644
  /* O Flags */
  
 diff --git a/jdk/src/solaris/javavm/export/jvm_md.h b/jdk/src/solaris/javavm/export/jvm_md.h
-index 5c681914b..62415ee25 100644
+index 5c681914bb..62415ee255 100644
 --- a/jdk/src/solaris/javavm/export/jvm_md.h
 +++ b/jdk/src/solaris/javavm/export/jvm_md.h
 @@ -65,7 +65,7 @@
@@ -73,7 +73,7 @@ index 5c681914b..62415ee25 100644
  /* O Flags */
  
 diff --git a/jdk/src/solaris/native/sun/nio/ch/NativeThread.c b/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
-index 5e2a78b7a..204f0441a 100644
+index 5e2a78b7af..204f0441a9 100644
 --- a/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
 +++ b/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
 @@ -34,7 +34,7 @@
@@ -86,5 +86,5 @@ index 5e2a78b7a..204f0441a 100644
    #define INTERRUPT_SIGNAL (__SIGRTMAX - 2)
  #elif __solaris__
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
index dd5e051..84b103c 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
@@ -1,7 +1,7 @@
-From 86de5eb9d031e7f8d241725d5eeaa7030cf2ce2b Mon Sep 17 00:00:00 2001
+From 3848e70f0394c8f633dac1d3ccb7f029fc21fdb2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 13:58:07 +0000
-Subject: [PATCH 2006/2008] jdk: disable backtrace() (musl build fix)
+Subject: [PATCH 2006/2009] jdk: disable backtrace() (musl build fix)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -20,7 +20,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/jdk/src/solaris/native/sun/xawt/XToolkit.c b/jdk/src/solaris/native/sun/xawt/XToolkit.c
-index 2425bf43a..1c8ebdb42 100644
+index 2425bf43ae..1c8ebdb42a 100644
 --- a/jdk/src/solaris/native/sun/xawt/XToolkit.c
 +++ b/jdk/src/solaris/native/sun/xawt/XToolkit.c
 @@ -27,7 +27,7 @@
@@ -42,5 +42,5 @@ index 2425bf43a..1c8ebdb42 100644
  {
    void *array[10];
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
index 8f3d134..07ff9f1 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
@@ -1,7 +1,7 @@
-From 0708dd8e56c1f28c2215561ba3035c8c538acef6 Mon Sep 17 00:00:00 2001
+From 6eaec84f02a76005d631fad45cfa82620cfec56d Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:25:12 +0100
-Subject: [PATCH 2007/2008] jdk: no genx11 in headless
+Subject: [PATCH 2007/2009] jdk: no genx11 in headless
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/jdk/make/GenerateSources.gmk b/jdk/make/GenerateSources.gmk
-index ba443f7da..2170150ac 100644
+index ba443f7da5..2170150aca 100644
 --- a/jdk/make/GenerateSources.gmk
 +++ b/jdk/make/GenerateSources.gmk
 @@ -73,9 +73,11 @@ ifneq ($(OPENJDK_TARGET_OS), windows)
@@ -28,5 +28,5 @@ index ba443f7da..2170150ac 100644
  endif
  
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
index e725bf9..2f3360a 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
@@ -1,7 +1,7 @@
-From 0bb17a5083efcfd02e96ef034e51a190ea678f15 Mon Sep 17 00:00:00 2001
+From 5105a57bbfd463ddd441ac687bd0101c626188ed Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:26:42 +0100
-Subject: [PATCH 2008/2008] jdk: no unused deps
+Subject: [PATCH 2008/2009] jdk: no unused deps
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
@@ -12,7 +12,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  4 files changed, 26 insertions(+), 10 deletions(-)
 
 diff --git a/jdk/make/CompileNativeLibraries.gmk b/jdk/make/CompileNativeLibraries.gmk
-index c23b958b0..2984302f0 100644
+index c23b958b06..2984302f0a 100644
 --- a/jdk/make/CompileNativeLibraries.gmk
 +++ b/jdk/make/CompileNativeLibraries.gmk
 @@ -85,7 +85,9 @@ include lib/ServiceabilityLibraries.gmk
@@ -26,7 +26,7 @@ index c23b958b0..2984302f0 100644
  # Include the corresponding custom file, if present. 
  -include $(CUSTOM_MAKE_DIR)/CompileNativeLibraries.gmk
 diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
-index cd8b94cd8..8d9c37246 100644
+index 7f42e09ce4..10232b61ca 100644
 --- a/jdk/make/lib/Awt2dLibraries.gmk
 +++ b/jdk/make/lib/Awt2dLibraries.gmk
 @@ -232,6 +232,10 @@ ifeq ($(OPENJDK_TARGET_OS), aix)
@@ -40,7 +40,7 @@ index cd8b94cd8..8d9c37246 100644
  LIBAWT_CFLAGS += -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES \
      $(X_CFLAGS) \
      $(foreach dir, $(LIBAWT_DIRS), -I$(dir))
-@@ -801,17 +805,28 @@ ifeq ($(BUILD_HEADLESS), true)
+@@ -808,17 +812,28 @@ ifeq ($(BUILD_HEADLESS), true)
          -I$(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/jdga \
          $(foreach dir, $(LIBAWT_HEADLESS_DIRS), -I$(dir))
  
@@ -74,7 +74,7 @@ index cd8b94cd8..8d9c37246 100644
          OGLBlitLoops.c \
          OGLBufImgOps.c \
          OGLContext.c \
-@@ -824,10 +839,9 @@ ifeq ($(BUILD_HEADLESS), true)
+@@ -831,10 +846,9 @@ ifeq ($(BUILD_HEADLESS), true)
          OGLSurfaceData.c \
          OGLTextRenderer.c \
          OGLVertexCache.c \
@@ -88,7 +88,7 @@ index cd8b94cd8..8d9c37246 100644
      LIBAWT_HEADLESS_REORDER :=
      ifeq ($(OPENJDK_TARGET_OS), solaris)
 diff --git a/jdk/src/solaris/native/sun/awt/jawt.c b/jdk/src/solaris/native/sun/awt/jawt.c
-index 64284bc6e..b3584c7ef 100644
+index 64284bc6e9..b3584c7efe 100644
 --- a/jdk/src/solaris/native/sun/awt/jawt.c
 +++ b/jdk/src/solaris/native/sun/awt/jawt.c
 @@ -33,7 +33,7 @@
@@ -101,7 +101,7 @@ index 64284bc6e..b3584c7ef 100644
      return JNI_FALSE;
  #else
 diff --git a/jdk/src/solaris/native/sun/awt/utility/rect.h b/jdk/src/solaris/native/sun/awt/utility/rect.h
-index ceea38f43..8d85782ba 100644
+index ceea38f434..8d85782ba0 100644
 --- a/jdk/src/solaris/native/sun/awt/utility/rect.h
 +++ b/jdk/src/solaris/native/sun/awt/utility/rect.h
 @@ -28,7 +28,7 @@
@@ -114,5 +114,5 @@ index ceea38f43..8d85782ba 100644
  typedef XRectangle RECT_T;
  #else
 -- 
-2.24.1
+2.26.2
 
diff --git a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
new file mode 100644
index 0000000..ecd836c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
@@ -0,0 +1,29 @@
+From de3aa0cf20498ce1dc6056f976a4d9aa6f0ddd00 Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Thu, 20 Aug 2020 11:24:40 +0200
+Subject: [PATCH 2009/2009] jdk: make: use gcc instead of ld for
+ genSocketOptionRegistry
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ make/gensrc/GensrcMisc.gmk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jdk/make/gensrc/GensrcMisc.gmk b/jdk/make/gensrc/GensrcMisc.gmk
+index 9db5c9d6f7..84a3c27e7d 100644
+--- a/jdk/make/gensrc/GensrcMisc.gmk
++++ b/jdk/make/gensrc/GensrcMisc.gmk
+@@ -76,7 +76,7 @@ $(eval $(call SetupNativeCompilation,BUILD_GENSRC_SOR_EXE, \
+     INCLUDE_FILES := $(GENSRC_SOR_SRC_FILE), \
+     LANG := C, \
+     CC := $(BUILD_CC), \
+-    LDEXE := $(BUILD_LD), \
++    LDEXE := $(BUILD_CC), \
+     OBJECT_DIR := $(GENSRC_SOR_BIN), \
+     OUTPUT_DIR := $(GENSRC_SOR_BIN), \
+     PROGRAM := genSocketOptionRegistry))
+-- 
+2.26.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
deleted file mode 100644
index e35d0eb..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
-===================================================================
---- jdk8u-jdk8u242-ga.orig/jdk/make/gensrc/GensrcMisc.gmk
-+++ jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
-@@ -76,7 +76,7 @@ $(eval $(call SetupNativeCompilation,BUI
-     INCLUDE_FILES := $(GENSRC_SOR_SRC_FILE), \
-     LANG := C, \
-     CC := $(BUILD_CC), \
--    LDEXE := $(BUILD_LD), \
-+    LDEXE := $(BUILD_CC), \
-     OBJECT_DIR := $(GENSRC_SOR_BIN), \
-     OUTPUT_DIR := $(GENSRC_SOR_BIN), \
-     PROGRAM := genSocketOptionRegistry))
diff --git a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
deleted file mode 100644
index f6d7681..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3ed9b4a109cf2f31b97ab8ba317d67886452523c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 13 Aug 2020 17:59:42 +0200
-Subject: [PATCH] Remove usage of sys/sysctl.h
-
-This header has been removed in glibc 2.32, and isn't used for
-anything.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c | 1 -
- jdk/src/solaris/native/java/net/PlainSocketImpl.c         | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
-index cd15654e..4d8abe03 100644
---- a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
-+++ b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
-@@ -41,7 +41,6 @@
- #endif
- #ifdef __linux__
- #include <unistd.h>
--#include <sys/sysctl.h>
- #include <sys/utsname.h>
- #include <netinet/ip.h>
- 
-diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
-index 170957e7..9aafbc09 100644
---- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
-+++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
-@@ -43,7 +43,6 @@
- #endif
- #ifdef __linux__
- #include <unistd.h>
--#include <sys/sysctl.h>
- #endif
- 
- #include "jvm.h"
diff --git a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch
deleted file mode 100644
index b09745c..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- hotspot/src/cpu/zero/vm/entry_zero.hpp
-+++ hotspot/src/cpu/zero/vm/entry_zero.hpp
-@@ -26,6 +26,8 @@
- #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
- #define CPU_ZERO_VM_ENTRY_ZERO_HPP
- 
-+#include "utilities/globalDefinitions.hpp"
-+#include "utilities/exceptions.hpp"
- #include "interpreter/cppInterpreter.hpp"
- 
- class ZeroEntry {
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
deleted file mode 100644
index b09745c..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- hotspot/src/cpu/zero/vm/entry_zero.hpp
-+++ hotspot/src/cpu/zero/vm/entry_zero.hpp
-@@ -26,6 +26,8 @@
- #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
- #define CPU_ZERO_VM_ENTRY_ZERO_HPP
- 
-+#include "utilities/globalDefinitions.hpp"
-+#include "utilities/exceptions.hpp"
- #include "interpreter/cppInterpreter.hpp"
- 
- class ZeroEntry {
-- 
2.26.2

