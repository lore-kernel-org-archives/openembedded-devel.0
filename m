Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 823147F288
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:43:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x848gYe2017442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Sep 2019 01:43:00 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 01:42:32 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Sep 2019 04:42:28 -0400
Message-ID: <20190904084229.17739-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-oe][Patch 1/2] mariadb: fix file conflictions when multilib enabled
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
X-List-Received-Date: Wed, 04 Sep 2019 08:43:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When multilib is enabled, it complains file conflictions of
/usr/bin/mysql_install_db and /usr/bin/mysqld_safe.

Inherit multilib_script to solve the issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9a398b308..9ddf2bee5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -28,7 +28,9 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d useradd systemd
+inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mysql_install_db ${PN}-server:${bindir}/mysqld_safe"
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME_${PN}-server = "mysqld"
-- 
2.20.0


