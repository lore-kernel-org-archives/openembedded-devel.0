Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7255AC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:04:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.56501.1720026259598104304
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Gf6M/bKd;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.172, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb05b0be01so11596015ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720026259; x=1720631059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UvQDySJ/tr2r2VwWnHn0tup0bi9/AjFOUxuRpfB8WDQ=;
        b=Gf6M/bKdQWJBkaQzTkMQUsnTRQ4qZKiv0Xqg0wYg4FhMgEpnHZ2Pha5x61550bMrqa
         SsCoAeyTKM6v5f+7R0ggapgRMUnrMr5MiuiDwmzPydsY5s1/VTh75fNMpXfe6g2zeQh8
         aCeix3tESYSMTfs0BEX/WSVvRFxpy65x9F21cRM5PPs8qcvWeGQUZkHNf0iB8EpXekfO
         wFohXn6HX/kZCcqsjnv7u5UZ3AgaSjlPfnRTnPsxIV5jfVzz6upKTUPBAbt5oK+JUneQ
         SgSqykgsPMBgAJbeubvGxgBHlfqNOJq/zeUqj5wL+68OfpUMzqsVLm+lpK/cFdQ+7j3N
         /jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720026259; x=1720631059;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvQDySJ/tr2r2VwWnHn0tup0bi9/AjFOUxuRpfB8WDQ=;
        b=baRculYXlm4+zXEMQfKkgRZItOgXSS7F+PaZbLbk/xl5KitDYuINgqbBbpOv3dZkz4
         jnaqO9wm9MVuml239vuwtJ1Yn1JRxfCAgXspdhETgMrEqaSpkGMkDYWDb87Gbo8LS1sA
         GRNV321zz9lDr6gwkojtP/BBb23EdF6HxdfrWL0AanuGIo2RkHFDEMgxlVZBFibvPMQy
         XaWqp7ccpYH0TEprQ4Hpx5jidpU4Xp0iSPvGDvksKs1MDV1R1IaaCxeDQXB7nvJviQof
         /nGGAPyRTrUpCTub+G4/Kj9g6oC6VoMcJVw4Zv1NFSqn1PWjJwQIJ73JSvbMbD79XoQU
         iV4g==
X-Gm-Message-State: AOJu0YxCO6Cs/0ivIRUPEA0rEQskWymJkVbta8lj87c5GOrn0Dqe0RgF
	DT630femXvbuxmn8wIKQLj0D2SQ0gHroFzEcIZvEcsBXJNYu3vRxLrGAKMyaGMU9avoA/eT4xOL
	1
X-Google-Smtp-Source: AGHT+IEav8cM3gDScDmgmGUDRT8GH6vXppDV+nhvG+bwU02nEHBJQfPAGzwVn7eIBMjC4D+ICJzwHg==
X-Received: by 2002:a17:902:e74b:b0:1fa:221b:a7e1 with SMTP id d9443c01a7336-1fadbc6d617mr114929855ad.11.1720026258960;
        Wed, 03 Jul 2024 10:04:18 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159686csm106091765ad.266.2024.07.03.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:04:18 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] php-native: CVE status update for CVE-2022-4900
Date: Wed,  3 Jul 2024 10:04:14 -0700
Message-ID: <20240703170414.39812-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703170414.39812-1-ninette@thehoodiefirm.com>
References: <20240703170414.39812-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111234

The current version (8.2.20) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-devtools/php/php_8.2.20.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.20.bb b/meta-oe/recipes-devtools/php/php_8.2.20.bb
index c3c51cd93..f306b1693 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.20.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.20.bb
@@ -43,6 +43,7 @@ CVE_STATUS_PHP = " \
     CVE-2007-3205 \
     CVE-2007-4596 \
 "
+CVE_STATUS[CVE-2022-4900] = "cpe-incorrect: The current version (8.2.20) is not affected."
 
 inherit autotools pkgconfig python3native gettext multilib_header multilib_script systemd
 
-- 
2.44.0


