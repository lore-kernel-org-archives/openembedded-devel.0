Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8C0EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 09:50:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.12282.1687945840643963801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 02:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MsxaVKa1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20230628095037a977e1164b68c93220-5ew5v0@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20230628095037a977e1164b68c93220
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 28 Jun 2023 11:50:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=u/s4k5z8lcFV20I7ejgiUX7bXZmFRRDVs64osu7dtBE=;
 b=MsxaVKa1fGuR2dt1STvCj6JYeSLkXZZNN/oMeVHLB/qA3xLYllVSdHb0R1JA+qOAYvoIVF
 Rhrs2VMv1g2iT/y1JetpLuAME4yZLk1PYH5oVHoveETrOanybRYfLD5+9klmGJ/9N544zx4b
 f7XyNamblLYoB6QZj+InYsxMdGk+s=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] grpc: ignore CVE-2023-32732
Date: Wed, 28 Jun 2023 11:49:37 +0200
Message-Id: <20230628094937.15500-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 09:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103624

From: Peter Marko <peter.marko@siemens.com>

It was introduced in in v1.53.0 and not backported to v1.46.x branch.
NVD references PR which intrioduces the vulnerability:
  https://github.com/grpc/grpc/pull/32309#issuecomment-1589561295

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb b/meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb
index 15bf05919b..ab6f6e46cd 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb
@@ -66,3 +66,6 @@ FILES:${PN}-compiler += " \
     ${bindir} \
     ${libdir}/libgrpc_plugin_support${SOLIBS} \
     "
+
+# this CVE was introduced in v1.53.0 and not backported to v1.46.x branch
+CVE_CHECK_IGNORE += "CVE-2023-32732"
-- 
2.30.2


