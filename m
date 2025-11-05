Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B08ECCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:27:09 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21032.1762378022888900188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9i2aCwq;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7291af7190so3643066b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378021; x=1762982821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kn1EePeWENkBnTfs0kTm6MT0y6selASxt1ppPcM5PV4=;
        b=d9i2aCwqiKq5t89nSr0dR9xgqAd92kSGdeiPhqfLe5iL4oQueAw1Xx5TgcOLYKgOGQ
         ceLIbwb0XUbXuFCoqiero7KECDqzckdaGxGDeWmGnJnQiOEVdsWWfb+rDIc/BA7VbT0d
         TeEu2L8Zih4uo8rbclJOyG/bjYllUTu3Fra0fxsdoOcU/AAlEGgJG2Mb3e2lXdfIkwTM
         YYW6Rjbjr1mu4E1d2ABsNae71Cxcbl/rAUc37wBKmvj5RZaHM8bEVoQMoYVPfSmYlVz/
         aDhHHIZeTDgCzQKpKJRYtQPk2flQ4C8BgpHInt76aqhw3Y3ys7hH3RqmHzp04PWEkrUT
         Em5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378021; x=1762982821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn1EePeWENkBnTfs0kTm6MT0y6selASxt1ppPcM5PV4=;
        b=uA0773HEx9v72Fxj6+KAxvvmYgnnMvKErKFpv+Q5EGdtH3/nBXc6Jna8k1Lnq5rozp
         0KuGq/4pM6ka5F76U/spybP7xFputlF6pT9ih9V2S0K6fcRDu3n6tBidyeUiSME7UbAW
         qcb19O1rf1xod0Q4zDKXAeWs/c2d85KEoIKWg+cX/ahJzJv7+ueBgzma/oFcp8h0/ulf
         Qr2JcXfMjEQHI3T7Kl2tV2pnO6ElPHu7KZl1yx+gPXY4fL33+g6JOgHztWjcyCn77TPL
         PZINEFcscuGH9AmYVEOirMhVwoMOfg940h+xf4DjXBj2SamtIy/i3akbZFzIYVPgtsqq
         oBrw==
X-Gm-Message-State: AOJu0YxFis5k9sUbaqS4GnklH3Wadxn6hkd30+uDw/jPM314b+Nqry8X
	oA9jcnSxuFlddpS8tpJvwGLeOr7lvbrFSx0jfgLId9iMKRtAWpkwmgOGCsONrSiw
X-Gm-Gg: ASbGnctO/6LRLDYSu5CFmKFkWR9IfKfI3OQ4Ae9M/lk5uRDXkqogSI5S0DRwJEeoVLp
	7rCI5sIcQpxuXQH//IPgnkYhPkskScvCz8nfnX9kcQVVSF2U1N1e1vggvuK27SriUpfd/L7T9Kx
	WJ5E5sX6mnRNlYxCcYeUZGi4hkktFAavNCvdOayljMRQgLP1JvC7KlYoF/6X6KBwRxvMp5vXpH6
	4UgdFSJAigxtx+d9qKVBn0rkCIAwIIu4beIOwMa9+IPoBnaTbBBI5O3Xx5U9EP+vvDHqVKbzhjb
	k/Sl9aLoFJ4m0YmC4L967PnMaKnRXHZePyFEh5N9bx+7YFQqbc4nujo5JHIiojweb/isrACbZlQ
	e/oKR+8mNw7EllHI6zgQNjTC+YA5Qp6DGHriAlpH7R+GEggtsrhBL2qBuU6QmNOZ4Z/kxbNqOyd
	8S5cNtGMG4lFHv1ZNfplsvd1SqjiZftw1iazIrBO99ePSIg15nQSnHg9w4Z+1hkkee3v3Un0f0F
	Ygr/mDS6zHYjcIwOosJHWpt
X-Google-Smtp-Source: AGHT+IEKvJdgvf3gn0ZyYwMyVofabl3RPdAbKFx9z9Lvnoyta0VSj4M1vs1CEIFXdZEyvcgF++we7A==
X-Received: by 2002:a17:907:d8a:b0:b70:acd7:2049 with SMTP id a640c23a62f3a-b72652beb49mr468088566b.25.1762378020735;
        Wed, 05 Nov 2025 13:27:00 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:27:00 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/8] python3-requests-toolbelt: add BBCLASSEXTEND: native nativesdk
Date: Wed,  5 Nov 2025 22:26:25 +0100
Message-ID: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121330

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index 8956dee1f1..f74f967bc1 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -32,3 +32,5 @@ do_install_ptest:append() {
 	# downloaded file is not supported
 	rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


