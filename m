Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6161C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:57:30 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1248.1784224640100492249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 10:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i0WySLqP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260716175717bc2253cec200020791-webdza@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260716175717bc2253cec200020791
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Jul 2026 19:57:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HDxZlTiBdj1u0W9J7JJG41ppRB+ya4KdrS5i3YVKmnI=;
 b=i0WySLqPS0KYPbtjhNkHZbgTzdWTuFyPLRIjgHk5Cq7RLq8MIktCtIpNoafhXoDj6kASyj
 HdKDnOrHcTTxmtOCFylh1HQIGcxlCjewyMOhO9TsV3Wksy5MQF1f3V09to1lBhOiy8c08cjB
 YlxN9zk1zUvR1HFkqg0rF32h28UfpM/D0eIxFvRcHkzs5n800NiEQ+yCk/ckI/p6Qq2/hvIC
 9CpaUmNnvWa+ze+cg54T2FgB4aloV0FFflXIqgeSIYJNMh6S4fnCbH9xQrXBNfgOq4Gda7wC
 01o1/uz+LWhq9whvCR2vUJ2t00ZOJOlzibLaQkOmWhBavCEB2a+sZpzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 1/2] libwebsockets: set status for CVE-2025-1866
Date: Thu, 16 Jul 2026 19:56:50 +0200
Message-ID: <20260716175651.833748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 17:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128238

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
index a18f88390e..4fb87342f6 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -72,3 +72,5 @@ RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-s
 SSTATE_SCAN_FILES += "*.cmake"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-1866] = "fixed-version: fixed since 4.3.4"

