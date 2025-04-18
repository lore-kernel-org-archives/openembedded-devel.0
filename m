Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FC9C369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:56 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9668.1744975969671123617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSQN1zTw;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso2107179a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975968; x=1745580768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMwKFAovUjUL3koOqANQzkI728kOvHwejvooyQsbVB0=;
        b=nSQN1zTwSywr5D+5qQAMh6H+cKWXXGITzBWrX4Bzar/aYwojTI8mI5vE1Bx+zT//Du
         MeRM/wJnBwPaB1q2gK4LvbkwCMcfIsh3BqZXzY4RZc/L1Rh0h4M68VnY0Wi2Eop8/KIj
         /JF1rWFb1QzFJ7qVUhVoxUqgv9C8edH07W65H1gtmNEXxxxUNLXljt5ZDjLsmLwX/5ND
         ngKINjYYYHmuosi36yc6/MJOMmcW9oJudPzq8dBrY2eIpGZdmErvAqCUIU9zz42dz+aD
         JgSDKXiUbDKvJhP6yYVNbKL71F+LSsXDNp6d0MC40tbymTueeolZEDRm8cZ7AsC1Aklr
         ASrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975968; x=1745580768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMwKFAovUjUL3koOqANQzkI728kOvHwejvooyQsbVB0=;
        b=D/YRJBz2QPv8kXEqlWpD2aMDbUydUxsCxB9JX77F+kA3VEYaSrPmcNPzsVoAHSCMCi
         42LMYMkOq5caD4ZpT38IaBK6+gxE2Le6xrhVeoM0+NAk7JA3C6gBNlkpkG5Q1hqhrZzP
         vNgJfSznwLd9AhMe/O7pFrN9U35mIkFZfnB/M1h7PSIFVIy6MevdQ5NDgjN3BOwQ3q5S
         gSkHkcD/t6tbCHNikKCjboZVzn9N7Gd8Rx1KQTS1h3TXMMZ+EoyYq5VE03nb7L2RLOhn
         Xa+kyO57/EhvLo7nwSJ6uSMWO0xEUx2JKl3a/Vs/zou7EcBAMWqR5vZ6m7xI8uzXe1qz
         edBA==
X-Gm-Message-State: AOJu0YzmW3Zd40yM6wiTsVY282ZQMT33zSeXnr0rPhxk11TWVQnyaw2W
	+h4ZDOhmTW8Cn8zIWmMowCn6PESchevJRRMxK8+RALJYA3xF3oyN
X-Gm-Gg: ASbGncvrlqG7ReCNkJwsqoPdKJ3X9RwiwIQ3YX1Umq4Y/1oMbMb+tEzbVzOcaNNH0zR
	38oMPoUJQ6fUUu+Dv9Oj89FY0CYmAYKfjzHAgeAf6F6lg/Xb4HPTjaFjkd2mdcw9LMRyQqxhjB6
	sJ4Gu8zC0k4NnDCSZfHZaZxv20lRo+9K/YQGzA7WLSthgaIBz9fjhmK48lSVRLyGzC+92tHGsvq
	GJ2PxSf8YnOVXFs/dbE4TBZ/UFWGT5c4s7eUJifSWnEejxmlEApRiqnX71N1hKuemD8P7OvGSoY
	cPrHHQea2JQSvZJNbpNs226VtMChgMDj+z2bHSnME9XgoSdRg8sVOJM3d/+GBrWXx/s2/x2lf/B
	EdUjC/wEnRCIa0V36ydOoWmq+iXSK6EsnmidHe7imedAa200iHFrSHwPkRmoFVmE=
X-Google-Smtp-Source: AGHT+IGNgHuS7YjQP2WlX5vDtPacNLKFLr3yJAcV8gxP+Rpn9jM9zVcG0Xcusa5nXJQqzUBzfBUN2A==
X-Received: by 2002:a17:907:d7cb:b0:ac7:f348:b8bc with SMTP id a640c23a62f3a-acb74e7f708mr197803266b.61.1744975967732;
        Fri, 18 Apr 2025 04:32:47 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:47 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][scarthgap][PATCH 3/5] can-utils: Fix build regression on musl
Date: Fri, 18 Apr 2025 13:31:46 +0200
Message-Id: <20250418113148.142480-4-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116954

From: Khem Raj <raj.khem@gmail.com>

This got introduced with 2025.01 upgrade on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 932aa1de20..d4ee34167d 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master \
+           file://0001-Include-time.h-for-timespec-struct-definition.patch"
 
 SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
 
-- 
2.34.1


