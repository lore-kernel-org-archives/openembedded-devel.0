Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DA7CD13D8
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:03:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.48405.1695035021905232001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=hpqW8VUE;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.41, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-503065c4b25so2493201e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695035020; x=1695639820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzgRZmu72wOn86sc+gYJKeHxcGdyDUX07mhvEOWWCaw=;
        b=hpqW8VUE6vQ5Qo/PerggPF0Mv5T2ZV+Aa5+lKU9aWzWebqemJHYAKjStW1UhCyG+0K
         OPCPub4oBnNFwxkbFYZX2APiWyJm4DP86ZETZx3UV/uMZZZzDVAy1pRe/+YzUzGz9c8r
         4K4apPbTtJlg4QKGRoz/iKbsNlHVKv47BL9QkAtQvj2GsMEf3LWb0luRB1ESUg2lh6Nj
         ZQtVlimCKUBNn1MbEndEeMV2NBh9yG/XPWpUAfpDwfJhGeOSxt2xtvDfX2TQ9GROA0zw
         fv2fYx0BIXy4TYuDcaryEvBV+bYpCETt0GQ+MDD1wVVz2vGtD9vxqLQj7aZIuVapVMMg
         cZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035020; x=1695639820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzgRZmu72wOn86sc+gYJKeHxcGdyDUX07mhvEOWWCaw=;
        b=bklWHv1AV9zyfpzMjWrt+SOgKpR+YBwKh8NxTzDXbdSPK3QZ21JqjVR6N8Mx+YqUh0
         TSbnwQ/dLT0b79Kde4qnnwGbHByL7Rz6S5kJ5Qt+TiBYIlUVAGKcNOL2M7/FQtYpzv76
         4PejenBYU7IWDYVXB73WEo/bd+Y/bidJG9i1cnXLBsBmEu1sum2nI/ZZK3umZ2DAq3zV
         +/L1B06JncQEfurE6zLquBKKvRMNGiDNORuPH3+QN82AqcHIWFqbgzsjI+msHL/Ac/iW
         6JEhhrJTSZfaPlMMK29/Reh5CErHtLNcOzAXvopAUfustL2eCzB/GohGt1masGNvFjEH
         r1JQ==
X-Gm-Message-State: AOJu0YwojRoiHR5GX0f0WKzNENwUOp7BDIEAx0CEllY2I8LUsYSlfHgn
	HKL2m1fHrodEbM6NOBsDjoBXewuRQb4HGhM1mCcjlw==
X-Google-Smtp-Source: AGHT+IFlfQJIP8zQBhRaeNCLa6q2BMX7MO6E3GlcPLoRsdlISiDdrDrpdaxN+jINjDsqhSjMl/w5YA==
X-Received: by 2002:a05:6512:1115:b0:4fb:9f93:365f with SMTP id l21-20020a056512111500b004fb9f93365fmr8282473lfg.38.1695035020276;
        Mon, 18 Sep 2023 04:03:40 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a056512328500b004fe0fead9e2sm1040226lfe.165.2023.09.18.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 04:03:39 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH v1 1/2] cockpit: Move packagekit to a separate package
Date: Mon, 18 Sep 2023 13:03:01 +0200
Message-ID: <20230918110305.38374-2-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918110305.38374-1-dse@thaumatec.com>
References: <20230918110305.38374-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104925

Packagekit (Software Updates tab) is an optional Cockpit Project
package. Make it also an optional package in recipe.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
index 17f096f4c..260aaa84e 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
@@ -60,6 +60,7 @@ PACKAGES =+ " \
     ${PN}-playground \
     ${PN}-docker \
     ${PN}-dashboard \
+    ${PN}-packagekit \
     ${PN}-bridge \
     ${PN}-ws \
     ${PN}-desktop \
@@ -112,6 +113,8 @@ FILES:${PN}-docker = " \
 FILES:${PN}-dashboard = "${datadir}/cockpit/dashboard"
 ALLOW_EMPTY:${PN}-dashboard = "1"
 
+FILES:${PN}-packagekit = "${datadir}/cockpit/packagekit"
+
 FILES:${PN}-bridge = " \
     ${bindir}/cockpit-bridge \
     ${libexec}/cockpit-askpass \
-- 
2.41.0


