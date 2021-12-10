Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86985C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:31:48 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.3863.1639117907123566721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=GWjYcddL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id i63so12344587lji.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HnDUUVQkjfLkZRDV2ccNtbNdPoUgSTGV2J17NoE/XsA=;
        b=GWjYcddLVj+FX3l+JCWj0LPGUJqA87zrUmJJ0f1hgxFmmPMxm8wYrXEhQRe276hnoZ
         mjH4dUjnczUIRgrpkpXsGErH0m9Unb8PIpyvCckjbmMCp30iRE3PuU/ntR4t0Q18TWAq
         86u+5ga7jfygDuq7lELS7gCprO6BqyJ27GYGARalb4fcK7L6Gk+si0uiGqgXUMsxHIdJ
         0ts027OKBUHcj+QatZvQ9fvV7bHDLDzaBTHREIbeaEKu+Uh7nXljFjBId2rF9lD3YrcS
         inlhhKBZ27XaVgUQP7qKALMda3LLcSy+Q9ze9JGN0TCek+sI9UvHktdKyYso4lS1YGPa
         3D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HnDUUVQkjfLkZRDV2ccNtbNdPoUgSTGV2J17NoE/XsA=;
        b=PlfPYnmcmNtP5mNTEuuihOTt+DpXSo1KwxFvQyh/cL7NLmt7Ss+ChsVDDvjcF+Wt+m
         v2jueq2eLHwMWD3HgaFALF/fiXrIso3v47pY3i+I7uZ88mzm7MXaFNYlMe+pqTabfwaa
         YbxjreGaNNso9zXbom1U4Fr/hpHJI9EJi0mHOogyAuPzbzKEPJBiNBzyeYaGyRdO93ok
         GkDeCFmnhqr3aH6ApBHstbnlB1D+oBkKOvH1h99C2ksO8PY4yRk0Gul17aDL5XpbH29O
         raS0xWC3skT9WK3OcLJXC3N/V7hsPLcIc5gsdYBUzbObMt7sfsr8D2MJLnNXn4M0Jdgq
         mfZQ==
X-Gm-Message-State: AOAM531ayaLCGLSFKCw6KDXNLrSY9TwoJWO7EikIi8aF56/civr9XHLL
	qTYEo7lWxenq838vwUZtMt+0x5pF5IbVPdaP
X-Google-Smtp-Source: 
 ABdhPJyi/Ohku9kpBkdDr8S/SAVDLC2faG8C+ht3xS78K52G/thJq3sO5JszTMFilvexXStAVmLAbA==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr10796378ljj.58.1639117904793;
        Thu, 09 Dec 2021 22:31:44 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 s15sm211345lfp.252.2021.12.09.22.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 22:31:44 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: update to 1.20
Date: Fri, 10 Dec 2021 07:31:42 +0100
Message-Id: <20211210063142.1519406-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 06:31:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94270

Changelog:
- Fix issue with handling Hotspot 2.0 requirements.
- Add support for evict_nocarrier setting during roaming.
- Add support for experimental NetworkConfigurationAgent API.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.19.bb => iwd_1.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.19.bb => iwd_1.20.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.19.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.20.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.19.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.20.bb
index 219dffe09..c8f5bb12b 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.19.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.20.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966"
+SRC_URI[sha256sum] = "7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


