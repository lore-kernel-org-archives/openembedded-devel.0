Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30BA5722FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:42:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAQ5gHtZ000585
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:42:18 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 25 Nov 2014 21:42:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 00:42:05 -0500
Message-ID: <ca9e909ebf24b7396fef0321667219d4e90fe0d9.1416979928.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1416979928.git.jackie.huang@windriver.com>
References: <cover.1416979928.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Wed, 26 Nov 2014 05:42:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 toolchain-layer/conf/layer.conf |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain-layer/conf/layer.conf b/toolchain-layer/conf/layer.conf
index ca81eb1..b377f12 100644
--- a/toolchain-layer/conf/layer.conf
+++ b/toolchain-layer/conf/layer.conf
@@ -23,3 +23,8 @@ BBFILE_PATTERN_toolchain-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_toolchain-layer = "6"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_toolchain-layer = "1"
+
+LAYERDEPENDS_toolchain-layer = "core"
-- 
1.7.9.5


