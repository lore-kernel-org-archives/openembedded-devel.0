Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACF5722FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAQ5gCcV000579
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:42:12 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 25 Nov 2014 21:42:12 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 00:42:01 -0500
Message-ID: <da1dcb90e28444452cc0e903cceb73383de0e4bd.1416979928.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1416979928.git.jackie.huang@windriver.com>
References: <cover.1416979928.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] meta-oe: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Wed, 26 Nov 2014 05:42:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2a5a428..e2a89cd 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -23,6 +23,12 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_openembedded-layer = "6"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_openembedded-layer = "1"
+
+LAYERDEPENDS_openembedded-layer = "core"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-- 
1.7.9.5


