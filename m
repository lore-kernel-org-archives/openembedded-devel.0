Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UKOIf-0004dd-Tm
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 08:28:18 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 0A24BD22B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 08:11:11 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2013 08:11:05 +0100
Message-Id: <1364281865-8509-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
References: <01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tbb: add 4.1 20130116 version (4.1 update 2)
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
X-List-Received-Date: Tue, 26 Mar 2013 07:28:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Intel=C2=AE Threading Building Blocks (Intel=C2=AE TBB) lets you easily w=
rite
parallel C++ programs that take full advantage of multicore performance,
that are portable and composable, and that have future-proof
scalability.

Natively supports only x86(-64) targets with fallbacks for non-supported
architectures. There is a work at Linaro to add AArch64 and ARMv7a
support.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/tbb/tbb/cross-compile.patch    | 25 ++++++++++++++++=
+
 meta-oe/recipes-support/tbb/tbb/tbb.pc             | 11 ++++++++
 meta-oe/recipes-support/tbb/tbb_4.1.bb             | 31 ++++++++++++++++=
++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
 create mode 100644 meta-oe/recipes-support/tbb/tbb_4.1.bb

diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-o=
e/recipes-support/tbb/tbb/cross-compile.patch
new file mode 100644
index 0000000..b970a37
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
@@ -0,0 +1,25 @@
+Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: unsuitable
+---
+ build/linux.gcc.inc |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+--- tbb41_20121003oss.orig/build/linux.gcc.inc
++++ tbb41_20121003oss/build/linux.gcc.inc
+@@ -40,12 +40,13 @@ DYLIB_KEY =3D -shared
+ EXPORT_KEY =3D -Wl,--version-script,
+ LIBDL =3D -ldl
+=20
+ TBB_NOSTRICT =3D 1
+=20
+-CPLUS =3D g++
+-CONLY =3D gcc
++CPLUS =3D $(CXX)
++CONLY =3D $(CC)
++CPLUS_FLAGS =3D $(CXXFLAGS)
+ LIB_LINK_FLAGS =3D $(DYLIB_KEY) -Wl,-soname=3D$(BUILDING_LIBRARY)
+ LIBS +=3D -lpthread -lrt
+ LINK_FLAGS =3D -Wl,-rpath-link=3D.
+ C_FLAGS =3D $(CPLUS_FLAGS)
+ # gcc 4.4 and higher support -std=3Dc++0x
diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-sup=
port/tbb/tbb/tbb.pc
new file mode 100644
index 0000000..644b64f
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/tbb.pc
@@ -0,0 +1,11 @@
+prefix=3D/usr
+exec_prefix=3D${prefix}
+libdir=3D${exec_prefix}/lib
+includedir=3D${prefix}/include
+
+Name: Threading Building Blocks
+Description: Intel's parallelism library for C++
+URL: http://www.threadingbuildingblocks.org/
+Version: 3.0+r018
+Libs: -L${libdir} -ltbb
+Cflags: -I${includedir}=20
diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-sup=
port/tbb/tbb_4.1.bb
new file mode 100644
index 0000000..2337bdd
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -0,0 +1,31 @@
+DESCRIPTION =3D "Parallelism library for C++ - runtime files \
+ TBB is a library that helps you leverage multi-core processor \
+ performance without having to be a threading expert. It represents a \
+ higher-level, task-based parallelism that abstracts platform details \
+ and threading mechanism for performance and scalability."
+HOMEPAGE =3D "http://threadingbuildingblocks.org/"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2c7f2caf277a3933e3acdf7f89d54=
cc1"
+PRDATE =3D "20130116"
+PR =3D "r${PRDATE}"
+
+SRC_URI =3D "http://threadingbuildingblocks.org/sites/default/files/soft=
ware_releases/source/tbb41_${PRDATE}oss_src.tgz \
+           file://cross-compile.patch \
+           file://tbb.pc"
+
+S =3D "${WORKDIR}/tbb41_${PRDATE}oss/"
+
+SRC_URI[md5sum] =3D "3809790e1001a1b32d59c9fee590ee85"
+SRC_URI[sha256sum] =3D "4ae2c10899e3b6ef2f686013ec5901fc658444ca90178efa=
ca6014b0665c34b6"
+
+do_compile() {
+    oe_runmake compiler=3Dgcc arch=3D${HOST_ARCH} runtime=3Dcc4
+}
+
+do_install() {
+    install -d ${D}${includedir} ${D}${libdir}/pkgconfig
+    rm ${S}/include/tbb/index.html -f
+    cp -a ${S}/include/tbb ${D}${includedir}
+    install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
+    install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
+}
--=20
1.8.1.2



