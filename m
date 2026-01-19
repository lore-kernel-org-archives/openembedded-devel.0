Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CE3CCF2C5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:35:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31359.1768811751308155002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/UjxyVW;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c363eb612so1952527a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811750; x=1769416550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2LH9mwiemjU3f6z4ffXO/3XtAv+hNFTE0vUnHRzRLE=;
        b=T/UjxyVWxs5TrrbHtF80cOsD/wtJwTZ4JQvS+6SfL7lVfojxA1ACq3LD96L0vX1EBj
         ctFL3/Sqjog09PxTHacBqPO0D9NSGcJGGLPX9/aKMDv3fhYmaYCUKdl+p1MieEg09wbe
         0seEtfU7lbKcWTwZv9VPDTsEGM0EaakF5QyEHg9njh4rl2yN87IY5ea9yA1P+M3RiLP+
         PWyJ+7quwj76XsyM7qliF73Ox8uVqIfCzYU2Izqbl7k8ZbJl8IyYW1lcM3QPQHwl8N1s
         ukMx8i5tsmykXTqqp43T4iSqTUyugDB9PPH6DDrlSVRJ4NTBHoXC72JpOJQ41m+UJlO5
         nQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811750; x=1769416550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2LH9mwiemjU3f6z4ffXO/3XtAv+hNFTE0vUnHRzRLE=;
        b=od2mIxm2STmmDOuLf41b6azpr32uMDkndOk2Q/zJmKQM2ThssXVXnCCkAy9m08baW9
         rY8XcY6acxYdWDmOUsAi1H4t5N9OI51UBCCq4qDM7yrI/4HWpAg1ulZ2hKnSjH5LCbss
         R86bNWkItbiKx4114DICCj/r8YRhhyKvrH1LBxrnhCpjbZwfCgC9ebCOCsGDwN2lDYKW
         A8+/k868kRmubJnFRQCoHpIV4EcO7isrIUjKlMxKXJOFt8HqoZOJfcd13ZoA+arQVNav
         b7jinCgspjV3+A9u8TJiHlCtIcmum1Kj05Je2y7GDSpNi1dipiZuyWNDpWB7LZLX53B8
         fnIg==
X-Gm-Message-State: AOJu0Yz0cbuvlHyxzPIblAUm49JYNDNRug2m+b9pnHsMtaolg9CELPxs
	CGKmW/6sZ7iOFkVOo//OxkpwyCShztpKnMiAWPL8Sc6Wz2a9R3utrIUxL6pN6w==
X-Gm-Gg: AZuq6aJ+aCrHWGaFMMTKtRLV90lJvNfYHcB1Ni4/dD62r9klewFt6W4xUUaKD4wiII1
	xu/uAsNR1zajZ9Ocw7HMQg6K1bNSkENP6hADbm/1re/hkf3jZlxJ8Ar3VVMot0UJ8R5HrtfDJh1
	ZUORhgfK3l/rtqYmnjLMAHaiVWrcM69y1J3Br88Ve9LEAZB4NVeifsnbtBAqil1N6W+Bxa9JXX2
	pFJx5fWAprj+98ZjJprDwQbGGKN1jLj/ZicMyhP8m4dg62qCrwaQtBArd+p/RQKGHSlBgzkR0+b
	JN2/m+460CTwCwmKIwi5V6eYBVQmx95gI6Clh/ZBMIBYUgwgGgM8+qVZ1M3R1KAMM+8h/jm788u
	umsVDPAiNP3f1jpj4Jqq139Zl3WTIOwTvyk/Mq5oJJnHFLXHE7xSSVvsjztWbb8232Spnm1mmav
	PnytrYhtp73kzBY93sSEs1SCM=
X-Received: by 2002:a17:90b:1b41:b0:340:d511:e167 with SMTP id 98e67ed59e1d1-35273028655mr8823674a91.0.1768811750559;
        Mon, 19 Jan 2026 00:35:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf233914sm8531668a12.1.2026.01.19.00.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:35:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] liblognorm: upgrade 2.0.8 -> 2.0.9
Date: Mon, 19 Jan 2026 21:35:40 +1300
Message-ID: <20260119083540.4137086-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123623

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- fix build issue on some platforms
  - guard compile pragma use
  - remove unneeded variable
- fix memory leak when a custom type in rules does not match

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liblognorm/{liblognorm_2.0.8.bb => liblognorm_2.0.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.8.bb => liblognorm_2.0.9.bb} (95%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb
similarity index 95%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb
index 6c68b515e9..188f7d6011 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb
@@ -11,7 +11,7 @@ DEPENDS = "libfastjson libestr"
 SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV} \
            file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
            "
-SRCREV = "33ec4b061ad0a6e5508e679e150ce6422ef6be30"
+SRCREV = "3804548e3541747bde3e82a78d2c2dcd865296dd"
 
 inherit autotools pkgconfig
 

