Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC77-0007Gq-80
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkPY021272;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015G-Ef; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:41 +0200
Message-Id: <93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
	<5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 08/13] mingw-runtime, mingw-w32api, mingw-runtime-headers, mingw-w32api-headers
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

* mingw-runtime and mingw-w32api requires mingw-gcc-canadian-cross-initial
  before they can be built

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 packages/mingw/mingw-runtime-headers_3.14.bb |   20 ++++++++++++++++++++
 packages/mingw/mingw-runtime_3.14.bb         |   21 +++++++++++++++++++++
 packages/mingw/mingw-w32api-headers_3.11.bb  |   20 ++++++++++++++++++++
 packages/mingw/mingw-w32api_3.11.bb          |   17 +++++++++++++++++
 4 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 packages/mingw/mingw-runtime-headers_3.14.bb
 create mode 100644 packages/mingw/mingw-runtime_3.14.bb
 create mode 100644 packages/mingw/mingw-w32api-headers_3.11.bb
 create mode 100644 packages/mingw/mingw-w32api_3.11.bb

diff --git a/packages/mingw/mingw-runtime-headers_3.14.bb b/packages/mingw/mingw-runtime-headers_3.14.bb
new file mode 100644
index 0000000..88ee998
--- /dev/null
+++ b/packages/mingw/mingw-runtime-headers_3.14.bb
@@ -0,0 +1,20 @@
+require mingw-runtime_${PV}.bb
+
+DEPENDS = "mingw-w32api-headers"
+PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	:
+}
+
+do_stage() {
+	cp -r ${S}/include/* ${STAGING_INCDIR}/
+}
diff --git a/packages/mingw/mingw-runtime_3.14.bb b/packages/mingw/mingw-runtime_3.14.bb
new file mode 100644
index 0000000..f8f2e8e
--- /dev/null
+++ b/packages/mingw/mingw-runtime_3.14.bb
@@ -0,0 +1,21 @@
+PR = "r1"
+
+inherit canadian-native autotools
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial mingw-w32api"
+
+PROVIDES = "virtual/${TARGET_PREFIX}libc virtual/${TARGET_PREFIX}libc-for-gcc"
+
+DEFAULT_PREFERENCE = "0"
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+
+PACKAGES = ""
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/mingw-runtime-${PV}-src.tar.gz"
+S = "${WORKDIR}/mingw-runtime-${PV}"
+B = "${WORKDIR}/build-${TARGET_SYS}"
+
+do_configure() {
+	oe_runconf
+}
\ No newline at end of file
diff --git a/packages/mingw/mingw-w32api-headers_3.11.bb b/packages/mingw/mingw-w32api-headers_3.11.bb
new file mode 100644
index 0000000..25ef810
--- /dev/null
+++ b/packages/mingw/mingw-w32api-headers_3.11.bb
@@ -0,0 +1,20 @@
+require mingw-w32api_${PV}.bb
+
+DEPENDS = ""
+PROVIDES = "mingw-w32api-headers"
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	:
+}
+
+do_stage() {
+	cp -r ${S}/include/* ${STAGING_INCDIR}/
+}
diff --git a/packages/mingw/mingw-w32api_3.11.bb b/packages/mingw/mingw-w32api_3.11.bb
new file mode 100644
index 0000000..c0a4462
--- /dev/null
+++ b/packages/mingw/mingw-w32api_3.11.bb
@@ -0,0 +1,17 @@
+PR = "r1"
+
+inherit canadian-native autotools
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
+
+PROVIDES = "mingw-w32api"
+
+DEFAULT_PREFERENCE = "0"
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+
+PACKAGES = ""
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/w32api-${PV}-src.tar.gz"
+S = "${WORKDIR}/w32api-${PV}"
+B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
1.5.4.3



