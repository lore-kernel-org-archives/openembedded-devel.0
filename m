Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.22560.1628514946391378674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PpfTvvt0;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id f5so5610128wrm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Aug 2021 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BOD7XxCBmizvUMn1HCJbFwFhX9inQ3aLKFX6scm0upw=;
        b=PpfTvvt0Kj1I/rkFjTI1crUwVCeh0JnpOZ0bM6xYfR7f0CUvgr7NCw3aYZiCDJ6SYz
         aov0CyhLypAYkb8DObk1SpcVxjx70pP+oqb8e5y6b5itrCUPTc49OZOIsnaKc006H65Z
         qKt4UZNTB0uxnFXEXofOg+pxW4fIwdeJoe3Ak6/rqac6BrulPmstjAV5b2If0FJJaCHk
         ikXLCtA0uaaypw0ezqintwk6KWvW3Cog4GseicUXZURpcHzuVC69kGY5CRjwTZt0TxXN
         894eUgYnk46qO3d30yFZ4lWrijIn6c3WAZj/r6XrE/s5UQwRNdESYBk+QMwBhfOJldLh
         USSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BOD7XxCBmizvUMn1HCJbFwFhX9inQ3aLKFX6scm0upw=;
        b=eFQCll1Hmpsa2lzZE6R7e/8ebpmsNzAHNF7gph8Yd2mkVl4bXFNhB9cKrF7hr4gdVO
         aWl9TRcPVdvwUbOozUvA7FCTuRU6bEw/gZHUa5KFoFE2eWooFOAlI5DoFXW5jKb1OeR8
         3mnkufPZo5woD3pJwPpmGupvjKMZa3e7QKn/7qMLImvUr2riJFDxeRD/YmSoocbdt/5c
         i/IkMkgRRlwhsWCDpYDkugz33YhZc2uDwCmc9O2+90N5pvM+vk4hTLQ11LujTkNZkG0z
         DKsPSJkD8IlOoBilsrjHW9ha2EBzBC6Y8mdHB7hgCAqHhKpe9Shc6IUiKuN76XVa5IC3
         jf4g==
X-Gm-Message-State: AOAM533CTNZD4RDENlz7W66DMLaqJPu1xtO3wpxH+1PGfC+fFGDFLlxM
	e1q44vcU1yfZ9cajff6+oQN86GaRAvo=
X-Google-Smtp-Source: ABdhPJxd6tc/+moENRH2sdys//aLSHmmwEywPHwyGARbvCsFwJ/MKOfiDyiiLAo8IwxpgoQTwAGqvg==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr25318965wrr.229.1628514943676;
        Mon, 09 Aug 2021 06:15:43 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from localhost.localdomain (cpc108959-cmbg20-2-0-cust309.5-4.cable.virginm.net. [80.0.21.54])
        by smtp.gmail.com with ESMTPSA id w5sm22866523wro.45.2021.08.09.06.15.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 06:15:43 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH 1/2] all: run convert-overrides (0.9.3) script to convert to new override format
Date: Mon,  9 Aug 2021 14:09:37 +0100
Message-Id: <20210809130938.12027-2-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
References: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 classes/java-library.bbclass                  |  8 +-
 classes/openjdk-build-helper.bbclass          |  4 +-
 classes/openjdk-test-image.bbclass            |  2 +-
 classes/openjre-test-image.bbclass            |  2 +-
 recipes-core/ant/ant-native_1.8.1.bb          |  6 +-
 recipes-core/antlr/antlr_2.7.7.bb             |  6 +-
 .../ca-certificates-java_20180516.bb          | 12 +--
 .../cacao/cacao-initial-native_0.98.bb        |  2 +-
 recipes-core/cacao/cacao_git.bb               | 24 +++---
 .../classpath-initial-native_0.93.bb          |  2 +-
 .../classpath/classpath-native_0.99.bb        |  2 +-
 recipes-core/classpath/classpath.inc          | 38 +++++-----
 recipes-core/cup/cup_0.10k.bb                 |  8 +-
 recipes-core/fastjar/fastjar.inc              |  6 +-
 recipes-core/icedtea/icedtea7-native.inc      | 20 ++---
 .../icedtea/openjdk-7-release-03b147.inc      |  4 +-
 .../commons-beanutils_1.8.0.bb                |  2 +-
 .../commons-configuration_1.5.bb              |  2 +-
 .../jakarta-commons/commons-digester_1.8.bb   |  2 +-
 .../jakarta-commons/commons-discovery_0.4.bb  |  2 +-
 .../jakarta-commons/commons-el_1.0.bb         |  2 +-
 .../commons-fileupload_1.2.1.bb               |  2 +-
 .../jakarta-commons/commons-httpclient_3.1.bb |  4 +-
 .../jakarta-commons/commons-jxpath_1.3.bb     |  2 +-
 .../jakarta-commons/commons-net_1.4.1.bb      |  4 +-
 .../jamvm/jamvm-initial-native_1.4.5.bb       |  2 +-
 recipes-core/jamvm/jamvm.inc                  | 28 +++----
 recipes-core/jamvm/jamvm_git.bb               |  2 +-
 .../javasqlite/javasqlite_20150419.bb         | 10 +--
 recipes-core/jcraft/jsch_0.1.40.bb            |  4 +-
 recipes-core/jikes/jikes_1.22.bb              | 10 +--
 recipes-core/jlex/jlex_1.2.6.bb               |  8 +-
 recipes-core/junit/junit_3.8.2.bb             |  4 +-
 recipes-core/libmatthew/libmatthew.inc        | 22 +++---
 recipes-core/openjdk/openjdk-7-common.inc     | 76 +++++++++----------
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc     | 16 ++--
 recipes-core/openjdk/openjdk-8-cross.inc      | 14 ++--
 recipes-core/openjdk/openjdk-8-native.inc     | 18 ++---
 .../openjdk/openjdk-8-release-aarch32.inc     | 30 ++++----
 .../openjdk/openjdk-8-release-aarch64.inc     | 16 ++--
 .../openjdk/openjdk-8-release-common.inc      | 54 ++++++-------
 recipes-core/openjdk/openjdk-8-release.inc    |  4 +-
 recipes-core/openjdk/openjdk-8_272.bb         | 24 +++---
 recipes-core/openjdk/openjre-8_272.bb         | 16 ++--
 recipes-core/rhino/rhino_1.7r4.bb             | 10 +--
 recipes-core/servlet-api/jsp2.0_5.5.26.bb     |  2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb      |  4 +-
 recipes-core/xml-commons/jaxme_0.5.2.bb       |  2 +-
 recipes-core/xml-commons/xom_1.2.10.bb        |  2 +-
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb    |  4 +-
 recipes-extended/dbus/dbus-java_2.7.bb        | 14 ++--
 recipes-extended/rxtx/rxtx_2.2.0.bb           | 18 ++---
 recipes-images/images/openjdk-7-test-image.bb |  2 +-
 recipes-images/images/openjdk-8-test-image.bb |  2 +-
 recipes-images/images/openjre-7-test-image.bb |  2 +-
 recipes-images/images/openjre-8-test-image.bb |  2 +-
 58 files changed, 298 insertions(+), 298 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 2ce96ab..62fabec 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -40,11 +40,11 @@ def java_package_name(d):
 
 JPN ?= "${@java_package_name(d)}"
 
-DEPENDS_prepend = "virtual/javac-native fastjar-native "
+DEPENDS:prepend = "virtual/javac-native fastjar-native "
 
 PACKAGES += "${JPN}"
 
-FILES_${JPN} = "${datadir_java}"
+FILES:${JPN} = "${datadir_java}"
 
 # File name of the libraries' main Jar file
 JARFILENAME = "${BP}.jar"
@@ -54,7 +54,7 @@ ALTJARFILENAMES = "${BPN}.jar"
 
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
-do_removebinaries() {
+do:removebinaries() {
   find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
                   -name "*.jar" -exec rm {} \;
   find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
@@ -63,6 +63,6 @@ do_removebinaries() {
 
 addtask removebinaries after do_unpack before do_patch
 
-do_install_append() {
+do_install:append() {
   oe_jarinstall ${JARFILENAME} ${ALTJARFILENAMES}
 }
diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 4e334c2..a4b77a0 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -2,8 +2,8 @@
 # passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
 # parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
 # The base for this quirk is that GNU Make only considers the last "-j" option.
-EXTRA_OEMAKE_remove_task-compile = "${PARALLEL_MAKE}"
-EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
+EXTRA_OEMAKE:remove:task-compile = "${PARALLEL_MAKE}"
+EXTRA_OEMAKE:remove:task-install = "${PARALLEL_MAKEINST}"
 
 # OpenJDK supports parallel compilation but uses a plain number for this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
diff --git a/classes/openjdk-test-image.bbclass b/classes/openjdk-test-image.bbclass
index f6e4fca..47ad4bb 100644
--- a/classes/openjdk-test-image.bbclass
+++ b/classes/openjdk-test-image.bbclass
@@ -1,5 +1,5 @@
 DESCRIPTION = "An image for OpenJDK testing purposes"
 
-TEST_SUITES_append = " javac"
+TEST_SUITES:append = " javac"
 
 inherit openjre-test-image
diff --git a/classes/openjre-test-image.bbclass b/classes/openjre-test-image.bbclass
index 77dbd74..9562be4 100644
--- a/classes/openjre-test-image.bbclass
+++ b/classes/openjre-test-image.bbclass
@@ -4,6 +4,6 @@ IMAGE_FEATURES += "ssh-server-openssh package-management"
 
 IMAGE_INSTALL = "${CORE_IMAGE_BASE_INSTALL}"
 
-DEFAULT_TEST_SUITES_pn-${PN} = "ping ssh java"
+DEFAULT_TEST_SUITES:pn-${PN} = "ping ssh java"
 
 inherit core-image
diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 7839abd..fa37dd1 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
 	junit-native jdepend-native commons-net-native commons-logging-native \
 	"
 
-do_removecruft() {
+do:removecruft() {
 	# Removes thing that need proprietary Jar files or are otherwise problematic
 	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/image
 	rm -rf ${S}/src/main/org/apache/tools/ant/types/optional/image
@@ -30,7 +30,7 @@ do_removecruft() {
 	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/NetRexxC.java
 }
 
-addtask removecruft before do_patch after do_removebinaries
+addtask removecruft before do_patch after do:removebinaries
 
 do_compile() {
   mkdir -p build
@@ -57,7 +57,7 @@ do_compile() {
   sed -i -e"s|@JAR_FILE@|$cp|" ${WORKDIR}/ant
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/ant ${D}${bindir}
 }
diff --git a/recipes-core/antlr/antlr_2.7.7.bb b/recipes-core/antlr/antlr_2.7.7.bb
index d2453a9..d744201 100644
--- a/recipes-core/antlr/antlr_2.7.7.bb
+++ b/recipes-core/antlr/antlr_2.7.7.bb
@@ -5,11 +5,11 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=361934e706423915b4d9f413ad37fb65"
 
 SRC_URI = "http://www.antlr2.org/download/${BP}.tar.gz"
-SRC_URI_append_class-native = " file://runantlr"
+SRC_URI:append:class-native = " file://runantlr"
 
 inherit java-library
 
-do_configure_class-native() {
+do_configure:class-native() {
     sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" ${WORKDIR}/runantlr
 }
 
@@ -21,7 +21,7 @@ do_compile() {
     fastjar cf ${JARFILENAME} -C build .
 }
 
-do_install_class-native() {
+do_install:class-native() {
     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/runantlr ${D}${bindir}/
 }
diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index feaa7dc..460d39a 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -37,7 +37,7 @@ python () {
         raise bb.parse.SkipRecipe("PREFERRED_RPROVIDER_java2-runtime '%s' unsupported" % runtime)
 }
 
-do_patch_append () {
+do_patch:append () {
     bb.build.exec_func('do_fix_sysconfdir', d)
 }
 
@@ -78,7 +78,7 @@ do_install () {
 	      ${D}${sbindir}/create-ca-certificates-java
 }
 
-pkg_postinst_${PN} () {
+pkg_postinst:${PN} () {
 	if [ -n "$D" ] ; then
 	    # In this case we want to use the Java in the image recipe's
 	    # native sysroot (native Java, not qemu target Java) to
@@ -98,10 +98,10 @@ pkg_postinst_${PN} () {
 	JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-certificates-java
 }
 
-RDEPENDS_${PN} = "ca-certificates"
-RDEPENDS_${PN}_append_class-target = " java2-runtime"
-RDEPENDS_${PN}_append_class-native = " virtual/java-native"
+RDEPENDS:${PN} = "ca-certificates"
+RDEPENDS:${PN}:append:class-target = " java2-runtime"
+RDEPENDS:${PN}:append:class-native = " virtual/java-native"
 
-FILES_${PN} += "${datadir_java}"
+FILES:${PN} += "${datadir_java}"
 
 BBCLASSEXTEND = "native"
diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index a43d3f4..8432456 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -35,7 +35,7 @@ export JAVAC="jikes-initial"
 # enforces the usage of fastjar
 export JAR="fastjar"
 
-do_configure_append() {
+do_configure:append() {
   # Fix the executable name in the wrapper script.
   sed -i -e "s|exec cacao \\$|exec cacao-initial \\$|" src/scripts/java.in
 }
diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_git.bb
index 1a61e12..29aa24f 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -4,11 +4,11 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-initial-native classpath-native bdwgc-native virtual/java-initial-native"
-PROVIDES_class-native = "virtual/java-native"
+DEPENDS:class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-initial-native classpath-native bdwgc-native virtual/java-initial-native"
+PROVIDES:class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
-RPROVIDES_${PN} = "java2-runtime"
+RPROVIDES:${PN} = "java2-runtime"
 
 SRCREV = "6c4694f9bd175386a8c451531e9a5ad97aa23b6f"
 SRC_URI = "git://bitbucket.org/cacaovm/cacao.git;protocol=https \
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 inherit java autotools-brokensep update-alternatives pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
-REQUIRED_DISTRO_FEATURES_class-native := ""
+REQUIRED_DISTRO_FEATURES:class-native := ""
 
-EXTRA_OECONF_class-native = "\
+EXTRA_OECONF:class-native = "\
     --enable-debug \
     --with-vm-zip=${datadir}/cacao/vm.zip \
     --with-java-runtime-library-classes=${datadir}/classpath/glibj.zip \
@@ -33,7 +33,7 @@ EXTRA_OECONF_class-native = "\
     --disable-libjvm  \
 "
 
-CACHED_CONFIGUREVARS_class-native += "ac_cv_prog_JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial"
+CACHED_CONFIGUREVARS:class-native += "ac_cv_prog_JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial"
 
 EXTRA_OECONF = "\
     --with-vm-zip=${datadir}/cacao/vm.zip \
@@ -46,21 +46,21 @@ EXTRA_OECONF = "\
     --disable-test-dependency-checks \
 "
 
-do_configure_prepend () {
+do_configure:prepend () {
     # upgrade m4 macros in source tree
     libtoolize --force --copy --install
     rm  -f src/mm/boehm-gc/ltmain.sh
     mkdir -p src/mm/boehm-gc/m4
 }
 
-do_install_append_class-target() {
+do_install:append:class-target() {
     rm ${D}/${bindir}/java
 }
 
-FILES_${PN} = "${bindir}/${PN} ${libdir}/cacao/lib*.so ${libdir}/lib*.so* ${datadir}/${PN}"
-FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug/lib*.so*"
-FILES_${PN}-doc += "${datadir}/gc"
+FILES:${PN} = "${bindir}/${PN} ${libdir}/cacao/lib*.so ${libdir}/lib*.so* ${datadir}/${PN}"
+FILES:${PN}-dbg += "${bindir}/.debug ${libdir}/.debug/lib*.so*"
+FILES:${PN}-doc += "${datadir}/gc"
 
 BBCLASSEXTEND = "native"
 
-COMPATIBLE_MACHINE_aarch64 = "-"
+COMPATIBLE_MACHINE:aarch64 = "-"
diff --git a/recipes-core/classpath/classpath-initial-native_0.93.bb b/recipes-core/classpath/classpath-initial-native_0.93.bb
index 51229ec..7bb1ca1 100644
--- a/recipes-core/classpath/classpath-initial-native_0.93.bb
+++ b/recipes-core/classpath/classpath-initial-native_0.93.bb
@@ -28,7 +28,7 @@ EXTRA_OECONF += "\
 # Ensure tools.zip is not installed at same path as classpath-native
 EXTRA_OEMAKE += "pkgdatadir=${STAGING_DATADIR_NATIVE}/classpath-initial"
 
-do_install_append() {
+do_install:append() {
     # remove files clashing with classpath-native in sysroot
     rm \
        ${D}${bindir}/gappletviewer \
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index daf7611..ecf8c0a 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF += "\
     --includedir=${STAGING_INCDIR}/classpath \
 "
 
-do_compile_append () {
+do_compile:append () {
     # tools using java-initial rather than java sed it out
     cd tools
     sed -e "s/java-initial/java/g" \
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index e23b752..42c5daf 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -11,15 +11,15 @@ inherit autotools java gettext
 
 DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native gtk+ gconf libxtst file"
 
-RPROVIDES_${PN} = ""
+RPROVIDES:${PN} = ""
 
-RDEPENDS_${PN} = "${PBN}-common (>= ${PV})"
-RDEPENDS_${PN}-examples = "java2-runtime ${PN}-awt"
-RDEPENDS_${PN}-tools = "java2-runtime"
+RDEPENDS:${PN} = "${PBN}-common (>= ${PV})"
+RDEPENDS:${PN}-examples = "java2-runtime ${PN}-awt"
+RDEPENDS:${PN}-tools = "java2-runtime"
 
-RPROVIDES_${PN} = "${PBN}"
-RPROVIDES_${PN}-common = "${PBN}-common"
-RPROVIDES_${PN}-gtk = "${PBN}-awt"
+RPROVIDES:${PN} = "${PBN}"
+RPROVIDES:${PN}-common = "${PBN}-common"
+RPROVIDES:${PN}-gtk = "${PBN}-awt"
 
 PR = "r3"
 
@@ -49,7 +49,7 @@ EXTRA_OECONF = "\
 EXTRA_OECONF += "\
                "
 
-do_configure_prepend () {
+do_configure:prepend () {
   cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}
 }
 	
@@ -60,7 +60,7 @@ do_install() {
 }
 
 # We really have valid non-symlink .so files
-INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP:${PN} = "dev-so"
 
 # Defines the packages that this classpath recipe creates.
 # This allows the classpath-minimal variants to override this
@@ -71,20 +71,20 @@ CPPACKAGES = "${PBN}-common ${PN}-examples \
 
 PACKAGES =+ "${CPPACKAGES}"
 
-FILES_${PN}-dev += "${libdir}/${PBN}/*.la ${incdir}/${PBN}"
+FILES:${PN}-dev += "${libdir}/${PBN}/*.la ${incdir}/${PBN}"
 
-FILES_${PBN}-common = "${datadir}/${PBN}/glibj.zip ${libdir}/logging.properties ${libdir}/${PBN}/security"
-FILES_${PN}-examples = "${datadir}/${PBN}/examples"
+FILES:${PBN}-common = "${datadir}/${PBN}/glibj.zip ${libdir}/logging.properties ${libdir}/${PBN}/security"
+FILES:${PN}-examples = "${datadir}/${PBN}/examples"
 
-FILES_${PN}-tools = "${datadir}/${PBN}/tools.zip ${bindir}"
-FILES_${PN}-tools-doc = "${mandir}"
+FILES:${PN}-tools = "${datadir}/${PBN}/tools.zip ${bindir}"
+FILES:${PN}-tools-doc = "${mandir}"
 
-FILES_${PN}-dbg += "${libdir}/${PBN}/.debug"
-FILES_${PN}-doc = "${infodir}"
+FILES:${PN}-dbg += "${libdir}/${PBN}/.debug"
+FILES:${PN}-doc = "${infodir}"
 
 # gcjwebplugin - not built yet
 #FILES_${PN}-gcjwebplugin = "${libdir}/${PBN}/libgcjwebplugin.so"
-FILES_${PN}-gtk = "${libdir}/${PBN}/libgtkpeer.so ${libdir}/${PBN}/libjawt.so"
-FILES_${PN}-gconf = "${libdir}/${PBN}/libgconfpeer.so"
-FILES_${PN} = "${libdir}/${PBN}/lib*so*"
+FILES:${PN}-gtk = "${libdir}/${PBN}/libgtkpeer.so ${libdir}/${PBN}/libjawt.so"
+FILES:${PN}-gconf = "${libdir}/${PBN}/libgconfpeer.so"
+FILES:${PN} = "${libdir}/${PBN}/lib*so*"
 
diff --git a/recipes-core/cup/cup_0.10k.bb b/recipes-core/cup/cup_0.10k.bb
index 3ce5a21..ce81453 100644
--- a/recipes-core/cup/cup_0.10k.bb
+++ b/recipes-core/cup/cup_0.10k.bb
@@ -4,8 +4,8 @@ LICENSE = "CUP"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=2c9db91c00f38e52cfc8e67bafaa7c33"
 
 
-RDEPENDS_${PN} = "java2-runtime"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "java2-runtime"
+RDEPENDS:${PN}:class-native = ""
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 inherit java-library
@@ -32,14 +32,14 @@ do_compile() {
 	fastjar cf ${BP}.jar -C build .
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/cup ${D}${bindir}
 }
 
 PACKAGES = "${PN}"
 
-FILES_${PN} += "${datadir_java}"
+FILES:${PN} += "${datadir_java}"
 
 SRC_URI[md5sum] = "8b11edfec13c590ea443d0f0ae0da479"
 SRC_URI[sha256sum] = "7e6dc5be74ae56c7e86e69ad0ad88dae3b2847afa9e73a76635918a6b1eb75cd"
diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 2a40e3c..8412236 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -12,15 +12,15 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.ta
 inherit autotools update-alternatives
 
 PACKAGES = "${PN}-grepjar ${PN} ${PN}-dbg ${PN}-doc"
-FILES_${PN}-grepjar = "${bindir}/grepjar"
+FILES:${PN}-grepjar = "${bindir}/grepjar"
 
 PROVIDES = "virtual/jar"
-ALTERNATIVE_${PN} = "jar"
+ALTERNATIVE:${PN} = "jar"
 ALTERNATIVE_LINK = "${bindir}/jar"
 ALTERNATIVE_TARGET = "${bindir}/fastjar"
 
 # update-aternatives does not work for native class
-do_install_append_class-native () {
+do_install:append:class-native () {
 	ln -s fastjar ${D}${bindir}/jar
 }
 
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index f53715f..331b7a4 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -16,25 +16,25 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}
 PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
-CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
+CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
 
 # Disable dead store elimination and set C++ standard to C++98.
 # There are dead stores in the JVM that would be pretty hard to
 # remove, so disable the optimisation in the compiler.
-CFLAGS_append = " -fno-tree-dse"
-CXXFLAGS_append = " -fno-tree-dse"
-CXX_append = " -std=gnu++98"
+CFLAGS:append = " -fno-tree-dse"
+CXXFLAGS:append = " -fno-tree-dse"
+CXX:append = " -std=gnu++98"
 
 # WORKAROUND: ignore errors from new compilers
-CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
+CFLAGS:append = " -Wno-error=stringop-overflow -Wno-error=return-type"
 
 # oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "9"
 HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 2)[0]}"
 # if compiler version 9 detected, add more CFLAGS
-CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
+CFLAGS:append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
 
 # Explicitly pass -fcommon since GCC 10 defaults to -fno-common for C sources
-CFLAGS_append = " -fcommon"
+CFLAGS:append = " -fcommon"
 
 inherit java autotools pkgconfig
 inherit openjdk-build-helper
@@ -71,7 +71,7 @@ export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 
 # libfreetype.so.6 is copied from STAGING_LIBDIR
 # which is already stripped.
-INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP:${PN} = "already-stripped"
 
 EXTRA_OECONF = "\
     --with-parallel-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
@@ -101,7 +101,7 @@ JDK_DIR = "icedtea7-native"
 
 JDK_INSTALL_DIR = "${D}/${libdir_jvm}/${JDK_DIR}"
 
-do_configure_prepend() {
+do_configure:prepend() {
 	arch="${@openjdk_build_helper_get_icedtea_arch(d)}"
 	libarch="${@openjdk_build_helper_get_icedtea_arch(d)}"
 
@@ -132,7 +132,7 @@ do_configure_prepend() {
 
 POST_CONFIGURE_CLEAN_X11 = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'rm openjdk*/jdk/src/solaris/classes/sun/awt/X11/*.java', d)}"
 
-do_configure_append() {
+do_configure:append() {
 	oe_runmake patch-fsg
 
 	for F in openjdk/jdk/make/common/shared/Compiler-gcc.gmk ;
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 627501c..16bf592 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 FILESPATH =. "${FILE_DIRNAME}/openjdk-7-03b147:"
 
 # Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
+ARM_INSTRUCTION_SET:armv4t = "ARM"
 
 ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
 
@@ -133,4 +133,4 @@ export DISTRIBUTION_PATCHES = " \
 
 # readdir_r was deprecated in glibc-2.24. Ignore the error for now
 # NOTE: When updating the recipe, please check if this is still needed
-CFLAGS_append = " -Wno-error=deprecated-declarations"
+CFLAGS:append = " -Wno-error=deprecated-declarations"
diff --git a/recipes-core/jakarta-commons/commons-beanutils_1.8.0.bb b/recipes-core/jakarta-commons/commons-beanutils_1.8.0.bb
index 06287f6..2c5ecc2 100644
--- a/recipes-core/jakarta-commons/commons-beanutils_1.8.0.bb
+++ b/recipes-core/jakarta-commons/commons-beanutils_1.8.0.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Static utility methods useful in manipulating Java classes that c
 SRC_URI = "http://www.apache.org/dist/commons/beanutils/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-collections3 commons-logging"
-RDEPENDS_${PN} = "libcommons-collections3-java libcommons-logging-java"
+RDEPENDS:${PN} = "libcommons-collections3-java libcommons-logging-java"
 
 CP = "commons-collections3 commons-logging"
 
diff --git a/recipes-core/jakarta-commons/commons-configuration_1.5.bb b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
index 0f8a166..4c2bce1 100644
--- a/recipes-core/jakarta-commons/commons-configuration_1.5.bb
+++ b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
 PNBLACKLIST[commons-configuration] ?= "BROKEN: indirectly depends on broken 'xom'"
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet2.4"
-RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
+RDEPENDS:${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
 
 CP = "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet-api-2.4"
 
diff --git a/recipes-core/jakarta-commons/commons-digester_1.8.bb b/recipes-core/jakarta-commons/commons-digester_1.8.bb
index 0f079f1..de264b8 100644
--- a/recipes-core/jakarta-commons/commons-digester_1.8.bb
+++ b/recipes-core/jakarta-commons/commons-digester_1.8.bb
@@ -7,7 +7,7 @@ SUMMARY = "Converts XML to a Java object by a set of mapping rules."
 SRC_URI = "http://archive.apache.org/dist/commons/digester/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-logging commons-beanutils"
-RDEPENDS_${PN} = "libcommons-logging-java libcommons-beanutils-java"
+RDEPENDS:${PN} = "libcommons-logging-java libcommons-beanutils-java"
 
 CP = "commons-logging commons-beanutils"
 
diff --git a/recipes-core/jakarta-commons/commons-discovery_0.4.bb b/recipes-core/jakarta-commons/commons-discovery_0.4.bb
index 01cb54e..aa87349 100644
--- a/recipes-core/jakarta-commons/commons-discovery_0.4.bb
+++ b/recipes-core/jakarta-commons/commons-discovery_0.4.bb
@@ -8,7 +8,7 @@ SUMMARY = "discovering, or finding, implementations for pluggable interfaces"
 SRC_URI = "http://archive.apache.org/dist/commons/discovery/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-logging"
-RDEPENDS_${PN} = "libcommons-logging-java"
+RDEPENDS:${PN} = "libcommons-logging-java"
 
 CP = "commons-logging"
 
diff --git a/recipes-core/jakarta-commons/commons-el_1.0.bb b/recipes-core/jakarta-commons/commons-el_1.0.bb
index 4174dce..bb4c35b 100644
--- a/recipes-core/jakarta-commons/commons-el_1.0.bb
+++ b/recipes-core/jakarta-commons/commons-el_1.0.bb
@@ -8,7 +8,7 @@ SUMMARY = "Implementation of the JSP2.0 Expression Language API"
 SRC_URI = "http://archive.apache.org/dist/commons/el/source/${BP}-src.tar.gz"
 
 DEPENDS += "jsp2.0 servlet2.4"
-RDEPENDS_${PN} = "libjsp2.0-java libservlet2.4-java"
+RDEPENDS:${PN} = "libjsp2.0-java libservlet2.4-java"
 
 CP = "jsp-api-2.0 servlet-api-2.4"
 
diff --git a/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb b/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
index dab7996..395fa15 100644
--- a/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
+++ b/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "Robust, high-performance, file upload capability for Java servlet
 SRC_URI = "http://archive.apache.org/dist/commons/fileupload/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-beanutils commons-io servlet2.3"
-RDEPENDS_${PN} = "libcommons-beanutils-java libcommons-io-java libservlet2.3-java"
+RDEPENDS:${PN} = "libcommons-beanutils-java libcommons-io-java libservlet2.3-java"
 
 CP = "commons-beanutils commons-io servlet-2.3"
 
diff --git a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
index 8daed1b..a6fb53b 100644
--- a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
+++ b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://archive.apache.org/dist/httpcomponents/commons-httpclient/sour
 S = "${WORKDIR}/${BP}"
 
 DEPENDS += "commons-logging commons-codec"
-RDEPENDS_${PN} = "libcommons-logging-java libcommons-codec-java"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "libcommons-logging-java libcommons-codec-java"
+RDEPENDS:${PN}:class-native = ""
 
 CP = "commons-logging commons-codec"
 
diff --git a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
index 3561444..5f44315 100644
--- a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://archive.apache.org/dist/commons/jxpath/source/${BP}-src.tar.gz
 PNBLACKLIST[commons-jxpath] ?= "BROKEN: indirectly depends on broken 'xom'"
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils servlet2.3 jdom"
-RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
+RDEPENDS:${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
 
 CP = "commons-logging commons-collections3 commons-beanutils servlet-2.3 jdom"
 
diff --git a/recipes-core/jakarta-commons/commons-net_1.4.1.bb b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
index 5737c46..ba62ebc 100644
--- a/recipes-core/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/${BP}"
 
 DEPENDS += "oro"
 
-RDEPENDS_${PN} = "liboro-java"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "liboro-java"
+RDEPENDS:${PN}:class-native = ""
 
 CP = "oro"
 
diff --git a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
index 1f5921f..f0348a4 100644
--- a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
+++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
@@ -38,7 +38,7 @@ CFLAGS += "-DDEFAULT_MAX_HEAP=512*MB"
 EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/jikes-initial \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath-inital/glibj.zip \
                "
-do_install_append() {
+do_install:append() {
   install -d ${D}${bindir}/
   install -m 0755 ${WORKDIR}/java-initial ${D}${bindir}/
 }
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index b03a5b9..693817f 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -4,25 +4,25 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
-DEPENDS_class-native = "virtual/java-initial-native classpath-initial-native zlib-native classpath-native ecj-initial-native libffi-native"
+DEPENDS:class-native = "virtual/java-initial-native classpath-initial-native zlib-native classpath-native ecj-initial-native libffi-native"
 
-RDEPENDS_${PN} = "classpath"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "classpath"
+RDEPENDS:${PN}:class-native = ""
 
-PROVIDES_class-native = "virtual/java-native"
-RPROVIDES_${PN} = "java2-runtime"
-RPROVIDES_${PN}_class-native = ""
+PROVIDES:class-native = "virtual/java-native"
+RPROVIDES:${PN} = "java2-runtime"
+RPROVIDES:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
 inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
 
-REQUIRED_DISTRO_FEATURES_class-target = "x11"
+REQUIRED_DISTRO_FEATURES:class-target = "x11"
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
 
-do_configure_append_class-native() {
+do_configure:append:class-native() {
 	sed -i -e"s|STAGING_LIBDIR_NATIVE|${STAGING_LIBDIR_NATIVE}|g" \
 		-e "s|STAGING_DATADIR_NATIVE|${STAGING_DATADIR_NATIVE}|g" \
 	${WORKDIR}/java
@@ -32,28 +32,28 @@ do_configure_append_class-native() {
 EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi --disable-int-inlining"
 
 # Needed for big compilation targets like OpenJDK
-CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
+CFLAGS:append:class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
 
 EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/javac \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
                "
 # Enforce usage of ecj-initial.
-EXTRA_OEMAKE_class-native = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
+EXTRA_OEMAKE:class-native = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
                "
 
-do_install_append_class-native() {
+do_install:append:class-native() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/java ${D}${bindir}/java
 
 }
 
 PRIVATE_LIBS = "libjvm.so"
-INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP:${PN} = "dev-so"
 
-FILES_${PN} += "${libdir}/jamvm/lib*.so"
+FILES:${PN} += "${libdir}/jamvm/lib*.so"
 
-ALTERNATIVE_${PN} = "java"
+ALTERNATIVE:${PN} = "java"
 ALTERNATIVE_TARGET = "${bindir}/jamvm"
 ALTERNATIVE_PRIORITY = "4"
 # shared state for jamvm-native does not work
diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 57f7e64..3c9d47b 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -15,4 +15,4 @@ SRC_URI = "git://git.code.sf.net/p/jamvm/code;protocol=git \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_MACHINE_aarch64 = "-"
+COMPATIBLE_MACHINE:aarch64 = "-"
diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/javasqlite/javasqlite_20150419.bb
index 06fbac2..1ae072f 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=3da0e50feac5f64f08184584a8cad58a"
 inherit autotools-brokensep
 
 DEPENDS += "sqlite3 sqlite3-native icedtea7-native"
-RDEPENDS_${PN} += "sqlite3"
-FILES_${PN} +="/usr/share"
+RDEPENDS:${PN} += "sqlite3"
+FILES:${PN} +="/usr/share"
 
 PARALLEL_MAKE = "-j 1"
 
@@ -35,13 +35,13 @@ EXTRA_OECONF = " \
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
 # This dev package contains an '.so' file used for JNI development
-INSANE_SKIP_${PN}-dev = "dev-elf"
+INSANE_SKIP:${PN}-dev = "dev-elf"
 
-do_configure_append (){
+do_configure:append (){
 	cp ${S}/*-libtool ${S}/libtool
 }
 
-do_compile_prepend (){
+do_compile:prepend (){
 	echo '#!/bin/sh' > ${STAGING_BINDIR_NATIVE}/cc
 	echo '${BUILD_CC} $@' >> ${STAGING_BINDIR_NATIVE}/cc
 	chmod a+x ${STAGING_BINDIR_NATIVE}/cc
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 1d4b96b..a0f70d8 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -9,8 +9,8 @@ inherit java-library
 
 DEPENDS = "jzlib"
 
-RDEPENDS_${PN} = "libjzlib-java"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "libjzlib-java"
+RDEPENDS:${PN}:class-native = ""
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
index 233005a..5e6e470 100644
--- a/recipes-core/jikes/jikes_1.22.bb
+++ b/recipes-core/jikes/jikes_1.22.bb
@@ -13,14 +13,14 @@ inherit autotools update-alternatives relative_symlinks
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS_${PN} = "classpath"
-PROVIDES_class-native = ""
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "classpath"
+PROVIDES:class-native = ""
+RDEPENDS:${PN}:class-native = ""
 
 EXTRA_OECONF = "--disable-fp-emulation --enable-source15"
 
 # configure script incorrectly defines these when cross compiling for ARM
-CXXFLAGS_append_arm += "-UHAVE_64BIT_TYPES -DWORDS_BIGENDIAN=1"
+CXXFLAGS:append:arm += "-UHAVE_64BIT_TYPES -DWORDS_BIGENDIAN=1"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
@@ -28,7 +28,7 @@ do_install() {
 }
 
 PROVIDES = "virtual/javac"
-ALTERNATIVE_${PN} = "javac"
+ALTERNATIVE:${PN} = "javac"
 ALTERNATIVE_LINK = "/usr/bin/javac"
 ALTERNATIVE_TARGET = "${bindir}/javac.jikes"
 
diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index 3c14e4c..48ec357 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${JLEX_MAIN_FILENAME};beginline=148;endline=166;md5=9
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
-RDEPENDS_${PN} = "java2-runtime"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "java2-runtime"
+RDEPENDS:${PN}:class-native = ""
 
 inherit java-library
 
@@ -35,14 +35,14 @@ do_compile() {
 	fastjar cf ${BP}.jar -C build .
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}${bindir}
 	install -m 0755 jlex ${D}${bindir}/
 }
 
 PACKAGES = "${PN}"
 
-FILES_${PN} += "${datadir_java}"
+FILES:${PN} += "${datadir_java}"
 
 SRC_URI[md5sum] = "fe0cff5db3e2f0f5d67a153cf6c783af"
 SRC_URI[sha256sum] = "aeebaece3b3a53972bb0ba0f810540386c267070ee9dca6ffa43c6ff74a54bd7"
diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index b366910..4f10575 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -16,14 +16,14 @@ inherit java-library
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
 	mkdir -p src
-	# Prevent deletion by do_removebinaries.
+	# Prevent deletion by do:removebinaries.
 	if [ -e src.jar ]; then
 		mv src.jar src.zip
 	fi
 	unzip -o src.zip -d src
 }
 
-addtask unpackpost before do_removebinaries after do_unpack
+addtask unpackpost before do:removebinaries after do_unpack
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/libmatthew/libmatthew.inc b/recipes-core/libmatthew/libmatthew.inc
index 2119c0b..b000387 100644
--- a/recipes-core/libmatthew/libmatthew.inc
+++ b/recipes-core/libmatthew/libmatthew.inc
@@ -47,7 +47,7 @@ do_install() {
     oe_libinstall -so libunix-java ${D}${libdir_jni}
 }
 
-do_install_append() {
+do_install:append() {
     rm ${D}${datadir_java}/${PN}.jar
 }
 PACKAGES = "\
@@ -56,17 +56,17 @@ PACKAGES = "\
 	${PN}-io-java ${PN}-debug-java \
 "
 
-FILES_libcgi-java = "${datadir_java}/cgi*.jar"
-FILES_libcgi-jni = "${libdir_jni}/libcgi-java.so"
-FILES_libcgi-jni-dbg = "${libdir_jni}/.debug/libcgi-java.so"
-RDEPENDS_libcgi-java = "libcgi-jni"
+FILES:libcgi-java = "${datadir_java}/cgi*.jar"
+FILES:libcgi-jni = "${libdir_jni}/libcgi-java.so"
+FILES:libcgi-jni-dbg = "${libdir_jni}/.debug/libcgi-java.so"
+RDEPENDS:libcgi-java = "libcgi-jni"
 
-FILES_libunixsocket-java = "${datadir_java}/unix*.jar"
-FILES_libunixsocket-jni = "${libdir_jni}/libunix-java.so"
-FILES_libunixsocket-jni-dbg = "${libdir_jni}/.debug/libunix-java.so"
-RDEPENDS_libunixsocket-java = "libunixsocket-jni"
+FILES:libunixsocket-java = "${datadir_java}/unix*.jar"
+FILES:libunixsocket-jni = "${libdir_jni}/libunix-java.so"
+FILES:libunixsocket-jni-dbg = "${libdir_jni}/.debug/libunix-java.so"
+RDEPENDS:libunixsocket-java = "libunixsocket-jni"
 
-FILES_${PN}-io-java = "${datadir_java}/io*.jar"
+FILES:${PN}-io-java = "${datadir_java}/io*.jar"
 
-FILES_${PN}-debug-java = "${datadir_java}/debug-*.jar ${datadir_java}/hexdump*.jar"
+FILES:${PN}-debug-java = "${datadir_java}/debug-*.jar ${datadir_java}/hexdump*.jar"
 
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index c87266d..61b62b9 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -8,13 +8,13 @@ ICEDTEA_VERSION = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),
 
 S = "${WORKDIR}/${ICEDTEA}"
 
-DEPENDS_append_libc-uclibc = " virtual/libiconv "
+DEPENDS:append_libc-uclibc = " virtual/libiconv "
 
 # The OpenJDK build with interpreter optimizations for ARM depends on a binary
 # that generates constants for an assembler source file. There is no other
 # way than to generate this on a pseudo machine. Cross-compiling would not help
 # because structure sizes and/or alignment may differ.
-DEPENDS_append = " qemu-native "
+DEPENDS:append = " qemu-native "
 
 B = "${S}/build"
 
@@ -138,14 +138,14 @@ EXTRA_OECONF += " \
     --disable-system-sctp \
 "
 
-do_configure_prepend() {
+do_configure:prepend() {
     # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
     # ".patch" into the patches directory.
     find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
     find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patches \;
 }
 
-do_configure_append() {
+do_configure:append() {
     oe_runmake patch
 }
 
@@ -168,7 +168,7 @@ EXTRA_OEMAKE += ' \
 
 OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} -Wl,-rpath,${libdir}/llvm${WANT_LLVM_RELEASE}"
 
-OE_LAUNCHER_LDFLAGS_arm = ""
+OE_LAUNCHER_LDFLAGS:arm = ""
 
 EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
 
@@ -229,7 +229,7 @@ PACKAGES = " \
     ${JDKPN}-common \
 "
 
-FILES_${JDKPN}-dbg = "\
+FILES:${JDKPN}-dbg = "\
     ${JDK_HOME}/bin/.debug \
     ${JDK_HOME}/lib/.debug \
     ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
@@ -244,9 +244,9 @@ FILES_${JDKPN}-dbg = "\
     ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
 "
 
-FILES_${JDKPN}-demo = "${JDK_HOME}/demo ${JDK_HOME}/sample"
-RDEPENDS_${JDKPN}-demo = "${JDKPN}-jre"
-FILES_${JDKPN}-demo-dbg = "\
+FILES:${JDKPN}-demo = "${JDK_HOME}/demo ${JDK_HOME}/sample"
+RDEPENDS:${JDKPN}-demo = "${JDKPN}-jre"
+FILES:${JDKPN}-demo-dbg = "\
     ${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
     ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
     ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
@@ -258,13 +258,13 @@ FILES_${JDKPN}-demo-dbg = "\
     ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
 "
 
-FILES_${JDKPN}-source = "${JDK_HOME}/src.zip"
+FILES:${JDKPN}-source = "${JDK_HOME}/src.zip"
 
-FILES_${JDKPN}-java = "${JDK_HOME}/jre/bin/java"
+FILES:${JDKPN}-java = "${JDK_HOME}/jre/bin/java"
 
-FILES_${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
+FILES:${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
 
-FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+FILES:${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
     ${JDK_HOME}/jre/THIRD_PARTY_README \
     ${JDK_HOME}/jre/LICENSE \
     ${JDK_HOME}/ASSEMBLY_EXCEPTION \
@@ -274,7 +274,7 @@ FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
     ${JDK_HOME}/jre/lib \
 "
 
-FILES_${PN}_append = " \
+FILES:${PN}:append = " \
     ${JDK_HOME}/jre/bin/keytool \
     ${JDK_HOME}/jre/bin/orbd \
     ${JDK_HOME}/jre/bin/pack200 \
@@ -287,9 +287,9 @@ FILES_${PN}_append = " \
     ${JDK_HOME}/jre/bin/javaws \
 "
 
-RDEPENDS_${JDKPN}-common = "librhino-java"
+RDEPENDS:${JDKPN}-common = "librhino-java"
 
-RPROVIDES_${JDKPN}-vm-zero = "java2-vm"
+RPROVIDES:${JDKPN}-vm-zero = "java2-vm"
 
 # Even though a vm is a hard dependency it is set as RRECOMMENDS so a single vm can get uninstalled:
 # root@beaglebone:~/java# opkg remove openjdk-7-vm-shark
@@ -298,39 +298,39 @@ RPROVIDES_${JDKPN}-vm-zero = "java2-vm"
 #  * print_dependents_warning: Package openjdk-7-vm-shark is depended upon by packages:
 #  * print_dependents_warning: 	openjdk-7-java
 #  * print_dependents_warning: These might cease to work if package openjdk-7-vm-shark is removed.
-RRECOMMENDS_${JDKPN}-java = "java2-vm"
+RRECOMMENDS:${JDKPN}-java = "java2-vm"
 
 # For some reason shark and cacao do not automatically depends on -common.
 # So we add that manually.
 
 # There is a symlink to a .so but this one is valid.
-INSANE_SKIP_${JDKPN}-vm-zero = "dev-so"
-INSANE_SKIP_${JDKPN}-common = "dev-so"
+INSANE_SKIP:${JDKPN}-vm-zero = "dev-so"
+INSANE_SKIP:${JDKPN}-common = "dev-so"
 
 # libfreetype.so.6 is copied from STAGING_LIBDIR
 # which is already stripped.
-INSANE_SKIP_${JDKPN}-jre = "already-stripped"
+INSANE_SKIP:${JDKPN}-jre = "already-stripped"
 
-FILES_${JDKPN}-jdk = " \
+FILES:${JDKPN}-jdk = " \
     ${JDK_HOME}/bin \
     ${JDK_HOME}/lib \
     ${JDK_HOME}/include \
     ${JDK_HOME}${libdir}/jvm \
 "
-RDEPENDS_${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
-RDEPENDS_${JDKPN}-java = "${JDKPN}-common"
-RPROVIDES_${JDKPN}-jre = "java2-runtime"
+RDEPENDS:${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
+RDEPENDS:${JDKPN}-java = "${JDKPN}-common"
+RPROVIDES:${JDKPN}-jre = "java2-runtime"
 
-RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
+RDEPENDS:${JDKPN}-jdk = "${JDKPN}-jre"
 
-FILES_${JDKPN}-doc = "${JDK_HOME}/man"
+FILES:${JDKPN}-doc = "${JDK_HOME}/man"
 
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
 BUILD_DIR_ECJ = "openjdk.build-ecj"
 
 # Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
+ARM_INSTRUCTION_SET:armv4t = "ARM"
 
 ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
 
@@ -361,7 +361,7 @@ LANGTOOLS_URI = "${ICEDTEA_DROP_URL}/${LANGTOOLS_FILE};name=langtools;unpack=fal
 # handles all postinst action for openjdk
 # some of the former results in a build error because "ERR" is in the first line.
 
-pkg_postinst_ontarget_${JDKPN}-vm-shark () {
+pkg_postinst_ontarget:${JDKPN}-vm-shark () {
     true
     if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
@@ -370,7 +370,7 @@ pkg_postinst_ontarget_${JDKPN}-vm-shark () {
     fi
 }
 
-pkg_prerm_${JDKPN}-vm-shark () {
+pkg_prerm:${JDKPN}-vm-shark () {
     true
     sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
@@ -381,7 +381,7 @@ pkg_prerm_${JDKPN}-vm-shark () {
     echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
-pkg_postinst_ontarget_${JDKPN}-vm-cacao () {
+pkg_postinst_ontarget:${JDKPN}-vm-cacao () {
     true
     if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
@@ -390,7 +390,7 @@ pkg_postinst_ontarget_${JDKPN}-vm-cacao () {
     fi
 }
 
-pkg_prerm_${JDKPN}-vm-cacao () {
+pkg_prerm:${JDKPN}-vm-cacao () {
     true
     sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
@@ -401,7 +401,7 @@ pkg_prerm_${JDKPN}-vm-cacao () {
     echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
-pkg_postinst_ontarget_${JDKPN}-vm-jamvm () {
+pkg_postinst_ontarget:${JDKPN}-vm-jamvm () {
     true
     if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
@@ -410,7 +410,7 @@ pkg_postinst_ontarget_${JDKPN}-vm-jamvm () {
     fi
 }
 
-pkg_prerm_${JDKPN}-vm-jamvm () {
+pkg_prerm:${JDKPN}-vm-jamvm () {
     true
     sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
@@ -421,7 +421,7 @@ pkg_prerm_${JDKPN}-vm-jamvm () {
     echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
-pkg_postinst_ontarget_${JDKPN}-vm-zero () {
+pkg_postinst_ontarget:${JDKPN}-vm-zero () {
     true
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
@@ -432,7 +432,7 @@ pkg_postinst_ontarget_${JDKPN}-vm-zero () {
     sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
-pkg_prerm_${JDKPN}-vm-zero () {
+pkg_prerm:${JDKPN}-vm-zero () {
     true
     sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
@@ -441,14 +441,14 @@ pkg_prerm_${JDKPN}-vm-zero () {
     fi
 }
 
-pkg_postinst_${JDKPN}-jre () {
+pkg_postinst:${JDKPN}-jre () {
     ln -s ${JDK_HOME}/jre  $D/${libdir}/jvm/jre
 }
 
 inherit update-alternatives
 
-ALTERNATIVE_${JDKPN}-jre = "java keytool"
-ALTERNATIVE_${JDKPN}-jdk = "javac"
+ALTERNATIVE:${JDKPN}-jre = "java keytool"
+ALTERNATIVE:${JDKPN}-jdk = "javac"
 
 ALTERNATIVE_TARGET[java] = "${JDK_HOME}/jre/bin/java"
 ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index d774cc2..57827d9 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -80,4 +80,4 @@ export DISTRIBUTION_PATCHES
 # to avoid this error add -fpermissive
 #
 # NOTE: When updating the recipe, please check if this is still needed
-CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=narrowing -fpermissive"
+CFLAGS:append = " -Wno-error=deprecated-declarations -Wno-error=narrowing -fpermissive"
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 7d45585..16e3816 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -26,7 +26,7 @@ SRC_URI = "\
     ${PATCHES_URI} \
 "
 
-do_configure_prepend () {
+do_configure:prepend () {
     export TOPDIR=${S}
     sed -i 's#\$TOPDIR#${S}#g' ${S}/common/autoconf/configure.ac
 }
@@ -43,8 +43,8 @@ do_unpack_extract_submodules () {
     tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
 }
 
-do_patch_prepend() {
-    # use do_patch_prepend syntax and not pre/postfuncs to
+do_patch:prepend() {
+    # use do_patch:prepend syntax and not pre/postfuncs to
     # call do_unpack_extract_submodules
     # *) the archiver.bbclass modifies WORKDIR, S, B,...
     #    and those modifications are lost otherwise,
@@ -177,7 +177,7 @@ ALTERNATIVE_PRIORITY = "50"
 
 OPENJDK_UPDATE_VERSION = "${PV}"
 OPENJDK_BUILD_NUMBER = "ga"
-EXTRA_OECONF_append = "\
+EXTRA_OECONF:append = "\
         --with-build-number=${OPENJDK_BUILD_NUMBER} \
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
 "
@@ -189,8 +189,8 @@ EXTRA_OECONF_append = "\
 GLOBAL_FLAGS = "-fno-lifetime-dse -fno-delete-null-pointer-checks -fcommon"
 
 # flags for -native, and for bits that need a host-tool during -cross
-BUILD_CFLAGS_append = " ${GLOBAL_FLAGS}"
-BUILD_CXXFLAGS_append = " ${GLOBAL_FLAGS}"
+BUILD_CFLAGS:append = " ${GLOBAL_FLAGS}"
+BUILD_CXXFLAGS:append = " ${GLOBAL_FLAGS}"
 # flags for -cross
-TARGET_CFLAGS_append = " ${GLOBAL_FLAGS}"
-TARGET_CXXFLAGS_append = " ${GLOBAL_FLAGS}"
+TARGET_CFLAGS:append = " ${GLOBAL_FLAGS}"
+TARGET_CXXFLAGS:append = " ${GLOBAL_FLAGS}"
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 25d971f..ff682f1 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -47,13 +47,13 @@ require openjdk-8-common.inc
 
 JAVA_HOME[unexport] = "1"
 
-SRC_URI_append = "\
+SRC_URI:append = "\
     file://jvm.cfg \
     file://0011-autoconf-fix-CC-with-arguments-detection.patch \
     file://0012-autoconf-NativeCompilation-remove-sysroot.patch \
 "
 
-EXTRA_OECONF_append = "\
+EXTRA_OECONF:append = "\
     --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
@@ -73,16 +73,16 @@ EXTRA_OECONF_append = "\
     ${@jdk_configure_options(d)} \
 "
 
-do_configure_prepend() {
+do_configure:prepend() {
     export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
     export ${@jdk_environment_options(d)}
 }
 
-do_configure_append() {
+do_configure:append() {
     sed -i -e 's,POST_STRIP_CMD:=.*,POST_STRIP_CMD:=,g' ${B}/spec.gmk
 }
 
-do_install_append() {
+do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
       if [ -d ${D}${JDK_HOME} ] ; then
         find ${D}${JDK_HOME} -name "*.jar" -print0 | \
@@ -104,7 +104,7 @@ do_install[vardepsexclude] += "BB_NUMBER_THREADS"
 export MAKE_VERBOSE = "y"
 export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace STRIP_POLICY=no_strip"
 
-EXTRA_OEMAKE_append = '\
+EXTRA_OEMAKE:append = '\
     ${@jdk_make_options(d)} \
     ALT_SDT_H="${STAGING_INCDIR}" \
     ALT_CUPS_HEADERS_PATH="${STAGING_INCDIR}" \
@@ -132,4 +132,4 @@ PACKAGE_PREPROCESS_FUNCS += "remove_debuglink"
 
 # FIXME libjsig.so is a symlink to a .so but this one is valid
 # FIXME libfreetype.so.6 is copied from STAGING_LIBDIR which is already stripped
-INSANE_SKIP_${PN} = "dev-so already-stripped"
+INSANE_SKIP:${PN} = "dev-so already-stripped"
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 3282257..c02e183 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -17,7 +17,7 @@ PACKAGECONFIG[jpeg] = "--with-libjpeg=system,--with-libjpeg=bundled,jpeg-native"
 PACKAGECONFIG[png] = "--with-libpng=system,--with-libpng=bundled,libpng-native"
 PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib-native"
 
-EXTRA_OECONF_append = "\
+EXTRA_OECONF:append = "\
     --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
@@ -36,32 +36,32 @@ require openjdk-8-common.inc
 
 inherit native
 
-CFLAGS_append = " ${@jdk_cpp_options(d)}"
-CPPFLAGS_append = "${@jdk_cpp_options(d)}"
-CXXFLAGS_append = " ${@jdk_cpp_options(d)}"
+CFLAGS:append = " ${@jdk_cpp_options(d)}"
+CPPFLAGS:append = "${@jdk_cpp_options(d)}"
+CXXFLAGS:append = " ${@jdk_cpp_options(d)}"
 
 export MAKE_VERBOSE = "y"
 export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace"
 
-EXTRA_OEMAKE_append = ' \
+EXTRA_OEMAKE:append = ' \
     ${@jdk_make_options(d)} \
     MAKE_VERBOSE=y VERBOSE=-s LOG_LEVEL=trace \
     QUIETLY= \
     images \
 '
 
-do_configure_prepend() {
+do_configure:prepend() {
     export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
     export ${@jdk_environment_options(d)}
     unset CC CXX
 }
 
-do_compile_prepend() {
+do_compile:prepend() {
     export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
     rm -f "${B}/images/j2sdk-image/jre/lib/security/cacerts"
 }
 
-do_compile_append() {
+do_compile:append() {
     set -x
     mkdir -p ${B}/certs
     for pem in $(find ${STAGING_DATADIR}/ca-certificates -name "*.crt")
@@ -90,4 +90,4 @@ do_install() {
 }
 
 # FIXME libfreetype.so.6 is copied from STAGING_LIBDIR which is already stripped
-INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP:${PN} = "already-stripped"
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
index 700a0f5..17e3a3d 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch32.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
@@ -1,39 +1,39 @@
 require openjdk-8-release-common.inc
 
 COMPATIBLE_HOST = "^$"
-COMPATIBLE_HOST_armv7a = "arm"
-COMPATIBLE_HOST_armv7ve = "arm"
+COMPATIBLE_HOST:armv7a = "arm"
+COMPATIBLE_HOST:armv7ve = "arm"
 
 CHANGESET_ID="b09-aarch32-20200929"
 
-CORBA_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+CORBA_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[corba.sha256sum] = "3675f043479c7e3ee7128651527d15c4e56f72d22dd953b8d0d8e5c9a2c68741"
 
-HOTSPOT_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+HOTSPOT_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[hotspot.sha256sum] = "d5ea125d7e54fd3dd21bf1654c09b5ce17497d9327f770abd56ad1108a337b81"
 
-JAXP_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+JAXP_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jaxp.sha256sum] = "a025f9f047bc50947aa631641b2f836c3a3ec4a5f2c9019bc7b11ab8444f7b9e"
 
-JAXWS_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+JAXWS_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jaxws.sha256sum] = "ad921e0f5cafab4c5b4bb248ea59bf1615864c4de17bfd7321759d063398dc3f"
 
-JDK_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+JDK_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jdk.sha256sum] = "835e81fc88b8c0e40df0d89be5d8a852638b3f5f29acad6997cbc36a2e8341fe"
 
-LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+LANGTOOLS_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[langtools.sha256sum] = "554491026bb9fadb837d635d4beea3ca9cb73f034c1379d57fcd77787816139f"
 
-NASHORN_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+NASHORN_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[nashorn.sha256sum] = "8358000a7e52fcfd046027319569d17f2e99b710acbfd1a1120b50ce93afe223"
 
-OPENJDK_CHANGESET_arm = "jdk8u${PV}-${CHANGESET_ID}"
+OPENJDK_CHANGESET:arm = "jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[openjdk.sha256sum] = "4b38e672c82df5d18215849829a80a111b1c7b46567bc641e9fec92bedd0d32a"
 
-PACKAGECONFIG_append_armv7a = " client"
-PACKAGECONFIG_append_armv7ve = " client"
+PACKAGECONFIG:append:armv7a = " client"
+PACKAGECONFIG:append:armv7ve = " client"
 
-do_install_append() {
+do_install:append() {
     if [ -d ${D}${JDK_HOME} ] ; then
         sed -e 's,^\(-server ERROR$\),# \1,' \
             -e 's,^-client IGNORE,-client ERROR,' \
@@ -48,5 +48,5 @@ do_install_append() {
     fi
 }
 
-JDK_ARCH_armv7a = "aarch32"
-JDK_ARCH_armv7ve = "aarch32"
+JDK_ARCH:armv7a = "aarch32"
+JDK_ARCH:armv7ve = "aarch32"
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
index c71dd25..3aac110 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
@@ -4,26 +4,26 @@ COMPATIBLE_HOST = "aarch64"
 
 CHANGESET_ID="b10"
 
-CORBA_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+CORBA_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[corba.sha256sum] = "112143d935a94cb95a0f9dba19a86184d08e699a68a82db58cdd9f0de1baeeae"
 
-HOTSPOT_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+HOTSPOT_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[hotspot.sha256sum] = "16ed30b46279e2ffef04ab392502e32525451bea38f3af0d3c3782bcd33a0274"
 
-JAXP_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+JAXP_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jaxp.sha256sum] = "5dde165d7327b08f2ebc8d3081a1734d9ef737117dcaa417eb7dc39344220987"
 
-JAXWS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+JAXWS_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jaxws.sha256sum] = "cedde28264a85cb16ae46123091edb64f7c1d2cd5f3de6ba0d21cffff84c3ccf"
 
-JDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+JDK_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[jdk.sha256sum] = "7e53438e0506536fe373b7f8176512c701b87adda268831d180ead2695154a93"
 
-LANGTOOLS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+LANGTOOLS_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[langtools.sha256sum] = "8dbcd45109d0c782a6cac5a1a310a5816d4dac8a9c095635832ab803bfdb861a"
 
-NASHORN_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+NASHORN_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[nashorn.sha256sum] = "85497cdba0943644d838862761891d0a06dfaad5ea13b63af69f1a6d595e6387"
 
-OPENJDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
+OPENJDK_CHANGESET:aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
 SRC_URI[openjdk.sha256sum] = "97175c78de4c82b78d3c80b1b0d22c44b195ca067f253cfaa3c235328b808760"
diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index a3747cf..6c7bdd2 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -32,22 +32,22 @@ HOTSPOT_UB_PATCH = "\
     file://1008-hotspot-handle-format-error-for-GCC-7.patch \
     file://1012-hotspot-enable-Wno-error.patch \
 "
-HOTSPOT_UB_PATCH_append_class-target = "\
+HOTSPOT_UB_PATCH:append:class-target = "\
     file://1009-hotspot-fix-adlc-flags.patch \
     file://1010-hotspot-fix-shark-build-common.patch \
     file://1011-hotspot-restrict-to-staging-dir.patch \
 "
-HOTSPOT_UB_PATCH_prepend_aarch64 = "\
+HOTSPOT_UB_PATCH:prepend:aarch64 = "\
     file://1401-hotspot-aarch64-Add-missing-return-value-to-LIR_Asse.patch \
 "
-HOTSPOT_UB_PATCH_append_armv7a = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
-HOTSPOT_UB_PATCH_append_armv7ve = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
+HOTSPOT_UB_PATCH:append:armv7a = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
+HOTSPOT_UB_PATCH:append:armv7ve = " file://1201-hotspot-aarch32-fix-missing-return-values.patch"
 
-PATCHES_URI_append_class-target = "\
+PATCHES_URI:append:class-target = "\
     file://1013-hotspot-add-missing-includes-for-shark-build-pt2.patch \
 "
 
-PATCHES_URI_append_libc-musl = "\
+PATCHES_URI:append:libc-musl = "\
     ${OBSOLETE_ISNANF_PATCH} \
     file://musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch \
     file://musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch \
@@ -56,50 +56,50 @@ PATCHES_URI_append_libc-musl = "\
     ${DISABLE_AGENT_BUILD_PT2} \
     file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-common.patch \
     ${REMOVE_GLIBC_DEPENDENCIES_PT2} \
-    file://musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch \
+    file://musl-0007-hotspot-os_linux:x86-remove-glibc-dependencies-fpu_c.patch \
     file://musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch \
     file://musl-0009-jdk-musl-has-gethostby_r.patch \
 "
 OBSOLETE_ISNANF_PATCH = "file://musl-0001-hotspot-stop-using-obsolete-isnanf.patch"
-OBSOLETE_ISNANF_PATCH_armv7a = ""
-OBSOLETE_ISNANF_PATCH_armv7ve = ""
+OBSOLETE_ISNANF_PATCH:armv7a = ""
+OBSOLETE_ISNANF_PATCH:armv7ve = ""
 DISABLE_AGENT_BUILD_PT2 = "file://musl-0005-hotspot-disable-agent-build-pt2.patch"
-DISABLE_AGENT_BUILD_PT2_armv7a = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
-DISABLE_AGENT_BUILD_PT2_armv7ve = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
+DISABLE_AGENT_BUILD_PT2:armv7a = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
+DISABLE_AGENT_BUILD_PT2:armv7ve = "file://musl-0005-hotspot-disable-agent-build-pt2-aarch32.patch"
 REMOVE_GLIBC_DEPENDENCIES_PT2 = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2.patch"
-REMOVE_GLIBC_DEPENDENCIES_PT2_armv7a = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
-REMOVE_GLIBC_DEPENDENCIES_PT2_armv7ve = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
+REMOVE_GLIBC_DEPENDENCIES_PT2:armv7a = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
+REMOVE_GLIBC_DEPENDENCIES_PT2:armv7ve = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
 
-PATCHES_URI_append_libc-musl_armv7a = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
-PATCHES_URI_append_libc-musl_armv7ve = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
-PATCHES_URI_append_libc-musl_aarch64 = " file://1402-hotspot-aarch64-remaining-musl-fixes.patch"
+PATCHES_URI:append:libc-musl:armv7a = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
+PATCHES_URI:append:libc-musl:armv7ve = " file://1202-hotspot-aarch32-remaining-musl-fixes.patch"
+PATCHES_URI:append:libc-musl:aarch64 = " file://1402-hotspot-aarch64-remaining-musl-fixes.patch"
 
 # remove aarch32 & aarch64 mainlined patches
-PATCHES_URI_remove_armv7a = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
-PATCHES_URI_remove_armv7ve = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
-PATCHES_URI_remove_aarch64 = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
+PATCHES_URI:remove:armv7a = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
+PATCHES_URI:remove:armv7ve = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
+PATCHES_URI:remove:aarch64 = "file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch"
 
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
 BUILD_DIR_ECJ = "openjdk.build-ecj"
 
 # Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
+ARM_INSTRUCTION_SET:armv4t = "ARM"
 
 # Enable zero mode for arm based builds, as normal hotspot fails to build
-PACKAGECONFIG_append_armv4 = " zero"
-PACKAGECONFIG_append_armv5 = " zero"
-PACKAGECONFIG_append_armv6 = " zero"
+PACKAGECONFIG:append:armv4 = " zero"
+PACKAGECONFIG:append:armv5 = " zero"
+PACKAGECONFIG:append:armv6 = " zero"
 
 OPENJDK_ARCH_PORT = "jdk8u"
-OPENJDK_ARCH_PORT_aarch64 = "aarch64-port"
-OPENJDK_ARCH_PORT_armv7a = "aarch32-port"
-OPENJDK_ARCH_PORT_armv7ve = "aarch32-port"
+OPENJDK_ARCH_PORT:aarch64 = "aarch64-port"
+OPENJDK_ARCH_PORT:armv7a = "aarch32-port"
+OPENJDK_ARCH_PORT:armv7ve = "aarch32-port"
 OPENJDK_HG_U = "jdk8u"
 
 # the aarch64 port moved, for more information see:
 # https://mail.openjdk.java.net/pipermail/aarch64-port-dev/2018-August/006265.html
-OPENJDK_HG_U_aarch64 = "jdk8u-shenandoah"
+OPENJDK_HG_U:aarch64 = "jdk8u-shenandoah"
 
 OPENJDK_HG_URL = "https://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
 
diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/openjdk/openjdk-8-release.inc
index 28429f8..4cdd050 100644
--- a/recipes-core/openjdk/openjdk-8-release.inc
+++ b/recipes-core/openjdk/openjdk-8-release.inc
@@ -3,8 +3,8 @@ require openjdk-8-release-common.inc
 # We do not yet work for aarch64, and we make sure
 # to use the aarch32 port for ARMv7.
 COMPATIBLE_HOST = "^(?!(aarch64)).*$"
-COMPATIBLE_HOST_armv7a = "^$"
-COMPATIBLE_HOST_armv7ve = "^$"
+COMPATIBLE_HOST:armv7a = "^$"
+COMPATIBLE_HOST:armv7ve = "^$"
 
 CORBA_CHANGESET = "jdk8u${PV}-ga"
 SRC_URI[corba.sha256sum] = "28c487a49546ab1a592eaf229c13e1896b390958ac4e6fa19bf5da34a1977138"
diff --git a/recipes-core/openjdk/openjdk-8_272.bb b/recipes-core/openjdk/openjdk-8_272.bb
index f9049e5..0bfa102 100644
--- a/recipes-core/openjdk/openjdk-8_272.bb
+++ b/recipes-core/openjdk/openjdk-8_272.bb
@@ -1,7 +1,7 @@
 INC_FILE_SUFFIX = ""
-INC_FILE_SUFFIX_aarch64 = "-aarch64"
-INC_FILE_SUFFIX_armv7a = "-aarch32"
-INC_FILE_SUFFIX_armv7ve = "-aarch32"
+INC_FILE_SUFFIX:aarch64 = "-aarch64"
+INC_FILE_SUFFIX:armv7a = "-aarch32"
+INC_FILE_SUFFIX:armv7ve = "-aarch32"
 require openjdk-8-release${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
@@ -14,12 +14,12 @@ do_install() {
     find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
 }
 
-PACKAGES_append = " \
+PACKAGES:append = " \
     ${PN}-demo \
     ${PN}-source \
 "
 
-FILES_${PN}_append = "\
+FILES:${PN}:append = "\
     ${JDK_HOME}/bin/[a-z]* \
     ${JDK_HOME}/lib/[a-z]* \
     ${JDK_HOME}/jre/bin/[a-z]* \
@@ -29,14 +29,14 @@ FILES_${PN}_append = "\
     ${JDK_HOME}/release \
 "
 
-FILES_${PN}-dev_append = "\
+FILES:${PN}-dev:append = "\
     ${JDK_HOME}/include \
 "
 
-FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
-RDEPENDS_${PN}-demo = " ${PN} "
+FILES:${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS:${PN}-demo = " ${PN} "
 
-FILES_${PN}-doc_append = "\
+FILES:${PN}-doc:append = "\
     ${JDK_HOME}/man \
     ${JDK_HOME}/ASSEMBLY_EXCEPTION \
     ${JDK_HOME}/THIRD_PARTY_README \
@@ -45,15 +45,15 @@ FILES_${PN}-doc_append = "\
     ${JDK_HOME}/man \
 "
 
-FILES_${PN}-source = " ${JDK_HOME}/src.zip "
+FILES:${PN}-source = " ${JDK_HOME}/src.zip "
 
-RPROVIDES_${PN} = "java2-runtime"
+RPROVIDES:${PN} = "java2-runtime"
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "java javac keytool"
+ALTERNATIVE:${PN} = "java javac keytool"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
 
diff --git a/recipes-core/openjdk/openjre-8_272.bb b/recipes-core/openjdk/openjre-8_272.bb
index 55ca1ec..c1789aa 100644
--- a/recipes-core/openjdk/openjre-8_272.bb
+++ b/recipes-core/openjdk/openjre-8_272.bb
@@ -1,7 +1,7 @@
 INC_FILE_SUFFIX = ""
-INC_FILE_SUFFIX_aarch64 = "-aarch64"
-INC_FILE_SUFFIX_armv7a = "-aarch32"
-INC_FILE_SUFFIX_armv7ve = "-aarch32"
+INC_FILE_SUFFIX:aarch64 = "-aarch64"
+INC_FILE_SUFFIX:armv7a = "-aarch32"
+INC_FILE_SUFFIX:armv7ve = "-aarch32"
 require openjdk-8-release${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
@@ -13,14 +13,14 @@ do_install() {
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
 }
 
-FILES_${PN}_append = "\
+FILES:${PN}:append = "\
     ${JRE_HOME}/bin/[a-z]* \
     ${JRE_HOME}/lib/[a-z]* \
     ${JRE_HOME}/LICENSE \
     ${JRE_HOME}/release \
 "
 
-FILES_${PN}-dbg_append = "\
+FILES:${PN}-dbg:append = "\
     ${JRE_HOME}/bin/.debug/ \
     ${JRE_HOME}/lib/.debug/ \
     ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
@@ -28,19 +28,19 @@ FILES_${PN}-dbg_append = "\
     ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
 "
 
-FILES_${PN}-doc_append = "\
+FILES:${PN}-doc:append = "\
     ${JRE_HOME}/man \
     ${JRE_HOME}/ASSEMBLY_EXCEPTION \
     ${JRE_HOME}/THIRD_PARTY_README \
 "
 
-RPROVIDES_${PN} = "java2-runtime"
+RPROVIDES:${PN} = "java2-runtime"
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "java keytool"
+ALTERNATIVE:${PN} = "java keytool"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
 
diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 4242005..54329c1 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lexical analyzer generator for Java"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e2372bdbf22c99279ae4599a13cc458"
 
-DEPENDS_class-native += "classpath-native"
+DEPENDS:class-native += "classpath-native"
 
 BBCLASSEXTEND = "native"
 
@@ -20,9 +20,9 @@ S = "${WORKDIR}/rhino1_7R4"
 
 PACKAGES = "${JPN} rhino"
 
-FILES_${PN} = "${bindir}/rhino ${bindir}/rhino-jsc"
-RDEPENDS_${PN} = "java2-runtime ${JPN}"
-RDEPENDS_${PN}_class-native = ""
+FILES:${PN} = "${bindir}/rhino ${bindir}/rhino-jsc"
+RDEPENDS:${PN} = "java2-runtime ${JPN}"
+RDEPENDS:${PN}:class-native = ""
 
 do_compile() {
 	mkdir -p build
@@ -39,7 +39,7 @@ do_compile() {
 	fastjar cfm ${JARFILENAME} ${S}/src/manifest -C build .
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}${bindir}
 
 	install -m 0755 ${WORKDIR}/rhino ${D}${bindir}
diff --git a/recipes-core/servlet-api/jsp2.0_5.5.26.bb b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
index 286d6d5..ac8617c 100644
--- a/recipes-core/servlet-api/jsp2.0_5.5.26.bb
+++ b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr152"
 inherit java-library
 
 DEPENDS = "servlet2.4"
-RDEPENDS_${PN} = "libservlet2.4-java"
+RDEPENDS:${PN} = "libservlet2.4-java"
 
 # Value of implementation.revision in build.xml
 IMPL_REVISION = "public_draft"
diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index ad985cb..138bc75 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -47,14 +47,14 @@ do_compile() {
   fastjar cf serializer-${PV}.jar -C build-serializer .
 }
 
-do_install_append() {
+do_install:append() {
   oe_jarinstall serializer-${PV}.jar serializer.jar
 }
 
 
 PACKAGES = "libxalan2-serializer-java ${JPN}"
 
-FILES_libxalan2-serializer-java = "${datadir_java}/serializer*.jar"
+FILES:libxalan2-serializer-java = "${datadir_java}/serializer*.jar"
 
 SRC_URI[archive.md5sum] = "fc805051f0fe505c7a4b1b5c8db9b9e3"
 SRC_URI[archive.sha256sum] = "fa52aa629bb882335d45d67401d270c3f21b5131aaea005ac0d4590f2ce8b043"
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 98ef32f..105a196 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -22,8 +22,8 @@ JPN = "libxerces2-java"
 
 DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
 
-RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
+RDEPENDS:${PN}:class-native = ""
 
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
diff --git a/recipes-core/xml-commons/jaxme_0.5.2.bb b/recipes-core/xml-commons/jaxme_0.5.2.bb
index b563cc6..cf0377a 100644
--- a/recipes-core/xml-commons/jaxme_0.5.2.bb
+++ b/recipes-core/xml-commons/jaxme_0.5.2.bb
@@ -45,7 +45,7 @@ do_compile() {
 #    jaxme_build src/pm build-pm $cp jaxmepm-${PV}.jar
 }
 
-do_install_append() {
+do_install:append() {
     oe_jarinstall jaxmeapi-${PV}.jar jaxmeapi.jar
     oe_jarinstall jaxmejs-${PV}.jar jaxmejs.jar
     oe_jarinstall jaxmexs-${PV}.jar jaxmexs.jar
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 8b43c39..5a71655 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -36,7 +36,7 @@ do_move_jaxen() {
 
 }
 
-addtask move_jaxen after do_removebinaries before do_patch
+addtask move_jaxen after do:removebinaries before do_patch
 
 do_compile() {
     mkdir -p build
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index 1f02cb7..2b8f959 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -39,11 +39,11 @@ do_compile() {
     fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
 }
 
-do_install_append() {
+do_install:append() {
     oe_jarinstall xpp3-xpath-${PV}.jar xpp3-xpath.jar
 }
 
-FILES_libxpp3-xpath-java = "${datadir}/java/xpp3-xpath*"
+FILES:libxpp3-xpath-java = "${datadir}/java/xpp3-xpath*"
 
 
 SRC_URI[md5sum] = "e1b6aeaad1cd06e64568aae1a507d5c6"
diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
index dfd2ff1..ca7652a 100644
--- a/recipes-extended/dbus/dbus-java_2.7.bb
+++ b/recipes-extended/dbus/dbus-java_2.7.bb
@@ -1,15 +1,15 @@
 SUMMARY = "A pure Java D-Bus Implementation"
-SUMMARY_${PN}-viewer = "${SUMMARY} (DBusViewer Binary)"
-SUMMARY_${PN}-bin = "${SUMMARY} (Binaries)"
+SUMMARY:${PN}-viewer = "${SUMMARY} (DBusViewer Binary)"
+SUMMARY:${PN}-bin = "${SUMMARY} (Binaries)"
 AUTHOR = "Matthew Johnson <dbus@matthew.ath.cx>"
 HOMEPAGE = "http://dbus.freedesktop.org/doc/dbus-java"
 SECTION = "libs"
 LICENSE = "LGPL-2.1 & AFL-2.1"
 
 DEPENDS = "libmatthew gettext-native fastjar-native"
-RDEPENDS_${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
-RDEPENDS_${PN}-bin = "java2-runtime libunixsocket-java libmatthew-debug-java ${JPN}"
-RSUGGESTS_${JPN} = "libunixsocket-java"
+RDEPENDS:${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
+RDEPENDS:${PN}-bin = "java2-runtime libunixsocket-java libmatthew-debug-java ${JPN}"
+RSUGGESTS:${JPN} = "libunixsocket-java"
 
 PR = "r1"
 
@@ -73,5 +73,5 @@ do_install () {
 # and dbus-bin*.jar
 PACKAGES = "${PN}-viewer ${PN}-bin ${JPN}"
 
-FILES_${PN}-viewer = "${datadir}/java/dbus-java-viewer*.jar ${bindir}/DBusViewer"
-FILES_${PN}-bin = "${datadir}/java/dbus-java-bin*.jar ${bindir}"
+FILES:${PN}-viewer = "${datadir}/java/dbus-java-viewer*.jar ${bindir}/DBusViewer"
+FILES:${PN}-bin = "${datadir}/java/dbus-java-bin*.jar ${bindir}"
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 87d84a8..27935bc 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880
 
 S = "${WORKDIR}/rxtx-2.2pre2"
 
-INSANE_SKIP_${JPN} += "dev-so"
+INSANE_SKIP:${JPN} += "dev-so"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit autotools-brokensep java-library remove-libtool
@@ -36,7 +36,7 @@ JARFILENAME = "RXTXcomm.jar"
 EXTRA_OEMAKE += "RXTX_PATH=${D}${libdir_jni} \
                  JHOME=${D}${datadir_java}/ext"
 
-do_configure_prepend() {
+do_configure:prepend() {
     # Ugly but don't complain to me, but upstream ;-)
     sed -e 's,bin/javah,bin/gjavah,g' \
         -e 's,bin/jar,bin/fastjar,g' \
@@ -47,16 +47,16 @@ do_configure_prepend() {
           ${S}/ltmain.sh
 }
 
-do_install_prepend() {
+do_install:prepend() {
     install -d ${D}${libdir_jni}
     install -d ${D}${datadir_java}/ext
 }
 
-PACKAGES_remove = "${PN}"
+PACKAGES:remove = "${PN}"
 
-FILES_${JPN} += "${libdir_jni}"
-RPROVIDES_${JPN} = "${PN}"
-RCONFLICTS_${JPN} = "${PN}"
-RREPLACES_${JPN} = "${PN}"
+FILES:${JPN} += "${libdir_jni}"
+RPROVIDES:${JPN} = "${PN}"
+RCONFLICTS:${JPN} = "${PN}"
+RREPLACES:${JPN} = "${PN}"
 
-FILES_${PN}-dbg += "${libdir_jni}/.debug"
+FILES:${PN}-dbg += "${libdir_jni}/.debug"
diff --git a/recipes-images/images/openjdk-7-test-image.bb b/recipes-images/images/openjdk-7-test-image.bb
index 1e6d734..4251da3 100644
--- a/recipes-images/images/openjdk-7-test-image.bb
+++ b/recipes-images/images/openjdk-7-test-image.bb
@@ -1,3 +1,3 @@
-IMAGE_INSTALL_append = " openjdk-7-jdk "
+IMAGE_INSTALL:append = " openjdk-7-jdk "
 
 inherit openjdk-test-image
diff --git a/recipes-images/images/openjdk-8-test-image.bb b/recipes-images/images/openjdk-8-test-image.bb
index d2eb040..3216040 100644
--- a/recipes-images/images/openjdk-8-test-image.bb
+++ b/recipes-images/images/openjdk-8-test-image.bb
@@ -1,3 +1,3 @@
-IMAGE_INSTALL_append = " openjdk-8 "
+IMAGE_INSTALL:append = " openjdk-8 "
 
 inherit openjdk-test-image
diff --git a/recipes-images/images/openjre-7-test-image.bb b/recipes-images/images/openjre-7-test-image.bb
index 2616255..ced320b 100644
--- a/recipes-images/images/openjre-7-test-image.bb
+++ b/recipes-images/images/openjre-7-test-image.bb
@@ -1,3 +1,3 @@
-IMAGE_INSTALL_append = " openjdk-7-jre "
+IMAGE_INSTALL:append = " openjdk-7-jre "
 
 inherit openjre-test-image
diff --git a/recipes-images/images/openjre-8-test-image.bb b/recipes-images/images/openjre-8-test-image.bb
index e722ec3..f95098b 100644
--- a/recipes-images/images/openjre-8-test-image.bb
+++ b/recipes-images/images/openjre-8-test-image.bb
@@ -1,3 +1,3 @@
-IMAGE_INSTALL_append = " openjre-8 "
+IMAGE_INSTALL:append = " openjre-8 "
 
 inherit openjre-test-image
-- 
2.17.1

