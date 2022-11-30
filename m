Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C18C4708C
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.5222.1669792758616205502
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dl5Okoi6;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso1427957pjb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKB+5hp2ymPH/4glOS77zBtgH5KHTo1Kmka8i2cPIfk=;
        b=Dl5Okoi6++UdEHkP8F9Ie/UPkqUJhwwbuoA9w9x9ZHRwMrtvsoke2yXOmib7VRspGc
         /cMRzrrRBsVBH0Nmgovo8lugIpxe4IkftWlEmaPZ3VMaXNammpdwQRJQRbtBgN5eqwIc
         5pAshNJaV6eosKmpY34Sv1qekKBmDFT1/dPB43QS73DO303/dcncP6vz4CFMXvgYK9PO
         S0zh3zcsZ8L34qH29bacLHmDbIWPhl4Gw/njtKgx6bXii8c/t5sD5diWmSkOCKD3m+xa
         ljHN62XWPKjgVcHoTqeWoXumvHDFqZ0yQvGCwsWV4gXcy3gznVkFTyYcL2681+BXsKCd
         vtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKB+5hp2ymPH/4glOS77zBtgH5KHTo1Kmka8i2cPIfk=;
        b=afjfladVgDKhFxYNAfBedBO1h1iry07j31QRhET0+idqVOkoGA4RytNGUwvWPCwboB
         yomxtC1CSXKI3+Q3EjQBDeApKB281XZH7pM0jkEDAjFyk4WP6eR517o6/ExQPL2hR84q
         lXJ5pWVVBb+lm5BAXQPTVnXrgoYAmg7ZZMSVXqbZ4feay+vPPVuYGApQRgCQWIgyuDc6
         jXHKV2XSjIGrbPKXxcUW56yOHOhCCmw5TmK43fitB52SPBcasxMmxr5efHhs/bx16osh
         HzSBahLjCpXNRN//Ypzbx++2NiQftbzQNcYWNiDkPONWnX3kNFocASdngKRuz69ybRrc
         HTXA==
X-Gm-Message-State: ANoB5pnB0cHhjlysMuCHFT0Z52lI9KUx9JCF5No+Y+uUwuKGM1fHsQtN
	uK1r7af+QvoDn0i1N3ktUnJ9aaJ37jE=
X-Google-Smtp-Source: AA0mqf5OMqwzAIuqmFqZ+5Pr4GDZcRMdL92qodBgT+uj3Ps/XPnTYYlwCMTJTECFO8oA8pXcfgeydA==
X-Received: by 2002:a17:902:bb98:b0:186:9fb9:1f8c with SMTP id m24-20020a170902bb9800b001869fb91f8cmr40217549pls.69.1669792757795;
        Tue, 29 Nov 2022 23:19:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/10] proj: Enable apps when building native variant
Date: Tue, 29 Nov 2022 23:19:06 -0800
Message-Id: <20221130071913.1805812-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99860

proj binary is used during build by some recipes e.g. python3-pyproj

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
index b956ce50ff..ab69f07760 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
@@ -17,6 +17,8 @@ FILES:${PN} += "${datadir}/proj"
 BBCLASSEXTEND = "native"
 
 PACKAGECONFIG ?= "curl"
+PACKAGECONFIG:append:class-native = " apps"
+
 PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
 PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"
 PACKAGECONFIG[tiff] = "-DENABLE_TIFF=ON,-DENABLE_TIFF=OFF,tiff"
-- 
2.38.1


