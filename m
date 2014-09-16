Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4FFE71478
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:14:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G8E2CZ026163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:14:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:14:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:14:31 +0800
Message-ID: <1410855272-15776-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mariadb: use ${PN} for SYSTEMD_SERVICE
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
X-List-Received-Date: Tue, 16 Sep 2014 08:14:07 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Use ${PN} for SYSTEMD_SERVICE to avoid errors in case of multilib.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index 9cc2cc9..4d7499d 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -29,8 +29,8 @@ USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
 GROUPADD_PARAM_${PN}-server = "--system mysql"
 
-SYSTEMD_PACKAGES = "mariadb-server"
-SYSTEMD_SERVICE_mariadb-server = "mysqld.service"
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_${PN}-server = "mysqld.service"
 SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
-- 
1.7.9.5


