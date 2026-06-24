Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A056CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 06:20:32 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1061.1782282025710300571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 23:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=klJVy+Y5;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7fffb090ddfso6943877b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282025; x=1782886825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bfd64ClDJQz5GJAbGfrDeW6A/XJKvSeFrQgfbhsZKSg=;
        b=klJVy+Y5lhvc+HwrwgPRcmT921d6NVPoN58JcdbiOmlvgTxTXuzS+4JfIojPgIIpCE
         UD9XJ6BkBAe9YdIVJ6a6/f9NwtlwbsLh/WsiSAMq2kzulIoEK8QRsy9AyZkvUr1o3KWS
         KV4iYc5ogH12iaFPqCtoxTe49Njt+RMrpIT/aINsDaj24LbpPvO9S1wxKiOWSp4gsvqv
         baEz/+1Crdi9KaLNXGVYWghkM1C0Wbw70JntmPhrVrl0ZZpfPc7DylZ/gBJ9mCgLaRrT
         gn+R2eslYVSrQ2fPa/OOk9OL9wv09x8lksAw2UqffKNe0TXM9Z3tMCg2c4SWRBkYjmvC
         C3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282025; x=1782886825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bfd64ClDJQz5GJAbGfrDeW6A/XJKvSeFrQgfbhsZKSg=;
        b=FqEyzCEexQe1Xf+rbp13jxmXdSxEdxEveYDT+R08NagkglqonTatFxhD1YebcI7PDa
         AjKdjTDuS3HwQMWaGOvDmmSRFpseN5r1GVbN8WBRwHuWyRoNY9I0EMBNGJ8j4vNBAAYz
         GrsAprHkjECdtWYdqS9SBh+C7XFEgLgEnSq7wxxG5IfYikojRwWBSKN0ZePbDZ3kx8O4
         /HVjAHSOdaMat+kaAkIGQErUf2fblTJZW3aGOErmNev1Bpli1RimMHtFe71vOkVnlAXc
         AKYbAU4ytUSAFKiRjBUjJjM0Sc4ptjGEo4D7FIt1ZQUAgDLIQiMlNTw+mtMDiqDMzuQV
         Pe4Q==
X-Gm-Message-State: AOJu0YyWs1+TaR/C5VfrZfyQKaMUNJj68KQnlJCgaguntzvj6fzWRH8h
	uaJKgFeTypc+lx549oIc0q8aqDNSjhdrea9A0Ehh4JSFJodwtzlMj3ql5Crl0ypc
X-Gm-Gg: AfdE7ckBJ3FtR6mbA0Fk1s1WEYX15+0fii8KVl2Bw7H2sZyWjYBh+Fio8KrbOizecnA
	JrYPX7SA9p8PG07pWvm1f28BDvl+VMig3f2rCTAzxICpAL9V48P5RajDyjvWNut8W8rqUVmR8WC
	lt5HMZjx6WN5XPGoBp6mi2g/s+CZxA2Rs9EwDUoSs7qJhi4XxUYCv16uaXj+Az/kERskZHzL3lo
	SNSRcGJJ/GTPcsRHk0WeNkqR3PlA3qUGkamW7DB8mCL26uuuLUP+BbiJ4T8J9MP36wAn1AliYOw
	6RY5oUaMrfUgVG8stlpAhdc+wTDxsTmIOHHnZ4bCGOwfwDcDO4xLYl0a/dTShuHRnNReZuqXzQ2
	135QjAIRy1j5CTrHcVXqkHxaMW32QU9kKEaxVoPs79CkUrahhQ+KK5FBlpi5OOaL15H49TMdB1S
	3zib6Y8Nj9XbydBZonQag2qp+27wG65SePbp97JGGsg9ZCzI7qASXWr21ATex5lTnPKNetFekFc
	ILva7m5GZRiI7B+do5i9B4j7zd6ig+xLfvBQByt
X-Received: by 2002:a05:690c:9e:b0:7bd:7a1c:9ae8 with SMTP id 00721157ae682-80673dca90fmr62894277b3.26.1782282024429;
        Tue, 23 Jun 2026 23:20:24 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf6432dsm54264157b3.14.2026.06.23.23.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:20:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.17.0 -> 24.18.0
Date: Wed, 24 Jun 2026 02:20:05 -0400
Message-ID: <20260624062005.950610-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 06:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127705

License-Update: whitespace changes - https://github.com/nodejs/node/commit/4627bcfd82bdaa2a56bfa4d8874b53d15a9f3037

Changelog: https://github.com/nodejs/node/releases/tag/v24.18.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_24.17.bb => nodejs-oe-cache-native_24.18.bb} | 0
 .../nodejs/{nodejs_24.17.0.bb => nodejs_24.18.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.17 => nodejs-oe-cache-24.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.17.bb => nodejs-oe-cache-native_24.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.17.0.bb => nodejs_24.18.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.17/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.17/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
index fc79ce9404..c411c115fd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0 & BlueOak-1.0.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f816753e8bdfe4576cb87159a0cd60c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76c62fa4c329393e905512b36f8378b7"
 FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-24:"
 
 CVE_PRODUCT = "nodejs node.js"
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "a7ab562ed2369a29c68b72fa00e3103bcdfe37063dff799c6acc8e404e275fcd"
+SRC_URI[sha256sum] = "e94afde24db08e0c564ee7110a2d5aab51ee0059382c9fd8233c54eec47b28f9"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


