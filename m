Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A6ECA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:12:51 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.7352.1757023961797111532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lk0pNKn8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250904221239670552ee3500020770-yezd_9@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250904221239670552ee3500020770
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:12:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=igbwsrQK5JCWYFXuICOYn8NROculgia26Smacd4zkp8=;
 b=Lk0pNKn8Bm4/YgNi1Un3w/xNAAUsC5tAEqyaZz4xuIFMQ4N1W/3gdiD4uXZvqYvkxx4tGi
 DPECaSTJDJdCyt9lkYnk/NgIu/GSB7c7L7gb45Yna7/TxDW+RFCTLWJdo5djDFZNp90nzMTo
 aHcdgn7r/1YgMoL6+IFqcCiuIgCaXPrOYQOAds+8sy0meui9EKzXlyGfCiLs6wkUnZtniov0
 S9TXcivkOmPBu9YFuhLGRghPnJkPCVCsX+hvXIWIaOv6R4xRF0EV9ejAp9rtQw8ymF3NRM6K
 GazX50/plXOrLban9leU70f94LAWqCWr4CaEExxhxgcJQavllk1gWSVw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 02/10] poco: cleanup PACKAGECONFIG for native variant
Date: Fri,  5 Sep 2025 00:11:31 +0200
Message-Id: <20250904221139.3131569-2-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119299

From: Peter Marko <peter.marko@siemens.com>

Remove options which have dependencies without native variant.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco_1.13.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index e0f6c4169e..e338d88580 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -31,6 +31,8 @@ PACKAGECONFIG:remove:riscv32 = "MongoDB"
 PACKAGECONFIG:remove:riscv64 = "MongoDB"
 PACKAGECONFIG:remove:mipsarch = "MongoDB"
 PACKAGECONFIG:remove:powerpc = "MongoDB"
+# Following options have dependencies on recipes which don't have native variant
+PACKAGECONFIG:remove:class-native = "MongoDB DataODBC"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"

