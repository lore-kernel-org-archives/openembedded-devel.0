Return-Path: <prvs=73859fb85=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD8475894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 09:37:37 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqwEAOM5M1asEApK/2dsb2JhbABehA5vBrYChQeGCR2FfAKCAAEBAQEBAYELhDYBAQQaMQEoBRAYBTRJDgYOBYg1uHcBi0gBAQEBBgEBAQEBHoZ3h2+BVIR7BYdFhVaJKIUdiEiBGUiHD4o4ZodsgnQdgVdxAYR2gQcBAQE
X-IPAS-Result: AqwEAOM5M1asEApK/2dsb2JhbABehA5vBrYChQeGCR2FfAKCAAEBAQEBAYELhDYBAQQaMQEoBRAYBTRJDgYOBYg1uHcBi0gBAQEBBgEBAQEBHoZ3h2+BVIR7BYdFhVaJKIUdiEiBGUiHD4o4ZodsgnQdgVdxAYR2gQcBAQE
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Oct 2015 10:36:29 +0100
Message-ID: <1446197789-5739-2-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446197789-5739-1-git-send-email-richard.leitner@skidata.com>
References: <1446197789-5739-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH 2/2] openjdk: fix indentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 09:37:38 -0000
Content-Type: text/plain

Change the indentation for all openjdk recipes to 4 spaces.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc     | 325 +++++++++++++-------------
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb |  34 +--
 recipes-core/openjdk/openjdk-postinst.inc     |  89 ++++---
 3 files changed, 223 insertions(+), 225 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 059e1c8..d0351e4 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -4,18 +4,18 @@ ICEDTEA = "icedtea-${ICEDTEA_VERSION}"
 INC_PR = "r6"
 
 SRC_URI = " \
-  ${ICEDTEA_URI} \
-  ${OPENJDK_URI} \
-  ${HOTSPOT_URI} \
-  ${CORBA_URI} \
-  ${JAXP_URI} \
-  ${JAXWS_URI} \
-  ${JDK_URI} \
-  ${LANGTOOLS_URI} \
-  ${OEPATCHES} \
-  ${ICEDTEAPATCHES} \
-  file://jvm.cfg \
-  "
+    ${ICEDTEA_URI} \
+    ${OPENJDK_URI} \
+    ${HOTSPOT_URI} \
+    ${CORBA_URI} \
+    ${JAXP_URI} \
+    ${JAXWS_URI} \
+    ${JDK_URI} \
+    ${LANGTOOLS_URI} \
+    ${OEPATCHES} \
+    ${ICEDTEAPATCHES} \
+    file://jvm.cfg \
+"
 
 JDKPN = "openjdk-7"
 JDK_DIR = "java-7-openjdk"
@@ -24,37 +24,37 @@ PN = "${JDKPN}-jre"
 PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
-           icedtea7-native zip-native ant-native \
-           zlib libxslt-native \
-	   jpeg libpng giflib \
-           gtk+ glib-2.0 \
-           cups fontconfig \
-	   rhino krb5 \
-	   libxt libxinerama libxrender libxtst libxi \
-	   freetype alsa-lib libffi \
-          "
+    icedtea7-native zip-native ant-native \
+    zlib libxslt-native \
+    jpeg libpng giflib \
+    gtk+ glib-2.0 \
+    cups fontconfig \
+    rhino krb5 \
+    libxt libxinerama libxrender libxtst libxi \
+    freetype alsa-lib libffi \
+"
 
 # No package should directly depend on this (it should require
 # java2-runtime instead).
 PRIVATE_LIBS = "\
-	lib.so libunpack.so libverify.so libjava.so libzip.so libnpt.so \
-	libjava_crw_demo.so libhprof.so libjavanet.so libnio.so \
-	libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so \
-	libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
-	libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so \
-	libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
-	libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
-	libmawt.so libjvm.so \
-	libversionCheck.so libcompiledMethodLoad.so libgctest.so \
-	libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
-	libwaiters.so libhprof.so \
-       "
+    lib.so libunpack.so libverify.so libjava.so libzip.so libnpt.so \
+    libjava_crw_demo.so libhprof.so libjavanet.so libnio.so \
+    libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so \
+    libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
+    libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so \
+    libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
+    libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
+    libmawt.so libjvm.so \
+    libversionCheck.so libcompiledMethodLoad.so libgctest.so \
+    libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
+    libwaiters.so libhprof.so \
+"
 
 export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 export CACAO_CONFIGURE_ARGS = " \
-	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']}"
+    ${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']}"
 
 JAVA_HOME[unexport] = "1"
 
@@ -82,52 +82,52 @@ def get_jdk7_jobs(d):
 JDK_JOBS = "${@get_jdk7_jobs(d)}"
 
 EXTRA_OECONF = " \
-        --disable-tests \
-	--disable-hotspot-tests \
-	--disable-langtools-tests \
-	--disable-jdk-tests \
-	--disable-docs \
-	--disable-nss \
-	--disable-system-lcms \
-	--disable-bootstrap \
-	\
-        --enable-zero \
-	\
-	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
-	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
-	\
-        --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
-	--with-hotspot-src-zip=${WORKDIR}/${HOTSPOT_FILE} \
-	--with-corba-src-zip=${WORKDIR}/${CORBA_FILE} \
-	--with-jaxp-src-zip=${WORKDIR}/${JAXP_FILE} \
-	--with-jaxws-src-zip=${WORKDIR}/${JAXWS_FILE} \
-	--with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
-	--with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
-	\
-	--with-parallel-jobs=${JDK_JOBS} \
-	\
-	--with-pkgversion=${PV} \
-	--with-cc-for-build=${BUILD_CC} \
-       "
+    --disable-tests \
+    --disable-hotspot-tests \
+    --disable-langtools-tests \
+    --disable-jdk-tests \
+    --disable-docs \
+    --disable-nss \
+    --disable-system-lcms \
+    --disable-bootstrap \
+    \
+    --enable-zero \
+    \
+    --with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
+    --with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
+    \
+    --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
+    --with-hotspot-src-zip=${WORKDIR}/${HOTSPOT_FILE} \
+    --with-corba-src-zip=${WORKDIR}/${CORBA_FILE} \
+    --with-jaxp-src-zip=${WORKDIR}/${JAXP_FILE} \
+    --with-jaxws-src-zip=${WORKDIR}/${JAXWS_FILE} \
+    --with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
+    --with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
+    \
+    --with-parallel-jobs=${JDK_JOBS} \
+    \
+    --with-pkgversion=${PV} \
+    --with-cc-for-build=${BUILD_CC} \
+"
 
 # PCSC default value was changed to true and SCTP was added during the 2.6.0
 # release so we disable them both explicitely here
 EXTRA_OECONF += " \
-	--disable-system-pcsc \
-	--disable-system-sctp \
-	"
+    --disable-system-pcsc \
+    --disable-system-sctp \
+"
 
 do_configure_prepend() {
-  echo "Configure with parallel-jobs: ${JDK_JOBS}"
+    echo "Configure with parallel-jobs: ${JDK_JOBS}"
 
-  # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
-  # ".patch" into the patches directory.
-  find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
-  find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patches \;
+    # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
+    # ".patch" into the patches directory.
+    find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
+    find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patches \;
 }
 
 do_configure_append() {
-	oe_runmake patch
+    oe_runmake patch
 }
 
 # Work around broken variable quoting in oe-stable 2009 and provide the variable
@@ -140,15 +140,15 @@ do_configure_append() {
 EXTRA_OEMAKE += 'CC="${CC}" CCC="${CXX}" CPP="${CPP}" CXX="${CXX}" CC_FOR_BUILD="${BUILD_CC}"'
 
 EXTRA_OEMAKE += ' \
-                OE_CFLAGS="${TARGET_CFLAGS}" \
-                OE_CPPFLAGS="${TARGET_CPPFLAGS}" \
-                OE_CXXFLAGS="${TARGET_CXXFLAGS}" \
-                OE_LDFLAGS="${TARGET_LDFLAGS}" \
-                ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
-		CROSS_COMPILE_ARCH="${JDK_ARCH}" \
-		REQUIRED_ALSA_VERSION="" \
-		DISABLE_HOTSPOT_OS_VERSION_CHECK=ok \
-               '
+    OE_CFLAGS="${TARGET_CFLAGS}" \
+    OE_CPPFLAGS="${TARGET_CPPFLAGS}" \
+    OE_CXXFLAGS="${TARGET_CXXFLAGS}" \
+    OE_LDFLAGS="${TARGET_LDFLAGS}" \
+    ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
+    CROSS_COMPILE_ARCH="${JDK_ARCH}" \
+    REQUIRED_ALSA_VERSION="" \
+    DISABLE_HOTSPOT_OS_VERSION_CHECK=ok \
+'
 
 # Provides the target architecture to the configure script.
 export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
@@ -160,36 +160,35 @@ OE_LAUNCHER_LDFLAGS_arm = ""
 EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
 
 do_compile() {
+    bbnote "3/3 Building final JDK"
 
-	bbnote "3/3 Building final JDK"
-
-	# Build the final Hotspot + OpenJDK
-	oe_runmake icedtea-stage2
+    # Build the final Hotspot + OpenJDK
+    oe_runmake icedtea-stage2
 }
 
 do_install() {
-	install -d ${D}${libdir_jvm}
-	cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
-
-	chmod u+rw -R ${D}${JDK_HOME}
-
-	# Fix symlink which would point into staging in the binary package.
-	ln -sf ${datadir_java}/rhino.jar ${D}${JDK_HOME}/jre/lib/rhino.jar
-
-	# JRE is a subset of JDK. So to save space and resemble what the BIG distros
-	# do we create symlinks from the JDK binaries to their counterparts in the
-	# JRE folder (which have to exist by that time b/c of dependencies).
-	for F in `find ${D}${JDK_HOME}/jre/bin -type f`
-	do
-		bf=`basename $F`
-		bbnote "replace:" $bf
-		rm ${D}${JDK_HOME}/bin/$bf
-		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
-	done
-
-        install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
-        # workaround for shared libarary searching
-	ln -sf ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/libjvm.so ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+    install -d ${D}${libdir_jvm}
+    cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+
+    chmod u+rw -R ${D}${JDK_HOME}
+
+    # Fix symlink which would point into staging in the binary package.
+    ln -sf ${datadir_java}/rhino.jar ${D}${JDK_HOME}/jre/lib/rhino.jar
+
+    # JRE is a subset of JDK. So to save space and resemble what the BIG distros
+    # do we create symlinks from the JDK binaries to their counterparts in the
+    # JRE folder (which have to exist by that time b/c of dependencies).
+    for F in `find ${D}${JDK_HOME}/jre/bin -type f`
+    do
+        bf=`basename $F`
+        bbnote "replace:" $bf
+        rm ${D}${JDK_HOME}/bin/$bf
+        ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
+    done
+
+    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+    # workaround for shared libarary searching
+    ln -sf ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/libjvm.so ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
 }
 
 # Notes about the ideas behind packaging:
@@ -204,47 +203,47 @@ do_install() {
 # runtime)
 # 3) All other packages, including -jdk, are optional and not needed for normal Java apps.
 PACKAGES = " \
-            ${JDKPN}-jre \
-	    ${JDKPN}-jre-dbg \
-            ${JDKPN}-dbg \
-            ${JDKPN}-demo-dbg \
-            ${JDKPN}-demo \
-            ${JDKPN}-source \
-            ${JDKPN}-doc \
-            ${JDKPN}-jdk \
-            ${JDKPN}-java \
-            ${JDKPN}-vm-zero \
-            ${JDKPN}-common \
-           "
+    ${JDKPN}-jre \
+    ${JDKPN}-jre-dbg \
+    ${JDKPN}-dbg \
+    ${JDKPN}-demo-dbg \
+    ${JDKPN}-demo \
+    ${JDKPN}-source \
+    ${JDKPN}-doc \
+    ${JDKPN}-jdk \
+    ${JDKPN}-java \
+    ${JDKPN}-vm-zero \
+    ${JDKPN}-common \
+"
 
 FILES_${JDKPN}-dbg = "\
-	${JDK_HOME}/bin/.debug \
-	${JDK_HOME}/lib/.debug \
-	${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
-	${JDK_HOME}/jre/bin/.debug \
-	${JDK_HOME}/jre/lib/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
-       "
+    ${JDK_HOME}/bin/.debug \
+    ${JDK_HOME}/lib/.debug \
+    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
+    ${JDK_HOME}/jre/bin/.debug \
+    ${JDK_HOME}/jre/lib/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
+"
 
 FILES_${JDKPN}-demo = "${JDK_HOME}/demo ${JDK_HOME}/sample"
 RDEPENDS_${JDKPN}-demo = "${JDKPN}-jre"
 FILES_${JDKPN}-demo-dbg = "\
-	${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
-	${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
-	${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
-	${JDK_HOME}/demo/jvmti/hprof/lib/.debug \
-	${JDK_HOME}/demo/jvmti/minst/lib/.debug \
-	${JDK_HOME}/demo/jvmti/mtrace/lib/.debug \
-	${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug \
-	${JDK_HOME}/demo/jvmti/waiters/lib/.debug \
-	${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
-       "
+    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/minst/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
+"
 
 FILES_${JDKPN}-source = "${JDK_HOME}/src.zip"
 
@@ -253,27 +252,27 @@ FILES_${JDKPN}-java = "${JDK_HOME}/jre/bin/java"
 FILES_${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
 
 FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
-                          ${JDK_HOME}/jre/THIRD_PARTY_README \
-                          ${JDK_HOME}/jre/LICENSE \
-                          ${JDK_HOME}/ASSEMBLY_EXCEPTION \
-                          ${JDK_HOME}/THIRD_PARTY_README \
-                          ${JDK_HOME}/LICENSE \
-                          ${JDK_HOME}/release \
-                          ${JDK_HOME}/jre/lib \
-                         "
+    ${JDK_HOME}/jre/THIRD_PARTY_README \
+    ${JDK_HOME}/jre/LICENSE \
+    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/THIRD_PARTY_README \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/release \
+    ${JDK_HOME}/jre/lib \
+"
 
 FILES_${PN}_append = " \
-	${JDK_HOME}/jre/bin/keytool \
-	${JDK_HOME}/jre/bin/orbd \
-	${JDK_HOME}/jre/bin/pack200 \
-	${JDK_HOME}/jre/bin/rmid \
-	${JDK_HOME}/jre/bin/rmiregistry \
-	${JDK_HOME}/jre/bin/servertool \
-	${JDK_HOME}/jre/bin/tnameserv \
-	${JDK_HOME}/jre/bin/unpack200 \
-	${JDK_HOME}/jre/bin/policytool \
-	${JDK_HOME}/jre/bin/javaws \
-	"
+    ${JDK_HOME}/jre/bin/keytool \
+    ${JDK_HOME}/jre/bin/orbd \
+    ${JDK_HOME}/jre/bin/pack200 \
+    ${JDK_HOME}/jre/bin/rmid \
+    ${JDK_HOME}/jre/bin/rmiregistry \
+    ${JDK_HOME}/jre/bin/servertool \
+    ${JDK_HOME}/jre/bin/tnameserv \
+    ${JDK_HOME}/jre/bin/unpack200 \
+    ${JDK_HOME}/jre/bin/policytool \
+    ${JDK_HOME}/jre/bin/javaws \
+"
 
 RDEPENDS_${JDKPN}-common = "librhino-java"
 
@@ -296,10 +295,10 @@ INSANE_SKIP_${JDKPN}-vm-zero = "dev-so"
 INSANE_SKIP_${JDKPN}-common = "dev-so"
 
 FILES_${JDKPN}-jdk = " \
-                       ${JDK_HOME}/bin \
-                       ${JDK_HOME}/lib \
-                       ${JDK_HOME}/include \
-                      "
+    ${JDK_HOME}/bin \
+    ${JDK_HOME}/lib \
+    ${JDK_HOME}/include \
+"
 RDEPENDS_${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
 RDEPENDS_${JDKPN}-java = "${JDKPN}-common"
 RPROVIDES_${JDKPN}-jre = "java2-runtime"
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index 92613a2..4bff40a 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -45,26 +45,26 @@ SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055
 ###############################################################################
 # PATCHES - split up to allow overriding them separately
 OEPATCHES = "\
-	file://build-hacks.patch \
-	file://fix_hotspot_crosscompile.patch \
-	"
+    file://build-hacks.patch \
+    file://fix_hotspot_crosscompile.patch \
+"
 
 ICEDTEAPATCHES = "\
-	file://icedtea-zero-hotspotfix.patch;apply=no \
-	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
-	file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
-	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
-	file://icedtea-crosscompile-fix.patch;apply=no \
-	file://icedtea-xawt-crosscompile-fix.patch;apply=no \
-	"
+    file://icedtea-zero-hotspotfix.patch;apply=no \
+    file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+    file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
+    file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
+    file://icedtea-crosscompile-fix.patch;apply=no \
+    file://icedtea-xawt-crosscompile-fix.patch;apply=no \
+"
 
 DISTRIBUTION_PATCHES = "\
-	patches/icedtea-zero-hotspotfix.patch \
-	patches/icedtea-jdk-nio-use-host-cc.patch \
-	patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
-	patches/icedtea-jdk-rmi-crosscompile.patch \
-	patches/icedtea-crosscompile-fix.patch \
-	patches/icedtea-xawt-crosscompile-fix.patch \
-	"
+    patches/icedtea-zero-hotspotfix.patch \
+    patches/icedtea-jdk-nio-use-host-cc.patch \
+    patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
+    patches/icedtea-jdk-rmi-crosscompile.patch \
+    patches/icedtea-crosscompile-fix.patch \
+    patches/icedtea-xawt-crosscompile-fix.patch \
+"
 
 export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-postinst.inc b/recipes-core/openjdk/openjdk-postinst.inc
index ad275d7..e309a27 100644
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ b/recipes-core/openjdk/openjdk-postinst.inc
@@ -1,75 +1,75 @@
 # handles all postinst action for openjdk
 
 pkg_postinst_${JDKPN}-vm-shark () {
-        if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-	else
-          sed -i -e "s/\-shark.*/\-shark KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-shark.*/\-shark KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 }
 
 pkg_prerm_${JDKPN}-vm-shark () {
-	sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 
-        echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_postinst_${JDKPN}-vm-cacao () {
-        if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-	else
-          sed -i -e "s/\-cacao.*/\-cacao KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-cacao.*/\-cacao KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 }
 
 pkg_prerm_${JDKPN}-vm-cacao () {
-	sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 
-        echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_postinst_${JDKPN}-vm-jamvm () {
-        if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-	else
-          sed -i -e "s/\-jamvm.*/\-jamvm KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-jamvm.*/\-jamvm KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 }
 
 pkg_prerm_${JDKPN}-vm-jamvm () {
-	sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 
-        echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_postinst_${JDKPN}-vm-zero () {
-        if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-           FIRST_KNOWN=`grep "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-           sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-           echo ${FIRST_KNOWN} >> $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        echo ${FIRST_KNOWN} >> $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 
-        sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_prerm_${JDKPN}-vm-zero () {
-	sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        fi
+    sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
 }
 
 inherit update-alternatives
@@ -82,4 +82,3 @@ ALTERNATIVE_TARGET_${JDKPN}-jdk = "${JDK_HOME}/bin/javac"
 
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
-
-- 
2.1.4


