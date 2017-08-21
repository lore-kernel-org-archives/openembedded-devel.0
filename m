Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC1B7829D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:00:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L60k5s001680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 23:00:46 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:00:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:00:38 -0400
Message-ID: <f58ff3e68696c7d433cd3fcdc6abc984dc664993.1503295148.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503295148.git.hongxu.jia@windriver.com>
References: <cover.1503295148.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xmlrpc-c: add perl to RDEPENDS
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
X-List-Received-Date: Mon, 21 Aug 2017 06:00:45 -0000
Content-Type: text/plain

Fix the following file-rdeps QA issue:
...
|ERROR: xmlrpc-c-1.31.0-r0 do_package_qa: QA Issue:
/usr/bin/xml-rpc-api2txt contained in package xmlrpc-c requires
/usr/bin/perl, but no providers found in RDEPENDS_xmlrpc-c? [file-rdeps]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
index 70bd9e8..efa58f1 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
@@ -13,7 +13,7 @@ SRCREV = "81443a9dc234cc275449dbc17867ad77ae189124"
 S = "${WORKDIR}/git"
 
 DEPENDS = "curl libxml2"
-RDEPENDS_${PN} = "curl"
+RDEPENDS_${PN} = "curl perl"
 
 inherit cmake
 
-- 
2.8.1


