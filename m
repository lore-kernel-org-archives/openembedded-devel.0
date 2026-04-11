Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E7AF3ED58
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 15:47:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.200514.1775922433233531418
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 08:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JXnlJ9J+;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794719afcd4so31006797b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922432; x=1776527232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7RlNfpH7EFOrT5z2SFwpOZnqMWnbeBe/Pm2NGgVCLo=;
        b=JXnlJ9J+mn8ZVXyIYGWY4NqFU2i02+22fag2JQ8iKtzgrVmb5Qb8pah+kuaRCcfDTv
         rVmFbXAMvklYhuWuuLjn3txCuxdnfJ/oTYlwFqDcT4Lh73jKtJ+wkYPWJokMzghMQ/4k
         p2i7NRlSNwqXPcBrzH8DikoMvbXFG0eYvy6tV2jnUdfgRixtB++/y0eJJs9Bu3HlwTxa
         H2138n04dBZ2HX4D0tQLLBpBxlFio2uoeEmiFzZnK+57WGClqxIQOLyquFN+csm+IBZn
         Mz5ycCBnyexde6O/lztT51QNoHpEq/MD3FJsgjRHCmPDRZImGOiC8uo0DgOPiTCOsV7L
         iy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922432; x=1776527232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7RlNfpH7EFOrT5z2SFwpOZnqMWnbeBe/Pm2NGgVCLo=;
        b=KJ6wwB8kAQhKRyJGMoNahalL8pHxZ5Ep9hWqVf4OlzeDuJMlNGLp2YXhMTcw7/msTt
         XVd1ig6i4LDH3h2PBDNjNAPHwmlFfHWOVt2374cp7K2ChRl453VCyEHpQGCaODX1NI8d
         LQIaPDb5Mo1y5KbGlGWa4ZvnJ/APQUeftfhbVWzqIPN/r8iQ+xo1ssV2HT6ONW8kCq1r
         qB/wAq1cIqrnjtkORtvnl7kO+vVMIsU3n+Etgo8VaGxcrZO4cx+032NIi3FUJ+IYgCby
         ktfzchkuN65ITEkDUKNVh9PSRFIFewficyIIo2QAvrm1aSVfDieme5zeYZGpIBBej4Ev
         Bg7A==
X-Gm-Message-State: AOJu0YyLyw6dOvt/yK2/5CBOHz09YdZAUroVq+fp2v/Y0yrWGvb1q1zU
	nRvPhjQ85D1hLHW7RrS/iErR1W3isOdCdYkEQ5eBNa5gwI2OOkg25Pt9WDRJzw==
X-Gm-Gg: AeBDieujo+e47TrhRjsAL+pWQ9VenKbDDDvsSnn8Dgb2iCdTBLGShOGFbtU1y1Ry2I+
	6IqbL0WItkxvOFUwho/J5uWTjKs5BEKGyqLejhxbKSqJR5VWz2eVMAuq2ET+2ZNwAyTXyMZItWk
	kmznI3Y/2v63OZL7YbZ0YWf5gEeILtRMQ7vmNj44sreivDv3qHBHGPFfHcmsoVapi5UkK9XpAlc
	EiHdskpk3fvyxh8Dx/Z13AgVjR6jZ5gemyuhgntjWDqlPgoAjuGLy0F5NPoORdvlYEqhIqPprji
	+KfEklcO2iJiMXySRM9UVcHGv3pE4cH+fppKahnv8hCiwLSg42o5GmX4efOZewC9Hr5AOUm0IKi
	APcrfk07JXDeHC394UMMjTXlvpQA7HeSrKZEKEmV3/4pCBf5B+azOVBaQQ+B1JsZCllYojmgzql
	x8F1m/3zCt8qFX20SpM+CDQ66q9rbqXYiWOhG8wZNl/dhfn/TO1hbDfsWWKmZua4rH9EtcrwgUE
	xZaD4lKbt2+ea9XERyuQYb2UpgOZ1Tkwh46nh2C5vP1qX4DyHOIcF2cCiJG9VTsroRXQ2A2hVrN
	U9pRRg==
X-Received: by 2002:a05:690c:6913:b0:7a6:1a8d:3040 with SMTP id 00721157ae682-7af72145df7mr80508357b3.51.1775922431847;
        Sat, 11 Apr 2026 08:47:11 -0700 (PDT)
Received: from localhost.localdomain (71-208-10-104.ftmy.qwest.net. [71.208.10.104])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400ed949sm30204797b3.49.2026.04.11.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:47:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][whinlatter][PATCH] php: upgrade 8.4.19 -> 8.4.20
Date: Sat, 11 Apr 2026 11:46:58 -0400
Message-ID: <20260411154658.1076421-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 15:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126258

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.20

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.19.bb => php_8.4.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.19.bb => php_8.4.20.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.19.bb b/meta-oe/recipes-devtools/php/php_8.4.20.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.19.bb
rename to meta-oe/recipes-devtools/php/php_8.4.20.bb
index 4a5a5fa5b8..feed807359 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.19.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.20.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "bceb7798ed37b442fe523ae7ef345ccc2231db0b022d30735c2e378d3254a0d4"
+SRC_URI[sha256sum] = "ce25d2610a5f9522ac8f53fbb7b8280b5c021991e9bd9137068c9c629d9ffb56"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


