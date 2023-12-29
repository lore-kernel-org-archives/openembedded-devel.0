Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA7C47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.155469.1703876562095713893
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edXsmTf9;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e840338607so45780107b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876561; x=1704481361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu5iX1lTpb8L0sjVRQyucJ2nauNA2IWM6m7T+qeIKq0=;
        b=edXsmTf9OL9vy5Wvq98GZuYsJGICQRWeyd2/tpWGqmiwXti+Lg4Mib0x5TI7bbhkon
         Qrho+tCOG2zxRNR/tVmtoynvwtmGmIBs5dFEpOQMPxi3lBbVrvxzFUQHI2xl4w9FCWkA
         rsTcrxhPLBlLsb19jE0UJTQIpEyH4nNIplu6Cl648omOOTqZTo501MQd+GqkEUkKWfWY
         roS/kHjGbEKZhBMcKqTVaF7zX/qYdi/by0TksFAOEnY21JaWWYI0A9zTTrZ5/WSjlu2O
         cjatVAjV5RRRf+vWKckpJLlyr1Kt6Bty4vjy/KiCGSTSAC2krdss1vqcnhAX4N/jvpwM
         9NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876561; x=1704481361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu5iX1lTpb8L0sjVRQyucJ2nauNA2IWM6m7T+qeIKq0=;
        b=d+3E33ICKowyy+xLBaYXsJZpzYDwWFO40858u5DqUv2GCOhkbvU1gww/eC3tnbA53U
         iCzOOsWsKiFMTOsuY97s5BTR6LpyklklhjUhiIy5u1Qr7AhBhHehyyVC3vlRBlFGJ3df
         X3zYhVyS2H9J3HQXemrW2VwZAwhmGH4aZXbUhQ0KQGS2LL90igHi0DY6AapzXCgPCDCp
         gsfaEQVju0xA6U0OXoYM0H+wBt8x8qA+b8bT4RKUAlawevgy5Y4pLQomjzSEt9vqDrCV
         /vUaG7gjdAnd5Vy6aFeGrt6tJD0qI5j5f0mU4YFFg8VS8/c/68kgEp9kam7tRIVC2Lzv
         ruGA==
X-Gm-Message-State: AOJu0YwENE/XRXbzm8rbdzij33M6cBTAKRZT/7pCywRDGa6XgiHQI7tR
	WL9CgCLrWA0WexYtKwwIDrmfgqHvwnpacQ==
X-Google-Smtp-Source: AGHT+IFQ4WgkffraMkJvWis/MBy8lEnSSB22YEMT8f1/0+wdAjRBiCBD4a4BOJtNPZ0sAYc7XoxiWg==
X-Received: by 2002:a05:690c:a12:b0:5ed:9d32:ee10 with SMTP id cg18-20020a05690c0a1200b005ed9d32ee10mr2577497ywb.83.1703876561121;
        Fri, 29 Dec 2023 11:02:41 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 09/17] python3-ninja: Set BBCLASSEXTEND = "native nativesdk"
Date: Fri, 29 Dec 2023 14:02:22 -0500
Message-Id: <20231229190230.135480-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107891

From: Zoltán Böszörményi <zboszor@gmail.com>

python3-ninja is a build dependency for other python modules.
For this, python3-ninja must be built for native mode.

This partially reverts d4aa17dc436beb96a804860bc6d18cf72283709e
("meta-python: Drop broken BBCLASSEXTEND variants")

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9b5ee4b0b2bf1a2abb181983a960a3802bca688f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
index dd07968f03..3b9077f326 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -22,3 +22,4 @@ RDEPENDS:${PN} = " \
     python3-ninja-syntax \
 "
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


