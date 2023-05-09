Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4359CC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 11:36:22 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.29585.1683632181263131000
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 04:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vu++uJWs;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f1411e8111so6440340e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632179; x=1686224179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48FpXQgFjXr0fTxNtPWq4HNm5UV4QtgspHC2l8IhMIg=;
        b=Vu++uJWsNT4yzuUOMWI3f+s8qLvwHRi0HoCLn7vGaRi2YXY5ZjgASrrj5luOxL3xLs
         r704jraog+HcwJMiLCxrNFZmw/dDxHV3M++/nCwMwEkFnEgIfCZbhznSAmbGdTlXwTaG
         ttyVgQtEVmJ90Y5ve9PzOrUITRReNW8lzpxuIx1+F7rCdnTh8ZyZqCpG3++skWCCzZGn
         LYAQ5ISMxSPixx7Dqe4p68lLj/9UYr5zGxyYp/N39zG8S5EoTVZJBxrnDGEUrvAKslo9
         i0lzhbHzpNqdrfOJMpeLW57CV7GpFIffeqXhAlAQB5AWqlLTKmYiXktknYJ0ZSpybqWb
         2QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632179; x=1686224179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48FpXQgFjXr0fTxNtPWq4HNm5UV4QtgspHC2l8IhMIg=;
        b=X1XEJ1Fq9H6HpptbV0LYJukRdP0PrXHGlxlEJAdX25XVTGGSu65UB/KZ6qyyg56mzy
         BWcfXn7jHpfYZwJwSI3UsElIR6oddRohpL7VilKrMIP2DyiOnlaechtQV6sqvXLFWXRE
         ToQ/EH10m8LqI1+MUSdrUhh8CNB7xuVVPCMBCBRzbBLlr3q5WKC7ZcDzFwx4S9JkTG/N
         DuilY18VWTHnvKRhzzuOkGgyWygj6RT4tMVNsqOe+MNY8H45bFNRch4tPPp5l/sP2Nd5
         ZqaQwaawp+4I5U8Tun2SGuV2dSKp6IZP1rCDvrUiTl2TGiCusc6QkrpvXjAWJpLap21L
         L5ow==
X-Gm-Message-State: AC+VfDxWUJUw2k2EzuN/fm/RzaDHiZnEPZ4hw5exmTJ3LycsFgz1zgsx
	ceZoZmCvHFhZtU1pgJN8SqMQP0Z8iZk=
X-Google-Smtp-Source: ACHHUZ5nr8faXf3y728wnHKWAAiRMsa1zTc1gl1NtXA/0AId2WUFvbd97Pom2LevZAQmAqF2KcUb3g==
X-Received: by 2002:ac2:47fc:0:b0:4f1:46d4:c18e with SMTP id b28-20020ac247fc000000b004f146d4c18emr700967lfp.21.1683632179213;
        Tue, 09 May 2023 04:36:19 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004efe7b2e35asm314209lfp.248.2023.05.09.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:36:19 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH V3 3/3] libusbgx: fix some systemd service conditions
Date: Tue,  9 May 2023 13:36:20 +0200
Message-Id: <20230509113620.786170-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509113620.786170-1-liu.ming50@gmail.com>
References: <20230509113620.786170-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 11:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102504

From: Ming Liu <liu.ming50@gmail.com>

Let usbgx.service require and run after sys-kernel-config.mount.

Use "Type=simple" rather than "Type=oneshot", this ensures
usbgx.service would not hang on failures, failures could happen in
many conditions, like if the end user has manually configured
something in configfs, or start usbgx.service twice, or someting
wrong in /etc/default/usbgx or /etc/usbgx/*.schema.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
index e2aa95a52..ba92f1ab8 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -1,8 +1,10 @@
 [Unit]
 Description=Load USB gadget schemas
+Requires=sys-kernel-config.mount
+After=sys-kernel-config.mount
 
 [Service]
-Type=oneshot
+Type=simple
 ExecStart=/usr/bin/gadget-start
 
 [Install]
-- 
2.25.1


