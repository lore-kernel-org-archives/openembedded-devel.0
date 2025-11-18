Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24860CEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.363.1763425653166900079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTc6QaCz;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297d4a56f97so54192405ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425652; x=1764030452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPwjWxpYxu5XHF4J+u4+fC2RElQVYeZTkVsAQBeIKeo=;
        b=ZTc6QaCzI6UKa4eDkFBi2VGGCs8GZHTeEJWcFmHTbt8txw4HfcPHDqr2whDSyjxncg
         fjoFAYHwPrk8wQqMH7PqQEcuv1iDu8l4F2NC1/HiLAJqqBNNCXvERG5i3FobBzarqLcR
         TvkD9d55DwPOIVPjn6T1WZUj4wrBe0VpR0gWstg+sLaFOoJ1JqHGa3/q2c2yxTbOlN3I
         9NLgV1rr2/N1dL0HV8a5Pggto9VpeNW2ha79JpgxAyvpAgaag4YUOUjsS7QzdeyWZ4+q
         MwbmdnbCjYMBKW2GdIAWo4HYNxqVXHufHbn6lM6lE+fBBf7hxDXBB4N8viuDOSByTeUh
         lV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425652; x=1764030452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TPwjWxpYxu5XHF4J+u4+fC2RElQVYeZTkVsAQBeIKeo=;
        b=wv9yvJ7FMzmxZw01yN1WDtCGlysF2MrayZ1ASstxaGWhKibA9rP+ZXTCGxpWY3DT50
         4zUa8yCtx4jUR2AvBlp1Qemsi+7gL4qb/ycTJ/nV6W+luIt3i9Nlf3n0dxHmfoTaZSxO
         e8AGb7iDXfFtB6UYiastig5PKOBY8SHv637FBzg2zxQ+FCs+b2QaqN20t8YEVB1e9SId
         XE82fN4zrype064Ph1ZC2mE8VyB7N9nZAIGznB24GBWvkt5cHY7tfuyMvuThS58tWzaN
         bF528yU06khd24OinM/cr0FC1B0wPQX1if1Pnnv7PVVn5UDkCS0JKxxsGFyc9Obqf+H5
         8jWg==
X-Gm-Message-State: AOJu0Yxw5gyL9DHyYK0w1iwl3uKGqt9T5NvDcKK+wCEroOFhpsk25M3C
	iSkS8Ie8CSPksLBxUcmRTsjDWkuklkDIavq7A9TGOr/poJP+GnlIbkmp8ikQLw==
X-Gm-Gg: ASbGnct3ZbZWDCNhCIJSP0siTWbCfqdoLRlGWNEblBrS1/A3iJDK7AXI9CMlOHnMaOB
	FX6o5A9ssWXH/4IsHaghPmz2wpyjf0n2E7mr6eq2gZjvdKC7p66U13fxhE/eytH4cpxRid5FBP3
	d3voCqO+cocLIJ/2QPuwEpDGaz/6ix6FRiiWHXlLK9+dG9/KDeI18qXt2V/C+Urko0s/7zLm47z
	2BI5HkQyVxW7aNO39GzgcDoDwyYYUGGgbhsOV2B9CcjCir7MoKqBh9Jl/qGlInSq99ETGFCesE8
	RS1Enj3hjhLk/Yxfk25aGNKE6KV3NB/nG1wF3S0ZEufSSc6tb9CQexnsKLzPh2gcn/b3YB8Eb69
	diKm3Wh6Y3GTPPVtwOvpW9UhsfLWH/xPFJq1CND54uNVy9S9of5H8a5tef8Yb4M+u4L5WB2sBmP
	9G22PwzaetbIydoD+cDpqOV2ovky0mwnJeunvnNDhBawm5
X-Google-Smtp-Source: AGHT+IE2sQX82J54MjQDj1CNqQGafqEk+w+AlMUGoV6BEEXMEioWZI+Aqc7HncUFMRTs6XizROa0Og==
X-Received: by 2002:a17:902:f70c:b0:298:3e3a:ae6 with SMTP id d9443c01a7336-2986a7420f6mr163624125ad.48.1763425652434;
        Mon, 17 Nov 2025 16:27:32 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:32 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] smarty: upgrade 5.4.5 -> 5.6.0
Date: Tue, 18 Nov 2025 13:27:19 +1300
Message-ID: <20251118002723.829508-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121788

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update CVE_PRODUCT.

Changelog:
https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
---
 .../smarty/{smarty_5.4.5.bb => smarty_5.6.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb => smarty_5.6.0.bb} (82%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
similarity index 82%
rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
rename to meta-oe/recipes-support/smarty/smarty_5.6.0.bb
index 047f10589d..88afc55c15 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
+SRCREV = "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -34,4 +34,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 
 RDEPENDS:${PN} = "php"
 
-CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
+CVE_PRODUCT = "smarty:smarty"

