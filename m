Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD6AC47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 06:56:16 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.6766.1704869768872823741
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 22:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=Mt5aIs1t;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-664519-202401100656053bf212b49ed432092e-rzdt5x@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202401100656053bf212b49ed432092e
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 10 Jan 2024 07:56:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q926mxhqiVQMRgjau0W1bJ8138jKPa/9CzrC/nS2Tns=;
 b=Mt5aIs1tfa5UHpwsBaF+NFq5TWB24AZL274JK8zhtYOzTHqPgQDqLLbZ+XhfCvIn6bJ0Hu
 6radXqA0S5ti95/ZnTPcSKc1TRHr7EYaFTnxLQ5rRZYj5DjWGkKNngBYd5vz2TyiZ8hdmi3L
 SlMn1V7aNsGG5HDCugKlz9g96E35Y=;
From: "M. Haener" <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [oe][meta-oe][PATCH] mdio-tools: upgrade 1.3.0 -> 1.3.1
Date: Wed, 10 Jan 2024 07:56:00 +0100
Message-ID: <20240110065600.26689-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 06:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108208

From: Michael Haener <michael.haener@siemens.com>

Changelog:

* Multiple registers can now be dumped at once, via the generic dump
  operation.
* Relax the driver matching to accept the strings used in kernels 6.2
  and newer.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 .../mdio-tools/{mdio-netlink_1.3.0.bb => mdio-netlink_1.3.1.bb} | 0
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc       | 2 +-
 .../mdio-tools/{mdio-tools_1.3.0.bb => mdio-tools_1.3.1.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_1.3.0.bb => mdio-netlink_1.3.1.bb} (100%)
 rename meta-networking/recipes-support/mdio-tools/{mdio-tools_1.3.0.bb => mdio-tools_1.3.1.bb} (100%)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.0.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.0.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index 942b2d482..b99ce8281 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -5,4 +5,4 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
-SRCREV = "42c91efa63ef81992cdcc01e698cf3bc7764bbc3"
+SRCREV = "f74eaf38dbda441df4fcaeb21ca4465957953a2f"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.0.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.0.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
-- 
2.42.0


