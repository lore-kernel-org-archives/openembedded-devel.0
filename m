Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C759C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 01:20:34 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.8075.1632792032930147298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 18:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18S1KUuX019559
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 18:20:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18S1KUpN003507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 18:20:30 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 27 Sep 2021 18:20:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 27 Sep 2021 18:20:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 27 Sep 2021 18:20:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH] layer.conf: add openembedded-layer as
 LAYERDEPENDS
Date: Tue, 28 Sep 2021 09:19:24 +0800
Message-ID: <20210928011924.21204-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Sep 2021 01:20:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93158

From: Changqing Li <changqing.li@windriver.com>

Recipe tvheadend_git.bb inherit gitpkgv.bbclass, which is under
meta-oe/class/, so this layer directly depends on openembedded-layer

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-multimedia/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 5a17a5048..56c3569d0 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -29,6 +29,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_multimedia-layer = "1"
 
-LAYERDEPENDS_multimedia-layer = "core meta-python"
+LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
 LAYERSERIES_COMPAT_multimedia-layer = "honister"
-- 
2.17.1


