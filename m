Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 927AD7FA29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Dec 2019 23:21:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,378,1571727600"; d="scan'208";a="213554986"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by orsmga008.jf.intel.com with ESMTP; 30 Dec 2019 23:21:44 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2019 15:19:47 +0800
Message-Id: <20191231071948.28950-2-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
References: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH v3 1/2] openjdk-12: Add new recipe
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
X-List-Received-Date: Tue, 31 Dec 2019 07:21:44 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

Openjdk-12 is implementation of Java SE 12.
This recipe taken from branch jdk12u on release 12.0.2+10 [1].
Openjdk-12 can compile with glibc on x86_64, x86 and aarch64. Compiling
against musl is not working. This recipe require openjdk-11 to be installed
on host machine.

Some highlight features for openjdk-12 taken from [2-9]
    189: 	Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)
    230: 	Microbenchmark Suite
    325: 	Switch Expressions (Preview)
    334: 	JVM Constants API
    340: 	One AArch64 Port, Not Two
    341: 	Default CDS Archives
    344: 	Abortable Mixed Collections for G1
    346: 	Promptly Return Unused Committed Memory from G1

For more information see source code at [10].

References
[1] https://openjdk.java.net/projects/jdk/12/
[2] https://openjdk.java.net/jeps/189
[3] https://openjdk.java.net/jeps/230
[4] https://openjdk.java.net/jeps/325
[5] https://openjdk.java.net/jeps/334
[6] https://openjdk.java.net/jeps/340
[7] https://openjdk.java.net/jeps/341
[8] https://openjdk.java.net/jeps/344
[9] https://openjdk.java.net/jeps/346
[10] https://hg.openjdk.java.net/jdk-updates/jdk12u/rev/7b6accc7c009

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 recipes-core/openjdk/openjdk-12-common.inc    | 151 ++++++++++++++++++
 recipes-core/openjdk/openjdk-12-cross.inc     | 145 +++++++++++++++++
 recipes-core/openjdk/openjdk-12-native.inc    |  86 ++++++++++
 .../openjdk/openjdk-12-native_2+10.bb         |   2 +
 .../openjdk-12-release-2+10-aarch32.inc       |  15 ++
 .../openjdk-12-release-2+10-aarch64.inc       |  12 ++
 .../openjdk-12-release-2+10-common.inc        |  35 ++++
 .../openjdk/openjdk-12-release-2+10.inc       |  11 ++
 recipes-core/openjdk/openjdk-12_2+10.bb       |  57 +++++++
 recipes-core/openjdk/openjre-12_2+10.bb       |  54 +++++++
 .../0001-fix-stringop-truncate-gcc8.patch     |  11 ++
 .../0002-fix-stringop-truncate-gcc8.patch     |  38 +++++
 .../filter-aclocal-copy-too.patch             |  10 ++
 .../openjdk/patches-openjdk-12/jvm.cfg        |  41 +++++
 ...njdk12-find-compiler-fix-env-respect.patch |  11 ++
 ...move-shell-variables-from-autoheader.patch |  28 ++++
 .../images/openjdk-12-test-image.bb           |   3 +
 .../images/openjre-12-test-image.bb           |   3 +
 18 files changed, 713 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-12-common.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-cross.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-native.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-native_2+10.bb
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-common.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10.inc
 create mode 100644 recipes-core/openjdk/openjdk-12_2+10.bb
 create mode 100644 recipes-core/openjdk/openjre-12_2+10.bb
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/jvm.cfg
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
 create mode 100644 recipes-images/images/openjdk-12-test-image.bb
 create mode 100644 recipes-images/images/openjre-12-test-image.bb

diff --git a/recipes-core/openjdk/openjdk-12-common.inc b/recipes-core/openjdk/openjdk-12-common.inc
new file mode 100644
index 0000000..ca089c8
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-common.inc
@@ -0,0 +1,151 @@
+SUMMARY = "Java runtime based upon the OpenJDK Project"
+HOMEPAGE = "http://openjdk.java.net/"
+LICENSE  = "GPL-2.0-with-classpath-exception"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fac05c3c03d4a26bbda13f8f"
+
+require openjdk-common.inc
+
+AUTOTOOLS_SCRIPT_PATH = "${S}/make/autoconf"
+export AUTOCONF_DIR="${AUTOTOOLS_SCRIPT_PATH}"
+export TOPDIR="${S}"
+
+FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-12:"
+
+# for weird openjdk-common.inc
+S = "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
+
+SRC_URI = " \
+    ${OPENJDK_URI} \
+    ${PATCHES_URI} \
+"
+
+def package_config_option_cleanup(d):
+    distro_x11 = bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d)
+    distro_alsa = bb.utils.contains('DISTRO_FEATURES', 'alsa', True, False, d)
+    distro_pulseaudio = bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', True, False, d)
+
+    with_x11 = bb.utils.contains('PACKAGECONFIG', 'x11', True, False, d)
+    with_cups = bb.utils.contains('PACKAGECONFIG', 'cups', True, False, d)
+    with_alsa = bb.utils.contains('PACKAGECONFIG', 'alsa', True, False, d)
+    with_pulseaudio = bb.utils.contains('PACKAGECONFIG', 'pulseaudio', True, False, d)
+
+    option_headless = bb.utils.contains('PACKAGECONFIG', 'headless', True, False, d)
+    option_headful = bb.utils.contains('PACKAGECONFIG', 'headful', True, False, d)
+    option_soundless = bb.utils.contains('PACKAGECONFIG', 'soundless', True, False, d)
+
+    if option_headless and option_headful:
+        option_headless = False
+
+    if option_headful and not with_x11:
+        with_x11 = True
+
+    if option_headful and not with_cups:
+        with_cups = True
+
+    if option_soundless and with_alsa:
+        with_alsa = False
+
+    if option_soundless and with_pulseaudio:
+        with_pulseaudio = False
+
+    if with_x11 and not distro_x11:
+        with_x11 = False
+
+    if with_alsa and not distro_alsa:
+        with_alsa = False
+
+    if with_pulseaudio and not distro_pulseaudio:
+        with_pulseaudio = False
+
+    if option_headful and not with_x11:
+        option_headful = False
+
+    if option_headful and not with_cups:
+        option_headful = False
+
+    if not option_headless and not with_x11:
+        option_headless = True
+
+    if not option_headless and not with_cups:
+        option_headless = True
+
+    if not option_soundless and not with_alsa:
+        option_soundless = True
+
+    if not option_soundless and not with_pulseaudio:
+        option_soundless = True
+
+    options = {'make': [], 'cpp': [], 'env': [], 'configure': ["--disable-ccache"] }
+
+    if option_headful:
+        options['configure'].append("--enable-headful")
+
+    if option_headless:
+        options['configure'].append("--disable-headful")
+        options['make'].append("BUILD_HEADLESS_ONLY=1")
+        options['make'].append("BUILD_HEADLESS=true")
+
+    if option_soundless:
+        options['make'].append("BUILD_SOUNDLESS_ONLY=1")
+
+    if not with_x11:
+        options['make'].append("X11_NOT_NEEDED=1")
+        options['env'].append("X11_NOT_NEEDED=yes")
+
+    if not with_cups:
+        options['make'].append("CUPS_NOT_NEEDED=1")
+        options['env'].append("CUPS_NOT_NEEDED=yes")
+
+    if not with_alsa:
+        options['make'].append("ALSA_NOT_NEEDED=1")
+        options['env'].append("ALSA_NOT_NEEDED=yes")
+
+    if not with_pulseaudio:
+        options['make'].append("PULSE_NOT_NEEDED=1")
+        options['env'].append("PULSE_NOT_NEEDED=yes")
+
+    options = [ ' '.join(options['make']), ' '.join(options['cpp']), ' '.join(options['env']), ' '.join(options['configure']) ]
+
+    return options
+
+def jdk_make_options(d):
+    options = package_config_option_cleanup(d)
+    return options[0]
+
+def jdk_cpp_options(d):
+    options = package_config_option_cleanup(d)
+    if not options[1]:
+        return ""
+
+    return " " + options[1]
+
+def jdk_environment_options(d):
+    options = package_config_option_cleanup(d)
+    return options[2]
+
+def jdk_configure_options(d):
+    options = package_config_option_cleanup(d)
+    return options[3]
+
+do_configure_prepend() {
+        export ${@jdk_environment_options(d)}
+}
+
+export DEBUG_BINARIES = "true"
+
+ALTERNATIVE_PRIORITY = "50"
+
+OPENJDK_UPDATE_VERSION = "${@d.getVar('PV').split('+')[0]}"
+OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV').split('+')[1]}"
+EXTRA_OECONF_append = "\
+        --with-build-number=${OPENJDK_BUILD_NUMBER} \
+        --with-update-version=${OPENJDK_UPDATE_VERSION} \
+"
+
+# flags for -native, and for bits that need a host-tool during -cross
+BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
+BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
+# flags for -cross
+TARGET_CFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
+TARGET_CXXFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
diff --git a/recipes-core/openjdk/openjdk-12-cross.inc b/recipes-core/openjdk/openjdk-12-cross.inc
new file mode 100644
index 0000000..6b00399
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-cross.inc
@@ -0,0 +1,145 @@
+JDK_HOME = "${libdir_jvm}/openjdk-12"
+JRE_HOME = "${libdir_jvm}/openjre-12"
+
+DEPENDS = "\
+    openjdk-12-native zip-native ant-native libxslt \
+    libffi fontconfig freetype \
+"
+
+PRIVATE_LIBS = "\
+    libattach.so libawt_headless.so libawt.so libawt_xawt.so libdt_socket.so \
+    libfontmanager.so libhprof.so libinstrument.so libj2gss.so libj2pcsc.so \
+    libj2pkcs11.so libjaas_unix.so libjava_crw_demo.so libjava.so libjawt.so \
+    libjdwp.so libjli.so libjpeg.so libjsdt.so libjsig.so libjvm.so liblcms.so \
+    libmanagement.so libmlib_image.so libnet.so libnio.so libnpt.so libsaproc.so \
+    libsctp.so libsplashscreen.so libsunec.so libunpack.so libverify.so libzip.so \
+"
+
+PACKAGECONFIG ??= " \
+    repack \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 cups', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    gif jpeg png zlib \
+"
+PACKAGECONFIG[x11] = "--with-x,,libx11 xorgproto libxt libxext libxrender libxtst libxrandr"
+#PACKAGECONFIG[cups] = "--with-cups-include=${includedir},,cups"
+PACKAGECONFIG[cups] = "--with-cups-include=${STAGING_INCDIR},,cups"
+PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
+
+PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
+
+PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib,"
+PACKAGECONFIG[jpeg] = "--with-libjpeg=system,--with-libjpeg=bundled,jpeg,"
+PACKAGECONFIG[png] = "--with-libpng=system,--with-libpng=bundled,libpng,"
+PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib,"
+
+# JVM variants
+export WANT_LLVM_RELEASE = "3.5.2"
+PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
+PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
+PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
+
+PACKAGECONFIG[repack] = ",,,"
+
+PACKAGECONFIG[kerberos] = ",,krb5"
+
+CACHED_CONFIGUREVARS = " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_includes=${STAGING_INCDIR}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_libraries=${STAGING_LIBDIR}', '', d)} \
+"
+
+require openjdk-12-common.inc
+
+JAVA_HOME[unexport] = "1"
+
+SRC_URI_append = "\
+    file://jvm.cfg \
+"
+
+EXTRA_OECONF_append = "\
+    --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
+    --with-sys-root=${STAGING_DIR_HOST} \
+    --with-tools-dir=${STAGING_DIR_NATIVE} \
+    --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-12-native \
+    --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-12-native/lib/security/cacerts \
+    --disable-precompiled-headers \
+    --disable-zip-debug-info \
+    --with-extra-cflags='${CFLAGS}' \
+    --with-extra-cxxflags='${CXXFLAGS}' \
+    --with-extra-ldflags='${LDFLAGS}' \
+    ${@jdk_configure_options(d)} \
+"
+
+do_configure_append() {
+    sed -i -e 's,POST_STRIP_CMD:=.*,POST_STRIP_CMD:=,g' ${B}/spec.gmk
+}
+
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
+      if [ -d ${D}${JDK_HOME} ] ; then
+        find ${D}${JDK_HOME} -name "*.jar" -print0 | \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
+              echo "Repacking" "$0" ; \
+              pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
+      fi
+      if [ -d ${D}${JRE_HOME} ] ; then
+        find ${D}${JRE_HOME} -name "*.jar" -print0 | \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
+              echo "Repacking" "$0" ; \
+              pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
+      fi
+    fi
+}
+
+# ignore all the compiler warning for now
+CFLAGS_append = " -Wno-error=stringop-truncation \
+                  -Wno-error=format-overflow \
+                  -Wno-error=class-memaccess \
+                  -Wno-error=cast-function-type \
+                  -Wno-error=format-truncation \
+                  -Wno-error=implicit-function-declaration \
+                  -Wno-error=int-conversion \
+                  -Wno-error=return-type \
+                  "
+
+CPPFLAGS_append = " -Wno-error=stringop-truncation \
+                    -Wno-error=format-overflow \
+                    -Wno-error=class-memaccess \
+                    -Wno-error=cast-function-type \
+                    -Wno-error=format-truncation \
+                    -Wno-error=implicit-function-declaration \
+                    -Wno-error=int-conversion \
+                    -Wno-error=return-type \
+                  "
+
+export MAKE_VERBOSE = "y"
+export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace STRIP_POLICY=no_strip"
+
+BUILD_LD="${BUILD_CCLD}"
+
+EXTRA_OEMAKE_append = '\
+    ${@jdk_make_options(d)} \
+    STRIP_POLICY=no_strip \
+    MAKE_VERBOSE=y LOG=debug LOG_LEVEL=trace \
+    QUIETLY= \
+    images \
+'
+
+python remove_debuglink() {
+    dvar = d.getVar('PKGD')
+    objcopy = d.getVar("OBJCOPY")
+
+    # Remove the previous debuglink if it has existed, because it has a different file name with that we will add.
+    if d.getVar('PN').find("jre") != -1:
+        file = dvar + d.getVar("JRE_HOME") + "/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
+    else:
+        file = dvar + d.getVar("JDK_HOME") + "/jre/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
+
+    cmd = "'%s' --remove-section .gnu_debuglink '%s'" % (objcopy, file)
+    oe.utils.getstatusoutput(cmd)
+}
+
+PACKAGE_PREPROCESS_FUNCS += "remove_debuglink"
+
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${PN} = "dev-so"
diff --git a/recipes-core/openjdk/openjdk-12-native.inc b/recipes-core/openjdk/openjdk-12-native.inc
new file mode 100644
index 0000000..2f7aa5a
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-native.inc
@@ -0,0 +1,86 @@
+JDK_DIR = "openjdk-12-native"
+DEPENDS += "\
+    openjdk-11-native ant-native \
+    libxslt-native attr-native \
+    glib-2.0-native freetype-native fontconfig-native \
+    zip-native unzip-native make-native \
+    ca-certificates-native openssl-native coreutils-native \
+"
+
+PACKAGECONFIG ??= "gif jpeg png zlib"
+PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
+PACKAGECONFIG[cups] = "--with-cups,,cups"
+PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
+PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
+PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
+PACKAGECONFIG[jpeg] = "--with-libjpeg=system,--with-libjpeg=bundled,jpeg-native"
+PACKAGECONFIG[png] = "--with-libpng=system,--with-libpng=bundled,libpng-native"
+PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib-native"
+
+EXTRA_OECONF_append = "\
+    --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
+    --with-tools-dir=${STAGING_DIR_NATIVE} \
+    --with-extra-cflags='${CFLAGS}' \
+    --with-extra-cxxflags='${CXXFLAGS}' \
+    --with-extra-ldflags='${LDFLAGS}' \
+    --with-stdc++lib=dynamic \
+    ${@jdk_configure_options(d)} \
+"
+
+inherit native
+
+require openjdk-12-common.inc
+
+CFLAGS_append = " ${@jdk_cpp_options(d)} -Wno-error=class-memaccess \
+                    -Wno-error=cast-function-type \
+                    -Wno-error=format-truncation \
+                    -Wno-error=implicit-function-declaration \
+                    -Wno-error=int-conversion \
+                    -Wno-error=return-type"
+
+CPPFLAGS_append = "${@jdk_cpp_options(d)} -Wno-error=class-memaccess \
+                    -Wno-error=cast-function-type \
+                    -Wno-error=format-truncation \
+                    -Wno-error=implicit-function-declaration \
+                    -Wno-error=int-conversion \
+                    -Wno-error=return-type"
+
+CXXFLAGS_append = " ${@jdk_cpp_options(d)}"
+
+export MAKE_VERBOSE = "y"
+export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace"
+
+EXTRA_OEMAKE_append = ' \
+    ${@jdk_make_options(d)} \
+    MAKE_VERBOSE=y LOG_LEVEL=trace \
+    QUIETLY= \
+    images \
+'
+
+do_compile_append() {
+    set -x
+    mkdir -p ${B}/certs
+    for pem in $(find ${STAGING_DATADIR}/ca-certificates -name "*.crt")
+    do
+        bp=`basename ${pem}`
+        alias=`echo ${bp} | sed -e 's,\.[^.]*$,,'`
+        md5a=`echo ${alias} | md5sum | awk '{print $1}'`
+        der=`echo ${bp} | sed -e 's,crt$,der,'`
+        openssl x509 -in "${pem}" -inform pem -out "${B}/certs/${md5a}.der" -outform der
+        ${B}/images/jdk/bin/keytool -importcert -noprompt -storepass changeit \
+            -keystore "${B}/images/jdk/lib/security/cacerts" \
+            -alias "${alias}" -file "${B}/certs/${md5a}.der"
+    done
+    set +x
+}
+
+do_install() {
+    mkdir -p ${D}${libdir_jvm}/${JDK_DIR}
+    cp -rp ${B}/images/jdk/* ${D}${libdir_jvm}/${JDK_DIR}
+
+    mkdir -p ${D}${bindir}
+    for tool in keytool pack200 unpack200
+    do
+        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}${bindir}/$tool
+    done
+}
diff --git a/recipes-core/openjdk/openjdk-12-native_2+10.bb b/recipes-core/openjdk/openjdk-12-native_2+10.bb
new file mode 100644
index 0000000..409e7e2
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-native_2+10.bb
@@ -0,0 +1,2 @@
+require openjdk-12-release-${PV}.inc
+require openjdk-12-native.inc
diff --git a/recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc b/recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
new file mode 100644
index 0000000..0a5d2ea
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
@@ -0,0 +1,15 @@
+require openjdk-12-release-2+10-common.inc
+
+COMPATIBLE_HOST = "^$"
+COMPATIBLE_HOST_armv7a = "arm"
+COMPATIBLE_HOST_armv7ve = "arm"
+
+OPENJDK_CHANGESET = "7b6accc7c009"
+SRC_URI[openjdk.md5sum] = "b809f90bb002472b1ad211586f0110ea"
+SRC_URI[openjdk.sha256sum] = "85d7c8c0938baf05cb214ffa65d18d07027379836c221a863d84fce03801ca9b"
+
+PACKAGECONFIG_append_armv7a = " client"
+PACKAGECONFIG_append_armv7ve = " client"
+
+JDK_ARCH_armv7a = "aarch32"
+JDK_ARCH_armv7ve = "aarch32"
diff --git a/recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc b/recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
new file mode 100644
index 0000000..48f6434
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
@@ -0,0 +1,12 @@
+require openjdk-12-release-2+10-common.inc
+
+# We do not yet work for aarch64, and we make sure
+# to use the aarch32 port for ARMv7.
+COMPATIBLE_HOST = "^(?!(aarch64)).*$"
+COMPATIBLE_HOST_armv7a = "^$"
+COMPATIBLE_HOST_armv7ve = "^$"
+COMPATIBLE_HOST = "aarch64"
+
+OPENJDK_CHANGESET = "7b6accc7c009"
+SRC_URI[openjdk.md5sum] = "b809f90bb002472b1ad211586f0110ea"
+SRC_URI[openjdk.sha256sum] = "85d7c8c0938baf05cb214ffa65d18d07027379836c221a863d84fce03801ca9b"
diff --git a/recipes-core/openjdk/openjdk-12-release-2+10-common.inc b/recipes-core/openjdk/openjdk-12-release-2+10-common.inc
new file mode 100644
index 0000000..6152687
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-release-2+10-common.inc
@@ -0,0 +1,35 @@
+PATCHES_URI = "\
+    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
+    file://filter-aclocal-copy-too.patch;striplevel=0 \
+    file://openjdk12-find-compiler-fix-env-respect.patch;striplevel=0 \
+    file://0001-fix-stringop-truncate-gcc8.patch;striplevel=0 \
+    file://0002-fix-stringop-truncate-gcc8.patch;striplevel=0 \
+"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+# WORKAROUND: disable the "specified bound depends on the length of the source argument"
+# compiler error on gcc8
+BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
+TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
+
+# Enable zero mode for arm based builds, as normal hotspot fails to build
+PACKAGECONFIG_append_armv4 = " zero"
+PACKAGECONFIG_append_armv5 = " zero"
+PACKAGECONFIG_append_armv6 = " zero"
+
+OPENJDK_ARCH_PORT = "jdk-updates"
+OPENJDK_ARCH_PORT_aarch64 = "aarch64-port"
+OPENJDK_ARCH_PORT_armv7a = "aarch32-port"
+OPENJDK_ARCH_PORT_armv7ve = "aarch32-port"
+OPENJDK_HG_U = "jdk12u"
+OPENJDK_HG_URL = "http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_FILE_LOCAL = "openjdk12-${PV}-jdk12u-${OPENJDK_FILE}"
+OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};downloadfilename=${OPENJDK_FILE_LOCAL};name=openjdk"
diff --git a/recipes-core/openjdk/openjdk-12-release-2+10.inc b/recipes-core/openjdk/openjdk-12-release-2+10.inc
new file mode 100644
index 0000000..1e28d7b
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12-release-2+10.inc
@@ -0,0 +1,11 @@
+require openjdk-12-release-2+10-common.inc
+
+# We do not yet work for aarch64, and we make sure
+# to use the aarch32 port for ARMv7.
+COMPATIBLE_HOST = "^(?!(aarch64)).*$"
+COMPATIBLE_HOST_armv7a = "^$"
+COMPATIBLE_HOST_armv7ve = "^$"
+
+OPENJDK_CHANGESET = "7b6accc7c009"
+SRC_URI[openjdk.md5sum] = "b809f90bb002472b1ad211586f0110ea"
+SRC_URI[openjdk.sha256sum] = "85d7c8c0938baf05cb214ffa65d18d07027379836c221a863d84fce03801ca9b"
diff --git a/recipes-core/openjdk/openjdk-12_2+10.bb b/recipes-core/openjdk/openjdk-12_2+10.bb
new file mode 100644
index 0000000..2fbbfba
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-12_2+10.bb
@@ -0,0 +1,57 @@
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+INC_FILE_SUFFIX_armv7a = "-aarch32"
+INC_FILE_SUFFIX_armv7ve = "-aarch32"
+require openjdk-12-release-${PV}${INC_FILE_SUFFIX}.inc
+require openjdk-12-cross.inc
+
+do_install() {
+    rm -rf ${D}${JDK_HOME}
+    mkdir -p ${D}${JDK_HOME}
+    cp -rp ${B}/images/jdk/* ${D}${JDK_HOME}
+    install -d ${D}${JDK_HOME}/lib/${JDK_ARCH}/
+    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/lib/${JDK_ARCH}/
+    chown -R root:root ${D}${JDK_HOME}
+    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+PACKAGES_append = " \
+    ${PN}-demo \
+    ${PN}-source \
+"
+
+FILES_${PN}_append = "\
+    ${JDK_HOME}/bin/[a-z]* \
+    ${JDK_HOME}/lib/[a-z]* \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/release \
+    ${JDK_HOME}/conf/[a-z]* \
+    ${JDK_HOME}/jmods/[a-z]* \
+    ${JDK_HOME}/legal/[a-z]* \
+"
+
+FILES_${PN}-dev_append = "\
+    ${JDK_HOME}/include \
+"
+
+FILES_${PN}-demo = " ${JDK_HOME}/demo "
+RDEPENDS_${PN}-demo = " ${PN} "
+
+FILES_${PN}-doc_append = "\
+    ${JDK_HOME}/man \
+"
+
+FILES_${PN}-source = " ${JDK_HOME}/src.zip "
+
+RPROVIDES_${PN} = "java2-runtime"
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
diff --git a/recipes-core/openjdk/openjre-12_2+10.bb b/recipes-core/openjdk/openjre-12_2+10.bb
new file mode 100644
index 0000000..043d91d
--- /dev/null
+++ b/recipes-core/openjdk/openjre-12_2+10.bb
@@ -0,0 +1,54 @@
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+INC_FILE_SUFFIX_armv7a = "-aarch32"
+INC_FILE_SUFFIX_armv7ve = "-aarch32"
+require openjdk-12-release-${PV}${INC_FILE_SUFFIX}.inc
+require openjdk-12-cross.inc
+
+do_install() {
+    rm -rf ${D}${JRE_HOME}
+    mkdir -p ${D}${JRE_HOME}
+    cp -rp ${B}/images/jdk/* ${D}${JRE_HOME}
+    install -d ${D}${JRE_HOME}/lib/${JDK_ARCH}
+    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
+    chown -R root:root ${D}${JRE_HOME}
+    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+PACKAGES_append = " \
+    ${PN}-demo \
+    ${PN}-source \
+"
+
+FILES_${PN}_append = "\
+    ${JRE_HOME}/bin/[a-z]* \
+    ${JRE_HOME}/lib/[a-z]* \
+    ${JRE_HOME}/release \
+    ${JRE_HOME}/conf/[a-z]* \
+    ${JRE_HOME}/jmods/[a-z]* \
+    ${JRE_HOME}/legal/[a-z]* \
+"
+
+FILES_${PN}-dbg_append = "\
+    ${JRE_HOME}/include \
+"
+
+FILES_${PN}-demo = "\
+     ${JRE_HOME}/demo \
+"
+
+RDEPENDS_${PN}-demo = " ${PN} "
+
+FILES_${PN}-doc_append = "\
+    ${JRE_HOME}/man \
+"
+
+
+RPROVIDES_${PN} = "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "java"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
+ALTERNATIVE_PRIORITY[java] = "100"
diff --git a/recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch b/recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
new file mode 100644
index 0000000..899c7fe
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
@@ -0,0 +1,11 @@
+--- src/hotspot/share/runtime/arguments.cpp.orig	2019-12-19 11:31:59.082659135 +0800
++++ src/hotspot/share/runtime/arguments.cpp	2019-12-19 11:32:13.726659194 +0800
+@@ -2469,7 +2469,7 @@
+       if(tail != NULL) {
+         const char* pos = strchr(tail, '=');
+         size_t len = (pos == NULL) ? strlen(tail) : pos - tail;
+-        char* name = strncpy(NEW_C_HEAP_ARRAY(char, len + 1, mtArguments), tail, len);
++        char* name = strncpy(NEW_C_HEAP_ARRAY(char, len + 1, mtArguments), tail, len + 1);
+         name[len] = '\0';
+ 
+         char *options = NULL;
diff --git a/recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch b/recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
new file mode 100644
index 0000000..3b013e1
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
@@ -0,0 +1,38 @@
+--- src/java.base/share/native/libjimage/imageFile.cpp.orig	2019-12-19 13:28:23.062686922 +0800
++++ src/java.base/share/native/libjimage/imageFile.cpp	2019-12-19 13:59:51.414694434 +0800
+@@ -494,7 +494,7 @@
+     // If module string is not empty string.
+     if (*module != '\0') {
+         // Get length of module name.
+-        length = strlen(module);
++        length = strlen(module) + 1;
+         // Make sure there is no buffer overflow.
+         assert(next - path + length + 2 < max && "buffer overflow");
+         // Append '/module/'.
+@@ -507,7 +507,7 @@
+     // If parent string is not empty string.
+     if (*parent != '\0') {
+         // Get length of module string.
+-        length = strlen(parent);
++        length = strlen(parent) + 1;
+         // Make sure there is no buffer overflow.
+         assert(next - path + length + 1 < max && "buffer overflow");
+         // Append 'patent/' .
+@@ -517,7 +517,7 @@
+     // Get base name string.
+     const char* base = location.get_attribute(ImageLocation::ATTRIBUTE_BASE, strings);
+     // Get length of base name.
+-    length = strlen(base);
++    length = strlen(base) + 1;
+     // Make sure there is no buffer overflow.
+     assert(next - path + length < max && "buffer overflow");
+     // Append base name.
+@@ -527,7 +527,7 @@
+     // If extension string is not empty string.
+     if (*extension != '\0') {
+         // Get length of extension string.
+-        length = strlen(extension);
++        length = strlen(extension) + 1;
+         // Make sure there is no buffer overflow.
+         assert(next - path + length + 1 < max && "buffer overflow");
+         // Append '.extension' .
diff --git a/recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch b/recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
new file mode 100644
index 0000000..1458e05
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
@@ -0,0 +1,10 @@
+--- make/autoconf/basics.m4.orig
++++ make/autoconf/basics.m4
+@@ -909,6 +909,7 @@
+               -e 's/configure.log//g' \
+               -e 's/confdefs.h//g' \
+               -e 's/configure-support//g' \
++              -e 's,aclocal-copy,,g' \
+               -e 's/ //g' \
+           | $TR -d '\n'`
+       if test "x$filtered_files" != x; then
diff --git a/recipes-core/openjdk/patches-openjdk-12/jvm.cfg b/recipes-core/openjdk/patches-openjdk-12/jvm.cfg
new file mode 100644
index 0000000..af879e6
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/jvm.cfg
@@ -0,0 +1,41 @@
+# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+#
+# This code is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License version 2 only, as
+# published by the Free Software Foundation.  Sun designates this
+# particular file as subject to the "Classpath" exception as provided
+# by Sun in the LICENSE file that accompanied this code.
+#
+# This code is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License version
+# 2 along with this work; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+# CA 95054 USA or visit www.sun.com if you need additional information or
+# have any questions.
+#
+#
+# List of JVMs that can be used as an option to java, javac, etc.
+# Order is important -- first in this list is the default JVM.
+# NOTE that this both this file and its format are UNSUPPORTED and
+# WILL GO AWAY in a future release.
+#
+# You may also select a JVM in an arbitrary location with the
+# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
+# and may not be available in a future release.
+#
+-server KNOWN
+-client IGNORE
+-hotspot ALIASED_TO -client
+-classic WARN
+-native ERROR
+-green ERROR
+-zero ALIASED_TO -server
+-shark ERROR
diff --git a/recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch b/recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
new file mode 100644
index 0000000..e12973e
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
@@ -0,0 +1,11 @@
+--- make/autoconf/toolchain.m4.orig	2019-12-09 12:02:00.527228822 +0800
++++ make/autoconf/toolchain.m4	2019-12-09 14:33:50.463265067 +0800
+@@ -506,7 +506,7 @@
+   if test "x[$]$1" != x; then
+     # User has supplied compiler name already, always let that override.
+     AC_MSG_NOTICE([Will use user supplied compiler $1=[$]$1])
+-    if test "x`basename [$]$1`" = "x[$]$1"; then
++    if test "x`basename [$]$1`" != "x[$]$1"; then
+       # A command without a complete path is provided, search $PATH.
+ 
+       AC_PATH_PROGS(POTENTIAL_$1, [$]$1)
diff --git a/recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch b/recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
new file mode 100644
index 0000000..7438d9d
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
@@ -0,0 +1,28 @@
+--- make/autoconf/basics.m4.orig
++++ make/autoconf/basics.m4
+@@ -937,18 +937,20 @@
+   AC_SUBST(OUTPUTDIR)
+   AC_SUBST(CONFIGURESUPPORT_OUTPUTDIR)
+ 
++  # Most of the probed defines are put into config.h
++  AC_CONFIG_HEADERS([config.h:config.h.in])
+   # The spec.gmk file contains all variables for the make system.
+-  AC_CONFIG_FILES([$OUTPUTDIR/spec.gmk:$AUTOCONF_DIR/spec.gmk.in])
++  AC_CONFIG_FILES([spec.gmk:spec.gmk.in])
+   # The bootcycle-spec.gmk file contains support for boot cycle builds.
+-  AC_CONFIG_FILES([$OUTPUTDIR/bootcycle-spec.gmk:$AUTOCONF_DIR/bootcycle-spec.gmk.in])
++  AC_CONFIG_FILES([bootcycle-spec.gmk:bootcycle-spec.gmk.in])
+   # The buildjdk-spec.gmk file contains support for building a buildjdk when cross compiling.
+-  AC_CONFIG_FILES([$OUTPUTDIR/buildjdk-spec.gmk:$AUTOCONF_DIR/buildjdk-spec.gmk.in])
++  AC_CONFIG_FILES([buildjdk-spec.gmk:buildjdk-spec.gmk.in])
+   # The compare.sh is used to compare the build output to other builds.
+-  AC_CONFIG_FILES([$OUTPUTDIR/compare.sh:$AUTOCONF_DIR/compare.sh.in])
++  AC_CONFIG_FILES([compare.sh:compare.sh.in])
+   # The generated Makefile knows where the spec.gmk is and where the source is.
+   # You can run make from the OUTPUTDIR, or from the top-level Makefile
+   # which will look for generated configurations
+-  AC_CONFIG_FILES([$OUTPUTDIR/Makefile:$AUTOCONF_DIR/Makefile.in])
++  AC_CONFIG_FILES([Makefile:Makefile.in])
+ ])
+ 
+ #%%% Simple tools %%%
diff --git a/recipes-images/images/openjdk-12-test-image.bb b/recipes-images/images/openjdk-12-test-image.bb
new file mode 100644
index 0000000..b43bf5f
--- /dev/null
+++ b/recipes-images/images/openjdk-12-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjdk-12 "
+
+inherit openjdk-test-image
diff --git a/recipes-images/images/openjre-12-test-image.bb b/recipes-images/images/openjre-12-test-image.bb
new file mode 100644
index 0000000..5c5fc98
--- /dev/null
+++ b/recipes-images/images/openjre-12-test-image.bb
@@ -0,0 +1,3 @@
+IMAGE_INSTALL_append = " openjre-12 "
+
+inherit openjre-test-image
-- 
2.19.1


