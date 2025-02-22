Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2224AC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 12:43:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.45461.1740228216565436335
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 04:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3Mj62nX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43994ef3872so17778235e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740228215; x=1740833015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICXAl/ukNCKZfa/pRBD90q3YWchIPKuK9SQgmTRcgNc=;
        b=C3Mj62nXjkqwCFI/5YbDs767FAj8/vPp2HG883tzrXlMcua01Pfu75z+zaQYYIpUbg
         WR7aCgrp5gDUz8WsIE5t/inR2+/B1sOm2LetWXXe1K0/9cpkEGEV2J+DjG42xTYRdS2e
         tbMxDbUJEawzCN6z+yK5s68QePasd5tJm7EqKbR/rWZIUJbFwaKS/yGrippgsDnWmNLa
         D4jzH0GkkkGfWxuZ3xzO1rTgpUynjErSylQKgCFGSLgBkC08NbaxM80spGRB//z7JqTO
         S20jxg7tCI78zPTm4kB6o1sNVh70gdLJbhXyAIAjAJ3QJ2V9XejGgq5DEhoCkdOzplI9
         uTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740228215; x=1740833015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICXAl/ukNCKZfa/pRBD90q3YWchIPKuK9SQgmTRcgNc=;
        b=ZdKCvRfSYFcRpmO3SxbxikhFWuyv1VsWL4UMMfISCM3jWlw9VahQEeuUr4+NQOO3yR
         BzDLdZu2cyx8tYRCLLjXgDWKQmx7HMalReaNOLZIUU1Ft+cGoJcSlIvMCMXfE/35fGaM
         N7UJCx7dW6cWvE00CaPRSQCJRlbstdyEXqe2B2XYihb198Z2dIeZvzAMqQ2EIfCy7WRI
         M9fcPulVLQhUSIvDJqIVgz6Qe32UB8vafIivZOBesEYjomuYudOIkOhRDzzxt0T5zoDu
         z2lM3bicERwWDwqQ2RLOPNbzT2UTHrowcESVqI4Xsrf8jGXIuEr1z/BcgCHTbKyizuiu
         KdPw==
X-Gm-Message-State: AOJu0Yy6vWIyd9/ELgUacHgB8iPboeoAHtINsCNQX6ksqvVqTVfceBwq
	cIJP8IWgmlcilpL0lTTPMQ2tv3X2hP0G36dZJZ6fWtDFueg0FcLYihioog==
X-Gm-Gg: ASbGncuuEZeVLFyR9PC35v/3dPF6cWGGIV6ppiaTkZ/7S2jaIptIcV3WxosPgtT5NES
	l2BBx0Uw2qMgUkITKAa2GrE7ml435pzGrT1tTY/woJ8lYt4LoXeO4xUb6wEnn7LdKrAkdGFHeY0
	7+bOwiaursUXOvEfEAIq8ZOkN/58Z+oggrCSZgb+sgMQ+H9dGL0gWj0FKmrcFgzWf1uK3P1NKZi
	xW3AGDAheVjICaK35rcUDeIOQwLCgirYQheDWscpsVqiARcpO9vJ/unz9wECEDmiN416SLEk0TI
	Sq/i7oECWPZF5eCwE2bfCNOkuqY5mZWhf7xLBJIpPNy34/nlCDQGcmYbXykx7XiGCYP0ZvybxyY
	KlhvQUKxg0rdz4S3JtJOITI3Ejm2m2+89
X-Google-Smtp-Source: AGHT+IEkyeC0/M9xep5ZFhZJtHO3GbV8F8noDR7D1RV30UohLZFOSahczjbRa5NDdW32Pu3/WMxxvQ==
X-Received: by 2002:a05:600c:3d8c:b0:439:9496:17e9 with SMTP id 5b1f17b1804b1-439ae36d34bmr48275645e9.8.1740228214525;
        Sat, 22 Feb 2025 04:43:34 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm73722395e9.0.2025.02.22.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 04:43:33 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-networking][PATCH v2 1/1] wireshark: version bump 4.2.10 -> 4.2.11
Date: Sat, 22 Feb 2025 13:43:07 +0100
Message-Id: <20250222124307.611341-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 12:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115539

The 4.2.10 was not longer available at the original SRC_URI.
At the new SRC_URI all version of the wireshark releases are available.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../wireshark/{wireshark_4.2.10.bb => wireshark_4.2.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.10.bb => wireshark_4.2.11.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
index 4739c3961c..e3e210cfed 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
@@ -15,9 +15,9 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            "
 
-UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
+UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "3fc5f88ae420bc5856d056324efb023abc4654eed4742140b0d0d36cb032b894"
+SRC_URI[sha256sum] = "dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18"
 
 PE = "1"
 
-- 
2.39.5


