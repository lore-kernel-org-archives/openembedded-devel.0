Return-Path: <guy.shapiro@mobi-wize.com>
X-Greylist: delayed 1249 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Feb 2017 14:17:01 UTC
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
	[192.185.44.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F74C73085
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:17:01 +0000 (UTC)
Received: from cm1.websitewelcome.com (unknown [192.185.0.102])
	by gateway20.websitewelcome.com (Postfix) with ESMTP id 4E21E400CCD58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:56:13 -0600 (CST)
Received: from gator3269.hostgator.com ([198.57.247.233])
	by cm1.websitewelcome.com with 
	id npwB1u00q52sfJW01pwCXo; Wed, 22 Feb 2017 07:56:13 -0600
Received: from [213.57.90.22] (port=59568 helo=coyote.mobiwize)
	by gator3269.hostgator.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <guy.shapiro@mobi-wize.com>)
	id 1cgXOt-000Xcr-4F; Wed, 22 Feb 2017 07:56:11 -0600
From: Guy Shapiro <guy.shapiro@mobi-wize.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:54:03 +0200
Message-Id: <1487771643-6088-1-git-send-email-guy.shapiro@mobi-wize.com>
X-Mailer: git-send-email 2.1.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3269.hostgator.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - mobi-wize.com
X-BWhitelist: no
X-Source-IP: 213.57.90.22
X-Exim-ID: 1cgXOt-000Xcr-4F
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (coyote.mobiwize) [213.57.90.22]:59568
X-Source-Auth: guy.shapiro@mobi-wize.com
X-Email-Count: 2
X-Source-Cap: bW9iaXdpemU7bW9iaXdpemU7Z2F0b3IzMjY5Lmhvc3RnYXRvci5jb20=
Cc: Srinivasa Rao Ragolu <sragolu@mvista.com>
Subject: [PATCH] openjdk-8: recipe for jdk8u121-b13-aarch32
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
X-List-Received-Date: Wed, 22 Feb 2017 14:17:02 -0000

Hi all,

The following patch adds a recipe for building the updated openjdk-8 ARM port.
This JVM version is significantly faster than the current one.
This is still "work in progress", but can be used to create a useful package.
Regards,
Guy

P.S. I'm not going to be responsive on mail in the next weeks. Please accept my
apology in advance for delayed answers.

---
Main changes:
- Fetch the code from the aarch32-port repository. This repository
  contains the C1 (Client) JIT, making it much faster than the
  currently used version.
- Compile using the newly available Client JVM variant.
- Don't apply some old patches that prevents the code from being
  compiled.
- Do not install modified jvm.cfg. Keep the built one instead.

Main issues:
- The license file change (address update) breaks the build of old
  versions.
- headful/X11 builds still fail.

Signed-off-by: Guy Shapiro <guy.shapiro@mobi-wize.com>
---
 recipes-core/openjdk/openjdk-8-common.inc         |  4 +-
 recipes-core/openjdk/openjdk-8-cross.inc          |  1 +
 recipes-core/openjdk/openjdk-8-native_121b13.bb   |  2 +
 recipes-core/openjdk/openjdk-8-release-121b13.inc | 83 +++++++++++++++++++
 recipes-core/openjdk/openjdk-8_121b13.bb          | 99 +++++++++++++++++++++++
 recipes-core/openjdk/openjre-8_121b13.bb          | 54 +++++++++++++
 6 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/openjdk/openjdk-8-native_121b13.bb
 create mode 100644 recipes-core/openjdk/openjdk-8-release-121b13.inc
 create mode 100644 recipes-core/openjdk/openjdk-8_121b13.bb
 create mode 100644 recipes-core/openjdk/openjre-8_121b13.bb

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index def779d..0e7d258 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Java runtime based upon the OpenJDK Project"
 HOMEPAGE = "http://http://openjdk.java.net/"
 LICENSE  = "GPL-2.0-with-classpath-exception"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7b4baeedfe2d40cb03536573bc2c89b1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fac05c3c03d4a26bbda13f8f"
 
 inherit java autotools gettext qemu pkgconfig
 
@@ -196,6 +196,8 @@ def get_jdk_arch(d):
     jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     if jdk_arch == "x86-64":
         jdk_arch = "amd64"
+    elif jdk_arch == "arm":
+        jdk_arch = "aarch32"
     elif jdk_arch == "powerpc":
         jdk_arch = "ppc"
     elif jdk_arch == "powerpc64":
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 47fe35d..ce98152 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -28,6 +28,7 @@ PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib,"
 export WANT_LLVM_RELEASE = "3.5.2"
 PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
 PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
+PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
 
 PACKAGECONFIG[repack] = ",,,"
 
diff --git a/recipes-core/openjdk/openjdk-8-native_121b13.bb b/recipes-core/openjdk/openjdk-8-native_121b13.bb
new file mode 100644
index 0000000..f75cfc8
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-native_121b13.bb
@@ -0,0 +1,2 @@
+require openjdk-8-release-121b13.inc
+require openjdk-8-native.inc
diff --git a/recipes-core/openjdk/openjdk-8-release-121b13.inc b/recipes-core/openjdk/openjdk-8-release-121b13.inc
new file mode 100644
index 0000000..441ee1f
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-121b13.inc
@@ -0,0 +1,83 @@
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
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
+# Currently the arm port supports only the client JIT (or the Zero interpreter)
+# For details see (http://mail.openjdk.java.net/pipermail/aarch32-port-dev/2017-February/000750.html)
+PACKAGECONFIG_append_arm = " client"
+
+CORBA_CHANGESET = "093c20d822cc"
+SRC_URI[corba.md5sum] = "978bd5ebaf495bb99f5a436d60f39587"
+SRC_URI[corba.sha256sum] = "571826a06659b5afbe3ec0ea22178c53a6b029ad1b17a763cbe1537d78a3f19e"
+
+HOTSPOT_CHANGESET = "2d40c68f1daa"
+SRC_URI[hotspot.md5sum] = "58013c035b578f8f11c4d00ac6ac4e95"
+SRC_URI[hotspot.sha256sum] = "2577cfe778f4eab3e392d3772149176936792238e8cfcc5b82bd743007655ca0"
+
+JAXP_CHANGESET = "1bd8db5ce718"
+SRC_URI[jaxp.md5sum] = "d6de6091c26dbe0ae2aa7951a677edeb"
+SRC_URI[jaxp.sha256sum] = "dcace543a0a61db258e2b05859e63ebdba79910501a29f84f6605e4c1c9010d5"
+
+JAXWS_CHANGESET = "7ed8fcc10d0c"
+SRC_URI[jaxws.md5sum] = "a22232cfabb1c6684a9792c1ac5648f6"
+SRC_URI[jaxws.sha256sum] = "ed818fab52b5db9ba785ba064ebaff494837205a3c271ff8569a668dac6708a8"
+
+JDK_CHANGESET = "16729db11724"
+SRC_URI[jdk.md5sum] = "852107da4bf27fcb93d27bb8752a93fb"
+SRC_URI[jdk.sha256sum] = "c011db48e85757615557e04b205c8ebd48a3e249ae0235e172e4ac5a30d34ce4"
+
+LANGTOOLS_CHANGESET = "e371a84a0763"
+SRC_URI[langtools.md5sum] = "d73c0ff9d58ffce38ef4bca64868b4e8"
+SRC_URI[langtools.sha256sum] = "0c238dc6c6f50c6b1b08d37102c188f70bb04c4628e9b49e6d753db62429e24c"
+
+NASHORN_CHANGESET = "931298dbe3cf"
+SRC_URI[nashorn.md5sum] = "61008a331b72d5afbdf52375acd45956"
+SRC_URI[nashorn.sha256sum] = "33f3877f81c80150b62cd53fe815eac8ec7fdee6a116f5cedc6208e35380295d"
+
+OPENJDK_CHANGESET = "cb8f12bf1e86"
+SRC_URI[openjdk.md5sum] = "0738a58b7f0dd77a638d1127f17a19c3"
+SRC_URI[openjdk.sha256sum] = "0b0af46573ed08cedbde4a5bdefa1e8cda63bdb679b5d46be789ec602911fce4"
+
+OPENJDK_HG_U = "jdk8u"
+OPENJDK_HG_URL = "http://hg.openjdk.java.net/aarch32-port/${OPENJDK_HG_U}"
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
diff --git a/recipes-core/openjdk/openjdk-8_121b13.bb b/recipes-core/openjdk/openjdk-8_121b13.bb
new file mode 100644
index 0000000..42ea6fe
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_121b13.bb
@@ -0,0 +1,99 @@
+require openjdk-8-release-121b13.inc
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
diff --git a/recipes-core/openjdk/openjre-8_121b13.bb b/recipes-core/openjdk/openjre-8_121b13.bb
new file mode 100644
index 0000000..9ef33e7
--- /dev/null
+++ b/recipes-core/openjdk/openjre-8_121b13.bb
@@ -0,0 +1,54 @@
+require openjdk-8-release-121b13.inc
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
2.1.4


