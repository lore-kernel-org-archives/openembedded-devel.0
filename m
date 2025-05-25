Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04BEC54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 04:14:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3643.1748146466926143438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 May 2025 21:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dALk6aEZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so1568485b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 May 2025 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748146466; x=1748751266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L99QEn5UnfnN7OfGYIfwBmMZLyqcgQq5qEcFepOo/M=;
        b=dALk6aEZiOEnPWdzwDH8Yoaz1+l2iR8x9I3NJFCgfwQPWHVtYKJ/uIfXpqddD6Qofm
         1YZhZMx+PPYMZFUh9mUusAM6e61etIev48i9R+lZe2TgMei7cWnz/ITCb4CskIw3ebo5
         DTfQCqbu+ZzljXQJUtscy61Vl24H6Mi4V7ABdHJk0HYVKfs68Q8X1gTQvxBFYwohl4ed
         GmTDaEUmBPFNt738A+zkz/+s07/yTNk9JHrOgHf+NYIIBK1DmmLNMBeTKL7YEk1OTcem
         LTQED3PXAreVsD8jofe4sfr5QLHvv3iHkFF3fgNPUcfBiB1QfxxmX9ZqSoxz+3OAPKfE
         FBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748146466; x=1748751266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L99QEn5UnfnN7OfGYIfwBmMZLyqcgQq5qEcFepOo/M=;
        b=cgZDZ9ICJeLvO2caGAybk2xZelG6u4lFuwAmtC4hJ1YAbde7QX266TvXiYFmNhEw3O
         ga5k0RopU0LFQ2NVv67X4A/RRAMzSkg96eiCUZf8xqvvD1sm2KLmPN/7NCb2U3qjQFxF
         k7kfIPTvFuP7tlOH5XdNz4/VUD36Ux25S3rsCT+0yDy8KQX2iyxUS9AxgoN8v8nWiHnb
         2IkRPv9zpIyN4vdXVgsqdGgbfl22ZuMvEG3ZnrLRk8lyMLhDQMw5nsJGP++lwTnffzYH
         r5tIUJn3f+v0Gs9Ivyj7dG5pUV83ZPAl+WdSsJI/mf3OkhPaJMY2eykQSOqddKwqvjEO
         cVsw==
X-Gm-Message-State: AOJu0YwU1zB/zjF82leNhcFevSSQahRKtAG446WwK6ik4GFW7GDJqxJE
	rxBbV08wg85luOOxmy10q3Wf8MnrTtbJQyWyebLpxnh9E4hXa2POXrUCrp+gGKvl
X-Gm-Gg: ASbGncudVuYknBt3rutnkoESW3+/b8vCJrTPNj2UJoZtBnyGd3mdIkGTKlprYP2p2wi
	edY5mDwisBet9IqkAOavkPI0CFQ/sHXDIc9bLHTx4ZxvYpxYgcaSLNJNwFgF4YlHzc2tlS+8tJI
	XFJKwjD3VgFSTBWuvpZzzdraIMlzUWDyseSyOUnRZH/R4/LCyoK2oTGrGBSPfVIGpRWMDK1Spq9
	jNlkHx644cFfz5Fy3UlRulo4GktuqJ32ISqMwgyZHKQX4VSz9fiHc5hFG+cXUVtu1BPdV2n6YhY
	WLugH6SAdNoDz0nQ9DfsYb5V3PCXx/jcSxmzML1ksn0=
X-Google-Smtp-Source: AGHT+IGHOL+Cv7Ee1j89s1bLzFXQCQ0cIWVFBqSt6KnLKHh61bg0z2aQjr606JfGednduCzoPOGDaQ==
X-Received: by 2002:a05:6a20:6f8c:b0:218:3a3f:9eda with SMTP id adf61e73a8af0-21877a7d7c7mr14401373637.12.1748146466070;
        Sat, 24 May 2025 21:14:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb08450csm15060463a12.55.2025.05.24.21.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 21:14:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] wolfssl: Upgrade to 5.8.0
Date: Sat, 24 May 2025 21:14:23 -0700
Message-ID: <20250525041423.1210095-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250525041423.1210095-1-raj.khem@gmail.com>
References: <20250525041423.1210095-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 04:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117616

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index b7ff23e719..c21d4bc4a7 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
+SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"
 
 S = "${WORKDIR}/git"
 

