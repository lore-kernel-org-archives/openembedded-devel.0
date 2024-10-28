Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482A0D339A4
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:15:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.57596.1730135699526197404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 10:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iimnm0ME;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ce5e3b116so30350305ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 10:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730135699; x=1730740499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NZQuTer/NFLWcVxBMN1/s6Aw2VcCRTMz/vEq5Hs3rc=;
        b=iimnm0ME3dGP+3WGL+pw4lm7RkTnFOMqqLuJXFMVoELuqIGJ/Jz+Kt4J+4K+b13I16
         mj2CDYPVgsahDMYX5FXXrt1JNUR3v9+Cu7lgETaiYNxOWxKz/j2H2P0nvnjomn/hV5dW
         CtQi/xjbjIBpFz30o30zCb1lsdnhU4HWAuawjzl2PmqX/eSHhbR27o55MI4jFkeag88r
         2i7aHcEgyyhC2TInPNOyW63KarWSiGPtw7NvZr0ubfbO2cdc5NJuOINdvp6mEvJTXWCU
         r3Vu1RSJcfhRdD8LIIVSeP4mRiECvsO22MqkUAFoOMAeGqoBLaY9tJlCQWSQvQEDoQk3
         5l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135699; x=1730740499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NZQuTer/NFLWcVxBMN1/s6Aw2VcCRTMz/vEq5Hs3rc=;
        b=VfjmkM0rnVt/tF3HykAcK2HN9/I0VVF0JKEJ+mQ/IkcwafX0Y0OlI5s3i2Sje1xk10
         IhigyUr6T8uax+i59/suJcPkNM9dbYr18qMtWVGy51EFwhzvJzZ9i00BGbjdY2NBF1M9
         uaISlsvvKAkbgT/abn/j+DAQzY3cPyuTwaGf2KC2SAa5mq4xI0wctgA3xAWjVjkUCqNp
         2ODMGK4t8oHsbtomg849qF8b6CvwBL7OW7z6WVu76ek+jraAYFinDeeZGwJJT6ardNNF
         agZw9JX7RdpqNFjqG4rE5+D0PYx045f0GWjJkrWDEaFmPu6Diw3w1czVf/sWYKLPfimk
         ZESQ==
X-Gm-Message-State: AOJu0Yz1kFhXEc+eho9pbwCacIdvSw+MWnmpQMkQNDhXo/+47/54Dp+N
	CewS0EpF4kp+sehkQgaUD+tPz1tg6437REFy5DO14iugG/pse5O9x74b4eUk
X-Google-Smtp-Source: AGHT+IHZ+ihpAqM7WzQzRNoRm0IxEPVwCuZ0Yle+z+Jg6afJLqscwHyDwb8SIOXG2I4mDY2kMl3XeQ==
X-Received: by 2002:a17:903:1c8:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-210c6c0d3admr111007945ad.33.1730135698410;
        Mon, 28 Oct 2024 10:14:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b8bbsm52656095ad.244.2024.10.28.10.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:14:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-html2text: Add missing rdep on py3 html module
Date: Mon, 28 Oct 2024 10:14:54 -0700
Message-ID: <20241028171456.2462158-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113262

Fixes
ModuleNotFoundError: No module named 'html'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-html2text_2024.2.26.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
index 6200586e9b..55f4c8b0a6 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
@@ -12,6 +12,8 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS:${PN} += "python3-html"
+
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \

