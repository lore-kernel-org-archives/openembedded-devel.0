Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605E2E7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:53 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.154112.1734709061962836002
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bgAUZTmt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241220153744fccabe2dd538fbb315-qeacns@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241220153744fccabe2dd538fbb315
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WVzImTBQZDpwLxHYAdhjNd96iFumGfvlOEk5mZ2qFb0=;
 b=bgAUZTmtpAhv8Qos6LgFYl7X7fkynYVlKtUOl7OE7UFxJT3PRaKfcusaOutxfwLOP0Gkd6
 yV3sbTD3QPuJgAmpuRwKGecuubhLCFVp7v0L7GMtEK50ohCIAmPuuSrcelUvimm89E5/Khv5
 BTZugkgvjcTW/1PK3qCSnfNNyJNlBXyswNRZmw8+WfAgZLDJ+DVdJIy9+zxZDyuPBAmhel9X
 rAajt7lexlGZ8Baz+Gx/LqKdSTDn9Up6GAx8nmmCFQuWJz9HP6ApbrtfdIA9yJS7kOg8qYzG
 M0aEohpee0OvDmXHwmBwJi7zdi0IoiF1P7gqXB2hEAl3aAWoZf3nj81w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 06/11] libmemcached: remove recipe for version 1.0.7
Date: Fri, 20 Dec 2024 16:36:24 +0100
Message-Id: <20241220153629.2499631-7-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114442

From: Peter Marko <peter.marko@siemens.com>

This no longer compiles with latest toolchains.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/libmemcached/libmemcached_1.0.7.bb        | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
deleted file mode 100644
index cdf8415ff7..0000000000
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libmemcached.inc
-
-SRC_URI[md5sum] = "d59a462a92d296f76bff2d9bc72b2516"
-SRC_URI[sha256sum] = "3efa86c9733eaad55d7119cb16769424e2aa6c22b3392e8f973946fce6678d81"
-- 
2.30.2


