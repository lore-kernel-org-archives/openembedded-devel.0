Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6z-0007GE-8I
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkNd021280;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015P-GG; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:44 +0200
Message-Id: <dd0ef3bb331e249a81458281dabe93098943e0a3.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <eb9f8974f6c3f5c6f86634656ccc0be509e9ad6f.1223383759.git.eha@doredevelopment.dk>
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
	<eb9f8974f6c3f5c6f86634656ccc0be509e9ad6f.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 11/13] binutils-canadian-sdk
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
 packages/binutils/binutils-canadian-sdk_2.18.bb |   29 +++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 packages/binutils/binutils-canadian-sdk_2.18.bb

diff --git a/packages/binutils/binutils-canadian-sdk_2.18.bb b/packages/binutils/binutils-canadian-sdk_2.18.bb
new file mode 100644
index 0000000..cf27cd0
--- /dev/null
+++ b/packages/binutils/binutils-canadian-sdk_2.18.bb
@@ -0,0 +1,29 @@
+SECTION = "devel"
+require binutils_${PV}.bb
+inherit canadian-sdk
+
+DEPENDS="\
+	virtual/${HOST_PREFIX}binutils \
+	virtual/${HOST_PREFIX}gcc \
+	flex-native bison-native \
+"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
+EXTRA_OECONF = "--with-sysroot=${prefix}/${TARGET_SYS} \
+		--program-prefix=${TARGET_PREFIX}"
+PR = "r3"
+
+FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
+
+do_stage() {
+	:
+}
+
+do_install () {
+        autotools_do_install
+
+        # Install the libiberty header
+        install -d ${D}${includedir}
+        install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
+        install -m 644 ${S}/include/libiberty.h ${D}${includedir}
+}
-- 
1.5.4.3



