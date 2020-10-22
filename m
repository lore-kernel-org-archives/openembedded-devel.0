Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web08.7618.1603356514158017015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 01:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=mSAZr+kt;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=5574c04ae=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1603356513; x=1634892513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NEj5wI6kCuXJT3U9TYFEfbzKGc/Z2pVn4uVg/NupyME=;
  b=mSAZr+ktD/Dl18fxhdadMJrOsE6AuoqrV96aBt6qBntxR1/XyjXxJhXc
   QR8zthBnt73xIuz3nC/d/cGQLe5TNAf7LrfYdgUKq7r4HT5QdpIK50Jwt
   9mfQUiTEADPnnjFQ9CghTTsjLh+HIgwji+8oSBbKkBYKEpXYsVJISRbc3
   hmewTIsz/1XEHk6lx/0HxBhnGxIDpllzk900f9MI0ZwzDNcpHvfkkwUXU
   ARS3UmO5HCXAZiqjouCboAW7RlU5nMBMdsba2czSRxlBfhLIC9H8xuPhW
   stwKIl5lad7L25xcPIs4oWCKXTKaAM/q7dhcAb/VWdCPaU7vIfKXuYPvX
   A==;
IronPort-SDR: 1Q+Ce6xAefz44OV+7qcZC/n2qDC+/duR/osvUSL3ctpIq32P6inIC1NqXYg7hZGQTp0OJpXMfp
 0LyVl+EKykl1RjCFQixYX3+bhEvrcNVw6bKJWFcrA8IuHg6Kz4+lTQFGcNh1iaBiZ9fARSyPSZ
 Xt1K36euUQtdlUa2dIpSnHaeS0vSMaqpT4u6pm2k3NPChEIoQwC9yF5eL4yCHiUfK0pq43g2nb
 usG52iuDfhlGXzDz6e+Zm2jRm5vfcLGDGjijBe2g9Izw6BD9ldmEN5OM+OixuF1IgHxoKjcpvy
 Uws=
X-IronPort-AV: E=Sophos;i="5.77,404,1596492000"; 
   d="scan'208";a="27679199"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH] openjdk-8: update to latest ga version 272
Date: Thu, 22 Oct 2020 10:48:15 +0200
Message-ID: <20201022084815.216184-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex4srv.skidata.net (192.168.111.82)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For aarch32 we need to fall back to b09 as there is no ga tag available
yet.

Patch related changes:
 * 0011, 0012 & 0013 were changed to valid git patches

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 docs/update8checksums.sh                      |  2 +-
 ...-native_265.bb => openjdk-8-native_272.bb} |  0
 .../openjdk/openjdk-8-release-aarch32.inc     | 34 +++++-----
 .../openjdk/openjdk-8-release-aarch64.inc     | 18 +++---
 recipes-core/openjdk/openjdk-8-release.inc    | 16 ++---
 .../{openjdk-8_265.bb => openjdk-8_272.bb}    |  0
 .../{openjre-8_265.bb => openjre-8_272.bb}    |  0
 ...low-using-a-system-installed-libjpeg.patch |  4 +-
 ...llow-using-a-system-installed-libpng.patch |  4 +-
 ...uild-on-as-needed-toolchains-generic.patch |  4 +-
 .../0004-don-t-expect-fqpn-for-make.patch     |  4 +-
 ...005-autoconf-filter-aclocal-copy-too.patch |  4 +-
 .../0006-autoconf-handle-extra-output.patch   |  4 +-
 ...-assembler-flag-handling-in-makefile.patch |  4 +-
 ...0008-autoconf-fix-shark-build-common.patch |  4 +-
 ...o-in-favour-of-openembedded-package-.patch |  4 +-
 ...move-shell-variables-from-autoheader.patch |  4 +-
 ...conf-fix-CC-with-arguments-detection.patch | 20 +++++-
 ...onf-NativeCompilation-remove-sysroot.patch | 17 ++++-
 .../0013-autoconf-remove-Werror.patch         | 62 +++++++++++--------
 ...otspot-fix-crash-on-JNI_CreateJavaVM.patch |  2 +-
 ...hotspot-use-correct-include-for-poll.patch |  2 +-
 ...otspot-don-t-rely-on-old-SysV-SIGCLD.patch |  2 +-
 ...urn-type-issues-introduced-by-806165.patch | 10 +--
 ...ero-build-requires-disabled-warnings.patch |  2 +-
 ...return-statement-in-__sync_val_compa.patch |  2 +-
 ...pot-Turn-on-the-Wreturn-type-warning.patch | 20 +++---
 ...otspot-handle-format-error-for-GCC-7.patch |  2 +-
 .../1009-hotspot-fix-adlc-flags.patch         |  2 +-
 .../1010-hotspot-fix-shark-build-common.patch | 10 +--
 ...1011-hotspot-restrict-to-staging-dir.patch |  2 +-
 .../1012-hotspot-enable-Wno-error.patch       |  2 +-
 ...missing-includes-for-shark-build-pt2.patch |  2 +-
 ...mparison-between-pointer-and-integer.patch |  2 +-
 ...low-using-a-system-installed-libjpeg.patch |  2 +-
 ...llow-using-a-system-installed-libpng.patch |  2 +-
 ...004-jdk-use-correct-include-for-poll.patch |  2 +-
 ...5-jdk-use-correct-include-for-signal.patch |  2 +-
 ...jdk-disable-backtrace-musl-build-fix.patch |  6 +-
 .../2007-jdk-no-genx11-in-headless.patch      |  2 +-
 .../2008-jdk-no-unused-deps.patch             |  2 +-
 ...-instead-of-ld-for-genSocketOptionRe.patch |  2 +-
 42 files changed, 167 insertions(+), 124 deletions(-)
 rename recipes-core/openjdk/{openjdk-8-native_265.bb => openjdk-8-native_272.bb} (100%)
 rename recipes-core/openjdk/{openjdk-8_265.bb => openjdk-8_272.bb} (100%)
 rename recipes-core/openjdk/{openjre-8_265.bb => openjre-8_272.bb} (100%)

diff --git a/docs/update8checksums.sh b/docs/update8checksums.sh
index 476841b..ccf68d1 100755
--- a/docs/update8checksums.sh
+++ b/docs/update8checksums.sh
@@ -31,7 +31,7 @@ COMMON_TAG="jdk8u${OPENJDK_UPDATE}-ga"
 
 AARCH32_BASEURL="https://hg.openjdk.java.net/aarch32-port/jdk8u"
 AARCH32_CHANGESET_ID="$(grep "^CHANGESET_ID" recipes-core/openjdk/openjdk-8-release-aarch32.inc | cut -d= -f2 | tr -d \")"
-AARCH32_TAG="jdk8u${OPENJDK_UPDATE}-ga-aarch32-${AARCH32_CHANGESET_ID}"
+AARCH32_TAG="jdk8u${OPENJDK_UPDATE}-${AARCH32_CHANGESET_ID}"
 
 AARCH64_BASEURL="https://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah"
 AARCH64_CHANGESET_ID="$(grep "^CHANGESET_ID" recipes-core/openjdk/openjdk-8-release-aarch64.inc | cut -d= -f2 | tr -d \")"
diff --git a/recipes-core/openjdk/openjdk-8-native_265.bb b/recipes-core/openjdk/openjdk-8-native_272.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-native_265.bb
rename to recipes-core/openjdk/openjdk-8-native_272.bb
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
index 1366ba5..700a0f5 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch32.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
@@ -4,31 +4,31 @@ COMPATIBLE_HOST = "^$"
 COMPATIBLE_HOST_armv7a = "arm"
 COMPATIBLE_HOST_armv7ve = "arm"
 
-CHANGESET_ID="20200729"
+CHANGESET_ID="b09-aarch32-20200929"
 
-CORBA_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[corba.sha256sum] = "ade9cc2019f274efa8192a10b5ff5ca689671862c93b167f64fbac0673b1ee14"
+CORBA_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[corba.sha256sum] = "3675f043479c7e3ee7128651527d15c4e56f72d22dd953b8d0d8e5c9a2c68741"
 
-HOTSPOT_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[hotspot.sha256sum] = "2ce8c243c25f1607273fab7261203485926144b240a9a2f3298e7eaaad502f35"
+HOTSPOT_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[hotspot.sha256sum] = "d5ea125d7e54fd3dd21bf1654c09b5ce17497d9327f770abd56ad1108a337b81"
 
-JAXP_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxp.sha256sum] = "d318addf2fbab69c588c61bf86b128d491271c9c27bebbb69cab6bfbf0967990"
+JAXP_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[jaxp.sha256sum] = "a025f9f047bc50947aa631641b2f836c3a3ec4a5f2c9019bc7b11ab8444f7b9e"
 
-JAXWS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxws.sha256sum] = "452bd7be71bc7da65554da97c35470fb3c2f18228cbbf2ae01dd7ccdfeb55394"
+JAXWS_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[jaxws.sha256sum] = "ad921e0f5cafab4c5b4bb248ea59bf1615864c4de17bfd7321759d063398dc3f"
 
-JDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jdk.sha256sum] = "b7068f3d21b060b4ffd9951eb07d9e24e6415d5ad49d1cc20c897f7d88349212"
+JDK_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[jdk.sha256sum] = "835e81fc88b8c0e40df0d89be5d8a852638b3f5f29acad6997cbc36a2e8341fe"
 
-LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[langtools.sha256sum] = "9ff01c83c40acedfb87ce566d88d135a5c92f5cc7ca110d5f5895305346f7968"
+LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[langtools.sha256sum] = "554491026bb9fadb837d635d4beea3ca9cb73f034c1379d57fcd77787816139f"
 
-NASHORN_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[nashorn.sha256sum] = "a752ebdeea4382f0d0c005861eea59c8b90a3488497974c2abc8915d4673cd0f"
+NASHORN_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[nashorn.sha256sum] = "8358000a7e52fcfd046027319569d17f2e99b710acbfd1a1120b50ce93afe223"
 
-OPENJDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[openjdk.sha256sum] = "f42a7536ea7c76711e5b7caa0f42c8797145e68f0881f8fa9b8517ff48d0d747"
+OPENJDK_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+SRC_URI[openjdk.sha256sum] = "4b38e672c82df5d18215849829a80a111b1c7b46567bc641e9fec92bedd0d32a"
 
 PACKAGECONFIG_append_armv7a = " client"
 PACKAGECONFIG_append_armv7ve = " client"
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
index 7a6d9e3..c71dd25 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
@@ -2,28 +2,28 @@ require openjdk-8-release-common.inc
 
 COMPATIBLE_HOST = "aarch64"
 
-CHANGESET_ID="b01"
+CHANGESET_ID="b10"
 
 CORBA_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[corba.sha256sum] = "43636545f3a4ad08e11728d20472d0bc8bb05b4833f9ab2bdcd0d195f8b6f96c"
+SRC_URI[corba.sha256sum] = "112143d935a94cb95a0f9dba19a86184d08e699a68a82db58cdd9f0de1baeeae"
 
 HOTSPOT_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[hotspot.sha256sum] = "4ddf5e0e2e7840211849bf13ffafeda69696c1477ae1720c802e3182d87798fd"
+SRC_URI[hotspot.sha256sum] = "16ed30b46279e2ffef04ab392502e32525451bea38f3af0d3c3782bcd33a0274"
 
 JAXP_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxp.sha256sum] = "215920996bffd3cf7ebfd14f767b3f302503cddf82c1c0a63759764426c03938"
+SRC_URI[jaxp.sha256sum] = "5dde165d7327b08f2ebc8d3081a1734d9ef737117dcaa417eb7dc39344220987"
 
 JAXWS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxws.sha256sum] = "96d8c429e4286184e008b6ee20942f6abaf01c014bc384a441552f7eb521ec5f"
+SRC_URI[jaxws.sha256sum] = "cedde28264a85cb16ae46123091edb64f7c1d2cd5f3de6ba0d21cffff84c3ccf"
 
 JDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jdk.sha256sum] = "f0b882d16ef766ebce0e0106e54034a14ef5cd15dae2aff4695c199f6a84bce1"
+SRC_URI[jdk.sha256sum] = "7e53438e0506536fe373b7f8176512c701b87adda268831d180ead2695154a93"
 
 LANGTOOLS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[langtools.sha256sum] = "a115bd03600093658dc9da549122e553fd6ce6cb7f317fb4461e15efad8ab140"
+SRC_URI[langtools.sha256sum] = "8dbcd45109d0c782a6cac5a1a310a5816d4dac8a9c095635832ab803bfdb861a"
 
 NASHORN_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[nashorn.sha256sum] = "43ba2d8b825cf521e6ffb429f8578afc9ca7d90d6daf9bd2b22d598fb532d871"
+SRC_URI[nashorn.sha256sum] = "85497cdba0943644d838862761891d0a06dfaad5ea13b63af69f1a6d595e6387"
 
 OPENJDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[openjdk.sha256sum] = "dd46927e9821a69083feaff2161cce19d2cbbc2549be6c28da996ddba52b0d11"
+SRC_URI[openjdk.sha256sum] = "97175c78de4c82b78d3c80b1b0d22c44b195ca067f253cfaa3c235328b808760"
diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/openjdk/openjdk-8-release.inc
index 5660c17..2694077 100644
--- a/recipes-core/openjdk/openjdk-8-release.inc
+++ b/recipes-core/openjdk/openjdk-8-release.inc
@@ -7,25 +7,25 @@ COMPATIBLE_HOST_armv7a = "^$"
 COMPATIBLE_HOST_armv7ve = "^$"
 
 CORBA_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[corba.sha256sum] = "a3adf57f7d50155bb83926afc2ca0007c6f17602660bacaff67201dd886b379f"
+SRC_URI[corba.sha256sum] = "51212e37b6c6e120901e61b830f110bbd121e9c4611aec9ff4e3f404a667855f"
 
 HOTSPOT_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[hotspot.sha256sum] = "b4f6ab5466fc73f6e015d5394b4204453a109dc532e8bbac069c46c109545ce6"
+SRC_URI[hotspot.sha256sum] = "a8c83dcd272dc29c538291f24d1b28b7069e048398681b6db082cdaa8f3a6b07"
 
 JAXP_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxp.sha256sum] = "d8e6a5bf406bf32f7806081907bd299098f13ade00260a737d3c141bcc2890a9"
+SRC_URI[jaxp.sha256sum] = "3f8b02337f4cd96e9180aa118705f48c39562f66287b46dd69554221fa196084"
 
 JAXWS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxws.sha256sum] = "436a0aaecda8f2cc66ef2cbccea34a85887e5646fff60036473c08f975a68e33"
+SRC_URI[jaxws.sha256sum] = "ed276f9a70bf2582183838ad8b1874c0993b4a28741c69f095669667b12cd3d4"
 
 JDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jdk.sha256sum] = "f9ca5bcda71f91d087d7483c1ae53d266a92f9691836f1cbbfaa37a9993f1f9b"
+SRC_URI[jdk.sha256sum] = "a3deeab4ac721d1ce9d8a2fb1917ba9e2afc6041f03ad4a342e9a5441cce621d"
 
 LANGTOOLS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[langtools.sha256sum] = "ea33875d91addd8f6dd52afe5cfa11c108f0e378df8451ed22a4e6767576c899"
+SRC_URI[langtools.sha256sum] = "ed59eabe4eb3fcf9af592d1af2d052c5053da9d868542fc47a0bddcb91e69c60"
 
 NASHORN_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[nashorn.sha256sum] = "660148fab294a98147d346209e19b6dcf82807588d3c8c54abfc1262c95043d4"
+SRC_URI[nashorn.sha256sum] = "a5b8c478cd7695bf83210b8e97be3bfc8248c22916cec3b8b869586c3d7f0007"
 
 OPENJDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[openjdk.sha256sum] = "b5fd22b2f4a0a59611373e5f1ffc423d26e62ea38f1084a80a401beb6bd04d88"
+SRC_URI[openjdk.sha256sum] = "a80476dfe32c12882fe2d87bdb0dd37fc4a0dae8dd95f0c22c7c2445fc08ff7e"
diff --git a/recipes-core/openjdk/openjdk-8_265.bb b/recipes-core/openjdk/openjdk-8_272.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8_265.bb
rename to recipes-core/openjdk/openjdk-8_272.bb
diff --git a/recipes-core/openjdk/openjre-8_265.bb b/recipes-core/openjdk/openjre-8_272.bb
similarity index 100%
rename from recipes-core/openjdk/openjre-8_265.bb
rename to recipes-core/openjdk/openjre-8_272.bb
diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
index 10e5756..3bc5630 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
@@ -1,7 +1,7 @@
-From 7f505a0a0b34580fbb9c1f0d6a06e8ae486088c6 Mon Sep 17 00:00:00 2001
+From 21c555306afcc4cab2819adc550f1546f3390d15 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:36:53 +0000
-Subject: [PATCH 01/10] Allow using a system-installed libjpeg
+Subject: [PATCH 01/13] Allow using a system-installed libjpeg
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
index 7a840e1..98c09d6 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
@@ -1,7 +1,7 @@
-From 36bb38c31724a3d24ba215ee2de76985fc09bead Mon Sep 17 00:00:00 2001
+From 17413a1bca9a6c27e049122d65b0d4fa291a53ec Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Thu, 2 Jan 2020 13:40:50 +0100
-Subject: [PATCH 02/10] Allow using a system-installed libpng
+Subject: [PATCH 02/13] Allow using a system-installed libpng
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
index 1736829..d2b6031 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
@@ -1,7 +1,7 @@
-From 862b38ca47d0fa1b953d11f245c44cf176ce9104 Mon Sep 17 00:00:00 2001
+From 770123c9fcc4ab8c8ce8f37cde5afe9c44c7176c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 12 Mar 2018 15:40:58 +0000
-Subject: [PATCH 03/10] build: fix build on --as-needed toolchains (generic)
+Subject: [PATCH 03/13] build: fix build on --as-needed toolchains (generic)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
index 9b4605d..77efe81 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
@@ -1,7 +1,7 @@
-From 5eab9b7dfef9c906f7543ef2fcb2dceeef8b8628 Mon Sep 17 00:00:00 2001
+From 12dbeed90199730ad56ad842ae53e9d8aa477c0c Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:42:43 +0100
-Subject: [PATCH 04/10] don't expect fqpn for make
+Subject: [PATCH 04/13] don't expect fqpn for make
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
index 05c54a9..27a2ff2 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
@@ -1,7 +1,7 @@
-From 307281e9a66f391c737b03cf8ce021474f5eaabd Mon Sep 17 00:00:00 2001
+From def92aa795271fa3e6fd36009d89e06009d21c6a Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:44:25 +0100
-Subject: [PATCH 05/10] autoconf: filter aclocal copy too
+Subject: [PATCH 05/13] autoconf: filter aclocal copy too
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
index 3aa0c4e..58dd7bc 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
@@ -1,7 +1,7 @@
-From a861d45b40ed3b08dad9aef86dc8ba21fdc4e324 Mon Sep 17 00:00:00 2001
+From ee5e07895570a9ea2ae2490f3b159bde29967238 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Thu, 2 Jan 2020 13:45:42 +0100
-Subject: [PATCH 06/10] autoconf: handle extra output
+Subject: [PATCH 06/13] autoconf: handle extra output
 
 When adding the environment variable JAVA_TOOL_OPTIONS an extra line
 in the output from 'java -version' is produced. As this output is
diff --git a/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
index 7a3bc88..01cabbd 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
@@ -1,7 +1,7 @@
-From 4ba108476c0756ab567235d692c80acf477c310e Mon Sep 17 00:00:00 2001
+From b8d48149b05fcd1a12dce25ffc345b43aaa76f32 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
 Date: Thu, 2 Jan 2020 13:49:02 +0100
-Subject: [PATCH 07/10] fix assembler flag handling in makefile
+Subject: [PATCH 07/13] fix assembler flag handling in makefile
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
index 09305f0..84a37a3 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
@@ -1,7 +1,7 @@
-From e945d20be2b7b12d234ff467d3d988c9811d3cad Mon Sep 17 00:00:00 2001
+From c03f916a8a49a3c83f72f28fefa6eab6377b909c Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:51:40 +0100
-Subject: [PATCH 08/10] autoconf: fix shark build (common)
+Subject: [PATCH 08/13] autoconf: fix shark build (common)
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
index ecc69bd..294e448 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
@@ -1,7 +1,7 @@
-From ff6e6f4ea3a782e499a872f5de6f80335b9bafb5 Mon Sep 17 00:00:00 2001
+From a2a8f8df244efca22da633b676a45d62b2fbb580 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:53:50 +0100
-Subject: [PATCH 09/10] prevent debuginfo in favour of openembedded package
+Subject: [PATCH 09/13] prevent debuginfo in favour of openembedded package
  split
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
diff --git a/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
index 1a95961..2aa4a8d 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
@@ -1,7 +1,7 @@
-From 13a668aa69c201cc740400174c4be3c58fdc4df5 Mon Sep 17 00:00:00 2001
+From 8864d47290e9d5563fb8f3ea92639c4accc46fe8 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:55:29 +0100
-Subject: [PATCH 10/10] autoconf: remove shell variables from autoheader
+Subject: [PATCH 10/13] autoconf: remove shell variables from autoheader
 
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 ---
diff --git a/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch b/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
index f1de194..88d2192 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
@@ -1,5 +1,20 @@
+From e878eea93b95d82d3ea13f4122f4f74cd2f8f3df Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Thu, 22 Oct 2020 09:23:06 +0200
+Subject: [PATCH 11/13] autoconf: fix CC with arguments detection
+
+Fix the compiler binary detection for exported CC variables with
+arguments in them.
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ common/autoconf/toolchain.m4 | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
 diff --git a/common/autoconf/toolchain.m4 b/common/autoconf/toolchain.m4
-index e3a82c8..705e3e7 100644
+index c0a4af5..28da6ea 100644
 --- a/common/autoconf/toolchain.m4
 +++ b/common/autoconf/toolchain.m4
 @@ -478,23 +478,30 @@ AC_DEFUN([TOOLCHAIN_FIND_COMPILER],
@@ -41,3 +56,6 @@ index e3a82c8..705e3e7 100644
    else
      # No user supplied value. Locate compiler ourselves.
  
+-- 
+2.26.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch b/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
index 39179d4..fc8fca5 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
@@ -1,5 +1,17 @@
+From 03052435dc7f1146ddd7ebe6f510a89448d33aca Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Thu, 22 Oct 2020 09:24:50 +0200
+Subject: [PATCH 12/13] autoconf: NativeCompilation: remove sysroot
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ make/common/NativeCompilation.gmk | 6 ------
+ 1 file changed, 6 deletions(-)
+
 diff --git a/make/common/NativeCompilation.gmk b/make/common/NativeCompilation.gmk
-index d961cf3..9679f97 100644
+index b4ea2c6..01082f5 100644
 --- a/make/common/NativeCompilation.gmk
 +++ b/make/common/NativeCompilation.gmk
 @@ -383,10 +383,6 @@ define SetupNativeCompilation
@@ -22,3 +34,6 @@ index d961cf3..9679f97 100644
    $1 := $$($1_TARGET)
    ifneq (,$$($1_LIBRARY))
      # Generating a dynamic library.
+-- 
+2.26.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
index 4610c73..d3bd8e7 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
@@ -1,18 +1,24 @@
-# HG changeset patch
-# User Richard Leitner <richard.leitner@skidata.com>
-# Date 1588148111 -7200
-#      Wed Apr 29 10:15:11 2020 +0200
-# Node ID e063bb17c5fb8edfbad1bfb5237b69350645ed0b
-# Parent  041cb274be1207a991e05b041f57a800e8132cff
-autoconf: remove Werror
+From 3d7493808f435b70101003534d98e249bf7e734c Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Wed, 29 Apr 2020 10:15:11 +0200
+Subject: [PATCH 13/13] autoconf: remove Werror
 
 We don't want to mess around with disabling warnings on new
 compiler versions therefore we remove Werror.
 
-diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/flags.m4
---- a/common/autoconf/flags.m4	Fri Apr 24 04:22:43 2020 +0100
-+++ b/common/autoconf/flags.m4	Wed Apr 29 10:15:11 2020 +0200
-@@ -399,7 +399,7 @@
+Upstream-Status: Invalid
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ common/autoconf/flags.m4               | 12 +++---
+ common/autoconf/generated-configure.sh | 56 +++++++++++++-------------
+ 2 files changed, 34 insertions(+), 34 deletions(-)
+
+diff --git a/common/autoconf/flags.m4 b/common/autoconf/flags.m4
+index 077efa2..b98575a 100644
+--- a/common/autoconf/flags.m4
++++ b/common/autoconf/flags.m4
+@@ -399,7 +399,7 @@ AC_DEFUN_ONCE([FLAGS_SETUP_COMPILER_FLAGS_FOR_JDK],
        LEGACY_EXTRA_LDFLAGS="$LEGACY_EXTRA_LDFLAGS -Wl,-z,relro"
      fi
      $2CXXSTD_CXXFLAG="-std=gnu++98"
@@ -21,7 +27,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/flags.m4
                                         [], [$2CXXSTD_CXXFLAG=""])
      $2CXXFLAGS_JDK="${$2CXXFLAGS_JDK} ${$2CXXSTD_CXXFLAG}"
      $2JVM_CFLAGS="${$2JVM_CFLAGS} ${$2CXXSTD_CXXFLAG}"
-@@ -489,17 +489,17 @@
+@@ -489,17 +489,17 @@ AC_DEFUN_ONCE([FLAGS_SETUP_COMPILER_FLAGS_FOR_JDK],
      # Notably, -ffp-contract=off needs to be added for GCC >= 4.6,
      #          -mno-fused-madd -fno-strict-aliasing for GCC < 4.6
      COMPILER_FP_CONTRACT_OFF_FLAG="-ffp-contract=off"
@@ -42,7 +48,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/flags.m4
                                             [], [NO_STRICT_ALIASING_FLAG=""])
          if test "x$M_NO_FUSED_ADD_FLAG" != "x" && test "x$NO_STRICT_ALIASING_FLAG" != "x"; then
            FDLIBM_CFLAGS="$M_NO_FUSED_ADD_FLAG $NO_STRICT_ALIASING_FLAG"
-@@ -866,11 +866,11 @@
+@@ -866,11 +866,11 @@ AC_DEFUN_ONCE([FLAGS_SETUP_GCC6_COMPILER_FLAGS],
    # Notably, value range propagation now assumes that the this pointer of C++
    # member functions is non-null.
    NO_DELETE_NULL_POINTER_CHECKS_CFLAG="-fno-delete-null-pointer-checks"
@@ -56,10 +62,11 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/flags.m4
                                       [], [NO_LIFETIME_DSE_CFLAG=""])
    CFLAGS_JDK="${CFLAGS_JDK} ${NO_DELETE_NULL_POINTER_CHECKS_CFLAG} ${NO_LIFETIME_DSE_CFLAG}"
    AC_SUBST([NO_LIFETIME_DSE_CFLAG])
-diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
---- a/common/autoconf/generated-configure.sh	Fri Apr 24 04:22:43 2020 +0100
-+++ b/common/autoconf/generated-configure.sh	Wed Apr 29 10:15:11 2020 +0200
-@@ -41490,12 +41490,12 @@
+diff --git a/common/autoconf/generated-configure.sh b/common/autoconf/generated-configure.sh
+index d57035b..1953dc4 100644
+--- a/common/autoconf/generated-configure.sh
++++ b/common/autoconf/generated-configure.sh
+@@ -41498,12 +41498,12 @@ $as_echo "$ac_cv_c_bigendian" >&6; }
      fi
      CXXSTD_CXXFLAG="-std=gnu++98"
  
@@ -75,7 +82,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41646,12 +41646,12 @@
+@@ -41654,12 +41654,12 @@ fi
    NO_DELETE_NULL_POINTER_CHECKS_CFLAG="-fno-delete-null-pointer-checks"
  
  
@@ -91,7 +98,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=c
  ac_cpp='$CPP $CPPFLAGS'
  ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41686,12 +41686,12 @@
+@@ -41694,12 +41694,12 @@ $as_echo "$supports" >&6; }
    fi
  
  
@@ -107,7 +114,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41725,8 +41725,8 @@
+@@ -41733,8 +41733,8 @@ $as_echo "$supports" >&6; }
    fi
  
  
@@ -118,7 +125,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    supports=no
    if test "x$C_COMP_SUPPORTS" = "xyes" -a "x$CXX_COMP_SUPPORTS" = "xyes"; then supports=yes; fi
  
-@@ -41742,12 +41742,12 @@
+@@ -41750,12 +41750,12 @@ $as_echo "$supports" >&6; }
    NO_LIFETIME_DSE_CFLAG="-fno-lifetime-dse"
  
  
@@ -134,7 +141,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=c
  ac_cpp='$CPP $CPPFLAGS'
  ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41781,12 +41781,12 @@
+@@ -41789,12 +41789,12 @@ $as_echo "$supports" >&6; }
    fi
  
  
@@ -150,7 +157,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41820,8 +41820,8 @@
+@@ -41828,8 +41828,8 @@ $as_echo "$supports" >&6; }
    fi
  
  
@@ -161,7 +168,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    supports=no
    if test "x$C_COMP_SUPPORTS" = "xyes" -a "x$CXX_COMP_SUPPORTS" = "xyes"; then supports=yes; fi
  
-@@ -41854,12 +41854,12 @@
+@@ -41862,12 +41862,12 @@ $as_echo "$supports" >&6; }
      #          -mno-fused-madd -fno-strict-aliasing for GCC < 4.6
      COMPILER_FP_CONTRACT_OFF_FLAG="-ffp-contract=off"
  
@@ -177,7 +184,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41898,12 +41898,12 @@
+@@ -41906,12 +41906,12 @@ $as_echo "$supports" >&6; }
           test "$OPENJDK_TARGET_CPU_ARCH" = "ppc"; then
          M_NO_FUSED_ADD_FLAG="-mno-fused-madd"
  
@@ -193,7 +200,7 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-@@ -41938,12 +41938,12 @@
+@@ -41946,12 +41946,12 @@ $as_echo "$supports" >&6; }
  
          NO_STRICT_ALIASING_FLAG="-fno-strict-aliasing"
  
@@ -209,3 +216,6 @@ diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
    ac_ext=cpp
  ac_cpp='$CXXCPP $CPPFLAGS'
  ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+-- 
+2.26.2
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
index 760c9e4..b2e50e0 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
@@ -1,4 +1,4 @@
-From ca63ab55217cbef6aea495139f766922c61e50b2 Mon Sep 17 00:00:00 2001
+From 4d1bd6a65c52564f32761217ded7b9bdde43556b Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Sun, 17 Feb 2019 22:38:33 -0800
 Subject: [PATCH 1001/1013] hotspot: fix crash on JNI_CreateJavaVM
diff --git a/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
index 95c7d75..aa93c25 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
@@ -1,4 +1,4 @@
-From 5f8b64ed6697443f3abb12773e3fb1ac6b545c8a Mon Sep 17 00:00:00 2001
+From e40d948b71ff33d74c6e1595a798f359fb673d8f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 1002/1013] hotspot: use correct include for poll
diff --git a/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
index f0794ed..974c3a9 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
@@ -1,4 +1,4 @@
-From 0d367dbb17112939f81286f2c600b7e00e226bcb Mon Sep 17 00:00:00 2001
+From 1a4d6458d94bc275a740cab895f8ada303916cd6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:00:55 +0000
 Subject: [PATCH 1003/1013] hotspot: don't rely on old SysV SIGCLD
diff --git a/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
index b36dc37..54534ed 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
@@ -1,4 +1,4 @@
-From de5bf18a604e8213fe5a6510a37783c134af90c6 Mon Sep 17 00:00:00 2001
+From 794a7bf743e23ff74c4900801ddc56c253542b44 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:40:34 +0100
 Subject: [PATCH 1004/1013] hotspot: fix -Wreturn-type issues introduced by
@@ -24,10 +24,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
-index bc3ff540d..29532ab11 100644
+index c32c98ade..6f2221c41 100644
 --- a/hotspot/src/share/vm/prims/jvm.cpp
 +++ b/hotspot/src/share/vm/prims/jvm.cpp
-@@ -918,7 +918,7 @@ JVM_END
+@@ -929,7 +929,7 @@ JVM_END
  JVM_ENTRY(jboolean, JVM_KnownToNotExist(JNIEnv *env, jobject loader, const char *classname))
    JVMWrapper("JVM_KnownToNotExist");
  #if INCLUDE_CDS
@@ -36,7 +36,7 @@ index bc3ff540d..29532ab11 100644
  #else
    return false;
  #endif
-@@ -928,7 +928,7 @@ JVM_END
+@@ -939,7 +939,7 @@ JVM_END
  JVM_ENTRY(jobjectArray, JVM_GetResourceLookupCacheURLs(JNIEnv *env, jobject loader))
    JVMWrapper("JVM_GetResourceLookupCacheURLs");
  #if INCLUDE_CDS
@@ -45,7 +45,7 @@ index bc3ff540d..29532ab11 100644
  #else
    return NULL;
  #endif
-@@ -938,7 +938,7 @@ JVM_END
+@@ -949,7 +949,7 @@ JVM_END
  JVM_ENTRY(jintArray, JVM_GetResourceLookupCache(JNIEnv *env, jobject loader, const char *resource_name))
    JVMWrapper("JVM_GetResourceLookupCache");
  #if INCLUDE_CDS
diff --git a/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
index d3b165a..fe1837d 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-Zero-build-requires-disabled-warnings.patch
@@ -1,4 +1,4 @@
-From 90d017563e2d030a8fbeb31eca294d342a8559de Mon Sep 17 00:00:00 2001
+From f8a3f19fa4fabaf57b0c2c77e966d9896399b3f8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:45:24 +0100
 Subject: [PATCH 1005/1013] hotspot: Zero build requires disabled warnings
diff --git a/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
index 6ab8ee0..18aca4c 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Missing-return-statement-in-__sync_val_compa.patch
@@ -1,4 +1,4 @@
-From 253f6cc9ca4f2cd9564028fa24b9306d9258a8fa Mon Sep 17 00:00:00 2001
+From 5e21de887d87243b6be03781afb4015c4673851c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 13 Aug 2018 16:46:33 +0100
 Subject: [PATCH 1006/1013] hotspot: Missing return statement in
diff --git a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
index dce251a..b5173a9 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wreturn-type-warning.patch
@@ -1,6 +1,6 @@
-From d7256ea11ba0c2160df59d40eea247c1a83ce1fb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
-Date: Mon, 13 Aug 2018 16:48:32 +0100
+From 024e0d522f205ca8659fce60ca4be68b9e3e08db Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Thu, 22 Oct 2020 09:41:07 +0200
 Subject: [PATCH 1007/1013] hotspot: Turn on the -Wreturn-type warning
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -95,7 +95,7 @@ index 4b4b4e250..196622aed 100644
  
  
 diff --git a/hotspot/src/share/vm/classfile/symbolTable.cpp b/hotspot/src/share/vm/classfile/symbolTable.cpp
-index ec97077b7..2621a7d62 100644
+index 83369cbcf..8dd4e6b21 100644
 --- a/hotspot/src/share/vm/classfile/symbolTable.cpp
 +++ b/hotspot/src/share/vm/classfile/symbolTable.cpp
 @@ -249,7 +249,7 @@ Symbol* SymbolTable::lookup(const char* name, int len, TRAPS) {
@@ -117,10 +117,10 @@ index ec97077b7..2621a7d62 100644
  
  Symbol* SymbolTable::lookup_only(const char* name, int len,
 diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-index 05b196aeb..7f8ab9143 100644
+index 4541e815a..98412e1e1 100644
 --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
 +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-@@ -234,15 +234,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
+@@ -236,15 +236,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
                   class_name->as_C_string(),
                   class_loader.is_null() ? "null" : class_loader->klass()->name()->as_C_string()));
    if (FieldType::is_array(class_name)) {
@@ -166,7 +166,7 @@ index 2f3abae6a..d58ebecb2 100644
    static ReservedSpace* shared_rs() {
      CDS_ONLY(return _shared_rs);
 diff --git a/hotspot/src/share/vm/oops/constantPool.hpp b/hotspot/src/share/vm/oops/constantPool.hpp
-index 0698eb40e..354293924 100644
+index 68435471d..fad4a92cb 100644
 --- a/hotspot/src/share/vm/oops/constantPool.hpp
 +++ b/hotspot/src/share/vm/oops/constantPool.hpp
 @@ -350,7 +350,7 @@ class ConstantPool : public Metadata {
@@ -177,12 +177,12 @@ index 0698eb40e..354293924 100644
 +    return klass_at_impl(h_this, which, THREAD);
    }
  
-   Symbol* klass_name_at(int which);  // Returns the name, w/o resolving.
+   Symbol* klass_name_at(int which) const;  // Returns the name, w/o resolving.
 diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
-index 29532ab11..8ba488e15 100644
+index 6f2221c41..daa69f89a 100644
 --- a/hotspot/src/share/vm/prims/jvm.cpp
 +++ b/hotspot/src/share/vm/prims/jvm.cpp
-@@ -4357,7 +4357,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
+@@ -4368,7 +4368,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
      JVM_DTraceProvider* providers))
    JVMWrapper("JVM_DTraceActivate");
    return DTraceJSDT::activate(
diff --git a/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
index bdeb766..b3abd04 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-handle-format-error-for-GCC-7.patch
@@ -1,4 +1,4 @@
-From b620c78bbe2b10b952d8f291f345bab12cfe4b5e Mon Sep 17 00:00:00 2001
+From dc6db949f4140b2dd7d3dfe040984bdfd88f2ba0 Mon Sep 17 00:00:00 2001
 From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
 Date: Fri, 21 Sep 2018 10:44:06 +0200
 Subject: [PATCH 1008/1013] hotspot: handle format error for GCC >= 7
diff --git a/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
index 3c2bbbd..a68e3a0 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
@@ -1,4 +1,4 @@
-From 5aba5bcf8fb4c7d7493662dd89689809fb401433 Mon Sep 17 00:00:00 2001
+From 486b1c46d80de99e0820cc6305477ab40ba4e13c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
 Date: Thu, 2 Jan 2020 10:19:29 +0100
 Subject: [PATCH 1009/1013] hotspot: fix adlc flags
diff --git a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
index da93cbe..8e70cab 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-build-common.patch
@@ -1,4 +1,4 @@
-From cfc5c9089f82bc94fca2407aae6b1ffc4b60955f Mon Sep 17 00:00:00 2001
+From 3028795037c3440415f3e8904e8015fbd480ab15 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 10:22:19 +0100
 Subject: [PATCH 1010/1013] hotspot: fix shark build (common)
@@ -79,10 +79,10 @@ index 4707cc96e..a2b297ca0 100644
          flow_block(blk, temp_vector, temp_set);
          if (failing()) return; // Watch for bailouts.
 diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-index 7f8ab9143..91818bf25 100644
+index 98412e1e1..f62731c43 100644
 --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
 +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
-@@ -2362,6 +2362,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2392,6 +2392,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
      spe = NULL;
      // Must create lots of stuff here, but outside of the SystemDictionary lock.
      m = Method::make_method_handle_intrinsic(iid, signature, CHECK_(empty));
@@ -90,7 +90,7 @@ index 7f8ab9143..91818bf25 100644
      if (!Arguments::is_interpreter_only()) {
        // Generate a compiled form of the MH intrinsic.
        AdapterHandlerLibrary::create_native_wrapper(m);
-@@ -2371,6 +2372,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2401,6 +2402,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
                     "out of space in CodeCache for method handle intrinsic", empty);
        }
      }
@@ -98,7 +98,7 @@ index 7f8ab9143..91818bf25 100644
      // Now grab the lock.  We might have to throw away the new method,
      // if a racing thread has managed to install one at the same time.
      {
-@@ -2384,9 +2386,11 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
+@@ -2414,9 +2416,11 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
    }
  
    assert(spe != NULL && spe->method() != NULL, "");
diff --git a/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
index 7c8c979..b5b9471 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-restrict-to-staging-dir.patch
@@ -1,4 +1,4 @@
-From 5588f79a4a625591589e28eb73acaf4b49f48b62 Mon Sep 17 00:00:00 2001
+From 364b8a715b96f069bf455894b0ae290c52d3ab19 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 10:23:38 +0100
 Subject: [PATCH 1011/1013] hotspot: restrict to staging dir
diff --git a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
index 492d9d7..2239d48 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-error.patch
@@ -1,4 +1,4 @@
-From c36d56682baeab713038d9050a3abf6c1af3e92d Mon Sep 17 00:00:00 2001
+From 37b5885e35a7974bbd8895ae9a7e9ec7ebf9dc68 Mon Sep 17 00:00:00 2001
 From: Richard Leitner <richard.leitner@skidata.com>
 Date: Thu, 20 Aug 2020 09:39:23 +0200
 Subject: [PATCH 1012/1013] hotspot: enable -Wno-error
diff --git a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
index 000c474..a2e4726 100644
--- a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-add-missing-includes-for-shark-build-pt2.patch
@@ -1,4 +1,4 @@
-From c9ed701f0553f95f90a7a12b773ca580e9034ede Mon Sep 17 00:00:00 2001
+From d497bc0b36be083400d2802019ffdf49f5d5ca94 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Thu, 20 Aug 2020 10:10:55 +0200
 Subject: [PATCH 1013/1013] hotspot: add missing includes for shark build (pt2)
diff --git a/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
index ce4b385..bd6c38d 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
@@ -1,4 +1,4 @@
-From d2942510d891c58bd095a57bdd903145d3d95955 Mon Sep 17 00:00:00 2001
+From b4e7774c35cf29aaca2bd04d115afc3ea3c77d7a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 11:13:08 +0000
 Subject: [PATCH 2001/2009] jdk: comparison between pointer and integer
diff --git a/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
index d00b73a..64d6113 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
@@ -1,4 +1,4 @@
-From bd5665d4aa962107eb3d51d20d8b8971d9fca044 Mon Sep 17 00:00:00 2001
+From 1d7ea474a12a12e0e28e1a24f686a7478fe42b8d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:36:53 +0000
 Subject: [PATCH 2002/2009] jdk: Allow using a system-installed libjpeg
diff --git a/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
index eb79183..9c4e70e 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
@@ -1,4 +1,4 @@
-From f74002f805b000df6565418d9e8416edbe86be25 Mon Sep 17 00:00:00 2001
+From c7fb1d599ba66116fb132537b4696092e9c48331 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 13:43:04 +0000
 Subject: [PATCH 2003/2009] jdk: Allow using a system-installed libpng
diff --git a/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
index 9895771..7f8d3b3 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
@@ -1,4 +1,4 @@
-From d7f59185f159d8323b79d015c95e8c2fc99a8cbe Mon Sep 17 00:00:00 2001
+From 5bced26833d8e7876852fa65479f7ada5266a3d7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 2004/2009] jdk: use correct include for poll
diff --git a/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
index 23ad075..f1f5102 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
@@ -1,4 +1,4 @@
-From 7a4979357c2efadda572162c097c5c8a19d27543 Mon Sep 17 00:00:00 2001
+From 385b2007a60c3e792062107d3c4f653fe63d4c63 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 2005/2009] jdk: use correct include for signal
diff --git a/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
index 84b103c..6f9c174 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
@@ -1,4 +1,4 @@
-From 3848e70f0394c8f633dac1d3ccb7f029fc21fdb2 Mon Sep 17 00:00:00 2001
+From 80a07db16d9de0cd875b9c8e86678a51b6e75dbf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 13:58:07 +0000
 Subject: [PATCH 2006/2009] jdk: disable backtrace() (musl build fix)
@@ -20,7 +20,7 @@ Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/jdk/src/solaris/native/sun/xawt/XToolkit.c b/jdk/src/solaris/native/sun/xawt/XToolkit.c
-index 2425bf43ae..1c8ebdb42a 100644
+index 95d2baff5b..41dfa992a7 100644
 --- a/jdk/src/solaris/native/sun/xawt/XToolkit.c
 +++ b/jdk/src/solaris/native/sun/xawt/XToolkit.c
 @@ -27,7 +27,7 @@
@@ -32,7 +32,7 @@ index 2425bf43ae..1c8ebdb42a 100644
  #include <execinfo.h>
  #endif
  
-@@ -803,7 +803,7 @@ JNIEXPORT jstring JNICALL Java_sun_awt_X11_XToolkit_getEnv
+@@ -796,7 +796,7 @@ JNIEXPORT jstring JNICALL Java_sun_awt_X11_XToolkit_getEnv
      return ret;
  }
  
diff --git a/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
index 07ff9f1..62c5b98 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
@@ -1,4 +1,4 @@
-From 6eaec84f02a76005d631fad45cfa82620cfec56d Mon Sep 17 00:00:00 2001
+From 6f76fb04370713bdae2485261d987448c9350179 Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:25:12 +0100
 Subject: [PATCH 2007/2009] jdk: no genx11 in headless
diff --git a/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
index 2f3360a..4c462c4 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
@@ -1,4 +1,4 @@
-From 5105a57bbfd463ddd441ac687bd0101c626188ed Mon Sep 17 00:00:00 2001
+From 335f9891be66e1292509d6a9dc18d41fac0a066c Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 2 Jan 2020 13:26:42 +0100
 Subject: [PATCH 2008/2009] jdk: no unused deps
diff --git a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
index ecd836c..d75e264 100644
--- a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch
@@ -1,4 +1,4 @@
-From de3aa0cf20498ce1dc6056f976a4d9aa6f0ddd00 Mon Sep 17 00:00:00 2001
+From 2d5e8ce975fb241a825dbf070923ccbdf8b65ee9 Mon Sep 17 00:00:00 2001
 From: Richard Leitner <richard.leitner@skidata.com>
 Date: Thu, 20 Aug 2020 11:24:40 +0200
 Subject: [PATCH 2009/2009] jdk: make: use gcc instead of ld for
-- 
2.26.2

