Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6z-0007G7-6l
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97Cpk1b021277;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015M-Fk; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:43 +0200
Message-Id: <eb9f8974f6c3f5c6f86634656ccc0be509e9ad6f.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <8d921520e115ee5aeb40f0b1dc2b4fd2a6abea29.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
	<5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
	<93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
	<8d921520e115ee5aeb40f0b1dc2b4fd2a6abea29.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 10/13] mingw-gcc-canadian-cross, mingw-gcc-canadian-cross-initial
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:25 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 packages/gcc/gcc-canadian-cross-initial.inc        |    4 ++
 .../mingw-gcc-3.4.5-20060117-2/includedir.patch    |   12 +++++++
 packages/gcc/mingw-gcc-build.inc                   |   35 ++++++++++++++++++++
 ...-gcc-canadian-cross-initial_3.4.5-20060117-2.bb |    7 ++++
 .../mingw-gcc-canadian-cross_3.4.5-20060117-2.bb   |   26 ++++++++++++++
 packages/gcc/mingw-gcc_3.4.5-20060117-2.bb         |   25 ++++++++++++++
 6 files changed, 109 insertions(+), 0 deletions(-)
 create mode 100644 packages/gcc/gcc-canadian-cross-initial.inc
 create mode 100644 packages/gcc/mingw-gcc-3.4.5-20060117-2/includedir.patch
 create mode 100644 packages/gcc/mingw-gcc-build.inc
 create mode 100644 packages/gcc/mingw-gcc-canadian-cross-initial_3.4.5-20060117-2.bb
 create mode 100644 packages/gcc/mingw-gcc-canadian-cross_3.4.5-20060117-2.bb
 create mode 100644 packages/gcc/mingw-gcc_3.4.5-20060117-2.bb

diff --git a/packages/gcc/gcc-canadian-cross-initial.inc b/packages/gcc/gcc-canadian-cross-initial.inc
new file mode 100644
index 0000000..99c7a47
--- /dev/null
+++ b/packages/gcc/gcc-canadian-cross-initial.inc
@@ -0,0 +1,4 @@
+require gcc-cross-initial.inc
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils"
+DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/packages/gcc/mingw-gcc-3.4.5-20060117-2/includedir.patch b/packages/gcc/mingw-gcc-3.4.5-20060117-2/includedir.patch
new file mode 100644
index 0000000..8836560
--- /dev/null
+++ b/packages/gcc/mingw-gcc-3.4.5-20060117-2/includedir.patch
@@ -0,0 +1,12 @@
+diff -urN gcc-3.4.5-20060117-2-orig/gcc/Makefile.in gcc-3.4.5-20060117-2/gcc/Makefile.in
+--- gcc-3.4.5-20060117-2-orig/gcc/Makefile.in	2005-12-12 02:24:01.000000000 +0100
++++ gcc-3.4.5-20060117-2/gcc/Makefile.in	2008-10-02 16:07:17.000000000 +0200
+@@ -442,7 +442,7 @@
+ # Directory to search for site-specific includes.
+ local_includedir = $(local_prefix)/include
+ # local_includedir=$(libsubdir)/$(unlibsubdir)/..`echo $(exec_prefix) | sed -e 's|^$(prefix)||' -e 's|/[^/]*|/..|g'`/include
+-includedir = $(prefix)/include
++includedir = @includedir@
+ # where the info files go
+ infodir = @infodir@
+ # Where cpp should go besides $prefix/bin if necessary
diff --git a/packages/gcc/mingw-gcc-build.inc b/packages/gcc/mingw-gcc-build.inc
new file mode 100644
index 0000000..274f50a
--- /dev/null
+++ b/packages/gcc/mingw-gcc-build.inc
@@ -0,0 +1,35 @@
+gcclibdir ?= "${libdir}/gcc"
+S = "${WORKDIR}/gcc-${PV}"
+B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
+BINV ?= "${PV}"
+
+LANGUAGES ?= "c,c++"
+
+EXTRA_OECONF_DEP ?= ""
+
+EXTRA_OECONF = "\
+	${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
+	--disable-shared \
+	--enable-languages=${LANGUAGES} \
+	--enable-threads=win32 \
+	--enable-c99 \
+	--enable-long-long \
+	--disable-maintainer-mode \
+	--disable-bootstrap \
+	--enable-target-optspace \
+	--disable-win32-registry \
+	--without-x \
+	--program-prefix=${TARGET_PREFIX} \
+	${EXTRA_OECONF_PATHS} \
+	${EXTRA_OECONF_DEP}"
+
+EXTRA_OECONF_PATHS = " \
+	--with-local-prefix=${prefix}/local \
+	--with-gxx-include-dir=${includedir}/c++/${BINV}"
+
+CPP = ""
+CPPFLAGS = ""
+
+do_configure () {
+	oe_runconf
+}
diff --git a/packages/gcc/mingw-gcc-canadian-cross-initial_3.4.5-20060117-2.bb b/packages/gcc/mingw-gcc-canadian-cross-initial_3.4.5-20060117-2.bb
new file mode 100644
index 0000000..f5ff761
--- /dev/null
+++ b/packages/gcc/mingw-gcc-canadian-cross-initial_3.4.5-20060117-2.bb
@@ -0,0 +1,7 @@
+require mingw-gcc-canadian-cross_${PV}.bb
+require gcc-canadian-cross-initial.inc
+
+SRC_URI = "\
+	${SOURCEFORGE_MIRROR}/mingw/gcc-core-${PV}-src.tar.gz \
+	file://includedir.patch;patch=1 \
+"
diff --git a/packages/gcc/mingw-gcc-canadian-cross_3.4.5-20060117-2.bb b/packages/gcc/mingw-gcc-canadian-cross_3.4.5-20060117-2.bb
new file mode 100644
index 0000000..479ff8b
--- /dev/null
+++ b/packages/gcc/mingw-gcc-canadian-cross_3.4.5-20060117-2.bb
@@ -0,0 +1,26 @@
+PR = "r1"
+
+require gcc-configure-cross.inc
+require mingw-gcc_${PV}.bb
+
+inherit canadian-cross
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/mingw-gcc-${PV}"
+
+DEPENDS = "\
+	virtual/${TARGET_PREFIX}binutils \
+	virtual/${TARGET_PREFIX}libc-for-gcc \
+"
+
+PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+
+do_configure_prepend() {
+	# ugly hack to come around the hardcoding of
+	# -isystem ${build_tooldir}/include which ends up pointing at
+	# $CROSS_DIR/$SDK_SYS/include
+	install -d ${CROSS_DIR}/${SDK_SYS}
+	ln -sf ${STAGING_DIR_SDK}${layout_includedir} \
+		${CROSS_DIR}/${SDK_SYS}/include
+	ln -sf ${STAGING_DIR_SDK}${layout_libdir} \
+		${CROSS_DIR}/${SDK_SYS}/lib
+}
diff --git a/packages/gcc/mingw-gcc_3.4.5-20060117-2.bb b/packages/gcc/mingw-gcc_3.4.5-20060117-2.bb
new file mode 100644
index 0000000..22f9170
--- /dev/null
+++ b/packages/gcc/mingw-gcc_3.4.5-20060117-2.bb
@@ -0,0 +1,25 @@
+PR = "r1"
+DESCRIPTION = "The GNU Compiler Collection - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+SECTION = "devel"
+LICENSE = "GPL"
+
+DEFAULT_PREFERENCE = "0"
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+
+inherit autotools gettext
+
+require gcc-common.inc
+require gcc-package-sdk.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/gcc-core-${PV}-src.tar.gz \
+	   ${SOURCEFORGE_MIRROR}/mingw/gcc-g++-${PV}-src.tar.gz \
+	   ${SOURCEFORGE_MIRROR}/mingw/gcc-g77-${PV}-src.tar.gz \
+	   ${SOURCEFORGE_MIRROR}/mingw/gcc-java-${PV}-src.tar.gz \
+	   ${SOURCEFORGE_MIRROR}/mingw/gcc-objc-${PV}-src.tar.gz \
+	   ${SOURCEFORGE_MIRROR}/mingw/gcc-ada-${PV}-src.tar.gz \
+	   file://includedir.patch;patch=1 \
+"
+
+
+require mingw-gcc-build.inc
-- 
1.5.4.3



