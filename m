Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0436CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 10:19:09 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3855.1759484904096792760
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 02:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iN25vRRJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: joao.raul.434@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-636535e4b1aso5421609a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759484902; x=1760089702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=iN25vRRJGW9Kxh+h3E3oIc+96+LqA1nak1KmSJipuCCzh0+ETTfR5k1JKHYcMQmrif
         se+Umkjy7NS/PrEBcvjZtm6hO8Xo/Xa+VZiybErCHJTu8piD6NGPqv3f1nFW0W2g8jVJ
         lPrS3VUWqnF1u8wKu3ewowi5t9JqZr1SV3UaMQ8M1jiAvTVNDkNUCyfDj4QyjMGHwYs/
         sI938t+MhoWJdV9FHls5/KZwRqCYgUQ2ecuhb5twsX4LRKex4UdBktm3YIuIKW5k9EjK
         YPzFB7r6fpHbPRW86vFG82KNeAGBZSyL69yE4exHXj0s04+1+QZrsvibe7YN4YmptCeB
         YnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759484902; x=1760089702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=W6S4KI8QYK20xeB1N4WyVXGzkYfy9m/0D6qL7ioTNBxhxhID15l609L2Hzd/rHPhJS
         pN020NALmTVOoGntxIlJVZt0ZkfiiYPhXPjzXGnF2ri0r/TjwnQMgDtV+PtSFYk1cif4
         siAkTYvClDiJduETB/PAKP2KwBd+829tmec41XeJdeZRrCrbXcr92c5S2rYnYYW5tsOe
         jjy/KDB4EgJtlnYb9BKk9x/Rjw0hSWBCFXcXeayNq8slmTUG7FNrK7ovI73fAYURAvOc
         Bc/Y8y3Q4z/T3krH8/GLhTQkSpRcp7a+IpDJXmCdssKSb3dziBg8RRPNofvA56xaj28E
         K/ng==
X-Forwarded-Encrypted: i=1; AJvYcCV2aYxa/9uZ5HjavYHhA9p2CESy6BtzSLlVnaHIzDtnw567gxWaPQgM7H3E7A3owqjqTZMOmuO3Nw3vVc0uGQ3LXNY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXtu58DQs+y5R7oMNLXQGL+0Kf0OFysFbS+GSRwDbzTZmc/EzV
	25XLCrNVFnSkpY9KhUPCC+tS0sXJspMMd/QiuPbevhzaC90U1TutmUi/49DTMw/D
X-Gm-Gg: ASbGncsEbvxqe7NSNqh/tsyL9TLRgsJSILtkS5uxmtfzgWP0J8iRJmLlLciuyc6KUQu
	x/XXki4XNcjeZ9JQLMSZHqJYAFTSKdr9L/JJmP0a5SDqHLowcjnhaBX/3M5/lvlyC0JUp4BY4yL
	TQxr6BL6z0qHphJS2u5pl764gJ0TjYsmEsGSuoGn21VilBOxY1i8R3pdkiOF6kRUYzzaj6sN0N9
	T3YtMZr5EmqqrL0WR7jkeYN3UikEYulJbSdAMJPDR/Jkl8RE/31TWVvsPUKJhWFAhzBZAuigO9M
	TTkJjyMnixtDYD6gAWW5WopDqvgwFQMLhZHczMdJO9OzlWOkTtRN0ybUJCZz/f9zzvfC2caclyB
	FIHY49Ur4v0EGF5PMEDewyGbRG26Stum1GCFRRGFQXr+yqfMPQ3BoPh84qpziGP+2azQLCNg8KE
	5fdWAttG3KBH5PkskDnnjVl0k09hkYgBhND0/Y5WEm2MYsQx7Q/ObrJz1n
X-Google-Smtp-Source: AGHT+IFHrtrAyhuuTtqpeKnUkcYyQ4U9YwOshq9u5rAY5KdsvE+U3nYgJvW5aBEg4LeFLMi64u176w==
X-Received: by 2002:a05:6000:2681:b0:407:d776:4434 with SMTP id ffacd0b85a97d-4255d2d2212mr4262385f8f.30.1759484526471;
        Fri, 03 Oct 2025 02:42:06 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a4161bsm128962275e9.16.2025.10.03.02.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:42:06 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 1/2] openocd: bump the openocd, jimtcl versions
Date: Fri,  3 Oct 2025 10:41:35 +0100
Message-ID: <20251003094137.2046-2-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251003094137.2046-1-joao.lima@hbkworld.com>
References: <20251003094137.2046-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120212

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 3bbe33ca1d..3b7705c41d 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -13,10 +13,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 

