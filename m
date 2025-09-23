Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B2CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:42:52 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3922.1758649363190665788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQOREXos;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07e3a77b72so20666966b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649361; x=1759254161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sB7/MYNi8mo/N7hIM1RbTWSLdL0q8w2rPAvPTR4k+7A=;
        b=aQOREXos0KwVkTE9qCiRuVnwQLv57f+AxWOjs/XXwsxgr48nD5rWhaMUAvnD3lYU0u
         Ks5TWF/8em1yOGkVe5dRDd55I90sLGzhH9p9jZ0HuqjNle9A3h9scfTRQrq0NfhE/EAT
         lTd2U/SNA4/LddpUwRdmCvcf0dIFTKA2sHGO3lmK1LN5Aag1O+/4vVVTVMSGbE4dP6vq
         0w8SwB5Y+9LD5hdz7A9lPBxy7/XIaJl1DBrHzAqpy0uQCK/BsQeMeILg01n2CJSTFhPB
         kiaOCT91jUp6/laOpVDfsi+SU9ou90v86StDi/yfzrdQnU8mTDv1aO1QMa5vUzDOb2Bs
         JnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649361; x=1759254161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sB7/MYNi8mo/N7hIM1RbTWSLdL0q8w2rPAvPTR4k+7A=;
        b=lsjP4C6eOuA4PfoJeOMJOq23VYYfEQPh96czxQzXqQKyn4OIxMbf4fEev0CA3lcIv7
         SKo4tZRuWpLfUt7DXtXU8DFP/Qcfhe10Z0EbiuqZn0XCfp89Gp3TU+AVYa28jjMHFMIJ
         3EF+fCmjjXBp3wITvysbAFFT1bgfu75J1XIQXvO62sG+qGlBy7Kjf1EOmxQpizVr70s2
         AI72Eoo519nkztn8pqhKS+J15XMUTntUbtcLxULXB28rQPg+AoPRIGlfrlK/Tk6QFZtN
         qMvp05WeLQCyr26Q5D1aM57YOsppxLH0xI9Lv5yVDYbGGqQLBgNjXHvzeVhU+69tpLMV
         izwg==
X-Gm-Message-State: AOJu0YyFCSn0/mBl4Ofp3nmdCA/H2DxOt0Cy4TwRKFxw3ng1CuLrKUww
	tGiu+kgO53usICFwACXUvEbSQd3oOvLkOCIlaZfCMRKconwjn11JcQBvvt+hn0wB
X-Gm-Gg: ASbGncv/mWMHmxGYkvTaDccbHxnj2dtEEEu+/y+NUMNKi16HJowwYmy5KP6TxXbc7qv
	6TO8V0KZvhUSRB+ZOyQt73YrmY7SchRU8APYih2WQzPcmRs2IWro2tphBupZqHA24EV0WPt4Ndr
	NX17OhgZwzzQM6Ac5i5Fjh+18fVEoYtVq7sw+KMXSmRl3kjDclva/ctzpEGmQfZAw/bMqHweSL0
	sGeWkNC4aVKjD89Ag0J7lEwamhmQsjpCGtBHmghNn0gRNDhlrsezolxtHzOM11tLhBHkRsgVvpg
	iQGKlofJ5r/m4JvVQhD3Y32OAFN4XTNlHThmo7Pd8EjSd5/hrJ5WAzRUc2FSwis8TAu+v0twf1O
	8ihTfIppCxNfBvEpGjE2A
X-Google-Smtp-Source: AGHT+IEu4rLCFiicHXGsPoXIcKP1xIFP4yQcnfT12xx0DHlEX92jrQNWQhxvvY0sA8IDFzVtAqWH6A==
X-Received: by 2002:a17:907:60d6:b0:b0b:5d7f:6ae4 with SMTP id a640c23a62f3a-b301919b1dcmr339757066b.8.1758649361424;
        Tue, 23 Sep 2025 10:42:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6316acdfe14sm7073589a12.52.2025.09.23.10.42.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:42:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tokyocabinet: fix license
Date: Tue, 23 Sep 2025 19:42:40 +0200
Message-ID: <20250923174240.2284993-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119723

The application is distributed under the LGPL license, not GPL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index a7c10128b3..d0ed6013f7 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -12,7 +12,7 @@ Records are organized in hash table, B+ tree, or fixed-length array."
 
 HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \

