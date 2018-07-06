Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7B087885D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:10:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w660B0Uj025036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Jul 2018 17:11:00 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 5 Jul 2018 17:10:59 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Jul 2018 17:10:59 -0700
Message-ID: <20180706001059.116166-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [oe-core][recipes-extended][PATCH] diffutils-ptest: add runtime dependency on make
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
X-List-Received-Date: Fri, 06 Jul 2018 00:11:00 -0000
Content-Type: text/plain

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/diffutils/diffutils_3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
index deadd62c65..8ba897d18f 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
@@ -19,6 +19,8 @@ acpaths = "-I ./m4"
 
 inherit ptest
 
+RDEPENDS_${PN}-ptest += "make"
+
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
-- 
2.17.1


