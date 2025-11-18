Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F029DCEE350
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:20:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5171.1763493616808418162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 11:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkdfxFSy;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so5295683b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493616; x=1764098416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAl5L6fsPzE40P5sSrp6WvU4nTjUMZsLnk3xsn28HUE=;
        b=LkdfxFSygDua0/ZeNxFVPT4lyA+fb1RRX4LD/H1zvygSukE5WtOZ64dCRh67KRFm29
         WOSTUECJfJBYM1OgLUbtad3tM5UVTb3lUou9XXVj28FCPqHbnn/ZpYRT9xw6gXhq+jos
         VbtJ6HvQtxZRWFVzUu8D0qMAY9WMwScg8S637Fe3NUYu2JrRWyvZGi1TvuwK/AiSRFVP
         mGPKQT+tqu4ypTtAfIsFK0I/GU7uQssR8RuQQFNPo4/vDsoiAYG5lYNztOCPpI5JFLuv
         e9YkG7WpVZjNakvsXz7/Vbhzj7T98r60GgN9CTNdiJ1h1gh34s0EN1POmxiq4zlr6dEB
         P0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493616; x=1764098416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAl5L6fsPzE40P5sSrp6WvU4nTjUMZsLnk3xsn28HUE=;
        b=NGzdl9bBquxuBuFTfjzC0LX5+OE0EgVEkr0+cBiuKXz1O8JkgmGU/hAYeYRTS1hTRh
         iDPiJ7ZwdTqrx9gY2kjlvCYqyg1yxHh2giLZIfSxInqWJ/PwJ+mMsH3i7Zu17R/m9DKi
         Xf5HB9fCfJtPW663EFzBbWTCTnLfdXZ7TgnBqmkxgKsmfLbAGaCX9Zt0XHQSCCPO0UOJ
         yLnc+y/wIAwWmxDvjIhMnJDZBzcv/wojnEx0N2cbeH8i85ChClu5NPdSVog6ybaYoCig
         S1IRh5FpRzxxX7ya9BLj/tsD+Sg8XGCbQMggNFWREtD9Q/adVeMK0lfs8kV3Y2mpDacJ
         Ictw==
X-Gm-Message-State: AOJu0YxXsmj8/WilC3j/OrpU7Hft2F5zbJ55WMN6dRX6XIb1u+Kynw6C
	OMGntX2DHWhugBwd64LpB9MYbEn9wEJQvudhbUGPUC4iasK0gWSR2hDgpFSGQA==
X-Gm-Gg: ASbGncvTfCFJB3KP4weoRuD9lmslVW2IBSKcTvNeNqafb3M6HCn/NP1FNcRw6OLwRO8
	ZuHTQsqXyxgSNqAV+T9QYFrqb+AzcDg7i+KKhLTTERrY6uOZQMJXUn02QVCYtyPM8hLIAvMlCu1
	15y+WTqWlL8NZ1iZwD9u4YOV8hGZ5azBZqdZsk1zjbmRY/ZSs9yZ2dfAHpo4QH2vHK09i5QJK7g
	KCVgdAIACevXl/2HaHWV9JTaKYU8cpIwt8UtHQkk3EFvyevcAyfiBZDhBE9pv4zGy3GEdiNmMNQ
	M0+FS9tFjdzK8tFEdmUdAK6nfjcKud4i+ImuJlzlfeCPswJSRGyPG+35LDZMjI/H9mKklbTmKxF
	eHl5lPNMPbXShjAF9Wk4453WD8hFs84JTjVHVpikqpSxqo7PDF4oZL1WdSQQXOR/wfyJJbXFWpI
	LzWhaUsFMOJlhhIbLPDR7wnwu+
X-Google-Smtp-Source: AGHT+IF01gcoVE78hSWychmfXtTJ+Lf05xF93gOep4jj2GECj/CacNJrZOGxZDDTwtYpPVcSPrusNw==
X-Received: by 2002:a05:6a00:2196:b0:7ab:e007:dec6 with SMTP id d2e1a72fcca58-7ba3cc5096dmr23754365b3a.31.1763493616060;
        Tue, 18 Nov 2025 11:20:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm17041601b3a.66.2025.11.18.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:20:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v3 1/2] smarty: update CVE_PRODUCT
Date: Wed, 19 Nov 2025 08:20:08 +1300
Message-ID: <20251118192009.2018290-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 19:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121869

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
chnages in v3:
- no chnage
changes in v2:
- CVE_PRODUCT change in a separate patch
---
 meta-oe/recipes-support/smarty/smarty_5.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
index 047f10589d..7f99b9b5d7 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -34,4 +34,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 
 RDEPENDS:${PN} = "php"
 
-CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
+CVE_PRODUCT = "smarty:smarty"

