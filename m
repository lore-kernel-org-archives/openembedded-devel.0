Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B79CF318E
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3960.1763549620086946430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iMkCp2RA;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343d73d08faso761292a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549619; x=1764154419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVGVg/YNUeeIncSpE3iLPdwRAJe/6DGt5AImrr1r8AU=;
        b=iMkCp2RAfImjyT+7jE78h8phph8Lf3k6g5baA3k32m8wGY6OiKJuNFLk/9qGuH0EA7
         YQ9R+xETBRXdz295OqEh/RSxzPLc8zqFPuJvsZuyBF7mKHN5b1YGxXV3HjBA0Vjx6UoI
         rF2aqaWTafceBU74TjWx35WZya3iYqhEAoWaBUuiYvPNx1C81V/IjiydQ1bimaGrSw45
         kkBVeNyary6XWeY2JiLxpePLTfJjx429/cTSmAhXL34rmq6Bgh9TEUeRDki6QVfXf9bx
         +jybegb/EoWG++Od0GlKALLAWQBLe+WbQUUJgZaVqnuXUADY7vbizOI72eaFaK1dEsdp
         R6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549619; x=1764154419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVGVg/YNUeeIncSpE3iLPdwRAJe/6DGt5AImrr1r8AU=;
        b=l1Rk5KUDQbZmHYw+BfoSqeQ2TObN0SSteVAfljQ+ImSqZ63R5RsShW3CMu3pB3NiyV
         /MXc8XuxIIDscvJm7gwrgIw+8mrAXVP+wLtVz3+UTpm5FUrcRG8/0BjLrYPt74Z84gAe
         5oyxGPQaTLCN0YbBQISskSK2Bsw2fojfAx4YYFQX2Wle7ZG4L0wTf8T70r2r3ttViG48
         ro9lSPFbrIUS+vL09QUzaGkC3dMzNA487mk150nqlTfT0gdRUOMfOVXGBcsYbKlzb0pv
         /j6yeldonubJXibqsVn/tTU3JwaUCQ5qDoD17p07XB90re58/oL/e+Q9LryiZtFU4uHT
         fx2A==
X-Gm-Message-State: AOJu0YxhzDdB+i76HHHoY/bBo+oeVjf0PJg5LsZuhfBmIMOfhAxLr5xd
	pTGaCN5JlYXrSxypmzU0mL1btjIApATGsxtW2J7oE1vXqm8wrsP3mIJf39AwOQ==
X-Gm-Gg: ASbGncvaii8yMJSG6H+Z/yQTAVvGKZjM1Aa7aInGLVQ4lJsPRzc7345sxXSxpPpxNzQ
	+2T9AWkoSkGZrVifot+QQyh6oI2ldrI2exl+A2e0Div9var6xsCKA87kf6316BMJC0kK8X0by1I
	iIE9rhfwwlurm/FaYXEwWGt4h3sO2HzUT7EopgxU/8EyPMQW1AcZfArWWny1xfr8g95EVgNELv7
	2+6ZHt3eARa0vK7Uq78x2ENITTRbk3l1o2x5ypyxXvj/DBitIuizKq3PA8WMbsOZ6te5vitDbLV
	jk2BmoinCrtTw4cEQTZtt6/1fwMAZQeIkYbDtYCZB/R1D5LjC6qBIjgO3l635N9Gae/4V7IFk4A
	WTvjnwF87lMjEGR1ZAA3rzpYBACX7No/tLlrDawZX1jeIiK8hbMYrkcXgujVQBUTgqmSvnPKRfv
	2NZS1sNlFvjDLZIzPm0at0mXnV
X-Google-Smtp-Source: AGHT+IHQed+ewyPLhOFXtY2FtmotH2ru9pEV72Km0qaUcXQiXGPbBhUK5T4PL20gIJ2Xv4FNsasIMQ==
X-Received: by 2002:a17:90b:33c1:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-345bd423926mr2059225a91.8.1763549619267;
        Wed, 19 Nov 2025 02:53:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] c-periphery: upgrade 2.4.3 -> 2.5.0
Date: Wed, 19 Nov 2025 23:53:24 +1300
Message-ID: <20251119105328.2849176-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121891

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Updated SRC_URI to include tag.

Changelog:
https://github.com/vsergeev/c-periphery/compare/v2.4.3...v2.5.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{c-periphery_2.4.3.bb => c-periphery_2.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.4.3.bb => c-periphery_2.5.0.bb} (86%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb
similarity index 86%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb
index 058ede614e..0851463d7d 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
 
-SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
-SRCREV = "911e989fe41eb90c7df274cb54555346caf2a632"
+SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "76c4edd4b5c43a597fd37c618ed32dbc2a27ec40"
 
 
 inherit cmake

