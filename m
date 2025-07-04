Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE38C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:31:57 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.12400.1751635907451930834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d+ue4yKJ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad572ba1347so134561366b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751635905; x=1752240705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6oqyqyFvd2Xr4w5P3sLON63yEE1kzU2rLwJvwLQnR4g=;
        b=d+ue4yKJuq95rzEYahDOhVEH0ytRatYbk1MDbx2VbtZ+3WwOJn56hK5owg98rqqcmZ
         uQu7NzEFLtrwtgNg13bObBYSVox4oAxQHR/JGtq4/bfD1CccdWcNJR7/4aUTgooDgPDD
         Ykg/zLkb0HYNsUo2QNmg/xSIGOXoobtkmDbUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635905; x=1752240705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oqyqyFvd2Xr4w5P3sLON63yEE1kzU2rLwJvwLQnR4g=;
        b=ZJ7Z2w1q2Nus69h+SqIjzlD4UCNd46KMz9Rhd1htuInH9YJG2HvfCyJJ1H/P1U23qd
         sGneo2Epl7tMfxme0pu8JUhr5ozb1SxbU9qnLLW+HM3UFx++cIkA55k287yo3YNE0fo2
         nBTA4rpG797+4akd7BnLvaycw5rzd6JH5cske4uxZBrfJUK5D/Nb1tKhk6GJyndOm5a/
         G5MiBnH4WOhtOGUkemy/EAWXt7sYzGFUFCZG/iPbaG5fw83+AGjiRRvykR7xf2yDtr8w
         /IeFIrTi73BtHCOUkQfNkMFo3GWJOrXYv4IcxxcLaT1odeahgSHr+GzgCAWkQUGxCvM+
         UyYA==
X-Gm-Message-State: AOJu0YxNAXZusBsUYtPm/sxwh93bH9+xeNeCOQYDEbwd7YCINZ52atLo
	CMYt5F7H+tzdvsP2duTEeBgXVwRJZZK+PzOug3Wtt5yMi/NWM1jb2ujkfPZUrL7ZBrnknZyf5yc
	kg+vs
X-Gm-Gg: ASbGncua3KnMGB2XqJDL4JX7inHXnhicLcQYwE0myCCoRHFQX1NlMlEmetHW1lfMvFE
	s0tnYcGAP8s5mhcbti25yaELc1G+YGKEyFSgcZySIFFRrUTMpy2OWzWoydbhivvc5hNEYA1By//
	awUh+gjv/0DbjpoZvdKnyKyGUUCvqZfaA/QVvSmlJ1F3BYwgGUOTNCFTNeblwyKj+SNM8n4j0YH
	DKumhiJWMZJRTwEyX6ijIoL3NT7rVAfL+ZzA/fIsUCgV9LowkcYDaLhpaxN3c50bn0ia2u6DZrM
	jk6+FWkOxYE/QIeGvhXFXwzOozeMhzicod7ruy/tvPNZ+oqxUv09zPmtGnCLiDYXvT4bljFZ22u
	9SiHv1ACNDbM=
X-Google-Smtp-Source: AGHT+IEAvE1uZM/0aKxG5urK+UHyipBUht1FWGP2XROoo+3573wyJMiRdBZ18i5Vpu3WYVI8Qm0xSA==
X-Received: by 2002:a17:907:608e:b0:ae3:bd9e:589f with SMTP id a640c23a62f3a-ae3fe7b4b5dmr231820166b.38.1751635905276;
        Fri, 04 Jul 2025 06:31:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93ffsm174389966b.36.2025.07.04.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:31:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-dateparser: Upgrade 1.2.1 -> 1.2.2
Date: Fri,  4 Jul 2025 16:31:39 +0300
Message-Id: <20250704133142.712380-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 13:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118234

Upgrade to release 1.2.2:

- Handle the Russian preposition "c"
- Fix weekday search
- Add Python 3.14 support
- Cache timezone offsets to improve import time

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-dateparser_1.2.1.bb => python3-dateparser_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.2.1.bb => python3-dateparser_1.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb
index d3541c89c7..b66900aebb 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "7e4919aeb48481dbfc01ac9683c8e20bfe95bb715a38c1e9f6af889f4f30ccc3"
+SRC_URI[sha256sum] = "986316f17cb8cdc23ea8ce563027c5ef12fc725b6fb1d137c14ca08777c5ecf7"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.39.5


