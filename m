Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14E8C7EE25
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:01:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.55543.1686567689927906323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aa03rTgI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20230612110126a6b5684cc9aa3ccc02-l6sl_w@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20230612110126a6b5684cc9aa3ccc02
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 12 Jun 2023 13:01:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Es1fDY342TQs0VzI7hv8ESaS7ko/XnDBBRMPBlPcCQI=;
 b=aa03rTgI2LSpbZfp2Xqw2CEdI9JqNoi/E6vjlBgnKxWw3TKT6T/ECKvlfdjFnDKloPBbWe
 4hCMKxlNa1pNCiVKO4jf8voWrpnZNbZ4pLjtFZYCsZfN3Kp5GAPIDyXK29lZKhplvsTREU9N
 +Y3tj/e1du2R8mLmpSBXPvMcOtNrI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] c-ares: ignore CVE-2023-31124
Date: Mon, 12 Jun 2023 13:00:29 +0200
Message-Id: <20230612110029.7522-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103212

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-31124 applies only when cross-compiling using autotools.
Yocto cross-compiles via cmake which is also listed as official workaround.

See:
* https://nvd.nist.gov/vuln/detail/CVE-2023-31124
* https://github.com/c-ares/c-ares/security/advisories/GHSA-54xr-f67r-4pc4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 5614d1310..180e2f3e9 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -21,3 +21,7 @@ PACKAGES =+ "${PN}-utils"
 FILES:${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# this vulneribility applies only when cross-compiling using autotools
+# yocto cross-compiles via cmake which is also listed as official workaround
+CVE_CHECK_IGNORE += "CVE-2023-31124"
-- 
2.30.2


