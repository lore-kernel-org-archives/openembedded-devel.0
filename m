Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AF4AA731CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 11:19:20 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 16 Sep 2016 04:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; 
   d="scan'208";a="9677813"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2016 04:19:21 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 246036A4006
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 04:18:56 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2016 14:19:15 +0300
Message-Id: <1474024757-10162-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1474024757-10162-1-git-send-email-maxin.john@intel.com>
References: <1474024757-10162-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] meta-gpe: add pointercal to layer.conf
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
X-List-Received-Date: Fri, 16 Sep 2016 11:19:20 -0000

add pointercal to SIGGEN_EXCLUDERECIPES_ABISAFE in layer.conf

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-gpe/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
index 00f3929..477e4a8 100644
--- a/meta-gpe/conf/layer.conf
+++ b/meta-gpe/conf/layer.conf
@@ -13,3 +13,5 @@ BBFILE_PRIORITY_gpe-layer = "7"
 LAYERVERSION_gpe-layer = "1"
 
 LAYERDEPENDS_gpe-layer = "core openembedded-layer"
+
+SIGGEN_EXCLUDERECIPES_ABISAFE += "pointercal"
-- 
2.4.0


