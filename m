Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63833C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:04:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.103603.1683540275071518663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AVIwDY85;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540273; i=@fujitsu.com;
	bh=hj+7T0i0SUFxVaFv/6nvUMHXoqwJvP8impMQM1B6cAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=AVIwDY85kUBzXLaSVJziQH55QIFZDz0CyEVQvSy5Nn3j7vybELOm2uG0KGPKcsdgV
	 jZNY56Qqcfq3j7FKbxlhM5EzTxMQ04qAjtL64+eUWtDeZpH+N0ujnI94hPkFp3bX/j
	 woqZ5DTy8FpcmHQhzgqeH5my0T1sfvxlR3hFHq37NnGbrVKax7TCkjdhNboEMeqVMu
	 g0NEfkMXe15v2CoESoky1llzzQclZeeiNgkWesUwMZPQrAPi+7I2ejW/WfcVYoEda3
	 2vFT5m/99HLdv29TyOa6RMmSZeJODtgnso3BaUojAFmiRJxiHEx3njuwf8VTKC9IJq
	 x3J+U1/NW3YPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpGtwMiL
  F4P1GHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP635tsBfP5K+a83MrSwDiLt4uRi0NIYCOj
  xO+lrawQzjQmiT/fG4AcTg42AQmJ6XtPsoPYIgK6Eh8/zGUEsZkFVCRmTD7C1MXIwSEs4Crx8
  bYLiMkioCqxbE0hSAWvgJPEvf9PWUBsCQEFiSkP3zOD2JwCzhLPD0wBmy4EVLPs6jZmiBo1ia
  vnNjFPYORZwMiwitG8OLWoLLVI19BYL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+
  1uFivuDI3OSdFLy+1ZBMjMCRSipMidzAe2fVX7xCjJAeTkiiv6cGwFCG+pPyUyozE4oz4otKc
  1OJDjDIcHEoSvG3bIlKEBItS01Mr0jJzgOEJk5bg4FES4ZU9ApTmLS5IzC3OTIdInWJUlBLnF
  TkBlBAASWSU5sG1wWLiEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXjuQKTyZeSVw018BLW
  YCWux/ORxkcUkiQkqqgYkvfklAYkjj0y9bnbhfP1xS7nSsN/f1jss/nzOtEMgK0OyIav90t+J
  S75r/8xJT3pteYFxsXceYm5+0pXG79r2rzDE1B+e2ermbdv3byX802zE3LKml3iFKf0qUvqBD
  lbxmj1uyu7Z7eeomVyaNwj+6/w/K9ZtN7Vlx+nLyl7bLUsWX+P/tdGNXOhOvePXVx9aKlqNrL
  OODHIIz2c5GaW079eVnUu3kgBW2ljxRr3e9rtu2w2vCphtnTrqs/m0ltMS48s/yqS0/BHVrG3
  daXbk4myHT5kremut567iuzH9g0+VjoMWRXfa3Xd+lXK1F68em1OLV4nVJfG8Pe7euma0k3H2
  7tqp5jofYZvdYJZbijERDLeai4kQAGv2QXgQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1683540272!496336!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13038 invoked from network); 8 May 2023 10:04:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:04:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2FB1D1D4;
	Mon,  8 May 2023 11:04:32 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 56CBE1D2;
	Mon,  8 May 2023 11:04:31 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.3.1 -> 1.3.2
Date: Mon,  8 May 2023 18:04:17 +0800
Message-Id: <1683540259-25209-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
References: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102392

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- AdwAvatar
  - Fix a memory leak
- AdwMessageDialog
  - Fix criticals when using choose() with hide-on-close=true
- AdwTabBar/Overview
  - Correctly unparent context menu
- Build
  - Fix build on Windows
- Demo
  - Fix a critical when trying to set a non-image file as avatar
- Docs
  - Remove an erroneous mention of mnemonics in row subtitles
  - Clarify AdwBanner title placement
  - Mention the version .large-title is deprecated since
  - Fix successs/error color values
  - List thumbnail colors on the named colors page
- Stylesheet
  - Improve selected list/grid item contrast
  - Fix file chooser grid dimensions
  - Fix button.card checked state
- Translation updates
  - British English
  - Bulgarian
  - Chinese (China)
  - Dutch
  - French
  - Friulian
  - Georgian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.3.1.bb => libadwaita_1.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.3.1.bb => libadwaita_1.3.2.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb
index 8f927e3f7e..b661734aaf 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "6b8bbf413c501b46c8616a0e5b836d7a34091140941412520bbd9ddda6df8cbd"
+SRC_URI[archive.sha256sum] = "b38c91658b2d1fcb7eedf687858b0a54de39af6357661912b54271884c8e195e"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


