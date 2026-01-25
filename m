Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A102E63C93
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 07:40:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35141.1769326808429925988
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 23:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rsk0h1l/;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359108fd24so2074691f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 23:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769326807; x=1769931607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRaxR/I/Njav2dbICmBalmCHDz9escDdVY1IxdFA4Og=;
        b=Rsk0h1l/uD1Nt8Y0EVF+zbUT1zgMVpotD4/XQYkEb6DX9gacXGAzEjgExXtKCEks72
         dX9qVCvhsTTVZ4uLMMJCu/9g5sbjOZ7mZp+0rr9EyeS/380sylb6KyGr0lFJeGtZe5gx
         lOSdQyrYCHpVtqbON5W1uhaFh0GTCVgpQCJ9vkhrRj1z9Z2i7XGCk0JJrqEDDmnrHfpu
         ZwILjacSlWoepXlCITIH2guCc7YdXBx/ISw1XazgT/2tbKy9TDfzWCD2+TYEpBnRRzYF
         Hi77MinRV74/eelrVrJqqqcWdhO2dO7LCdpAhtiXCJEV7mh7vkIEFWws938ZANqcSygV
         JsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769326807; x=1769931607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRaxR/I/Njav2dbICmBalmCHDz9escDdVY1IxdFA4Og=;
        b=vyvMfsOlQpZfiAEyEg3rEMVcEetIJe01Q+gJqPL79zVkiaVmQUuwSD24a4BsxNoDAI
         iG5UDkJs1RWSbGw8oGw0jIw9exnKtMJL51mHh+z2jBke/JpfmLtj6j6FOdPatlMZseTS
         lJBQfdTAwjm+GmLDsSFSJxhD9jWo+Otm4hZqDDrjg3DIy6XKAr1nddhNQ5PpbECJpJn4
         L+yVSa9Ngp2UVOk78Wml6NJNc6O4EUrNUWCo9I/k0s3KYJFeIsmCveTjOHHrAnstcapL
         QIg7NJOKiwclPFJ8Nj4CdpTLa+vrn9M8sCOsIfFm0hQ6mTmHeAV+0lcq8EgsnzblVd1h
         2faQ==
X-Gm-Message-State: AOJu0YysOYneLeUkdrb3EthYSBEHxT2ZrnbY/8/QJeNlz1FvCy9idDSM
	YBG2li1P1dAoJjeKv/NlJtJOUbeDNe9ozYqGKirNincAlpvyaR2L1VZiWfUc0w==
X-Gm-Gg: AZuq6aK91yGBASm4ydMoRS2gX6P9k/zzQdW9SH6DRufrA1xHb5R1WdIMKKn4d35MHBx
	NsyWKXPHQpNPGchxNpwZTnFF6oNTseI0zt3ShG9r/jnZpwknskDfmuy5FEyLFIfFFMeHfx1+/pz
	M0mlklsfpCmFg2Njc9OS2BZM52sMCGZDQlXmGLlreX//6bVmOzvuend+P0uiXb6Wfvu0YlEV8+0
	kngH5Zu3Di7FeFOdRCCWKLjYJSXh4gKzw17sSqQjPXxsUZkmq0JGAcXm9o7kdrLdJ5OwTsuA9Oj
	77kTV3JmCv2fo9DU1CZJVyBGzrbEqvrdth700FHDGKDRbVFVdHlO7JeCgOYvbvvSvYQdL/gya4V
	DmDV5BdC1NFkECzJ2jgTEvhbZFod1FdRCZFkgGND1jl0wWARra1Fm5KrnKfgzRUAAg62rxBAVua
	MvrCBt7IrfnI3BlHNU5kk=
X-Received: by 2002:a5d:5d84:0:b0:431:5ac:1df with SMTP id ffacd0b85a97d-435ca125ad9mr1444638f8f.11.1769326806541;
        Sat, 24 Jan 2026 23:40:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm20265542f8f.20.2026.01.24.23.40.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 23:40:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/5] evince: upgrade 42.3 -> 42.4
Date: Sun, 25 Jan 2026 08:40:02 +0100
Message-ID: <20260125074006.244692-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 07:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123832

Changelog:

build:
  * Narrow the version to enable nautilus plugin
  * Disable nautilus extension by default [NB: it is controlled by PACKAGECONFIG in meta-oe]]

comics:
  * Avoid critical when pixbuf can't be rendered
  * Better debug on archive error
  * Fix crash that can happen if archive is damaged
  * Still try to open broken comics

shell:
  * Fix use-after-free on a modified document
  * Use default color when annotation has no color
  * recent-view: Update for new gnome-desktop API

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/evince/{evince_42.3.bb => evince_42.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.3.bb => evince_42.4.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/recipes-gnome/evince/evince_42.4.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/evince/evince_42.3.bb
rename to meta-gnome/recipes-gnome/evince/evince_42.4.bb
index 498e1b0d12..2873038a06 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.4.bb
@@ -26,7 +26,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "49aecf845c946c96db17ba89d75c8002c5ae8963f504a9b0626d12675914645e"
+SRC_URI[archive.sha256sum] = "cd9d512a01b8870c271443377b453e16ad7cd11bca4088adafdad73d96512c16"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 

