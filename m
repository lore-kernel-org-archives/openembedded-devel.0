Return-Path: <prvs=673fc8d93=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 381E874787
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 11:11:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,430,1520895600"; d="scan'208";a="10423449"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 May 2018 13:10:47 +0200
Message-ID: <20180522111047.26685-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH] pam-plugin-ldapdb: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 11:11:06 -0000
Content-Type: text/plain

Add recipe for version 1.3 of pam-plugin-ldapdb, a PAM module for
directly binding a user DN to an LDAP server.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../recipes-extended/pam/pam-plugin-ldapdb_1.3.bb  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
new file mode 100644
index 000000000..a68d1999f
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "PAM searchless LDAP authentication module"
+HOMEPAGE = "https://github.com/rmbreak/pam_ldapdb"
+BUGTRACKER = "https://github.com/rmbreak/pam_ldapdb/issues"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41ab94182d94be9bb35e2a8b933f1e7d"
+
+DEPENDS += "libpam openldap"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
+SRC_URI = "https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "2dd4f1370fcfe995ee0ad09611109b87"
+SRC_URI[sha256sum] = "8ed92b36523556bb5d9bf3eb33a1035e46041d4be767c8d62136930c0ca0e45b"
+
+S = "${WORKDIR}/pam_ldapdb-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
+}
+
+FILES_${PN} = "${base_libdir}/security/pam_ldapdb.so"
-- 
2.11.0


