Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF55105D9AF
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:33:11 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102460.1775640786724238612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=iMiIl0+s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260408093304604f82ceb9000207ce-ijwkt2@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260408093304604f82ceb9000207ce
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 08 Apr 2026 11:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+hWBVBT8HCD2vIxPCmTCkhegLuivvukVlNBzHGSLzqU=;
 b=iMiIl0+s9ckNMA5ZUfINx1dCzVSaAkaTZhNI9QNolzSWpMSay0RXKFMuUWwl260HY1ubCf
 /+rNr43F0MnQ1so7BfE/B7ab+wTSYxyya3b6leLQlzlFIAI+Be5iqxIjCSaI20BC1QEX0aTk
 87axfBUfL4tGs61N1Shb9gUQ0JTAsAyZLt4NtqmEdsC5tcgVmREZm/bLG7u7eOIjLDs1WOgI
 isYzx7epBBd34/2vfGmTPQg0dW9xOCo6bkx6KTNhydILmSZNF61AzNsTCA8CtNLYE9TiCQGa
 SQ9VD9CJs+O3wLbW9S3uU67xC8tpIjVd8pifA0OK51MzGrfGYy0doZVg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] poco: add config for fastlogger
Date: Wed,  8 Apr 2026 11:32:16 +0200
Message-ID: <20260408093216.737233-2-peter.marko@siemens.com>
In-Reply-To: <20260408093216.737233-1-peter.marko@siemens.com>
References: <20260408093216.737233-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 09:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126104

From: Peter Marko <peter.marko@siemens.com>

It is a new feature in 1.15.0, enabled upstream by default.
It is part of Foundation library.
So this makes it possible to disable it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco_1.15.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.15.1.bb b/meta-oe/recipes-support/poco/poco_1.15.1.bb
index 35fd13f538..b50d1ee4ec 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.1.bb
@@ -24,7 +24,7 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite DNSSDAvahi Zip Encodings Prometheus"
+PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite DNSSDAvahi Zip Encodings Prometheus FastLogger"
 # MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
 # and mongodb needs meta-python enabled as well
 PACKAGECONFIG:remove:riscv32 = "MongoDB"
@@ -49,6 +49,7 @@ PACKAGECONFIG[DNSSDAvahi] = "-DENABLE_DNSSD=ON -DENABLE_DNSSD_AVAHI=ON,-DENABLE_
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
 PACKAGECONFIG[Prometheus] = "-DENABLE_PROMETHEUS=ON,-DENABLE_PROMETHEUS=OFF"
+PACKAGECONFIG[FastLogger] = "-DENABLE_FASTLOGGER=ON,-DENABLE_FASTLOGGER=OFF"
 
 # Additional components not build by default,
 # they might have dependencies not included in oe-core

