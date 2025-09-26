Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB184CCA472
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.18529.1758896375430305594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTf6vmxP;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63486ff378cso4657980a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896374; x=1759501174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBjpkjsQcu6jebcUXvo+jTkQniQT9Xr5m2kEDKOYtlc=;
        b=MTf6vmxPfgFPwa0gKLOzLK8RIXh+rENtVj1cGmp9FLqvKJ1+8Zer3JF+Yl9sjZfdRU
         p0sFIpgi5mo7d+HAY7RrkUoabIZHEL8PyjoVPf2xCtfDrB6rRYS6i9TAD9KAy3Dxd2lh
         JUT/4Xrp/qveoI3pn3qClkxreoFTzLrcVfCYodz1U4LD8dxkjSGxyv00kggGqMJ7k9cX
         6LkLVUxEsmHTGq+yV8UG05J8xzmAMn38hLHzERF/4LoDyzSf12Qjc/k28utlWE0fahT0
         EPgvpnvR4644lX/mAlkyE+7svYAx4D0Pv1Vd1lhGqzvY1sg55Rb/JsN4sdhtBpqGK6oa
         6GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896374; x=1759501174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBjpkjsQcu6jebcUXvo+jTkQniQT9Xr5m2kEDKOYtlc=;
        b=Cr+uc/PdL+Z2GiKrp4NQWacEFB5Hl73KYGcxpU63sN3wrSdeeZUOtdUKG51UWnhGjZ
         gpmo3ThodK3R2n/xjah+Vwr1XGw0Vd/jy7D+bVvJJedh7xtzpDG8NoiPPdyE60Hv460w
         hpeVK6s38vZUmHkOk80sA952e+JU+673vDbBUokg0P1j8hexTOodoLBAd/73Bq+vrEPn
         +AgwPP0Dl2QMqv+f1PxdULPP1ovIbDPCfUMVvvfEvfz57IGB12t5plJY2RC7PBYVO/V2
         Fq1E2anZe8A8MYK9c3VQFdtcRzCJpADmc+RbNtWoej8GJKKYn44MAYsAmihMOHXP8t/H
         xZdg==
X-Gm-Message-State: AOJu0YwxKHYjnLs008WUV51wrQh/hXjLmpLUsji67HOLnApJNLtlawTX
	DwvtHUtm+kvSiPbvkHiDY9hwbbdIQuCJST/vXQWl35L4ArlQQgcjSkEzYc1vnQ==
X-Gm-Gg: ASbGnctq3lSO/xfzybNEY0gBu0DIXXKU8eGs/Pxa7gHm4fbT/SKM58BCPGr5jzZLK6g
	mDKA0r9Muz/cxiWqDcxlEpASuvlIidrGUNkePythoc9OOdbou/hbaL40iK92trx1CiXmWpGNYLX
	aGMsZAHv21HGF1YoYuvqxEy5iEEUAngfov4jboUb3xuKGGrothnIrf9k4rjjHX/goaNZan5g1dt
	UdOlc5LzG0p4GBCCfwJl955enEZfGn/HWTPlGGz7DONKeIDvYSp3edQUqZG2OZ9csevld2fBDAi
	0pBAD6UmmDtaJpsd722RvsfJA3oCgJno79JA9hj3glm76yC7i7bjEcB1rwZHCIebrvKZwq4ew4E
	l4wlJn5JQEHIx97wxgo8R
X-Google-Smtp-Source: AGHT+IGd26TSHAZs3lt2nrCNXEcuRHIGrcLzTl+My8c5aQTeIsfLPreW9Olccn3L03ODsBZJ53bHOQ==
X-Received: by 2002:a05:6402:46ce:b0:61f:eb87:fde7 with SMTP id 4fb4d7f45d1cf-634a3339439mr6110695a12.17.1758896373639;
        Fri, 26 Sep 2025 07:19:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 14/20] znc: fix LICENSE value, clean up SRC_URI
Date: Fri, 26 Sep 2025 16:19:13 +0200
Message-ID: <20250926141919.2010846-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119923

1. Set the correct LICENSE value

2. Csocket is a submodule of the main znc project. Instead of
cloning it separately in a subfolder, just let the gitsm fetcher
to fetch the correct revisions, at the correct place.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a8d205e5c8e7c637eacbe91986c5f8c9145c6ff)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_1.8.2.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index 1517384eca..a50431982e 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -1,19 +1,13 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 SECTION = "net"
-LICENSE = "GPL-2.0-only"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
 
-SRC_URI = "git://github.com/znc/znc.git;name=znc;branch=master;protocol=https \
-           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket;branch=master;protocol=https \
-          "
-SRCREV_znc = "bf253640d33d03331310778e001fb6f5aba2989e"
-SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
+SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
 
-# This constructs a composite revision based on multiple SRCREV's.
-#
-SRCREV_FORMAT = "znc_Csocket"
+SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
 
 S = "${WORKDIR}/git"
 

