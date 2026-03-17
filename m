Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F79FED9EB
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 16:51:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80955.1773766286869548554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 09:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=B9b0NUbq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202603171651231161df394500020715-3oep04@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202603171651231161df394500020715
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Mar 2026 17:51:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ECdkXLlxb3N3COF/VZNh1wWBi7b870wlfkA58SCJDtI=;
 b=B9b0NUbqwHmllhk3becL+WveKyV6k/bl7vGZbXaPwEJkjBHuGwM6oWPC5w2GvSRTJJ6mRQ
 /+hFEjdYPJ9/BI8s4h/akz6dzLBtdjW0Gp/6sQ+SbF3cxocKMbwXvrJhVRSx7nzoVs2qRrKl
 MHUpW30vvGtRgetJfkN1Hyd+phq9LoywV+mqmrCE/3GRiksRtebRdQrbIpNM7IXaF9sO4/q6
 xU/m/nBEJpKV4CuaMItxeITJkpleIjVBC5yz03xaJC2IQYas01lnSnkLVJihmp24aY8hgb/9
 27S5SyJxsc5+7hs0B7xCXe22ht/hNnzONhfSfSU8KOMpeqw69fpyZQxg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: upgrade 4.5.2 -> 4.5.7
Date: Tue, 17 Mar 2026 17:51:17 +0100
Message-Id: <20260317165117.19490-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 16:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125320

From: Peter Marko <peter.marko@siemens.com>

Update to latest v4.5-stable patch level.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{libwebsockets_4.5.2.bb => libwebsockets_4.5.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.5.2.bb => libwebsockets_4.5.7.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb
index 35545aacee..9c7c60742d 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b5d391cc7929bcba238f9ba6805f7574"
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
-SRCREV = "85c6f7959fd40d8aaf7a50be3c9b75f08389a01c"
+SRCREV = "94b9bdbfec2a89464505fc8cc379f33d4e334018"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

