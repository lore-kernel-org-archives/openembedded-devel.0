Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A1C44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:03:05 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17993.1784221384358831560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 10:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UZ9gqptG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202607161703010fd6aec1da0002072d-q0gne7@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202607161703010fd6aec1da0002072d
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Jul 2026 19:03:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8jMBZJZolX5NyahNq/pOc7tCE5CgOy16dZ1L8TEdRC0=;
 b=UZ9gqptGleAht6ERxpaaC+8YQ8UjQyxdwLZ4tI7wC2zzR0kEWZhufEX2wygYXSqLGjURUl
 TBWZR1eNU2eOl6Hs4UIlzRLnUuV9y6SsV/DUZM1ri2qgMiy7F80g6cgZmoIpXOWyKNppboNV
 oPO8guxSkuNClJsfcYKIU16bWEfXFlJRLf8J04bGuEyOaRFWIyZYh4gUaIcgjctN9hbmh4Bo
 ZDP2Jtvl1LVH586AuFQAZVsnL51pUXxGI2MwJOrtIB8CbjdJcWXErlS2WLqiHTrGYpnrGuI9
 mFVASKbxzHXLNz5lIAN7r69tlbvNBbvtqBCCsUgp5NvumrvO8PGyXAYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] libwebsockets: set status for CVE-2025-1866
Date: Thu, 16 Jul 2026 19:02:31 +0200
Message-ID: <20260716170232.818077-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 17:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128235

From: Peter Marko <peter.marko@siemens.com>

Current cve-check code does not correctly decode the entry [1]:

"versions": [
    {
        "changes": [
            {
                "at": "patch 4.3.4",
                "status": "unaffected"
            }
        ],
        "lessThan": "<4.3.4",
        "status": "affected",
        "version": "0",
        "versionType": "git"
    }
]

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/1xxx/CVE-2025-1866.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index fc65890d8d..f6d20c1d95 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -73,3 +73,5 @@ RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-s
 SSTATE_SCAN_FILES += "*.cmake"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-1866] = "fixed-version: fixed since 4.3.4"

