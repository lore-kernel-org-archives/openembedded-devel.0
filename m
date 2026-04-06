Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EF2EF4EDE
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53491.1775477008797876127
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q1KRXPuV;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso2382347f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477007; x=1776081807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElSHwN4geY7E0XPJPBKiGUVmv5LmvxPsuwF3XVLkLK0=;
        b=q1KRXPuVhMnh/IXpVb5EH9lGf2szRPeFDYBQ/LzQgjrjixlYq6yY+N7dJNz7D3th9L
         3LK8GekoQcBf2R14N2DvPdAF4qergKLqJyCPyw00FTqXH0+RZX6SWNgiMXICzC3jznZo
         4mOjB7gDRoLTsigyI6cKK+DSGmHZjNRwh7x7nEz6eZQxL7KlYBneVWYDGWKJWm2qEtVq
         iwu6XUfac+iTCE9vXVoHwl0vtUILBpp8KIxWRlQHCK16u8QDYfMHEhNKkcBagZvEFvY5
         /5PMd9QGma3EEnPagNV0rBrYZY38d54o9C7F9VjP+oqhn8NTubrBMQ3AuYbaGBKM7KEx
         whvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477007; x=1776081807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElSHwN4geY7E0XPJPBKiGUVmv5LmvxPsuwF3XVLkLK0=;
        b=OffhD8GGY42ZrkzgZvIShP4AlSTV/JHx/J2MCsAdSiCigCdcd6WmCVZQPj6FT076WW
         gVow0dpkPCefwxd3+ykACsrdr84HZxBLWKwskcbRvJTl3B/ieHBidfy5iHZSuwDfh8k2
         NIvi4MeVZp0dWd5DafTM7BDj7y/PjxP103hLrhMx0Szu9/6nu/to2FE/0g5E6BzSm0xX
         wS3sjRlBOZy6XamAt+aagzmSf2QZsXDVTcyWfe9uSUDhick7sq4u8EG0asa9c9XpIy77
         fr+ZB+7Ss7VlaNhseC2X8b4qT3xmOrqQ5n1wrpJ5ag0BMLBaq1NxCIJrshfB8T+ruQ50
         YNEQ==
X-Gm-Message-State: AOJu0YzUnDZtTvteARQZ+6W6E3YnpsLfili6pZ3V3RskhkHQk6hLmOvE
	hjjGlxyGsRO7ggObJoLYhZj15yo8HS7Kv9ZFh6Bes+7qSdv9zo1sLD5wD75ZDw==
X-Gm-Gg: AeBDieuy1PN5SCf0MiKYM2+zRTY8aYrjNi3BspYBxNsyBWhuL88Bjbk7wL2tSGsCtDs
	+92DJdzt9x5fXNHwa5LZOc2425u978fgKibVUhvhGebbSAJ2Hid7psD4C6ZS0t3mA3pevQXOVLH
	XOpx5Mr4pPdyY0TEotPOHRYHh8PnmY7RTr946X9eyPr5FoTZdgzvO5b8Bp3vNo+DP76pCTpf7US
	g3IZnvZcLJZlMWO2jiYBNr4PyDfWNRu6HNAye/JIxajfxxZR0RT/5px19mUrJTcR1kINHJz7B6s
	0aHh26CZ0vQsd4Xa2CpTMTMbUJ+OO1uvnacCgPVsq+Ah3OQq9rIakgMDNLPVrHIiXXr8iSlukPC
	ak3vZkPmtaCi2g2hfiwnNRoUtVTckVBczSqGrSR6BMRXn1MLI9NuhSDCvfeJYNwjCse/WLHxI5k
	D3lwwRfTUPZczhfqSJhIfa
X-Received: by 2002:a5d:5f91:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-43d292c2a28mr18526509f8f.20.1775477007072;
        Mon, 06 Apr 2026 05:03:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/7] leancrypto: upgrade 1.7.0 -> 1.7.1
Date: Mon,  6 Apr 2026 14:03:13 +0200
Message-ID: <20260406120314.3514982-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126043

Contains fix for CVE-2026-34610 (which is however tracked without
a version by NVD, so it is marked as patched explicitly)

Changelog:
- Offer a means to select the AES-C constant time / S-Box
  implementation via lc_init API
- use the AES-C constant time implementation by default - it is
  about 3 times slower than the AES-C S-Box implementation, but
  more secure. As the leancrypto library is about secure by default,
  the CT implementation is just right. Furthermore, if a caller
  wants to have the faster AES-C S-Box, he can call
  lc_init(LC_INIT_AES_SBOX) at the beginning.
- X.509: fix security issue (CVE-2026-34610)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../leancrypto/{leancrypto_1.7.0.bb => leancrypto_1.7.1.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/leancrypto/{leancrypto_1.7.0.bb => leancrypto_1.7.1.bb} (95%)

diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb
similarity index 95%
rename from meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb
rename to meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb
index 7c9187ab94..9e7883ad3c 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.1.bb
@@ -14,11 +14,12 @@ SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            "
-# SRCREV tagged v1.7.0
-SRCREV = "e60fba94e8cabf1661a1da488b78b84a4fba56e9"
+SRCREV = "e7fa8c87a46c5787174c18fac385aa08eecdedd1"
 
 inherit pkgconfig meson
 
+CVE_STATUS[CVE-2026-34610] = "fixed-version: fixed since v1.7.1"
+
 EXTRA_OEMESON = "-Dstrip=false"
 TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 

