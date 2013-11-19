Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 080FD6D437
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:11:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAJMBA3o006344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Nov 2013 14:11:10 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 14:11:10 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Nov 2013 16:11:02 -0600
Message-ID: <1384899062-13317-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1384899062-13317-1-git-send-email-mark.hatle@windriver.com>
References: <1384899062-13317-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: paul.eggleton@linux.intel.com
Subject: [meta-webserver][PATCH 1/1] meta-webserver: Add LAYERVERSION and LAYERDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 22:11:09 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add LAYERVERSION and LAYERDEPENDS to layer.conf

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-webserver/conf/layer.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 6f1855b..d887b67 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -11,3 +11,8 @@ BBFILE_COLLECTIONS += "webserver"
 BBFILE_PATTERN_webserver := "^${LAYERDIR}/"
 BBFILE_PRIORITY_webserver = "6"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_webserver = "1"
+
+LAYERDEPENDS_webserver = "core"
-- 
1.8.1.2.545.g2f19ada


