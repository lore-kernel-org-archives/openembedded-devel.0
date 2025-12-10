Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD33AD3C52F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:22 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14128.1765368262283229873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aRZf0XYr;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aab7623f42so8077332b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368261; x=1765973061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyezgcqryDs8a74Cn9degV+bG9oVXmn8pTf+dGQ4eXE=;
        b=aRZf0XYrL1tkrAEKk4jzecbyXkvSquZcSS9pHW+zTAcmHSlNh4emZdl0DS145AhDhS
         OLzn3xjezFIfhDRr221s8rINgQCwK96sb9EzGv8G1S982UyAvehmZOj7w+rYJqo9egGt
         RzYt8CHjKY4ktf36LzWx5wmqackN8S3MG3dKlSnLJprXpbX7Fvcg20oE2gquc2dMuu3f
         MHErz05wZALpP3mXkXN+aEGp9HD78V9x0vJ6TybuGwoVHgcmM8ZdpWz6rVZENmMLThUL
         kJTBBsJk7FyrV18D7JT9adQx/NwIgxPkBx5nevnnThQxlIf980m2mkoTj7HUfi9T6MOm
         gmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368261; x=1765973061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RyezgcqryDs8a74Cn9degV+bG9oVXmn8pTf+dGQ4eXE=;
        b=t39FWoDG231P3uMse/HfTbqy4EGgVDCgAuSVqP9jhIDAxamQGvgGs6F/Ykgf+0nnmx
         sdOSS+NNqnqEPfv/WBTmjwdJI2jOp9K/dKLKb9mVTUtOa5HeIeN1g4004Oy7BnYD1jIX
         91Y1WzW3JChYEiJ0asv3mBAy8p1lv5sMYXWij1AFoyXpS00wm9InbRKSGE8TwTPXHscG
         Y0pWVnQ2pSymTLlZ9YDNXMwf1EWJDR1iNcl5H4pa4JRGI3JobtMGj+hryZtVQU+iQMKO
         W0WFOTeOAjixVk23Vggq6NUM00Gr/rblf9XVRYiv0SoWlppZJ7urnnWgYmSy6szlEAVJ
         datA==
X-Gm-Message-State: AOJu0YxVlO1som8fSu2wvhcgpzKvQT7cT/gkGdNEVPDbaZ+hKbUb15Kz
	4Cx8WSAHnvE+93gDdwC95ZuBeKjjd2r5ok6h8tJmYTzl9kpTr6/UPtsvZlSmaA==
X-Gm-Gg: ASbGncv2+9YICHNbx1nnaMvlnjFqPR9NwlqSsw75GJIVru3Qi9h/1l5VHgkwLc9ZHpF
	mKcX24MiYkMvMxO75xbMKSaOmUYBRkcYe1j9l5qp3LSZvPIEvJ0PvRhXNZZlRa86QwBLjyPA0HF
	UI5HeS3oyTlEJAZItNTTvPIqDUQwntgBQ9S2WcYAPSqhHxs9CYesJgNj+6yByK550Rx0YEcF4AG
	mzin194HvoL3o9uLAyg9zK9z6EVtq6HT5CO3FGMsi4PX7D68BvopOM9EvZBtZDssCoFfV0Eyiwl
	/YMpkQaT75qKJ/dDYIBF/kKsNekSd0/bN0Jgtb5uVq6PYehOVpz9sgD0WAVpGNTtVd0amTgV40h
	0ADjiOooQr2OlAkjqSVdDfEAyt41809NFe8e9ZcaySbSuZA2L95HCPBJK+vUoFTgePX5b6FJVEd
	Hs7+tjQ4ghEgE9IeHDh6sj7A==
X-Google-Smtp-Source: AGHT+IFyItS0DqcE/MQZABHsFBp+1E9NZVWWkZ1ZFEZS/9XHnyNIfeWwfbUzgBU7N5Kc2Fmmr/VDFA==
X-Received: by 2002:a05:6a20:3d95:b0:366:14ac:e1f5 with SMTP id adf61e73a8af0-366e2fc1b7amr2122522637.71.1765368261274;
        Wed, 10 Dec 2025 04:04:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 02/43] sdbus-c++: upgrade 2.1.0 -> 2.2.1
Date: Thu, 11 Dec 2025 01:03:16 +1300
Message-ID: <20251210120402.4179289-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
References: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122506

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9fb5981859873f76b1a4a2c31c08acf19cf437cf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sdbus-c++/{sdbus-c++_2.1.0.bb => sdbus-c++_2.2.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.1.0.bb => sdbus-c++_2.2.1.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
index 62b30e9894..6cacb5dfe8 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DSDBUSCPP_BUILD_TESTS=ON -DSDBUSCPP_INSTALL_TESTS=
 
 DEPENDS += "expat"
 
-SRCREV = "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 

