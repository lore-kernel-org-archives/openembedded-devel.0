Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CB0E7FDEE
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1619.1770066852861676112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOycs4/D;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3455851f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066851; x=1770671651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G88OSTPm5WMvySIoPjgzRmbOKraEJ1gB4yhNgN2ZDvo=;
        b=mOycs4/D/6mn05TU5JZSBsWYML+FS1csdkx1S1Aa0+h9pLrIkFwS+LPN/hbR9mOWlP
         OyC+63337mNB31mZsY2LxTerCKtxS4ggdA46N77a4Z1o3Oamtj4+BLihGoVdvsmlRP96
         FAi6lP0T7dbQfkGbSllDapmbadqruqjUjy7ZitFjTRHdEeEFzhWGbM0HSw/GWxPdj3kB
         olBglBVYrOUpV507NOot6AFHGnxsGRANrFwNTPZNit9DrQomzw6UXrTbjy++f+bSjibz
         79m+5R70RKm3P19fuPg6UxHrHjqKBq6WAjVjjmY4m4vxybw7T83uQSimg8dZSt09QwbN
         Ihsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066851; x=1770671651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G88OSTPm5WMvySIoPjgzRmbOKraEJ1gB4yhNgN2ZDvo=;
        b=IOWX3M9HfvXrhmneW6xM2wUyKVXVyA6MfRUdSoChmANX3q2pFNtP1wW6csTXuV/quu
         nEtkeuzhcJYcB2tzEo65KLU6ghbZzscL6v1blK7HdMgAhDoQjsGW6sGRskNPCyXrSy2F
         nRwlUy6ElKNkDyIyMqVQx1GCPuPDOvdwRTJy6QtwcRGusz7Bpgvh6KKr2zl06DSJNxZi
         eyuVhl0RoYcKr3tx6RVQYlsZVvGLYVRFxfb1Gf6SxIDiTT2C9112ioTuWgx1Zpa5yqTJ
         7mNIhqRAkG5ZZf+QhwPKmMlCaFosw9Wv9iRU81iwv+XKS2x44YmFk/fSN5llVLI8mxnR
         M3BA==
X-Gm-Message-State: AOJu0YzWKoRZ8YSq08kZRAtyP2UJLIMwDn9Ww6ADNWwCv/2ZZjyTeQUh
	wGCS02Opn87Z6VSfIoci5jXZ/bR/UqyGRarcxvqUjwRHQA4euPdBuw0SMOrNrQ==
X-Gm-Gg: AZuq6aLUSQvBOvzoPnzNPhv7Sx2TR3gXlrT7dtBX9ofqkEEOMMfZ9pM7DKkacNsyvYQ
	rlQ8r1iiAxLqkLYco707iG2TLBx38i+7RSjFrYcWuPtXw6doXVp991pLIJy/jGqswOlnCICHpqi
	Kr/sXAWChGjULMswVDBD9X7XV50VHiRFEjtNOAM2aSDS9wnnPqGMOeVwG3uaunWnLPchS28Cfsq
	XikMbcMM8BK4QSZBdfydsy1uW1qH2I/Msrip7iOkZ7Ome1aR84P8F6n6u3eMUXtpANsDjxioIQo
	lqteZcnjAFSyAStgxhZZVIvfQE7e+9XU4+mi4BTN4IqeJIwHEHlHnZa9vOU2QobBdAz3CAR7vH/
	no6FMnsvv0he/FrktFZX4x+RtfmUVlzxQwf7tpuTL3dMFIKyOI8woa6fodcerfHNTI7r5P6LsY2
	uCWTePOitkBIPakOf7gB8=
X-Received: by 2002:a5d:5a44:0:b0:435:faa5:c154 with SMTP id ffacd0b85a97d-435faa5c1f3mr11126440f8f.37.1770066851071;
        Mon, 02 Feb 2026 13:14:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1 -> 22.22.0
Date: Mon,  2 Feb 2026 22:13:59 +0100
Message-ID: <20260202211401.1287664-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124086

From: Jason Schonberg <schonm@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

