Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC77-0007Gs-An
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97Cpk6F021274;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015J-FF; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:42 +0200
Message-Id: <8d921520e115ee5aeb40f0b1dc2b4fd2a6abea29.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
	<5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
	<93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 09/13] mingw-binutils-canadian-cross
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:33 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 packages/binutils/binutils-canadian-cross.inc      |   28 ++++++++++++++++++++
 ...w-binutils-canadian-cross_2.17.50-20060824-1.bb |   11 ++++++++
 .../binutils/mingw-binutils_2.17.50-20060824-1.bb  |   12 ++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 packages/binutils/binutils-canadian-cross.inc
 create mode 100644 packages/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
 create mode 100644 packages/binutils/mingw-binutils_2.17.50-20060824-1.bb

diff --git a/packages/binutils/binutils-canadian-cross.inc b/packages/binutils/binutils-canadian-cross.inc
new file mode 100644
index 0000000..1f2c21e
--- /dev/null
+++ b/packages/binutils/binutils-canadian-cross.inc
@@ -0,0 +1,28 @@
+SECTION = "devel"
+inherit canadian-cross
+DEPENDS += "flex-native bison-native"
+PROVIDES = "virtual/${TARGET_PREFIX}binutils"
+PACKAGES = ""
+EXTRA_OECONF = "--with-sysroot=${CROSS_DIR}/${TARGET_SYS} \
+		--program-prefix=${TARGET_PREFIX} \
+		--enable-install-libbfd \
+                --disable-werror"
+
+do_stage () {
+	# ugly hack introduce to link cross with staging area
+	install -d ${CROSS_DIR}/${SDK_SYS}
+	ln -sf ${STAGING_DIR_SDK}${layout_includedir} \
+		${CROSS_DIR}/${SDK_SYS}/include
+	# FIXME: libdir should not be linked like this anymore
+	ln -sf ${STAGING_DIR_SDK}${layout_libdir} \
+		${CROSS_DIR}/${SDK_SYS}/lib
+
+	oe_runmake install
+
+	# We don't really need these, so we'll remove them...
+	rm -rf ${CROSS_DIR}/${SDK_SYS}/lib/ldscripts
+}
+
+do_install () {
+	:
+}
diff --git a/packages/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb b/packages/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
new file mode 100644
index 0000000..385aa1d
--- /dev/null
+++ b/packages/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb
@@ -0,0 +1,11 @@
+require mingw-binutils_${PV}.bb
+require binutils-canadian-cross.inc
+
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+DEFAULT_PREFERENCE_sdk-mingw64 = "1"
+
+require binutils-canadian-cross.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}-src"
diff --git a/packages/binutils/mingw-binutils_2.17.50-20060824-1.bb b/packages/binutils/mingw-binutils_2.17.50-20060824-1.bb
new file mode 100644
index 0000000..9d17873
--- /dev/null
+++ b/packages/binutils/mingw-binutils_2.17.50-20060824-1.bb
@@ -0,0 +1,12 @@
+PR = "r1"
+
+require binutils.inc
+
+DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}-src"
+
+DEFAULT_PREFERENCE = "0"
-- 
1.5.4.3



