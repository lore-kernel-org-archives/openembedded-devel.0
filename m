Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D218DCFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 18:47:01 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18.1763923613949669028
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 10:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4iBqBc3;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63fc72db706so2945358d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 10:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763923613; x=1764528413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9+WK1qS0JjMTtILDUoGYIrsF41uYfiuPYJiqYNMSdQ=;
        b=F4iBqBc3y4pJAw/GH8yzL2SXtwJwOEJlfsaA18x4XF9YoVG8RFBcQT2xUXvXSLn8GK
         MzH3LdyVq4RxcfjzDjg6JMr/S8S8bU2Fqpq2EIn/ZPLD9G2m5sGT6LjXljKajVyd2qRI
         Jbr2iOhVtsqZx9yftQ/KlmzcAZcMXM5Yi01f7OQJ7TkiwiEFv0fFoPPUtGV0f9g/3H0I
         qVLlm9xDp25YD8qtWfkCU6sZ/7yIbc6c4R+w4dcVfsAz4x1dhjy08eDbT4mLpAECUZ5L
         8jQQUqW9WOG08EZkh8HPx92FBFtoB5l8ODvqcpiFqjZr38CGRbOzUiN3gxUTjaHytQOj
         lB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763923613; x=1764528413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9+WK1qS0JjMTtILDUoGYIrsF41uYfiuPYJiqYNMSdQ=;
        b=gz8wFR4AbFoPT6WmrGAZEh9UVIk2IQUs+7pGnCSVtxqvAxmQZCkT7DCj/CuGDPlfuf
         xNXnzGqXRlNijz6Vio7XP0k4Hetkdzts+x2wl7kwQG3pBXRoxtFjTtSNmGaua7lg/Z8R
         IboHZd51pK1gB4d+FVk+2JsyBsBsmXNtlADvJfv4X6w1AzHwtUq8xzL0ljcXXXkSnokN
         gLep369moL9z9RxrAIyoZs4raMDbRi8F4VAUVI1d4YkoEXtaDqOo8X+ky1DgGbCXl2rP
         OvftvJUPtGmWR5VT/77iAztFzcSYzt9h/4qKwsDnDTZJCA4mE2fjIpaaBEb6vvR/f00g
         dTWg==
X-Gm-Message-State: AOJu0YxNmoZNbvJae/hI66vJk1hxndIjBEj/eylTm/PL0kqNoUSTpEtt
	fKKFQnsa7rpC4iQ9t6OudKA659nR1NO8jUMWzT4SiI4UnB+i5V0i4ffOzIxkv2m/
X-Gm-Gg: ASbGnctdzXKx3e3CEY6cQb13PHTyKct/FtiWOGwDIP7GzfpgrzjLEpxgyLyGTZzuyU8
	mYGQfIf1WKxmK7aymM9GlNCJ/Qq+BawselLtyh342AwM5sJJdrQt9BIS+9OoQPlREygNPCDOr5U
	S8LgtqRZnNNZYsU9xtq4H3bnVhw8LyA6+oKf+wT8oRY6vfVitVGTK8qTR3X9rzA933IjBVUwkuL
	hxuiF/V7cAEFqSEmOapDTK+N+GKWNAJG1gFDHTTUe/GVHLVunRC0vjF7nuj2sttrv/tXarNHo9n
	AtqpNrmzkmnaEt/rQTgPHTMeFAgLmRIzIHRPdhQ0u3hv10yNf92Jh6SBqMHMY1wQiuB4ZW/wJ36
	BaitejOPbIrQDInZ4IqDznwGtGk72bKFLLreIho3xjiyoJTRLl51EHltJsqTRAymPKWMZN7QAzU
	04qIlJCf+6GGh0GsYW8S7TFqGCxM3xJSFTvWH0Apwi47ewQ62cNmf0IpE=
X-Google-Smtp-Source: AGHT+IHGQDUK8rEGfN/a2w1PM49HFJ0OiyBgY28F0hyR4bXsPzMuDquWahuPn4XVWGGBaD/LAoM6zg==
X-Received: by 2002:a05:690e:1546:20b0:63f:c615:ca89 with SMTP id 956f58d0204a3-64302b241d3mr5463132d50.55.1763923612626;
        Sun, 23 Nov 2025 10:46:52 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-642f7178641sm4093200d50.12.2025.11.23.10.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 10:46:52 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.14 -> 8.4.15
Date: Sun, 23 Nov 2025 13:46:41 -0500
Message-ID: <20251123184641.3615-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 18:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122002

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.15

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.14.bb => php_8.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.14.bb => php_8.4.15.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.14.bb b/meta-oe/recipes-devtools/php/php_8.4.15.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.14.bb
rename to meta-oe/recipes-devtools/php/php_8.4.15.bb
index 086e7114fb..629eef0519 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.15.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "f2139ce4cb7a6c5643ee98caa34e5c32ba841c2ba293e34a3d0357faa84bb3e7"
+SRC_URI[sha256sum] = "b7155bdd498d60d63e4bc320dc224863976d31b5bd9339699726c961255a3197"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


