Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA1CD13D3
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27213.1762704047874314142
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejpKCuSm;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso117312f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704046; x=1763308846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztCnnSZDBnPgl7yiEw30fK+A+h2UHBz9TdWP23HuaUA=;
        b=ejpKCuSm0Qtwx37Cvf5Hi9kzfFQ5FrhC10e8VzZvtYQWm55Rd1BXVfLn7DJpPV6aQE
         W9AsfwnTCilG24Zfk5czU1KCNA8LAlu/cw9bh/qglklab4pqHEwNfZ+lQ8iM6ypcU2/v
         uvxXXLMa5L1r0sPK2uNn0n9UOA/8r2rkgEOI3o4wFzwrzsauil5+N6UL4jH8WG8NQZd6
         iP1C/lxn7vbaApy8XHy/EqHaTDtzSaKQM4zUg32FUgtUtz79jZe00CH8r4J9F3PfaMDP
         JRMo5GcnG8uIs5JCERlZpiGAamFptHuERST4aHzrPqXyZCiubwyJeVhCYDAt3oIukcTz
         ngNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704046; x=1763308846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ztCnnSZDBnPgl7yiEw30fK+A+h2UHBz9TdWP23HuaUA=;
        b=azKZwLw0/ggIyv8Hc2AZncgluEKfpodbdjwSBKdGant38lUKppHtuuTb7WaXwPyWcS
         eYM4ld+ejyneD2cVvbUMxgfUcof8H75ehV8bmHMEvhVbhyMjFqeKyN/wEfabuVZ4fPdo
         qfEceP+rV6z8BFEVltXQCYlqC2qqIebvcFOtizyXceC9dzFew1bnpDmvfkBNzL8tf6x2
         tlMpZVfgGpMmGWnjp2Gq66sAfeyx/Bs3MxwHw3jacMirzoC1vdNDJtnDNyMSCdadB6w/
         B1+nLQ53voy9Z6TT/s4AbR8GvI1W1AlvMRVq12yXHmJ1+EgNhqhoc8dkxojL745VyObl
         pL7A==
X-Gm-Message-State: AOJu0Yz8McmQeP7s2y1lajqqu7Pv2gFZZvAJsggy374uN/jg6yB7XraS
	rNKxTmKdd3eAIvsPKV6TZoASm0DnbhC48UAgroFb74usw47nc8ayoorcl4QzNii2
X-Gm-Gg: ASbGnct5OCDyvxj6P8CG+WF4H+T8G5p24d0zi8qrdzPFSCI87ZVLfgsfwNAHTxKUoop
	e4BQHdf3O1xs7U0mgPkafwt7NIt6ssarAQ9/m/GgVY1BiK19b9AODkDwg3dLE4BJEEfkzcBjLkU
	T7/n6obHj5i/Lq5eGZoSbqo78eZYwHZaomF9v9LCETauz9PLYFWvaK1fkkxZRehu6etyNkYFjSf
	vX6f4CdRqYvLibCofmmQk9xm/6zdXMSduzfe5r9EZbtH29jVLuDILa2cVhrzQcM4aMRYWwPru7n
	ByAdHmvm1IEQX5LfmgDX9aSD+tMYoGdASUohe1wbv0prR/Ydk9Y6ne6BA3pp7gmpay1H2rFqm4L
	pvF6QYymPKaKuV+BB4dGmtKXDML7hn4BlGkCprIz3y7sdnyROHAo/w8OrjikMv+VgK2iiGLT2DK
	6TmzcEHhh1
X-Google-Smtp-Source: AGHT+IG8QppccV4ltdUSqKG3rDByUs39oEyasiCbB7lxB35S7BgtOZlCunfgCW+hm5FUzGEjOww7QQ==
X-Received: by 2002:a05:6000:4028:b0:42b:3272:c4d6 with SMTP id ffacd0b85a97d-42b3272cb6fmr2249621f8f.34.1762704046150;
        Sun, 09 Nov 2025 08:00:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 21/27] python3-behave: update SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:13 +0100
Message-ID: <20251109160020.2522353-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121437

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index da4f3047f9..a57f14801f 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 
 PV .= "+git${SRCREV}"
 SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
-SRC_URI += "git://github.com/behave/behave;branch=master;protocol=https"
+SRC_URI += "git://github.com/behave/behave;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 

