Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275EC46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:51:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.41000.1702893103263634726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 01:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YH7vA6Dh;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so14266555e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 01:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893101; x=1703497901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRLAD1CoYThdSp6LpEGLUlRwtjoPX8b80odlrRIRxc8=;
        b=YH7vA6DhvvKfCBiuI8mrlmVpHxwJ0MxAzjvQsHuAgsBamr3SEI0ihfT+GlLOPE1Kir
         xAGjxzQPlZtOm/KFMusryUGKObUY2sMw9GGjMIa5As+zMP97zOU/AORzlk509FqCLKE9
         slyKkFfMX0qseyBn9JlOMyOG/dYMzstAaPkn41KyzRgBZSzV61MerUHoGwpTvW/1eUAK
         Sb0wpaOg+KxizF8hAd7UGmYPDC31poftNgHuqgwLwnrd2hJ+0FbBfZ4sP1bQFrqvIrih
         uklpE8LySPKgtWXMTvK56CZ2Wd8CjcOJX5kqBAbqgLj4yfBp4rEj+d8FDRabg41fXPTK
         GWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893101; x=1703497901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRLAD1CoYThdSp6LpEGLUlRwtjoPX8b80odlrRIRxc8=;
        b=Ib1jPPMHPWWff+Nqj7hMhgGhwIB5AfssO69zYs6R1H9hxcJwiIOjnnxsS0jp9d0d9N
         NtrZyIvAiujbNsiAgKJCy7aZ/xxOvqaAufxg8pSAeX3ak9E24M4icbDb3kSrBwNoiT2T
         ycI7+r3D3PeQtjqrXUHB2H/zXmjIL81XWtTPk6BW4fqblrK89/jFx3Rsfc3impG0chbD
         2D5LWM/Fju38o/hKj7ytWfEb5hx0bNVMOMpH8VbKEoXrI60Ieg0B1G9MVHPIcyvlaSbG
         Vb84ojxLOCD6ybe+hfQ6msZJlBmcPBfjnJN1qzhIMiSU8QQCj5ckEDj4zSUCm7dWDmvl
         aA7A==
X-Gm-Message-State: AOJu0Yy+pDfXxQTP+n9knuzAhrTw6xBwRnBauOIulogSnLkLm19tqTz+
	iusiKY6QTRM2W0TWAn0vNORv9oZOqv0=
X-Google-Smtp-Source: AGHT+IEjJzBpobXmpuz88m8Oy0b2ZQm0QB7DfiB3LtcGZwUdlpyl70O+hh4DfyoftugNP6Qb+8QAxg==
X-Received: by 2002:a05:600c:808e:b0:40b:47d0:cff with SMTP id ew14-20020a05600c808e00b0040b47d00cffmr8085790wmb.10.1702893100710;
        Mon, 18 Dec 2023 01:51:40 -0800 (PST)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d508f000000b0033330846e76sm7653989wrt.86.2023.12.18.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 01:51:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] mdns: Fix HOMEPAGE URL
Date: Mon, 18 Dec 2023 09:51:35 +0000
Message-Id: <20231218095137.8814-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 09:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107542

The Apple Bonjour homepage has moved.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
index af2b337172a1..6c70fdf430a3 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
 DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
-HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
+HOMEPAGE = "https://developer.apple.com/bonjour/"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
-- 
2.39.0


