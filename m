Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1908D29FB5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 19:15:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52124.1764875755187734180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 11:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3i0ilQp;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2e239ec0so882564f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764875753; x=1765480553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8SRMImV74yGLrCh6MfmxzWQkEX+uG7/AgY+CVqbN6w=;
        b=U3i0ilQprdT48O4KjErJV46IXS+5lYa1W57Yry02ugUI2GYbbuyVXmNRw0qm5QqBf6
         y20tR6tQUURur0VP8k1ehylpECiX0kTA7V0+4ylPimlJsLpyWxtsropskR+eIUJGwMkf
         xpyq72kcQK2K0jzskPvdXUee1olAtAi19aARhQJtVFn0jJ4J+BcGWHWpXoRRZZ9Hv0Wz
         8BXkex+ZtF6HbN0ne4gBQxOxI8FB2YjFG6I5p40+A8m/ojbzFY9znja7PCgVA3Z0VOZu
         b41yDPNeIC8N8A9UHPtwUK4M7D+cpe730roZ8BjwaCv9JvBbkh+0OebFsF38vSS1x8V8
         f6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764875753; x=1765480553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8SRMImV74yGLrCh6MfmxzWQkEX+uG7/AgY+CVqbN6w=;
        b=Qxz+tXPNWWNxtlg1xKsxIeEuG4fM7sfbjIb59e8RrQiaD0AJv16DLZSqfIL7uZNh7w
         RJryCTX6DQo+hHfaeWtMa1OlXtYD+uUQcAIUplhJw6OOipeSja0+xga0ku8t6dSzdi3l
         yMao1v0Q9Docki08ZU27dBDVNfPPTFGkvcDZcMngq+IS2o8HAeNC4JeQZu/0dcbsh23v
         uECDeeg7kMMhMx+GltO4UERo/cVdHbxw2hh+9F8oD1ocbr4XrpvjlcxPa9p/1X13Xetr
         RT43pK6cDif/qrklp8JJ0lc+p3Sof6KSChY6OQMcdq6iCkDF7TPGmf9bYGmnRyIYAOOY
         GaOQ==
X-Gm-Message-State: AOJu0YyZEi4nwJmhJGhNz/awIVYmhpbN69mAHLnP6nGpMdgTYABIX5Mw
	E+WiRiSCjeAp/X9w76PeUQLfrF9KsFj/O8ZFtYobTlrYddW2IRY9kesnUliQ8g==
X-Gm-Gg: ASbGncuisXJ7exJGogt7/2rHm8gwBl+3UtiB1pnleEoNDSDzwM0ApPC8vItlS/A85qj
	UoqUKleQyzmCc8ZqIbiovn1jyVqp8VPitjHL68ZwJJsc0hh71TgOSzMn/P16gTShFAoD14aqcZt
	DSDekTgroRVXI9Th6nbLb4N3ojJvIHmX2xy11kO8KqrEejgsCgAFocmvD8otPSXSwJHzrbq86bF
	q53ImCtkk8KQZBA10lrNraDcpYhZcuOdeTSNtoIXC9w26N5GfHZ4AAMIZ2sFaIMvm4R6LejAjZQ
	n6gMT+ZdROEm6dKtOB7Xy2M159vc/24YaOPj/nZuT1NJdZ3+eM1QNRMu48xaogK/bnLvbelYOzz
	rPMDb8X51Cvv4Tb5pMBm7nHoNkI+SJZR9a9ZovIedamLxjsWwYqmgF5nbeHYP0hMIFWhrjWvIg3
	O1uU3TwT/3gxfntd11iac=
X-Google-Smtp-Source: AGHT+IGawb4813XxTpXhxO6HL6BvNlF273MeclRGfQ3gMR0NHndFHiUj1RkIVvC+/osQCmE52RFqgw==
X-Received: by 2002:a05:6000:144c:b0:42b:3b62:cd9b with SMTP id ffacd0b85a97d-42f7319b198mr8012571f8f.37.1764875753371;
        Thu, 04 Dec 2025 11:15:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm4615583f8f.12.2025.12.04.11.15.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 11:15:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] yasm: drop from packagegroup also
Date: Thu,  4 Dec 2025 20:15:52 +0100
Message-ID: <20251204191552.1203671-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 19:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122329

It should have been done when the recipe was dropped, but it was missed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d7d6c08693..d873a7b817 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -294,7 +294,6 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     xerces-c-samples \
     xmlrpc-c \
     yajl \
-    yasm \
 "
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid pahole"
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid pahole pcimem"

