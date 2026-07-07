Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D619DC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 03:29:41 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.167035.1783394979260260809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 20:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d9N0x8Pw;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80bb8287d99so46697287b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 20:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394978; x=1783999778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaNzZM7Rs1sLKRTnFp+NtPDVIEwubz05WXiMp26/nLA=;
        b=d9N0x8PwUnJvl/0iQEsBt2ngvo21GZqbZeIlArmUo4kVZ2myGfz0dz1qI2VMaUgzrq
         QD2xPeRzbvhUBMD03lbWQL4bcUoiC/xEiIAr6CfU8idsFbfipC2GiIB5xPXGbX4S1x/z
         XhLDUpIh/S5MbTADqsSkmapKNe6kJF9HnqQcPlf8kPVupjBtlSxiy0oOGgeFPSEknLP9
         ICaR+8tZc0gvM/lL0qP5fsIABICAoIXI8WT6hMYHQQpqGn39wxvK1Lw0w+vrQL5vrovP
         PamTDz5d4Y3UXwin940abveP7caQfKMV4DUhn/IcO7JWyUWT6jrxj6Ku8XHt2dbvmYGO
         vnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394978; x=1783999778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaNzZM7Rs1sLKRTnFp+NtPDVIEwubz05WXiMp26/nLA=;
        b=Xo7GKrck2vUB3IpN4p2WXIXfJzEJUCipMmSI2LqSYWuLHLQOssdbZZXtgr+HQW243R
         Rc1UxsRAr9l+/86dLQ8f+fHQZak33LrvhPwofy/TLK7UfyMFAKlnGhDGLH453897tHmu
         nm/QFSGXud9g3yGWNUIqgUApDtDXuDbPkpU6PbNnLSrhFl8+OGd14eBJBeXk18DTujr6
         137vroP8DTaLa9G+ezaaS6XXkRuirt6LUXFKg/mYBeTsCAQ/ZNaNGv11fcj9LEGXTy7j
         Vqf1i4g92qjgT0tlfBXaQQrpI0XkxRnsOPBYm2UKorkZiSoH9IyG8FFP/Hp/gR2BIOlK
         yEcQ==
X-Gm-Message-State: AOJu0YzvICGvrpKcidmz4CJ0IwKob9LrBQoVeMEmwwDiQYNrPKFh45R8
	G+vLFEjVwD5WcyUIy/jwseerx/6taX/5sR2uVentjtQ+3+oCbEDIR3odhuovts68
X-Gm-Gg: AfdE7cn9C/5xpeclJ7D6ox4uCHwqC231nIm7WE9XMIeqxmilkB2TO8QtUEKnGDMD4J2
	hhUVuC9RRlljnKcpQtlxoHffNF1HZaYIzG1TvMD4CINUbSL3zArPAhPfXdaOZe7oRyvxkor8/UH
	5x5JW+lwZMubzvXZfboR+wUxm3BXNcfKPcLKtGxGmNthSE6tC+Zj3JLBfW+fo4JxfZ9bN8B1bMM
	3MKHwt/mpAe9jTItODgo7Z2C//gIjClUQVegUDMSe515jHYjlT601cbEMS7VRuiBnCQwrb6cBqy
	J+aEw8rBIWfwa29VhYrQ9Wx7UYq5qzHLFEvZxcfZPU0CYp0miawHPyhe87o5OvSLz3IlYGk+SNv
	pE5pcMwH33MiqjzSD7GPJtZ+3wMDc2ldcXrnnGEAMakmdg1+niOQ5VGkVrqzVyFOBL2SJTg8e0h
	gHMKL7UuztdD39Xax1kt3RYw4I0MB7HifYp1Rm637IgrivU4WxkAI2c0ZUGEAhN6Lr/Fmzp69dc
	cxDqOsUhdgKtVPv+e595iZZiATuQgdztRF58YWXUe6zvROcTqE=
X-Received: by 2002:a05:690c:2789:b0:80c:85b6:75bc with SMTP id 00721157ae682-81be4805fbcmr25589037b3.69.1783394977989;
        Mon, 06 Jul 2026 20:29:37 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ca92c2f5esm261977b3.7.2026.07.06.20.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:29:37 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.7 -> 8.5.8
Date: Mon,  6 Jul 2026 23:29:28 -0400
Message-ID: <20260707032928.2403942-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 03:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128054

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.8

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.7.bb => php_8.5.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.7.bb => php_8.5.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.7.bb b/meta-oe/recipes-devtools/php/php_8.5.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.7.bb
rename to meta-oe/recipes-devtools/php/php_8.5.8.bb
index 4fd517f789..8d9b91aa7f 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.8.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "4ef9355f784d4b320151eb3f31c5941c0da297025eedb97f2838b2ce73dd59bf"
+SRC_URI[sha256sum] = "22f938efc6c4eaa8bf2e40ae11466140309496aa5d5a19204272fb2596fd11dd"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


