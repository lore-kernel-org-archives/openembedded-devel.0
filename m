Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A347CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:52:52 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.4091.1758649964758451682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aSI6J/6z;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso7052553a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649963; x=1759254763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKN/QFH+scNVB4+qtHoj0y8vshUdAGHrSTVxuksQHBY=;
        b=aSI6J/6zoL1rpCCd+kq0TK1c8e6ZqSrWqVn/OiAPUERBhOJdn2oJTPUxjtL7cgwtzu
         WLX3P9a9AJdGV4vmWgN8jR3BC9yRAKTMM0tZBagZ8K26b7VsmhRE8v8GZDz5yQipm96Z
         gye8BtBBSkLBqXqO7zReHC1UVR8sgbZQ6XveSf5PI99pvmmr5ZL1KA5aGhxPJ9IJAup1
         U6SPS1+bOIHf22zzC7o5TF9khcul0XjsIG8o6H63rVDX74HmRbC7DCoC1MxdufA19Ure
         KU/psnAm2UzkIdetHIDNRrxD4gaC7RoS/GJOPX2rgFq1FWldbzt123etqjURCLkdwLvA
         sbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649963; x=1759254763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKN/QFH+scNVB4+qtHoj0y8vshUdAGHrSTVxuksQHBY=;
        b=WlI8CULVKaJwzyRLgm47z6awt0hXjZ95sMHS30SyXmW18NkGyK245lAZGPFT7Q5TYi
         pOl6SjWS2N9H3G9DJq/1q7buhg6UWq2J7Vfawrenn9VFKbD/iSggfH1dPOGLwRhAlHWf
         aASX7Ebu0L6xTtD8UyYh16+OGHZlp2CYU1nC7dAaN+TqgC/jFI+4jUM/wjStk6UJOgOc
         TMOLLzcCCMUL6Js+fTLXSM4b3jXmOT8q9IlIGKdkbC7cTkZGp9eKtCrOBMelAriH5Gc/
         v4bL4deP94M49tT+laSYCDomqnUu7zg8xkn49NDiuSNNrxKPFMMdyW6Eq/cLr1GSXSbA
         Ir4Q==
X-Gm-Message-State: AOJu0YyR+3rVcppPXuNnotSB3iNe+BhnXEZd582JlhhnQ/GxN26nbWcg
	e7SKvE9n48k/sFruiSPixA1dwtofCycpsANX73SXFbgY/R2reag99aSFV9rb+c2l
X-Gm-Gg: ASbGnctqVfae/MA2yqpmadXeSYFZWOxn2lVRrFQrgu4PC3LU9bee90qYCOmISwa/lec
	5vUsP3qOtWY8M0hTMqQObtQRoAG+yK4MlO5z5DJnLNdBWtFzNBSBkyx66xXs1QSVGA1wA1s4pqF
	ilNSm0H7a24Bw9Jx3XkohTFoy8kajbLU2jq6RmrOosR9NQWvyt0ia8i4g1PLVjURhBv3kKBEOdt
	1jhFlA1FxQq5qjMBxQ957LBHoYmUnwDzKXgobsCQiPTI+7tWXWZiq5evcNqFPESdPyni4ryh8e0
	m0Bt31MFLshFAn8Yx+NP1leUI7aHnUm5hEkP/hmjC892Dd9n40zo/XIh8xzusrdcss8z/omOXD5
	jAupR5vq1WeafWM7ojm5J
X-Google-Smtp-Source: AGHT+IGkeYdzo2Q+SQ1jwMwFQiriSaNb4SHyJi9XVSGqKMpAsfEdOS0ACwy+OJuVQfSW+ZrF/yakkQ==
X-Received: by 2002:a17:906:6a13:b0:b2b:c145:ab9a with SMTP id a640c23a62f3a-b302bd12accmr331401666b.60.1758649962950;
        Tue, 23 Sep 2025 10:52:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a660738dcsm704959166b.84.2025.09.23.10.52.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:52:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] tokyocabinet: fix license
Date: Tue, 23 Sep 2025 19:52:41 +0200
Message-ID: <20250923175241.2293216-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923175241.2293216-1-skandigraun@gmail.com>
References: <20250923175241.2293216-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119728

The application is distributed under the LGPL license, not GPL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 9e91eff4b1..335b71065b 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -12,7 +12,7 @@ Records are organized in hash table, B+ tree, or fixed-length array."
 
 HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \

