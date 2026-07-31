Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AFEC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 06:51:23 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1120.1785480678168260542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 23:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EyeK1InH;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81dfdbd86d1so6808507b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480677; x=1786085477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU8yK0LQBUQw8WtNermjcKmvMuQTbw4Z+g0zQwDIZhE=;
        b=EyeK1InHYHWBngMIO5w3HHAoPqjXyEY17xCxIGDgBvcPW9AkWnyrlaJqmnnIy29FW/
         Ai8rXREn2AQYREGynP2WbRXVIXEK4hSDXqff9VgFDdUSQ/U2sDAZwCUmMKKgSe1Afyfj
         O52xvmAJs7+fYDEhXpjibP1YW+a34qae6fVWThMQJTVjIojzQUwUOrKATBF8+v/YgADw
         IQKiywSi6dBzsp1mk/EbYFqyoA4oGyvFlYgw3MSDYbThGemFj6A2dgbzS9Pbu+hBzyVP
         etHOpVBhSN14d6F2fKlLixBg2LHj5VyHNI28B0UmfFFce2LrJvt+xklTTFaIBuHXVNOV
         ph4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480677; x=1786085477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU8yK0LQBUQw8WtNermjcKmvMuQTbw4Z+g0zQwDIZhE=;
        b=g0QkZ/Ms5VIUMk6vum+JgfHYCbxmhBPMPXx58QMcMJ6XZ8KADimzphj/Ihe2y/e1KN
         rxzbTAAfGzGfHLBAP95vZqD5tvQjE+1LfiveSjjSmR+XGVsHuLZra2Kpj2zN2RLJl+cX
         wKRRJa/q+nT7f8zCvz7FQHGy1M1iIBnFZ842uFDXT+5nFy8LZZn6Q/wXqVpoUgsXqltY
         tReDipqP4331F3U4Spd13vseIx202GXK363Qt7zTmab/Sg+IZ8uIQ4NLAHbFXXjTez1A
         GqeH1gIxDI+pr2k8jiMq5neE6mM8R6mWzyhd6kFD3BlxgFPkflPFZg5DRupqbPUsk4yE
         cDLg==
X-Gm-Message-State: AOJu0Yw58f+mv9l4pO4eCNu79rBGCthf7Kl+RevdjzuG90e9V/yE3urs
	Q77S8OdaO2ByxYUAZ1h2Hb7ilXZs0gRKJt/wxFw9Gp+G7jOD61N2iq9MYDJpyh8+
X-Gm-Gg: AR+sD13LyvbyAQmC5an8FMtae5MhO070xAW/o2syK93RQV4lb/eD9l/wiaZrcvAFg5v
	kF4+YbOGES0F93vEx43EUcJbUKp++mfYRc7MoWkKcds3sxPRu4YNSJ7cfbQk61XNBrgTkTEW3+5
	/qk+4BJLkzVkEejbptRZJLkO6yAHXrPSt2n3VbteMG47C0fq+AWmTeIRWSCj2lgosaN+nyuw4il
	1pHnZFrZSrNBYWn/MTm5arvDdFox7PFLQv8YLqKcW5cDPQITuVAoyGr/w+yVOQwIxTwLa6WJ8/s
	2Z3Y/bEfQDGpWcz+H/cjwKrhzWm7b9PCc+EHks4ijGiaLoboMNkmhuxkHc/d31UX3RFE8VsgkLf
	2bssyIH7VzKhjS5L8iBFDbk+Sh5Iza6xxX+wWCB+Aqgzh77tMmqXJ4u4fMMhQdBD88XMQrdADpv
	JOZ4q+YwjXZ3bhtIhwsUJ9J+sjIfoc4PglvoVSTYEV4uUd8Oy7itzQlEqwO6aanZadJHnyOYQSR
	yx5HM/oIeH2kPJdFWe1bHlEr5DdDihS4TaujgEpLuTWa4qjpiDdyG0/l6YdN2Nf73GnhqB1itw/
	Y3ywj7PSXwcv
X-Received: by 2002:a05:690c:3601:b0:80c:37a:b62d with SMTP id 00721157ae682-81fcbbddd96mr4628247b3.44.1785480676780;
        Thu, 30 Jul 2026 23:51:16 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf841e1sm2249067b3.18.2026.07.30.23.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:51:16 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.8 -> 8.5.9
Date: Fri, 31 Jul 2026 02:51:05 -0400
Message-ID: <20260731065105.1000116-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 06:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128579

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.8.bb => php_8.5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.8.bb => php_8.5.9.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.8.bb b/meta-oe/recipes-devtools/php/php_8.5.9.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.8.bb
rename to meta-oe/recipes-devtools/php/php_8.5.9.bb
index 8d9b91aa7f..bc249fd0d3 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.9.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "22f938efc6c4eaa8bf2e40ae11466140309496aa5d5a19204272fb2596fd11dd"
+SRC_URI[sha256sum] = "703c082ad9d2946ac647f3596812300d2c62b360d2f31a999021692a9b39476c"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


