Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD25C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 18:46:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.14762.1700160353812742923
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 10:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3skbcuW;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507ad511315so1655451e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700160352; x=1700765152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KH8o3pshUB3o2v9lJcElPItZMbMcHrpJcfw5dsO1n10=;
        b=C3skbcuWbuJG/MWYP6opxMSkaxNq57Y+HAFr+tXz4PLTbxyw6PzAJXlMWUk+c2EeFZ
         EgS9c+Mt/zbZBsS2LyBvjZw5MR6eMtrBh5b+yFE6vnKwOnfZ9sOga5IJSqCCHMAVSJPW
         MAqgKHgX0TL0RQNL6rX9n2jKsFdSJR4AmnUAttgNSjSCnTrMXbk+8M96F3tXG3YkzyZg
         4tAxAoWl0g4A2aqMPFlGLZPYFX1laJlik3LAcA7MLAizS55VCMk57G4wyY34Y8xjiTik
         vl6Qk/DumD4IoGPI405oODR+DvMJcRYaqbCBRTayaNZwy8V3WG4LAd9aJoqSDQhcaQzq
         fGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700160352; x=1700765152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH8o3pshUB3o2v9lJcElPItZMbMcHrpJcfw5dsO1n10=;
        b=CG85PQOSb4QZp7ShVIBzrC/Esp13/QnkBvlde3ByZjwRUbQLUZjZhYUnMp3zdOUwJM
         n4H4yndJiQc/XOX/SYAwYfMudrsO/5n1ZSYUyhlPnVcj/b9tFXLHAywMzkQom0wVhmnh
         htAm05d0oAlaRHt+AeMPOBLjLMa+YTyRbTfHXHzsTrz/okeKIaw/Tj3pKU6yE9TojD7E
         vekKiG+NBB+K7Hjo6InphdAOM5h2tP3XDtlo+FYCCSuM04cLJqw85FT4B/9DJGEg4O/k
         6KQDM8UIRbZdN6y5iL2Qy07roJBAAKiCZYzwTg4s8yGbCtVMNf5XysX/L2iDWaDuBwEA
         T6GQ==
X-Gm-Message-State: AOJu0Yz8GCrqcSrTRdJS2df3Fy/OIitHtud67OaI2bkBFP4FbNmgxD1g
	X6DMcMEgV6L1sLgBFDMuw1xg2ZN4BXM=
X-Google-Smtp-Source: AGHT+IGnfHbw0gHAeoOFqQl5h8u04Tv8y3dsjSKNsGhlKqGwSbGMEJTJ8JHjHru/zbQakVfrVPsX3A==
X-Received: by 2002:a19:f505:0:b0:50a:2721:913a with SMTP id j5-20020a19f505000000b0050a2721913amr11765868lfb.29.1700160351354;
        Thu, 16 Nov 2023 10:45:51 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qy5yuypv0vsveh.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:7720:7419:1b40:3cf9])
        by smtp.gmail.com with ESMTPSA id k3-20020a1709065fc300b009b2c9476726sm8727547ejv.21.2023.11.16.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 10:45:50 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] README.md: was a Markdown paragraph and should be a list
Date: Thu, 16 Nov 2023 19:45:46 +0100
Message-Id: <20231116184546.27787-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 18:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106824

The Markdown was, at least at github.com, displayed as a paragraph.
And it reads beter as a list.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/README.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d23f6cc65..d1b743887 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -26,10 +26,10 @@ branch: master
 Layout
 ------
 
-recipes-httpd/      Web servers
-recipes-php/        PHP applications
-recipes-support/    Miscellaneous support recipes
-recipes-webadmin/   Standalone web administration interfaces
+* recipes-httpd/      Web servers
+* recipes-php/        PHP applications
+* recipes-support/    Miscellaneous support recipes
+* recipes-webadmin/   Standalone web administration interfaces
 
 
 Notes
-- 
2.34.1


