Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D472C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 02:42:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2724.1645843361404096262
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WVTcqO/X;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so10007477pjt.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4cGpnbdlVCsOgRsUcSxeFowfEIPd9xk9RquHIsKtUpo=;
        b=WVTcqO/XhM1sMkbXXJ6mxcwMBBNH5VMH2EmsdSuu0P6rSwwKECpPH4I+PMlMU591LH
         XC8PjhWENRsc1jnxF9Pp5KKTNrqfUxD/Kr+42lbmfycz7Fp1RHM4MQwSKZF0vMP06NnY
         vmAv/rLuekQfq4bfFbvsJwVqw4I4VuC8clhtF+HGeTqB/MQU0MJyOAnyq9Srr4gwvvaJ
         wvu89CzGbcRNDUdSfeAWU4XDqtcj3wtwxmvaPTQkO6ZWrYaJcTd+JnW9hm8My+QvemN3
         jxCudmrJ7zau+Ui7UGhNYmReZnFsID4anx9v1ix32MH/8qOEEP7vPKdQ90BkxR+GrdRU
         8ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4cGpnbdlVCsOgRsUcSxeFowfEIPd9xk9RquHIsKtUpo=;
        b=3gnwXanTWAkRqg08OJ+c+gEVV2YtzgOILaskEKt+4pEHi/TIV7a/nIUkLoOYJQ8pIj
         XclJsJzVVI4zvkBv/X0AchssSgbor1x3AC4II5NMphTftN7szg3kw46sXqbQQUSQS2vL
         PyM1XFSnoplW+ayDovM/JlLairjd8g07ouwiGfeIgcTNTtPM093pSudZIzVR611SRACL
         DitzRYr8i3rX3RypRSIXGLr6u1leXkNJtmVx8hb6mfswKkMXZW5jeY1rLaAQZxfRmtxX
         8Y3a3bnG7GH1VJewD6MxX66GybIpFO4rSSl0MzFzUAAXCuhaafNcE7ndefSxA4Cegolt
         1tCA==
X-Gm-Message-State: AOAM532//hwDKoBFqsvm0JewXUVQ6BUc7O5YIG8fRacFSdMm0jQ5tGUo
	+KJp40uUyp2lgqLv+olwjRFmRW7EVs0=
X-Google-Smtp-Source: 
 ABdhPJxQAZRhIl9NNE4Afzvws4weeIJcHhGZIdVzLeEKf9P12mjX/8nbUVy7vOcvig2Ne0UMJ/R6nQ==
X-Received: by 2002:a17:903:281:b0:14c:f3b3:209b with SMTP id
 j1-20020a170903028100b0014cf3b3209bmr10236476plr.87.1645843360313;
        Fri, 25 Feb 2022 18:42:40 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 n22-20020a056a0007d600b004f11e614565sm4737815pfu.189.2022.02.25.18.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 18:42:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-twisted: also ship Twisted-*.dist-info
Date: Fri, 25 Feb 2022 18:42:35 -0800
Message-Id: <20220226024235.1344539-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 02:42:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95532

With the PEP-517 packaging, we need to ship additional FILES-${PN} (the
wheel dist-info standard files).

This recipe may be overly complicated. This commit is only an attempt to
fix the install of the wheel.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
index 7b437916b1..4967b5a14d 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
@@ -80,8 +80,7 @@ RDEPENDS:${PN}-flow += "${PN}-core"
 RDEPENDS:${PN}-pair += "${PN}-core"
 RDEPENDS:${PN}-dbg = "${PN}"
 
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN} = ""
+FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-info/*"
 
 FILES:${PN}-test = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
-- 
2.30.2


