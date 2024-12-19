Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB6E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.138178.1734640150697081304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dIoo8POV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024121920291254e7d40402dd4fdd1c-74o8bo@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024121920291254e7d40402dd4fdd1c
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:29:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4acOEUW0KM6GDiDuJ1RI4womNLDA1sjdrTgPxfqv/0w=;
 b=dIoo8POVuyN088qYKrLWLKyua9SL7EAoIGyWaJsOC/osZJaN2+LzQ/xxOfjdU0AZQm5hoz
 NeBGIN/cjFrFeiLUs8+bTVD2eMAe35TJeF07z8a8a8eIG4FU5LP3GfTl28wvD5NZfOIzyLsw
 BHWRiPgdcTxVisaTvSv4LZsfQpjk4jBNaRYYv4UYYcS50j3y2JBsihiLn9eKGn9PFJmDC2wG
 IVsF6g4k34kaX6MzKprmE3Y8X3HsHEhaY/Or/PaoZBa0V47hh2k96SIYljjnIzn6cSWgK66U
 LDmyqn8RN0fxjc53REyuHCgysB+Ikx68Tita7QNnuQjGxkq3Zh69FIxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 10/12] swagger-ui: mark CVE-2016-1000229 as fixed
Date: Thu, 19 Dec 2024 21:27:36 +0100
Message-Id: <20241219202738.346121-11-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114411

From: Peter Marko <peter.marko@siemens.com>

as per https://github.com/swagger-api/swagger-ui/issues/1865
NVD tracks this CVE as version-less.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
index 5add32db43..0998643b2a 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
 
 SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
 
+CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
+
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
2.30.2


