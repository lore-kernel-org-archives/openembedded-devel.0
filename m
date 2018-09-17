Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C12AF79651
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:59:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFwVnZ006677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:58:41 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:58:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:26 +0800
Message-ID: <c703861b4bd11a4b5d45a0263e26c316a07b5782.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/19] mariadb: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:59:05 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 8ac0dbb..b9fa98b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -162,13 +162,15 @@ do_install() {
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
-    libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \
-    libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \
+    libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev \
+    libmysqlclient libmysqlclient-dev libmysqlclient-staticdev \
     libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-setupdb ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf ${sysconfdir}/my.cnf.d/server.cnf"
 CONFFILES_${PN}-client += "${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 CONFFILES_libmysqlclient += "${sysconfdir}/my.cnf.d/client.cnf"
 
+RPROVIDES_${PN}-dbg += "libmysqlclient-r-dbg libmysqlclient-dbg"
+
 FILES_${PN} = " "
 RDEPENDS_${PN} = "${PN}-client ${PN}-server"
 ALLOW_EMPTY_${PN} = "1"
@@ -201,8 +203,6 @@ FILES_libmysqlclient-dev = " \
     ${bindir}/mysql_config"
 FILES_libmysqlclient-staticdev = "\
     ${libdir}/*.a"
-FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
-    ${datadir}/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
 
 # Avoid warnings about ha_xtradb.so.0.0.0 and ha_innodb_plugin.so.0.0.0
 # which are intentionally non-PIC on 32-bit x86 (see e.g.
@@ -213,7 +213,6 @@ FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
 FILES_libmysqlclient-r-dev = "\
     ${libdir}/libmysqlclient_r.so"
 FILES_libmysqlclient-r-staticdev = "${libdir}/libmysqlclient_r.a"
-FILES_libmysqlclient-r-dbg = "${libdir}/plugin/.debuglibmysqlclient_r.so.*"
 
 FILES_libmysqld = "\
     ${libdir}/libmysqld.so.*"
-- 
2.7.4


