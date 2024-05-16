Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEFAC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:36:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.17213.1715873778226784722
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 08:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjAECrFh;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59b178b75bso277425166b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715873776; x=1716478576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOMlXSMKs0muGpi5jBrzpa7R3nqhJ6Y1hKpGVPNeeEQ=;
        b=LjAECrFhVwNdC0sPS5m04gdJJv9QN6GJtbQASKSwFsc49irxi/aQOfLDADiXA/RTDc
         3FWrw6SLQAE+rDJ3ej8em0X5jA83e7IxtNurkJZ9WQtmrz/3XQ9rCsc3+1lrx0lWnEkl
         DH0AU6psQWwnOFEtjf9Hl+L2U2prEjP5MepubWkQ7MO4KCAxdgSPtfaEN5/H+Dd9GF1N
         hlVvkP4U9zX15nV/FJdRGRYDOpGjol2HCvhV3671HjeUiAxvSx9oJts3Du6BhDBvfJ6A
         CzADx02aJttPlsIBPIbuYdukK6GR4PHsSGiy+9vQI4h2Cule4LeyDDJ45ENUeVR3C24H
         +M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715873776; x=1716478576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOMlXSMKs0muGpi5jBrzpa7R3nqhJ6Y1hKpGVPNeeEQ=;
        b=TCoGVhFsSSf3FlRz0MKMjtbmsz32jTTx8JTA1XsBwa2AeUlKP2JRg+ODXHBMFh0/km
         eqhi4oaHnxz5P5uh2jaAHS3EbiNN+v9zOiPhtCddGbuAG/WH1r+x/l7w0vGaChrfF4N+
         ACUI7HfztjFisiys99JTbdWFbJ7JQekdMEJshFHzFAxtdUtvwZBQB9q2kk76T0rsVmzF
         Q9bs3fP9RmpAjstRO3+BdjmyyBZ5u1ISN3zP4oGlxTP45MJvE/zrbLloPNMO4VvVM1JH
         jMNQuwLZm3C6cPFYzEQQ5mC2tpM26njM4HqKBZd4bJ9VF1fkHCCiJFJoKchpTlKyzkHk
         IMwQ==
X-Gm-Message-State: AOJu0YzWA7FSyG0+YGinYFSeJUB0wqh8ExnWCVNkZ72Exnyka1xdWib9
	5b0EfSPBr06Z1Nsvf6lybIqnpEhx7oBHqoXRlT6gLH7Jqu7fRd/h3Qm0NpYThoc=
X-Google-Smtp-Source: AGHT+IEZQKddmoFrrjVcg0AEWoqFb3roekODIB+geqTIvlyNvntcT1T9crIhOApe0kB7r7DTEoT9ug==
X-Received: by 2002:a17:906:5393:b0:a59:bacc:b07f with SMTP id a640c23a62f3a-a5a2d672f6bmr1342811566b.52.1715873776256;
        Thu, 16 May 2024 08:36:16 -0700 (PDT)
Received: from localhost.localdomain ([5.13.213.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdce8f916sm150610966b.223.2024.05.16.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:36:15 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: upgrade 1.19.3 -> 1.20.0
Date: Thu, 16 May 2024 16:35:59 +0100
Message-Id: <20240516153559.1320799-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 15:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110415

Full changelog:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.20.0

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../unbound/{unbound_1.19.3.bb => unbound_1.20.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.19.3.bb => unbound_1.20.0.bb} (95%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
similarity index 95%
rename from meta-networking/recipes-support/unbound/unbound_1.19.3.bb
rename to meta-networking/recipes-support/unbound/unbound_1.20.0.bb
index ffdc78e9d..fe0111f59 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
@@ -9,8 +9,8 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3"
-SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.20.0"
+SRCREV = "b9525c5fd47ba481a29b90109017d2253beb105d"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


