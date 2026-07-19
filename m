Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D535CC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 19:50:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2285.1784490646754246063
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 12:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a/b63ZzA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260719195044b8ac178c900002078c-eg7ari@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260719195044b8ac178c900002078c
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 21:50:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rM2nzYwRNO9S63SkJ9qC+6+d1viT43s6ger3dDqp7j4=;
 b=a/b63ZzA4F03ILv/JrkenzV84f2xXCLuGsmXxmmhFZcwI4WHJHIeCbuFwUSquwXolrQl+H
 t9xCJma5cn/NTyF6Y8qcRu5FwFS4/DlPnK8eTjN8fCyx0tsyoLJ2AgPS9oWa/6BFFSHQhAlZ
 BtdoXzWDymqOsUC6sd7hb401dgn0teCW6xD8zmsGunYKBESwKPKtdsVff/tr0ozrzLiliacQ
 MHLjsE9rarWbPxF0PUWZmkeFGmuYZAIAWqTrMeay8DRwWkbz5YRy8QNXG2zY70M51VBPt4RX
 PFpfKegV9GPE3mH5nXN7jisdKLR8UE28SNZiBC2SMDTSLWF2ZoOm16SQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] bit7z: set status for CVE-2026-45380 and CVE-2026-45384
Date: Sun, 19 Jul 2026 21:50:32 +0200
Message-ID: <20260719195032.443460-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 19:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128265

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 4.0.12 as seen in release notes [1].
Current CVE-CHECK still reports them as unfixed, correct it.

[1] https://github.com/rikyoz/bit7z/releases/tag/v4.0.12

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
index 300d9bc3cc..2e788b72a5 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
@@ -80,3 +80,6 @@ ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-ptest += "libstdc++ 7zip"
 # test data contains various file types with different architectures
 INSANE_SKIP:${PN}-ptest += "arch"
+
+CVE_STATUS[CVE-2026-45380] = "fixed-version: Fixed since 4.0.12"
+CVE_STATUS[CVE-2026-45384] = "fixed-version: Fixed since 4.0.12"

