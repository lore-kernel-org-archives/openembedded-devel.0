Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F0C3ABC9
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 22:35:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1589.1746743731449772387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 15:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DJ1LLCh2;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso11434895e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746743729; x=1747348529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8XH1vbakpzXSPCczOY5MH7Ky3Y/6+qEkVgoiGp9Piw=;
        b=DJ1LLCh2LIqnPKn7PetVYa3VknsxbDhxkxhab8QI/58sZj1tu7ZgW0j0fJLn9ik225
         6ti5K2dbvLr2tN5Ux9xzNIdbrDIyzHfWb+qbeT+UnRStdJFfxnueaoLre+ZzU3JJxrvM
         hZLzzpN2Dhs7CknRwFU7m/ZaKOaPvnRel+Orc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746743729; x=1747348529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8XH1vbakpzXSPCczOY5MH7Ky3Y/6+qEkVgoiGp9Piw=;
        b=uua1yQO/9vUiQXJ3yHrC+kFZes3XgXrwkWC3pHnvvCYiPz5v7w8nCjWiiNISPNPutA
         x31Oo/BbIB+abyjN/UfGyD5YxvwGNTn4Vm900CzfiSrIPF9shVVXjDa9rILPOed2CGav
         0yhedSuWI/XlIRBBoXya9x5N90W4rv8atDf0t9EGxs2ZK8IULuPH+6eBLRDB/A2hOmBj
         eAUD1R5pMI1dHpSCYR7c6Q9OuYSKd5s7Ty93aVYSz01OP7Et07hPbNhb1zdEx1mAcnBV
         MbX6bD+V/v4pnBzn+6E/MbTZn9+0QiR/+2xFIqBSwFy+v8YGlGLpN6Z2ah5U8Rc5Jji5
         YH2A==
X-Gm-Message-State: AOJu0Ywa95FkP+TaXsjyzDy3bmF25dY5YrtufJeU8/wZw6sclTwd27NX
	WI22kAvIXy38m3VKc/LRkRTja0G0CHo4ZqVk4wMe9Q+Z8S4TMqqxxlDDWAMdGJoFbRkzOImURNv
	L
X-Gm-Gg: ASbGncuE+GnLXxaBfGrWUoOUsYGgOoUdixIiy34zfv7BCuM7ngWjDMpmo8fjcm5ozDZ
	cx1DQzkSWCufmuzGVzr3B2z4lXGRCvvS3fqx4ySt7NNHbdOsSVbj8d4ctaq+NDW4NjbTa/FN3fw
	we4uJKAWQ3i4qYBzCLFaXaAB/NkR/KOTzKvbQU3X2X6CbM+jeSSmJL/oWpSZwcxS+b90BTkN4jz
	6x8ZyH5esImvJaysbqJy9SEEvPjdHf9DscSp7HfaQC7dYdrKr21tiWxo5ZNYzIlPDROLwYMbOek
	Ha5DVyND0jIQ7d0ns6EzTvoFtAS8i40u5K6P7dNQ7zjqQG1ThqxfunUQmg+OMM7OuWwK9kZ6SeP
	OALlgUxM24tLMEiPaf1wAsu/e6lC0kdsTwCBlhuFV0TlTxikv
X-Google-Smtp-Source: AGHT+IFooMwDdCMIoHF2WTEdSpGnG1auay88wriEXKZzNRkLq8PObb+OXhrkPfWRZRjLjWzBbuM44A==
X-Received: by 2002:a05:600c:628c:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-442d6d71df0mr7428315e9.19.1746743729042;
        Thu, 08 May 2025 15:35:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0087b736f9b546e683.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:87b7:36f9:b546:e683])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bd79sm50511715e9.23.2025.05.08.15.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 15:35:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver]][PATCH 1/2] hiawatha: update HOMEPAGE
Date: Fri,  9 May 2025 00:35:13 +0200
Message-Id: <20250508223514.999569-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 22:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117370

From: Yoann Congal <yoann.congal@smile.fr>

As noted in 11.7 changelog: https://hiawatha.leisink.net/changelog
> All references to http://www.hiawatha-webserver.org/ changed to
> https://hiawatha.leisink.net/.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
index 243017d593..169e385da6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Lightweight secure web server"
-HOMEPAGE = "http://www.hiawatha-webserver.org"
+HOMEPAGE = "https://hiawatha.leisink.net/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2 libxslt virtual/crypt"

