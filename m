Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A12B87CAD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:02:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L22KX0016049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:02:21 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:20 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:14 +0800
Message-ID: <1550714538-415016-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
References: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] postgresql: upgrade 1.11.1 -> 1.11.2
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
X-List-Received-Date: Thu, 21 Feb 2019 02:02:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Copyright Year Update

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb | 10 ----------
 meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb
deleted file mode 100644
index 9713cb8..0000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
-
-SRC_URI += "\
-   file://not-check-libperl.patch \
-"
-
-SRC_URI[md5sum] = "5e45f6d5b859cc76b5d62f1e328e9711"
-SRC_URI[sha256sum] = "90815e812874831e9a4bf6e1136bf73bc2c5a0464ef142e2dfea40cda206db08"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
new file mode 100644
index 0000000..b87289a
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
@@ -0,0 +1,10 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=87da2b84884860b71f5f24ab37e7da78"
+
+SRC_URI += "\
+   file://not-check-libperl.patch \
+"
+
+SRC_URI[md5sum] = "19d43be679cb0d55363feb8926af3a0f"
+SRC_URI[sha256sum] = "2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405"
-- 
2.7.4


