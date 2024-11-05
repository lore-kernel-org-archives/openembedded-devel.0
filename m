Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21BDD3E79B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.30565.1730838742020641813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U307GMzC;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e34339d41bso50983847b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838741; x=1731443541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjl5TgXtPcUfyizo/1Y9GGRkrtq9wf8Npg+09wQZOOU=;
        b=U307GMzCBiYiehkUwpxQkS6WBcsCEjz0w/MmYgx0jzE2y/oHyuVi19epYnWcGt+8lo
         NeUPS3AtZM1LQbdp17QoOWPbBQQIUkFJwO+BYyyMI+X01nIkQvugyNcDjx1wMIR5e/OP
         5ksoGvQv+spoCQljcURPd1uFzZ/gQdD30KQZPG4eGTXrNR5OBDr+HIR6KCian41X/MYr
         frY5UP8BjD2wZbIFG7bll86kwngUhCjNLeqTRTLiFn1LDXhIK4MlcZQMc3LiCjrhEEPS
         mUEcnmmd4FNQUUHSK5GdD2Syb5U4vrSznmOG4Kak6giRuXp3o0cEX9h5RxXeYSFzx3YW
         BUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838741; x=1731443541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjl5TgXtPcUfyizo/1Y9GGRkrtq9wf8Npg+09wQZOOU=;
        b=ozaRsPHZsKRiDrZZo6KBcDE6c/9VeOaQ2H1XnDKSq6f38z2dWLlYH8+mpZUmtOMQd+
         XUokvSkdy5xBwpsMqxqW1TmcZeRfSJc8SHDcqUenqUshov40knktXQoHXCYyYO3pbvqL
         zYiEjNK9GKzspsjGrCIijzOX+1LP/ucqRjLgmAgvhzwxG0PHxcePCISbKaW+QIAsrJws
         RQXgeuH9o2nEW34iwRf7nD3dI0X0Oa88/6xyXilYhgnYyxjHxaCXG2uS6FnGDdfFyi0F
         FSOvMJkOab5Vc0jKXbi9HLP9HfxULku6GR9fl5cXgIKiJoQEYKSk7kfMoWbdUsU7Gp9W
         4LYQ==
X-Gm-Message-State: AOJu0YyJMDzioa4l4vXF3doojGPKxaLldLFNDVnl4RbWYqsBGls1/Y1H
	Ai2jx+wEg12etaFeMDvhHAvZ99XVrbxAo2pFP4acyAmW3L+ztu4h7OzG8xlR
X-Google-Smtp-Source: AGHT+IE4u3g4b3cM9B64Iq+d2d7+lgkScGhTUHsWAPPenjI4l49rXjH2UwC52Mh4PWe0/7FRts514w==
X-Received: by 2002:a05:690c:460e:b0:6e2:c13e:20e9 with SMTP id 00721157ae682-6e9d8b056ddmr262602797b3.38.1730838740608;
        Tue, 05 Nov 2024 12:32:20 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:32:20 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 112/161] cyrus-sasl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:37 -0500
Message-ID: <20241105202827.3104-112-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113629

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index a6703ecf8..1f4b4bf73 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -81,7 +81,6 @@ SYSTEMD_PACKAGES = "${PN}-bin"
 SYSTEMD_SERVICE:${PN}-bin = "saslauthd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
 SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
 
 PACKAGES =+ "${PN}-bin"
-- 
2.43.0


