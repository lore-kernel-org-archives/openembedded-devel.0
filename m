Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4697A7C127
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 06:04:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6M64K4X022983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 23:04:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 21 Jul 2019 23:04:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Jul 2019 14:04:18 +0800
Message-ID: <1563775458-254815-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libtdb: fix do_package_qa issue [LIN1019-1848]
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
X-List-Received-Date: Mon, 22 Jul 2019 06:04:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
 QA Issue: non dev/-dbg/nativesdk package contains symlink .so: lib32-python3-tdb path '
packages-split/lib32-python3-tdb/usr/lib/python3.7/site-packages/tdb.so' [dev-so]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
index acc94d9..6c191fb 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
@@ -54,4 +54,4 @@ FILES_${PN} = "${libdir}/*.so.*"
 FILES_tdb-tools = "${bindir}/*"
 FILES_python3-tdb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 RDEPENDS_python3-tdb = "python3"
-INSANE_SKIP_python3-tdb = "dev-so"
+INSANE_SKIP_${MLPREFIX}python3-tdb = "dev-so"
-- 
2.7.4


