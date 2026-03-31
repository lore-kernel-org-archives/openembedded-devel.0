Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6511E109B463
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 12:49:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19190.1774961387199238682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a7ib2W7u;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so41521515e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774961386; x=1775566186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxhyw6dYBcnzKLafOYMzvzwvAJ8CBOQIBkJ8Qa77KJ4=;
        b=a7ib2W7uLWIkjp//3WusJLFAb8X3JERXHwV+gF89Q8n9OKQWrKkCJWd4EWJ3awRKQY
         dB/9hU116F651YJoBLdCU1QvXudw6V85BAsTqvWos4xmLm86Nc7aiyc+m78nh+EgO072
         Y3nGGsAp8ubl5Sl5elOmkZ3U0/CCKKyRj09bIc6x/G3xTk6j+r0+I+CZ9jTKeq0p69/l
         HhrvBKJXUfLsp093Lyh3hcWgDwKxIefJP1uvOjFhx9QwToSfYhKL1wO4LLdWmVML3BFY
         7WFWn9kSNxEZOnRbyFi2HQo4mgexqPXY4OWL/PkLL5IbMZXn//Krmf/IEQ8Ihe1fyDJ6
         R1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774961386; x=1775566186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kxhyw6dYBcnzKLafOYMzvzwvAJ8CBOQIBkJ8Qa77KJ4=;
        b=Wj0qTR4i1WKM3NgtCy6nvwEZBA+4cTWz7H+CcBIHccEZZgrGKSKka/QJULVzd3HgNS
         XOpJk+UEc4xuNu8XyDAKAYeorxMmPuS6tHYuOPZAoEbg1G+EyNXluoCgCTNYOkDJV6mC
         gyRhC22UUd3Oy7/VSbDTrssNXWeJFLutfdjVtPeQn9hp3DgQ0nX0vkCIXioM8r2AYbt8
         5nvwE6XzOJullpExTRDH01p/oiMDGlIq2V83AIkcWMb57I8F+joa5LWdU5ylykU5zQih
         Xt0ly2BW4QdfxMkQyornI5dAfvX2/lsKwTteLBlTx2O7l9UiMLASUccacFsKILUk93sn
         jBUQ==
X-Gm-Message-State: AOJu0Yyx97CoV2eXpx8KkREDTwn37VnCf6uq3g8ZO1l2HdrcAhL59uYx
	9FOSTxEUCPBanb5TxXMlealQIWqlQDYsiMh0za4WsTUpEu7UPtUxjOQ6wxLEGA==
X-Gm-Gg: ATEYQzy71Z4Y4vhOsXo84FDY5eZTPZPNGm1kHwh36iHSsg8jJaDWC250aIDj66r12YH
	zUR6+82BsDGfqpVbRoSGYQTIqlqMs7YFSHGukz29ExHbxypgOhA/SotI0LKHWh9N0qIqKQsih+B
	4Wa1FdAJEcvbM1I+IqAQoqnoL4LbJKE5Stfev0NvA3rZ0WTzIrFpDnCW3EkMLZPpIQ3QgqYvztI
	LCTPInA6d66szpFRae1cW6C7K728a/SwqwLYWqh94ni/Opn8rMgOxK4J2fb1SGUV7yBIzCgcwP7
	Z3iPPZC3vvrT21BZS94o25ibMANar6IHzTVC74Vn5ICZe4GUnayvwRHglJG8tJIeWvEfAAb8nEc
	pAIttc2FeH40v5uQuEDI6pDb6NJDxR7yj0GKG4A1GdtbydAoqBDkm6f/LsM/C6e1ufFVXrnoNih
	17Oe5ZpOV5SMlA0cQI+ff9
X-Received: by 2002:a05:600c:c493:b0:487:575:5e1 with SMTP id 5b1f17b1804b1-48727ef5571mr265923505e9.24.1774961385377;
        Tue, 31 Mar 2026 05:49:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm31682855e9.11.2026.03.31.05.49.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:49:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pidgin: drop obsolete CVE_STATUS
Date: Tue, 31 Mar 2026 14:49:44 +0200
Message-ID: <20260331124944.3576075-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 12:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125890

The CVE is now tracked with a version by NVD, it is not needed
to ignore it explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
index 13a22f6e59..85c521df87 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
@@ -14,7 +14,6 @@ SRC_URI = "\
 
 SRC_URI[sha256sum] = "0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356"
 
-CVE_STATUS[CVE-2010-1624] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2011-3594] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \

