Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8718C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3033.1785293070947176687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pzakNTMe;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso253345a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293070; x=1785897870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pi5R4UAZ4o4qnHz4V8G2kheYDliVPWb8h8HzkIy4VCk=;
        b=pzakNTMePux/mCkgFg+Tg3yXI6grRM97Mso5U2rMYohwh5PczkM+kOFSyMS30XOEfH
         OtVY7HJ35etNDdFgaH8OhlJodsqcP+nxJ18gwoN7pDjRSF64QCViPUjMrAuZlamndBWZ
         V3T0NHrbsxpG43HFRr6w74/+DUlPyWvHDEtlS61iO2IjIeG2nfzkstW5wWwM232Hxo/Q
         h/fe2YxycP5/PrY/MO7oQfOMViPgvX7sszMRWIGeNX3WJ2m5b9xw2dThWS+1i86vyQ/c
         792TNF9LC9NrQvN/6kbCsJlBdjnolb25QlvVLn8vLV/g7nina/Hrah+iPpUBp1lMoHjP
         4E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293070; x=1785897870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pi5R4UAZ4o4qnHz4V8G2kheYDliVPWb8h8HzkIy4VCk=;
        b=GIR8N5+lTQIPzF/D4FstqpR1PQywXSe/oU5BAiTlRm9rXBsgyAZMDffvhOW9GHXi1I
         KKuGUIn0JeOLRvlZb5ipPVVksphQAj50Iq8Y5egoi5mfQ1w0eSp6f8H2CQhkssjIWVED
         zcPN9VmlL3m7Ew6d8gaH2eRrHKrRk54HGYsIw9I3YXiKndCs6M9op8lulWjn9q1SnwqB
         GRu2wZmz+hd6WgCV6tF3GkQbh0ie0fHiWrzigSrBpBiJ3y4/U9ty1CwGKmw2X0rLctyB
         uroRGXHsbLValoATgtIwD4+5sByIjje4t2dzs4xeMNlTN+HTy1LreQJDbPzTXCRAVdfx
         i3aw==
X-Gm-Message-State: AOJu0YwmZAo6u0j9lAmkgdHPNokbluUsls+yIMmeHxmU8H59lmoSA+81
	NESjh5T04SjH4RpBNVq24+Z8MbtK0/jo+HOdZhZT3f61Wdy2haAj9bwOZrkQ6rch
X-Gm-Gg: AR+sD12IRtl2Wmyv6a8maa7sQj8GaZsuCXpTWXp9X7wQDxC+rcVQ+geMP3YRtgu8rOS
	OBGy+EuMBslztw1QoygQd/9AxSTSdILgtxFZo39PfoJkFRugXZt1GIId1ez/eqsgEBUMctlgM+H
	98z0TtUgs2CHxBqLjrkjwqhxqjx0LvWUevUgY86d/Bp/lvP5zl6v+6BUv5XMQqIosSVOE/U9ntY
	nSlF4rCtWsKr5bAnS1ozSFgJPWwmFcRerL6cE9AqT+TFG+Htk2OF9Tx4RaIu9rA1NDHYe1Zio10
	0FaGrosAVwtjy0DbxQVfuqjNUIbWmf2Cb3Ex11XFRIvZrgRN0hApPP3ljsrVsBmq9ES9zSr9maS
	dyTilcnLofGxC2J6iN4G4D8CRTj48IrQ7TCunPCoeCAUzT5cxNaoLmgIdZnqMgDhUilMi6wZAC/
	QbWFNhQ10wluRDhWMBuOEfZ2C9AP2jp1I/0BAckDTxx69m7elqpvn8rPOecrEvX5EHLXlxlbqML
	mWF0o3ijq0PGsOhgYH+x6dUQFqf2npxgLzyzVn2SfjhMpCM62DatwtBae+FfGBgWCT6+R9D3/vF
	V1uT5TarEcgI+/oLILktIiExGs4WcVD0X1ZVq5cgJazqz+EMaTe199ml9hSm8LTohw8B9BGAPoQ
	vQA==
X-Received: by 2002:a05:6a21:6b8c:b0:3c3:652c:664e with SMTP id adf61e73a8af0-3c8ba668fa5mr6050116637.69.1785293070305;
        Tue, 28 Jul 2026 19:44:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/18] xmlsec1: upgrade 1.3.11 -> 1.3.12
Date: Tue, 28 Jul 2026 19:44:09 -0700
Message-ID: <20260729024420.2328180-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128523

Changes:
- xmlsec-openssl: add experimental ML-KEM support.
- xmlsec-nss: add SHA3 support.
- xmlsec-gnutls: add RSA-OAEP (SHA-256 / SHA-384 / SHA-512) support.
- xmlsec-core: add --transform-max-depth to control the maximum transform
  execution depth (0 disables the depth check).
- Several other small fixes.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xmlsec1/{xmlsec1_1.3.11.bb => xmlsec1_1.3.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.11.bb => xmlsec1_1.3.12.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb
index dfdd7d5572..b46e76a24d 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "53675e98fa83b48201d24f7bfbcaeaa1b51496b8b19ff969785856bdeb196af3"
+SRC_URI[sha256sum] = "24045199af12d93fe5fdbbbf7e386e823e4842071e9432e2b90ac108b889a923"
 
 UPSTREAM_CHECK_URI = "https://github.com/lsh123/xmlsec/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

