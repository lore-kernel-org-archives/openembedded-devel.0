Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19AA76093B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:35:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8RJZNeN030306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 12:35:23 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Sep 2016 12:35:22 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2016 12:35:22 -0700
Message-ID: <1475004922-30205-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/1 (possible duplicate)] layer.conf: add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Tue, 27 Sep 2016 19:35:23 -0000
Content-Type: text/plain

We just depend on "core".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index b7207e6..73ce00a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -23,6 +23,12 @@ BBFILE_PATTERN_qt5-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_qt5-layer = "7"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_qt5-layer = "1"
+
+LAYERDEPENDS_qt5-layer = "core"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
-- 
1.7.9.5


