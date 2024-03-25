Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8FBC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:41 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.51961.1711373254034295660
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWtzTy4w;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7d03a66e895so56407339f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373253; x=1711978053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1a6xpmdrZNJjlAoE6fJhsIoxtAQVEVS+gZWmsxZ/KU=;
        b=bWtzTy4wtH+p8AkDZs+xAoQBt7dmDEGtAwy8UU/IHTft22G9HduDWiXSiYEvU8Wkrv
         bUFbXd65jvlSbhIiq7ejeF3Lk4BKlk9wp1sz/n7hGMv7o3qiu5uYr9v8zEBha3PM11s+
         jDEzMDvoVKaHss1/wpv5vnfqqx1iCGqW1RGCZqurU6KUkyexqqxfm0n45HINelqS+Tsr
         zaecA/e3G2ArxQzq7jlXJVzNLu9ZuQdg7c8kszARK7M+kWtyLrPmgyofg54J5NpPLmGf
         G2bi0ffi0E81+blyBG2pXbQtGxi2HvwUEQsW9SiidJsfZoy5jhg9aM7dhpYsoQDdI3/P
         wftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373253; x=1711978053;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1a6xpmdrZNJjlAoE6fJhsIoxtAQVEVS+gZWmsxZ/KU=;
        b=tJNT7DhVVR9JnBUy2i6IfvDlXt473sA16owDIJNqIYrRGQGBY0qgQhYqx9unBWyGwO
         u7KtK/Wg3fEpRJhhhRCytlhFqmHtlY5wvuBxI5+ktIEX4rxOxichKQ3Q9O+etWWW7DsG
         AFgaAVkXRUlwWuFxcAO55DOnuuptrDM/rdfjPD0vbpuNwrDiSykzbst6Bd9fPHReYDYH
         bk6Kb43cEHkXf/C4YpHIIKj5KUcxxWwv2cHxY6TnWTBjcnVbJyjcuj2ZvwqrwB4I79ll
         uhMT1IM9Sqix0mSyKAqC6EPJ2uQEiiejU1nljpueY9NL8A5R2mPcxJS2oKnqIqhkYzX9
         7p9g==
X-Gm-Message-State: AOJu0Yy/9R6nGjJbIYLa2nhbOcS8DYtgVag9ehJJ6pOI8lOIr2jAEiQc
	ggLuIy+v4d3Auz9XJbpYCB7UJD4fM3sMBiLWbRNVWcczkqFAsb002osfRmHD
X-Google-Smtp-Source: AGHT+IHglFaAYSLxCqtq1YcZd2dTItQiilY+PimooMC+J/dgMSJH6CSckJW/rIXlXCGprwdOv4PjXA==
X-Received: by 2002:a05:6e02:1302:b0:368:79dd:ee32 with SMTP id g2-20020a056e02130200b0036879ddee32mr5277478ilr.12.1711373253287;
        Mon, 25 Mar 2024 06:27:33 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:33 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 7/7] jacl: Update SRC_URI to use https
Date: Mon, 25 Mar 2024 14:26:02 +0100
Message-ID: <20240325132603.2477-7-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109585

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/jacl/jacl_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jacl/jacl_1.4.1.bb b/recipes-core/jacl/jacl_1.4.1.bb
index d510cc8..2b811c7 100644
--- a/recipes-core/jacl/jacl_1.4.1.bb
+++ b/recipes-core/jacl/jacl_1.4.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 HOMEPAGE = "http://sourceforge.net/projects/tcljava"
 
-SRC_URI = "http://downloads.sourceforge.net/tcljava/jacl${PV}.tar.gz"
+SRC_URI = "https://downloads.sourceforge.net/tcljava/jacl${PV}.tar.gz"
 
 inherit java-library
 
-- 
2.43.0.windows.1


