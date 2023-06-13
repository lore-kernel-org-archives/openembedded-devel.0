Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79517C88CBB
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 04:23:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6225.1686630197307071773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 21:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oNpM1H0/;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b3c0c47675so18595525ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 21:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686630196; x=1689222196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjx7KU99RJin16emtB6JQtaJlLkL21Kp611SVapmO2k=;
        b=oNpM1H0/UkuDBqFuGXSYe32/wmFlPCncTsqEFp00s0+3kFl3WDfOlTGEsnTBiZ6RDg
         2TLTFHp5JiBkvOHK4oEKQiyQ7R4dzO1ejD1z56ItM2HuYR/yLpnlC4JYQxagvVAJoUf8
         K6aXBoSxelqiDdSPHT3oYQSdTJzl5C7CXcyCvL7ifhpl+NAA9NuTGWQbJBuFsBJ7mfAB
         5NAU+YMkUhbFmdsw3EnQ+2WBhVUtFZHAHMJtS/HvqFAuzwcAjPfxKGREI/nMhw8GdPVX
         N/d/Fe0qo7AqynVDh2EvvbBEVuntYc2SUe3F4a2u9QlaPwD1eguVY32DLQAVAjgEwpOG
         WGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686630196; x=1689222196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjx7KU99RJin16emtB6JQtaJlLkL21Kp611SVapmO2k=;
        b=CGiNgbY3bvzNm6n99tira8Dvj9V3UpxfB1w5S3lsIv1thdAL6Be0WLDKvLUYn40iBY
         SWQGgPGQE3FkKenvWfac4L2HMCjJUTOlVwIX2vWc6DgJSE6kdmzEhk78ZowWp4N8pqOm
         /O0IrPyJfwl8rZffOQ1jmJPPOpbRggRzIVpZxtCHrCIQnrOz6nJJzpkmmWG4Sjw0Wpzx
         cwsNTy3ZkSZmuqI4v2/JKIF09yHhWoYQqvVcQS6HpevEHFM97ttD2HA3OxQhJiZoKbK9
         2IgRZCSSr75Wm+7z/8l8aBHjIYGySaF92xmliaxi/csroYOiX+9LPj8ym3JzBDQmt5Pm
         vRrQ==
X-Gm-Message-State: AC+VfDxI+iRbB64gP3y98U8WNnoRWLqMHY03Xzp5dnyg7sqsZQ5sdhfs
	zN6zfy4vHim83fbOpOQ8bAhOMynqMPY=
X-Google-Smtp-Source: ACHHUZ4dX03Sg55ejfT9cJiHHoNYx2WJp3ubWpQdDPABsOny8sjRPZqxSpo11QYqh8PeHOscK7GasA==
X-Received: by 2002:a17:902:d2c8:b0:1b2:43a5:a5e5 with SMTP id n8-20020a170902d2c800b001b243a5a5e5mr9683199plc.34.1686630196342;
        Mon, 12 Jun 2023 21:23:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001b20dc1b3c9sm5025847plb.200.2023.06.12.21.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:23:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] sblim-sfcb: Fix build with lld linker
Date: Mon, 12 Jun 2023 21:23:12 -0700
Message-ID: <20230613042312.696835-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613042312.696835-1-raj.khem@gmail.com>
References: <20230613042312.696835-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103255

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 2a89a549d1..a52f3641dd 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -46,6 +46,7 @@ SYSTEMD_SERVICE:${PN} = "sblim-sfcb.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--allow-shlib-undefined ', '', d)}"
 
 EXTRA_OECONF = '--enable-debug \
                 --enable-ssl \
-- 
2.41.0


