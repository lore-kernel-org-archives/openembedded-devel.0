Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36081.1793161578649868562
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SjpgKPjP;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab98332238so318048a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161578; x=1793766378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v+kFaeUGo9KEUia8cHGBQBko9kHDBMiE6A9qBQY2Pg=;
        b=SjpgKPjPT0eX3PHV/IPLHJ5cfZ+c6D9oQIyj5Cl4WZFkXeqKI9Sn6qTTpqx48g2jN0
         6ehnN5lljJefY+vUXKHYq7dfZM7zT7QL0qTMGGgW3JqJA/LmS/XtR4u3uWgzS5EC/poi
         ZPRM4JdZWs2QmzkPLhHdDJgRYIMf1p/+zgTXUkNYu2R31x0dhIfhKxfSr7NtJMcFyWEU
         NUJDc+5cubdpHMYhiBFpjE4mjgvdnILpDiqTXTF23uT2xSvcNvmQcjFekzpmZaYkZX4i
         uXLeAEed8dcP/XlB0Svb0nBfbVOVmS5HalDU4ZN/yykYJHcmQSxvONIokVklKRPubWqe
         efLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161578; x=1793766378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v+kFaeUGo9KEUia8cHGBQBko9kHDBMiE6A9qBQY2Pg=;
        b=OlYHq2pUIz6kRWPhDqd46f8kAAsTqp9V/Kgys7qXZOo7lj6bwuoFnQ63628poPIO6E
         ft5HFPF0NKC3E5sm2qqxXji4aMQ5N4eFVQINns5Btmd+zMQyqVugn/ZwantCz0n/oz5s
         U+vt5yHP130A1tKVwv3UXUpkWT3nyH5VVQc3WTLz4vlkuY2ZgdQhIfCDu4bldianHXLP
         NElj+yNr16niVes29ePT+mTZ7/5rF576EytFtan6rCAagOss3fUU4KFq6PaOvMEN2WIn
         MLRWEmUefNLTLhpWuuNBiASOWK4cjM3KP640ksgFIbWdaFq5S2kx7+krFFHlZj+PViMV
         EBPA==
X-Gm-Message-State: AFq9FYL7o2+Aw8nB52i3+g+ZlBL9ii3hC/jnG4QNn5EKWU21SGyTqySV
	Bt+D3W3/sIx20kCi0c4TgbAxkfVNfj7ww14gH9TKm6Til4U76ZcmPiG8hWto/A==
X-Gm-Gg: AYBFou2/G1g6kOwkJCEw2Aaf9QimHSQpTswrGWWMUP48cgP48fzBIV7O26BlfILOYMB
	4spDog/S82d+jM6m7vf9k+GGM6oW+JfF6HyRTNEnwtqR0PPmu+7empo61Qm3zt8idO9SmH4XO7b
	WelU16kW7F8HB9FP0bELktCbmeoy73DZS4tKfiD5dpRiFmefXbpSBFzlMxaaw94+qxQrF+tN8zK
	9wtDJaR+qzGp3FlzSbEbE8KZYOa5476mttlHjrfkCXPnNuJL/pVbkgpcxOrGRkWTLq1aRkZNVOZ
	d6NbmJXAuOZwVEyjM6kGZQ76q8e9OMZiK0Mj/NPLdK47IgjaEQxduC2meJtO2ZiX9rLjGasVEVo
	G7wW3+yb/dvVcuNbUCHgRTnwH0fZ7l2+7zSyRoRuGw4oD+2jW5mIHYx0/P2fgbpDrFlVP6zpuLI
	QiSxxoAvvSphcu0Hr6Qz+WucBTw+cYMj3Bq1Ejyky8Zmi15OZm12o0pTxlTnPpAq7QsdjOgAWeh
	JWzPFftFOOnhnBtSoSNt8gwzGIJmNsYfF8LZ6TgrNhuQvcvu4ubz32dfw7dS37XC8Cry2FFoo8g
	oVid+QZ9ygBQImwt75Rm3jl2ZkOQ9evp4gLLgXdDs33cb6h1cnsX0BSJDpqp2Q==
X-Received: by 2002:a17:90b:4a07:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3ae57f630aemr930999a91.21.1793161578088;
        Tue, 27 Oct 2026 21:26:18 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 52/60] php: upgrade 8.5.11 -> 8.5.12
Date: Wed, 28 Oct 2026 17:23:50 +1300
Message-ID: <1e4a1a7cdc8e394fbee08de9992a33cda55fda55.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131604
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security update.  Fixes unauthenticated remote code execution.

CVE-2026-109618 CVE-2026-109619

Advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.5.12

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 898ac0ba1caaefb583cb3785c8c466360fc18f63)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes-devtools/php/php_8.5.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
index 831e926880..f9759cf7a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
+SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
 
 CVE_PRODUCT = "php:php php_group:php"
 
