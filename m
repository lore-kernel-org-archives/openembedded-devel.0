Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C178605C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 21:08:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8QL8l2V005463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 14:08:48 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 14:08:47 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 14:08:47 -0700
Message-ID: <1474924127-23623-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/1] layer.conf: add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 26 Sep 2016 21:08:51 -0000
Content-Type: text/plain

The layer README states we depend on meta-ruby and
meta-oe, but bitbake-layers show-cross-depends does
not find these dependencies.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-multimedia/conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 64a0a44..d68b13f 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -23,3 +23,9 @@ BBFILE_PATTERN_multimedia-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_multimedia-layer = "6"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_multimedia-layer = "1"
+
+LAYERDEPENDS_multimedia-layer = "core"
+
-- 
1.7.9.5


