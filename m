Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BE6C04E69
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.11119.1689607239108737258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vMDGmQzc;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-768054797f7so364262885a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607238; x=1690212038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TltUa9FvvwTnvcE01oJYNzY6frIYSQYUu7UD1u18Gc4=;
        b=vMDGmQzcVBcG3gs0B4Uh1ZKIDWTbv33REDR2moI02EaCsDF2uEh+sZ3uj8yMzGp5j0
         CYTCeQuKgEHKRxfzAUvDtV1QZeJb9u08Hl1Oedq9sN5HUEso/knz6qtWlzaS5p6z8NGg
         y7laYvSf3HbZzmbareaukCB6SgzghT69obzIQ8+ParG/OPrylC7WowSFSnO+9UE5Izus
         arx6AT4Mj6a5AZiQ3pdtyQdrYLvbRfdljhQH6by2Gs3XRxkwYI6B76PSDYsrb29rkKWF
         HLG8/erWrVZGB0ip6dZxmBEhQJie4SAxEV6EVXRk9fOiw+Gl+NR0OlyG/XEpEKQZyzH8
         WFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607238; x=1690212038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TltUa9FvvwTnvcE01oJYNzY6frIYSQYUu7UD1u18Gc4=;
        b=gqIn57k+NvtUuZ9Uu6wjHW3XTzIbjeHU/K21kz8yAgFbHLTJS3Dg5EX2PyjQYKuys8
         vty7v+SPu7h46sht7jAB46fu41iziP/q/cJyGiZTXX2Z6gSTMsoYehuhnf2seB+s4Rzp
         6LsWL5RhEZx3mFWEopl8Ykwbs5Dj6/aum4Al+0T3WKFbIWVtAUqM0wNRQZ0jrI8B4QM9
         bDQMiPF33wnadBSqCiYfojNK0t1910WQrPG0ow5GRAVt/5lMe4RXstp659oiKaKMGHLS
         xWvpMjlQatl8lH72SLm7BLoZYka4ZrZ4Oo89ZwHUl7n8q8ZWyOecUxFDd2Si6nd0V2GB
         CzOA==
X-Gm-Message-State: ABy/qLY9xYfOJs+06sObbbOQ4jIoRsA4w7RBRFEbtJnjCzhS0YTZ2Vxm
	jp4dvnTjZ+belG1uVZmGqWofI9hN9FiTomxiYxY=
X-Google-Smtp-Source: APBJJlG8nPSROrLR9AhhFcW4Cg+mNCnda+r20e6YJP0pAuhwleNGyTp95/O4NTiPBV1VEkhdOAuiJg==
X-Received: by 2002:a05:620a:470e:b0:765:ab6e:53fb with SMTP id bs14-20020a05620a470e00b00765ab6e53fbmr15463014qkb.40.1689607237943;
        Mon, 17 Jul 2023 08:20:37 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/9] python3-bandit: upgrade 1.7.4 -> 1.7.5
Date: Mon, 17 Jul 2023 11:20:30 -0400
Message-ID: <20230717152032.3161667-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103884

Changelog: https://github.com/PyCQA/bandit/releases/tag/1.7.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index cfdbde9689..5e2a7e8bc5 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "2d63a8c573417bae338962d4b9b06fbc6080f74ecd955a092849e1e65c717bd2"
+SRC_URI[sha256sum] = "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.41.0


