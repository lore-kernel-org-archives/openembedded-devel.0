Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08510C04FF6
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 12:54:34 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.45637.1712926472033959405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 05:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Alxa3l5w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202404121254298329561f72ff3e190a-gd_dug@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202404121254298329561f72ff3e190a
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 12 Apr 2024 14:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AlnOYuxOairfW1e1Fwx2Nk+ji20UgbRb8sG5HuIJJrw=;
 b=Alxa3l5wCoj/A81J69bsluDVECaiHSYEEK3tuJkl5o5vX4CUvZJFVGlRujHTiENzCgxv6W
 USfpeB33g66iVlw68FX2iUXxzX0IKuUBYalhSPqe4WiwcehqlmTJoY98IFnbRjvFadHtGiJk
 q8KlQtRfzOz+5fwkkBguRZRxXtWwA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] autoconf-2.13-native_2.13: replace oldincludedir
Date: Fri, 12 Apr 2024 14:52:48 +0200
Message-Id: <20240412125248.17659-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 12:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109941

From: Peter Marko <peter.marko@siemens.com>

oldincludedir was removed in oe-core by
commit  506c91cbc6a604a84e37e53ccff430436369802e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index 21d1356f7..d0e0446eb 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -43,7 +43,7 @@ CONFIGUREOPTS = " \
     --localstatedir=${localstatedir} \
     --libdir=${libdir} \
     --includedir=${includedir} \
-    --oldincludedir=${oldincludedir} \
+    --oldincludedir=${includedir} \
     --infodir=${infodir} \
     --mandir=${mandir} \
     --disable-silent-rules \
-- 
2.30.2


