Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5434ACCF9EB
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 20:28:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.22750.1761683314125403657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 13:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ng4vltGQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711810948aso48100875e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761683312; x=1762288112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uceetoEx7I4qp0N7MRvUjGAbSx+PJEu2m7MPOJO5cT0=;
        b=ng4vltGQ5DtH1MjnCWO/Tlg7Us+/mr0LeH/+tJEUd4C7EIUMasWQSnDhj/6WiLKJv/
         GSifuJrADW1qH3KKBZKxPaVrJsB99Xq32TGU7gzTh4cECbPFT98qbI0HdKGJ0z0vf0eH
         ys9/e8oFYcbaTrzZ8jFbTZ103ni9sw5M0+4C03E3Uiuyysfi70ALRykaaCGY3mEqc76O
         o3ikNdPgte0jlpR8P/NIanC6kms0OeQ0V5bcfJEJWnMTzSVlIxAj3gW+SN/XEQZ08IEh
         AD7Bd1jropTWw+ww5U4YH+zZz4rYTNccE+Vw4ugBsjfQaDz3AoUcSCYMDPjWxUEAx0wF
         dsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761683312; x=1762288112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uceetoEx7I4qp0N7MRvUjGAbSx+PJEu2m7MPOJO5cT0=;
        b=rIFUfKfvRRwEUuHdB5ZB1aDy9tmZ56oU0XRdO+Zpls6NanuPZPMqQU9g2fijX8gocU
         q71ttGrOs9JJ3DRHEY/a2CxNA3xjHDbIeThFQjjst+DyAzxis3cYiaBAJot5yT7482KH
         mSJy1Dw2sZVIqyyRte0bV6KNNxJnT6GGAuusj+3KGMeTvDQq/qUn29JRAyGynlWIQKFY
         Ra7scYmvjCD8PCd3XoHW0/PqS/6EUlwQbVmzdfq9lRkk3IWCteP3mDcMlXhCAEsR7h2e
         jkQWU6S+5s9RGsw3NnITvaFR7BSEXUnXKx9MOhxNE1Kr+iPi03DtBlfUesBuypjpSP5d
         hmWg==
X-Gm-Message-State: AOJu0YxTZM1edm72xgegTIS4O57j43IAp3bGVTgEKp4f/oyQB0KCi8Pl
	bbYjKoltZnOyriW0nU50a2zzFO89Gk3PNJirlSOJfc0kmufPjMI0g6v/We63FHwi
X-Gm-Gg: ASbGncsJJ1iS+CKONOYAR6uzs8IWN762SnG6BLtukJRN0WG+9a2mCdd7onYBfC1dyhg
	w8saeC5cSnI50USSD1SaP2dgbWOBYmSvP2WSZOI8B4j0CdgFusQASGRape19KslRBqSUjMl58cu
	Joa8pWqSN9kaouN6/8ezqAjbP2FEXJ8bMMf1IlaDEjEAi+aaY1AOq36ag3OhBFLQx/RdjSbb6jO
	htgLtryQfBAojkK4dHZy4uCXR4OZneoHkIQ/DYi6gZpNbb+LDjkvqO+hqaHO0r2zoOTD03UZLSm
	mcOdoSnyitygnKolg3jqDtreolc4+wl+xAFVTA1WSOxl1DP9QGymg2NeBdRoSQVfWPMz28UMHW+
	7UJUzBuJ3b7ntx+28Y8pI5wvzqam9QE/cB+zGknD0SqAKHqSB4TtprWdoJEePDuJ1V6jNx3SWfw
	==
X-Google-Smtp-Source: AGHT+IFyy/eOD7qJ6WSMEcV1Mvir7nnfu0RVmwJeM32JWpjQSMEXwMQnGuYupUUH4kD2naUvH14u4w==
X-Received: by 2002:a05:600c:3506:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-4771e333bbbmr4643215e9.16.1761683312313;
        Tue, 28 Oct 2025 13:28:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm10093355e9.10.2025.10.28.13.28.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:28:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/3] net-snmp: fix ptests
Date: Tue, 28 Oct 2025 21:28:28 +0100
Message-ID: <20251028202829.2311091-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251028202829.2311091-1-skandigraun@gmail.com>
References: <20251028202829.2311091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 20:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121100

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.9.3.bb            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 88466c94b4..13dc603bfa 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -269,8 +269,12 @@ RDEPENDS:${PN}-libs += "libpci \
                         ${PN}-lib-helpers \
                         ${PN}-lib-mibs \
 "
-RDEPENDS:${PN}-ptest += "perl \
+RDEPENDS:${PN}-ptest += "${PN}-server-snmpd \
+                         ${PN}-server-snmptrapd \
+                         net-tools \
+                         perl \
                          perl-module-test \
+                         perl-module-socket \
                          perl-module-file-basename \
                          perl-module-getopt-long \
                          perl-module-file-temp \

