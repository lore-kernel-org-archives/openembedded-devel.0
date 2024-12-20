Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCCFE7718E
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.154472.1734709056312646187
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fQqpI95K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024122015373484fdca0d0883c888a2-detfd3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024122015373484fdca0d0883c888a2
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FDnBc+VWOkeADMni/5ASBLJi6EwoD838wbB5sjpQXSQ=;
 b=fQqpI95KEKgN2jVpG9hUBpiveTIprG07PRShIfeR36hO6RA/pSTGyQuEwUDZyVv0pfbN+b
 BnoKSc0XRO5X2noIlSSz2tCP55dWevQyVSw3ibqqrSKX3E/5S3gjzbZW38cbTVxXcEGh6C/E
 xU2UvO88bC2NskJ1SA2G62gF5JTv3QOSLSRqfSOits1ei5tutM6OXCgDEmL9Nh8uMuGPR7HY
 EsN0e3I2FiK03fYoRMhCG4wj63unnDzHEx8kS1zL5tf98XZJ8Z2OEewOL37HGa8uGLojCmTq
 VQLwpzXsglBbcxpkAx0kQB7UTQAKq/LXxCKw7i2j3CGEkckcY7YoKtdg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 03/11] memcached: add UPSTREAM_CHECK_URI
Date: Fri, 20 Dec 2024 16:36:21 +0100
Message-Id: <20241220153629.2499631-4-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114439

From: Peter Marko <peter.marko@siemens.com>

Download URL is not listable so devtool upgrade fails.
Using homepage works as it contains link to latest release,

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 7234f02a13..dabe393573 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
+UPSTREAM_CHECK_URI = "${HOMEPAGE}"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
-- 
2.30.2


