Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5410C70034
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 11:41:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 01 Sep 2016 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,267,1470726000"; d="scan'208";a="755915861"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2016 04:41:10 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 767F86A4080
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 04:40:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2016 14:40:41 +0300
Message-Id: <1472730043-31245-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
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
X-List-Received-Date: Thu, 01 Sep 2016 11:41:21 -0000

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


