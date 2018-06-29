Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99D0C74BBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:22:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5T6MuU3020441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:22:56 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:22:39 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:14 +0800
Message-ID: <1530253337-32732-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
References: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] postgresql: upgrade 9.4.17 -> 9.4.18
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
X-List-Received-Date: Fri, 29 Jun 2018 06:22:55 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb |  9 ---------
 meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
deleted file mode 100644
index 8a01d86..0000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
-
-SRC_URI += "\
-    file://not-check-libperl.patch \
-"
-SRC_URI[md5sum] = "0a08f4078f5e4a54e764f63ad38a6de3"
-SRC_URI[sha256sum] = "7a320cd335052b840d209dc9688f09965763351c590e3cc7bf577591179fd7c6"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb
new file mode 100644
index 0000000..a306bca
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb
@@ -0,0 +1,13 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
+
+SRC_URI += "\
+    file://not-check-libperl.patch \
+"
+
+UPSTREAM_CHECK_URI = "http://ftp.postgresql.org/pub/source/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>v9.4(\.\d+)+(-P\d+)*)/"
+
+SRC_URI[md5sum] = "4032f32af5afb0aa8f78f9a5639c0873"
+SRC_URI[sha256sum] = "428337f2b2f5e3ea21b8a44f88eb89c99a07a324559b99aebe777c9abdf4c4c0"
-- 
2.7.4


