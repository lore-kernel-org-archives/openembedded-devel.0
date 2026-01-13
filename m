Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCCAD2F356
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:07:44 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65883.1768327655167838789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8yilFJQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc4425b6bso77715127b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768327654; x=1768932454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5KRO40XyecGrgru2rMDj9Wo8n26YAG3RzmwuUawRqno=;
        b=g8yilFJQNFaHZxC63osfZcmRw+ItzKai2LRf7EcSliMGPYSrrWVhLTrZ2BysDUD7TX
         GFTGPAtDdweSAgVJ/G+lQ3Q3QiNZ6AkcyoMZ100HoXRr6nh+A0j19Bb5cLmSuhNsJRnj
         RGi/hkWvUZrdv0nhieT6lwx1j6QNDvnjIe7tzeDrp12dvgm7ynIyjvtG4ezbqCq4tuPF
         f2E9MLtbxzaPdFy9UvbDBrsOn3ye1Kw5W3wkUE2K+TfrNLttiQauT6a831eRRJSvhr02
         5XZ/jrMPDsYzuKd1GUAgmf6mfxhOyMFxRKviLnb+wrs8wkVfUg+ptqwcSOZmWL5n+uxd
         tYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327654; x=1768932454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KRO40XyecGrgru2rMDj9Wo8n26YAG3RzmwuUawRqno=;
        b=gFZZwB7mXkGk7ozvn6RKIygSj0jaap3/IHnPXXdgvCn/v+t93DCN83HZN5SJOnibVD
         aSDAtGhAvIGQ7erwzmSy9Q+0vR9yWa6DYJ6UK9GjZkGerBQDaBVCYKh8Oex1cSJGaMUx
         8HrgEI+vTM37kTnj2cxfI/GkuMEcRrs1wos9iYKo2FmstAVFyELYHcN2Lsqa3bZvJXIR
         OdmD3jqb69U/bEFP7pllNMBvZTYHC4NIVcl7QGkdqswqYGK2meMaI72b/Gdwt5fKxgwt
         VffBf300IOJJkPGzsWCA9O6OXEDsXvIVpKqiMYHlEjSjEH3NACnVIAXk+1nBv14LJDVa
         48Iw==
X-Gm-Message-State: AOJu0YxB34KFDMWe+zz4nxGSAVf9HMSsJm9FqXuO5wI8njTXxunusFzZ
	NBKNPDGfsrZmvWDYCXp5iwLGxbqRQ4+LUfTN5r8mXzntMlWjMR1vB9hES0QJfvhC
X-Gm-Gg: AY/fxX4WlHmvttTmi//o8+gsVtFWPtjEKSOayBfneR3vwWJbxiF2srvDfvDv0aJ4kX5
	OUejNGlEnir8303pQbPbiDhaSQk3WA54J52dfmwBtElWXpHbIuYDtZdLG2kLdW0M+hdrlNRdu5j
	VQPW9mjDx4iAJNc9e4yMqYDXKfZRt3/aQl83t4mWu2l292pG1gw0RgvcxqjRnJ3V7tUnJa/4kNe
	11wsh6QjUt3JN6yqn1WGvvbzGbR0LzfNg1zNBb1jmhtQvhVEKnoa1vAdQ5tMXIrAQVz7R7g3Xxp
	zt7Z9WQV2hF1zsasKh8c16ncCCUXisq+L4NehKDfjh1xW3aBJU3qISmkTLIA6UnXkpZpYmYLgfs
	Tvd3gziOqYGTy7zknPEuBH82V2IqME7vy41Tv0eo6cnW0JUQUzJfUgTxkXiA50EF5R2cMN5hZN7
	Wbb+tFHrUqv7VBtfhPuqp67dfgo35CkmNXJXimYhL/cnpCinbhtQUHtx5GJv9edFBI3D8jS0krA
	jdrz9ilSyWJu+BwTvxKRXanX6RUfo/1TdOCy1NwzJ/VwHt7EwzZ5H3qRFmZJ2b3zg==
X-Google-Smtp-Source: AGHT+IExV4ClaBDG+xMPnV3IUsUJtSUGkgAA4BM29lImZnJCwaXoDKg4KGhcfA5o3NFi17VkmrWJQg==
X-Received: by 2002:a05:690c:4441:b0:78f:ca4f:83b4 with SMTP id 00721157ae682-790b56e05aemr196464237b3.22.1768327653707;
        Tue, 13 Jan 2026 10:07:33 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa67824esm81598107b3.27.2026.01.13.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:07:33 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.21.1 -> 22.22.0
Date: Tue, 13 Jan 2026 13:07:06 -0500
Message-ID: <20260113180706.114778-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123438

This is the December 2025 security release that the nodejs team released
January 13, 2026.

  3 high severity issues.
  4 medium severity issues.
  1 low severity issue.

High priority fixes:
  CVE-2025-55131
  CVE-2025-55130
  CVE-2025-59465

Medium priority fixes:
  CVE-2025-59466
  CVE-2025-59464
  CVE-2026-21636 *
  CVE-2026-21637

Low priority fixes:
  CVE-2025-55132

* note that this medium priority CVE only effects Nodejs v25.

https://nodejs.org/en/blog/vulnerability/december-2025-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} | 0
 .../nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 => nodejs-oe-cache-22.22}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index ccaf9f7bb2..443cdc430d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31c30b1680ad6ded6a"
+SRC_URI[sha256sum] = "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


