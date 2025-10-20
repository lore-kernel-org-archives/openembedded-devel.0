Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEB4CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 18:00:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4111.1760983227487524093
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 11:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPwHSnMO;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so2286185e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983226; x=1761588026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQhzJ95U+ng+Zz/ePTYfkDRnjL7Y1Qa8T14rCllZ5W0=;
        b=iPwHSnMOrzrl4v7/uKBoOlDBDm7MVojMGjy5iwyOz+XB/9BoqC1dGEFFS/y9hQFZ+3
         J9yTiVEyksIiMEKJFWd9n0OMWOVsAxsg2KkNJTMi/7fnRFn8BS3T5YPK/7Kmv7gNRXsA
         83NGfRqAulMzmqf49cNB4ylCeISCaf1R6JdtOHoXX7Ds8hkq7fGMbLhRCqEgRVEJyg4l
         HsPhYLLXgdPeTQWmbPlkrtYF8vzDhTBSvfSerLOnkU2vTnsJ2w0lI86DU9LVTzdaY7eW
         r1nzte1979cg6O5MBfF6W3XBFJ4v+vUZP4m3glLfEsLFCePzam4ck1nomP7F2ycAXpj7
         yjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983226; x=1761588026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQhzJ95U+ng+Zz/ePTYfkDRnjL7Y1Qa8T14rCllZ5W0=;
        b=JzcP/hnF3q9Z2I0izpZ7ZY7cmdObPW9RwfeSfdsQ3eNH4SuqHpm/ckHhp0jZIEA6/Q
         3qn2ieidBFbu6LWQhMKBLZX9VSE0I7PAA8u3AjSuRv0HOWslzIqwzl+jlre4sbWjTGia
         Bt5rQwWSAe987q/KEWf2nzYyaETKpPxqSOZ/ZwSlDK6gVcDsOeBMVYF3C831Zd1XMz6K
         iILSq0mzLnNp1DAhbCnq37xdhkqDBFoWwO5fT7Syb7R5jkLR1EjerqJZTJJ81R8kz35s
         G6Ur82YMrUU0AoBcy/+etaOzSE2X4SAZOmyO043XV1XLNszpFkANEZwUD3zwTgWRzWu5
         FiGw==
X-Gm-Message-State: AOJu0Yxyt62rflp9t0NgfzAx8afU4bTIK+PN30Lb8c9E1sSdA9pwCNkn
	L8cD9XElZNN0i6E1eVNNlWJ/ET0lkh7MJZvcvaj5/dNs0tplOlpHuCPPjnbyvg==
X-Gm-Gg: ASbGnct72yGHJgJkc3I6mMlvAqEiOt0m5BVYVJDvUg5okx4cRytJshOtqMzxy7MMHTM
	swskG/6G0HoW/CQnWa0hE5saD4L/Clu4HHBPIhkjVNn9VZHqdMDbEDQvo61ro6GPeU4QxDy2lZL
	McgnDXdtAqmkEAeGDGQciXojoCuXDaYCbQKHkKvwBtzakdifCoFptHKgA4nkPwYVntVRFTQ2F+u
	vALGBOqYPTyK6AGlXmfCna/DFbnZ1wtNgCnnO1/X5ecDwzHEHJljwoFO3m65PEoGA1Tg/533dut
	jH3IOyGc4kGuQ2JZNCVOMDPFjnQ+HGWMwKYprshG+bhahdr427/jzDJETWuXwZ+WHUpmESQAQdK
	es/osmVxzGWiJrDmlHvDygM/cPsUsEX8gPPEuWrQVYg5v7Mu1MEr45veHiDueIXurk+EEdA6wNj
	rdlo7J2TZc
X-Google-Smtp-Source: AGHT+IFPkGwcATfGB8Rzqj3DoQC/6Ac62dy/FxOnLc8RX3RouCLeN5wBpBNSTvpMxu+nt2Zcp+Fhqg==
X-Received: by 2002:a05:600c:871a:b0:46f:b43a:aeef with SMTP id 5b1f17b1804b1-4711791d923mr84388045e9.38.1760983225592;
        Mon, 20 Oct 2025 11:00:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00cdf6csm16342024f8f.43.2025.10.20.11.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and CC
Date: Mon, 20 Oct 2025 20:00:22 +0200
Message-ID: <20251020180022.3398560-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020180022.3398560-1-skandigraun@gmail.com>
References: <20251020180022.3398560-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 18:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120819

The project's readme indicates that some parts of the code is covered
by Apache and CC licenses - add them to the RECIPE accordingly.

Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index c297de053d..f2dc5d9b46 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -6,8 +6,13 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & Apache-2.0 & CC-BY-SA-4.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
+                    file://docs/licenses/COPYING.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://docs/licenses/COPYING.CC-BY-SA-4.0;md5=b296faaab9c17d5874fd17967df54736 \
+                    file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception;md5=32107dd283b1dfeb66c9b3e6be312326 \
+                    file://docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception;md5=1960515788100ce5f9c98ea78a65dc52 \
+                    file://README.licensing;md5=45c1ba157f18d08991819f41f56d72e9"
 
 DEPENDS = " \
     json-c \

