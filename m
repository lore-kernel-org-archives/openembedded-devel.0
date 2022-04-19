Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65630C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.393.1650392429204220087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B1Qu9cyy;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso2647531pju.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y82Zcf7u3zAfRfIEH4PEfSGxmNk4QMNRqZgJwrYszek=;
        b=B1Qu9cyywohk9jxDAajHX8bkVk0PkLZl1c19j9HHNB8wg93iAnIDcdM/AkJ4tx2h6A
         ZRPR7vAIPlzrxBMlX9Sd+mKKMZD5hOz9bCaY0OMK6PF9B4uy26C6Mj0o1lpzLiydoNi9
         yxXU8xxBszlaYI7/M61Ba6G9jEkI3Lt0c0ThkgnZPzNjarbI9axJhxhewMgH8Ge1E9Va
         0beRJH/96e1b6H3+F7SiL4IX0dyrGPq3GiLoeG1PhUHLZuLB4t/cV/JXxmOuao6jmYdI
         QFV2/G5FbOt0HAIoE/Zc2V1ltdls1ZgJKCo3+QLM17C2oPwm7I2yQ87qokVkZaoraBVD
         8IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y82Zcf7u3zAfRfIEH4PEfSGxmNk4QMNRqZgJwrYszek=;
        b=zha0/O5ouhYhx0WT+OxVZzHZY9edqa19Q/WiG9bFWkqOwMVZQiogHRPG9q6kVF52+T
         vQ0dgRjFajr83wybxKicOUNVkhT3XqbCPIhBDHPKwVEanEXZHD2vSawLgWaebj95/I6g
         zrHFeTw/LrFMlertfxA/TokZKfugIH3DtD/NkiF9dQbTHVnZ1B7TR7d54NVGixeVuHcU
         po8rYQMg76d+djkUotuKuRTsXr3Sl+nJfKWOU1ME97LyMV3y7R5pgGMhJx78nfuPMb3J
         uVQMn7MY5Wtw+54/SCmfytclCHk9SDLBNTMeRZ2vA3v8DNNpBait9Skb1F0ooDeAIeeb
         i7pQ==
X-Gm-Message-State: AOAM533QoR/05u7d450wfhoYFWJXSdMmK+elFckp4Yi3ieywQNmF3ys0
	cLtvkeQhocnWWE5fvLLJLK/HQ6Mc3tqSSQ==
X-Google-Smtp-Source: 
 ABdhPJznnJoYR9Uql6lXjX8WdZ93mmscfv1O0h4c5z4D35PvWXGi3B9XBnjvjQt3MzzTNoybepfxCQ==
X-Received: by 2002:a17:903:2d1:b0:156:7ceb:b56f with SMTP id
 s17-20020a17090302d100b001567cebb56fmr16971340plk.11.1650392428454;
        Tue, 19 Apr 2022 11:20:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 19-20020aa79113000000b00505d5d15d80sm17170699pfh.14.2022.04.19.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:20:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] mozjs-91: Upgrade to 91.8.0
Date: Tue, 19 Apr 2022 11:20:24 -0700
Message-Id: <20220419182025.1368634-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220419182025.1368634-1-raj.khem@gmail.com>
References: <20220419182025.1368634-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96700

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/{mozjs-91_91.4.0.bb => mozjs-91_91.8.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.4.0.bb => mozjs-91_91.8.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index f047e5e960..b04634caa1 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            "
-SRC_URI[sha256sum] = "e722829db490f9332712a81c35996541737bbfb05232d47190fee779c4fcb327"
+SRC_URI[sha256sum] = "d483a853cbf5c7f93621093432e3dc0b7ed847f2a5318b964828d19f9f087f3a"
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
-- 
2.36.0


