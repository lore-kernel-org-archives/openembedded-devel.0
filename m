Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEC947E641
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 16:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5PGDlOH003138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 09:14:08 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 09:14:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 26 Jun 2019 00:13:57 +0800
Message-ID: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/4] meta-multimedia: add layer depends on meta-oe
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
X-List-Received-Date: Tue, 25 Jun 2019 16:14:32 -0000
Content-Type: text/plain

Since tvheadend of meta-multimedia inherit gitpkgv bbclass
which comes from meta-oe, add missing layer depends back

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-multimedia/conf/layer.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index e05a652..89ed163 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -29,6 +29,9 @@ BBFILE_PRIORITY_multimedia-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_multimedia-layer = "1"
 
-LAYERDEPENDS_multimedia-layer = "core"
+LAYERDEPENDS_multimedia-layer = " \
+    core \
+    openembedded-layer \
+"
 
 LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
-- 
2.7.4


