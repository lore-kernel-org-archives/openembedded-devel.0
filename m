Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE3126E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 02:23:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u732NuD8026523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Aug 2016 19:23:56 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 19:23:55 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Aug 2016 22:23:49 -0400
Message-ID: <1470191029-19137-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xerces-c: upgrade to 3.1.4
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
X-List-Received-Date: Wed, 03 Aug 2016 02:23:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

upgrade to version 3.1.4 to fix two CVEs:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4463
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2099

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../xerces-c/{xerces-c_3.1.3.bb => xerces-c_3.1.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/xerces-c/{xerces-c_3.1.3.bb => xerces-c_3.1.4.bb} (91%)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
similarity index 91%
rename from meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb
rename to meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index 2355c9d..40612e5 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -10,8 +10,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.bz2"
-SRC_URI[md5sum] = "5e333b55cb43e6b025ddf0e5d0f0fb0d"
-SRC_URI[sha256sum] = "fc5e5e0247b108b8d64d75aeb124cabdee9b7fcd725a89fe2242b4637b25c1fa"
+SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
+SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"
 
 inherit autotools
 
-- 
2.8.1


