Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LzryJ-0008V5-S0
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 14:36:07 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lzrsz-0004rH-V6; Fri, 01 May 2009 16:30:38 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 May 2009 16:30:34 +0400
Message-Id: <1241181034-25945-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
In-Reply-To: <1241181034-25945-1-git-send-email-khimov@altell.ru>
References: <1241181034-25945-1-git-send-email-khimov@altell.ru>
Subject: [PATCH 2/2] bridge-utils: add version 1.4
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
X-List-Received-Date: Fri, 01 May 2009 12:36:08 -0000

---
 conf/checksums.ini                       |    4 ++++
 recipes/bridge-utils/bridge-utils.inc    |   24 ++++++++++++++++++++++++
 recipes/bridge-utils/bridge-utils_1.2.bb |   28 ++--------------------------
 recipes/bridge-utils/bridge-utils_1.4.bb |    1 +
 4 files changed, 31 insertions(+), 26 deletions(-)
 create mode 100644 recipes/bridge-utils/bridge-utils.inc
 create mode 100644 recipes/bridge-utils/bridge-utils_1.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9a2c473..9485f6b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3034,6 +3034,10 @@ sha256=c93b9fab6b12a80bcf69114aab66d1d298455e9269c44f9e5f6430c142f9e349
 md5=1e6cff57ac90d7ab984d9512fdd9f2dd
 sha256=c93b9fab6b12a80bcf69114aab66d1d298455e9269c44f9e5f6430c142f9e349
 
+[http://downloads.sourceforge.net/bridge/bridge-utils-1.4.tar.gz]
+md5=0182fcac3a2b307113bbec34e5f1c673
+sha256=876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933
+
 [http://www.ludd.luth.se/~torger/files/brutefir-1.0i.tar.gz]
 md5=33fcf84a41d38f5aac24c57a66a2c3ee
 sha256=e0f3988afb0a84a89f38153fd5617615e9bcf32bb747ee981c99c44d3c4236f6
diff --git a/recipes/bridge-utils/bridge-utils.inc b/recipes/bridge-utils/bridge-utils.inc
new file mode 100644
index 0000000..ba4d582
--- /dev/null
+++ b/recipes/bridge-utils/bridge-utils.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Tools for ethernet bridging."
+HOMEPAGE = "http://bridge.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPL"
+DEPENDS = "sysfsutils"
+RRECOMMENDS = "kernel-module-bridge"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
+
+do_install_append () {
+	mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove brctl brctl.${PN}
+}
diff --git a/recipes/bridge-utils/bridge-utils_1.2.bb b/recipes/bridge-utils/bridge-utils_1.2.bb
index 51414f5..dd1def4 100644
--- a/recipes/bridge-utils/bridge-utils_1.2.bb
+++ b/recipes/bridge-utils/bridge-utils_1.2.bb
@@ -1,26 +1,2 @@
-DESCRIPTION = "Tools for ethernet bridging."
-HOMEPAGE = "http://bridge.sourceforge.net/"
-SECTION = "console/network"
-LICENSE = "GPL"
-DEPENDS = "sysfsutils"
-RRECOMMENDS = "kernel-module-bridge"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
-
-inherit autotools
-
-EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
-
-do_install () {
-	autotools_do_install
-	mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove brctl brctl.${PN}
-}
+require bridge-utils.inc
+PR = "r2"
diff --git a/recipes/bridge-utils/bridge-utils_1.4.bb b/recipes/bridge-utils/bridge-utils_1.4.bb
new file mode 100644
index 0000000..1c2dea6
--- /dev/null
+++ b/recipes/bridge-utils/bridge-utils_1.4.bb
@@ -0,0 +1 @@
+require bridge-utils.inc
-- 
1.6.2.4



