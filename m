Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129EDC4453C
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 05:33:58 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17478.1784784828368511129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 22:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X/v/PJSf;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso149091a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 22:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784784828; x=1785389628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yq703SFNJ4ysAyHnTnpMQTz6uZHKvaF+rFT1f9bEYaA=;
        b=X/v/PJSf7kfTuJAv4ndYuIb9ErNypqpVEP5zuhqaypOoviF69oPjsAfa+lmkxlIA7S
         Sr+fClRCVTaLy81AcbCBNu970n9Nf0aahZzeOCk9UvmGB056SBd7fyg7CchP+FkvkT6t
         AFe9f322YYvwBynWHZ/OFpyNbQsu3gU6RcYNIIMSrD++FlXdCPD1+5EBXP8jm1Qouyo2
         7poSizw3Ps+3+qw5sH0Pin962W+ky2Gw+OGVcHvLJqn78HhwlzOTM5Y2yi1S2wM+Jrct
         Jo9qvwAE6bwBz/RtWT5q+1n8jKN9Ka2yMh/J84+2UI+j3JvmPFosQcJSPT3j3aWdfp1K
         2syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784784828; x=1785389628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yq703SFNJ4ysAyHnTnpMQTz6uZHKvaF+rFT1f9bEYaA=;
        b=b7WUaUamzI0gsMbpxFMRv0SyanDVQwVN8m4aLlDFvXpJRXFaecdwbjhQNA46hJHpnK
         wrCZXvdfFXYoYipest5RcHM2R0fAM9KrytikJO2l/NIuwaK9DHCSPc3lhwY3GuvWJdxL
         iadN/K9cO3nIgvkMt/QZJtoIbkw993sRJTaAWkhyqYk8/g53OFMiQDxrQgy8M1oJaNdh
         kAfx5bIn2js3ntYcC8HLJxcCy06LCircjNV6cWGQX8q0r5BMFYKP9AiK2iu6mhKGMD6Q
         k7qbbiBReJ2Kkx/a6XB7xOn3LYzb5FLNxyZdSd7B+oLimkweBSWF4gJsxDQJnTS+UOs3
         usFQ==
X-Gm-Message-State: AOJu0Yz3tEgT39k1A+e0ZUh8HCmANR8fgnTeGsXqkhxqxrbZZSYWQ71v
	vRkZ9nMIdF6YxnCnF7qH0UzP/iTIhR+OVMyBEEB+DqnJZhC5P53GksjVdOaDjg==
X-Gm-Gg: AR+sD10IYj0+T7k1C61pV2cgjj0okjLDhWp81go+iuHhcHYwjuatoeeCk06oxI/lg6D
	rFFXYxTU99e/mp2AipKY7LQooC+DkukgbEGrhQg21lutdUASUapoVjMh28ie8nI+FJ6U4STTPf8
	NptKUTjUm0EZz82pgSElC7rlTA+0hLmlWOMZGrDVkHBJz63CTWyubUJeAkP60KuGksEInWcik/+
	wxEeu1kdKHBt0m/56zw7W4gFAgruv+j7H0qHpseDGz7YI/IhvcIo126H7/Sqj87Gd2ZqmANajub
	L+FerTTHlcDFIp8ECoAsCqIRuVqrTZnguNESBZCwWCXG7/aF5Ba9PCUPbSW0JyALolmCGcr0pdt
	Velq5OIBD9OoeMQ+SbdzdqMO8o1BdLptW/opEePIJF+76PxsL+I9mYNgiIeGgTaslCOIgLnsCvD
	A5vAsVKQfyrImi/qxFiM/yM7nm5uVY54JgBMl+vMKSylAz5IaHfV4STc+Xkn85FbkRtTruA/eTi
	qduk9Xf8p87PGCZLlI2Sus5VYa/Ntux9adf9Y9xL3blauP+EOpHUXsezhDAIwehctJMdKA33G6m
	on8YvFjmO8cuIc1URTw=
X-Received: by 2002:a17:90a:e7c2:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-38ec6401616mr1542226a91.3.1784784827697;
        Wed, 22 Jul 2026 22:33:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm11077864c88.10.2026.07.22.22.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:33:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] tomoyo-tools: Update HOMEPAGE
Date: Wed, 22 Jul 2026 22:33:43 -0700
Message-ID: <20260723053343.3401956-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 05:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128413

https://tomoyo.sourceforge.jp is not accessible anymore

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index 2c517547af..5160ac87e5 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "TOMOYO Linux tools"
 DESCRIPTION = "TOMOYO Linux is a Mandatory Access Control (MAC) implementation \
 for Linux that can be used to increase the security of a system, while also \
 being useful purely as a system analysis tool."
-HOMEPAGE = "http://tomoyo.sourceforge.jp/"
+HOMEPAGE = "https://tomoyo.sourceforge.net/"
 SECTION = "System Environment/Kernel"

 SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"

