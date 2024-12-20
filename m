Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6B3E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:53 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.154127.1734709069390603271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AXENGxE2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241220153751bdf9ce040f128f57e7-z2axns@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241220153751bdf9ce040f128f57e7
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=By7VYj2I6cL5NQ7ZTIBImt+d+tVlPlQDPDc3BbX2ozk=;
 b=AXENGxE2jtrDjd/4r8B3e+a/HoqRdZhtrsS1r4EIoyADikddwBbX/WmiHgxwJoWkmICBxw
 gmVOLwm0aZJ4N2W0qL0NJU4PeZUgx8W7vNRiV2tt7AIYMm15dqio3yKubbvBgS+CcuML36nf
 b5Hf7niwTPeig7fid1xXhdkWYXVRfBUYPnNDV6Qps3CLULDUIueupMbq76nBOXdDXB125qAs
 3FDREXqp0/hW19cnTkeYaWcTLFl0Tl5l7oK80JOkIXIDarvCyr8hWneKtLBpQWwd+qQAmAin
 /jlh/vrcw8P6IPxGGfpqVcNufioV8ZeGAAzBGyEA8awEh/Lc4Guw+FUQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 08/11] libmemcached: ignore CVE-2023-27478
Date: Fri, 20 Dec 2024 16:36:26 +0100
Message-Id: <20241220153629.2499631-9-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114444

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by [2].
The commit message says that it is reverting feature added in:

$ git tag --no-contains d7a0084 | grep 1.0.18
1.0.18

This recipe is for the original memcached which is unmaintained now.
Hence the ignore instead of upgrade.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-27478
[2] https://github.com/awesomized/libmemcached/commit/48dcc61a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/libmemcached/libmemcached_1.0.18.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
index 7d18d0217d..561308b33d 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/libmemcached"
 
+CVE_STATUS[CVE-2023-27478] = "fixed-version: this problem was not yet introduced in 1.0.18"
+
 TARGET_LDFLAGS += "-luuid"
 TARGET_CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
 
-- 
2.30.2


