Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9676BF3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 07:14:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA97Dtr5029878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Nov 2018 23:14:11 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 8 Nov 2018 23:13:33 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Nov 2018 15:13:31 +0800
Message-ID: <1541747611-30583-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hwloc: Update the SRC_URI
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
X-List-Received-Date: Fri, 09 Nov 2018 07:14:36 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update the SRC_URI to fix below issue:
$ bitbake -cfetch lib32-hwloc
ERROR: lib32-hwloc-1.11.10-r0 do_fetch: Fetcher failure for URL: 'https://www.open-mpi.org/software/lib32-hwloc/v1.11/downloads/hwloc-1.11.10.tar.bz2'. Unable to fetch URL from any source.

Actually the source located under https://www.open-mpi.org/software/hwloc/v1.11/downloads/hwloc-1.11.10.tar.bz2

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb
index 701af15..5f4155e 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
 
-SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${BP}.tar.bz2"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2"
 SRC_URI[md5sum] = "0981a01935982aa7e850a96e0c3057b0"
 SRC_URI[sha256sum] = "2be808383d8337846fe77ce49c7ad3336fb6857505494d85c0ac03f22c5bd1e7"
 
-- 
2.7.4


