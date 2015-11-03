Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EAB2660125
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 09:36:24 +0000 (UTC)
Received: by wmll128 with SMTP id l128so81707478wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 01:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=Ydk+qg/imnk1Emxo1Yjmmu+8OkjnBxZqN/5UjBm+B4U=;
	b=YCgkzVGeU3ZJ32cgV7QVSePwL9Qu2iT0MvfZqGL6Sz6I9k2pYdz9iabUTE3zEwmVWG
	Vk/1Ze1BVWiQ9gKlW98YpJHLRRSeUP1amiV0ygvqO5fnCZvCVNLCsm9Z9bUkW2dO71r9
	Z0W+vB5/yPIs9upmJks7l049RTcdXAbEMqP35PiD4+go00Zx67NxrYgwikAtK0HZ5EcH
	BikGlccLtm0oW3Fzr/E2/TnfGIsoe6TVBfn2Q/QYshwxbHLrXK4dJ0iw6AS02wvAYnjo
	EAsfGz9vC5Wq4HeuBF90JGJeS63kNrtIvpE4WoY/Q0dt9SN9j6U+hOys0cO4sY3a4cuY
	ENZQ==
X-Received: by 10.28.88.143 with SMTP id m137mr17692377wmb.13.1446543383933;
	Tue, 03 Nov 2015 01:36:23 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pc2sm5036428wjb.11.2015.11.03.01.36.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 01:36:22 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
Date: Tue, 3 Nov 2015 10:36:20 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 09:36:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


This adds openjdk-8 for native and target builds and allows a stripped
openjre-8 being built as well instead of trying to cherry-pick jre
components from jdk-image.

The recipes allow building openjdk-8 with or without:
* x11
* cups
* alsa/pulseaudio
and let packager enable unlimited-crypto, if desired.

Since there can be only one PROVIDES for virtual/java-native and =
virtual/javac-native,
move the provides to openjdk-8-native (I think everyone agrees it's a =
better
choice than ecj-bootstrap-native).

Plus: Applying a fix from openjdk-9 repository which fixes build issues =
using gcc5

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 README                                             |   13 +-
 recipes-core/cacao/cacao_1.6.1.bb                  |    2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb           |    2 -
 recipes-core/openjdk/openjdk-8-common.inc          |  231 ++
 recipes-core/openjdk/openjdk-8-cross.inc           |  199 ++
 recipes-core/openjdk/openjdk-8-native.inc          |   63 +
 recipes-core/openjdk/openjdk-8-native_72b05.bb     |   16 +
 recipes-core/openjdk/openjdk-8-release-72b05.inc   |   87 +
 recipes-core/openjdk/openjdk-8_72b05.bb            |   36 +
 recipes-core/openjdk/openjre-8_72b05.bb            |   30 +
 recipes-core/openjdk/patches-openjdk-8/LICENSE     |  347 +++
 .../dont-expect-fqpn-for-make.patch                |   18 +
 .../filter-aclocal-copy-too.patch                  |   11 +
 recipes-core/openjdk/patches-openjdk-8/jvm.cfg     |   41 +
 .../openjdk8-find-compiler-fix-env-respect.patch   |  140 +
 .../openjdk8-fix-shark-build.patch                 |  453 ++++
 .../openjdk8-fix-shark-stdc++11.patch              | 2730 =
++++++++++++++++++++
 .../openjdk8-no-genx11-in-headless.patch           |   17 +
 .../openjdk8-no-unused-deps.patch                  |   94 +
 ...o-in-favour-of-openembedded-package-split.patch |  120 +
 .../openjdk8-restrict-to-staging-dir.patch         |   11 +
 ..._than_returning_address_of_local_variable.patch |   23 +
 .../remove-shell-variables-from-autoheader.patch   |   31 +
 23 files changed, 4703 insertions(+), 12 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-cross.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-native.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-native_72b05.bb
 create mode 100644 recipes-core/openjdk/openjdk-8-release-72b05.inc
 create mode 100644 recipes-core/openjdk/openjdk-8_72b05.bb
 create mode 100644 recipes-core/openjdk/openjre-8_72b05.bb
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/LICENSE
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/jvm.cfg
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-resp=
ect.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patc=
h
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-favou=
r-of-openembedded-package-split.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.pa=
tch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/openjdk8-use_builtin_frame_address_=
0_rather_than_returning_address_of_local_variable.patch
 create mode 100644 =
recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autohea=
der.patch

diff --git a/README b/README
index 3b95c13..7658c23 100644
--- a/README
+++ b/README
@@ -52,15 +52,10 @@ Main layer maintainers:
 Usage instructions
 ------------------
=20
-You should define at least the following variables in a distro include =
file or local.conf
+Since there is a clear bootstrap of the individual java-recipes, there =
is
+nothing to configure in conf/local.conf nor your individual =
distro/$name.conf.
=20
-PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"
-
-PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
-PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
-
-#Sometimes the following is needed:
-PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
+Simply rely on openjdk-7-jre, openjdk-7, openjdk-8 or openjre-8.
=20
 For conf/bblayers.conf you have to add
=20
@@ -70,7 +65,7 @@ BBLAYERS ?=3D " \
   path_to_source/sources/meta-java \
   "
=20
-Please note that libstdc++ static is needed on your host to compile =
icedtea6/7-native
+Please note that libstdc++ static is needed on your host to compile =
icedtea7-native
 (install libstdc++-static on a Fedora).
=20
 For debian-based distributions you need the =
libstdc++6-$compilerversion-dev package.
diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index ae06b50..c97ab09 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
 SECTION  =3D "interpreters"
=20
 DEPENDS_class-native =3D "zlib-native libtool-native ecj-initial-native =
fastjar-native classpath-native bdwgc-native"
-PROVIDES_class-native =3D "virtual/java-native"
+#PROVIDES_class-native =3D "virtual/java-native"
=20
 DEPENDS_class-target =3D " virtual/javac-native "
=20
diff --git a/recipes-core/ecj/ecj-bootstrap-native.bb =
b/recipes-core/ecj/ecj-bootstrap-native.bb
index a4a1c17..28414c2 100644
--- a/recipes-core/ecj/ecj-bootstrap-native.bb
+++ b/recipes-core/ecj/ecj-bootstrap-native.bb
@@ -14,8 +14,6 @@ PR =3D "r1"
=20
 DEPENDS =3D "libecj-bootstrap-native cacao-native"
=20
-PROVIDES =3D "virtual/javac-native"
-
 SRC_URI =3D "file://ecj.in"
=20
 S =3D "${WORKDIR}"
diff --git a/recipes-core/openjdk/openjdk-8-common.inc =
b/recipes-core/openjdk/openjdk-8-common.inc
new file mode 100644
index 0000000..ad35488
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -0,0 +1,231 @@
+DESCRIPTION =3D "Java runtime based upon the OpenJDK Project"
+HOMEPAGE =3D "http://http://openjdk.java.net/"
+LICENSE  =3D "GPL-2.0-with-classpath-exception"
+
+LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D7b4baeedfe2d40cb03536573bc2c89b1"
+
+inherit java autotools gettext qemu pkgconfig
+
+AUTOTOOLS_SCRIPT_PATH =3D "${S}/common/autoconf/"
+export AUTOCONF_DIR=3D"${AUTOTOOLS_SCRIPT_PATH}"
+
+FILESPATH =3D. "${FILE_DIRNAME}/patches-openjdk-8:"
+
+# for weird openjdk-common.inc
+S =3D "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
+
+SRC_URI =3D " \
+    ${OPENJDK_URI} \
+    ${HOTSPOT_URI} \
+    ${CORBA_URI} \
+    ${JAXP_URI} \
+    ${JAXWS_URI} \
+    ${JDK_URI} \
+    ${LANGTOOLS_URI} \
+    ${NASHORN_URI} \
+    file://LICENSE \
+    ${PATCHES_URI} \
+"
+
+do_unpack_extract_submodules () {
+    cd "${S}"
+    # tar --transform
+    tar xjf ${WORKDIR}/${CORBA_FILE} --transform =
"s,-${CORBA_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${HOTSPOT_FILE} --transform =
"s,-${HOTSPOT_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JAXP_FILE} --transform =
"s,-${JAXP_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JAXWS_FILE} --transform =
"s,-${JAXWS_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JDK_FILE} --transform "s,-${JDK_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${LANGTOOLS_FILE} --transform =
"s,-${LANGTOOLS_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${NASHORN_FILE} --transform =
"s,-${NASHORN_CHANGESET},,g"
+}
+
+def package_config_option_cleanup(d):
+    distro_x11 =3D bb.utils.contains('DISTRO_FEATURES', 'x11', True, =
False, d)
+    distro_alsa =3D bb.utils.contains('DISTRO_FEATURES', 'alsa', True, =
False, d)
+    distro_pulseaudio =3D bb.utils.contains('DISTRO_FEATURES', =
'pulseaudio', True, False, d)
+
+    with_x11 =3D bb.utils.contains('PACKAGECONFIG', 'x11', True, False, =
d)
+    with_cups =3D bb.utils.contains('PACKAGECONFIG', 'cups', True, =
False, d)
+    with_alsa =3D bb.utils.contains('PACKAGECONFIG', 'alsa', True, =
False, d)
+    with_pulseaudio =3D bb.utils.contains('PACKAGECONFIG', =
'pulseaudio', True, False, d)
+
+    option_headless =3D bb.utils.contains('PACKAGECONFIG', 'headless', =
True, False, d)
+    option_headful =3D bb.utils.contains('PACKAGECONFIG', 'headful', =
True, False, d)
+    option_soundless =3D bb.utils.contains('PACKAGECONFIG', =
'soundless', True, False, d)
+
+    if option_headless and option_headful:
+        option_headless =3D False
+
+    if option_headful and not with_x11:
+        with_x11 =3D True
+
+    if option_headful and not with_cups:
+        with_cups =3D True
+
+    if option_soundless and with_alsa:
+        with_alsa =3D False
+
+    if option_soundless and with_pulseaudio:
+        with_pulseaudio =3D False
+
+    if with_x11 and not distro_x11:
+        with_x11 =3D False
+
+    if with_alsa and not distro_alsa:
+        with_alsa =3D False
+
+    if with_pulseaudio and not distro_pulseaudio:
+        with_pulseaudio =3D False
+
+    if option_headful and not with_x11:
+        option_headful =3D False
+
+    if option_headful and not with_cups:
+        option_headful =3D False
+
+    if not option_headless and not with_x11:
+        option_headless =3D True
+
+    if not option_headless and not with_cups:
+        option_headless =3D True
+
+    if not option_soundless and not with_alsa:
+        option_soundless =3D True
+
+    if not option_soundless and not with_pulseaudio:
+        option_soundless =3D True
+
+    options =3D {'make': [], 'cpp': [], 'env': [], 'configure': =
["--disable-ccache"] }
+
+    if option_headful:
+        options['configure'].append("--enable-headful")
+
+    if option_headless:
+        options['configure'].append("--disable-headful")
+        options['make'].append("BUILD_HEADLESS_ONLY=3D1")
+        options['make'].append("BUILD_HEADLESS=3Dtrue")
+        options['cpp'].append("-DHEADLESS=3Dtrue")
+
+    if option_soundless:
+        options['make'].append("BUILD_SOUNDLESS_ONLY=3D1")
+
+    if not with_x11:
+        options['make'].append("X11_NOT_NEEDED=3D1")
+        options['env'].append("X11_NOT_NEEDED=3Dyes")
+
+    if not with_cups:
+        options['make'].append("CUPS_NOT_NEEDED=3D1")
+        options['env'].append("CUPS_NOT_NEEDED=3Dyes")
+
+    if not with_alsa:
+        options['make'].append("ALSA_NOT_NEEDED=3D1")
+        options['env'].append("ALSA_NOT_NEEDED=3Dyes")
+
+    if not with_pulseaudio:
+        options['make'].append("PULSE_NOT_NEEDED=3D1")
+        options['env'].append("PULSE_NOT_NEEDED=3Dyes")
+
+    options =3D [ ' '.join(options['make']), ' '.join(options['cpp']), =
' '.join(options['env']), ' '.join(options['configure']) ]
+
+    return options
+
+def jdk_make_options(d):
+    options =3D package_config_option_cleanup(d)
+    return options[0]
+
+def jdk_cpp_options(d):
+    options =3D package_config_option_cleanup(d)
+    if not options[1]:
+        return ""
+
+    return " " + options[1]
+
+def jdk_environment_options(d):
+    options =3D package_config_option_cleanup(d)
+    return options[2]
+
+def jdk_configure_options(d):
+    options =3D package_config_option_cleanup(d)
+    return options[3]
+
+do_unpack[postfuncs] +=3D "do_unpack_extract_submodules"
+
+POST_CONFIGURE_CLEAN_X11 =3D "${@base_contains('PACKAGECONFIG', 'x11', =
'', 'rm -f jdk/src/solaris/classes/sun/awt/X11/*.java', d)}"
+
+do_patch_openjdk8() {
+        olddir=3D`pwd`
+        cd "${S}"
+        ${POST_CONFIGURE_CLEAN_X11}
+        for OJ8P in ${WORKDIR}/openjdk8-*.patch; do
+                patch -p0 < ${OJ8P}
+        done
+}
+
+do_patch[postfuncs] +=3D "do_patch_openjdk8"
+
+do_configure_prepend() {
+        export ${@jdk_environment_options(d)}
+}
+
+# OpenJDK supports parallel compilation but uses a plain number for =
this.
+# In OE we have PARALLEL_MAKE which is the actual option passed to =
make,
+# e.g. "-j 4".
+OPENJDK8_PARALLEL_MAKE :=3D "${PARALLEL_MAKE}"
+PARALLEL_MAKE =3D ""
+def get_jdk8_native_jobs(d):
+    import bb
+
+    pm =3D bb.data.getVar('OPENJDK8_PARALLEL_MAKE', d, 1);
+    if not pm:
+        return "1"
+
+    pm =3D pm.split("j");
+    if (len(pm) =3D=3D 2):
+        return pm[1].strip()
+
+    # Whatever found in PARALLEL_MAKE was not suitable.
+    return "1"
+
+# A function that is needed in the Shark builds.
+def get_llvm_configure_arch(d):
+    import bb;
+
+    arch =3D bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    if arch =3D=3D "x86-64" or arch =3D=3D "i486" or arch =3D=3D "i586" =
or arch =3D=3D "i686":
+        arch =3D "x86"
+    elif arch =3D=3D "arm":
+        arch =3D "arm"
+    elif arch =3D=3D "mipsel" or arch =3D=3D "mips":
+        arch =3D "mips"
+    elif arch =3D=3D "powerpc" or arch =3D=3D "powerpc64":
+        arch =3D "powerpc"
+    else:
+        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, =
1), arch) );
+
+    return arch
+
+# Provides the target architecture to the configure script.
+export LLVM_CONFIGURE_ARCH=3D"${@get_llvm_configure_arch(d)}"
+
+# OpenJDK uses slightly different names for certain arches. We need to =
know
+# this to create some files which are expected by the build.
+def get_jdk_arch(d):
+    import bb
+
+    jdk_arch =3D bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    if jdk_arch =3D=3D "x86-64":
+        jdk_arch =3D "amd64"
+    elif jdk_arch =3D=3D "powerpc":
+        jdk_arch =3D "ppc"
+    elif jdk_arch =3D=3D "powerpc64":
+        jdk_arch =3D "ppc64"
+    elif (jdk_arch =3D=3D "i486" or jdk_arch =3D=3D "i586" or jdk_arch =
=3D=3D "i686"):
+        jdk_arch =3D "i386"
+
+    return jdk_arch
+
+JDK_ARCH =3D "${@get_jdk_arch(d)}"
+
+export DEBUG_BINARIES =3D "true"
+
+ALTERNATIVE_PRIORITY =3D "50"
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc =
b/recipes-core/openjdk/openjdk-8-cross.inc
new file mode 100644
index 0000000..5c2aa09
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -0,0 +1,199 @@
+JDKPN =3D "openjdk-8"
+JREPN =3D "openjre-8"
+
+JDK_HOME =3D "${libdir_jvm}/${JDKPN}"
+JRE_HOME =3D "${libdir_jvm}/${JREPN}"
+
+DEPENDS =3D "\
+    openjdk-8-native zip-native ant-native libxslt \
+    jpeg libpng krb5 libffi fontconfig freetype \
+"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[x11] =3D "--with-x,,libx11 xproto libxt libxext =
libxrender"
+PACKAGECONFIG[cups] =3D "--with-cups,,cups"
+PACKAGECONFIG[alsa] =3D "--with-alsa,,alsa-lib-native"
+
+PACKAGECONFIG[jce] =3D "--enable-unlimited-crypto,,"
+
+PACKAGECONFIG[zip] =3D "--with-zlib=3Dsystem,--with-zlib=3Dbundled,zlib,"=

+PACKAGECONFIG[gif] =3D =
"--with-giflib=3Dsystem,--with-giflib=3Dbundled,giflib,"
+
+export WANT_LLVM_RELEASE =3D "3.5.2"
+PACKAGECONFIG[zero] =3D "--with-jvm-variants=3Dzero,,,"
+PACKAGECONFIG[shark] =3D "--with-jvm-variants=3Dzeroshark,,llvm3.5,"
+
+require openjdk-8-common.inc
+
+JAVA_HOME[unexport] =3D "1"
+
+SRC_URI_append =3D "\
+    file://jvm.cfg \
+"
+
+# do not use --wth-extra-cflags, it breaks building demos for jdk
+# maybe disabling demos is more reasonable than avoiding =
--wth-extra-cflags
+# needs discussion
+EXTRA_OECONF_append =3D "\
+    --with-jobs=3D${@get_jdk8_native_jobs(d)} \
+    \
+    --with-sys-root=3D${STAGING_DIR} \
+    --with-tools-dir=3D${STAGING_DIR_NATIVE} \
+    --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
+    \
+    --disable-precompiled-headers \
+    --disable-zip-debug-info \
+    \
+    ${@jdk_configure_options(d)} \
+"
+
+do_configure_append() {
+    sed -i -e 's,POST_STRIP_CMD:=3D.*,POST_STRIP_CMD:=3D,g' =
${B}/spec.gmk
+}
+
+export MAKE_VERBOSE =3D "y"
+export MFLAGS=3D"${@jdk_make_options(d)} MAKE_VERBOSE=3Dy QUIETLY=3D =
VERBOSE=3D-s LOG_LEVEL=3Dtrace STRIP_POLICY=3Dno_strip"
+
+BUILD_LD=3D"${BUILD_CCLD}"
+
+EXTRA_OEMAKE_append =3D '\
+    OE_CFLAGS=3D"${CFLAGS}" \
+    OE_CPPFLAGS=3D"${CPPFLAGS}" \
+    OE_CXXFLAGS=3D"${CXXFLAGS}" \
+    OE_LDFLAGS=3D"${LDFLAGS}" \
+    ${@jdk_make_options(d)} \
+    ALT_SDT_H=3D"${STAGING_INCDIR}" \
+    ALT_CUPS_HEADERS_PATH=3D"${STAGING_INCDIR}" \
+    ALT_FREETYPE_HEADERS_PATH=3D"${STAGING_INCDIR}/freetype2" \
+    ALT_FREETYPE_LIB_PATH=3D"${STAGING_LIBDIR}" \
+    STRIP_POLICY=3Dno_strip \
+    MAKE_VERBOSE=3Dy VERBOSE=3D-s LOG_LEVEL=3Dtrace \
+    QUIETLY=3D \
+    images \
+'
+
+FILES_${JREPN}_append =3D "\
+    ${JRE_HOME}/bin/[a-z]* \
+    ${JRE_HOME}/lib/[a-z]* \
+    ${JRE_HOME}/LICENSE \
+    ${JRE_HOME}/release \
+"
+
+FILES_${JDKPN}_append =3D "\
+    ${JDK_HOME}/bin/[a-z]* \
+    ${JDK_HOME}/lib/[a-z]* \
+    ${JDK_HOME}/jre/bin/[a-z]* \
+    ${JDK_HOME}/jre/lib/[a-z]* \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/jre/LICENSE \
+    ${JDK_HOME}/release \
+"
+
+FILES_${JDKPN}-dev_append =3D "\
+    ${JDK_HOME}/include \
+"
+
+FILES_${JDKPN}-dbg_append =3D "\
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
+FILES_${JREPN}-dbg_append =3D "\
+    ${JRE_HOME}/bin/.debug/ \
+    ${JRE_HOME}/lib/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
+"
+
+FILES_${JDKPN}-demo =3D " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS_${JDKPN}-demo =3D " ${JDKPN} "
+
+FILES_${JDKPN}-demo-dbg =3D "\
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
+FILES_${JDKPN}-doc_append =3D "\
+    ${JDK_HOME}/man \
+    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/THIRD_PARTY_README \
+    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/jre/THIRD_PARTY_README \
+"
+FILES_${JREPN}-doc_append =3D "\
+    ${JRE_HOME}/man \
+    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
+    ${JRE_HOME}/THIRD_PARTY_README \
+"
+
+FILES_${JDKPN}-source =3D " ${JDK_HOME}/src.zip "
+
+# Even though a vm is a hard dependency it is set as RRECOMMENDS so a =
single vm can get uninstalled:
+# root@beaglebone:~/java# opkg remove openjdk-7-vm-shark
+# No packages removed.
+# Collected errors:
+#  * print_dependents_warning: Package openjdk-7-vm-shark is depended =
upon by packages:
+#  * print_dependents_warning:         openjdk-7-java
+#  * print_dependents_warning: These might cease to work if package =
openjdk-7-vm-shark is removed.
+#RRECOMMENDS_${JDKPN}-java =3D "java2-vm"
+
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${JDKPN}-common =3D "dev-so"
+
+FILES_${JDKPN}-doc_append =3D "${JDK_HOME}/man"
+
+do_compile_append() {
+    find ${B}/images/j2sdk-image -name "*.jar" -print0 | \
+      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest
+    find ${B}/images/j2re-image -name "*.jar" -print0 | \
+      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest =
--strip-debug=20
+}
+
+do_install_jdk() {
+    rm -rf ${D}${JDK_HOME}
+        mkdir -p ${D}${JDK_HOME}
+    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
+    install -m644 ${WORKDIR}/jvm.cfg  =
${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+do_install_jre() {
+    rm -rf ${D}${JRE_HOME}
+        mkdir -p ${D}${JRE_HOME}
+    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
+    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_${JDKPN} =3D "java"
+ALTERNATIVE_TARGET_${JDKPN} =3D "${JDK_HOME}/bin/java"
+
+ALTERNATIVE_${JREPN} =3D "java"
+ALTERNATIVE_TARGET_${JREPN} =3D "${JRE_HOME}/bin/java"
+
+ALTERNATIVE_${JDKPN}-jdk =3D "javac"
+ALTERNATIVE_TARGET_${JDKPN}-jdk =3D "${JDK_HOME}/bin/javac"
+
+ALTERNATIVE_LINK_NAME[java] =3D "${bindir}/java"
+ALTERNATIVE_LINK_NAME[javac] =3D "${bindir}/javac"
diff --git a/recipes-core/openjdk/openjdk-8-native.inc =
b/recipes-core/openjdk/openjdk-8-native.inc
new file mode 100644
index 0000000..3611461
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -0,0 +1,63 @@
+JDK_DIR =3D "openjdk-8-native"
+DEPENDS =3D " \
+           icedtea7-native ant-native \
+           libxslt-native attr-native \
+           giflib-native jpeg-native libpng-native \
+           glib-2.0-native freetype-native fontconfig-native \
+           zlib-native zip-native \
+           unzip-native make-native \
+          "
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[x11] =3D "--with-x,,libx11-native xproto-native =
libxt-native libxext-native libxrender-native"
+PACKAGECONFIG[cups] =3D "--with-cups,,cups"
+PACKAGECONFIG[alsa] =3D "--with-alsa,,alsa-lib-native"
+PACKAGECONFIG[jce] =3D "--enable-unlimited-crypto,,"
+
+# do not use --wth-extra-cflags, it breaks building demos for jdk
+# maybe disabling demos is more reasonable than avoiding =
--wth-extra-cflags
+# needs discussion
+EXTRA_OECONF_append =3D "\
+    --with-jobs=3D${@get_jdk8_native_jobs(d)} \
+    \
+    --with-sys-root=3D${STAGING_DIR_NATIVE} \
+    --with-tools-dir=3D${STAGING_DIR_NATIVE} \
+    --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/icedtea7-native \
+    ${@jdk_configure_options(d)} \
+"
+# --with-boot-jdk=3D${WORKDIR}/fake-jdk
+
+inherit native
+
+require openjdk-8-common.inc
+
+CFLAGS_append =3D "${@jdk_cpp_options(d)}"
+CPPFLAGS_append =3D "${@jdk_cpp_options(d)}"
+CXXFLAGS_append =3D "${@jdk_cpp_options(d)}"
+
+export MAKE_VERBOSE =3D "y"
+export MFLAGS=3D"${@jdk_make_options(d)} MAKE_VERBOSE=3Dy QUIETLY=3D =
VERBOSE=3D-s LOG_LEVEL=3Dtrace"
+
+EXTRA_OEMAKE_append =3D ' \
+    OE_CFLAGS=3D"${CFLAGS}" \
+    OE_CPPFLAGS=3D"${CPPFLAGS}" \
+    OE_CXXFLAGS=3D"${CXXFLAGS}" \
+    OE_LDFLAGS=3D"${LDFLAGS}" \
+    ${@jdk_make_options(d)} \
+    MAKE_VERBOSE=3Dy VERBOSE=3D-s LOG_LEVEL=3Dtrace \
+    QUIETLY=3D \
+    images \
+'
+
+do_install() {
+    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
+        mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
+    cp -rp ${B}/images/j2sdk-image/* =
${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
+
+# clean up the mess from bootstrap
+    rm -f ${STAGING_BINDIR_NATIVE}/java
+    rm -f ${STAGING_BINDIR_NATIVE}/javac
+
+    ln -sf "../lib/jvm/${JDK_DIR}/bin/java" =
${STAGING_BINDIR_NATIVE}/java
+    ln -sf "../lib/jvm/${JDK_DIR}/bin/javac" =
${STAGING_BINDIR_NATIVE}/javac
+}
diff --git a/recipes-core/openjdk/openjdk-8-native_72b05.bb =
b/recipes-core/openjdk/openjdk-8-native_72b05.bb
new file mode 100644
index 0000000..9ed8243
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-native_72b05.bb
@@ -0,0 +1,16 @@
+require openjdk-8-release-72b05.inc
+require openjdk-8-native.inc
+
+PROVIDES =3D "virtual/java-native virtual/javac-native"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} =3D "java javac"
+ALTERNATIVE_LINK[java] =3D "${bindir}/java"
+ALTERNATIVE_TARGET[java] =3D "${JDK_HOME}/bin/java"
+ALTERNATIVE_PRIORITY[java] =3D "100"
+ALTERNATIVE_LINK[javac] =3D "${bindir}/javac"
+ALTERNATIVE_TARGET[javac] =3D "${JDK_HOME}/bin/javac"
+ALTERNATIVE_PRIORITY[javac] =3D "100"
+
+# PR =3D "${INC_PR}.1"
diff --git a/recipes-core/openjdk/openjdk-8-release-72b05.inc =
b/recipes-core/openjdk/openjdk-8-release-72b05.inc
new file mode 100644
index 0000000..4f9580e
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-72b05.inc
@@ -0,0 +1,87 @@
+PATCHES_URI=3D"\
+    file://remove-shell-variables-from-autoheader.patch;striplevel=3D0 =
\
+    file://filter-aclocal-copy-too.patch;striplevel=3D0 \
+    file://dont-expect-fqpn-for-make.patch;striplevel=3D0 \
+    file://openjdk8-no-genx11-in-headless.patch;apply=3Dno \
+    file://openjdk8-no-unused-deps.patch;apply=3Dno \
+    file://openjdk8-find-compiler-fix-env-respect.patch;apply=3Dno \
+    =
file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.=
patch;apply=3Dno \
+"
+
+# Name of the directory containing the compiled output
+BUILD_DIR =3D "openjdk.build"
+BUILD_DIR_ECJ =3D "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t =3D "ARM"
+
+CORBA_CHANGESET =3D "7deeb4f70404"
+SRC_URI[corba.md5sum] =3D "544b4963d14fb7155b12dbc56d058649"
+SRC_URI[corba.sha256sum] =3D =
"a75c31706f634585baf0d0a0b20e321ac634d41d6afb62bd6ffb1f9c0b766d09"
+
+HOTSPOT_CHANGESET =3D "d7b01fb81aa8"
+SRC_URI[hotspot.md5sum] =3D "9a94802c1179faedf06d65d2f6fcc6c7"
+SRC_URI[hotspot.sha256sum] =3D =
"5dacf0b9c86aa78061ca87c9ade1708b56deba35e2e559dcf9dbc50d85ba3ace"
+
+JAXP_CHANGESET =3D "acbcb6682c9b"
+SRC_URI[jaxp.md5sum] =3D "34b6700d03a0e2f13a272b4121536544"
+SRC_URI[jaxp.sha256sum] =3D =
"b6b60e174c3d980773dd56e0a2e7cacc26b05e401f6a08a1ffef594b6166865a"
+
+JAXWS_CHANGESET =3D "6aba0f814a15"
+SRC_URI[jaxws.md5sum] =3D "bad8a6e540dca0889d5c0edef47fe6ca"
+SRC_URI[jaxws.sha256sum] =3D =
"ae57bb090ec2c5338c6f740dbfd20a92f52e60379b764c4bc874464c5955b375"
+
+JDK_CHANGESET =3D "39baa472e20c"
+SRC_URI[jdk.md5sum] =3D "746e4d38fa3d31a22239d160688ed447"
+SRC_URI[jdk.sha256sum] =3D =
"e3587fa57eec72c561f0695723649a745966bb2a74803ff8a451b80fd2079f99"
+
+LANGTOOLS_CHANGESET =3D "10ffafaf5340"
+SRC_URI[langtools.md5sum] =3D "4562acae958cc9b9f68300d5c2e6feb3"
+SRC_URI[langtools.sha256sum] =3D =
"5d14b666fbc6ee93d60c6a135eb8163a95ca5de96d390894e0c0b59719cf7fe4"
+
+NASHORN_CHANGESET =3D "9ff5c2181333"
+SRC_URI[nashorn.md5sum] =3D "c6d234d73ab4d95072b7600b731bbfff"
+SRC_URI[nashorn.sha256sum] =3D =
"f56ee0bc65c8f4954bbec0e777c0158a44dc4b744407991a96f6627be433807d"
+
+OPENJDK_CHANGESET =3D "e8bed1496ff2"
+SRC_URI[openjdk.md5sum] =3D "182992a90cbe209b34142f934319704b"
+SRC_URI[openjdk.sha256sum] =3D =
"d835a9adcf766e68d5a73fb36040d9e35b36c0363c883b8f05560c49bb22bf0c"
+
+OPENJDK_HG_U =3D "jdk8u"
+OPENJDK_HG_URL =3D "http://hg.openjdk.java.net/jdk8u/${OPENJDK_HG_U}"
+
+OPENJDK_FILE =3D "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI =3D =
"${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=3Dopenjdk"
+
+HOTSPOT_FILE =3D "${HOTSPOT_CHANGESET}.tar.bz2"
+HOTSPOT_URI =3D =
"${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=3Dhotspot;unpack=3D=
false"
+
+CORBA_FILE =3D "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI =3D =
"${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=3Dcorba;unpack=3Dfalse=
"
+
+JAXP_FILE =3D "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI =3D =
"${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=3Djaxp;unpack=3Dfalse"
+
+JAXWS_FILE =3D "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI =3D =
"${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=3Djaxws;unpack=3Dfalse=
"
+
+JDK_FILE =3D "${JDK_CHANGESET}.tar.bz2"
+JDK_URI =3D =
"${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=3Djdk;unpack=3Dfalse"
+
+LANGTOOLS_FILE =3D "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI =3D =
"${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=3Dlangtools;un=
pack=3Dfalse"
+
+NASHORN_FILE =3D "${NASHORN_CHANGESET}.tar.bz2"
+NASHORN_URI =3D =
"${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=3Dnashorn;unpack=3D=
false"
+#
+#CACAO_VERSION =3D "e215e36be9fc"
+#CACAO_FILE =3D "${CACAO_VERSION}.tar.gz"
+#CACAO_URI =3D =
"http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=3Dc=
acao;unpack=3Dfalse"
+#SRC_URI[cacao.md5sum] =3D "79f95f0aea4ba04cf2f1a8632ac66d14"
+#SRC_URI[cacao.sha256sum] =3D =
"4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dccb029f971b3c8cb4870ab"
+#
+#JAMVM_VERSION =3D "ec18fb9e49e62dce16c5094ef1527eed619463aa"
+#JAMVM_FILE =3D "jamvm-${JAMVM_VERSION}.tar.gz"
+#JAMVM_URI =3D =
"http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=3Dj=
amvm;unpack=3Dfalse"
+#SRC_URI[jamvm.md5sum] =3D "d50ae193d01a9251e10679c7a2cc6ff1"
+#SRC_URI[jamvm.sha256sum] =3D =
"31810266666c23822942aac62a78019c2c4589e1c5ee48329cbf42652d4437bc"
diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb =
b/recipes-core/openjdk/openjdk-8_72b05.bb
new file mode 100644
index 0000000..4c8899e
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -0,0 +1,36 @@
+require openjdk-8-release-72b05.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
+# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append =3D "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=3Dno \
+    file://openjdk8-fix-shark-build.patch;apply=3Dno \
+    file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno \
+    =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
+"
+
+do_install() {
+    do_install_jdk
+}
+
+PACKAGES_append =3D " \
+    ${JDKPN}-demo-dbg \
+    ${JDKPN}-demo \
+    ${JDKPN}-source \
+"
+
+RPROVIDES_${JDKPN} =3D "java2-vm"
+PROVIDES_${JDKPN} =3D "java2-vm"
+RPROVIDES_${JDKPN} =3D "java2-runtime"
+PROVIDES_${JDKPN} =3D "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} =3D "java"
+ALTERNATIVE_LINK =3D "${bindir}/java"
+ALTERNATIVE_TARGET =3D "${JDK_HOME}/bin/java"
+ALTERNATIVE_PRIORITY =3D "100"
+
+# PR =3D "${INC_PR}.1"
diff --git a/recipes-core/openjdk/openjre-8_72b05.bb =
b/recipes-core/openjdk/openjre-8_72b05.bb
new file mode 100644
index 0000000..67eb1d3
--- /dev/null
+++ b/recipes-core/openjdk/openjre-8_72b05.bb
@@ -0,0 +1,30 @@
+require openjdk-8-release-72b05.inc
+require openjdk-8-cross.inc
+
+# some patches extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
+# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
+PATCHES_URI_append =3D "\
+    file://openjdk8-restrict-to-staging-dir.patch;apply=3Dno \
+    file://openjdk8-fix-shark-build.patch;apply=3Dno \
+    file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno \
+    =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
+"
+
+do_install() {
+    do_install_jre
+}
+
+RPROVIDES_${JREPN} =3D "java2-vm"
+PROVIDES_${JREPN} =3D "java2-vm"
+RPROVIDES_${JREPN} =3D "java2-runtime"
+PROVIDES_${JREPN} =3D "java2-runtime"
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} =3D "java"
+ALTERNATIVE_LINK =3D "${bindir}/java"
+ALTERNATIVE_TARGET =3D "${JRE_HOME}/bin/java"
+ALTERNATIVE_PRIORITY =3D "100"
+
+# PR =3D "${INC_PR}.1"
diff --git a/recipes-core/openjdk/patches-openjdk-8/LICENSE =
b/recipes-core/openjdk/patches-openjdk-8/LICENSE
new file mode 100644
index 0000000..b40a0f4
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/LICENSE
@@ -0,0 +1,347 @@
+The GNU General Public License (GPL)
+
+Version 2, June 1991
+
+Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this =
license
+document, but changing it is not allowed.
+
+Preamble
+
+The licenses for most software are designed to take away your freedom =
to share
+and change it.  By contrast, the GNU General Public License is intended =
to
+guarantee your freedom to share and change free software--to make sure =
the
+software is free for all its users.  This General Public License =
applies to
+most of the Free Software Foundation's software and to any other =
program whose
+authors commit to using it.  (Some other Free Software Foundation =
software is
+covered by the GNU Library General Public License instead.) You can =
apply it to
+your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. =
 Our
+General Public Licenses are designed to make sure that you have the =
freedom to
+distribute copies of free software (and charge for this service if you =
wish),
+that you receive source code or can get it if you want it, that you can =
change
+the software or use pieces of it in new free programs; and that you =
know you
+can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone =
to deny
+you these rights or to ask you to surrender the rights.  These =
restrictions
+translate to certain responsibilities for you if you distribute copies =
of the
+software, or if you modify it.
+
+For example, if you distribute copies of such a program, whether gratis =
or for
+a fee, you must give the recipients all the rights that you have.  You =
must
+make sure that they, too, receive or can get the source code.  And you =
must
+show them these terms so they know their rights.
+
+We protect your rights with two steps: (1) copyright the software, and =
(2)
+offer you this license which gives you legal permission to copy, =
distribute
+and/or modify the software.
+
+Also, for each author's protection and ours, we want to make certain =
that
+everyone understands that there is no warranty for this free software.  =
If the
+software is modified by someone else and passed on, we want its =
recipients to
+know that what they have is not the original, so that any problems =
introduced
+by others will not reflect on the original authors' reputations.
+
+Finally, any free program is threatened constantly by software patents. =
 We
+wish to avoid the danger that redistributors of a free program will
+individually obtain patent licenses, in effect making the program =
proprietary.
+To prevent this, we have made it clear that any patent must be licensed =
for
+everyone's free use or not licensed at all.
+
+The precise terms and conditions for copying, distribution and =
modification
+follow.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License applies to any program or other work which contains a =
notice
+placed by the copyright holder saying it may be distributed under the =
terms of
+this General Public License.  The "Program", below, refers to any such =
program
+or work, and a "work based on the Program" means either the Program or =
any
+derivative work under copyright law: that is to say, a work containing =
the
+Program or a portion of it, either verbatim or with modifications =
and/or
+translated into another language.  (Hereinafter, translation is =
included
+without limitation in the term "modification".) Each licensee is =
addressed as
+"you".
+
+Activities other than copying, distribution and modification are not =
covered by
+this License; they are outside its scope.  The act of running the =
Program is
+not restricted, and the output from the Program is covered only if its =
contents
+constitute a work based on the Program (independent of having been made =
by
+running the Program).  Whether that is true depends on what the Program =
does.
+
+1. You may copy and distribute verbatim copies of the Program's source =
code as
+you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice and
+disclaimer of warranty; keep intact all the notices that refer to this =
License
+and to the absence of any warranty; and give any other recipients of =
the
+Program a copy of this License along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and =
you may
+at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Program or any portion of =
it, thus
+forming a work based on the Program, and copy and distribute such =
modifications
+or work under the terms of Section 1 above, provided that you also meet =
all of
+these conditions:
+
+    a) You must cause the modified files to carry prominent notices =
stating
+    that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in =
whole or
+    in part contains or is derived from the Program or any part =
thereof, to be
+    licensed as a whole at no charge to all third parties under the =
terms of
+    this License.
+
+    c) If the modified program normally reads commands interactively =
when run,
+    you must cause it, when started running for such interactive use in =
the
+    most ordinary way, to print or display an announcement including an
+    appropriate copyright notice and a notice that there is no warranty =
(or
+    else, saying that you provide a warranty) and that users may =
redistribute
+    the program under these conditions, and telling the user how to =
view a copy
+    of this License.  (Exception: if the Program itself is interactive =
but does
+    not normally print such an announcement, your work based on the =
Program is
+    not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If =
identifiable
+sections of that work are not derived from the Program, and can be =
reasonably
+considered independent and separate works in themselves, then this =
License, and
+its terms, do not apply to those sections when you distribute them as =
separate
+works.  But when you distribute the same sections as part of a whole =
which is a
+work based on the Program, the distribution of the whole must be on the =
terms
+of this License, whose permissions for other licensees extend to the =
entire
+whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest =
your
+rights to work written entirely by you; rather, the intent is to =
exercise the
+right to control the distribution of derivative or collective works =
based on
+the Program.
+
+In addition, mere aggregation of another work not based on the Program =
with the
+Program (or with a work based on the Program) on a volume of a storage =
or
+distribution medium does not bring the other work under the scope of =
this
+License.
+
+3. You may copy and distribute the Program (or a work based on it, =
under
+Section 2) in object code or executable form under the terms of =
Sections 1 and
+2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable =
source
+    code, which must be distributed under the terms of Sections 1 and 2 =
above
+    on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three =
years, to
+    give any third party, for a charge no more than your cost of =
physically
+    performing source distribution, a complete machine-readable copy of =
the
+    corresponding source code, to be distributed under the terms of =
Sections 1
+    and 2 above on a medium customarily used for software interchange; =
or,
+
+    c) Accompany it with the information you received as to the offer =
to
+    distribute corresponding source code.  (This alternative is allowed =
only
+    for noncommercial distribution and only if you received the program =
in
+    object code or executable form with such an offer, in accord with
+    Subsection b above.)
+
+The source code for a work means the preferred form of the work for =
making
+modifications to it.  For an executable work, complete source code =
means all
+the source code for all modules it contains, plus any associated =
interface
+definition files, plus the scripts used to control compilation and =
installation
+of the executable.  However, as a special exception, the source code
+distributed need not include anything that is normally distributed (in =
either
+source or binary form) with the major components (compiler, kernel, and =
so on)
+of the operating system on which the executable runs, unless that =
component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering access =
to copy
+from a designated place, then offering equivalent access to copy the =
source
+code from the same place counts as distribution of the source code, =
even though
+third parties are not compelled to copy the source along with the =
object code.
+
+4. You may not copy, modify, sublicense, or distribute the Program =
except as
+expressly provided under this License.  Any attempt otherwise to copy, =
modify,
+sublicense or distribute the Program is void, and will automatically =
terminate
+your rights under this License.  However, parties who have received =
copies, or
+rights, from you under this License will not have their licenses =
terminated so
+long as such parties remain in full compliance.
+
+5. You are not required to accept this License, since you have not =
signed it.
+However, nothing else grants you permission to modify or distribute the =
Program
+or its derivative works.  These actions are prohibited by law if you do =
not
+accept this License.  Therefore, by modifying or distributing the =
Program (or
+any work based on the Program), you indicate your acceptance of this =
License to
+do so, and all its terms and conditions for copying, distributing or =
modifying
+the Program or works based on it.
+
+6. Each time you redistribute the Program (or any work based on the =
Program),
+the recipient automatically receives a license from the original =
licensor to
+copy, distribute or modify the Program subject to these terms and =
conditions.
+You may not impose any further restrictions on the recipients' exercise =
of the
+rights granted herein.  You are not responsible for enforcing =
compliance by
+third parties to this License.
+
+7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues), =
conditions
+are imposed on you (whether by court order, agreement or otherwise) =
that
+contradict the conditions of this License, they do not excuse you from =
the
+conditions of this License.  If you cannot distribute so as to satisfy
+simultaneously your obligations under this License and any other =
pertinent
+obligations, then as a consequence you may not distribute the Program =
at all.
+For example, if a patent license would not permit royalty-free =
redistribution
+of the Program by all those who receive copies directly or indirectly =
through
+you, then the only way you could satisfy both it and this License would =
be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under =
any
+particular circumstance, the balance of the section is intended to =
apply and
+the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any =
patents or
+other property right claims or to contest validity of any such claims; =
this
+section has the sole purpose of protecting the integrity of the free =
software
+distribution system, which is implemented by public license practices.  =
Many
+people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application =
of that
+system; it is up to the author/donor to decide if he or she is willing =
to
+distribute software through any other system and a licensee cannot =
impose that
+choice.
+
+This section is intended to make thoroughly clear what is believed to =
be a
+consequence of the rest of this License.
+
+8. If the distribution and/or use of the Program is restricted in =
certain
+countries either by patents or by copyrighted interfaces, the original
+copyright holder who places the Program under this License may add an =
explicit
+geographical distribution limitation excluding those countries, so that
+distribution is permitted only in or among countries not thus excluded. =
 In
+such case, this License incorporates the limitation as if written in =
the body
+of this License.
+
+9. The Free Software Foundation may publish revised and/or new versions =
of the
+General Public License from time to time.  Such new versions will be =
similar in
+spirit to the present version, but may differ in detail to address new =
problems
+or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any =
later
+version", you have the option of following the terms and conditions =
either of
+that version or of any later version published by the Free Software =
Foundation.
+If the Program does not specify a version number of this License, you =
may
+choose any version ever published by the Free Software Foundation.
+
+10. If you wish to incorporate parts of the Program into other free =
programs
+whose distribution conditions are different, write to the author to ask =
for
+permission.  For software which is copyrighted by the Free Software =
Foundation,
+write to the Free Software Foundation; we sometimes make exceptions for =
this.
+Our decision will be guided by the two goals of preserving the free =
status of
+all derivatives of our free software and of promoting the sharing and =
reuse of
+software generally.
+
+NO WARRANTY
+
+11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO =
WARRANTY FOR
+THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN =
OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE =
THE
+PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR =
IMPLIED,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF =
MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY =
AND
+PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE PROGRAM PROVE =
DEFECTIVE,
+YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN =
WRITING WILL
+ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR =
REDISTRIBUTE THE
+PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF =
THE USE OR
+INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA =
OR DATA
+BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES =
OR A
+FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF =
SUCH HOLDER
+OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest =
possible
+use to the public, the best way to achieve this is to make it free =
software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program.  It is safest to =
attach
+them to the start of each source file to most effectively convey the =
exclusion
+of warranty; and each file should have at least the "copyright" line =
and a
+pointer to where the full notice is found.
+
+    One line to give the program's name and a brief idea of what it =
does.
+
+    Copyright (C) <year> <name of author>
+
+    This program is free software; you can redistribute it and/or =
modify it
+    under the terms of the GNU General Public License as published by =
the Free
+    Software Foundation; either version 2 of the License, or (at your =
option)
+    any later version.
+
+    This program is distributed in the hope that it will be useful, but =
WITHOUT
+    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
+    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
+    more details.
+
+    You should have received a copy of the GNU General Public License =
along
+    with this program; if not, write to the Free Software Foundation, =
Inc., 59
+    Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+Also add information on how to contact you by electronic and paper =
mail.
+
+If the program is interactive, make it output a short notice like this =
when it
+starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author =
Gnomovision comes
+    with ABSOLUTELY NO WARRANTY; for details type 'show w'.  This is =
free
+    software, and you are welcome to redistribute it under certain =
conditions;
+    type 'show c' for details.
+
+The hypothetical commands 'show w' and 'show c' should show the =
appropriate
+parts of the General Public License.  Of course, the commands you use =
may be
+called something other than 'show w' and 'show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your =
school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. =
 Here
+is a sample; alter the names:
+
+    Yoyodyne, Inc., hereby disclaims all copyright interest in the =
program
+    'Gnomovision' (which makes passes at compilers) written by James =
Hacker.
+
+    signature of Ty Coon, 1 April 1989
+
+    Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program =
into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with =
the
+library.  If this is what you want to do, use the GNU Library General =
Public
+License instead of this License.
+
+
+"CLASSPATH" EXCEPTION TO THE GPL
+
+Certain source files distributed by Oracle America and/or its =
affiliates are
+subject to the following clarification and special exception to the =
GPL, but
+only where Oracle has expressly included in the particular source =
file's header
+the words "Oracle designates this particular file as subject to the =
"Classpath"
+exception as provided by Oracle in the LICENSE file that accompanied =
this code."
+
+    Linking this library statically or dynamically with other modules =
is making
+    a combined work based on this library.  Thus, the terms and =
conditions of
+    the GNU General Public License cover the whole combination.
+
+    As a special exception, the copyright holders of this library give =
you
+    permission to link this library with independent modules to produce =
an
+    executable, regardless of the license terms of these independent =
modules,
+    and to copy and distribute the resulting executable under terms of =
your
+    choice, provided that you also meet, for each linked independent =
module,
+    the terms and conditions of the license of that module.  An =
independent
+    module is a module which is not derived from or based on this =
library.  If
+    you modify this library, you may extend this exception to your =
version of
+    the library, but you are not obligated to do so.  If you do not =
wish to do
+    so, delete this exception statement from your version.
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch =
b/recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch
new file mode 100644
index 0000000..a8a9c1d
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch
@@ -0,0 +1,18 @@
+--- common/autoconf/basics.m4.orig	2015-08-17 19:05:13.122672019 =
+0200
++++ common/autoconf/basics.m4	2015-08-17 19:13:01.482673782 +0200
+@@ -549,10 +549,12 @@
+   # We need to find a recent version of GNU make. Especially on =
Solaris, this can be tricky.
+   if test "x$MAKE" !=3D x; then
+     # User has supplied a make, test it.
+-    if test ! -f "$MAKE"; then
+-      AC_MSG_ERROR([The specified make (by MAKE=3D$MAKE) is not =
found.])
++    if test -a `dirname "$MAKE"` =3D "." -a ! -f "$MAKE"; then
++      AC_PATH_PROGS(CHECK_MAKE, $MAKE)
++    else
++      CHECK_MAKE=3D"${MAKE}"
+     fi
+-    BASIC_CHECK_MAKE_VERSION("$MAKE", [user supplied MAKE=3D$MAKE])
++    BASIC_CHECK_MAKE_VERSION("$CHECK_MAKE", [user supplied =
MAKE=3D$MAKE])
+     if test "x$FOUND_MAKE" =3D x; then
+       AC_MSG_ERROR([The specified make (by MAKE=3D$MAKE) is not GNU =
make 3.81 or newer.])
+     fi
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch =
b/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
new file mode 100644
index 0000000..4679c9d
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
@@ -0,0 +1,11 @@
+--- common/autoconf/basics.m4.orig	2015-08-17 18:31:50.598664481 =
+0200
++++ common/autoconf/basics.m4	2015-08-17 18:31:57.554664507 +0200
+@@ -442,7 +442,7 @@
+       files_present=3D`$LS $OUTPUT_ROOT`
+       # Configure has already touched config.log and confdefs.h in the =
current dir when this check
+       # is performed.
+-      filtered_files=3D`$ECHO "$files_present" | $SED -e =
's/config.log//g' -e 's/confdefs.h//g' -e 's/ //g' \
++      filtered_files=3D`$ECHO "$files_present" | $SED -e =
's/config.log//g' -e 's/confdefs.h//g' -e 's,aclocal-copy,,g' -e 's/ =
//g' \
+       | $TR -d '\n'`
+       if test "x$filtered_files" !=3D x; then
+         AC_MSG_NOTICE([Current directory is $CURDIR.])
diff --git a/recipes-core/openjdk/patches-openjdk-8/jvm.cfg =
b/recipes-core/openjdk/patches-openjdk-8/jvm.cfg
new file mode 100644
index 0000000..1a55ec6
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/jvm.cfg
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
+# This code is distributed in the hope that it will be useful, but =
WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file =
that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License =
version
+# 2 along with this work; if not, write to the Free Software =
Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
+# CA 95054 USA or visit www.sun.com if you need additional information =
or
+# have any questions.
+#
+#=20
+# List of JVMs that can be used as an option to java, javac, etc.
+# Order is important -- first in this list is the default JVM.
+# NOTE that this both this file and its format are UNSUPPORTED and
+# WILL GO AWAY in a future release.
+#
+# You may also select a JVM in an arbitrary location with the
+# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
+# and may not be available in a future release.
+#
+-server ERROR
+-client IGNORE
+-hotspot ERROR
+-classic WARN
+-native ERROR
+-green ERROR
+-zero ALIASED_TO -server
+-shark ERROR
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-re=
spect.patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-re=
spect.patch
new file mode 100644
index 0000000..b31deae
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-re=
spect.patch
@@ -0,0 +1,140 @@
+--- common/autoconf/toolchain.m4.orig	2015-08-07 20:52:38.000000000 =
+0200
++++ common/autoconf/toolchain.m4	2015-10-27 13:57:19.708566525 =
+0100
+@@ -27,7 +27,7 @@
+ # $2 =3D human readable name of compiler (C or C++)
+ AC_DEFUN([TOOLCHAIN_CHECK_COMPILER_VERSION],
+ [
+-  COMPILER=3D[$]$1
++  COMPILER=3D"[$]$1"
+   COMPILER_NAME=3D$2
+=20
+   if test "x$OPENJDK_TARGET_OS" =3D xsolaris; then
+@@ -123,64 +123,37 @@
+ [
+   COMPILER_NAME=3D$2
+=20
+-  $1=3D
++  FOUND_$1=3D
++
++  if test "x[$]$1" !=3D "x"; then
++    FOUND_$1=3D"[$]$1"
++  fi
++
+   # If TOOLS_DIR is set, check for all compiler names in there first
+   # before checking the rest of the PATH.
+-  if test -n "$TOOLS_DIR"; then
++  if test "x[$]FOUND_$1" =3D x -a -n "$TOOLS_DIR"; then
+     PATH_save=3D"$PATH"
+     PATH=3D"$TOOLS_DIR"
+     AC_PATH_PROGS(TOOLS_DIR_$1, $3)
+-    $1=3D$TOOLS_DIR_$1
++    FOUND_$1=3D$TOOLS_DIR_$1
+     PATH=3D"$PATH_save"
+   fi
+=20
+   # AC_PATH_PROGS can't be run multiple times with the same variable,
+   # so create a new name for this run.
+-  if test "x[$]$1" =3D x; then
++  if test "x[$]FOUND_$1" =3D x; then
+     AC_PATH_PROGS(POTENTIAL_$1, $3)
+-    $1=3D$POTENTIAL_$1
++    FOUND_$1=3D$POTENTIAL_$1
+   fi
+=20
+-  if test "x[$]$1" =3D x; then
++  if test "x[$]FOUND_$1" =3D x; then
+     HELP_MSG_MISSING_DEPENDENCY([devkit])
+     AC_MSG_ERROR([Could not find a $COMPILER_NAME compiler. =
$HELP_MSG])
+   fi
+-  BASIC_FIXUP_EXECUTABLE($1)
+-  TEST_COMPILER=3D"[$]$1"
+-  # Don't remove symbolic links on AIX because 'xlc_r' and 'xlC_r' may =
all be links
+-  # to 'xlc' but it is crucial that we invoke the compiler with the =
right name!
+-  if test "x$OPENJDK_BUILD_OS" !=3D xaix; then
+-    AC_MSG_CHECKING([resolved symbolic links for $1])
+-    BASIC_REMOVE_SYMBOLIC_LINKS(TEST_COMPILER)
+-    AC_MSG_RESULT([$TEST_COMPILER])
+-  fi
+-  AC_MSG_CHECKING([if $1 is disguised ccache])
+-
+-  COMPILER_BASENAME=3D`$BASENAME "$TEST_COMPILER"`
+-  if test "x$COMPILER_BASENAME" =3D "xccache"; then
+-    AC_MSG_RESULT([yes, trying to find proper $COMPILER_NAME =
compiler])
+-    # We /usr/lib/ccache in the path, so cc is a symlink to =
/usr/bin/ccache.
+-    # We want to control ccache invocation ourselves, so ignore this =
cc and try
+-    # searching again.
+-
+-    # Remove the path to the fake ccache cc from the PATH
+-    RETRY_COMPILER_SAVED_PATH=3D"$PATH"
+-    COMPILER_DIRNAME=3D`$DIRNAME [$]$1`
+-    PATH=3D"`$ECHO $PATH | $SED -e "s,$COMPILER_DIRNAME,,g" -e =
"s,::,:,g" -e "s,^:,,g"`"
+-
+-    # Try again looking for our compiler
+-    AC_CHECK_TOOLS(PROPER_COMPILER_$1, $3)
+-    BASIC_FIXUP_EXECUTABLE(PROPER_COMPILER_$1)
+-    PATH=3D"$RETRY_COMPILER_SAVED_PATH"
+-
+-    AC_MSG_CHECKING([for resolved symbolic links for $1])
+-    BASIC_REMOVE_SYMBOLIC_LINKS(PROPER_COMPILER_$1)
+-    AC_MSG_RESULT([$PROPER_COMPILER_$1])
+-    $1=3D"$PROPER_COMPILER_$1"
+-  else
+-    AC_MSG_RESULT([no, keeping $1])
+-    $1=3D"$TEST_COMPILER"
+-  fi
++  BASIC_FIXUP_EXECUTABLE(FOUND_$1)
++  TEST_COMPILER=3D"[$]FOUND_$1"
++
++  $1=3D"$TEST_COMPILER"
+   TOOLCHAIN_CHECK_COMPILER_VERSION([$1], [$COMPILER_NAME])
+ ])
+=20
+@@ -214,12 +187,12 @@
+     # otherwise we might pick up cross-compilers which don't use =
standard naming.
+     # Otherwise, we'll set the BUILD_tools to the native tools, but =
that'll have
+     # to wait until they are properly discovered.
+-    AC_PATH_PROGS(BUILD_CC, [cl cc gcc])
+-    BASIC_FIXUP_EXECUTABLE(BUILD_CC)
+-    AC_PATH_PROGS(BUILD_CXX, [cl CC g++])
+-    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)
+-    AC_PATH_PROG(BUILD_LD, ld)
+-    BASIC_FIXUP_EXECUTABLE(BUILD_LD)
++    AS_IF([test "x${BUILD_CC}" =3D "x"], [AC_PATH_PROGS(BUILD_CC, [cl =
cc gcc])
++    BASIC_FIXUP_EXECUTABLE(BUILD_CC)])
++    AS_IF([test "x${BUILD_CXX}" =3D "x"], [AC_PATH_PROGS(BUILD_CXX, =
[cl CC g++])
++    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)])
++    AS_IF([test "x${BUILD_LD}" =3D "x"], [AC_PATH_PROG(BUILD_LD, ld)
++    BASIC_FIXUP_EXECUTABLE(BUILD_LD)])
+   fi
+   AC_SUBST(BUILD_CC)
+   AC_SUBST(BUILD_CXX)
+--- common/autoconf/basics.m4.orig	2015-08-31 15:03:54.942975387 =
+0200
++++ common/autoconf/basics.m4	2015-08-31 15:02:25.090975049 +0200
+@@ -171,8 +171,15 @@
+       fi
+     fi
+=20
++    # First separate the path from the arguments. This will split at =
the first
++    # space.
++    complete=3D"[$]$1"
++    path=3D"${complete%% *}"
++    tmp=3D"$complete EOL"
++    arguments=3D"${tmp#* }"
++
+     if test "x$READLINK" !=3D x; then
+-      $1=3D`$READLINK -f [$]$1`
++      new_path=3D`$READLINK -f $path`
+     else
+       # Save the current directory for restoring afterwards
+       STARTDIR=3D$PWD
+@@ -198,8 +205,9 @@
+         let COUNTER=3DCOUNTER+1
+       done
+       cd $STARTDIR
+-      $1=3D$sym_link_dir/$sym_link_file
++      new_path=3D$sym_link_dir/$sym_link_file
+     fi
++    $1=3D"$new_path ${arguments% *}"
+   fi
+ ])
+=20
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch
new file mode 100644
index 0000000..889c323
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build.patch
@@ -0,0 +1,453 @@
+--- hotspot/make/Makefile.orig	2015-08-31 19:44:44.459038814 +0200
++++ hotspot/make/Makefile	2015-08-31 19:44:58.511038867 +0200
+@@ -525,7 +525,7 @@
+ # Unix
+ $(EXPORT_JRE_LIB_ARCH_DIR)/%.$(LIBRARY_SUFFIX): =
$(SHARK_BUILD_DIR)/%.$(LIBRARY_SUFFIX)
+ 	$(install-file)
+-$(EXPORT_JRE_LIB_ARCH_DIR)/%.debuginfo):	=
$(SHARK_BUILD_DIR)/%.debuginfo
++$(EXPORT_JRE_LIB_ARCH_DIR)/%.debuginfo:		=
$(SHARK_BUILD_DIR)/%.debuginfo
+ 	$(install-file)
+ $(EXPORT_JRE_LIB_ARCH_DIR)/%.diz:		$(SHARK_BUILD_DIR)/%.diz
+ 	$(install-file)
+--- hotspot/src/share/vm/ci/ciTypeFlow.cpp.orig	2015-08-31 =
19:45:28.611038980 +0200
++++ hotspot/src/share/vm/ci/ciTypeFlow.cpp	2015-08-31 =
19:47:17.539039390 +0200
+@@ -35,7 +35,9 @@
+ #include "interpreter/bytecode.hpp"
+ #include "interpreter/bytecodes.hpp"
+ #include "memory/allocation.inline.hpp"
+-#include "opto/compile.hpp"
++#ifdef COMPILER2
++#include "opto/compile.hpp"
+ #include "opto/node.hpp"
++#endif
+ #include "runtime/deoptimization.hpp"
+ #include "utilities/growableArray.hpp"
+@@ -2647,6 +2649,7 @@
+       assert (!blk->has_pre_order(), "");
+       blk->set_next_pre_order();
+=20
++#ifdef COMPILER2
+       if (_next_pre_order >=3D =
(int)Compile::current()->max_node_limit() / 2) {
+         // Too many basic blocks.  Bail out.
+         // This can happen when try/finally constructs are nested to =
depth N,
+@@ -2656,6 +2659,7 @@
+         record_failure("too many basic blocks");
+         return;
+       }
++#endif
+       if (do_flow) {
+         flow_block(blk, temp_vector, temp_set);
+         if (failing()) return; // Watch for bailouts.
+--- hotspot/src/share/vm/classfile/systemDictionary.cpp.orig	=
2015-08-31 19:50:00.367040003 +0200
++++ hotspot/src/share/vm/classfile/systemDictionary.cpp	=
2015-08-31 19:51:28.323040334 +0200
+@@ -2276,6 +2276,7 @@
+     spe =3D NULL;
+     // Must create lots of stuff here, but outside of the =
SystemDictionary lock.
+     m =3D Method::make_method_handle_intrinsic(iid, signature, =
CHECK_(empty));
++#ifndef SHARK
+     if (!Arguments::is_interpreter_only()) {
+       // Generate a compiled form of the MH intrinsic.
+       AdapterHandlerLibrary::create_native_wrapper(m);
+@@ -2285,6 +2286,7 @@
+                    "out of space in CodeCache for method handle =
intrinsic", empty);
+       }
+     }
++#endif
+     // Now grab the lock.  We might have to throw away the new method,
+     // if a racing thread has managed to install one at the same time.
+     {
+@@ -2298,9 +2300,11 @@
+   }
+=20
+   assert(spe !=3D NULL && spe->method() !=3D NULL, "");
++#ifndef SHARK
+   assert(Arguments::is_interpreter_only() || =
(spe->method()->has_compiled_code() &&
+          spe->method()->code()->entry_point() =3D=3D =
spe->method()->from_compiled_entry()),
+          "MH intrinsic invariant");
++#endif
+   return spe->method();
+ }
+=20
+--- hotspot/src/share/vm/runtime/handles.inline.hpp.orig	=
2015-08-31 20:01:39.295042634 +0200
++++ hotspot/src/share/vm/runtime/handles.inline.hpp	2015-08-31 =
20:04:31.331043282 +0200
+@@ -51,6 +51,12 @@
+ }
+ #endif // ASSERT
+=20
++#ifdef SHARK
++#define assert_on_stack(expr) (void)(expr)
++#else
++#define assert_on_stack(expr) assert((expr), "not on stack?")
++#endif
++
+ // Constructors for metadata handles
+ #define DEF_METADATA_HANDLE_FN(name, type) \
+ inline name##Handle::name##Handle(type* obj) : _value(obj), =
_thread(NULL) {       \
+@@ -79,7 +85,7 @@
+     } else {                                                           =
\
+       _thread =3D Thread::current();                                   =
  \
+     }                                                                  =
\
+-    assert (_thread->is_in_stack((address)this), "not on stack?");     =
\
++    assert_on_stack (_thread->is_in_stack((address)this));             =
\
+     _thread->metadata_handles()->push((Metadata*)_value);              =
\
+   } else {                                                             =
\
+     _thread =3D NULL;                                                  =
  \
+--- hotspot/src/cpu/zero/vm/entry_zero.hpp.orig	2015-08-31 =
20:53:40.743054385 +0200
++++ hotspot/src/cpu/zero/vm/entry_zero.hpp	2015-08-31 =
20:53:54.459054436 +0200
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
+--- hotspot/src/share/vm/shark/sharkEntry.hpp.orig	2015-08-31 =
20:47:13.091052925 +0200
++++ hotspot/src/share/vm/shark/sharkEntry.hpp	2015-08-31 =
20:49:42.755053489 +0200
+@@ -27,6 +27,7 @@
+ #define SHARE_VM_SHARK_SHARKENTRY_HPP
+=20
+ #include "shark/llvmHeaders.hpp"
++#include "entry_zero.hpp"
+=20
+ class SharkContext;
+=20
+--- hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp.orig	=
2015-08-31 21:01:14.847056094 +0200
++++ hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp	=
2015-08-31 21:01:24.459056130 +0200
+@@ -30,6 +30,10 @@
+=20
+ #ifdef CC_INTERP
+=20
++#ifdef TARGET_ARCH_zero
++#include "entry_zero.hpp"
++#endif
++
+ class CppInterpreterGenerator: public AbstractInterpreterGenerator {
+   protected:
+   // shared code sequences
+--- hotspot/src/cpu/zero/vm/nativeInst_zero.cpp.orig	2015-08-31 =
21:07:21.643057475 +0200
++++ hotspot/src/cpu/zero/vm/nativeInst_zero.cpp	2015-08-31 =
21:14:49.019059159 +0200
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
+--- hotspot/src/share/vm/shark/llvmHeaders.hpp.orig	2015-09-01 =
14:17:09.793868541 +0200
++++ hotspot/src/share/vm/shark/llvmHeaders.hpp	2015-09-01 =
16:20:25.653868618 +0200
+@@ -35,7 +35,11 @@
+   #undef DEBUG
+ #endif
+=20
++#if SHARK_LLVM_VERSION <=3D 34
+ #include <llvm/Analysis/Verifier.h>
++#else
++#include <llvm-c/Analysis.h>
++#endif
+ #include <llvm/ExecutionEngine/ExecutionEngine.h>
+=20
+ // includes specific to each version
+--- common/autoconf/libraries.m4.orig	2015-09-01 16:53:51.821868486 =
+0200
++++ common/autoconf/libraries.m4	2015-09-01 16:55:27.653868542 =
+0200
+@@ -847,8 +847,9 @@
+         fi
+       fi
+     done
+-    llvm_version=3D$("${LLVM_CONFIG}" --version | sed 's/\.//; =
s/svn.*//')
++    llvm_version=3D$("${LLVM_CONFIG}" --version | sed 's/\.//; =
s/svn.*//; s/\..*$//')
+     LLVM_CFLAGS=3D"${LLVM_CFLAGS} =
-DSHARK_LLVM_VERSION=3D${llvm_version}"
++    AS_IF([test $llvm_version -ge 34], [LLVM_CFLAGS=3D"${LLVM_CFLAGS} =
-std=3Dgnu++11"])
+=20
+     unset LLVM_LDFLAGS
+     for flag in $("${LLVM_CONFIG}" --ldflags); do
+@@ -862,7 +862,7 @@
+     done
+=20
+     unset LLVM_LIBS
+-    for flag in $("${LLVM_CONFIG}" --libs ${llvm_components}); do
++    for flag in $("${LLVM_CONFIG}" --libs --system-libs =
${llvm_components}); do
+       if echo "${flag}" | grep -q '^-l'; then
+         if test "${LLVM_LIBS}" !=3D ""; then
+           LLVM_LIBS=3D"${LLVM_LIBS} "
+--- hotspot/src/share/vm/shark/sharkIntrinsics.cpp.orig	=
2015-09-02 16:58:17.000000000 +0200
++++ hotspot/src/share/vm/shark/sharkIntrinsics.cpp	2015-09-02 =
17:09:26.000000000 +0200
+@@ -265,7 +265,11 @@
+     "addr");
+=20
+   // Perform the operation
++#if SHARK_LLVM_VERSION <=3D 34
+   Value *result =3D builder()->CreateAtomicCmpXchg(addr, e, x, =
llvm::SequentiallyConsistent);
++#else
++  Value *result =3D builder()->CreateAtomicCmpXchg(addr, e, x, =
llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
++  #endif
+   // Push the result
+   state()->push(
+     SharkValue::create_jint(
+--- hotspot/src/share/vm/shark/sharkRuntime.cpp.orig	2015-09-02 =
17:11:58.000000000 +0200
++++ hotspot/src/share/vm/shark/sharkRuntime.cpp	2015-09-02 =
17:12:57.000000000 +0200
+@@ -32,6 +32,7 @@
+ #ifdef TARGET_ARCH_zero
+ # include "stack_zero.inline.hpp"
+ #endif
++#include "memory/oopFactory.hpp"
+=20
+ using namespace llvm;
+=20
+--- hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp.orig	=
2015-09-02 17:23:07.000000000 +0200
++++ hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp	2015-09-02 =
17:43:20.000000000 +0200
+@@ -1732,7 +1732,11 @@
+     heap_object =3D builder()->CreateIntToPtr(
+       old_top, SharkType::oop_type(), "heap_object");
+=20
++#if SHARK_LLVM_VERSION <=3D 34
+     Value *check =3D builder()->CreateAtomicCmpXchg(top_addr, old_top, =
new_top, llvm::SequentiallyConsistent);
++#else
++    Value *check =3D builder()->CreateAtomicCmpXchg(top_addr, old_top, =
new_top, llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
++#endif
+     builder()->CreateCondBr(
+       builder()->CreateICmpEQ(old_top, check),
+       initialize, retry);
+@@ -1933,7 +1937,11 @@
+=20
+   Value *lock =3D builder()->CreatePtrToInt(
+     monitor_header_addr, SharkType::intptr_type());
++#if SHARK_LLVM_VERSION <=3D 34
+   Value *check =3D builder()->CreateAtomicCmpXchg(mark_addr, disp, =
lock, llvm::Acquire);
++#else
++  Value *check =3D builder()->CreateAtomicCmpXchg(mark_addr, disp, =
lock, llvm::Acquire, llvm::Acquire);
++#endif
+   builder()->CreateCondBr(
+     builder()->CreateICmpEQ(disp, check),
+     acquired_fast, try_recursive);
+@@ -2018,7 +2026,11 @@
+     PointerType::getUnqual(SharkType::intptr_type()),
+     "mark_addr");
+=20
++#if SHARK_LLVM_VERSION <=3D 34
+   Value *check =3D builder()->CreateAtomicCmpXchg(mark_addr, lock, =
disp, llvm::Release);
++#else
++  Value *check =3D builder()->CreateAtomicCmpXchg(mark_addr, lock, =
disp, llvm::Release, llvm::Monotonic);
++#endif
+   builder()->CreateCondBr(
+     builder()->CreateICmpEQ(lock, check),
+     released_fast, slow_path);
+--- hotspot/src/cpu/zero/vm/interpreter_zero.cpp.orig	2015-09-14 =
20:13:25.539432044 +0200
++++ hotspot/src/cpu/zero/vm/interpreter_zero.cpp	2015-09-14 =
20:13:46.107432122 +0200
+@@ -49,7 +49,7 @@
+ #ifdef COMPILER1
+ #include "c1/c1_Runtime1.hpp"
+ #endif
+-#ifdef CC_INTERP
++#if defined(CC_INTERP) || defined(SHARK)
+ #include "interpreter/cppInterpreter.hpp"
+ #endif
+=20
+--- hotspot/src/share/vm/shark/sharkCompiler.hpp.orig	2015-08-31 =
20:08:44.723044236 +0200
++++ hotspot/src/share/vm/shark/sharkCompiler.hpp	2015-08-31 =
20:08:59.387044291 +0200
+@@ -40,6 +40,8 @@
+   // Creation
+   SharkCompiler();
+=20
++  void init_llvm();
++
+   // Name of this compiler
+   const char *name()     { return "shark"; }
+=20
+--- hotspot/src/share/vm/shark/sharkCompiler.cpp.orig	2015-09-19 =
12:19:21.000000000 +0200
++++ hotspot/src/share/vm/shark/sharkCompiler.cpp	2015-09-19 =
12:27:17.000000000 +0200
+@@ -61,11 +61,25 @@
+   : AbstractCompiler() {
+   // Create the lock to protect the memory manager and execution =
engine
+   _execution_engine_lock =3D new Monitor(Mutex::leaf, =
"SharkExecutionEngineLock");
+-  MutexLocker locker(execution_engine_lock());
++  {
++    MutexLocker locker(execution_engine_lock());
++    init_llvm();
++  }
++  // All done
++  set_state(initialized);
++}
+=20
++void SharkCompiler::init_llvm() {
++  // with llvm 3.5, Multi-threading can only be enabled/disabled with =
the
++  // compile time define LLVM_ENABLE_THREADS
++#if SHARK_LLVM_VERSION <=3D 34
+   // Make LLVM safe for multithreading
+   if (!llvm_start_multithreaded())
+     fatal("llvm_start_multithreaded() failed");
++#else
++  if (!llvm_is_multithreaded())
++    fatal("llvm_is_multithreaded() tells no multithreading support in =
llvm");
++#endif
+=20
+   // Initialize the native target
+   InitializeNativeTarget();
+@@ -83,7 +97,7 @@
+   // Finetune LLVM for the current host CPU.
+   StringMap<bool> Features;
+   bool gotCpuFeatures =3D llvm::sys::getHostCPUFeatures(Features);
+-  std::string cpu("-mcpu=3D" + llvm::sys::getHostCPUName());
++  std::string cpu("-mcpu=3D" + =
std::string(llvm::sys::getHostCPUName()));
+=20
+   std::vector<const char*> args;
+   args.push_back(""); // program name
+@@ -112,6 +126,9 @@
+   builder.setMAttrs(MAttrs);
+   builder.setJITMemoryManager(memory_manager());
+   builder.setEngineKind(EngineKind::JIT);
++#if SHARK_LLVM_VERSION > 34
++  builder.setUseMCJIT(true);
++#endif
+   builder.setErrorStr(&ErrorMsg);
+   if (! fnmatch(SharkOptimizationLevel, "None", 0)) {
+     tty->print_cr("Shark optimization level set to: None");
+@@ -134,9 +151,10 @@
+   }
+=20
++#if SHARK_LLVM_VERSION > 34
++  _native_context->execution_engine(_execution_engine);
++  _normal_context->execution_engine(_execution_engine);
++#endif
+   execution_engine()->addModule(_native_context->module());
+-
+-  // All done
+-  set_state(initialized);
+ }
+=20
+ void SharkCompiler::initialize() {
+@@ -165,7 +179,7 @@
+   }
+=20
+   // Create the recorders
+-  Arena arena;
++  Arena arena(mtCompiler);
+   env->set_oop_recorder(new OopRecorder(&arena));
+   OopMapSet oopmaps;
+   env->set_debug_info(new =
DebugInformationRecorder(env->oop_recorder()));
+@@ -268,7 +282,12 @@
+=20
+   if (SharkVerifyFunction !=3D NULL) {
+     if (!fnmatch(SharkVerifyFunction, name, 0)) {
++#if SHARK_LLVM_VERSION <=3D 34
+       verifyFunction(*function);
++#else
++      LLVMValueRef F =3D wrap(function);
++      LLVMVerifyFunction(F, LLVMAbortProcessAction);
++#endif
+     }
+   }
+=20
+@@ -298,7 +317,11 @@
+ #endif
+ #endif // !NDEBUG
+     memory_manager()->set_entry_for_function(function, entry);
++#if SHARK_LLVM_VERSION <=3D 34
+     code =3D (address) =
execution_engine()->getPointerToFunction(function);
++#else
++    code =3D (address) execution_engine()->getFunctionAddress(name);
++#endif
+   }
+   assert(code !=3D NULL, "code must be !=3D NULL");
+   entry->set_entry_point(code);
+--- hotspot/src/share/vm/shark/sharkContext.cpp.orig	2015-09-21 =
11:22:51.707813194 +0200
++++ hotspot/src/share/vm/shark/sharkContext.cpp	2015-09-21 =
13:47:56.243845961 +0200
+@@ -34,8 +34,13 @@
+ using namespace llvm;
+=20
+ SharkContext::SharkContext(const char* name)
+-  : LLVMContext(),
+-    _free_queue(NULL) {
++  : LLVMContext()
++  , _free_queue(0)
++#if SHARK_LLVM_VERSION > 34
++  , _ee(0)
++  , func_mod_map()
++#endif
++{
+   // Create a module to build our functions into
+   _module =3D new Module(name, *this);
+=20
+--- hotspot/src/share/vm/shark/sharkContext.hpp.orig	2015-09-21 =
10:58:37.195807719 +0200
++++ hotspot/src/share/vm/shark/sharkContext.hpp	2015-09-21 =
13:50:48.459846609 +0200
+@@ -29,6 +29,8 @@
+ #include "shark/llvmHeaders.hpp"
+ #include "shark/sharkCompiler.hpp"
+=20
++#include <map>
++
+ // The LLVMContext class allows multiple instances of LLVM to operate
+ // independently of each other in a multithreaded context.  We extend
+ // this here to store things in Shark that are LLVMContext-specific.
+@@ -41,12 +43,28 @@
+=20
+  private:
+   llvm::Module* _module;
++#if SHARK_LLVM_VERSION > 34
++  llvm::ExecutionEngine *_ee;
++  std::map<std::string, llvm::Module *> func_mod_map;
++#endif
+=20
+  public:
+   llvm::Module* module() const {
+     return _module;
+   }
+=20
++#if SHARK_LLVM_VERSION > 34
++  llvm::ExecutionEngine *execution_engine(llvm::ExecutionEngine *ee) {
++      llvm::ExecutionEngine *oee =3D _ee;
++      _ee =3D ee;
++      return oee;
++  }
++
++  llvm::ExecutionEngine *execution_engine() const {
++      return _ee;
++  }
++#endif
++
+   // Get this thread's SharkContext
+  public:
+   static SharkContext& current() {
+@@ -55,12 +73,35 @@
+=20
+   // Module accessors
+  public:
+-  void add_function(llvm::Function* function) const {
++  void add_function(llvm::Function* function) {
++#if SHARK_LLVM_VERSION <=3D 34
+     module()->getFunctionList().push_back(function);
++#else
++    // shark compiles modules, not functions
++    std::map<std::string, llvm::Module *>::iterator i =3D =
func_mod_map.find(function->getName().str());
++    if(func_mod_map.end() =3D=3D i) {
++	llvm::Module *mod4fun =3D new llvm::Module(function->getName(), =
*this);
++	func_mod_map.insert(std::pair<std::string, llvm::Module =
*>(function->getName().str(), mod4fun));
++	mod4fun->getFunctionList().push_back(function);
++	_ee->addModule(mod4fun);
++    }
++#endif
+   }
+   llvm::Constant* get_external(const char*               name,
+                                llvm::FunctionType* sig) {
++    // XXX see whether we need additional module map, too
++#if SHARK_LLVM_VERSION <=3D 34
+     return module()->getOrInsertFunction(name, sig);
++#else
++    // shark compiles modules, not functions
++    std::map<std::string, llvm::Module *>::iterator i =3D =
func_mod_map.find(name);
++    if(func_mod_map.end() =3D=3D i) {
++	llvm::Module *mod4fun =3D new llvm::Module(name, *this);
++	func_mod_map.insert(std::pair<std::string, llvm::Module *>(name, =
mod4fun));
++	mod4fun->getOrInsertFunction(name, sig);
++	_ee->addModule(mod4fun);
++    }
++#endif
+   }
+=20
+   // Basic types
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch=
 =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch=

new file mode 100644
index 0000000..31234cb
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch=

@@ -0,0 +1,2730 @@
+--- hotspot/src/share/vm/memory/cardTableModRefBS.hpp.orig	=
2015-09-02 09:45:31.000000000 +0200
++++ hotspot/src/share/vm/memory/cardTableModRefBS.hpp	2015-09-02 =
09:46:59.000000000 +0200
+@@ -158,8 +158,8 @@
+   // Mapping from address to card marking array entry
+   jbyte* byte_for(const void* p) const {
+     assert(_whole_heap.contains(p),
+-           err_msg("Attempt to access p =3D "PTR_FORMAT" out of bounds =
of "
+-                   " card marking array's _whole_heap =3D =
["PTR_FORMAT","PTR_FORMAT")",
++           err_msg("Attempt to access p =3D " PTR_FORMAT " out of =
bounds of "
++                   " card marking array's _whole_heap =3D [" =
PTR_FORMAT "," PTR_FORMAT ")",
+                    p2i(p), p2i(_whole_heap.start()), =
p2i(_whole_heap.end())));
+     jbyte* result =3D &byte_map_base[uintptr_t(p) >> card_shift];
+     assert(result >=3D _byte_map && result < _byte_map + =
_byte_map_size,
+@@ -436,8 +436,8 @@
+     size_t delta =3D pointer_delta(p, byte_map_base, sizeof(jbyte));
+     HeapWord* result =3D (HeapWord*) (delta << card_shift);
+     assert(_whole_heap.contains(result),
+-           err_msg("Returning result =3D "PTR_FORMAT" out of bounds of =
"
+-                   " card marking array's _whole_heap =3D =
["PTR_FORMAT","PTR_FORMAT")",
++           err_msg("Returning result =3D " PTR_FORMAT " out of bounds =
of "
++                   " card marking array's _whole_heap =3D [" =
PTR_FORMAT "," PTR_FORMAT ")",
+                    p2i(result), p2i(_whole_heap.start()), =
p2i(_whole_heap.end())));
+     return result;
+   }
+@@ -445,8 +445,8 @@
+   // Mapping from address to card marking array index.
+   size_t index_for(void* p) {
+     assert(_whole_heap.contains(p),
+-           err_msg("Attempt to access p =3D "PTR_FORMAT" out of bounds =
of "
+-                   " card marking array's _whole_heap =3D =
["PTR_FORMAT","PTR_FORMAT")",
++           err_msg("Attempt to access p =3D " PTR_FORMAT " out of =
bounds of "
++                   " card marking array's _whole_heap =3D [" =
PTR_FORMAT "," PTR_FORMAT ")",
+                    p2i(p), p2i(_whole_heap.start()), =
p2i(_whole_heap.end())));
+     return byte_for(p) - _byte_map;
+   }
+--- hotspot/src/share/vm/memory/generation.hpp.orig	2015-09-02 =
09:45:31.000000000 +0200
++++ hotspot/src/share/vm/memory/generation.hpp	2015-09-02 =
09:47:36.000000000 +0200
+@@ -422,7 +422,7 @@
+     // have to guard against non-monotonicity.
+     NOT_PRODUCT(
+       if (now < _time_of_last_gc) {
+-        warning("time warp: "INT64_FORMAT" to "INT64_FORMAT, =
(int64_t)_time_of_last_gc, (int64_t)now);
++        warning("time warp: " INT64_FORMAT " to " INT64_FORMAT, =
(int64_t)_time_of_last_gc, (int64_t)now);
+       }
+     )
+     return _time_of_last_gc;
+--- hotspot/src/share/vm/memory/threadLocalAllocBuffer.inline.hpp.orig	=
2015-09-02 09:45:31.000000000 +0200
++++ hotspot/src/share/vm/memory/threadLocalAllocBuffer.inline.hpp	=
2015-09-02 09:48:07.000000000 +0200
+@@ -94,10 +94,10 @@
+=20
+   if (PrintTLAB && Verbose) {
+     Thread* thrd =3D myThread();
+-    gclog_or_tty->print("TLAB: %s thread: "INTPTR_FORMAT" [id: %2d]"
+-                        " obj: "SIZE_FORMAT
+-                        " free: "SIZE_FORMAT
+-                        " waste: "SIZE_FORMAT"\n",
++    gclog_or_tty->print("TLAB: %s thread: " INTPTR_FORMAT " [id: %2d]"
++                        " obj: " SIZE_FORMAT
++                        " free: " SIZE_FORMAT
++                        " waste: " SIZE_FORMAT "\n",
+                         "slow", p2i(thrd), =
thrd->osthread()->thread_id(),
+                         obj_size, free(), refill_waste_limit());
+   }
+--- hotspot/src/share/vm/trace/traceStream.hpp.orig	2015-09-02 =
09:45:31.000000000 +0200
++++ hotspot/src/share/vm/trace/traceStream.hpp	2015-09-02 =
09:49:16.000000000 +0200
+@@ -40,31 +40,31 @@
+   TraceStream(outputStream& stream): _st(stream) {}
+=20
+   void print_val(const char* label, u1 val) {
+-    _st.print("%s =3D "UINT32_FORMAT, label, val);
++    _st.print("%s =3D " UINT32_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, u2 val) {
+-    _st.print("%s =3D "UINT32_FORMAT, label, val);
++    _st.print("%s =3D " UINT32_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, s2 val) {
+-    _st.print("%s =3D "INT32_FORMAT, label, val);
++    _st.print("%s =3D " INT32_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, u4 val) {
+-    _st.print("%s =3D "UINT32_FORMAT, label, val);
++    _st.print("%s =3D " UINT32_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, s4 val) {
+-    _st.print("%s =3D "INT32_FORMAT, label, val);
++    _st.print("%s =3D " INT32_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, u8 val) {
+-    _st.print("%s =3D "UINT64_FORMAT, label, val);
++    _st.print("%s =3D " UINT64_FORMAT, label, val);
+   }
+=20
+   void print_val(const char* label, s8 val) {
+-    _st.print("%s =3D "INT64_FORMAT, label, (int64_t) val);
++    _st.print("%s =3D " INT64_FORMAT, label, (int64_t) val);
+   }
+=20
+   void print_val(const char* label, bool val) {
+--- =
hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.inline.hpp.ori=
g	2015-09-02 09:59:23.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.inline.hpp	=
2015-09-02 10:04:07.000000000 +0200
+@@ -31,9 +31,9 @@
+=20
+ inline HeapRegion* HeapRegionManager::addr_to_region(HeapWord* addr) =
const {
+   assert(addr < heap_end(),
+-        err_msg("addr: "PTR_FORMAT" end: "PTR_FORMAT, p2i(addr), =
p2i(heap_end())));
++        err_msg("addr: " PTR_FORMAT " end: " PTR_FORMAT, p2i(addr), =
p2i(heap_end())));
+   assert(addr >=3D heap_bottom(),
+-        err_msg("addr: "PTR_FORMAT" bottom: "PTR_FORMAT, p2i(addr), =
p2i(heap_bottom())));
++        err_msg("addr: " PTR_FORMAT " bottom: " PTR_FORMAT, p2i(addr), =
p2i(heap_bottom())));
+=20
+   HeapRegion* hr =3D _regions.get_by_address(addr);
+   return hr;
+--- =
hotspot/src/share/vm/gc_implementation/g1/heapRegion.inline.hpp.orig	=
2015-09-02 09:59:23.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.inline.hpp	=
2015-09-02 10:03:44.000000000 +0200
+@@ -112,7 +112,7 @@
+=20
+   assert(ClassUnloadingWithConcurrentMark,
+       err_msg("All blocks should be objects if G1 Class Unloading =
isn't used. "
+-              "HR: ["PTR_FORMAT", "PTR_FORMAT", "PTR_FORMAT") "
++              "HR: [" PTR_FORMAT ", " PTR_FORMAT ", " PTR_FORMAT ") "
+               "addr: " PTR_FORMAT,
+               p2i(bottom()), p2i(top()), p2i(end()), p2i(addr)));
+=20
+--- hotspot/src/share/vm/gc_implementation/g1/heapRegion.hpp.orig	=
2015-09-02 09:59:23.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.hpp	=
2015-09-02 10:03:17.000000000 +0200
+@@ -52,7 +52,7 @@
+ class HeapRegionSetBase;
+ class nmethod;
+=20
+-#define HR_FORMAT "%u:(%s)["PTR_FORMAT","PTR_FORMAT","PTR_FORMAT"]"
++#define HR_FORMAT "%u:(%s)[" PTR_FORMAT "," PTR_FORMAT "," PTR_FORMAT =
"]"
+ #define HR_FORMAT_PARAMS(_hr_) \
+                 (_hr_)->hrm_index(), \
+                 (_hr_)->get_short_type_str(), \
+@@ -542,8 +542,8 @@
+   void set_containing_set(HeapRegionSetBase* containing_set) {
+     assert((containing_set =3D=3D NULL && _containing_set !=3D NULL) =
||
+            (containing_set !=3D NULL && _containing_set =3D=3D NULL),
+-           err_msg("containing_set: "PTR_FORMAT" "
+-                   "_containing_set: "PTR_FORMAT,
++           err_msg("containing_set: " PTR_FORMAT " "
++                   "_containing_set: " PTR_FORMAT,
+                    p2i(containing_set), p2i(_containing_set)));
+=20
+     _containing_set =3D containing_set;
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.inline.hpp.orig	=
2015-09-02 09:59:23.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.inline.hpp	=
2015-09-02 10:02:55.000000000 +0200
+@@ -46,7 +46,7 @@
+=20
+ inline uint G1CollectedHeap::addr_to_region(HeapWord* addr) const {
+   assert(is_in_reserved(addr),
+-         err_msg("Cannot calculate region index for address =
"PTR_FORMAT" that is outside of the heap ["PTR_FORMAT", "PTR_FORMAT")",
++         err_msg("Cannot calculate region index for address " =
PTR_FORMAT " that is outside of the heap [" PTR_FORMAT ", " PTR_FORMAT =
")",
+                  p2i(addr), p2i(_reserved.start()), =
p2i(_reserved.end())));
+   return (uint)(pointer_delta(addr, _reserved.start(), =
sizeof(uint8_t)) >> HeapRegion::LogOfHRGrainBytes);
+ }
+@@ -59,7 +59,7 @@
+ inline HeapRegion* G1CollectedHeap::heap_region_containing_raw(const T =
addr) const {
+   assert(addr !=3D NULL, "invariant");
+   assert(is_in_g1_reserved((const void*) addr),
+-      err_msg("Address "PTR_FORMAT" is outside of the heap ranging =
from ["PTR_FORMAT" to "PTR_FORMAT")",
++      err_msg("Address " PTR_FORMAT " is outside of the heap ranging =
from [" PTR_FORMAT " to " PTR_FORMAT ")",
+           p2i((void*)addr), p2i(g1_reserved().start()), =
p2i(g1_reserved().end())));
+   return _hrm.addr_to_region((HeapWord*) addr);
+ }
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.inline.hpp.or=
ig	2015-09-02 09:59:22.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.inline.hpp	=
2015-09-02 10:01:43.000000000 +0200
+@@ -47,15 +47,15 @@
+   }
+ }
+=20
+-#define check_index(index, msg)                                        =
        \
+-  assert((index) < (_reserved.word_size() >> LogN_words),              =
        \
+-         err_msg("%s - index: "SIZE_FORMAT", _vs.committed_size: =
"SIZE_FORMAT, \
+-                 msg, (index), (_reserved.word_size() >> =
LogN_words)));        \
+-  =
assert(G1CollectedHeap::heap()->is_in_exact(address_for_index_raw(index)),=
   \
+-         err_msg("Index "SIZE_FORMAT" corresponding to "PTR_FORMAT     =
        \
+-                 " (%u) is not in committed area.",                    =
        \
+-                 (index),                                              =
        \
+-                 p2i(address_for_index_raw(index)),                    =
        \
++#define check_index(index, msg)                                        =
           \
++  assert((index) < (_reserved.word_size() >> LogN_words),              =
           \
++         err_msg("%s - index: " SIZE_FORMAT ", _vs.committed_size: " =
SIZE_FORMAT, \
++                 msg, (index), (_reserved.word_size() >> =
LogN_words)));           \
++  =
assert(G1CollectedHeap::heap()->is_in_exact(address_for_index_raw(index)),=
      \
++         err_msg("Index " SIZE_FORMAT " corresponding to " PTR_FORMAT  =
           \
++                 " (%u) is not in committed area.",                    =
           \
++                 (index),                                              =
           \
++                 p2i(address_for_index_raw(index)),                    =
           \
+                  =
G1CollectedHeap::heap()->addr_to_region(address_for_index_raw(index))));
+=20
+ u_char G1BlockOffsetSharedArray::offset_array(size_t index) const {
+--- hotspot/src/share/vm/gc_implementation/g1/g1Allocator.hpp.orig	=
2015-09-02 09:59:22.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1Allocator.hpp	=
2015-09-02 10:00:36.000000000 +0200
+@@ -78,7 +78,7 @@
+=20
+    void decrease_used(size_t bytes) {
+      assert(_summary_bytes_used >=3D bytes,
+-            err_msg("invariant: _summary_bytes_used: "SIZE_FORMAT" =
should be >=3D bytes: "SIZE_FORMAT,
++            err_msg("invariant: _summary_bytes_used: " SIZE_FORMAT " =
should be >=3D bytes: " SIZE_FORMAT,
+                 _summary_bytes_used, bytes));
+      _summary_bytes_used -=3D bytes;
+    }
+--- =
hotspot/src/share/vm/gc_implementation/g1/collectionSetChooser.hpp.orig	=
2015-09-02 09:59:22.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/collectionSetChooser.hpp	=
2015-09-02 10:00:20.000000000 +0200
+@@ -92,7 +92,7 @@
+     regions_at_put(_curr_index, NULL);
+     assert(hr->reclaimable_bytes() <=3D _remaining_reclaimable_bytes,
+            err_msg("remaining reclaimable bytes inconsistent "
+-                   "from region: "SIZE_FORMAT" remaining: =
"SIZE_FORMAT,
++                   "from region: " SIZE_FORMAT " remaining: " =
SIZE_FORMAT,
+                    hr->reclaimable_bytes(), =
_remaining_reclaimable_bytes));
+     _remaining_reclaimable_bytes -=3D hr->reclaimable_bytes();
+     _curr_index +=3D 1;
+--- hotspot/src/share/vm/compiler/compileBroker.cpp.orig	=
2015-09-02 10:08:43.000000000 +0200
++++ hotspot/src/share/vm/compiler/compileBroker.cpp	2015-09-02 =
10:09:37.000000000 +0200
+@@ -203,7 +203,7 @@
+   }
+=20
+   void log_nmethod(JavaThread* thread, nmethod* nm) {
+-    log(thread, "nmethod %d%s " INTPTR_FORMAT " code ["INTPTR_FORMAT =
", " INTPTR_FORMAT "]",
++    log(thread, "nmethod %d%s " INTPTR_FORMAT " code [" INTPTR_FORMAT =
", " INTPTR_FORMAT "]",
+         nm->compile_id(), nm->is_osr_method() ? "%" : "",
+         p2i(nm), p2i(nm->code_begin()), p2i(nm->code_end()));
+   }
+--- hotspot/src/share/vm/gc_implementation/g1/g1ErgoVerbose.hpp.orig	=
2015-09-02 10:08:44.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1ErgoVerbose.hpp	=
2015-09-02 10:09:56.000000000 +0200
+@@ -121,15 +121,15 @@
+ // Single parameter format strings
+ #define ergo_format_str(_name_)      ", " _name_ ": %s"
+ #define ergo_format_region(_name_)   ", " _name_ ": %u regions"
+-#define ergo_format_byte(_name_)     ", " _name_ ": "SIZE_FORMAT" =
bytes"
++#define ergo_format_byte(_name_)     ", " _name_ ": " SIZE_FORMAT " =
bytes"
+ #define ergo_format_double(_name_)   ", " _name_ ": %1.2f"
+ #define ergo_format_perc(_name_)     ", " _name_ ": %1.2f %%"
+ #define ergo_format_ms(_name_)       ", " _name_ ": %1.2f ms"
+-#define ergo_format_size(_name_)     ", " _name_ ": "SIZE_FORMAT
++#define ergo_format_size(_name_)     ", " _name_ ": " SIZE_FORMAT
+=20
+ // Double parameter format strings
+ #define ergo_format_byte_perc(_name_)                                  =
 \
+-                             ", " _name_ ": "SIZE_FORMAT" bytes (%1.2f =
%%)"
++                             ", " _name_ ": " SIZE_FORMAT " bytes =
(%1.2f %%)"
+=20
+ // Generates the format string
+ #define ergo_format(_extra_format_)                           \
+--- =
hotspot/src/share/vm/gc_implementation/g1/concurrentMark.inline.hpp.orig	=
2015-09-02 10:12:49.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/concurrentMark.inline.hpp	=
2015-09-02 10:21:24.000000000 +0200
+@@ -196,8 +196,8 @@
+   assert(_bmStartWord <=3D (addr) && (addr) < (_bmStartWord + =
_bmWordSize),      \
+          "outside underlying space?");                                 =
        \
+   assert(G1CollectedHeap::heap()->is_in_exact(addr),                   =
        \
+-         err_msg("Trying to access not available bitmap "PTR_FORMAT    =
        \
+-                 " corresponding to "PTR_FORMAT" (%u)",                =
        \
++         err_msg("Trying to access not available bitmap " PTR_FORMAT   =
        \
++                 " corresponding to " PTR_FORMAT " (%u)",              =
        \
+                  p2i(this), p2i(addr), =
G1CollectedHeap::heap()->addr_to_region(addr)));
+=20
+ inline void CMBitMap::mark(HeapWord* addr) {
+@@ -270,7 +270,7 @@
+=20
+ inline void CMTask::deal_with_reference(oop obj) {
+   if (_cm->verbose_high()) {
+-    gclog_or_tty->print_cr("[%u] we're dealing with reference =3D =
"PTR_FORMAT,
++    gclog_or_tty->print_cr("[%u] we're dealing with reference =3D " =
PTR_FORMAT,
+                            _worker_id, p2i((void*) obj));
+   }
+=20
+@@ -374,7 +374,7 @@
+   // assert that word_size is under an upper bound which is its
+   // containing region's capacity.
+   assert(word_size * HeapWordSize <=3D hr->capacity(),
+-         err_msg("size: "SIZE_FORMAT" capacity: "SIZE_FORMAT" =
"HR_FORMAT,
++         err_msg("size: " SIZE_FORMAT " capacity: " SIZE_FORMAT " " =
HR_FORMAT,
+                  word_size * HeapWordSize, hr->capacity(),
+                  HR_FORMAT_PARAMS(hr)));
+=20
+--- hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.hpp.orig	=
2015-09-02 10:12:49.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.hpp	=
2015-09-02 10:21:38.000000000 +0200
+@@ -91,7 +91,7 @@
+=20
+   jbyte* card_num_2_ptr(size_t card_num) {
+     assert(card_num >=3D 0 && card_num < _reserved_max_card_num,
+-           err_msg("card num out of range: "SIZE_FORMAT, card_num));
++           err_msg("card num out of range: " SIZE_FORMAT, card_num));
+     return (jbyte*) (_ct_bot + card_num);
+   }
+=20
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1OopClosures.inline.hpp.orig	=
2015-09-02 10:24:04.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1OopClosures.inline.hpp	=
2015-09-02 10:24:14.000000000 +0200
+@@ -118,7 +118,7 @@
+   oop obj =3D oopDesc::load_decode_heap_oop(p);
+   if (_cm->verbose_high()) {
+     gclog_or_tty->print_cr("[%u] we're looking at location "
+-                           "*"PTR_FORMAT" =3D "PTR_FORMAT,
++                           "*" PTR_FORMAT " =3D " PTR_FORMAT,
+                            _task->worker_id(), p2i(p), p2i((void*) =
obj));
+   }
+   _task->deal_with_reference(obj);
+--- hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp.orig	=
2015-09-06 14:02:06.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp	=
2015-09-10 12:03:16.130020385 +0200
+@@ -284,7 +284,7 @@
+     if (PrintGCDetails && Verbose) {
+       // Failed to double capacity, continue;
+       gclog_or_tty->print(" (benign) Failed to expand marking stack =
capacity from "
+-                          SIZE_FORMAT"K to " SIZE_FORMAT"K",
++                          SIZE_FORMAT "K to " SIZE_FORMAT "K",
+                           _capacity / K, new_capacity / K);
+     }
+   }
+@@ -581,7 +581,7 @@
+   _verbose_level =3D verbose_level;
+=20
+   if (verbose_low()) {
+-    gclog_or_tty->print_cr("[global] init, heap start =3D =
"PTR_FORMAT", "
++    gclog_or_tty->print_cr("[global] init, heap start =3D " PTR_FORMAT =
", "
+                            "heap end =3D " INTPTR_FORMAT, =
p2i(_heap_start), p2i(_heap_end));
+   }
+=20
+@@ -838,7 +838,7 @@
+     // in a STW phase.
+     assert(!concurrent_marking_in_progress(), "invariant");
+     assert(out_of_regions(),
+-           err_msg("only way to get here: _finger: "PTR_FORMAT", =
_heap_end: "PTR_FORMAT,
++           err_msg("only way to get here: _finger: " PTR_FORMAT ", =
_heap_end: " PTR_FORMAT,
+                    p2i(_finger), p2i(_heap_end)));
+   }
+ }
+@@ -1453,7 +1453,7 @@
+=20
+     assert(start <=3D hr->end() && start <=3D ntams && ntams <=3D =
hr->end(),
+            err_msg("Preconditions not met - "
+-                   "start: "PTR_FORMAT", ntams: "PTR_FORMAT", end: =
"PTR_FORMAT,
++                   "start: " PTR_FORMAT ", ntams: " PTR_FORMAT ", end: =
" PTR_FORMAT,
+                    p2i(start), p2i(ntams), p2i(hr->end())));
+=20
+     // Find the first marked object at or after "start".
+@@ -1770,10 +1770,10 @@
+       }
+=20
+       assert(end_idx <=3D _card_bm->size(),
+-             err_msg("oob: end_idx=3D  "SIZE_FORMAT", bitmap size=3D =
"SIZE_FORMAT,
++             err_msg("oob: end_idx=3D  " SIZE_FORMAT ", bitmap size=3D =
" SIZE_FORMAT,
+                      end_idx, _card_bm->size()));
+       assert(start_idx < _card_bm->size(),
+-             err_msg("oob: start_idx=3D  "SIZE_FORMAT", bitmap size=3D =
"SIZE_FORMAT,
++             err_msg("oob: start_idx=3D  " SIZE_FORMAT ", bitmap size=3D=
 " SIZE_FORMAT,
+                      start_idx, _card_bm->size()));
+=20
+       _cm->set_card_bitmap_range(_card_bm, start_idx, end_idx, true /* =
is_par */);
+@@ -2278,7 +2278,7 @@
+       oop obj =3D oopDesc::load_decode_heap_oop(p);
+       if (_cm->verbose_high()) {
+         gclog_or_tty->print_cr("\t[%u] we're looking at location "
+-                               "*"PTR_FORMAT" =3D "PTR_FORMAT,
++                               "*" PTR_FORMAT " =3D " PTR_FORMAT,
+                                _task->worker_id(), p2i(p), p2i((void*) =
obj));
+       }
+=20
+@@ -2847,7 +2847,7 @@
+       }
+     }
+=20
+-    _out->print_cr("  "PTR_FORMAT": "PTR_FORMAT"%s%s",
++    _out->print_cr("  " PTR_FORMAT ": " PTR_FORMAT "%s%s",
+                    p2i(p), p2i((void*) obj), str, str2);
+   }
+ };
+@@ -2874,7 +2874,7 @@
+     bool print_it =3D _all || over_tams || marked;
+=20
+     if (print_it) {
+-      _out->print_cr(" "PTR_FORMAT"%s",
++      _out->print_cr(" " PTR_FORMAT "%s",
+                      p2i((void *)o), (over_tams) ? " >" : (marked) ? " =
M" : "");
+       PrintReachableOopClosure oopCl(_out, _vo, _all);
+       o->oop_iterate_no_header(&oopCl);
+@@ -2895,7 +2895,7 @@
+     HeapWord* e =3D hr->end();
+     HeapWord* t =3D hr->top();
+     HeapWord* p =3D _g1h->top_at_mark_start(hr, _vo);
+-    _out->print_cr("** ["PTR_FORMAT", "PTR_FORMAT"] top: "PTR_FORMAT" =
"
++    _out->print_cr("** [" PTR_FORMAT ", " PTR_FORMAT "] top: " =
PTR_FORMAT " "
+                    "TAMS: " PTR_FORMAT, p2i(b), p2i(e), p2i(t), =
p2i(p));
+     _out->cr();
+=20
+@@ -3019,9 +3019,9 @@
+       HeapWord*   limit         =3D =
curr_region->next_top_at_mark_start();
+=20
+       if (verbose_low()) {
+-        gclog_or_tty->print_cr("[%u] curr_region =3D "PTR_FORMAT" "
+-                               "["PTR_FORMAT", "PTR_FORMAT"), "
+-                               "limit =3D "PTR_FORMAT,
++        gclog_or_tty->print_cr("[%u] curr_region =3D " PTR_FORMAT " "
++                               "[" PTR_FORMAT ", " PTR_FORMAT "), "
++                               "limit =3D " PTR_FORMAT,
+                                worker_id, p2i(curr_region), =
p2i(bottom), p2i(end), p2i(limit));
+       }
+=20
+@@ -3036,7 +3036,7 @@
+=20
+       if (limit > bottom) {
+         if (verbose_low()) {
+-          gclog_or_tty->print_cr("[%u] region "PTR_FORMAT" is not =
empty, "
++          gclog_or_tty->print_cr("[%u] region " PTR_FORMAT " is not =
empty, "
+                                  "returning it ", worker_id, =
p2i(curr_region));
+         }
+         return curr_region;
+@@ -3044,7 +3044,7 @@
+         assert(limit =3D=3D bottom,
+                "the region limit should be at bottom");
+         if (verbose_low()) {
+-          gclog_or_tty->print_cr("[%u] region "PTR_FORMAT" is empty, "
++          gclog_or_tty->print_cr("[%u] region " PTR_FORMAT " is empty, =
"
+                                  "returning NULL", worker_id, =
p2i(curr_region));
+         }
+         // we return NULL and the caller should try calling
+@@ -3056,13 +3056,13 @@
+       if (verbose_low()) {
+         if (curr_region =3D=3D NULL) {
+           gclog_or_tty->print_cr("[%u] found uncommitted region, =
moving finger, "
+-                                 "global finger =3D "PTR_FORMAT", "
+-                                 "our finger =3D "PTR_FORMAT,
++                                 "global finger =3D " PTR_FORMAT ", "
++                                 "our finger =3D " PTR_FORMAT,
+                                  worker_id, p2i(_finger), =
p2i(finger));
+         } else {
+           gclog_or_tty->print_cr("[%u] somebody else moved the finger, =
"
+-                                 "global finger =3D "PTR_FORMAT", "
+-                                 "our finger =3D "PTR_FORMAT,
++                                 "global finger =3D " PTR_FORMAT ", "
++                                 "our finger =3D " PTR_FORMAT,
+                                  worker_id, p2i(_finger), =
p2i(finger));
+         }
+       }
+@@ -3098,7 +3098,7 @@
+=20
+   void do_object_work(oop obj) {
+     guarantee(!_g1h->obj_in_cs(obj),
+-              err_msg("obj: "PTR_FORMAT" in CSet, phase: %s, info: =
%d",
++              err_msg("obj: " PTR_FORMAT " in CSet, phase: %s, info: =
%d",
+                       p2i((void*) obj), phase_str(), _info));
+   }
+=20
+@@ -3159,7 +3159,7 @@
+     // here.
+     HeapRegion* global_hr =3D =
_g1h->heap_region_containing_raw(global_finger);
+     guarantee(global_hr =3D=3D NULL || global_finger =3D=3D =
global_hr->bottom(),
+-              err_msg("global finger: "PTR_FORMAT" region: "HR_FORMAT,
++              err_msg("global finger: " PTR_FORMAT " region: " =
HR_FORMAT,
+                       p2i(global_finger), =
HR_FORMAT_PARAMS(global_hr)));
+   }
+=20
+@@ -3173,7 +3173,7 @@
+       HeapRegion* task_hr =3D =
_g1h->heap_region_containing_raw(task_finger);
+       guarantee(task_hr =3D=3D NULL || task_finger =3D=3D =
task_hr->bottom() ||
+                 !task_hr->in_collection_set(),
+-                err_msg("task finger: "PTR_FORMAT" region: "HR_FORMAT,
++                err_msg("task finger: " PTR_FORMAT " region: " =
HR_FORMAT,
+                         p2i(task_finger), HR_FORMAT_PARAMS(task_hr)));
+     }
+   }
+@@ -3215,8 +3215,8 @@
+=20
+     assert(start <=3D limit && limit <=3D hr->top() && hr->top() <=3D =
hr->end(),
+            err_msg("Preconditions not met - "
+-                   "start: "PTR_FORMAT", limit: "PTR_FORMAT", "
+-                   "top: "PTR_FORMAT", end: "PTR_FORMAT,
++                   "start: " PTR_FORMAT ", limit: " PTR_FORMAT ", "
++                   "top: " PTR_FORMAT ", end: " PTR_FORMAT,
+                    p2i(start), p2i(limit), p2i(hr->top()), =
p2i(hr->end())));
+=20
+     assert(hr->next_marked_bytes() =3D=3D 0, "Precondition");
+@@ -3495,7 +3495,7 @@
+ #ifndef PRODUCT
+ // for debugging purposes
+ void ConcurrentMark::print_finger() {
+-  gclog_or_tty->print_cr("heap ["PTR_FORMAT", "PTR_FORMAT"), global =
finger =3D "PTR_FORMAT,
++  gclog_or_tty->print_cr("heap [" PTR_FORMAT ", " PTR_FORMAT "), =
global finger =3D " PTR_FORMAT,
+                          p2i(_heap_start), p2i(_heap_end), =
p2i(_finger));
+   for (uint i =3D 0; i < _max_worker_id; ++i) {
+     gclog_or_tty->print("   %u: " PTR_FORMAT, i, =
p2i(_tasks[i]->finger()));
+@@ -3580,7 +3580,7 @@
+         "claim_region() should have filtered out continues humongous =
regions");
+=20
+   if (_cm->verbose_low()) {
+-    gclog_or_tty->print_cr("[%u] setting up for region "PTR_FORMAT,
++    gclog_or_tty->print_cr("[%u] setting up for region " PTR_FORMAT,
+                            _worker_id, p2i(hr));
+   }
+=20
+@@ -3597,7 +3597,7 @@
+   if (limit =3D=3D bottom) {
+     if (_cm->verbose_low()) {
+       gclog_or_tty->print_cr("[%u] found an empty region "
+-                             "["PTR_FORMAT", "PTR_FORMAT")",
++                             "[" PTR_FORMAT ", " PTR_FORMAT ")",
+                              _worker_id, p2i(bottom), p2i(limit));
+     }
+     // The region was collected underneath our feet.
+@@ -3629,7 +3629,7 @@
+ void CMTask::giveup_current_region() {
+   assert(_curr_region !=3D NULL, "invariant");
+   if (_cm->verbose_low()) {
+-    gclog_or_tty->print_cr("[%u] giving up region "PTR_FORMAT,
++    gclog_or_tty->print_cr("[%u] giving up region " PTR_FORMAT,
+                            _worker_id, p2i(_curr_region));
+   }
+   clear_region_fields();
+@@ -3751,7 +3751,7 @@
+=20
+   if (_cm->verbose_medium()) {
+       gclog_or_tty->print_cr("[%u] regular clock, interval =3D =
%1.2lfms, "
+-                        "scanned =3D "SIZE_FORMAT"%s, refs reached =3D =
"SIZE_FORMAT"%s",
++                        "scanned =3D " SIZE_FORMAT "%s, refs reached =3D=
 " SIZE_FORMAT "%s",
+                         _worker_id, last_interval_ms,
+                         _words_scanned,
+                         (_words_scanned >=3D _words_scanned_limit) ? " =
(*)" : "",
+@@ -3920,7 +3920,7 @@
+       statsOnly( ++_local_pops );
+=20
+       if (_cm->verbose_high()) {
+-        gclog_or_tty->print_cr("[%u] popped "PTR_FORMAT, _worker_id,
++        gclog_or_tty->print_cr("[%u] popped " PTR_FORMAT, _worker_id,
+                                p2i((void*) obj));
+       }
+=20
+@@ -4273,8 +4273,8 @@
+=20
+       if (_cm->verbose_low()) {
+         gclog_or_tty->print_cr("[%u] we're scanning part "
+-                               "["PTR_FORMAT", "PTR_FORMAT") "
+-                               "of region "HR_FORMAT,
++                               "[" PTR_FORMAT ", " PTR_FORMAT ") "
++                               "of region " HR_FORMAT,
+                                _worker_id, p2i(_finger), =
p2i(_region_limit),
+                                HR_FORMAT_PARAMS(_curr_region));
+       }
+@@ -4361,7 +4361,7 @@
+=20
+         if (_cm->verbose_low()) {
+           gclog_or_tty->print_cr("[%u] we successfully claimed "
+-                                 "region "PTR_FORMAT,
++                                 "region " PTR_FORMAT,
+                                  _worker_id, p2i(claimed_region));
+         }
+=20
+@@ -4422,7 +4422,7 @@
+=20
+       if (_cm->try_stealing(_worker_id, &_hash_seed, obj)) {
+         if (_cm->verbose_medium()) {
+-          gclog_or_tty->print_cr("[%u] stolen "PTR_FORMAT" =
successfully",
++          gclog_or_tty->print_cr("[%u] stolen " PTR_FORMAT " =
successfully",
+                                  _worker_id, p2i((void*) obj));
+         }
+=20
+@@ -4630,7 +4630,7 @@
+ // identify them easily in a large log file.
+ #define G1PPRL_LINE_PREFIX            "###"
+=20
+-#define G1PPRL_ADDR_BASE_FORMAT    " "PTR_FORMAT"-"PTR_FORMAT
++#define G1PPRL_ADDR_BASE_FORMAT    " " PTR_FORMAT "-" PTR_FORMAT
+ #ifdef _LP64
+ #define G1PPRL_ADDR_BASE_H_FORMAT  " %37s"
+ #else // _LP64
+@@ -4640,16 +4640,16 @@
+ // For per-region info
+ #define G1PPRL_TYPE_FORMAT            "   %-4s"
+ #define G1PPRL_TYPE_H_FORMAT          "   %4s"
+-#define G1PPRL_BYTE_FORMAT            "  "SIZE_FORMAT_W(9)
++#define G1PPRL_BYTE_FORMAT            "  " SIZE_FORMAT_W(9)
+ #define G1PPRL_BYTE_H_FORMAT          "  %9s"
+ #define G1PPRL_DOUBLE_FORMAT          "  %14.1f"
+ #define G1PPRL_DOUBLE_H_FORMAT        "  %14s"
+=20
+ // For summary info
+-#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  =
"tag":"G1PPRL_ADDR_BASE_FORMAT
+-#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  "tag": "SIZE_FORMAT
+-#define G1PPRL_SUM_MB_FORMAT(tag)      "  "tag": %1.2f MB"
+-#define G1PPRL_SUM_MB_PERC_FORMAT(tag) G1PPRL_SUM_MB_FORMAT(tag)" / =
%1.2f %%"
++#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  " tag ":" =
G1PPRL_ADDR_BASE_FORMAT
++#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  " tag ": " SIZE_FORMAT
++#define G1PPRL_SUM_MB_FORMAT(tag)      "  " tag ": %1.2f MB"
++#define G1PPRL_SUM_MB_PERC_FORMAT(tag) G1PPRL_SUM_MB_FORMAT(tag) " / =
%1.2f %%"
+=20
+ G1PrintRegionLivenessInfoClosure::
+ G1PrintRegionLivenessInfoClosure(outputStream* out, const char* =
phase_name)
+--- hotspot/src/share/vm/oops/constantPool.cpp.orig	2015-09-02 =
10:35:07.000000000 +0200
++++ hotspot/src/share/vm/oops/constantPool.cpp	2015-09-02 =
10:36:03.000000000 +0200
+@@ -1494,7 +1494,7 @@
+       }
+       case JVM_CONSTANT_Long: {
+         u8 val =3D Bytes::get_Java_u8(bytes);
+-        printf("long         "INT64_FORMAT, (int64_t) *(jlong *) =
&val);
++        printf("long         " INT64_FORMAT, (int64_t) *(jlong *) =
&val);
+         ent_size =3D 8;
+         idx++; // Long takes two cpool slots
+         break;
+--- hotspot/src/share/vm/oops/cpCache.cpp.orig	2015-09-02 =
10:35:13.000000000 +0200
++++ hotspot/src/share/vm/oops/cpCache.cpp	2015-09-02 =
10:36:48.000000000 +0200
+@@ -305,7 +305,7 @@
+                    adapter->size_of_parameters());
+=20
+   if (TraceInvokeDynamic) {
+-    tty->print_cr("set_method_handle bc=3D%d appendix=3D"PTR_FORMAT"%s =
method_type=3D"PTR_FORMAT"%s method=3D"PTR_FORMAT" ",
++    tty->print_cr("set_method_handle bc=3D%d appendix=3D" PTR_FORMAT =
"%s method_type=3D" PTR_FORMAT "%s method=3D" PTR_FORMAT " ",
+                   invoke_code,
+                   (void *)appendix(),    (has_appendix    ? "" : " =
(unused)"),
+                   (void *)method_type(), (has_method_type ? "" : " =
(unused)"),
+@@ -540,12 +540,12 @@
+   // print separator
+   if (index =3D=3D 0) st->print_cr("                 -------------");
+   // print entry
+-  st->print("%3d  ("PTR_FORMAT")  ", index, (intptr_t)this);
++  st->print("%3d  (" PTR_FORMAT ")  ", index, (intptr_t)this);
+   st->print_cr("[%02x|%02x|%5d]", bytecode_2(), bytecode_1(),
+                constant_pool_index());
+-  st->print_cr("                 [   "PTR_FORMAT"]", (intptr_t)_f1);
+-  st->print_cr("                 [   "PTR_FORMAT"]", (intptr_t)_f2);
+-  st->print_cr("                 [   "PTR_FORMAT"]", =
(intptr_t)_flags);
++  st->print_cr("                 [   " PTR_FORMAT "]", (intptr_t)_f1);
++  st->print_cr("                 [   " PTR_FORMAT "]", (intptr_t)_f2);
++  st->print_cr("                 [   " PTR_FORMAT "]", =
(intptr_t)_flags);
+   st->print_cr("                 -------------");
+ }
+=20
+--- =
hotspot/src/share/vm/gc_implementation/concurrentMarkSweep/concurrentMarkS=
weepGeneration.cpp.orig	2015-09-02 10:12:48.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/concurrentMarkSweep/concurrentMarkS=
weepGeneration.cpp	2015-09-02 10:39:26.000000000 +0200
+@@ -838,18 +838,18 @@
+   GenCollectedHeap* gch =3D GenCollectedHeap::heap();
+   if (PrintGCDetails) {
+     if (Verbose) {
+-      gclog_or_tty->print("[%d %s-%s: "SIZE_FORMAT"("SIZE_FORMAT")]",
++      gclog_or_tty->print("[%d %s-%s: " SIZE_FORMAT "(" SIZE_FORMAT =
")]",
+         level(), short_name(), s, used(), capacity());
+     } else {
+-      gclog_or_tty->print("[%d %s-%s: =
"SIZE_FORMAT"K("SIZE_FORMAT"K)]",
++      gclog_or_tty->print("[%d %s-%s: " SIZE_FORMAT "K(" SIZE_FORMAT =
"K)]",
+         level(), short_name(), s, used() / K, capacity() / K);
+     }
+   }
+   if (Verbose) {
+-    gclog_or_tty->print(" "SIZE_FORMAT"("SIZE_FORMAT")",
++    gclog_or_tty->print(" " SIZE_FORMAT "(" SIZE_FORMAT ")",
+               gch->used(), gch->capacity());
+   } else {
+-    gclog_or_tty->print(" "SIZE_FORMAT"K("SIZE_FORMAT"K)",
++    gclog_or_tty->print(" " SIZE_FORMAT "K(" SIZE_FORMAT "K)",
+               gch->used() / K, gch->capacity() / K);
+   }
+ }
+@@ -879,8 +879,8 @@
+   bool   res =3D (available >=3D av_promo) || (available >=3D =
max_promotion_in_bytes);
+   if (Verbose && PrintGCDetails) {
+     gclog_or_tty->print_cr(
+-      "CMS: promo attempt is%s safe: available("SIZE_FORMAT") %s =
av_promo("SIZE_FORMAT"),"
+-      "max_promo("SIZE_FORMAT")",
++      "CMS: promo attempt is%s safe: available(" SIZE_FORMAT ") %s =
av_promo(" SIZE_FORMAT "),"
++      "max_promo(" SIZE_FORMAT ")",
+       res? "":" not", available, res? ">=3D":"<",
+       av_promo, max_promotion_in_bytes);
+   }
+@@ -966,8 +966,8 @@
+         desired_free_percentage);
+       gclog_or_tty->print_cr("  Maximum free fraction %f",
+         maximum_free_percentage);
+-      gclog_or_tty->print_cr("  Capactiy "SIZE_FORMAT, =
capacity()/1000);
+-      gclog_or_tty->print_cr("  Desired capacity "SIZE_FORMAT,
++      gclog_or_tty->print_cr("  Capactiy " SIZE_FORMAT, =
capacity()/1000);
++      gclog_or_tty->print_cr("  Desired capacity " SIZE_FORMAT,
+         desired_capacity/1000);
+       int prev_level =3D level() - 1;
+       if (prev_level >=3D 0) {
+@@ -975,14 +975,14 @@
+         GenCollectedHeap* gch =3D GenCollectedHeap::heap();
+         Generation* prev_gen =3D gch->_gens[prev_level];
+         prev_size =3D prev_gen->capacity();
+-          gclog_or_tty->print_cr("  Younger gen size "SIZE_FORMAT,
++          gclog_or_tty->print_cr("  Younger gen size " SIZE_FORMAT,
+                                  prev_size/1000);
+       }
+-      gclog_or_tty->print_cr("  unsafe_max_alloc_nogc "SIZE_FORMAT,
++      gclog_or_tty->print_cr("  unsafe_max_alloc_nogc " SIZE_FORMAT,
+         unsafe_max_alloc_nogc()/1000);
+-      gclog_or_tty->print_cr("  contiguous available "SIZE_FORMAT,
++      gclog_or_tty->print_cr("  contiguous available " SIZE_FORMAT,
+         contiguous_available()/1000);
+-      gclog_or_tty->print_cr("  Expand by "SIZE_FORMAT" (bytes)",
++      gclog_or_tty->print_cr("  Expand by " SIZE_FORMAT " (bytes)",
+         expand_bytes);
+     }
+     // safe if expansion fails
+@@ -1513,8 +1513,8 @@
+     stats().print_on(gclog_or_tty);
+     gclog_or_tty->print_cr("time_until_cms_gen_full %3.7f",
+       stats().time_until_cms_gen_full());
+-    gclog_or_tty->print_cr("free=3D"SIZE_FORMAT, _cmsGen->free());
+-    gclog_or_tty->print_cr("contiguous_available=3D"SIZE_FORMAT,
++    gclog_or_tty->print_cr("free=3D" SIZE_FORMAT, _cmsGen->free());
++    gclog_or_tty->print_cr("contiguous_available=3D" SIZE_FORMAT,
+                            _cmsGen->contiguous_available());
+     gclog_or_tty->print_cr("promotion_rate=3D%g", =
stats().promotion_rate());
+     gclog_or_tty->print_cr("cms_allocation_rate=3D%g", =
stats().cms_allocation_rate());
+@@ -2792,7 +2792,7 @@
+     assert(_numObjectsPromoted =3D=3D 0, "check");
+     assert(_numWordsPromoted   =3D=3D 0, "check");
+     if (Verbose && PrintGC) {
+-      gclog_or_tty->print("Allocated "SIZE_FORMAT" objects, "
++      gclog_or_tty->print("Allocated " SIZE_FORMAT " objects, "
+                           SIZE_FORMAT" bytes concurrently",
+       _numObjectsAllocated, _numWordsAllocated*sizeof(HeapWord));
+     }
+@@ -2879,7 +2879,7 @@
+     assert(_numObjectsAllocated =3D=3D 0, "check");
+     assert(_numWordsAllocated =3D=3D 0, "check");
+     if (Verbose && PrintGC) {
+-      gclog_or_tty->print("Promoted "SIZE_FORMAT" objects, "
++      gclog_or_tty->print("Promoted " SIZE_FORMAT " objects, "
+                           SIZE_FORMAT" bytes",
+                  _numObjectsPromoted, =
_numWordsPromoted*sizeof(HeapWord));
+     }
+@@ -2890,7 +2890,7 @@
+   if (PrintGC && Verbose) {
+     // Call down the chain in contiguous_available needs the =
freelistLock
+     // so print this out before releasing the freeListLock.
+-    gclog_or_tty->print(" Contiguous available "SIZE_FORMAT" bytes ",
++    gclog_or_tty->print(" Contiguous available " SIZE_FORMAT " bytes =
",
+                         contiguous_available());
+   }
+ }
+@@ -2978,7 +2978,7 @@
+     HeapWord* addr =3D _marks->offsetToHeapWord(offset);
+     if (!_marks->isMarked(addr)) {
+       oop(addr)->print_on(gclog_or_tty);
+-      gclog_or_tty->print_cr(" ("INTPTR_FORMAT" should have been =
marked)", addr);
++      gclog_or_tty->print_cr(" (" INTPTR_FORMAT " should have been =
marked)", addr);
+       _failed =3D true;
+     }
+     return true;
+@@ -5037,7 +5037,7 @@
+=20
+   SpecializationStats::clear();
+   if (PrintGCDetails) {
+-    gclog_or_tty->print("[YG occupancy: "SIZE_FORMAT" K ("SIZE_FORMAT" =
K)]",
++    gclog_or_tty->print("[YG occupancy: " SIZE_FORMAT " K (" =
SIZE_FORMAT " K)]",
+                         _young_gen->used() / K,
+                         _young_gen->capacity() / K);
+   }
+@@ -5170,8 +5170,8 @@
+   if (ser_ovflw > 0) {
+     if (PrintCMSStatistics !=3D 0) {
+       gclog_or_tty->print_cr("Marking stack overflow (benign) "
+-        "(pmc_pc=3D"SIZE_FORMAT", pmc_rm=3D"SIZE_FORMAT", =
kac=3D"SIZE_FORMAT
+-        ", kac_preclean=3D"SIZE_FORMAT")",
++        "(pmc_pc=3D" SIZE_FORMAT ", pmc_rm=3D" SIZE_FORMAT ", kac=3D" =
SIZE_FORMAT
++        ", kac_preclean=3D" SIZE_FORMAT ")",
+         _ser_pmc_preclean_ovflw, _ser_pmc_remark_ovflw,
+         _ser_kac_ovflw, _ser_kac_preclean_ovflw);
+     }
+@@ -5184,7 +5184,7 @@
+   if (_par_pmc_remark_ovflw > 0 || _par_kac_ovflw > 0) {
+     if (PrintCMSStatistics !=3D 0) {
+       gclog_or_tty->print_cr("Work queue overflow (benign) "
+-        "(pmc_rm=3D"SIZE_FORMAT", kac=3D"SIZE_FORMAT")",
++        "(pmc_rm=3D" SIZE_FORMAT ", kac=3D" SIZE_FORMAT ")",
+         _par_pmc_remark_ovflw, _par_kac_ovflw);
+     }
+     _par_pmc_remark_ovflw =3D 0;
+@@ -5192,12 +5192,12 @@
+   }
+   if (PrintCMSStatistics !=3D 0) {
+      if (_markStack._hit_limit > 0) {
+-       gclog_or_tty->print_cr(" (benign) Hit max stack size limit =
("SIZE_FORMAT")",
++       gclog_or_tty->print_cr(" (benign) Hit max stack size limit (" =
SIZE_FORMAT ")",
+                               _markStack._hit_limit);
+      }
+      if (_markStack._failed_double > 0) {
+-       gclog_or_tty->print_cr(" (benign) Failed stack doubling =
("SIZE_FORMAT"),"
+-                              " current capacity "SIZE_FORMAT,
++       gclog_or_tty->print_cr(" (benign) Failed stack doubling (" =
SIZE_FORMAT "),"
++                              " current capacity " SIZE_FORMAT,
+                               _markStack._failed_double,
+                               _markStack.capacity());
+      }
+@@ -5961,7 +5961,7 @@
+                                                =
&markFromDirtyCardsClosure);
+       verify_work_stacks_empty();
+       if (PrintCMSStatistics !=3D 0) {
+-        gclog_or_tty->print(" (re-scanned "SIZE_FORMAT" dirty cards in =
cms gen) ",
++        gclog_or_tty->print(" (re-scanned " SIZE_FORMAT " dirty cards =
in cms gen) ",
+           markFromDirtyCardsClosure.num_dirty_cards());
+       }
+     }
+@@ -6892,7 +6892,7 @@
+   } else if (_failed_double++ =3D=3D 0 && !CMSConcurrentMTEnabled && =
PrintGCDetails) {
+     // Failed to double capacity, continue;
+     // we print a detail message only once per CMS cycle.
+-    gclog_or_tty->print(" (benign) Failed to expand marking stack from =
"SIZE_FORMAT"K to "
++    gclog_or_tty->print(" (benign) Failed to expand marking stack from =
" SIZE_FORMAT "K to "
+             SIZE_FORMAT"K",
+             _capacity / K, new_capacity / K);
+   }
+@@ -8215,25 +8215,25 @@
+     ShouldNotReachHere();
+   }
+   if (Verbose && PrintGC) {
+-    gclog_or_tty->print("Collected "SIZE_FORMAT" objects, " =
SIZE_FORMAT " bytes",
++    gclog_or_tty->print("Collected " SIZE_FORMAT " objects, " =
SIZE_FORMAT " bytes",
+                         _numObjectsFreed, =
_numWordsFreed*sizeof(HeapWord));
+-    gclog_or_tty->print_cr("\nLive "SIZE_FORMAT" objects,  "
++    gclog_or_tty->print_cr("\nLive " SIZE_FORMAT " objects,  "
+                            SIZE_FORMAT" bytes  "
+-      "Already free "SIZE_FORMAT" objects, "SIZE_FORMAT" bytes",
++      "Already free " SIZE_FORMAT " objects, " SIZE_FORMAT " bytes",
+       _numObjectsLive, _numWordsLive*sizeof(HeapWord),
+       _numObjectsAlreadyFree, _numWordsAlreadyFree*sizeof(HeapWord));
+     size_t totalBytes =3D (_numWordsFreed + _numWordsLive + =
_numWordsAlreadyFree)
+                         * sizeof(HeapWord);
+-    gclog_or_tty->print_cr("Total sweep: "SIZE_FORMAT" bytes", =
totalBytes);
++    gclog_or_tty->print_cr("Total sweep: " SIZE_FORMAT " bytes", =
totalBytes);
+=20
+     if (PrintCMSStatistics && CMSVerifyReturnedBytes) {
+       size_t indexListReturnedBytes =3D =
_sp->sumIndexedFreeListArrayReturnedBytes();
+       size_t dict_returned_bytes =3D =
_sp->dictionary()->sum_dict_returned_bytes();
+       size_t returned_bytes =3D indexListReturnedBytes + =
dict_returned_bytes;
+-      gclog_or_tty->print("Returned "SIZE_FORMAT" bytes", =
returned_bytes);
+-      gclog_or_tty->print("   Indexed List Returned "SIZE_FORMAT" =
bytes",
++      gclog_or_tty->print("Returned " SIZE_FORMAT " bytes", =
returned_bytes);
++      gclog_or_tty->print("   Indexed List Returned " SIZE_FORMAT " =
bytes",
+         indexListReturnedBytes);
+-      gclog_or_tty->print_cr("        Dictionary Returned =
"SIZE_FORMAT" bytes",
++      gclog_or_tty->print_cr("        Dictionary Returned " =
SIZE_FORMAT " bytes",
+         dict_returned_bytes);
+     }
+   }
+@@ -8312,13 +8312,13 @@
+     // coalesced chunk to the appropriate free list.
+     if (inFreeRange()) {
+       assert(freeFinger() >=3D _sp->bottom() && freeFinger() < _limit,
+-             err_msg("freeFinger() " PTR_FORMAT" is out-of-bounds", =
freeFinger()));
++             err_msg("freeFinger() " PTR_FORMAT " is out-of-bounds", =
freeFinger()));
+       flush_cur_free_chunk(freeFinger(),
+                            pointer_delta(addr, freeFinger()));
+       if (CMSTraceSweeper) {
+         gclog_or_tty->print("Sweep: last chunk: ");
+-        gclog_or_tty->print("put_free_blk 0x%x ("SIZE_FORMAT") "
+-                   "[coalesced:"SIZE_FORMAT"]\n",
++        gclog_or_tty->print("put_free_blk 0x%x (" SIZE_FORMAT ") "
++                   "[coalesced:" SIZE_FORMAT "]\n",
+                    freeFinger(), pointer_delta(addr, freeFinger()),
+                    lastFreeRangeCoalesced());
+       }
+--- hotspot/src/share/vm/classfile/dictionary.hpp.orig	2015-09-02 =
10:40:01.000000000 +0200
++++ hotspot/src/share/vm/classfile/dictionary.hpp	2015-09-02 =
10:40:32.000000000 +0200
+@@ -370,7 +370,7 @@
+=20
+   void print_on(outputStream* st) const {
+     symbol()->print_value_on(st);
+-    st->print("/mode=3D"INTX_FORMAT, symbol_mode());
++    st->print("/mode=3D" INTX_FORMAT, symbol_mode());
+     st->print(" -> ");
+     bool printed =3D false;
+     if (method() !=3D NULL) {
+--- hotspot/src/share/vm/compiler/disassembler.cpp.orig	=
2015-09-02 10:40:09.000000000 +0200
++++ hotspot/src/share/vm/compiler/disassembler.cpp	2015-09-02 =
10:41:33.000000000 +0200
+@@ -60,7 +60,7 @@
+ Disassembler::decode_func_virtual =
Disassembler::_decode_instructions_virtual =3D NULL;
+ Disassembler::decode_func Disassembler::_decode_instructions =3D NULL;
+=20
+-static const char hsdis_library_name[] =3D "hsdis-"HOTSPOT_LIB_ARCH;
++static const char hsdis_library_name[] =3D "hsdis-" HOTSPOT_LIB_ARCH;
+ static const char decode_instructions_virtual_name[] =3D =
"decode_instructions_virtual";
+ static const char decode_instructions_name[] =3D =
"decode_instructions";
+ static bool use_new_version =3D true;
+--- hotspot/src/share/vm/code/exceptionHandlerTable.cpp.orig	=
2015-09-02 10:44:06.000000000 +0200
++++ hotspot/src/share/vm/code/exceptionHandlerTable.cpp	=
2015-09-02 10:44:32.000000000 +0200
+@@ -186,7 +186,7 @@
+ void ImplicitExceptionTable::print(address base) const {
+   tty->print("{");
+   for( uint i=3D0; i<len(); i++ )
+-    tty->print("< "INTPTR_FORMAT", "INTPTR_FORMAT" > ",base + *adr(i), =
base + *(adr(i)+1));
++    tty->print("< " INTPTR_FORMAT ", " INTPTR_FORMAT " > ",base + =
*adr(i), base + *(adr(i)+1));
+   tty->print_cr("}");
+ }
+=20
+--- hotspot/src/share/vm/gc_implementation/g1/g1AllocRegion.cpp.orig	=
2015-09-02 10:47:14.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1AllocRegion.cpp	=
2015-09-02 10:47:49.000000000 +0200
+@@ -140,7 +140,7 @@
+ }
+=20
+ void G1AllocRegion::fill_in_ext_msg(ar_ext_msg* msg, const char* =
message) {
+-  msg->append("[%s] %s c: %u b: %s r: "PTR_FORMAT" u: "SIZE_FORMAT,
++  msg->append("[%s] %s c: %u b: %s r: " PTR_FORMAT " u: " SIZE_FORMAT,
+               _name, message, _count, BOOL_TO_STR(_bot_updates),
+               p2i(_alloc_region), _used_bytes_before);
+ }
+@@ -217,7 +217,7 @@
+=20
+     if (G1_ALLOC_REGION_TRACING > 1) {
+       if (result !=3D NULL) {
+-        jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT" =
"PTR_FORMAT,
++        jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT " " =
PTR_FORMAT,
+                      word_size, result);
+       } else if (word_size !=3D 0) {
+         jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT, =
word_size);
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.cpp.orig	=
2015-09-02 10:47:14.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.cpp	=
2015-09-02 10:53:32.000000000 +0200
+@@ -385,11 +385,11 @@
+     HeapWord* card_addr =3D _array->address_for_index(card);
+     HeapWord* block_start =3D block_start_const(card_addr);
+     if (block_start !=3D obj_start) {
+-      gclog_or_tty->print_cr("block start: "PTR_FORMAT" is incorrect - =
"
+-                             "card index: "SIZE_FORMAT" "
+-                             "card addr: "PTR_FORMAT" BOT entry: %u "
+-                             "obj: "PTR_FORMAT" word size: =
"SIZE_FORMAT" "
+-                             "cards: ["SIZE_FORMAT","SIZE_FORMAT"]",
++      gclog_or_tty->print_cr("block start: " PTR_FORMAT " is incorrect =
- "
++                             "card index: " SIZE_FORMAT " "
++                             "card addr: " PTR_FORMAT " BOT entry: %u =
"
++                             "obj: " PTR_FORMAT " word size: " =
SIZE_FORMAT " "
++                             "cards: [" SIZE_FORMAT "," SIZE_FORMAT =
"]",
+                              block_start, card, card_addr,
+                              _array->offset_array(card),
+                              obj_start, word_size, first_card, =
last_card);
+@@ -404,11 +404,11 @@
+ G1BlockOffsetArray::print_on(outputStream* out) {
+   size_t from_index =3D _array->index_for(_bottom);
+   size_t to_index =3D _array->index_for(_end);
+-  out->print_cr(">> BOT for area ["PTR_FORMAT","PTR_FORMAT") "
+-                "cards ["SIZE_FORMAT","SIZE_FORMAT")",
++  out->print_cr(">> BOT for area [" PTR_FORMAT "," PTR_FORMAT ") "
++                "cards [" SIZE_FORMAT "," SIZE_FORMAT ")",
+                 _bottom, _end, from_index, to_index);
+   for (size_t i =3D from_index; i < to_index; ++i) {
+-    out->print_cr("  entry "SIZE_FORMAT_W(8)" | "PTR_FORMAT" : %3u",
++    out->print_cr("  entry " SIZE_FORMAT_W(8) " | " PTR_FORMAT " : =
%3u",
+                   i, _array->address_for_index(i),
+                   (uint) _array->offset_array(i));
+   }
+@@ -488,7 +488,7 @@
+ void
+ G1BlockOffsetArrayContigSpace::print_on(outputStream* out) {
+   G1BlockOffsetArray::print_on(out);
+-  out->print_cr("  next offset threshold: "PTR_FORMAT, =
_next_offset_threshold);
+-  out->print_cr("  next offset index:     "SIZE_FORMAT, =
_next_offset_index);
++  out->print_cr("  next offset threshold: " PTR_FORMAT, =
_next_offset_threshold);
++  out->print_cr("  next offset index:     " SIZE_FORMAT, =
_next_offset_index);
+ }
+ #endif // !PRODUCT
+--- hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.cpp.orig	=
2015-09-02 10:47:15.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.cpp	=
2015-09-02 10:54:04.000000000 +0200
+@@ -44,7 +44,7 @@
+ void G1CardCounts::clear_range(size_t from_card_num, size_t =
to_card_num) {
+   if (has_count_table()) {
+     assert(from_card_num < to_card_num,
+-           err_msg("Wrong order? from: " SIZE_FORMAT ", to: =
"SIZE_FORMAT,
++           err_msg("Wrong order? from: " SIZE_FORMAT ", to: " =
SIZE_FORMAT,
+                    from_card_num, to_card_num));
+     Copy::fill_to_bytes(&_card_counts[from_card_num], (to_card_num - =
from_card_num));
+   }
+@@ -87,7 +87,7 @@
+   if (has_count_table()) {
+     size_t card_num =3D ptr_2_card_num(card_ptr);
+     assert(card_num < _reserved_max_card_num,
+-           err_msg("Card "SIZE_FORMAT" outside of card counts table =
(max size "SIZE_FORMAT")",
++           err_msg("Card " SIZE_FORMAT " outside of card counts table =
(max size " SIZE_FORMAT ")",
+                    card_num, _reserved_max_card_num));
+     count =3D (uint) _card_counts[card_num];
+     if (count < G1ConcRSHotCardLimit) {
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1CollectorPolicy.cpp.orig	=
2015-09-02 10:57:01.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1CollectorPolicy.cpp	=
2015-09-02 11:02:01.000000000 +0200
+@@ -199,7 +199,7 @@
+   const size_t region_size =3D HeapRegion::GrainWords;
+   if (YoungPLABSize > region_size || OldPLABSize > region_size) {
+     char buffer[128];
+-    jio_snprintf(buffer, sizeof(buffer), "%sPLABSize should be at most =
"SIZE_FORMAT,
++    jio_snprintf(buffer, sizeof(buffer), "%sPLABSize should be at most =
" SIZE_FORMAT,
+                  OldPLABSize > region_size ? "Old" : "Young", =
region_size);
+     vm_exit_during_initialization(buffer);
+   }
+@@ -846,7 +846,7 @@
+   update_survivors_policy();
+=20
+   assert(_g1->used() =3D=3D _g1->recalculate_used(),
+-         err_msg("sanity, used: "SIZE_FORMAT" recalculate_used: =
"SIZE_FORMAT,
++         err_msg("sanity, used: " SIZE_FORMAT " recalculate_used: " =
SIZE_FORMAT,
+                  _g1->used(), _g1->recalculate_used()));
+=20
+   double s_w_t_ms =3D (start_time_sec - _stop_world_start) * 1000.0;
+@@ -1231,10 +1231,10 @@
+     (_young_list_target_length * HeapRegion::GrainBytes) - =
survivor_used_bytes_after_gc;
+=20
+   gclog_or_tty->print(
+-    "   [Eden: =
"EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")->"EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")=
 "
+-    "Survivors: "EXT_SIZE_FORMAT"->"EXT_SIZE_FORMAT" "
+-    "Heap: "EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")->"
+-    EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")]",
++    "   [Eden: " EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")->" =
EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ") "
++    "Survivors: " EXT_SIZE_FORMAT "->" EXT_SIZE_FORMAT " "
++    "Heap: " EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")->"
++    EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")]",
+     EXT_SIZE_PARAMS(_eden_used_bytes_before_gc),
+     EXT_SIZE_PARAMS(_eden_capacity_bytes_before_gc),
+     EXT_SIZE_PARAMS(eden_used_bytes_after_gc),
+@@ -1863,7 +1863,7 @@
+   while (csr !=3D NULL) {
+     HeapRegion* next =3D csr->next_in_collection_set();
+     assert(csr->in_collection_set(), "bad CS");
+-    st->print_cr("  "HR_FORMAT", P: "PTR_FORMAT "N: "PTR_FORMAT", age: =
%4d",
++    st->print_cr("  " HR_FORMAT ", P: " PTR_FORMAT "N: " PTR_FORMAT ", =
age: %4d",
+                  HR_FORMAT_PARAMS(csr),
+                  csr->prev_top_at_mark_start(), =
csr->next_top_at_mark_start(),
+                  csr->age_in_surv_rate_group_cond());
+--- hotspot/src/share/vm/gc_implementation/g1/g1GCPhaseTimes.cpp.orig	=
2015-09-06 14:02:06.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1GCPhaseTimes.cpp	=
2015-09-10 13:33:10.594040691 +0200
+@@ -330,7 +330,7 @@
+ }
+=20
+ void G1GCPhaseTimes::print_stats(int level, const char* str, size_t =
value) {
+-  LineBuffer(level).append_and_print_cr("[%s: "SIZE_FORMAT"]", str, =
value);
++  LineBuffer(level).append_and_print_cr("[%s: " SIZE_FORMAT "]", str, =
value);
+ }
+=20
+ void G1GCPhaseTimes::print_stats(int level, const char* str, double =
value, uint workers) {
+@@ -450,7 +450,7 @@
+=20
+     if (phase->_thread_work_items !=3D NULL) {
+       LineBuffer buf2(phase->_thread_work_items->_indent_level);
+-      buf2.append_and_print_cr("[%s:  "SIZE_FORMAT"]", =
phase->_thread_work_items->_title, =
_phase_times->sum_thread_work_items(phase_id));
++      buf2.append_and_print_cr("[%s:  " SIZE_FORMAT "]", =
phase->_thread_work_items->_title, =
_phase_times->sum_thread_work_items(phase_id));
+     }
+   }
+=20
+--- hotspot/src/share/vm/gc_implementation/g1/g1HRPrinter.cpp.orig	=
2015-09-02 10:57:01.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1HRPrinter.cpp	=
2015-09-02 11:03:16.000000000 +0200
+@@ -84,18 +84,18 @@
+=20
+   if (type_str !=3D NULL) {
+     if (top !=3D NULL) {
+-      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) "PTR_FORMAT" =
"PTR_FORMAT,
++      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) " PTR_FORMAT " " =
PTR_FORMAT,
+                              action_str, type_str, bottom, top);
+     } else {
+-      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) "PTR_FORMAT,
++      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) " PTR_FORMAT,
+                              action_str, type_str, bottom);
+     }
+   } else {
+     if (top !=3D NULL) {
+-      gclog_or_tty->print_cr(G1HR_PREFIX" %s "PTR_FORMAT" "PTR_FORMAT,
++      gclog_or_tty->print_cr(G1HR_PREFIX" %s " PTR_FORMAT " " =
PTR_FORMAT,
+                              action_str, bottom, top);
+     } else {
+-      gclog_or_tty->print_cr(G1HR_PREFIX" %s "PTR_FORMAT,
++      gclog_or_tty->print_cr(G1HR_PREFIX" %s " PTR_FORMAT,
+                              action_str, bottom);
+     }
+   }
+@@ -104,11 +104,11 @@
+ void G1HRPrinter::print(ActionType action, HeapWord* bottom, HeapWord* =
end) {
+   const char* action_str =3D action_name(action);
+=20
+-  gclog_or_tty->print_cr(G1HR_PREFIX" %s ["PTR_FORMAT","PTR_FORMAT"]",
++  gclog_or_tty->print_cr(G1HR_PREFIX" %s [" PTR_FORMAT "," PTR_FORMAT =
"]",
+                          action_str, bottom, end);
+ }
+=20
+ void G1HRPrinter::print(PhaseType phase, size_t phase_num) {
+   const char* phase_str =3D phase_name(phase);
+-  gclog_or_tty->print_cr(G1HR_PREFIX" #%s "SIZE_FORMAT, phase_str, =
phase_num);
++  gclog_or_tty->print_cr(G1HR_PREFIX" #%s " SIZE_FORMAT, phase_str, =
phase_num);
+ }
+--- hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.cpp.orig	=
2015-09-06 14:02:06.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.cpp	=
2015-09-10 12:46:24.202030127 +0200
+@@ -230,7 +230,7 @@
+   HeapRegion* last =3D NULL;
+   while (curr !=3D NULL) {
+     if (!curr->is_young()) {
+-      gclog_or_tty->print_cr("### YOUNG REGION =
"PTR_FORMAT"-"PTR_FORMAT" "
++      gclog_or_tty->print_cr("### YOUNG REGION " PTR_FORMAT "-" =
PTR_FORMAT " "
+                              "incorrectly tagged (y: %d, surv: %d)",
+                              curr->bottom(), curr->end(),
+                              curr->is_young(), curr->is_survivor());
+@@ -359,7 +359,7 @@
+     if (curr =3D=3D NULL)
+       gclog_or_tty->print_cr("  empty");
+     while (curr !=3D NULL) {
+-      gclog_or_tty->print_cr("  "HR_FORMAT", P: "PTR_FORMAT ", N: =
"PTR_FORMAT", age: %4d",
++      gclog_or_tty->print_cr("  " HR_FORMAT ", P: " PTR_FORMAT ", N: " =
PTR_FORMAT ", age: %4d",
+                              HR_FORMAT_PARAMS(curr),
+                              curr->prev_top_at_mark_start(),
+                              curr->next_top_at_mark_start(),
+@@ -490,7 +490,7 @@
+   gclog_or_tty->print_cr("Log entries =3D %d, dirty cards =3D %d.",
+                          clear.num_processed(), orig_count);
+   guarantee(redirty.num_processed() =3D=3D clear.num_processed(),
+-            err_msg("Redirtied "SIZE_FORMAT" cards, bug cleared =
"SIZE_FORMAT,
++            err_msg("Redirtied " SIZE_FORMAT " cards, bug cleared " =
SIZE_FORMAT,
+                     redirty.num_processed(), clear.num_processed()));
+=20
+   CountNonCleanMemRegionClosure count3(this);
+@@ -528,7 +528,7 @@
+       HeapRegion* res =3D _hrm.allocate_free_region(is_old);
+       if (G1ConcRegionFreeingVerbose) {
+         gclog_or_tty->print_cr("G1ConcRegionFreeing [region alloc] : "
+-                               "allocated "HR_FORMAT" from =
secondary_free_list",
++                               "allocated " HR_FORMAT " from =
secondary_free_list",
+                                HR_FORMAT_PARAMS(res));
+       }
+       return res;
+@@ -1597,8 +1597,8 @@
+   // This assert only makes sense here, before we adjust them
+   // with respect to the min and max heap size.
+   assert(minimum_desired_capacity <=3D maximum_desired_capacity,
+-         err_msg("minimum_desired_capacity =3D "SIZE_FORMAT", "
+-                 "maximum_desired_capacity =3D "SIZE_FORMAT,
++         err_msg("minimum_desired_capacity =3D " SIZE_FORMAT ", "
++                 "maximum_desired_capacity =3D " SIZE_FORMAT,
+                  minimum_desired_capacity, maximum_desired_capacity));
+=20
+   // Should not be greater than the heap max size. No need to adjust
+@@ -2256,7 +2256,7 @@
+   virtual bool doHeapRegion(HeapRegion* hr) {
+     unsigned region_gc_time_stamp =3D hr->get_gc_time_stamp();
+     if (_gc_time_stamp !=3D region_gc_time_stamp) {
+-      gclog_or_tty->print_cr("Region "HR_FORMAT" has GC time stamp =3D =
%d, "
++      gclog_or_tty->print_cr("Region " HR_FORMAT " has GC time stamp =3D=
 %d, "
+                              "expected %d", HR_FORMAT_PARAMS(hr),
+                              region_gc_time_stamp, _gc_time_stamp);
+       _failures =3D true;
+@@ -2678,7 +2678,7 @@
+     } else if (r->continuesHumongous()) {
+       if (r->humongous_start_region() !=3D _sh_region) {
+         gclog_or_tty->print_cr("Region " HR_FORMAT ", "
+-                               "HS =3D "PTR_FORMAT", should be =
"PTR_FORMAT,
++                               "HS =3D " PTR_FORMAT ", should be " =
PTR_FORMAT,
+                                HR_FORMAT_PARAMS(r),
+                                r->humongous_start_region(),
+                                _sh_region);
+@@ -2990,10 +2990,10 @@
+     if (!oopDesc::is_null(heap_oop)) {
+       oop obj =3D oopDesc::decode_heap_oop_not_null(heap_oop);
+       if (_g1h->is_obj_dead_cond(obj, _vo)) {
+-        gclog_or_tty->print_cr("Root location "PTR_FORMAT" "
+-                              "points to dead obj "PTR_FORMAT, p, =
(void*) obj);
++        gclog_or_tty->print_cr("Root location " PTR_FORMAT " "
++                              "points to dead obj " PTR_FORMAT, p, =
(void*) obj);
+         if (_vo =3D=3D VerifyOption_G1UseMarkWord) {
+-          gclog_or_tty->print_cr("  Mark word: "PTR_FORMAT, =
(void*)(obj->mark()));
++          gclog_or_tty->print_cr("  Mark word: " PTR_FORMAT, =
(void*)(obj->mark()));
+         }
+         obj->print_on(gclog_or_tty);
+         _failures =3D true;
+@@ -3040,9 +3040,9 @@
+       // Verify that the strong code root list for this region
+       // contains the nmethod
+       if (!hrrs->strong_code_roots_list_contains(_nm)) {
+-        gclog_or_tty->print_cr("Code root location "PTR_FORMAT" "
+-                              "from nmethod "PTR_FORMAT" not in strong =
"
+-                              "code roots for region =
["PTR_FORMAT","PTR_FORMAT")",
++        gclog_or_tty->print_cr("Code root location " PTR_FORMAT " "
++                              "from nmethod " PTR_FORMAT " not in =
strong "
++                              "code roots for region [" PTR_FORMAT "," =
PTR_FORMAT ")",
+                               p, _nm, hr->bottom(), hr->end());
+         _failures =3D true;
+       }
+@@ -3172,7 +3172,7 @@
+     if (o !=3D NULL) {
+       HeapWord *start =3D (HeapWord *) o;
+       size_t word_sz =3D o->size();
+-      gclog_or_tty->print("\nPrinting obj "PTR_FORMAT" of size " =
SIZE_FORMAT
++      gclog_or_tty->print("\nPrinting obj " PTR_FORMAT " of size " =
SIZE_FORMAT
+                           " isMarkedPrev %d isMarkedNext %d =
isAllocSince %d\n",
+                           (void*) o, word_sz,
+                           _g1->isMarkedPrev(o),
+@@ -3183,7 +3183,7 @@
+       int *val;
+       for (cur =3D start; cur < end; cur++) {
+         val =3D (int *) cur;
+-        gclog_or_tty->print("\t "PTR_FORMAT":"PTR_FORMAT"\n", val, =
*val);
++        gclog_or_tty->print("\t " PTR_FORMAT ":" PTR_FORMAT "\n", val, =
*val);
+       }
+     }
+   }
+@@ -3218,9 +3218,9 @@
+         r->object_iterate(&not_dead_yet_cl);
+         if (_vo !=3D VerifyOption_G1UseNextMarking) {
+           if (r->max_live_bytes() < not_dead_yet_cl.live_bytes()) {
+-            gclog_or_tty->print_cr("["PTR_FORMAT","PTR_FORMAT"] "
+-                                   "max_live_bytes "SIZE_FORMAT" "
+-                                   "< calculated "SIZE_FORMAT,
++            gclog_or_tty->print_cr("[" PTR_FORMAT "," PTR_FORMAT "] "
++                                   "max_live_bytes " SIZE_FORMAT " "
++                                   "< calculated " SIZE_FORMAT,
+                                    r->bottom(), r->end(),
+                                    r->max_live_bytes(),
+                                  not_dead_yet_cl.live_bytes());
+@@ -3532,7 +3532,7 @@
+     size_t occupied =3D hrrs->occupied();
+     _occupied_sum +=3D occupied;
+=20
+-    gclog_or_tty->print_cr("Printing RSet for region "HR_FORMAT,
++    gclog_or_tty->print_cr("Printing RSet for region " HR_FORMAT,
+                            HR_FORMAT_PARAMS(r));
+     if (occupied =3D=3D 0) {
+       gclog_or_tty->print_cr("  RSet is empty");
+@@ -3551,7 +3551,7 @@
+   }
+=20
+   ~PrintRSetsClosure() {
+-    gclog_or_tty->print_cr("Occupied Sum: "SIZE_FORMAT, =
_occupied_sum);
++    gclog_or_tty->print_cr("Occupied Sum: " SIZE_FORMAT, =
_occupied_sum);
+     =
gclog_or_tty->print_cr("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D");
+     gclog_or_tty->cr();
+   }
+@@ -4372,7 +4372,7 @@
+ G1CollectedHeap::handle_evacuation_failure_par(G1ParScanThreadState* =
_par_scan_state,
+                                                oop old) {
+   assert(obj_in_cs(old),
+-         err_msg("obj: "PTR_FORMAT" should still be in the CSet",
++         err_msg("obj: " PTR_FORMAT " should still be in the CSet",
+                  (HeapWord*) old));
+   markOop m =3D old->mark();
+   oop forward_ptr =3D old->forward_to_atomic(old);
+@@ -4406,7 +4406,7 @@
+     // space for this object (old !=3D forward_ptr) or they beat us in
+     // self-forwarding it (old =3D=3D forward_ptr).
+     assert(old =3D=3D forward_ptr || !obj_in_cs(forward_ptr),
+-           err_msg("obj: "PTR_FORMAT" forwarded to: "PTR_FORMAT" "
++           err_msg("obj: " PTR_FORMAT " forwarded to: " PTR_FORMAT " "
+                    "should not be in the CSet",
+                    (HeapWord*) old, (HeapWord*) forward_ptr));
+     return forward_ptr;
+@@ -4793,16 +4793,16 @@
+=20
+   ~G1StringSymbolTableUnlinkTask() {
+     guarantee(!_process_strings || !_do_in_parallel || =
StringTable::parallel_claimed_index() >=3D _initial_string_table_size,
+-              err_msg("claim value "INT32_FORMAT" after unlink less =
than initial string table size "INT32_FORMAT,
++              err_msg("claim value " INT32_FORMAT " after unlink less =
than initial string table size " INT32_FORMAT,
+                       StringTable::parallel_claimed_index(), =
_initial_string_table_size));
+     guarantee(!_process_symbols || !_do_in_parallel || =
SymbolTable::parallel_claimed_index() >=3D _initial_symbol_table_size,
+-              err_msg("claim value "INT32_FORMAT" after unlink less =
than initial symbol table size "INT32_FORMAT,
++              err_msg("claim value " INT32_FORMAT " after unlink less =
than initial symbol table size " INT32_FORMAT,
+                       SymbolTable::parallel_claimed_index(), =
_initial_symbol_table_size));
+=20
+     if (G1TraceStringSymbolTableScrubbing) {
+       gclog_or_tty->print_cr("Cleaned string and symbol table, "
+-                             "strings: "SIZE_FORMAT" processed, =
"SIZE_FORMAT" removed, "
+-                             "symbols: "SIZE_FORMAT" processed, =
"SIZE_FORMAT" removed",
++                             "strings: " SIZE_FORMAT " processed, " =
SIZE_FORMAT " removed, "
++                             "symbols: " SIZE_FORMAT " processed, " =
SIZE_FORMAT " removed",
+                              strings_processed(), strings_removed(),
+                              symbols_processed(), symbols_removed());
+     }
+@@ -6001,13 +6001,13 @@
+ bool G1CollectedHeap::verify_no_bits_over_tams(const char* =
bitmap_name, CMBitMapRO* bitmap,
+                                                HeapWord* tams, =
HeapWord* end) {
+   guarantee(tams <=3D end,
+-            err_msg("tams: "PTR_FORMAT" end: "PTR_FORMAT, tams, end));
++            err_msg("tams: " PTR_FORMAT " end: " PTR_FORMAT, tams, =
end));
+   HeapWord* result =3D bitmap->getNextMarkedWordAddress(tams, end);
+   if (result < end) {
+     gclog_or_tty->cr();
+-    gclog_or_tty->print_cr("## wrong marked address on %s bitmap: =
"PTR_FORMAT,
++    gclog_or_tty->print_cr("## wrong marked address on %s bitmap: " =
PTR_FORMAT,
+                            bitmap_name, result);
+-    gclog_or_tty->print_cr("## %s tams: "PTR_FORMAT" end: "PTR_FORMAT,
++    gclog_or_tty->print_cr("## %s tams: " PTR_FORMAT " end: " =
PTR_FORMAT,
+                            bitmap_name, tams, end);
+     return false;
+   }
+@@ -6033,7 +6033,7 @@
+     res_n =3D verify_no_bits_over_tams("next", next_bitmap, ntams, =
end);
+   }
+   if (!res_p || !res_n) {
+-    gclog_or_tty->print_cr("#### Bitmap verification failed for =
"HR_FORMAT,
++    gclog_or_tty->print_cr("#### Bitmap verification failed for " =
HR_FORMAT,
+                            HR_FORMAT_PARAMS(hr));
+     gclog_or_tty->print_cr("#### Caller: %s", caller);
+     return false;
+@@ -6345,7 +6345,7 @@
+         !r->rem_set()->is_empty()) {
+=20
+       if (G1TraceEagerReclaimHumongousObjects) {
+-        gclog_or_tty->print_cr("Live humongous region %u size =
"SIZE_FORMAT" start "PTR_FORMAT" length "UINT32_FORMAT" with remset =
"SIZE_FORMAT" code roots "SIZE_FORMAT" is marked %d reclaim candidate %d =
type array %d",
++        gclog_or_tty->print_cr("Live humongous region %u size " =
SIZE_FORMAT " start " PTR_FORMAT " length " UINT32_FORMAT " with remset =
" SIZE_FORMAT " code roots " SIZE_FORMAT " is marked %d reclaim =
candidate %d type array %d",
+                                region_idx,
+                                obj->size()*HeapWordSize,
+                                r->bottom(),
+@@ -6367,7 +6367,7 @@
+                       r->bottom()));
+=20
+     if (G1TraceEagerReclaimHumongousObjects) {
+-      gclog_or_tty->print_cr("Dead humongous region %u size =
"SIZE_FORMAT" start "PTR_FORMAT" length "UINT32_FORMAT" with remset =
"SIZE_FORMAT" code roots "SIZE_FORMAT" is marked %d reclaim candidate %d =
type array %d",
++      gclog_or_tty->print_cr("Dead humongous region %u size " =
SIZE_FORMAT " start " PTR_FORMAT " length " UINT32_FORMAT " with remset =
" SIZE_FORMAT " code roots " SIZE_FORMAT " is marked %d reclaim =
candidate %d type array %d",
+                              region_idx,
+                              obj->size()*HeapWordSize,
+                              r->bottom(),
+@@ -6523,7 +6523,7 @@
+   NoYoungRegionsClosure() : _success(true) { }
+   bool doHeapRegion(HeapRegion* r) {
+     if (r->is_young()) {
+-      gclog_or_tty->print_cr("Region ["PTR_FORMAT", "PTR_FORMAT") =
tagged as young",
++      gclog_or_tty->print_cr("Region [" PTR_FORMAT ", " PTR_FORMAT ") =
tagged as young",
+                              r->bottom(), r->end());
+       _success =3D false;
+     }
+@@ -6652,7 +6652,7 @@
+   }
+   assert(_allocator->used_unlocked() =3D=3D recalculate_used(),
+          err_msg("inconsistent _allocator->used_unlocked(), "
+-                 "value: "SIZE_FORMAT" recalculated: "SIZE_FORMAT,
++                 "value: " SIZE_FORMAT " recalculated: " SIZE_FORMAT,
+                  _allocator->used_unlocked(), recalculate_used()));
+ }
+=20
+@@ -6873,8 +6873,8 @@
+       oop obj =3D oopDesc::decode_heap_oop_not_null(heap_oop);
+       HeapRegion* hr =3D _g1h->heap_region_containing(obj);
+       assert(!hr->continuesHumongous(),
+-             err_msg("trying to add code root "PTR_FORMAT" in =
continuation of humongous region "HR_FORMAT
+-                     " starting at "HR_FORMAT,
++             err_msg("trying to add code root " PTR_FORMAT " in =
continuation of humongous region " HR_FORMAT
++                     " starting at " HR_FORMAT,
+                      _nm, HR_FORMAT_PARAMS(hr), =
HR_FORMAT_PARAMS(hr->humongous_start_region())));
+=20
+       // HeapRegion::add_strong_code_root_locked() avoids adding =
duplicate entries.
+@@ -6900,8 +6900,8 @@
+       oop obj =3D oopDesc::decode_heap_oop_not_null(heap_oop);
+       HeapRegion* hr =3D _g1h->heap_region_containing(obj);
+       assert(!hr->continuesHumongous(),
+-             err_msg("trying to remove code root "PTR_FORMAT" in =
continuation of humongous region "HR_FORMAT
+-                     " starting at "HR_FORMAT,
++             err_msg("trying to remove code root " PTR_FORMAT " in =
continuation of humongous region " HR_FORMAT
++                     " starting at " HR_FORMAT,
+                      _nm, HR_FORMAT_PARAMS(hr), =
HR_FORMAT_PARAMS(hr->humongous_start_region())));
+=20
+       hr->remove_strong_code_root(_nm);
+--- hotspot/src/share/vm/gc_implementation/g1/g1RemSet.cpp.orig	=
2015-09-02 11:07:35.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1RemSet.cpp	=
2015-09-02 11:08:48.000000000 +0200
+@@ -475,7 +475,7 @@
+ bool G1RemSet::refine_card(jbyte* card_ptr, uint worker_i,
+                            bool check_for_refs_into_cset) {
+   assert(_g1->is_in_exact(_ct_bs->addr_for(card_ptr)),
+-         err_msg("Card at "PTR_FORMAT" index "SIZE_FORMAT" =
representing heap at "PTR_FORMAT" (%u) must be in committed heap",
++         err_msg("Card at " PTR_FORMAT " index " SIZE_FORMAT " =
representing heap at " PTR_FORMAT " (%u) must be in committed heap",
+                  p2i(card_ptr),
+                  _ct_bs->index_for(_ct_bs->addr_for(card_ptr)),
+                  _ct_bs->addr_for(card_ptr),
+--- hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp.orig	=
2015-09-02 11:13:52.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp	=
2015-09-02 11:15:30.000000000 +0200
+@@ -187,22 +187,22 @@
+   size_t code_root_elems() const { return _code_root_elems; }
+=20
+   void print_rs_mem_info_on(outputStream * out, size_t total) {
+-    out->print_cr("    "SIZE_FORMAT_W(8)"K (%5.1f%%) by "SIZE_FORMAT" =
%s regions",
++    out->print_cr("    " SIZE_FORMAT_W(8) "K (%5.1f%%) by " =
SIZE_FORMAT " %s regions",
+         round_to_K(rs_mem_size()), rs_mem_size_percent_of(total), =
amount(), _name);
+   }
+=20
+   void print_cards_occupied_info_on(outputStream * out, size_t total) =
{
+-    out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) entries by =
"SIZE_FORMAT" %s regions",
++    out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) entries by " =
SIZE_FORMAT " %s regions",
+         cards_occupied(), cards_occupied_percent_of(total), amount(), =
_name);
+   }
+=20
+   void print_code_root_mem_info_on(outputStream * out, size_t total) {
+-    out->print_cr("    "SIZE_FORMAT_W(8)"K (%5.1f%%) by "SIZE_FORMAT" =
%s regions",
++    out->print_cr("    " SIZE_FORMAT_W(8) "K (%5.1f%%) by " =
SIZE_FORMAT " %s regions",
+         round_to_K(code_root_mem_size()), =
code_root_mem_size_percent_of(total), amount(), _name);
+   }
+=20
+   void print_code_root_elems_info_on(outputStream * out, size_t total) =
{
+-    out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) elements by =
"SIZE_FORMAT" %s regions",
++    out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) elements by " =
SIZE_FORMAT " %s regions",
+         code_root_elems(), code_root_elems_percent_of(total), =
amount(), _name);
+   }
+ };
+@@ -280,19 +280,19 @@
+     RegionTypeCounter* counters[] =3D { &_young, &_humonguous, &_free, =
&_old, NULL };
+=20
+     out->print_cr("\n Current rem set statistics");
+-    out->print_cr("  Total per region rem sets sizes =3D =
"SIZE_FORMAT"K."
+-                  " Max =3D "SIZE_FORMAT"K.",
++    out->print_cr("  Total per region rem sets sizes =3D " SIZE_FORMAT =
"K."
++                  " Max =3D " SIZE_FORMAT "K.",
+                   round_to_K(total_rs_mem_sz()), =
round_to_K(max_rs_mem_sz()));
+     for (RegionTypeCounter** current =3D &counters[0]; *current !=3D =
NULL; current++) {
+       (*current)->print_rs_mem_info_on(out, total_rs_mem_sz());
+     }
+=20
+-    out->print_cr("   Static structures =3D "SIZE_FORMAT"K,"
+-                  " free_lists =3D "SIZE_FORMAT"K.",
++    out->print_cr("   Static structures =3D " SIZE_FORMAT "K,"
++                  " free_lists =3D " SIZE_FORMAT "K.",
+                   round_to_K(HeapRegionRemSet::static_mem_size()),
+                   round_to_K(HeapRegionRemSet::fl_mem_size()));
+=20
+-    out->print_cr("    "SIZE_FORMAT" occupied cards represented.",
++    out->print_cr("    " SIZE_FORMAT " occupied cards represented.",
+                   total_cards_occupied());
+     for (RegionTypeCounter** current =3D &counters[0]; *current !=3D =
NULL; current++) {
+       (*current)->print_cards_occupied_info_on(out, =
total_cards_occupied());
+@@ -301,29 +301,29 @@
+     // Largest sized rem set region statistics
+     HeapRegionRemSet* rem_set =3D max_rs_mem_sz_region()->rem_set();
+     out->print_cr("    Region with largest rem set =3D "HR_FORMAT", "
+-                  "size =3D "SIZE_FORMAT "K, occupied =3D =
"SIZE_FORMAT"K.",
++                  "size =3D " SIZE_FORMAT "K, occupied =3D " =
SIZE_FORMAT "K.",
+                   HR_FORMAT_PARAMS(max_rs_mem_sz_region()),
+                   round_to_K(rem_set->mem_size()),
+                   round_to_K(rem_set->occupied()));
+=20
+     // Strong code root statistics
+     HeapRegionRemSet* max_code_root_rem_set =3D =
max_code_root_mem_sz_region()->rem_set();
+-    out->print_cr("  Total heap region code root sets sizes =3D =
"SIZE_FORMAT"K."
+-                  "  Max =3D "SIZE_FORMAT"K.",
++    out->print_cr("  Total heap region code root sets sizes =3D " =
SIZE_FORMAT "K."
++                  "  Max =3D " SIZE_FORMAT "K.",
+                   round_to_K(total_code_root_mem_sz()),
+                   =
round_to_K(max_code_root_rem_set->strong_code_roots_mem_size()));
+     for (RegionTypeCounter** current =3D &counters[0]; *current !=3D =
NULL; current++) {
+       (*current)->print_code_root_mem_info_on(out, =
total_code_root_mem_sz());
+     }
+=20
+-    out->print_cr("    "SIZE_FORMAT" code roots represented.",
++    out->print_cr("    " SIZE_FORMAT " code roots represented.",
+                   total_code_root_elems());
+     for (RegionTypeCounter** current =3D &counters[0]; *current !=3D =
NULL; current++) {
+       (*current)->print_code_root_elems_info_on(out, =
total_code_root_elems());
+     }
+=20
+-    out->print_cr("    Region with largest amount of code roots =3D =
"HR_FORMAT", "
+-                  "size =3D "SIZE_FORMAT "K, num_elems =3D =
"SIZE_FORMAT".",
++    out->print_cr("    Region with largest amount of code roots =3D " =
HR_FORMAT ", "
++                  "size =3D " SIZE_FORMAT "K, num_elems =3D " =
SIZE_FORMAT ".",
+                   HR_FORMAT_PARAMS(max_code_root_mem_sz_region()),
+                   =
round_to_K(max_code_root_rem_set->strong_code_roots_mem_size()),
+                   =
round_to_K(max_code_root_rem_set->strong_code_roots_list_length()));
+@@ -332,16 +332,16 @@
+=20
+ void G1RemSetSummary::print_on(outputStream* out) {
+   out->print_cr("\n Recent concurrent refinement statistics");
+-  out->print_cr("  Processed "SIZE_FORMAT" cards",
++  out->print_cr("  Processed " SIZE_FORMAT " cards",
+                 num_concurrent_refined_cards());
+-  out->print_cr("  Of "SIZE_FORMAT" completed buffers:", =
num_processed_buf_total());
+-  out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) by concurrent RS =
threads.",
++  out->print_cr("  Of " SIZE_FORMAT " completed buffers:", =
num_processed_buf_total());
++  out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) by concurrent RS =
threads.",
+                 num_processed_buf_total(),
+                 percent_of(num_processed_buf_rs_threads(), =
num_processed_buf_total()));
+-  out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) by mutator =
threads.",
++  out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) by mutator =
threads.",
+                 num_processed_buf_mutator(),
+                 percent_of(num_processed_buf_mutator(), =
num_processed_buf_total()));
+-  out->print_cr("  Did "SIZE_FORMAT" coarsenings.", =
num_coarsenings());
++  out->print_cr("  Did " SIZE_FORMAT " coarsenings.", =
num_coarsenings());
+   out->print_cr("  Concurrent RS threads times (s)");
+   out->print("     ");
+   for (uint i =3D 0; i < _num_vtimes; i++) {
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1StringDedupQueue.cpp.orig	=
2015-09-02 11:13:52.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupQueue.cpp	=
2015-09-02 11:15:44.000000000 +0200
+@@ -151,7 +151,7 @@
+ void G1StringDedupQueue::print_statistics(outputStream* st) {
+   st->print_cr(
+     "   [Queue]\n"
+-    "      [Dropped: "UINTX_FORMAT"]", _queue->_dropped);
++    "      [Dropped: " UINTX_FORMAT "]", _queue->_dropped);
+ }
+=20
+ void G1StringDedupQueue::verify() {
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1StringDedupStat.cpp.orig	=
2015-09-02 11:13:52.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupStat.cpp	=
2015-09-02 11:18:07.000000000 +0200
+@@ -80,8 +80,8 @@
+   st->stamp(PrintGCTimeStamps);
+   st->print_cr(
+     "[GC concurrent-string-deduplication, "
+-    =
G1_STRDEDUP_BYTES_FORMAT_NS"->"G1_STRDEDUP_BYTES_FORMAT_NS"("G1_STRDEDUP_B=
YTES_FORMAT_NS"), avg "
+-    G1_STRDEDUP_PERCENT_FORMAT_NS", "G1_STRDEDUP_TIME_FORMAT"]",
++    G1_STRDEDUP_BYTES_FORMAT_NS "->" G1_STRDEDUP_BYTES_FORMAT_NS "(" =
G1_STRDEDUP_BYTES_FORMAT_NS "), avg "
++    G1_STRDEDUP_PERCENT_FORMAT_NS ", " G1_STRDEDUP_TIME_FORMAT "]",
+     G1_STRDEDUP_BYTES_PARAM(last_stat._new_bytes),
+     G1_STRDEDUP_BYTES_PARAM(last_stat._new_bytes - =
last_stat._deduped_bytes),
+     G1_STRDEDUP_BYTES_PARAM(last_stat._deduped_bytes),
+@@ -135,22 +135,22 @@
+=20
+   if (total) {
+     st->print_cr(
+-      "   [Total Exec: "UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT", Idle: =
"UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT", Blocked: =
"UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT"]",
++      "   [Total Exec: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT ", =
Idle: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT ", Blocked: " =
UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT "]",
+       stat._exec, stat._exec_elapsed, stat._idle, stat._idle_elapsed, =
stat._block, stat._block_elapsed);
+   } else {
+     st->print_cr(
+-      "   [Last Exec: "G1_STRDEDUP_TIME_FORMAT", Idle: =
"G1_STRDEDUP_TIME_FORMAT", Blocked: =
"UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT"]",
++      "   [Last Exec: " G1_STRDEDUP_TIME_FORMAT ", Idle: " =
G1_STRDEDUP_TIME_FORMAT ", Blocked: " UINTX_FORMAT "/" =
G1_STRDEDUP_TIME_FORMAT "]",
+       stat._exec_elapsed, stat._idle_elapsed, stat._block, =
stat._block_elapsed);
+   }
+   st->print_cr(
+-    "      [Inspected:    "G1_STRDEDUP_OBJECTS_FORMAT"]\n"
+-    "         [Skipped:   =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
+-    "         [Hashed:    =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
+-    "         [Known:     =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
+-    "         [New:       =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") =
"G1_STRDEDUP_BYTES_FORMAT"]\n"
+-    "      [Deduplicated: =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") =
"G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
+-    "         [Young:     =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") =
"G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
+-    "         [Old:       =
"G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") =
"G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]",
++    "      [Inspected:    " G1_STRDEDUP_OBJECTS_FORMAT "]\n"
++    "         [Skipped:   " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]\n"
++    "         [Hashed:    " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]\n"
++    "         [Known:     " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]\n"
++    "         [New:       " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "]\n"
++    "      [Deduplicated: " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]\n"
++    "         [Young:     " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]\n"
++    "         [Old:       " G1_STRDEDUP_OBJECTS_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" =
G1_STRDEDUP_PERCENT_FORMAT ")]",
+     stat._inspected,
+     stat._skipped, skipped_percent,
+     stat._hashed, hashed_percent,
+--- hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp.orig	=
2015-09-02 12:36:40.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp	=
2015-09-02 12:37:19.000000000 +0200
+@@ -300,7 +300,7 @@
+=20
+     // Largest sized rem set region statistics
+     HeapRegionRemSet* rem_set =3D max_rs_mem_sz_region()->rem_set();
+-    out->print_cr("    Region with largest rem set =3D "HR_FORMAT", "
++    out->print_cr("    Region with largest rem set =3D " HR_FORMAT ", =
"
+                   "size =3D " SIZE_FORMAT "K, occupied =3D " =
SIZE_FORMAT "K.",
+                   HR_FORMAT_PARAMS(max_rs_mem_sz_region()),
+                   round_to_K(rem_set->mem_size()),
+--- =
hotspot/src/share/vm/gc_implementation/g1/g1StringDedupTable.cpp.orig	=
2015-09-02 12:36:40.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupTable.cpp	=
2015-09-02 12:41:56.000000000 +0200
+@@ -554,12 +554,12 @@
+ void G1StringDedupTable::print_statistics(outputStream* st) {
+   st->print_cr(
+     "   [Table]\n"
+-    "      [Memory Usage: "G1_STRDEDUP_BYTES_FORMAT_NS"]\n"
+-    "      [Size: "SIZE_FORMAT", Min: "SIZE_FORMAT", Max: =
"SIZE_FORMAT"]\n"
+-    "      [Entries: "UINTX_FORMAT", Load: =
"G1_STRDEDUP_PERCENT_FORMAT_NS", Cached: " UINTX_FORMAT ", Added: =
"UINTX_FORMAT", Removed: "UINTX_FORMAT"]\n"
+-    "      [Resize Count: "UINTX_FORMAT", Shrink Threshold: =
"UINTX_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT_NS"), Grow Threshold: =
"UINTX_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT_NS")]\n"
+-    "      [Rehash Count: "UINTX_FORMAT", Rehash Threshold: =
"UINTX_FORMAT", Hash Seed: 0x%x]\n"
+-    "      [Age Threshold: "UINTX_FORMAT"]",
++    "      [Memory Usage: " G1_STRDEDUP_BYTES_FORMAT_NS "]\n"
++    "      [Size: " SIZE_FORMAT ", Min: " SIZE_FORMAT ", Max: " =
SIZE_FORMAT "]\n"
++    "      [Entries: " UINTX_FORMAT ", Load: " =
G1_STRDEDUP_PERCENT_FORMAT_NS ", Cached: " UINTX_FORMAT ", Added: " =
UINTX_FORMAT ", Removed: " UINTX_FORMAT "]\n"
++    "      [Resize Count: " UINTX_FORMAT ", Shrink Threshold: " =
UINTX_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT_NS "), Grow Threshold: " =
UINTX_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT_NS ")]\n"
++    "      [Rehash Count: " UINTX_FORMAT ", Rehash Threshold: " =
UINTX_FORMAT ", Hash Seed: 0x%x]\n"
++    "      [Age Threshold: " UINTX_FORMAT "]",
+     G1_STRDEDUP_BYTES_PARAM(_table->_size * =
sizeof(G1StringDedupEntry*) + (_table->_entries + _entry_cache->size()) =
* sizeof(G1StringDedupEntry)),
+     _table->_size, _min_size, _max_size,
+     _table->_entries, (double)_table->_entries / (double)_table->_size =
* 100.0, _entry_cache->size(), _entries_added, _entries_removed,
+--- hotspot/src/share/vm/memory/genCollectedHeap.cpp.orig	=
2015-09-02 12:51:37.000000000 +0200
++++ hotspot/src/share/vm/memory/genCollectedHeap.cpp	2015-09-02 =
12:52:12.000000000 +0200
+@@ -1315,7 +1315,7 @@
+   // back a time later than 'now'.
+   jlong retVal =3D now - tolgc_cl.time();
+   if (retVal < 0) {
+-    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, (int64_t) retVal);)
++    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, (int64_t) =
retVal);)
+     return 0;
+   }
+   return retVal;
+--- hotspot/src/share/vm/memory/generation.cpp.orig	2015-09-02 =
12:51:38.000000000 +0200
++++ hotspot/src/share/vm/memory/generation.cpp	2015-09-02 =
12:52:33.000000000 +0200
+@@ -187,7 +187,7 @@
+   bool   res =3D (available >=3D max_promotion_in_bytes);
+   if (PrintGC && Verbose) {
+     gclog_or_tty->print_cr(
+-      "Generation: promo attempt is%s safe: available("SIZE_FORMAT") =
%s max_promo("SIZE_FORMAT")",
++      "Generation: promo attempt is%s safe: available(" SIZE_FORMAT ") =
%s max_promo(" SIZE_FORMAT ")",
+       res? "":" not", available, res? ">=3D":"<",
+       max_promotion_in_bytes);
+   }
+--- hotspot/src/share/vm/gc_implementation/g1/heapRegion.cpp.orig	=
2015-09-02 12:57:25.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.cpp	=
2015-09-02 13:00:29.000000000 +0200
+@@ -371,7 +371,7 @@
+                                                   bool =
during_conc_mark,
+                                                   size_t marked_bytes) =
{
+   assert(0 <=3D marked_bytes && marked_bytes <=3D used(),
+-         err_msg("marked: "SIZE_FORMAT" used: "SIZE_FORMAT,
++         err_msg("marked: " SIZE_FORMAT " used: " SIZE_FORMAT,
+                  marked_bytes, used()));
+   _prev_top_at_mark_start =3D top();
+   _prev_marked_bytes =3D marked_bytes;
+@@ -559,9 +559,9 @@
+         // Object is in the region. Check that its less than top
+         if (_hr->top() <=3D (HeapWord*)obj) {
+           // Object is above top
+-          gclog_or_tty->print_cr("Object "PTR_FORMAT" in region "
+-                                 "["PTR_FORMAT", "PTR_FORMAT") is =
above "
+-                                 "top "PTR_FORMAT,
++          gclog_or_tty->print_cr("Object " PTR_FORMAT " in region "
++                                 "[" PTR_FORMAT ", " PTR_FORMAT ") is =
above "
++                                 "top " PTR_FORMAT,
+                                  (void *)obj, _hr->bottom(), =
_hr->end(), _hr->top());
+           _failures =3D true;
+           return;
+@@ -595,22 +595,22 @@
+     if (nm !=3D NULL) {
+       // Verify that the nemthod is live
+       if (!nm->is_alive()) {
+-        gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] has =
dead nmethod "
+-                               PTR_FORMAT" in its strong code roots",
++        gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] =
has dead nmethod "
++                               PTR_FORMAT " in its strong code roots",
+                                _hr->bottom(), _hr->end(), nm);
+         _failures =3D true;
+       } else {
+         VerifyStrongCodeRootOopClosure oop_cl(_hr, nm);
+         nm->oops_do(&oop_cl);
+         if (!oop_cl.has_oops_in_region()) {
+-          gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] =
has nmethod "
+-                                 PTR_FORMAT" in its strong code roots =
"
++          gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT =
"] has nmethod "
++                                 PTR_FORMAT " in its strong code roots =
"
+                                  "with no pointers into region",
+                                  _hr->bottom(), _hr->end(), nm);
+           _failures =3D true;
+         } else if (oop_cl.failures()) {
+-          gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] =
has other "
+-                                 "failures for nmethod "PTR_FORMAT,
++          gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT =
"] has other "
++                                 "failures for nmethod " PTR_FORMAT,
+                                  _hr->bottom(), _hr->end(), nm);
+           _failures =3D true;
+         }
+@@ -644,8 +644,8 @@
+   // on its strong code root list
+   if (is_empty()) {
+     if (strong_code_roots_length > 0) {
+-      gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] is =
empty "
+-                             "but has "SIZE_FORMAT" code root =
entries",
++      gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] =
is empty "
++                             "but has " SIZE_FORMAT " code root =
entries",
+                              bottom(), end(), =
strong_code_roots_length);
+       *failures =3D true;
+     }
+@@ -654,8 +654,8 @@
+=20
+   if (continuesHumongous()) {
+     if (strong_code_roots_length > 0) {
+-      gclog_or_tty->print_cr("region "HR_FORMAT" is a continuation of =
a humongous "
+-                             "region but has "SIZE_FORMAT" code root =
entries",
++      gclog_or_tty->print_cr("region " HR_FORMAT " is a continuation =
of a humongous "
++                             "region but has " SIZE_FORMAT " code root =
entries",
+                              HR_FORMAT_PARAMS(this), =
strong_code_roots_length);
+       *failures =3D true;
+     }
+@@ -679,7 +679,7 @@
+   else
+     st->print("   ");
+   st->print(" TS %5d", _gc_time_stamp);
+-  st->print(" PTAMS "PTR_FORMAT" NTAMS "PTR_FORMAT,
++  st->print(" PTAMS " PTR_FORMAT " NTAMS " PTR_FORMAT,
+             prev_top_at_mark_start(), next_top_at_mark_start());
+   G1OffsetTableContigSpace::print_on(st);
+ }
+@@ -744,25 +744,25 @@
+         }
+         if (!_g1h->is_in_closed_subset(obj)) {
+           HeapRegion* from =3D =
_g1h->heap_region_containing((HeapWord*)p);
+-          gclog_or_tty->print_cr("Field "PTR_FORMAT
+-                                 " of live obj "PTR_FORMAT" in region =
"
+-                                 "["PTR_FORMAT", "PTR_FORMAT")",
++          gclog_or_tty->print_cr("Field " PTR_FORMAT
++                                 " of live obj " PTR_FORMAT " in =
region "
++                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
+                                  p, (void*) _containing_obj,
+                                  from->bottom(), from->end());
+           print_object(gclog_or_tty, _containing_obj);
+-          gclog_or_tty->print_cr("points to obj "PTR_FORMAT" not in =
the heap",
++          gclog_or_tty->print_cr("points to obj " PTR_FORMAT " not in =
the heap",
+                                  (void*) obj);
+         } else {
+           HeapRegion* from =3D =
_g1h->heap_region_containing((HeapWord*)p);
+           HeapRegion* to   =3D =
_g1h->heap_region_containing((HeapWord*)obj);
+-          gclog_or_tty->print_cr("Field "PTR_FORMAT
+-                                 " of live obj "PTR_FORMAT" in region =
"
+-                                 "["PTR_FORMAT", "PTR_FORMAT")",
++          gclog_or_tty->print_cr("Field " PTR_FORMAT
++                                 " of live obj " PTR_FORMAT " in =
region "
++                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
+                                  p, (void*) _containing_obj,
+                                  from->bottom(), from->end());
+           print_object(gclog_or_tty, _containing_obj);
+-          gclog_or_tty->print_cr("points to dead obj "PTR_FORMAT" in =
region "
+-                                 "["PTR_FORMAT", "PTR_FORMAT")",
++          gclog_or_tty->print_cr("points to dead obj " PTR_FORMAT " in =
region "
++                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
+                                  (void*) obj, to->bottom(), =
to->end());
+           print_object(gclog_or_tty, obj);
+         }
+@@ -798,14 +798,14 @@
+               gclog_or_tty->print_cr("----------");
+             }
+             gclog_or_tty->print_cr("Missing rem set entry:");
+-            gclog_or_tty->print_cr("Field "PTR_FORMAT" "
+-                                   "of obj "PTR_FORMAT", "
+-                                   "in region "HR_FORMAT,
++            gclog_or_tty->print_cr("Field " PTR_FORMAT " "
++                                   "of obj " PTR_FORMAT ", "
++                                   "in region " HR_FORMAT,
+                                    p, (void*) _containing_obj,
+                                    HR_FORMAT_PARAMS(from));
+             _containing_obj->print_on(gclog_or_tty);
+-            gclog_or_tty->print_cr("points to obj "PTR_FORMAT" "
+-                                   "in region "HR_FORMAT,
++            gclog_or_tty->print_cr("points to obj " PTR_FORMAT " "
++                                   "in region " HR_FORMAT,
+                                    (void*) obj,
+                                    HR_FORMAT_PARAMS(to));
+             obj->print_on(gclog_or_tty);
+@@ -842,8 +842,8 @@
+=20
+     if (is_humongous !=3D g1->isHumongous(obj_size) &&
+         !g1->is_obj_dead(obj, this)) { // Dead objects may have bigger =
block_size since they span several objects.
+-      gclog_or_tty->print_cr("obj "PTR_FORMAT" is of %shumongous size =
("
+-                             SIZE_FORMAT" words) in a %shumongous =
region",
++      gclog_or_tty->print_cr("obj " PTR_FORMAT " is of %shumongous =
size ("
++                             SIZE_FORMAT " words) in a %shumongous =
region",
+                              p, g1->isHumongous(obj_size) ? "" : =
"non-",
+                              obj_size, is_humongous ? "" : "non-");
+        *failures =3D true;
+@@ -866,12 +866,12 @@
+                                    (vo =3D=3D =
VerifyOption_G1UsePrevMarking &&
+                                    =
ClassLoaderDataGraph::unload_list_contains(klass));
+         if (!is_metaspace_object) {
+-          gclog_or_tty->print_cr("klass "PTR_FORMAT" of object =
"PTR_FORMAT" "
++          gclog_or_tty->print_cr("klass " PTR_FORMAT " of object " =
PTR_FORMAT " "
+                                  "not metadata", klass, (void *)obj);
+           *failures =3D true;
+           return;
+         } else if (!klass->is_klass()) {
+-          gclog_or_tty->print_cr("klass "PTR_FORMAT" of object =
"PTR_FORMAT" "
++          gclog_or_tty->print_cr("klass " PTR_FORMAT " of object " =
PTR_FORMAT " "
+                                  "not a klass", klass, (void *)obj);
+           *failures =3D true;
+           return;
+@@ -887,7 +887,7 @@
+           }
+         }
+       } else {
+-        gclog_or_tty->print_cr(PTR_FORMAT" no an oop", (void *)obj);
++        gclog_or_tty->print_cr(PTR_FORMAT " no an oop", (void *)obj);
+         *failures =3D true;
+         return;
+       }
+@@ -897,8 +897,8 @@
+   }
+=20
+   if (p !=3D top()) {
+-    gclog_or_tty->print_cr("end of last object "PTR_FORMAT" "
+-                           "does not match top "PTR_FORMAT, p, top());
++    gclog_or_tty->print_cr("end of last object " PTR_FORMAT " "
++                           "does not match top " PTR_FORMAT, p, =
top());
+     *failures =3D true;
+     return;
+   }
+@@ -913,8 +913,8 @@
+     HeapWord* addr_1 =3D p;
+     HeapWord* b_start_1 =3D _offsets.block_start_const(addr_1);
+     if (b_start_1 !=3D p) {
+-      gclog_or_tty->print_cr("BOT look up for top: "PTR_FORMAT" "
+-                             " yielded "PTR_FORMAT", expecting =
"PTR_FORMAT,
++      gclog_or_tty->print_cr("BOT look up for top: " PTR_FORMAT " "
++                             " yielded " PTR_FORMAT ", expecting " =
PTR_FORMAT,
+                              addr_1, b_start_1, p);
+       *failures =3D true;
+       return;
+@@ -925,8 +925,8 @@
+     if (addr_2 < the_end) {
+       HeapWord* b_start_2 =3D _offsets.block_start_const(addr_2);
+       if (b_start_2 !=3D p) {
+-        gclog_or_tty->print_cr("BOT look up for top + 1: "PTR_FORMAT" =
"
+-                               " yielded "PTR_FORMAT", expecting =
"PTR_FORMAT,
++        gclog_or_tty->print_cr("BOT look up for top + 1: " PTR_FORMAT =
" "
++                               " yielded " PTR_FORMAT ", expecting " =
PTR_FORMAT,
+                                addr_2, b_start_2, p);
+         *failures =3D true;
+         return;
+@@ -939,8 +939,8 @@
+     if (addr_3 < the_end) {
+       HeapWord* b_start_3 =3D _offsets.block_start_const(addr_3);
+       if (b_start_3 !=3D p) {
+-        gclog_or_tty->print_cr("BOT look up for top + diff: =
"PTR_FORMAT" "
+-                               " yielded "PTR_FORMAT", expecting =
"PTR_FORMAT,
++        gclog_or_tty->print_cr("BOT look up for top + diff: " =
PTR_FORMAT " "
++                               " yielded " PTR_FORMAT ", expecting " =
PTR_FORMAT,
+                                addr_3, b_start_3, p);
+         *failures =3D true;
+         return;
+@@ -951,8 +951,8 @@
+     HeapWord* addr_4 =3D the_end - 1;
+     HeapWord* b_start_4 =3D _offsets.block_start_const(addr_4);
+     if (b_start_4 !=3D p) {
+-      gclog_or_tty->print_cr("BOT look up for end - 1: "PTR_FORMAT" "
+-                             " yielded "PTR_FORMAT", expecting =
"PTR_FORMAT,
++      gclog_or_tty->print_cr("BOT look up for end - 1: " PTR_FORMAT " =
"
++                             " yielded " PTR_FORMAT ", expecting " =
PTR_FORMAT,
+                              addr_4, b_start_4, p);
+       *failures =3D true;
+       return;
+@@ -960,8 +960,8 @@
+   }
+=20
+   if (is_humongous && object_num > 1) {
+-    gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] is =
humongous "
+-                           "but has "SIZE_FORMAT", objects",
++    gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] is =
humongous "
++                           "but has " SIZE_FORMAT ", objects",
+                            bottom(), end(), object_num);
+     *failures =3D true;
+     return;
+--- =
hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.cpp.orig	=
2015-09-02 12:57:25.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.cpp	=
2015-09-02 13:01:10.000000000 +0200
+@@ -414,7 +414,7 @@
+     HeapRegion* hr =3D _regions.get_by_index(i);
+     guarantee(hr !=3D NULL, err_msg("invariant: i: %u", i));
+     guarantee(!prev_committed || hr->bottom() =3D=3D prev_end,
+-              err_msg("invariant i: %u "HR_FORMAT" prev_end: =
"PTR_FORMAT,
++              err_msg("invariant i: %u " HR_FORMAT " prev_end: " =
PTR_FORMAT,
+                       i, HR_FORMAT_PARAMS(hr), p2i(prev_end)));
+     guarantee(hr->hrm_index() =3D=3D i,
+               err_msg("invariant: i: %u hrm_index(): %u", i, =
hr->hrm_index()));
+--- hotspot/src/share/vm/gc_implementation/g1/heapRegionRemSet.cpp.orig	=
2015-09-02 12:57:25.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegionRemSet.cpp	=
2015-09-02 13:03:44.000000000 +0200
+@@ -91,7 +91,7 @@
+     // concurrency.
+=20
+     if (G1TraceHeapRegionRememberedSet) {
+-      gclog_or_tty->print_cr("    PRT::Add_reference_work(" PTR_FORMAT =
"->" PTR_FORMAT").",
++      gclog_or_tty->print_cr("    PRT::Add_reference_work(" PTR_FORMAT =
"->" PTR_FORMAT ").",
+                              from,
+                              UseCompressedOops
+                              ? (void =
*)oopDesc::load_decode_heap_oop((narrowOop*)from)
+@@ -377,7 +377,7 @@
+=20
+ void FromCardCache::invalidate(uint start_idx, size_t new_num_regions) =
{
+   guarantee((size_t)start_idx + new_num_regions <=3D max_uintx,
+-            err_msg("Trying to invalidate beyond maximum region, from =
%u size "SIZE_FORMAT,
++            err_msg("Trying to invalidate beyond maximum region, from =
%u size " SIZE_FORMAT,
+                     start_idx, new_num_regions));
+   for (uint i =3D 0; i < HeapRegionRemSet::num_par_rem_sets(); i++) {
+     uint end_idx =3D (start_idx + (uint)new_num_regions);
+@@ -392,7 +392,7 @@
+ void FromCardCache::print(outputStream* out) {
+   for (uint i =3D 0; i < HeapRegionRemSet::num_par_rem_sets(); i++) {
+     for (uint j =3D 0; j < _max_regions; j++) {
+-      =
out->print_cr("_from_card_cache["UINT32_FORMAT"]["UINT32_FORMAT"] =3D =
"INT32_FORMAT".",
++      out->print_cr("_from_card_cache[" UINT32_FORMAT "][" =
UINT32_FORMAT "] =3D " INT32_FORMAT ".",
+                     i, j, at(i, j));
+     }
+   }
+@@ -432,7 +432,7 @@
+   int from_card =3D (int)(uintptr_t(from) >> =
CardTableModRefBS::card_shift);
+=20
+   if (G1TraceHeapRegionRememberedSet) {
+-    gclog_or_tty->print_cr("Table for [" PTR_FORMAT "...): card %d =
(cache =3D "INT32_FORMAT")",
++    gclog_or_tty->print_cr("Table for [" PTR_FORMAT "...): card %d =
(cache =3D " INT32_FORMAT ")",
+                   hr()->bottom(), from_card,
+                   FromCardCache::at((uint)tid, cur_hrm_ind));
+   }
+@@ -637,13 +637,13 @@
+=20
+   assert(_coarse_map.size() =3D=3D region_bm->size(), "Precondition");
+   if (G1RSScrubVerbose) {
+-    gclog_or_tty->print("   Coarse map: before =3D "SIZE_FORMAT"...",
++    gclog_or_tty->print("   Coarse map: before =3D " SIZE_FORMAT =
"...",
+                         _n_coarse_entries);
+   }
+   _coarse_map.set_intersection(*region_bm);
+   _n_coarse_entries =3D _coarse_map.count_one_bits();
+   if (G1RSScrubVerbose) {
+-    gclog_or_tty->print_cr("   after =3D "SIZE_FORMAT".", =
_n_coarse_entries);
++    gclog_or_tty->print_cr("   after =3D " SIZE_FORMAT ".", =
_n_coarse_entries);
+   }
+=20
+   // Now do the fine-grained maps.
+@@ -1027,7 +1027,7 @@
+=20
+   card_index =3D _cur_region_card_offset + _cur_card_in_prt;
+   guarantee(_cur_card_in_prt < HeapRegion::CardsPerRegion,
+-            err_msg("Card index "SIZE_FORMAT" must be within the =
region", _cur_card_in_prt));
++            err_msg("Card index " SIZE_FORMAT " must be within the =
region", _cur_card_in_prt));
+   return true;
+ }
+=20
+@@ -1196,8 +1196,8 @@
+=20
+   size_t min_prt_size =3D sizeof(void*) + dummy->bm()->size_in_words() =
* HeapWordSize;
+   assert(dummy->mem_size() > min_prt_size,
+-         err_msg("PerRegionTable memory usage is suspiciously small, =
only has "SIZE_FORMAT" bytes. "
+-                 "Should be at least "SIZE_FORMAT" bytes.", =
dummy->mem_size(), min_prt_size));
++         err_msg("PerRegionTable memory usage is suspiciously small, =
only has " SIZE_FORMAT " bytes. "
++                 "Should be at least " SIZE_FORMAT " bytes.", =
dummy->mem_size(), min_prt_size));
+   free(dummy);
+   guarantee(dummy->mem_size() =3D=3D fl_mem_size(), "fl_mem_size() =
does not return the correct element size");
+   // try to reset the state
+--- hotspot/src/share/vm/gc_implementation/g1/heapRegionSet.cpp.orig	=
2015-09-02 12:57:25.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/g1/heapRegionSet.cpp	=
2015-09-02 13:04:36.000000000 +0200
+@@ -32,7 +32,7 @@
+ uint FreeRegionList::_unrealistically_long_length =3D 0;
+=20
+ void HeapRegionSetBase::fill_in_ext_msg(hrs_ext_msg* msg, const char* =
message) {
+-  msg->append("[%s] %s ln: %u cy: "SIZE_FORMAT,
++  msg->append("[%s] %s ln: %u cy: " SIZE_FORMAT,
+               name(), message, length(), total_capacity_bytes());
+   fill_in_ext_msg_extra(msg);
+ }
+@@ -84,13 +84,13 @@
+=20
+ void HeapRegionSetBase::print_on(outputStream* out, bool =
print_contents) {
+   out->cr();
+-  out->print_cr("Set: %s ("PTR_FORMAT")", name(), this);
++  out->print_cr("Set: %s (" PTR_FORMAT ")", name(), this);
+   out->print_cr("  Region Assumptions");
+   out->print_cr("    humongous         : %s", =
BOOL_TO_STR(regions_humongous()));
+   out->print_cr("    free              : %s", =
BOOL_TO_STR(regions_free()));
+   out->print_cr("  Attributes");
+   out->print_cr("    length            : %14u", length());
+-  out->print_cr("    total capacity    : "SIZE_FORMAT_W(14)" bytes",
++  out->print_cr("    total capacity    : " SIZE_FORMAT_W(14) " bytes",
+                 total_capacity_bytes());
+ }
+=20
+@@ -106,7 +106,7 @@
+ }
+=20
+ void FreeRegionList::fill_in_ext_msg_extra(hrs_ext_msg* msg) {
+-  msg->append(" hd: "PTR_FORMAT" tl: "PTR_FORMAT, _head, _tail);
++  msg->append(" hd: " PTR_FORMAT " tl: " PTR_FORMAT, _head, _tail);
+ }
+=20
+ void FreeRegionList::remove_all() {
+@@ -277,8 +277,8 @@
+ void FreeRegionList::print_on(outputStream* out, bool print_contents) =
{
+   HeapRegionSetBase::print_on(out, print_contents);
+   out->print_cr("  Linking");
+-  out->print_cr("    head              : "PTR_FORMAT, _head);
+-  out->print_cr("    tail              : "PTR_FORMAT, _tail);
++  out->print_cr("    head              : " PTR_FORMAT, _head);
++  out->print_cr("    tail              : " PTR_FORMAT, _tail);
+=20
+   if (print_contents) {
+     out->print_cr("  Contents");
+@@ -306,7 +306,7 @@
+=20
+     count++;
+     guarantee(count < _unrealistically_long_length,
+-        hrs_err_msg("[%s] the calculated length: %u seems very long, =
is there maybe a cycle? curr: "PTR_FORMAT" prev0: "PTR_FORMAT" " "prev1: =
"PTR_FORMAT" length: %u", name(), count, curr, prev0, prev1, length()));
++        hrs_err_msg("[%s] the calculated length: %u seems very long, =
is there maybe a cycle? curr: " PTR_FORMAT " prev0: " PTR_FORMAT " " =
"prev1: " PTR_FORMAT " length: %u", name(), count, curr, prev0, prev1, =
length()));
+=20
+     if (curr->next() !=3D NULL) {
+       guarantee(curr->next()->prev() =3D=3D curr, "Next or prev =
pointers messed up");
+--- =
hotspot/src/share/vm/gc_implementation/shared/mutableNUMASpace.cpp.orig	=
2015-09-02 13:07:15.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/shared/mutableNUMASpace.cpp	=
2015-09-02 13:10:48.000000000 +0200
+@@ -86,7 +86,7 @@
+         while (words_left_to_fill > 0) {
+           size_t words_to_fill =3D MIN2(words_left_to_fill, =
CollectedHeap::filler_array_max_size());
+           assert(words_to_fill >=3D CollectedHeap::min_fill_size(),
+-            err_msg("Remaining size ("SIZE_FORMAT ") is too small to =
fill (based on " SIZE_FORMAT " and " SIZE_FORMAT ")",
++            err_msg("Remaining size (" SIZE_FORMAT ") is too small to =
fill (based on " SIZE_FORMAT " and " SIZE_FORMAT ")",
+             words_to_fill, words_left_to_fill, =
CollectedHeap::filler_array_max_size()));
+           CollectedHeap::fill_with_object((HeapWord*)cur_top, =
words_to_fill);
+           if (!os::numa_has_static_binding()) {
+--- hotspot/src/share/vm/prims/methodHandles.cpp.orig	2015-09-02 =
13:07:15.000000000 +0200
++++ hotspot/src/share/vm/prims/methodHandles.cpp	2015-09-02 =
13:10:16.000000000 +0200
+@@ -1300,27 +1300,27 @@
+=20
+ // These are the native methods on =
java.lang.invoke.MethodHandleNatives.
+ static JNINativeMethod MHN_methods[] =3D {
+-  {CC"init",                      CC"("MEM""OBJ")V",                   =
  FN_PTR(MHN_init_Mem)},
+-  {CC"expand",                    CC"("MEM")V",                        =
  FN_PTR(MHN_expand_Mem)},
+-  {CC"resolve",                   CC"("MEM""CLS")"MEM,                 =
  FN_PTR(MHN_resolve_Mem)},
+-  {CC"getConstant",               CC"(I)I",                            =
  FN_PTR(MHN_getConstant)},
++  {CC "init",                      CC "(" MEM "" OBJ ")V",             =
        FN_PTR(MHN_init_Mem)},
++  {CC "expand",                    CC "(" MEM ")V",                    =
      FN_PTR(MHN_expand_Mem)},
++  {CC "resolve",                   CC "(" MEM "" CLS ")" MEM,          =
         FN_PTR(MHN_resolve_Mem)},
++  {CC "getConstant",               CC "(I)I",                          =
    FN_PTR(MHN_getConstant)},
+   //  static native int getNamedCon(int which, Object[] name)
+-  {CC"getNamedCon",               CC"(I["OBJ")I",                      =
  FN_PTR(MHN_getNamedCon)},
++  {CC "getNamedCon",               CC "(I[" OBJ ")I",                  =
      FN_PTR(MHN_getNamedCon)},
+   //  static native int getMembers(Class<?> defc, String matchName, =
String matchSig,
+   //          int matchFlags, Class<?> caller, int skip, MemberName[] =
results);
+-  {CC"getMembers",                =
CC"("CLS""STRG""STRG"I"CLS"I["MEM")I", FN_PTR(MHN_getMembers)},
+-  {CC"objectFieldOffset",         CC"("MEM")J",                        =
  FN_PTR(MHN_objectFieldOffset)},
+-  {CC"setCallSiteTargetNormal",   CC"("CS""MH")V",                     =
  FN_PTR(MHN_setCallSiteTargetNormal)},
+-  {CC"setCallSiteTargetVolatile", CC"("CS""MH")V",                     =
  FN_PTR(MHN_setCallSiteTargetVolatile)},
+-  {CC"staticFieldOffset",         CC"("MEM")J",                        =
  FN_PTR(MHN_staticFieldOffset)},
+-  {CC"staticFieldBase",           CC"("MEM")"OBJ,                      =
  FN_PTR(MHN_staticFieldBase)},
+-  {CC"getMemberVMInfo",           CC"("MEM")"OBJ,                      =
  FN_PTR(MHN_getMemberVMInfo)}
++  {CC "getMembers",                CC "(" CLS "" STRG "" STRG "I" CLS =
"I[" MEM ")I", FN_PTR(MHN_getMembers)},
++  {CC "objectFieldOffset",         CC "(" MEM ")J",                    =
      FN_PTR(MHN_objectFieldOffset)},
++  {CC "setCallSiteTargetNormal",   CC "(" CS "" MH ")V",               =
        FN_PTR(MHN_setCallSiteTargetNormal)},
++  {CC "setCallSiteTargetVolatile", CC "(" CS "" MH ")V",               =
        FN_PTR(MHN_setCallSiteTargetVolatile)},
++  {CC "staticFieldOffset",         CC "(" MEM ")J",                    =
      FN_PTR(MHN_staticFieldOffset)},
++  {CC "staticFieldBase",           CC "(" MEM ")" OBJ,                 =
       FN_PTR(MHN_staticFieldBase)},
++  {CC "getMemberVMInfo",           CC "(" MEM ")" OBJ,                 =
       FN_PTR(MHN_getMemberVMInfo)}
+ };
+=20
+ static JNINativeMethod MH_methods[] =3D {
+   // UnsupportedOperationException throwers
+-  {CC"invoke",                    CC"(["OBJ")"OBJ,                     =
  FN_PTR(MH_invoke_UOE)},
+-  {CC"invokeExact",               CC"(["OBJ")"OBJ,                     =
  FN_PTR(MH_invokeExact_UOE)}
++  {CC"invoke",                    CC "([" OBJ ")" OBJ,                 =
      FN_PTR(MH_invoke_UOE)},
++  {CC"invokeExact",               CC "([" OBJ ")" OBJ,                 =
      FN_PTR(MH_invokeExact_UOE)}
+ };
+=20
+ /**
+--- hotspot/src/share/vm/oops/objArrayKlass.cpp.orig	2015-09-02 =
13:19:26.000000000 +0200
++++ hotspot/src/share/vm/oops/objArrayKlass.cpp	2015-09-02 =
13:22:11.000000000 +0200
+@@ -657,7 +657,7 @@
+       if (i > max_objArray_print_length) {
+         st->print("..."); break;
+       }
+-      st->print(" "INTPTR_FORMAT, =
(intptr_t)(void*)objArrayOop(obj)->obj_at(i));
++      st->print(" " INTPTR_FORMAT, =
(intptr_t)(void*)objArrayOop(obj)->obj_at(i));
+     }
+     st->print(" }");
+   }
+--- hotspot/src/share/vm/oops/oop.cpp.orig	2015-09-02 =
13:19:26.000000000 +0200
++++ hotspot/src/share/vm/oops/oop.cpp	2015-09-02 13:22:22.000000000 =
+0200
+@@ -46,7 +46,7 @@
+=20
+ void oopDesc::print_address_on(outputStream* st) const {
+   if (PrintOopAddress) {
+-    st->print("{"INTPTR_FORMAT"}", this);
++    st->print("{" INTPTR_FORMAT "}", this);
+   }
+ }
+=20
+--- hotspot/src/os/posix/vm/os_posix.cpp.orig	2015-09-02 =
13:32:01.000000000 +0200
++++ hotspot/src/os/posix/vm/os_posix.cpp	2015-09-02 =
13:33:42.000000000 +0200
+@@ -594,7 +594,7 @@
+   strncpy(buffer, "none", size);
+=20
+   const struct {
+-    int i;
++    unsigned i;
+     const char* s;
+   } flaginfo [] =3D {
+     { SA_NOCLDSTOP, "SA_NOCLDSTOP" },
+--- hotspot/src/share/vm/code/nmethod.cpp.orig	2015-09-02 =
13:19:26.000000000 +0200
++++ hotspot/src/share/vm/code/nmethod.cpp	2015-09-02 =
13:27:23.000000000 +0200
+@@ -2303,7 +2303,7 @@
+   void maybe_print(oop* p) {
+     if (_print_nm =3D=3D NULL)  return;
+     if (!_detected_scavenge_root)  _print_nm->print_on(tty, "new =
scavenge root");
+-    tty->print_cr(""PTR_FORMAT"[offset=3D%d] detected scavengable oop =
"PTR_FORMAT" (found at "PTR_FORMAT")",
++    tty->print_cr("" PTR_FORMAT "[offset=3D%d] detected scavengable =
oop " PTR_FORMAT " (found at " PTR_FORMAT ")",
+                   _print_nm, (int)((intptr_t)p - (intptr_t)_print_nm),
+                   (void *)(*p), (intptr_t)p);
+     (*p)->print();
+@@ -2684,7 +2684,7 @@
+       _nm->print_nmethod(true);
+       _ok =3D false;
+     }
+-    tty->print_cr("*** non-oop "PTR_FORMAT" found at "PTR_FORMAT" =
(offset %d)",
++    tty->print_cr("*** non-oop " PTR_FORMAT " found at " PTR_FORMAT " =
(offset %d)",
+                   (void *)(*p), (intptr_t)p, (int)((intptr_t)p - =
(intptr_t)_nm));
+   }
+   virtual void do_oop(narrowOop* p) { ShouldNotReachHere(); }
+@@ -2808,7 +2808,7 @@
+       _nm->print_nmethod(true);
+       _ok =3D false;
+     }
+-    tty->print_cr("*** scavengable oop "PTR_FORMAT" found at =
"PTR_FORMAT" (offset %d)",
++    tty->print_cr("*** scavengable oop " PTR_FORMAT " found at " =
PTR_FORMAT " (offset %d)",
+                   (void *)(*p), (intptr_t)p, (int)((intptr_t)p - =
(intptr_t)_nm));
+     (*p)->print();
+   }
+@@ -2853,7 +2853,7 @@
+   print_on(tty, NULL);
+=20
+   if (WizardMode) {
+-    tty->print("((nmethod*) "INTPTR_FORMAT ") ", this);
++    tty->print("((nmethod*) " INTPTR_FORMAT ") ", this);
+     tty->print(" for method " INTPTR_FORMAT , (address)method());
+     tty->print(" { ");
+     if (is_in_use())      tty->print("in_use ");
+--- =
hotspot/src/share/vm/gc_implementation/shared/parGCAllocBuffer.cpp.orig	=
2015-09-02 13:28:16.000000000 +0200
++++ hotspot/src/share/vm/gc_implementation/shared/parGCAllocBuffer.cpp	=
2015-09-02 13:31:09.000000000 +0200
+@@ -98,10 +98,10 @@
+   if (_allocated =3D=3D 0) {
+     assert(_unused =3D=3D 0,
+            err_msg("Inconsistency in PLAB stats: "
+-                   "_allocated: "SIZE_FORMAT", "
+-                   "_wasted: "SIZE_FORMAT", "
+-                   "_unused: "SIZE_FORMAT", "
+-                   "_used  : "SIZE_FORMAT,
++                   "_allocated: " SIZE_FORMAT ", "
++                   "_wasted: " SIZE_FORMAT ", "
++                   "_unused: " SIZE_FORMAT ", "
++                   "_used  : " SIZE_FORMAT,
+                    _allocated, _wasted, _unused, _used));
+=20
+     _allocated =3D 1;
+--- hotspot/src/share/vm/utilities/ostream.cpp.orig	2015-09-02 =
13:28:16.000000000 +0200
++++ hotspot/src/share/vm/utilities/ostream.cpp	2015-09-02 =
13:34:57.000000000 +0200
+@@ -277,7 +277,7 @@
+   size_t limit =3D (len + 16) / 16 * 16;
+   for (size_t i =3D 0; i < limit; ++i) {
+     if (i % 16 =3D=3D 0) {
+-      indent().print(SIZE_FORMAT_HEX_W(07)":", i);
++      indent().print(SIZE_FORMAT_HEX_W(07) ":", i);
+     }
+     if (i % 2 =3D=3D 0) {
+       print(" ");
+@@ -945,7 +945,7 @@
+     // %%% Should be: jlong time_ms =3D os::start_time_milliseconds(), =
if
+     // we ever get round to introduce that method on the os class
+     xs->head("hotspot_log version=3D'%d %d'"
+-             " process=3D'%d' time_ms=3D'"INT64_FORMAT"'",
++             " process=3D'%d' time_ms=3D'" INT64_FORMAT "'",
+              LOG_MAJOR_VERSION, LOG_MINOR_VERSION,
+              os::current_process_id(), (int64_t)time_ms);
+     // Write VM version header immediately.
+--- hotspot/src/share/vm/prims/perf.cpp.orig	2015-09-02 =
13:36:01.000000000 +0200
++++ hotspot/src/share/vm/prims/perf.cpp	2015-09-02 =
13:37:33.000000000 +0200
+@@ -290,17 +290,17 @@
+ #define FN_PTR(f) CAST_FROM_FN_PTR(void*, &f)
+ #define BB "Ljava/nio/ByteBuffer;"
+ #define JLS "Ljava/lang/String;"
+-#define CL_ARGS     CC"("JLS"IIJ)"BB
+-#define CBA_ARGS    CC"("JLS"II[BI)"BB
++#define CL_ARGS     CC "(" JLS "IIJ)" BB
++#define CBA_ARGS    CC "(" JLS "II[BI)" BB
+=20
+ static JNINativeMethod perfmethods[] =3D {
+=20
+-  {CC"attach",              CC"("JLS"II)"BB,  FN_PTR(Perf_Attach)},
+-  {CC"detach",              CC"("BB")V",      FN_PTR(Perf_Detach)},
+-  {CC"createLong",          CL_ARGS,          =
FN_PTR(Perf_CreateLong)},
+-  {CC"createByteArray",     CBA_ARGS,         =
FN_PTR(Perf_CreateByteArray)},
+-  {CC"highResCounter",      CC"()J",          =
FN_PTR(Perf_HighResCounter)},
+-  {CC"highResFrequency",    CC"()J",          =
FN_PTR(Perf_HighResFrequency)}
++  {CC"attach",              CC "(" JLS "II)" BB, FN_PTR(Perf_Attach)},
++  {CC"detach",              CC "(" BB ")V",      FN_PTR(Perf_Detach)},
++  {CC"createLong",          CL_ARGS,             =
FN_PTR(Perf_CreateLong)},
++  {CC"createByteArray",     CBA_ARGS,            =
FN_PTR(Perf_CreateByteArray)},
++  {CC"highResCounter",      CC "()J",            =
FN_PTR(Perf_HighResCounter)},
++  {CC"highResFrequency",    CC "()J",            =
FN_PTR(Perf_HighResFrequency)}
+ };
+=20
+ #undef CBA_ARGS
+--- =
hotspot/src/share/vm/gc_implementation/parallelScavenge/psMarkSweep.cpp.or=
ig	2015-09-02 13:39:42.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/parallelScavenge/psMarkSweep.cpp	=
2015-09-02 13:40:05.000000000 +0200
+@@ -669,7 +669,7 @@
+   jlong ret_val =3D now - _time_of_last_gc;
+   // XXX See note in genCollectedHeap::millis_since_last_gc().
+   if (ret_val < 0) {
+-    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, ret_val);)
++    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, ret_val);)
+     return 0;
+   }
+   return ret_val;
+--- =
hotspot/src/share/vm/gc_implementation/parallelScavenge/psParallelCompact.=
cpp.orig	2015-09-02 13:39:42.000000000 +0200
++++ =
hotspot/src/share/vm/gc_implementation/parallelScavenge/psParallelCompact.=
cpp	2015-09-02 13:40:50.000000000 +0200
+@@ -3292,7 +3292,7 @@
+   jlong ret_val =3D now - _time_of_last_gc;
+   // XXX See note in genCollectedHeap::millis_since_last_gc().
+   if (ret_val < 0) {
+-    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, ret_val);)
++    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, ret_val);)
+     return 0;
+   }
+   return ret_val;
+--- hotspot/src/share/vm/memory/referenceProcessor.cpp.orig	=
2015-09-02 13:42:24.000000000 +0200
++++ hotspot/src/share/vm/memory/referenceProcessor.cpp	2015-09-02 =
13:42:55.000000000 +0200
+@@ -161,7 +161,7 @@
+=20
+   NOT_PRODUCT(
+   if (now < _soft_ref_timestamp_clock) {
+-    warning("time warp: "INT64_FORMAT" to "INT64_FORMAT,
++    warning("time warp: " INT64_FORMAT " to " INT64_FORMAT,
+             _soft_ref_timestamp_clock, now);
+   }
+   )
+--- hotspot/src/share/vm/runtime/safepoint.cpp.orig	2015-09-02 =
14:51:21.000000000 +0200
++++ hotspot/src/share/vm/runtime/safepoint.cpp	2015-09-02 =
14:52:56.000000000 +0200
+@@ -983,7 +983,7 @@
+=20
+     case _running:
+     default:
+-       tty->print_cr("restart thread "INTPTR_FORMAT" with state %d",
++       tty->print_cr("restart thread " INTPTR_FORMAT " with state %d",
+                       _thread, _type);
+        _thread->print();
+       ShouldNotReachHere();
+@@ -1340,14 +1340,14 @@
+=20
+   for (int index =3D 0; index < VM_Operation::VMOp_Terminating; =
index++) {
+     if (_safepoint_reasons[index] !=3D 0) {
+-      tty->print_cr("%-26s"UINT64_FORMAT_W(10), =
VM_Operation::name(index),
++      tty->print_cr("%-26s" UINT64_FORMAT_W(10), =
VM_Operation::name(index),
+                     _safepoint_reasons[index]);
+     }
+   }
+=20
+   tty->print_cr(UINT64_FORMAT_W(5)" VM operations coalesced during =
safepoint",
+                 _coalesced_vmop_count);
+-  tty->print_cr("Maximum sync time  "INT64_FORMAT_W(5)" ms",
++  tty->print_cr("Maximum sync time  " INT64_FORMAT_W(5) " ms",
+                 _max_sync_time / MICROUNITS);
+   tty->print_cr("Maximum vm operation time (except for Exit VM =
operation)  "
+                 INT64_FORMAT_W(5)" ms",
+--- hotspot/src/share/vm/memory/tenuredGeneration.cpp.orig	=
2015-09-02 18:11:24.000000000 +0200
++++ hotspot/src/share/vm/memory/tenuredGeneration.cpp	2015-09-02 =
18:11:32.000000000 +0200
+@@ -292,8 +292,8 @@
+   bool   res =3D (available >=3D av_promo) || (available >=3D =
max_promotion_in_bytes);
+   if (PrintGC && Verbose) {
+     gclog_or_tty->print_cr(
+-      "Tenured: promo attempt is%s safe: available("SIZE_FORMAT") %s =
av_promo("SIZE_FORMAT"),"
+-      "max_promo("SIZE_FORMAT")",
++      "Tenured: promo attempt is%s safe: available(" SIZE_FORMAT ") %s =
av_promo(" SIZE_FORMAT "),"
++      "max_promo(" SIZE_FORMAT ")",
+       res? "":" not", available, res? ">=3D":"<",
+       av_promo, max_promotion_in_bytes);
+   }
+--- hotspot/src/share/vm/services/threadService.cpp.orig	=
2015-09-02 18:11:24.000000000 +0200
++++ hotspot/src/share/vm/services/threadService.cpp	2015-09-02 =
18:11:32.000000000 +0200
+@@ -889,7 +889,7 @@
+       st->print("  waiting to lock monitor " INTPTR_FORMAT, =
waitingToLockMonitor);
+       oop obj =3D (oop)waitingToLockMonitor->object();
+       if (obj !=3D NULL) {
+-        st->print(" (object "INTPTR_FORMAT ", a %s)", (address)obj,
++        st->print(" (object " INTPTR_FORMAT ", a %s)", (address)obj,
+                    =
(InstanceKlass::cast(obj->klass()))->external_name());
+=20
+         if (!currentThread->current_pending_monitor_is_from_java()) {
+--- hotspot/src/share/vm/memory/universe.cpp.orig	2015-09-02 =
18:25:28.000000000 +0200
++++ hotspot/src/share/vm/memory/universe.cpp	2015-09-02 =
18:26:04.000000000 +0200
+@@ -919,7 +919,7 @@
+ // Reserve the Java heap, which is now the same for all GCs.
+ ReservedSpace Universe::reserve_heap(size_t heap_size, size_t =
alignment) {
+   assert(alignment <=3D Arguments::conservative_max_heap_alignment(),
+-      err_msg("actual alignment "SIZE_FORMAT" must be within maximum =
heap alignment "SIZE_FORMAT,
++      err_msg("actual alignment " SIZE_FORMAT " must be within maximum =
heap alignment " SIZE_FORMAT,
+           alignment, Arguments::conservative_max_heap_alignment()));
+   size_t total_reserved =3D align_size_up(heap_size, alignment);
+   assert(!UseCompressedOops || (total_reserved <=3D =
(OopEncodingHeapMax - os::vm_page_size())),
+--- hotspot/src/share/vm/prims/unsafe.cpp.orig	2015-09-02 =
18:25:32.000000000 +0200
++++ hotspot/src/share/vm/prims/unsafe.cpp	2015-09-02 =
18:47:09.000000000 +0200
+@@ -977,7 +977,7 @@
+ UNSAFE_END
+=20
+=20
+-#define DAC_Args CLS"[B["OBJ
++#define DAC_Args CLS "[B[" OBJ
+ // define a class but do not make it known to the class loader or =
system dictionary
+ // - host_class:  supplies context for linkage, access control, =
protection domain, and class loader
+ // - data:  bytes of a class file, a raw memory address (length gives =
the number of bytes)
+@@ -1337,47 +1337,47 @@
+=20
+ #define LANG "Ljava/lang/"
+=20
+-#define OBJ LANG"Object;"
+-#define CLS LANG"Class;"
+-#define CTR LANG"reflect/Constructor;"
+-#define FLD LANG"reflect/Field;"
+-#define MTH LANG"reflect/Method;"
+-#define THR LANG"Throwable;"
++#define OBJ LANG "Object;"
++#define CLS LANG "Class;"
++#define CTR LANG "reflect/Constructor;"
++#define FLD LANG "reflect/Field;"
++#define MTH LANG "reflect/Method;"
++#define THR LANG "Throwable;"
+=20
+-#define DC0_Args LANG"String;[BII"
+-#define DC_Args  DC0_Args LANG"ClassLoader;" =
"Ljava/security/ProtectionDomain;"
++#define DC0_Args LANG "String;[BII"
++#define DC_Args  DC0_Args LANG "ClassLoader;" =
"Ljava/security/ProtectionDomain;"
+=20
+ #define CC (char*)  /*cast a literal from (const char*)*/
+ #define FN_PTR(f) CAST_FROM_FN_PTR(void*, &f)
+=20
+ // define deprecated accessors for compabitility with 1.4.0
+ #define DECLARE_GETSETOOP_140(Boolean, Z) \
+-    {CC"get"#Boolean,      CC"("OBJ"I)"#Z,      =
FN_PTR(Unsafe_Get##Boolean##140)}, \
+-    {CC"put"#Boolean,      CC"("OBJ"I"#Z")V",   =
FN_PTR(Unsafe_Set##Boolean##140)}
++    {CC"get"#Boolean,      CC"(" OBJ "I)" #Z,      =
FN_PTR(Unsafe_Get##Boolean##140)}, \
++    {CC"put"#Boolean,      CC"(" OBJ "I" #Z ")V",   =
FN_PTR(Unsafe_Set##Boolean##140)}
+=20
+ // Note:  In 1.4.1, getObject and kin take both int and long offsets.
+ #define DECLARE_GETSETOOP_141(Boolean, Z) \
+-    {CC"get"#Boolean,      CC"("OBJ"J)"#Z,      =
FN_PTR(Unsafe_Get##Boolean)}, \
+-    {CC"put"#Boolean,      CC"("OBJ"J"#Z")V",   =
FN_PTR(Unsafe_Set##Boolean)}
++    {CC"get"#Boolean,      CC"(" OBJ "J)" #Z,      =
FN_PTR(Unsafe_Get##Boolean)}, \
++    {CC"put"#Boolean,      CC"(" OBJ "J" #Z ")V",   =
FN_PTR(Unsafe_Set##Boolean)}
+=20
+ // Note:  In 1.5.0, there are volatile versions too
+ #define DECLARE_GETSETOOP(Boolean, Z) \
+-    {CC"get"#Boolean,      CC"("OBJ"J)"#Z,      =
FN_PTR(Unsafe_Get##Boolean)}, \
+-    {CC"put"#Boolean,      CC"("OBJ"J"#Z")V",   =
FN_PTR(Unsafe_Set##Boolean)}, \
+-    {CC"get"#Boolean"Volatile",      CC"("OBJ"J)"#Z,      =
FN_PTR(Unsafe_Get##Boolean##Volatile)}, \
+-    {CC"put"#Boolean"Volatile",      CC"("OBJ"J"#Z")V",   =
FN_PTR(Unsafe_Set##Boolean##Volatile)}
++    {CC"get"#Boolean,      CC"(" OBJ "J)" #Z,      =
FN_PTR(Unsafe_Get##Boolean)}, \
++    {CC"put"#Boolean,      CC"(" OBJ "J" #Z ")V",   =
FN_PTR(Unsafe_Set##Boolean)}, \
++    {CC"get"#Boolean "Volatile",      CC"(" OBJ "J)" #Z,      =
FN_PTR(Unsafe_Get##Boolean##Volatile)}, \
++    {CC"put"#Boolean "Volatile",      CC"(" OBJ "J" #Z ")V",   =
FN_PTR(Unsafe_Set##Boolean##Volatile)}
+=20
+=20
+ #define DECLARE_GETSETNATIVE(Byte, B) \
+-    {CC"get"#Byte,         CC"("ADR")"#B,       =
FN_PTR(Unsafe_GetNative##Byte)}, \
+-    {CC"put"#Byte,         CC"("ADR#B")V",      =
FN_PTR(Unsafe_SetNative##Byte)}
++    {CC"get"#Byte,         CC"(" ADR ")" #B,       =
FN_PTR(Unsafe_GetNative##Byte)}, \
++    {CC"put"#Byte,         CC"(" ADR #B ")V",      =
FN_PTR(Unsafe_SetNative##Byte)}
+=20
+=20
+=20
+ // These are the methods for 1.4.0
+ static JNINativeMethod methods_140[] =3D {
+-    {CC"getObject",        CC"("OBJ"I)"OBJ"",   =
FN_PTR(Unsafe_GetObject140)},
+-    {CC"putObject",        CC"("OBJ"I"OBJ")V",  =
FN_PTR(Unsafe_SetObject140)},
++    {CC"getObject",        CC"(" OBJ "I)" OBJ "",   =
FN_PTR(Unsafe_GetObject140)},
++    {CC"putObject",        CC"(" OBJ "I" OBJ ")V",  =
FN_PTR(Unsafe_SetObject140)},
+=20
+     DECLARE_GETSETOOP_140(Boolean, Z),
+     DECLARE_GETSETOOP_140(Byte, B),
+@@ -1396,33 +1396,33 @@
+     DECLARE_GETSETNATIVE(Float, F),
+     DECLARE_GETSETNATIVE(Double, D),
+=20
+-    {CC"getAddress",         CC"("ADR")"ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
+-    {CC"putAddress",         CC"("ADR""ADR")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
++    {CC"getAddress",         CC"(" ADR ")" ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
++    {CC"putAddress",         CC"(" ADR "" ADR ")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
+=20
+-    {CC"allocateMemory",     CC"(J)"ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
+-    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
+-    {CC"freeMemory",         CC"("ADR")V",               =
FN_PTR(Unsafe_FreeMemory)},
+-
+-    {CC"fieldOffset",        CC"("FLD")I",               =
FN_PTR(Unsafe_FieldOffset)},
+-    {CC"staticFieldBase",    CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromClass)},
+-    {CC"ensureClassInitialized",CC"("CLS")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
+-    {CC"arrayBaseOffset",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
+-    {CC"arrayIndexScale",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
++    {CC"allocateMemory",     CC"(J)" ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
++    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
++    {CC"freeMemory",         CC"(" ADR ")V",               =
FN_PTR(Unsafe_FreeMemory)},
++
++    {CC"fieldOffset",        CC"(" FLD ")I",               =
FN_PTR(Unsafe_FieldOffset)},
++    {CC"staticFieldBase",    CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromClass)},
++    {CC"ensureClassInitialized",CC"(" CLS ")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
++    {CC"arrayBaseOffset",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
++    {CC"arrayIndexScale",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
+     {CC"addressSize",        CC"()I",                    =
FN_PTR(Unsafe_AddressSize)},
+     {CC"pageSize",           CC"()I",                    =
FN_PTR(Unsafe_PageSize)},
+=20
+-    {CC"defineClass",        CC"("DC0_Args")"CLS,        =
FN_PTR(Unsafe_DefineClass0)},
+-    {CC"defineClass",        CC"("DC_Args")"CLS,         =
FN_PTR(Unsafe_DefineClass)},
+-    {CC"allocateInstance",   CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
+-    {CC"monitorEnter",       CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
+-    {CC"monitorExit",        CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorExit)},
+-    {CC"throwException",     CC"("THR")V",               =
FN_PTR(Unsafe_ThrowException)}
++    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        =
FN_PTR(Unsafe_DefineClass0)},
++    {CC"defineClass",        CC"(" DC_Args ")" CLS,         =
FN_PTR(Unsafe_DefineClass)},
++    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
++    {CC"monitorEnter",       CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
++    {CC"monitorExit",        CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorExit)},
++    {CC"throwException",     CC"(" THR ")V",               =
FN_PTR(Unsafe_ThrowException)}
+ };
+=20
+ // These are the methods prior to the JSR 166 changes in 1.5.0
+ static JNINativeMethod methods_141[] =3D {
+-    {CC"getObject",        CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObject)},
+-    {CC"putObject",        CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObject)},
++    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObject)},
++    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObject)},
+=20
+     DECLARE_GETSETOOP_141(Boolean, Z),
+     DECLARE_GETSETOOP_141(Byte, B),
+@@ -1441,37 +1441,37 @@
+     DECLARE_GETSETNATIVE(Float, F),
+     DECLARE_GETSETNATIVE(Double, D),
+=20
+-    {CC"getAddress",         CC"("ADR")"ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
+-    {CC"putAddress",         CC"("ADR""ADR")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
++    {CC"getAddress",         CC"(" ADR ")" ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
++    {CC"putAddress",         CC"(" ADR "" ADR ")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
+=20
+-    {CC"allocateMemory",     CC"(J)"ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
+-    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
+-    {CC"freeMemory",         CC"("ADR")V",               =
FN_PTR(Unsafe_FreeMemory)},
+-
+-    {CC"objectFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
+-    {CC"staticFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
+-    {CC"staticFieldBase",    CC"("FLD")"OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
+-    {CC"ensureClassInitialized",CC"("CLS")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
+-    {CC"arrayBaseOffset",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
+-    {CC"arrayIndexScale",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
++    {CC"allocateMemory",     CC"(J)" ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
++    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
++    {CC"freeMemory",         CC"(" ADR ")V",               =
FN_PTR(Unsafe_FreeMemory)},
++
++    {CC"objectFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
++    {CC"staticFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
++    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
++    {CC"ensureClassInitialized",CC"(" CLS ")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
++    {CC"arrayBaseOffset",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
++    {CC"arrayIndexScale",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
+     {CC"addressSize",        CC"()I",                    =
FN_PTR(Unsafe_AddressSize)},
+     {CC"pageSize",           CC"()I",                    =
FN_PTR(Unsafe_PageSize)},
+=20
+-    {CC"defineClass",        CC"("DC0_Args")"CLS,        =
FN_PTR(Unsafe_DefineClass0)},
+-    {CC"defineClass",        CC"("DC_Args")"CLS,         =
FN_PTR(Unsafe_DefineClass)},
+-    {CC"allocateInstance",   CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
+-    {CC"monitorEnter",       CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
+-    {CC"monitorExit",        CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorExit)},
+-    {CC"throwException",     CC"("THR")V",               =
FN_PTR(Unsafe_ThrowException)}
++    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        =
FN_PTR(Unsafe_DefineClass0)},
++    {CC"defineClass",        CC"(" DC_Args ")" CLS,         =
FN_PTR(Unsafe_DefineClass)},
++    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
++    {CC"monitorEnter",       CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
++    {CC"monitorExit",        CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorExit)},
++    {CC"throwException",     CC"(" THR ")V",               =
FN_PTR(Unsafe_ThrowException)}
+=20
+ };
+=20
+ // These are the methods prior to the JSR 166 changes in 1.6.0
+ static JNINativeMethod methods_15[] =3D {
+-    {CC"getObject",        CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObject)},
+-    {CC"putObject",        CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObject)},
+-    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObjectVolatile)},
+-    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
++    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObject)},
++    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObject)},
++    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObjectVolatile)},
++    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
+=20
+=20
+     DECLARE_GETSETOOP(Boolean, Z),
+@@ -1491,42 +1491,42 @@
+     DECLARE_GETSETNATIVE(Float, F),
+     DECLARE_GETSETNATIVE(Double, D),
+=20
+-    {CC"getAddress",         CC"("ADR")"ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
+-    {CC"putAddress",         CC"("ADR""ADR")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
++    {CC"getAddress",         CC"(" ADR ")" ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
++    {CC"putAddress",         CC"(" ADR "" ADR ")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
+=20
+-    {CC"allocateMemory",     CC"(J)"ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
+-    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
+-    {CC"freeMemory",         CC"("ADR")V",               =
FN_PTR(Unsafe_FreeMemory)},
+-
+-    {CC"objectFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
+-    {CC"staticFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
+-    {CC"staticFieldBase",    CC"("FLD")"OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
+-    {CC"ensureClassInitialized",CC"("CLS")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
+-    {CC"arrayBaseOffset",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
+-    {CC"arrayIndexScale",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
++    {CC"allocateMemory",     CC"(J)" ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
++    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
++    {CC"freeMemory",         CC"(" ADR ")V",               =
FN_PTR(Unsafe_FreeMemory)},
++
++    {CC"objectFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
++    {CC"staticFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
++    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
++    {CC"ensureClassInitialized",CC"(" CLS ")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
++    {CC"arrayBaseOffset",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
++    {CC"arrayIndexScale",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
+     {CC"addressSize",        CC"()I",                    =
FN_PTR(Unsafe_AddressSize)},
+     {CC"pageSize",           CC"()I",                    =
FN_PTR(Unsafe_PageSize)},
+=20
+-    {CC"defineClass",        CC"("DC0_Args")"CLS,        =
FN_PTR(Unsafe_DefineClass0)},
+-    {CC"defineClass",        CC"("DC_Args")"CLS,         =
FN_PTR(Unsafe_DefineClass)},
+-    {CC"allocateInstance",   CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
+-    {CC"monitorEnter",       CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
+-    {CC"monitorExit",        CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorExit)},
+-    {CC"throwException",     CC"("THR")V",               =
FN_PTR(Unsafe_ThrowException)},
+-    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
+-    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
+-    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
++    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        =
FN_PTR(Unsafe_DefineClass0)},
++    {CC"defineClass",        CC"(" DC_Args ")" CLS,         =
FN_PTR(Unsafe_DefineClass)},
++    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
++    {CC"monitorEnter",       CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
++    {CC"monitorExit",        CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorExit)},
++    {CC"throwException",     CC"(" THR ")V",               =
FN_PTR(Unsafe_ThrowException)},
++    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
++    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
++    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
+     {CC"park",               CC"(ZJ)V",                  =
FN_PTR(Unsafe_Park)},
+-    {CC"unpark",             CC"("OBJ")V",               =
FN_PTR(Unsafe_Unpark)}
++    {CC"unpark",             CC"(" OBJ ")V",               =
FN_PTR(Unsafe_Unpark)}
+=20
+ };
+=20
+ // These are the methods for 1.6.0 and 1.7.0
+ static JNINativeMethod methods_16[] =3D {
+-    {CC"getObject",        CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObject)},
+-    {CC"putObject",        CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObject)},
+-    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObjectVolatile)},
+-    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
++    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObject)},
++    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObject)},
++    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObjectVolatile)},
++    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
+=20
+     DECLARE_GETSETOOP(Boolean, Z),
+     DECLARE_GETSETOOP(Byte, B),
+@@ -1545,45 +1545,45 @@
+     DECLARE_GETSETNATIVE(Float, F),
+     DECLARE_GETSETNATIVE(Double, D),
+=20
+-    {CC"getAddress",         CC"("ADR")"ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
+-    {CC"putAddress",         CC"("ADR""ADR")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
++    {CC"getAddress",         CC"(" ADR ")" ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
++    {CC"putAddress",         CC"(" ADR "" ADR ")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
+=20
+-    {CC"allocateMemory",     CC"(J)"ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
+-    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
+-    {CC"freeMemory",         CC"("ADR")V",               =
FN_PTR(Unsafe_FreeMemory)},
+-
+-    {CC"objectFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
+-    {CC"staticFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
+-    {CC"staticFieldBase",    CC"("FLD")"OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
+-    {CC"ensureClassInitialized",CC"("CLS")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
+-    {CC"arrayBaseOffset",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
+-    {CC"arrayIndexScale",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
++    {CC"allocateMemory",     CC"(J)" ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
++    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
++    {CC"freeMemory",         CC"(" ADR ")V",               =
FN_PTR(Unsafe_FreeMemory)},
++
++    {CC"objectFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
++    {CC"staticFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
++    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
++    {CC"ensureClassInitialized",CC"(" CLS ")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
++    {CC"arrayBaseOffset",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
++    {CC"arrayIndexScale",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
+     {CC"addressSize",        CC"()I",                    =
FN_PTR(Unsafe_AddressSize)},
+     {CC"pageSize",           CC"()I",                    =
FN_PTR(Unsafe_PageSize)},
+=20
+-    {CC"defineClass",        CC"("DC0_Args")"CLS,        =
FN_PTR(Unsafe_DefineClass0)},
+-    {CC"defineClass",        CC"("DC_Args")"CLS,         =
FN_PTR(Unsafe_DefineClass)},
+-    {CC"allocateInstance",   CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
+-    {CC"monitorEnter",       CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
+-    {CC"monitorExit",        CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorExit)},
+-    {CC"tryMonitorEnter",    CC"("OBJ")Z",               =
FN_PTR(Unsafe_TryMonitorEnter)},
+-    {CC"throwException",     CC"("THR")V",               =
FN_PTR(Unsafe_ThrowException)},
+-    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
+-    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
+-    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
+-    {CC"putOrderedObject",   CC"("OBJ"J"OBJ")V",         =
FN_PTR(Unsafe_SetOrderedObject)},
+-    {CC"putOrderedInt",      CC"("OBJ"JI)V",             =
FN_PTR(Unsafe_SetOrderedInt)},
+-    {CC"putOrderedLong",     CC"("OBJ"JJ)V",             =
FN_PTR(Unsafe_SetOrderedLong)},
++    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        =
FN_PTR(Unsafe_DefineClass0)},
++    {CC"defineClass",        CC"(" DC_Args ")" CLS,         =
FN_PTR(Unsafe_DefineClass)},
++    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
++    {CC"monitorEnter",       CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
++    {CC"monitorExit",        CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorExit)},
++    {CC"tryMonitorEnter",    CC"(" OBJ ")Z",               =
FN_PTR(Unsafe_TryMonitorEnter)},
++    {CC"throwException",     CC"(" THR ")V",               =
FN_PTR(Unsafe_ThrowException)},
++    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
++    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
++    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
++    {CC"putOrderedObject",   CC"(" OBJ "J" OBJ ")V",         =
FN_PTR(Unsafe_SetOrderedObject)},
++    {CC"putOrderedInt",      CC"(" OBJ "JI)V",             =
FN_PTR(Unsafe_SetOrderedInt)},
++    {CC"putOrderedLong",     CC"(" OBJ "JJ)V",             =
FN_PTR(Unsafe_SetOrderedLong)},
+     {CC"park",               CC"(ZJ)V",                  =
FN_PTR(Unsafe_Park)},
+-    {CC"unpark",             CC"("OBJ")V",               =
FN_PTR(Unsafe_Unpark)}
++    {CC"unpark",             CC"(" OBJ ")V",               =
FN_PTR(Unsafe_Unpark)}
+ };
+=20
+ // These are the methods for 1.8.0
+ static JNINativeMethod methods_18[] =3D {
+-    {CC"getObject",        CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObject)},
+-    {CC"putObject",        CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObject)},
+-    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   =
FN_PTR(Unsafe_GetObjectVolatile)},
+-    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
++    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObject)},
++    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObject)},
++    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   =
FN_PTR(Unsafe_GetObjectVolatile)},
++    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  =
FN_PTR(Unsafe_SetObjectVolatile)},
+=20
+     DECLARE_GETSETOOP(Boolean, Z),
+     DECLARE_GETSETOOP(Byte, B),
+@@ -1602,36 +1602,36 @@
+     DECLARE_GETSETNATIVE(Float, F),
+     DECLARE_GETSETNATIVE(Double, D),
+=20
+-    {CC"getAddress",         CC"("ADR")"ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
+-    {CC"putAddress",         CC"("ADR""ADR")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
++    {CC"getAddress",         CC"(" ADR ")" ADR,             =
FN_PTR(Unsafe_GetNativeAddress)},
++    {CC"putAddress",         CC"(" ADR "" ADR ")V",          =
FN_PTR(Unsafe_SetNativeAddress)},
+=20
+-    {CC"allocateMemory",     CC"(J)"ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
+-    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
+-    {CC"freeMemory",         CC"("ADR")V",               =
FN_PTR(Unsafe_FreeMemory)},
+-
+-    {CC"objectFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
+-    {CC"staticFieldOffset",  CC"("FLD")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
+-    {CC"staticFieldBase",    CC"("FLD")"OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
+-    {CC"ensureClassInitialized",CC"("CLS")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
+-    {CC"arrayBaseOffset",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
+-    {CC"arrayIndexScale",    CC"("CLS")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
++    {CC"allocateMemory",     CC"(J)" ADR,                 =
FN_PTR(Unsafe_AllocateMemory)},
++    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            =
FN_PTR(Unsafe_ReallocateMemory)},
++    {CC"freeMemory",         CC"(" ADR ")V",               =
FN_PTR(Unsafe_FreeMemory)},
++
++    {CC"objectFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_ObjectFieldOffset)},
++    {CC"staticFieldOffset",  CC"(" FLD ")J",               =
FN_PTR(Unsafe_StaticFieldOffset)},
++    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             =
FN_PTR(Unsafe_StaticFieldBaseFromField)},
++    {CC"ensureClassInitialized",CC"(" CLS ")V",            =
FN_PTR(Unsafe_EnsureClassInitialized)},
++    {CC"arrayBaseOffset",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayBaseOffset)},
++    {CC"arrayIndexScale",    CC"(" CLS ")I",               =
FN_PTR(Unsafe_ArrayIndexScale)},
+     {CC"addressSize",        CC"()I",                    =
FN_PTR(Unsafe_AddressSize)},
+     {CC"pageSize",           CC"()I",                    =
FN_PTR(Unsafe_PageSize)},
+=20
+-    {CC"defineClass",        CC"("DC_Args")"CLS,         =
FN_PTR(Unsafe_DefineClass)},
+-    {CC"allocateInstance",   CC"("CLS")"OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
+-    {CC"monitorEnter",       CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
+-    {CC"monitorExit",        CC"("OBJ")V",               =
FN_PTR(Unsafe_MonitorExit)},
+-    {CC"tryMonitorEnter",    CC"("OBJ")Z",               =
FN_PTR(Unsafe_TryMonitorEnter)},
+-    {CC"throwException",     CC"("THR")V",               =
FN_PTR(Unsafe_ThrowException)},
+-    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
+-    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
+-    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
+-    {CC"putOrderedObject",   CC"("OBJ"J"OBJ")V",         =
FN_PTR(Unsafe_SetOrderedObject)},
+-    {CC"putOrderedInt",      CC"("OBJ"JI)V",             =
FN_PTR(Unsafe_SetOrderedInt)},
+-    {CC"putOrderedLong",     CC"("OBJ"JJ)V",             =
FN_PTR(Unsafe_SetOrderedLong)},
++    {CC"defineClass",        CC"(" DC_Args ")" CLS,         =
FN_PTR(Unsafe_DefineClass)},
++    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             =
FN_PTR(Unsafe_AllocateInstance)},
++    {CC"monitorEnter",       CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorEnter)},
++    {CC"monitorExit",        CC"(" OBJ ")V",               =
FN_PTR(Unsafe_MonitorExit)},
++    {CC"tryMonitorEnter",    CC"(" OBJ ")Z",               =
FN_PTR(Unsafe_TryMonitorEnter)},
++    {CC"throwException",     CC"(" THR ")V",               =
FN_PTR(Unsafe_ThrowException)},
++    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  =
FN_PTR(Unsafe_CompareAndSwapObject)},
++    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      =
FN_PTR(Unsafe_CompareAndSwapInt)},
++    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      =
FN_PTR(Unsafe_CompareAndSwapLong)},
++    {CC"putOrderedObject",   CC"(" OBJ "J" OBJ ")V",         =
FN_PTR(Unsafe_SetOrderedObject)},
++    {CC"putOrderedInt",      CC"(" OBJ "JI)V",             =
FN_PTR(Unsafe_SetOrderedInt)},
++    {CC"putOrderedLong",     CC"(" OBJ "JJ)V",             =
FN_PTR(Unsafe_SetOrderedLong)},
+     {CC"park",               CC"(ZJ)V",                  =
FN_PTR(Unsafe_Park)},
+-    {CC"unpark",             CC"("OBJ")V",               =
FN_PTR(Unsafe_Unpark)}
++    {CC"unpark",             CC"(" OBJ ")V",               =
FN_PTR(Unsafe_Unpark)}
+ };
+=20
+ JNINativeMethod loadavg_method[] =3D {
+@@ -1639,28 +1639,28 @@
+ };
+=20
+ JNINativeMethod prefetch_methods[] =3D {
+-    {CC"prefetchRead",       CC"("OBJ"J)V",              =
FN_PTR(Unsafe_PrefetchRead)},
+-    {CC"prefetchWrite",      CC"("OBJ"J)V",              =
FN_PTR(Unsafe_PrefetchWrite)},
+-    {CC"prefetchReadStatic", CC"("OBJ"J)V",              =
FN_PTR(Unsafe_PrefetchRead)},
+-    {CC"prefetchWriteStatic",CC"("OBJ"J)V",              =
FN_PTR(Unsafe_PrefetchWrite)}
++    {CC"prefetchRead",       CC"(" OBJ "J)V",              =
FN_PTR(Unsafe_PrefetchRead)},
++    {CC"prefetchWrite",      CC"(" OBJ "J)V",              =
FN_PTR(Unsafe_PrefetchWrite)},
++    {CC"prefetchReadStatic", CC"(" OBJ "J)V",              =
FN_PTR(Unsafe_PrefetchRead)},
++    {CC"prefetchWriteStatic",CC"(" OBJ "J)V",              =
FN_PTR(Unsafe_PrefetchWrite)}
+ };
+=20
+ JNINativeMethod memcopy_methods_17[] =3D {
+-    {CC"copyMemory",         CC"("OBJ"J"OBJ"JJ)V",       =
FN_PTR(Unsafe_CopyMemory2)},
+-    {CC"setMemory",          CC"("OBJ"JJB)V",            =
FN_PTR(Unsafe_SetMemory2)}
++    {CC"copyMemory",         CC"(" OBJ "J" OBJ "JJ)V",       =
FN_PTR(Unsafe_CopyMemory2)},
++    {CC"setMemory",          CC"(" OBJ "JJB)V",            =
FN_PTR(Unsafe_SetMemory2)}
+ };
+=20
+ JNINativeMethod memcopy_methods_15[] =3D {
+-    {CC"setMemory",          CC"("ADR"JB)V",             =
FN_PTR(Unsafe_SetMemory)},
+-    {CC"copyMemory",         CC"("ADR ADR"J)V",          =
FN_PTR(Unsafe_CopyMemory)}
++    {CC"setMemory",          CC"(" ADR "JB)V",             =
FN_PTR(Unsafe_SetMemory)},
++    {CC"copyMemory",         CC"(" ADR ADR "J)V",          =
FN_PTR(Unsafe_CopyMemory)}
+ };
+=20
+ JNINativeMethod anonk_methods[] =3D {
+-    {CC"defineAnonymousClass", CC"("DAC_Args")"CLS,      =
FN_PTR(Unsafe_DefineAnonymousClass)},
++    {CC"defineAnonymousClass", CC"(" DAC_Args ")" CLS,      =
FN_PTR(Unsafe_DefineAnonymousClass)},
+ };
+=20
+ JNINativeMethod lform_methods[] =3D {
+-    {CC"shouldBeInitialized",CC"("CLS")Z",               =
FN_PTR(Unsafe_ShouldBeInitialized)},
++    {CC"shouldBeInitialized",CC"(" CLS ")Z",               =
FN_PTR(Unsafe_ShouldBeInitialized)},
+ };
+=20
+ JNINativeMethod fence_methods[] =3D {
+--- hotspot/src/share/vm/prims/whitebox.cpp.orig	2015-09-02 =
18:55:43.000000000 +0200
++++ hotspot/src/share/vm/prims/whitebox.cpp	2015-09-02 =
18:58:04.000000000 +0200
+@@ -157,8 +157,8 @@
+=20
+ WB_ENTRY(void, WB_PrintHeapSizes(JNIEnv* env, jobject o)) {
+   CollectorPolicy * p =3D Universe::heap()->collector_policy();
+-  gclog_or_tty->print_cr("Minimum heap "SIZE_FORMAT" Initial heap "
+-    SIZE_FORMAT" Maximum heap "SIZE_FORMAT" Min alignment =
"SIZE_FORMAT" Max alignment "SIZE_FORMAT,
++  gclog_or_tty->print_cr("Minimum heap " SIZE_FORMAT " Initial heap "
++    SIZE_FORMAT " Maximum heap " SIZE_FORMAT " Min alignment " =
SIZE_FORMAT " Max alignment " SIZE_FORMAT,
+     p->min_heap_byte_size(), p->initial_heap_byte_size(), =
p->max_heap_byte_size(),
+     p->space_alignment(), p->heap_alignment());
+ }
+@@ -193,8 +193,8 @@
+          Universe::narrow_oop_use_implicit_null_checks() )) {
+     tty->print_cr("WB_ReadFromNoaccessArea method is useless:\n "
+                   "\tUseCompressedOops is %d\n"
+-                  "\trhs.base() is "PTR_FORMAT"\n"
+-                  "\tUniverse::narrow_oop_base() is "PTR_FORMAT"\n"
++                  "\trhs.base() is " PTR_FORMAT "\n"
++                  "\tUniverse::narrow_oop_base() is " PTR_FORMAT "\n"
+                   "\tUniverse::narrow_oop_use_implicit_null_checks() =
is %d",
+                   UseCompressedOops,
+                   rhs.base(),
+@@ -247,8 +247,8 @@
+=20
+ WB_ENTRY(jint, WB_StressVirtualSpaceResize(JNIEnv* env, jobject o,
+         jlong reserved_space_size, jlong magnitude, jlong iterations))
+-  tty->print_cr("reservedSpaceSize=3D"JLONG_FORMAT", =
magnitude=3D"JLONG_FORMAT", "
+-                "iterations=3D"JLONG_FORMAT"\n", reserved_space_size, =
magnitude,
++  tty->print_cr("reservedSpaceSize=3D" JLONG_FORMAT ", magnitude=3D" =
JLONG_FORMAT ", "
++                "iterations=3D" JLONG_FORMAT "\n", =
reserved_space_size, magnitude,
+                 iterations);
+   if (reserved_space_size < 0 || magnitude < 0 || iterations < 0) {
+     tty->print_cr("One of variables printed above is negative. Can't =
proceed.\n");
+--- hotspot/src/share/vm/oops/markOop.cpp.orig	2015-09-10 =
13:28:34.918039653 +0200
++++ hotspot/src/share/vm/oops/markOop.cpp	2015-09-10 =
13:29:26.890039849 +0200
+@@ -49,7 +49,7 @@
+         st->print("monitor=3DNULL");
+       else {
+         BasicLock * bl =3D (BasicLock *) mon->owner();
+-        =
st->print("monitor=3D{count=3D"INTPTR_FORMAT",waiters=3D"INTPTR_FORMAT",re=
cursions=3D"INTPTR_FORMAT",owner=3D"INTPTR_FORMAT"}",
++        st->print("monitor=3D{count=3D" INTPTR_FORMAT ",waiters=3D" =
INTPTR_FORMAT ",recursions=3D" INTPTR_FORMAT ",owner=3D" INTPTR_FORMAT =
"}",
+                 mon->count(), mon->waiters(), mon->recursions(), =
p2i(bl));
+       }
+     } else {
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.pa=
tch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.pa=
tch
new file mode 100644
index 0000000..8086142
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.pa=
tch
@@ -0,0 +1,17 @@
+--- jdk/make/GenerateSources.gmk.orig	2015-08-24 11:23:34.720648954 =
+0200
++++ jdk/make/GenerateSources.gmk	2015-08-24 11:24:41.376649205 =
+0200
+@@ -73,9 +73,11 @@
+     GENSRC +=3D $(GENSRC_OSX_ICONS)
+   endif
+=20
+-  ifneq ($(OPENJDK_TARGET_OS), macosx)
+-    include gensrc/GensrcX11Wrappers.gmk
+-    GENSRC +=3D $(GENSRC_X11WRAPPERS)
++  ifndef BUILD_HEADLESS_ONLY
++    ifneq ($(OPENJDK_TARGET_OS), macosx)
++      include gensrc/GensrcX11Wrappers.gmk
++      GENSRC +=3D $(GENSRC_X11WRAPPERS)
++    endif
+   endif
+ endif
+=20
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch
new file mode 100644
index 0000000..10f55d6
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch
@@ -0,0 +1,94 @@
+--- jdk/make/lib/Awt2dLibraries.gmk.orig	2015-09-03 =
15:05:21.429981848 +0200
++++ jdk/make/lib/Awt2dLibraries.gmk	2015-09-03 15:05:44.705981936 =
+0200
+@@ -235,6 +235,10 @@
+   LIBAWT_DIRS +=3D $(JDK_TOPDIR)/src/aix/porting
+ endif
+=20
++ifdef BUILD_HEADLESS_ONLY
++LIBAWT_CFLAGS +=3D -DHEADLESS=3Dtrue
++endif
++
+ LIBAWT_CFLAGS +=3D -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES \
+     $(X_CFLAGS) \
+     $(foreach dir, $(LIBAWT_DIRS), -I$(dir))
+@@ -1126,17 +1130,28 @@
+           =
-F/System/Library/Frameworks/ApplicationServices.framework/Frameworks
+     endif
+=20
+-    LIBAWT_HEADLESS_FILES :=3D \
+-        awt_Font.c \
+-        HeadlessToolkit.c \
+-        fontpath.c \
+-        VDrawingArea.c \
++    ifndef X11_NOT_NEEDED
++    LIBAWT_HEADLESS_X11_FILES :=3D \
+         X11Color.c \
+         X11Renderer.c \
+         X11PMBlitLoops.c \
+         X11SurfaceData.c \
+         X11FontScaler_md.c \
+         X11TextRenderer_md.c \
++        GLXGraphicsConfig.c \
++        GLXSurfaceData.c
++    endif
++
++    ifndef CUPS_NOT_NEEDED
++    LIBAWT_HEADLESS_CUPS_FILES :=3D \
++        CUPSfuncs.c
++    endif
++
++    LIBAWT_HEADLESS_FILES :=3D \
++        awt_Font.c \
++        HeadlessToolkit.c \
++        fontpath.c \
++        VDrawingArea.c \
+         OGLBlitLoops.c \
+         OGLBufImgOps.c \
+         OGLContext.c \
+@@ -1149,10 +1164,9 @@
+         OGLSurfaceData.c \
+         OGLTextRenderer.c \
+         OGLVertexCache.c \
+-        GLXGraphicsConfig.c \
+-        GLXSurfaceData.c \
+         AccelGlyphCache.c \
+-        CUPSfuncs.c
++	$(LIBAWT_HEADLESS_X11_FILES) \
++	$(LIBAWT_HEADLESS_CUPS_FILES)
+=20
+     LIBAWT_HEADLESS_REORDER :=3D
+     ifeq ($(OPENJDK_TARGET_OS), solaris)
+--- jdk/make/CompileNativeLibraries.gmk.orig	2015-08-24 =
13:35:55.320678845 +0200
++++ jdk/make/CompileNativeLibraries.gmk	2015-08-24 =
13:36:22.776678949 +0200
+@@ -85,7 +85,9 @@
+=20
+ include lib/Awt2dLibraries.gmk
+=20
++ifndef BUILD_SOUNDLESS_ONLY
+ include lib/SoundLibraries.gmk
++endif
+=20
+ # Include the corresponding custom file, if present.=20
+ -include $(CUSTOM_MAKE_DIR)/CompileNativeLibraries.gmk
+--- jdk/src/solaris/native/sun/awt/jawt.c.orig	2015-08-24 =
14:12:29.376687104 +0200
++++ jdk/src/solaris/native/sun/awt/jawt.c	2015-08-24 =
14:16:20.420687974 +0200
+@@ -33,7 +33,7 @@
+  */
+ JNIEXPORT jboolean JNICALL JAWT_GetAWT(JNIEnv* env, JAWT* awt)
+ {
+-#if defined(JAVASE_EMBEDDED) && defined(HEADLESS)
++#if defined(JAVASE_EMBEDDED) || defined(HEADLESS)
+     /* there are no AWT libs available at all */
+     return JNI_FALSE;
+ #else
+--- jdk/src/solaris/native/sun/awt/utility/rect.h.orig	2015-09-03 =
14:45:40.717977403 +0200
++++ jdk/src/solaris/native/sun/awt/utility/rect.h	2015-09-03 =
14:46:46.337977650 +0200
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+=20
+-#ifndef MACOSX
++#if !(defined(MACOSX) || defined(HEADLESS))
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-fav=
our-of-openembedded-package-split.patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-fav=
our-of-openembedded-package-split.patch
new file mode 100644
index 0000000..bc5dd7e
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-fav=
our-of-openembedded-package-split.patch
@@ -0,0 +1,120 @@
+--- make/common/NativeCompilation.gmk.orig	2015-09-09 =
17:15:33.869765681 +0200
++++ make/common/NativeCompilation.gmk	2015-09-09 17:55:26.485774688 =
+0200
+@@ -434,58 +434,6 @@
+           $$($1_OUTPUT_DIR)/% : $$($1_OBJECT_DIR)/%
+ 		$(CP) $$< $$@
+         endif
+-
+-        ifneq ($(OPENJDK_TARGET_OS), macosx)   # OBJCOPY is not used =
on MacOS X
+-          ifneq ($(OPENJDK_TARGET_OS), windows)  # nor on Windows
+-            ifeq ($(OPENJDK_TARGET_OS), solaris)
+-              # gobjcopy crashes on "empty" section headers with the =
SHF_ALLOC flag set.
+-              # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC =
flag (if set) from
+-              # empty section headers until a fixed $(OBJCOPY) is =
available.
+-              # An empty section header has sh_addr =3D=3D 0 and =
sh_size =3D=3D 0.
+-              # This problem has only been seen on Solaris X64, but we =
call this tool
+-              # on all Solaris builds just in case.
+-              #
+-              # $(OBJCOPY) --add-gnu-debuglink=3D... corrupts SUNW_* =
sections.
+-              # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is =
available.
+-              =
$$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : =
$$($1_TARGET) \
+-				$(FIX_EMPTY_SEC_HDR_FLAGS) =
$(ADD_GNU_DEBUGLINK)
+-		$(RM) $$@
+-		$(FIX_EMPTY_SEC_HDR_FLAGS) $(LOG_INFO) $$<
+-		$(OBJCOPY) --only-keep-debug $$< $$@
+-		$(CD) $$(@D) && $(ADD_GNU_DEBUGLINK) $(LOG_INFO) $$(@F) =
$$<
+-            else # not solaris
+-              =
$$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : =
$$($1_TARGET)
+-		$(RM) $$@
+-		$(OBJCOPY) --only-keep-debug $$< $$@
+-		$(CD) $$(@D) && $(OBJCOPY) --add-gnu-debuglink=3D$$(@F) =
$$<
+-            endif # Touch to not retrigger rule on rebuild
+-		$(TOUCH) $$@
+-          endif # !windows
+-        endif # !macosx
+-
+-        ifeq ($(ZIP_DEBUGINFO_FILES), true)
+-ifneq ($(OPENJDK_TARGET_OS), macosx) # no MacOS X support yet
+-          $1 +=3D =
$$($1_OUTPUT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).diz
+-
+-          ifeq ($(OPENJDK_TARGET_OS), windows)
+-            $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).diz : =
$$($1_TARGET)
+-		$(CD) $$($1_OBJECT_DIR) \
+-		&& $(ZIP) -q $$@ $$($1_LIBRARY).map $$($1_LIBRARY).pdb
+-          else
+-            $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).diz : =
$$($1_TARGET) \
+-                =
$$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
+-		$(CD) $$($1_OBJECT_DIR) \
+-		&& $(ZIP) -q $$@ =
$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
+-          endif
+-endif # no MacOS X support yet
+-        else
+-          ifeq ($(OPENJDK_TARGET_OS), windows)
+-            $1 +=3D $$($1_OUTPUT_DIR)/$$($1_LIBRARY).map \
+-                $$($1_OUTPUT_DIR)/$$($1_LIBRARY).pdb
+-          else ifneq ($(OPENJDK_TARGET_OS), macosx) # MacOS X does not =
use .debuginfo files
+-            $1 +=3D =
$$($1_OUTPUT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
+-          endif
+-        endif
+       endif
+     endif
+=20
+@@ -518,58 +466,6 @@
+           $$($1_OUTPUT_DIR)/% : $$($1_OBJECT_DIR)/%
+ 		$(CP) $$< $$@
+         endif
+-
+-        ifneq ($(OPENJDK_TARGET_OS), macosx)   # OBJCOPY is not used =
on MacOS X
+-          ifneq ($(OPENJDK_TARGET_OS), windows)  # nor on Windows
+-            ifeq ($(OPENJDK_TARGET_OS), solaris)
+-              # gobjcopy crashes on "empty" section headers with the =
SHF_ALLOC flag set.
+-              # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC =
flag (if set) from
+-              # empty section headers until a fixed $(OBJCOPY) is =
available.
+-              # An empty section header has sh_addr =3D=3D 0 and =
sh_size =3D=3D 0.
+-              # This problem has only been seen on Solaris X64, but we =
call this tool
+-              # on all Solaris builds just in case.
+-              #
+-              # $(OBJCOPY) --add-gnu-debuglink=3D... corrupts SUNW_* =
sections.
+-              # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is =
available.
+-              $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : =
$$($1_TARGET) \
+-				$(FIX_EMPTY_SEC_HDR_FLAGS) =
$(ADD_GNU_DEBUGLINK)
+-		$(RM) $$@
+-		$(FIX_EMPTY_SEC_HDR_FLAGS) $(LOG_INFO) $$<
+-		$(OBJCOPY) --only-keep-debug $$< $$@
+-		$(CD) $$(@D) && $(ADD_GNU_DEBUGLINK) $(LOG_INFO) $$(@F) =
$$<
+-            else # not solaris
+-              $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : =
$$($1_TARGET)
+-		$(RM) $$@
+-		$(OBJCOPY) --only-keep-debug $$< $$@
+-		$(CD) $$(@D) && $(OBJCOPY) --add-gnu-debuglink=3D$$(@F) =
$$<
+-            endif
+-		$(TOUCH) $$@
+-          endif # !windows
+-        endif # !macosx
+-
+-        ifeq ($(ZIP_DEBUGINFO_FILES), true)
+-ifneq ($(OPENJDK_TARGET_OS), macosx) # no MacOS X support yet
+-          $1 +=3D $$($1_OUTPUT_DIR)/$$($1_PROGRAM).diz
+-
+-          ifeq ($(OPENJDK_TARGET_OS), windows)
+-            $$($1_OBJECT_DIR)/$$($1_PROGRAM).diz : $$($1_TARGET)
+-		$(CD) $$($1_OBJECT_DIR) \
+-		&& $(ZIP) -q $$@ $$($1_PROGRAM).map $$($1_PROGRAM).pdb
+-          else
+-            $$($1_OBJECT_DIR)/$$(PROGRAM_PREFIX)$$($1_PROGRAM).diz : =
$$($1_TARGET) \
+-                $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo
+-		$(CD) $$($1_OBJECT_DIR) \
+-		&& $(ZIP) -q $$@ $$($1_PROGRAM).debuginfo
+-          endif
+-endif # no MacOS X support yet
+-        else
+-          ifeq ($(OPENJDK_TARGET_OS), windows)
+-            $1 +=3D $$($1_OUTPUT_DIR)/$$($1_PROGRAM).map \
+-                $$($1_OUTPUT_DIR)/$$($1_PROGRAM).pdb
+-          else ifneq ($(OPENJDK_TARGET_OS), macosx) # MacOS X does not =
use .debuginfo files
+-            $1 +=3D $$($1_OUTPUT_DIR)/$$($1_PROGRAM).debuginfo
+-          endif
+-        endif
+       endif
+     endif
+=20
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.=
patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.=
patch
new file mode 100644
index 0000000..d33dc96
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.=
patch
@@ -0,0 +1,11 @@
+--- hotspot/make/linux/makefiles/dtrace.make.orig	2015-09-01 =
08:00:59.737868760 +0200
++++ hotspot/make/linux/makefiles/dtrace.make	2015-09-01 =
08:01:24.049859677 +0200
+@@ -40,7 +40,7 @@
+ ifneq ($(ALT_SDT_H),)
+   SDT_H_FILE =3D $(ALT_SDT_H)
+ else
+-  SDT_H_FILE =3D /usr/include/sys/sdt.h
++  SDT_H_FILE =3D $(SYS_ROOT)/usr/include/sys/sdt.h
+ endif
+ DTRACE_ENABLED =3D $(shell test -f $(SDT_H_FILE) && echo =
$(SDT_H_FILE))
+ REASON =3D "$(SDT_H_FILE) not found"
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/openjdk8-use_builtin_frame_addres=
s_0_rather_than_returning_address_of_local_variable.patch =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-use_builtin_frame_addres=
s_0_rather_than_returning_address_of_local_variable.patch
new file mode 100644
index 0000000..9e1d204
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/openjdk8-use_builtin_frame_addres=
s_0_rather_than_returning_address_of_local_variable.patch
@@ -0,0 +1,23 @@
+# HG changeset patch
+# User sgehwolf
+# Date 1434121785 -3600
+# Node ID 6217fd2c767b467641bf7b41a9c37273e8fa0cbd
+# Parent  ff0929a59ced0e144201aa05819ae2e47d6f2c61
+8087120: [GCC5] java.lang.StackOverflowError on Zero JVM initialization =
on non x86 platforms.
+Summary: Use __builtin_frame_address(0) rather than returning address =
of local variable.
+Reviewed-by: dholmes
+
+diff -r ff0929a59ced -r 6217fd2c767b =
src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+--- hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp.orig	Thu Jun =
11 20:19:26 2015 -0700
++++ hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp	Fri Jun 12 =
16:09:45 2015 +0100
+@@ -59,8 +59,8 @@
+ extern sigjmp_buf* get_jmp_buf_for_continuation();
+=20
+ address os::current_stack_pointer() {
+-  address dummy =3D (address) &dummy;
+-  return dummy;
++  // return the address of the current function
++  return (address)__builtin_frame_address(0);
+ }
+=20
+ frame os::get_sender_for_C_frame(frame* fr) {
diff --git =
a/recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoh=
eader.patch =
b/recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoh=
eader.patch
new file mode 100644
index 0000000..61eddc7
--- /dev/null
+++ =
b/recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoh=
eader.patch
@@ -0,0 +1,31 @@
+--- common/autoconf/basics.m4.orig	2015-08-17 18:02:01.642657746 =
+0200
++++ common/autoconf/basics.m4	2015-08-17 18:14:44.046660616 +0200
+@@ -466,21 +466,21 @@
+   AC_SUBST(OUTPUT_ROOT, $OUTPUT_ROOT)
+=20
+   # Most of the probed defines are put into config.h
+-  AC_CONFIG_HEADERS([$OUTPUT_ROOT/config.h:$AUTOCONF_DIR/config.h.in])
++  AC_CONFIG_HEADERS([config.h:config.h.in])
+   # The spec.gmk file contains all variables for the make system.
+-  AC_CONFIG_FILES([$OUTPUT_ROOT/spec.gmk:$AUTOCONF_DIR/spec.gmk.in])
++  AC_CONFIG_FILES([spec.gmk:spec.gmk.in])
+   # The hotspot-spec.gmk file contains legacy variables for the =
hotspot make system.
+-  =
AC_CONFIG_FILES([$OUTPUT_ROOT/hotspot-spec.gmk:$AUTOCONF_DIR/hotspot-spec.=
gmk.in])
++  AC_CONFIG_FILES([hotspot-spec.gmk:hotspot-spec.gmk.in])
+   # The bootcycle-spec.gmk file contains support for boot cycle =
builds.
+-  =
AC_CONFIG_FILES([$OUTPUT_ROOT/bootcycle-spec.gmk:$AUTOCONF_DIR/bootcycle-s=
pec.gmk.in])
++  AC_CONFIG_FILES([bootcycle-spec.gmk:bootcycle-spec.gmk.in])
+   # The compare.sh is used to compare the build output to other =
builds.
+-  =
AC_CONFIG_FILES([$OUTPUT_ROOT/compare.sh:$AUTOCONF_DIR/compare.sh.in])
++  AC_CONFIG_FILES([compare.sh:compare.sh.in])
+   # Spec.sh is currently used by compare-objects.sh
+-  AC_CONFIG_FILES([$OUTPUT_ROOT/spec.sh:$AUTOCONF_DIR/spec.sh.in])
++  AC_CONFIG_FILES([spec.sh:spec.sh.in])
+   # The generated Makefile knows where the spec.gmk is and where the =
source is.
+   # You can run make from the OUTPUT_ROOT, or from the top-level =
Makefile
+   # which will look for generated configurations
+-  AC_CONFIG_FILES([$OUTPUT_ROOT/Makefile:$AUTOCONF_DIR/Makefile.in])
++  AC_CONFIG_FILES([Makefile:Makefile.in])
+=20
+   # Save the arguments given to us
+   echo "$CONFIGURE_COMMAND_LINE" > $OUTPUT_ROOT/configure-arguments
--=20
1.9.1


--=20
Jens Rehsack - rehsack@gmail.com


