Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB73C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:03:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.46952.1738429405472049022
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6pv00vx;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385eed29d17so1471654f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738429403; x=1739034203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZfKWFvorSt3vawX5MGZ2zFI2hIoSJ0rLqRy0leWr1A=;
        b=K6pv00vxANXOwhYypjZC7Ck3mpnOYbolb3QP5gJHoh2xK2oUXQOBub5ctbCupSx8EZ
         K2C+SisD/j7jmc8SHEAxWM4UcDhWQPKAQe7ASvyCUuP3NrSqUW7C5JJFnABvsU1/ra29
         JMJXzNsUfE8PZ4jZepkr/F2iOAY7gvNMvEnHN8J7RHB4C2CkSCBzgWlFBKGXjgB/bmoN
         XfzG35nCHbMvwUdLo1O3Yki3kw45wihPVuD/yZ3vlSi94d1gABUvyCgU114cSJtFatM8
         KuiWm/m0JE4c7H2E4gj9KeoxfcsPhJxq1XCiDfYpsFiVTSFMtMbUFSADIIzKboE4UMv6
         xduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738429403; x=1739034203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZfKWFvorSt3vawX5MGZ2zFI2hIoSJ0rLqRy0leWr1A=;
        b=HA/sN+QfNFX1S+6pFSjyqMSgiRmaTmUUuASIvUiMclU+oH1155ga7+wpApg3fWn+mE
         1ExUpIG2K3c1lnbWdVKxI/+yhlE0OYotn5MHoJ20lvlj5k/elp1jo5YKBMFXt2NpDRfz
         PNa/5/IrJ61/Ji+AUcaPBXLU4gdAlzp2KYQmYbeiMaDVIwkZQ/6u2zhjfMFKTkqL+7wm
         qRDOfbQmCBAAH8/xIhKQJNh7X8npfs6vekwlYpnyOQm4VUleat6hpjvs0BBexnaxnP3k
         bfx7GsKx7iFRAEorA8KuCoE1auEr9svIdCOlnhTh0PVUuT5jcarE5oExf/DAsgLKLYgl
         2+PA==
X-Gm-Message-State: AOJu0Ywg91aga/CG3cGMmlIGKrh3cv0Z9f6qYvFpOzDU/7qB9Rir+ccO
	zkcKJ77QZ/bRYf3eBli2v/4mHu5T4t2P3pveeZ8R8Y35e/sNCBowilsUzyJt
X-Gm-Gg: ASbGncsGw2OYPUcMCQNSnWm7lzWebjc1DkNpSb386GfpWlD2KX91G0yQFCfcWo8s0Yz
	QgZ//gmR1il755av09K5ow96LSMjl4yoRk6oZSDPUs8tSBxNNfF6a+4wF9DO6nOp5Sh+BOvqC4k
	cmGcyM43HgdjB218DAchKUAj710XFTWKax3FzezPWidihX4yLH4jCOGDPB6XJvwEwMOCvWH+HxR
	zZRTwJkd3niNX1j3Y6KP/m3aP7jREcE+/25bZ+R7TuNKJXwKF5FhRJY6j3NLDF3irqzut2nodZM
	42yLoN27p9qyWoy7UupjiH/FRxdXfHceDF2Nwwz9rDXcrY0+xWVzJT87sQ==
X-Google-Smtp-Source: AGHT+IGqCWXSYLe1F3aJbngmh2Ej5BjoDUAs/NrMI6yfJSL/I1PGEMHoupiKd+J6APx7VBXelyiESA==
X-Received: by 2002:a5d:47a4:0:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38c5195f307mr14202061f8f.16.1738429403011;
        Sat, 01 Feb 2025 09:03:23 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122707sm7860204f8f.50.2025.02.01.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:03:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/3] mdns: Correct RPROVIDE to match libdns-sd in avahi
Date: Sat,  1 Feb 2025 17:02:41 +0000
Message-Id: <20250201170240.2880-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250201170240.2880-1-alex.kiernan@gmail.com>
References: <20250201170240.2880-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 17:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115214

We want to select libdns_sd.so from either Avahi or mDNSResponder, make
the RPROVIDE match the one in Avahi.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
index 6fea434de81a..b860c34e881e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
@@ -134,4 +134,4 @@ INITSCRIPT_NAME = "mdns"
 FILES_SOLIBSDEV = "${libdir}/libdns_sd.so"
 FILES:${PN} += "${libdir}/libnss_mdns-0.2.so"
 
-RPROVIDES:${PN} += "libdns_sd.so"
+RPROVIDES:${PN} += "libdns-sd"
-- 
2.25.1


