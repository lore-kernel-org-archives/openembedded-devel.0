Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499F2C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 10:27:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.75874.1720431516435207450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 02:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=ea0rjE+a;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.48, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42662c21289so8884595e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720431514; x=1721036314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xxRM92nELRHdkXZcCY6EkSeDZmRjzyWq9LyuBvkgeiM=;
        b=ea0rjE+aYLQvgULRZ36oWReOhn3yqokkpiKFNwUJbJlOlrHHiHBj3K2KRfBOp6US70
         tdBpeAtDjQ1jGDw89nwSIno4pNDV0RrZqG2YfX92cI4eiJnZH93IczLu0bglNpJ7iMfk
         NRwHDMJ1w+Ou8ULgCMlAZLAYk+2kAauqzPpwTEuXynQ1pYIprzLaU7Pba+yg9eZmpn1j
         9jmUpX/Au4/V9yyPPubcukcVnKWh6RDsQ3Pn4obRryvjMSIjRtu1A+pddk+E5Gs+XbiX
         +RzHcb60drZdLNeINFtBlq+2BJLbt9FGA0heRXL1gfbbpY3G+I5yTZ3iye6GESQJJcxP
         uCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431514; x=1721036314;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxRM92nELRHdkXZcCY6EkSeDZmRjzyWq9LyuBvkgeiM=;
        b=ONQ7Oar4f1QiCwYqOjAgEP8B50oVX9w8Enaj/YsgOiJ7CeM6wpcMgzKhQLsg9wo97N
         YhShD0glGzrEL4FPJVKFTRSZrTtUWDHPi3nIlarf2v+mQ4QJmBUSRKBTTiMcCVr+vPlh
         nPj5bvjCrxjJG+KRgCgNz1ahzDV4FrHEcW4fw71s0ADPdaVZsAcXhH5dU3UhjAv67b+2
         7YLVgTB2RJp8DcW84Gd+Pa8OlOT2nxKl8rM+hoFnI/uop0dD6WTfhyNNKhLvLDix74LQ
         50MjEoZMCX/QAKy0+dcrH9wPs7fkGPHyEK0HxG5cvspdiv3hXrs2EVghcPXXgOimDSI/
         M8sg==
X-Gm-Message-State: AOJu0YyUwCRIAGXGsGY7XWO6LcvulGCtLLLRYD1F1c2vVEHMJfM/ERqK
	XbjJfYzfoYEG2BYceNa2vjDM/da3miN0OWZ5Xmz1jGbpGkuwFEwc8EUU9xYu0+y1yUkK2TPjQSZ
	XPgU=
X-Google-Smtp-Source: AGHT+IG5Y3lgNJ4Qgs9UNMGcrFcnAjIhwT1BB7MlE/kpuuHrIMD4a/mvA0AGIQGF5NioVAcrKR6QPw==
X-Received: by 2002:a05:600c:3b9a:b0:426:6364:c2c4 with SMTP id 5b1f17b1804b1-4266364c318mr24945875e9.14.1720431514314;
        Mon, 08 Jul 2024 02:38:34 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a25181asm159880985e9.30.2024.07.08.02.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 08 Jul 2024 02:38:33 -0700 (PDT)
From: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFz?= <alba@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Alba Herrerias <alba@thehoodiefirm.com>
Subject: [PATCH v2] yelp: fix unterminated string
Date: Mon,  8 Jul 2024 10:37:31 +0100
Message-Id: <20240708093731.5742-1-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAMKF1sqg2o8ZRVQyUa6k7sbAN+Cbp5yniEgadPg4WaOnMhKqEQ@mail.gmail.com>
References: <CAMKF1sqg2o8ZRVQyUa6k7sbAN+Cbp5yniEgadPg4WaOnMhKqEQ@mail.gmail.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 10:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111262

Signed-off-by: Alba Herrerias <alba@thehoodiefirm.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 69c421662..14986f265 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -40,4 +40,4 @@ FILES:${PN} += " \
 
 RDEPENDS:${PN} += "yelp-xsl"
 
-CVE_STATUS[CVE-2008-3533] = "cpe-incorrect: The current version (42.2) is not affected. Fixed in 2.24.
+CVE_STATUS[CVE-2008-3533] = "cpe-incorrect: The current version (42.2) is not affected. Fixed in 2.24."
-- 
2.40.1


