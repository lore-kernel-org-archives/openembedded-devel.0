Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B39DC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 22:53:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.81.1715295217470086669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 15:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=h6XJfg+B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202405092253339c4a2b9844d013bbb3-nzvqxz@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202405092253339c4a2b9844d013bbb3
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 May 2024 00:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1Xvdh2RTRKEF5/uvegVtv0pFVWKyBLNzU6Oislqllo8=;
 b=h6XJfg+BWKung+Tnv0vae++YCZiXrDLsCJIfq9K3g/kuj2jD0oDVlAIxTFVm9yb6yZxzph
 t78tRNb5t9UUsZTOqcMSax04y2ajyTG9isz0cmvvzZar3OFieIwfVmfUcx1MH7Q44Nbidbyr
 dtWxPjRn/x7M89op2WDG7K90xuJZk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-gnome][scarthgap][master][PATCH] gdm: add missing json-glib dependency
Date: Fri, 10 May 2024 00:52:45 +0200
Message-Id: <20240509225245.3165712-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 22:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110299

From: Peter Marko <peter.marko@siemens.com>

Fixes do_configure error:
| Run-time dependency json-glib-1.0 found: NO (tried pkgconfig)
|
| ../gdm-46.0/meson.build:64:12: ERROR: Dependency "json-glib-1.0" not found, tried pkgconfig

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_46.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
index 469281624c..ec1d6ad39f 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
@@ -7,6 +7,7 @@ DEPENDS = " \
     audit \
     dconf-native \
     gtk+3 \
+    json-glib \
     keyutils \
     libcanberra \
     libgudev \
-- 
2.30.2


