Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B678C04FF6
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 12:55:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.46121.1712926536017046755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 05:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MXzVHcE4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240412125533fe0edb7a304ccfbafc-rjnglj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240412125533fe0edb7a304ccfbafc
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 12 Apr 2024 14:55:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=886LTGTPpGCNj4SAiAA88eh5GanuSqXDw3985nMXaMw=;
 b=MXzVHcE4XIXCcEy2IbfHEPAcjpQBwcfKKaVw2aots6Vl0edrW+jr/nEmNXwaJddem9F7AH
 9iI6bzfe6LpvF0l2o+CGsJ46OzNDWpV3MaHHZcPtCB09HtSs8Cxzkum9l0gTi0S62F6Iy9iP
 z+7+Ug7cz9m1WH50FM9+x1cmE3/3U=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] waf-samba: replace oldincludedir
Date: Fri, 12 Apr 2024 14:53:40 +0200
Message-Id: <20240412125340.17805-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 12:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109942

From: Peter Marko <peter.marko@siemens.com>

oldincludedir was removed in oe-core by
commit  506c91cbc6a604a84e37e53ccff430436369802e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index c8bf7bacf..79acacc98 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -15,7 +15,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
                   --localstatedir=${localstatedir} \
                   --libdir=${libdir} \
                   --includedir=${includedir} \
-                  --oldincludedir=${oldincludedir} \
+                  --oldincludedir=${includedir} \
                   --infodir=${infodir} \
                   --mandir=${mandir} \
                   ${PACKAGECONFIG_CONFARGS} \
-- 
2.30.2


