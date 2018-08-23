Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10208793FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 03:04:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N34xDZ007601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 20:04:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 22 Aug 2018 20:04:58 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Aug 2018 11:04:56 +0800
Message-ID: <1534993496-82051-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xerces-c: Update SRC_URI
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
X-List-Received-Date: Thu, 23 Aug 2018 03:04:59 -0000
Content-Type: text/plain

From: lwang1 <li.wang@windriver.com>

The source located under http://archive.apache.org/dist/xerces/c/3/sources/
now, change SRC_URI accordingly

Signed-off-by: lwang1 <li.wang@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index 64ac747..9bc4ea3 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -9,7 +9,7 @@ SECTION =  "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.bz2"
+SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2"
 SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
 SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"
 
-- 
2.7.4


