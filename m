Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5DA972310
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:42:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAQ5gK5n000588
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:42:20 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 25 Nov 2014 21:42:19 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 00:42:07 -0500
Message-ID: <28b812da1e59b74dca7b0d225b31a4f050703731.1416979928.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1416979928.git.jackie.huang@windriver.com>
References: <cover.1416979928.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Wed, 26 Nov 2014 05:42:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-filesystems/conf/layer.conf |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index c0bbd78..9ed6d1b 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -8,3 +8,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "filesystems-layer"
 BBFILE_PATTERN_filesystems-layer = "^${LAYERDIR}/"
 BBFILE_PRIORITY_filesystems-layer = "6"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_filesystems-layer = "1"
+
+LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
-- 
1.7.9.5


