Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5BC06FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:35:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uALJZLAw006222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:35:22 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 11:35:19 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Nov 2016 11:35:19 -0800
Message-ID: <1479756919-17586-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/1] layer.conf: add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 21 Nov 2016 19:35:21 -0000
Content-Type: text/plain

Version "1", and only depend on "core".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 84a4d89..0d92919 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,4 +8,10 @@ BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_meta-java = "1"
+
+LAYERDEPENDS_meta-java = "core"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
1.7.9.5


