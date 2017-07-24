Return-Path: <victor.chong@linaro.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3E7601F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:37:58 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c184so26590934wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=JDQCCw6W/hS2YdG+95vZEJN8OdDWP626bfhifhaD4uk=;
	b=CEKL/LjwbIqiiqAs4N9TXoyJvDJf/qdv7cHWLVbP3r/53Ffzk7XF62YAe+z+rOen16
	NOawBQnugkMi2gxjrMRg7uXLX2hIPQ1EAcwzNlj3djTtwpOzzKJCBuUFvH7yW9ho29ar
	AolJFEeGs8lCD6W6AK6hyx4zSbun8C1PT8q3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JDQCCw6W/hS2YdG+95vZEJN8OdDWP626bfhifhaD4uk=;
	b=TsOZkP/m/IbJFhxYfAAOH+12NESwbAZ4p/aCu/GgbYKnRosBOzAIAmHkEqUmejmuy7
	2bKzqve1tlW+Y5aJIs1XuDDR5qTrEOSFF0/4xbHGFXfVchuK+ZNbyaHnbYUsbA5zMTeD
	dYQubtPaxK84QBSGT+cJTaPuRfoKbQeuN3iJIUJVFNIMvog3pqpVGjHbEiZsYYA7GBPD
	gtbnlGwNg5PRqiRYvw2B4pVJryzUb65vWfBBh9CdmkbzZ8tbWOqAn8LXSk5bHkULRiTR
	SWl8hXAB5KxA3cEw7y00HHett0kSurTnHgr/9uOQXHp44iylgKR02KakJUN8Bq6VR/7d
	MI2g==
X-Gm-Message-State: AIVw111F5OC4oZmnkykDmSiDbtebHzgvOuK9DyN/IiQRQgB22aItzujq
	RGV3Rt5qF5pIRrt+dwIQjw==
X-Received: by 10.28.9.205 with SMTP id 196mr4651593wmj.126.1500889079275;
	Mon, 24 Jul 2017 02:37:59 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	d53sm15585317wrd.81.2017.07.24.02.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 02:37:58 -0700 (PDT)
From: Victor Chong <victor.chong@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 10:37:55 +0100
Message-Id: <20170724093755.18636-1-victor.chong@linaro.org>
X-Mailer: git-send-email 2.13.0
Subject: [meta-java][PATCH]] openjdk-8: recipe for jdk8u 131b12 141b16 aarch64
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
X-List-Received-Date: Mon, 24 Jul 2017 09:37:59 -0000

Hi all,

This is the aarch64 version of
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111449.html

Signed-off-by: Victor Chong <victor.chong@linaro.org>
---
 recipes-core/openjdk/openjdk-8-common.inc         |   4 +
 recipes-core/openjdk/openjdk-8-cross.inc          |   1 +
 recipes-core/openjdk/openjdk-8-native_131b12.bb   |   2 +
 recipes-core/openjdk/openjdk-8-native_141b16.bb   |   2 +
 recipes-core/openjdk/openjdk-8-release-131b12.inc |  78 +++++++++++++++++
 recipes-core/openjdk/openjdk-8-release-141b16.inc |  78 +++++++++++++++++
 recipes-core/openjdk/openjdk-8_131b12.bb          | 100 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-8_141b16.bb          | 100 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-common.inc           |   4 +
 recipes-core/openjdk/openjre-8_131b12.bb          |  55 ++++++++++++
 recipes-core/openjdk/openjre-8_141b16.bb          |  55 ++++++++++++
 11 files changed, 479 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-8-native_131b12.bb
 create mode 100644 recipes-core/openjdk/openjdk-8-native_141b16.bb
 create mode 100644 recipes-core/openjdk/openjdk-8-release-131b12.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-release-141b16.inc
 create mode 100644 recipes-core/openjdk/openjdk-8_131b12.bb
 create mode 100644 recipes-core/openjdk/openjdk-8_141b16.bb
 create mode 100644 recipes-core/openjdk/openjre-8_131b12.bb
 create mode 100644 recipes-core/openjdk/openjre-8_141b16.bb

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 0e7d258..62af4f9 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -176,6 +176,8 @@ def get_llvm_configure_arch(d):
         arch = "x86"
     elif arch == "arm":
         arch = "arm"
+    elif arch == "arm64" or arch == "aarch64":
+        arch = "aarch64"
     elif arch == "mipsel" or arch == "mips":
         arch = "mips"
     elif arch == "powerpc" or arch == "powerpc64":
@@ -198,6 +200,8 @@ def get_jdk_arch(d):
         jdk_arch = "amd64"
     elif jdk_arch == "arm":
         jdk_arch = "aarch32"
+    elif jdk_arch == "arm64":
+        jdk_arch = "aarch64"
     elif jdk_arch == "powerpc":
         jdk_arch = "ppc"
     elif jdk_arch == "powerpc64":
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index ce98152..d6923a3 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -29,6 +29,7 @@ export WANT_LLVM_RELEASE = "3.5.2"
 PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
 PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
+PACKAGECONFIG[server] = "--with-jvm-variants=server,,,"

 PACKAGECONFIG[repack] = ",,,"

diff --git a/recipes-core/openjdk/openjdk-8-native_131b12.bb b/recipes-core/openjdk/openjdk-8-native_131b12.bb
new file mode 100644
index 0000000..a172e2b
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-native_131b12.bb
@@ -0,0 +1,2 @@
+require openjdk-8-release-131b12.inc
+require openjdk-8-native.inc
diff --git a/recipes-core/openjdk/openjdk-8-native_141b16.bb b/recipes-core/openjdk/openjdk-8-native_141b16.bb
new file mode 100644
index 0000000..0836961
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-native_141b16.bb
@@ -0,0 +1,2 @@
+require openjdk-8-release-141b16.inc
+require openjdk-8-native.inc
diff --git a/recipes-core/openjdk/openjdk-8-release-131b12.inc b/recipes-core/openjdk/openjdk-8-release-131b12.inc
new file mode 100644
index 0000000..098729b
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-131b12.inc
@@ -0,0 +1,78 @@
+PATCHES_URI="\
+    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
+    file://filter-aclocal-copy-too.patch;striplevel=0 \
+    file://dont-expect-fqpn-for-make.patch;striplevel=0 \
+    file://openjdk8-no-genx11-in-headless.patch;apply=no \
+    file://openjdk8-no-unused-deps.patch;apply=no \
+    file://openjdk8-find-compiler-fix-env-respect.patch;apply=no \
+    file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;apply=no \
+"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
+PACKAGECONFIG_append_aarch64 = " server"
+
+CORBA_CHANGESET = "7ab076b30e78"
+SRC_URI[corba.md5sum] = "87bc37faed4943d2d6fa9a60917c89b1"
+SRC_URI[corba.sha256sum] = "b9ee752a25834117fa6b630ee192dfeca51dae620a7a9a7d9f3d166dbb78aa8d"
+
+HOTSPOT_CHANGESET = "f4086f3a0d69"
+SRC_URI[hotspot.md5sum] = "daa76d9efef7a2a53074ab85fab526aa"
+SRC_URI[hotspot.sha256sum] = "14cee0a8886f26f9a3510ce864f517f42730f0f7f6b25ed700e4205e1038e013"
+
+JAXP_CHANGESET = "87da19c7cc5f"
+SRC_URI[jaxp.md5sum] = "ff5e5153f4a4d22c8474f75270ef5469"
+SRC_URI[jaxp.sha256sum] = "5f0254c4617bd07baafc81d39f5353812beddaf0d4a691c1e28172c8d2207150"
+
+JAXWS_CHANGESET = "2b6e5bb5844a"
+SRC_URI[jaxws.md5sum] = "1dd46edd0a7b5c42b84c0975351ccf52"
+SRC_URI[jaxws.sha256sum] = "32f2b586be0aa400bf008afe648439f78d8a85f3ef714b428814f56d605e47d7"
+
+JDK_CHANGESET = "9ae547861e9f"
+SRC_URI[jdk.md5sum] = "c49fe34ad70fe2982a6a29165776cdf2"
+SRC_URI[jdk.sha256sum] = "4afc86685166b8e157830e86cc7391c1414ab50e0757ff351483032440a9f076"
+
+LANGTOOLS_CHANGESET = "919a3c6bc315"
+SRC_URI[langtools.md5sum] = "c1d400dc39d0dbbe9198c3e9e5ba3d6b"
+SRC_URI[langtools.sha256sum] = "90259d5b0eb73baf0866b28e8e9c85b02e6e31ce05ced9869581c6eeab30b932"
+
+NASHORN_CHANGESET = "9c1264a75e80"
+SRC_URI[nashorn.md5sum] = "84574ca5aecfe4ab4e3e1113e839c827"
+SRC_URI[nashorn.sha256sum] = "aff0169262901c3f706037df48d0a6281c20c89e59b442022bc05ee8290719b3"
+
+OPENJDK_CHANGESET = "8e5c7286cd85"
+SRC_URI[openjdk.md5sum] = "5f918d443650304de37a486c1bc31c5d"
+SRC_URI[openjdk.sha256sum] = "352157ee8fd97e6f7890004531ee212963e4b72241dac695bf887d67dc56211d"
+
+OPENJDK_HG_U = "jdk8u"
+OPENJDK_HG_URL = "http://hg.openjdk.java.net/aarch64-port/${OPENJDK_HG_U}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+
+NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
+NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
diff --git a/recipes-core/openjdk/openjdk-8-release-141b16.inc b/recipes-core/openjdk/openjdk-8-release-141b16.inc
new file mode 100644
index 0000000..6861e9f
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-141b16.inc
@@ -0,0 +1,78 @@
+PATCHES_URI="\
+    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
+    file://filter-aclocal-copy-too.patch;striplevel=0 \
+    file://dont-expect-fqpn-for-make.patch;striplevel=0 \
+    file://openjdk8-no-genx11-in-headless.patch;apply=no \
+    file://openjdk8-no-unused-deps.patch;apply=no \
+    file://openjdk8-find-compiler-fix-env-respect.patch;apply=no \
+    file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;apply=no \
+"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
+PACKAGECONFIG_append_aarch64 = " server"
+
+CORBA_CHANGESET = "fdaba58ace3f"
+SRC_URI[corba.md5sum] = "f035b292c0dfd8aa2aff70eb06f00437"
+SRC_URI[corba.sha256sum] = "911873340c5ce3df4d533df67b91ac0b34dc523d169bbed2a2378a02ceaaf688"
+
+HOTSPOT_CHANGESET = "7fd7df1d4202"
+SRC_URI[hotspot.md5sum] = "f67c958b7727d12b29070ac4c69de7e9"
+SRC_URI[hotspot.sha256sum] = "35243f6df9cfc671bec58c134b4d67ba6a7a01d4330c64b04b3c0de0f02e4343"
+
+JAXP_CHANGESET = "03a066cfb70b"
+SRC_URI[jaxp.md5sum] = "57753f6f7d1d666442b50ee35ef7fea2"
+SRC_URI[jaxp.sha256sum] = "ed8108ca09e0fe07b4f2941df76f46ed3bc775d9ed2e9a20be9d2a7f3c97e02b"
+
+JAXWS_CHANGESET = "c3135756134d"
+SRC_URI[jaxws.md5sum] = "9f20295957c934c564f39f9e39eb52c9"
+SRC_URI[jaxws.sha256sum] = "d6c5d78c39344a33cf7e2570a6fcb30ce40737f444f4eab0d2925f2ecb88ae5e"
+
+JDK_CHANGESET = "d28a61f098ed"
+SRC_URI[jdk.md5sum] = "556dfa403093b5d4d869d32fa89a8f6e"
+SRC_URI[jdk.sha256sum] = "5188f8142c246cc4c9d689adc6205476ae45d16c39c59574380630afe41e5058"
+
+LANGTOOLS_CHANGESET = "672cf1af8e7b"
+SRC_URI[langtools.md5sum] = "fbf56a091ff5f75e0f5a1e86a6f354ff"
+SRC_URI[langtools.sha256sum] = "71df9a8e76fd0ca4573c7e5ac8e3183464505cf2536dcc77568d57a618701891"
+
+NASHORN_CHANGESET = "9de3e275e668"
+SRC_URI[nashorn.md5sum] = "b9c10a69e544b0238b97b7abc0aa79b2"
+SRC_URI[nashorn.sha256sum] = "8bfb2cac3cd09acd2a0a0e119d18ceb21afdc319a662467badaa924b5abfa9d5"
+
+OPENJDK_CHANGESET = "27391bec6a47"
+SRC_URI[openjdk.md5sum] = "3f4382967a06688ccc958a51a53b219c"
+SRC_URI[openjdk.sha256sum] = "edd78eeecc5f95cf83118293ed530cb8fac2ce33658f54844bae255559418575"
+
+OPENJDK_HG_U = "jdk8u"
+OPENJDK_HG_URL = "http://hg.openjdk.java.net/aarch64-port/${OPENJDK_HG_U}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+
+NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
+NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
diff --git a/recipes-core/openjdk/openjdk-8_131b12.bb b/recipes-core/openjdk/openjdk-8_131b12.bb
new file mode 100644
index 0000000..191009c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_131b12.bb
@@ -0,0 +1,100 @@
+require openjdk-8-release-131b12.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
+# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append = "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
+    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
+    file://openjdk8-fix-adlc-flags.patch;apply=no \
+    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
+    file://openjdk8-add-missing-linker-flags.patch;apply=no \
+"
+
+do_install() {
+    echo "JDK_HOME = $JDK_HOME"
+    rm -rf ${D}${JDK_HOME}
+    mkdir -p ${D}${JDK_HOME}
+    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
+    chown -R root:root ${D}${JDK_HOME}
+    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+PACKAGES_append = " \
+    ${PN}-demo-dbg \
+    ${PN}-demo \
+    ${PN}-source \
+"
+
+FILES_${PN}_append = "\
+    ${JDK_HOME}/bin/[a-z]* \
+    ${JDK_HOME}/lib/[a-z]* \
+    ${JDK_HOME}/jre/bin/[a-z]* \
+    ${JDK_HOME}/jre/lib/[a-z]* \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/jre/LICENSE \
+    ${JDK_HOME}/release \
+"
+
+FILES_${PN}-dev_append = "\
+    ${JDK_HOME}/include \
+"
+
+FILES_${PN}-dbg_append = "\
+    ${JDK_HOME}/bin/.debug/ \
+    ${JDK_HOME}/lib/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/bin/.debug/ \
+    ${JDK_HOME}/jre/lib/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
+"
+
+FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS_${PN}-demo = " ${PN} "
+
+FILES_${PN}-demo-dbg = "\
+    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
+"
+
+FILES_${PN}-doc_append = "\
+    ${JDK_HOME}/man \
+    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/THIRD_PARTY_README \
+    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/jre/THIRD_PARTY_README \
+    ${JDK_HOME}/man \
+"
+
+FILES_${PN}-source = " ${JDK_HOME}/src.zip "
+
+RPROVIDES_${PN} = "java2-vm"
+PROVIDES_${PN} = "java2-vm"
+RPROVIDES_${PN} = "java2-runtime"
+PROVIDES_${PN} = "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "java javac"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
+
+ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
+ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
diff --git a/recipes-core/openjdk/openjdk-8_141b16.bb b/recipes-core/openjdk/openjdk-8_141b16.bb
new file mode 100644
index 0000000..c050926
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_141b16.bb
@@ -0,0 +1,100 @@
+require openjdk-8-release-141b16.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
+# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append = "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
+    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
+    file://openjdk8-fix-adlc-flags.patch;apply=no \
+    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
+    file://openjdk8-add-missing-linker-flags.patch;apply=no \
+"
+
+do_install() {
+    echo "JDK_HOME = $JDK_HOME"
+    rm -rf ${D}${JDK_HOME}
+    mkdir -p ${D}${JDK_HOME}
+    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
+    chown -R root:root ${D}${JDK_HOME}
+    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+PACKAGES_append = " \
+    ${PN}-demo-dbg \
+    ${PN}-demo \
+    ${PN}-source \
+"
+
+FILES_${PN}_append = "\
+    ${JDK_HOME}/bin/[a-z]* \
+    ${JDK_HOME}/lib/[a-z]* \
+    ${JDK_HOME}/jre/bin/[a-z]* \
+    ${JDK_HOME}/jre/lib/[a-z]* \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/jre/LICENSE \
+    ${JDK_HOME}/release \
+"
+
+FILES_${PN}-dev_append = "\
+    ${JDK_HOME}/include \
+"
+
+FILES_${PN}-dbg_append = "\
+    ${JDK_HOME}/bin/.debug/ \
+    ${JDK_HOME}/lib/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/bin/.debug/ \
+    ${JDK_HOME}/jre/lib/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
+"
+
+FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS_${PN}-demo = " ${PN} "
+
+FILES_${PN}-demo-dbg = "\
+    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
+"
+
+FILES_${PN}-doc_append = "\
+    ${JDK_HOME}/man \
+    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/THIRD_PARTY_README \
+    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/jre/THIRD_PARTY_README \
+    ${JDK_HOME}/man \
+"
+
+FILES_${PN}-source = " ${JDK_HOME}/src.zip "
+
+RPROVIDES_${PN} = "java2-vm"
+PROVIDES_${PN} = "java2-vm"
+RPROVIDES_${PN} = "java2-runtime"
+PROVIDES_${PN} = "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "java javac"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
+
+ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
+ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index cdfdda8..dd31a24 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -28,6 +28,8 @@ def get_jdk_arch(d):
     jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
+    elif jdk_arch == "arm64":
+        jdk_arch = "aarch64"
     elif jdk_arch == "powerpc":
         jdk_arch = "ppc"
     elif jdk_arch == "powerpc64":
@@ -50,6 +52,8 @@ def get_llvm_configure_arch(d):
         arch = "x86"
     elif arch == "arm":
         arch = "arm"
+    elif arch == "arm64" or arch == "aarch64":
+        arch = "aarch64"
     elif arch == "mipsel" or arch == "mips":
         arch = "mips"
     elif arch == "powerpc" or arch == "powerpc64":
diff --git a/recipes-core/openjdk/openjre-8_131b12.bb b/recipes-core/openjdk/openjre-8_131b12.bb
new file mode 100644
index 0000000..ef6ee04
--- /dev/null
+++ b/recipes-core/openjdk/openjre-8_131b12.bb
@@ -0,0 +1,55 @@
+require openjdk-8-release-131b12.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
+# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append = "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
+    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
+    file://openjdk8-fix-adlc-flags.patch;apply=no \
+    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
+    file://openjdk8-add-missing-linker-flags.patch;apply=no \
+"
+
+do_install() {
+    echo "JRE_HOME = $JRE_HOME"
+    rm -rf ${D}${JRE_HOME}
+    mkdir -p ${D}${JRE_HOME}
+    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    chown -R root:root ${D}${JRE_HOME}
+    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+FILES_${PN}_append = "\
+    ${JRE_HOME}/bin/[a-z]* \
+    ${JRE_HOME}/lib/[a-z]* \
+    ${JRE_HOME}/LICENSE \
+    ${JRE_HOME}/release \
+"
+
+FILES_${PN}-dbg_append = "\
+    ${JRE_HOME}/bin/.debug/ \
+    ${JRE_HOME}/lib/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
+"
+
+FILES_${PN}-doc_append = "\
+    ${JRE_HOME}/man \
+    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
+    ${JRE_HOME}/THIRD_PARTY_README \
+"
+
+RPROVIDES_${PN} = "java2-vm"
+PROVIDES_${PN} = "java2-vm"
+RPROVIDES_${PN} = "java2-runtime"
+PROVIDES_${PN} = "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "java"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
+ALTERNATIVE_PRIORITY[java] = "100"
diff --git a/recipes-core/openjdk/openjre-8_141b16.bb b/recipes-core/openjdk/openjre-8_141b16.bb
new file mode 100644
index 0000000..c697514
--- /dev/null
+++ b/recipes-core/openjdk/openjre-8_141b16.bb
@@ -0,0 +1,55 @@
+require openjdk-8-release-141b16.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
+# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append = "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=no \
+    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;apply=no \
+    file://openjdk8-fix-adlc-flags.patch;apply=no \
+    file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
+    file://openjdk8-add-missing-linker-flags.patch;apply=no \
+"
+
+do_install() {
+    echo "JRE_HOME = $JRE_HOME"
+    rm -rf ${D}${JRE_HOME}
+    mkdir -p ${D}${JRE_HOME}
+    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    chown -R root:root ${D}${JRE_HOME}
+    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+FILES_${PN}_append = "\
+    ${JRE_HOME}/bin/[a-z]* \
+    ${JRE_HOME}/lib/[a-z]* \
+    ${JRE_HOME}/LICENSE \
+    ${JRE_HOME}/release \
+"
+
+FILES_${PN}-dbg_append = "\
+    ${JRE_HOME}/bin/.debug/ \
+    ${JRE_HOME}/lib/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
+"
+
+FILES_${PN}-doc_append = "\
+    ${JRE_HOME}/man \
+    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
+    ${JRE_HOME}/THIRD_PARTY_README \
+"
+
+RPROVIDES_${PN} = "java2-vm"
+PROVIDES_${PN} = "java2-vm"
+RPROVIDES_${PN} = "java2-runtime"
+PROVIDES_${PN} = "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "java"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
+ALTERNATIVE_PRIORITY[java] = "100"
--
2.13.0


