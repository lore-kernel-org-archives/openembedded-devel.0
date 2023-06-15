Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55593EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:11:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.19540.1686838309060133385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=l1JJCfVq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20230615141145c43499ba87218da1a7-6ibj2t@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230615141145c43499ba87218da1a7
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Jun 2023 16:11:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=klZC/KirnJORzgar84fmnXF0h4Cz0M/BBKrpLO8TLP0=;
 b=l1JJCfVqiiIji9k/97i0Xa2GgVLIJzsEAe/IcxtZko5PBMwwpuxZSey4JT6PxxVt7J4dPU
 y3kS7Cn15h/ODIqajwZZPeJmnHWq7hIgADgzmCOpKKaEwyawJV2cPYnNfZxar+c6ieQeiPrY
 lbTaDFadFCMlVrfEXtwiqTuFvUX8k=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH] python3-stopit: fix override syntax
Date: Thu, 15 Jun 2023 16:10:48 +0200
Message-Id: <20230615141048.1526835-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 14:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103305

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
index 91ff21fa1..64e3671e1 100644
--- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e7
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-setuptools \
     "
 
-- 
2.30.2


