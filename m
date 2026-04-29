Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C34FF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 07:34:04 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6221.1777448040819121373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2026 00:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IcGRK75c;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e936caafeso126356001fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777448039; x=1778052839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B2wn/2d46AyaWjXWHpv4y/6DRYn170nh+2+ZDpQDEI=;
        b=IcGRK75cIY9ul9ydJ26AhEe8po4pt2PH3wJjAcQUEW+6R+LYSmUj/QaOE+kOka1cvU
         dOTRl9Fy6HxVPXbdjEiFpf5fSjYFkbQgigF8NoTPFzxldGZRJBZYF3BZ7NocwnOwqv5e
         EjchYW9aKXFBo9duVQkD9vhpP6ZJiI64NuHU73nikr51Kq3N2pbxWLY//xlEC5jnbJFY
         V7U8AvY1pTjZ2M3zVXCCDhYr0LMKEax6pIdpfhN1iZwywGXl+l44n+JGbOBh2pLU/VBv
         pzuyNjMS5Jb/ENSxxoBPZQXTlT900RcUMI3d3ZdON9WbmFkBWyzqwwpIV4m+YW96q+lV
         Zo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448039; x=1778052839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3B2wn/2d46AyaWjXWHpv4y/6DRYn170nh+2+ZDpQDEI=;
        b=otuj5qyPxAqSaOaz9lLg1R3FL8faO7nQ6E9+ao9D77C966yzOVXStdTUbrXXmYZDQp
         kd9XjgN5qWhkno7e50a3T7V37idAGwu6ugQFT3TXhpQLjjHDdkzaxKkM5pSIIulKxO8c
         7pr0aU/reF2mlCPztOqQ9CuihkQ85wROrYv9J8h3I3bvnq1wn08/7+Z6L7lsB1BFgoTz
         D1j93yu99PnFX8s8C+6H9MpuKafEpWiEsgAXrZpEEmh67USHa5RyeTC42NYED40KiuE6
         B81WW2Aa7WgZmK7E6sfDwrXFPO5LfldSebtRdMEny2YGSXW3ZTS7QIix9Wvxi02i2qOn
         sBKg==
X-Gm-Message-State: AOJu0YwWSlTw0/4Ur6BhFMWmXF6QG05369oaDFQlqnC51+MuERdNkcEA
	k4a2oAtRjx7iTohRrdqar6RiDD/86Z0V7PDC4Ghrv3RIuxXXtsp3p1CDJNyJnDzlsxluam9rBXx
	8o3au
X-Gm-Gg: AeBDiet1BO/A84d/pjTo0neCAJAjP8Avu/0mWX/fVtOsFYpCoCDZh364Ea4TZw7Ug+M
	fyHO0bC2BnBmdfj01iSOL1ZNo7jaPJQIkfoe7cbc6ul43tJ7KEeMQIKdUNP/QT7wUG8L5gNw97O
	ErKdHLTsKDGd6u9rqvhWkZBpHYkXtOcvU29TvjCuqz/l1q3hnm8CaIYe0xq3AMGGzDJxSheXmim
	pN3L0T5OeAgP+lpwLaaBkVHktiFSE39HPT68ku0ajO5vU2fjAAtWBuzGrUmqsN/GTL4rh35/T1s
	peR3g1T3i4ntzofvVZwLmPTgBoqPNG3vCkD2dM/nPf23O6cs52AcD+ensMhNujJQv5vRZUH96eI
	IgFiUsfwru+yG5hQdlyL1CA3BFXhNrCk8Pp8e8xUC0rr9JaTufGcdMln4wvrFGkSp2pCSY2SjvP
	cT3ew4GTLCaEkZaat4MyevqltmYlFlzG+4Mqfgj4vgAEhxzpkcnvSX3TG168x6BEUAF6XaboGOC
	QpUsQ==
X-Received: by 2002:a05:651c:144a:b0:38d:dcd6:dcd2 with SMTP id 38308e7fff4ca-39240f7ad6dmr21798061fa.17.1777448038764;
        Wed, 29 Apr 2026 00:33:58 -0700 (PDT)
Received: from nuoska.taservs.net (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f971c94sm2973411fa.18.2026.04.29.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:33:58 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH v2 2/2] jq: Stick to C17 until next release
Date: Wed, 29 Apr 2026 10:33:34 +0300
Message-ID: <20260429073334.3587116-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260429073334.3587116-1-mikko.rapeli@linaro.org>
References: <20260429073334.3587116-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 07:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126666

From: Khem Raj <raj.khem@gmail.com>

Patches are sprinkled in master branch of jq but the backports
regresses tests, so its better to keep it at C17 for now.

Backport: changed from += to :append to apply to all target, native
and nativesdk builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

v3: changed to -std=gnu17 patch instead of the in master reverted patch,
    changed from += to :append to apply to both target and native builds

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index dfc8dda7ee..3b717ea99e 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -30,6 +30,9 @@ PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 # enable if you want ptest running under valgrind
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
+# Gets going with gcc-15 but See if it can be removed with next upgrade
+CFLAGS:append = " -std=gnu17"
+
 do_configure:append() {
 	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
 }
-- 
2.51.0


