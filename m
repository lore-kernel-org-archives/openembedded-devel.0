Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E19ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5405.1663157004722513121
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oIDuIQzJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k9so25401904wri.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=wK/efcpCu/VRNJBS+8k4lWXfW2KqJQ4ReB39b/fNW+w=;
        b=oIDuIQzJeDP5Ncuk9fWjnLAqAYqKhD/dBYi+dblK5s8v9xlvLHMFmxStjGwyFs7YSk
         TbSAO4nWaxF+HHRgQJJeANdjcTUAS3nD97y4udmwPXyFj+BkC6nPFLyk7KEol5DZpsjd
         FXPYAX1fQII8QRbhqLb4moLMVkybG+P0KES/pe8yfrwGaE7CLDzyh8JgxbKG8KYquDmj
         eIgecOeM6q9HAshe4ceC0FEqANM2pF3Hhl1IxW+sulGkifIgm0ym5dV4KrVnaqKsnW6N
         YfCL1Aw4mz+qPTlR0m5Ccmco6zDm4fq0Re+iLPQmGRxuByCBVQlRwpKWeWGKYNiAM46y
         ERGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wK/efcpCu/VRNJBS+8k4lWXfW2KqJQ4ReB39b/fNW+w=;
        b=KnKw4ixbX/2xkweSWqcHi/TNAUodCF1UwkJoUrkYq8NOUd7M7CHTIjRWc4MxjVbNtB
         e+D/zoCEpnLwuyaDPHZdSPfPxnt2o/CaVXShhocIxZEUkb9wgZfFC2EHl1jr9B5FMMfP
         +0o5LihVayQ58ovQ5MYvfFv4KD2KRjpymPUozrIGOHt9t4cMRoLHd/DK0mfH4aqz9cba
         gh4H3lkti2mU7vhug9U7KvsSXmtPmd/Rne1z5L4dPGNfHfVVt3JxLBK0HxgNzsyjC2yx
         v0FujGT72GR4KWOVLynnNJ3OMvjyGSy6+qJNP/uQCP1OYh+x3ZUg67xtqJeXBzQhr649
         7FMg==
X-Gm-Message-State: ACgBeo09DaIloXPEjIcOgAL549jb8pIE9Nj0vx+BoiCZTd+bDOGA7s/c
	RFSSVanBKHxT39eyocB7S2QJdpjrxvq0Hg==
X-Google-Smtp-Source: 
 AA6agR545lOWOXpWSgz8vvb91KzNn17Ay8XmfuUGqX52+UWSS8CQfn2pjsRl3MGQ2MkBA//pJewtvg==
X-Received: by 2002:a05:6000:1a8e:b0:22a:c2ce:f556 with SMTP id
 f14-20020a0560001a8e00b0022ac2cef556mr3829985wry.154.1663157002921;
        Wed, 14 Sep 2022 05:03:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] mozjs-91: update to 91.13.0
Date: Wed, 14 Sep 2022 14:03:09 +0200
Message-Id: <20220914120316.551377-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98795

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mozjs/{mozjs-91_91.8.0.bb => mozjs-91_91.13.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.8.0.bb => mozjs-91_91.13.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
index 8ade3bb4b..c3ee75086 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            "
-SRC_URI[sha256sum] = "d483a853cbf5c7f93621093432e3dc0b7ed847f2a5318b964828d19f9f087f3a"
+SRC_URI[sha256sum] = "53be2bcde0b5ee3ec106bd8ba06b8ae95e7d489c484e881dfbe5360e4c920762"
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
-- 
2.30.2


