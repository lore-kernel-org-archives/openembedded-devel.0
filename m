Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E8CC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:56:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5205.1785304558108217750
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XjNLwoOC;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so461317a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785304557; x=1785909357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frFKFPi5OBqcPMYNxGlnXyb9hALwex/Cuxq1mVJSo0o=;
        b=XjNLwoOCfseRQr15t5wA4VWIjbgazda0M2a/tNP4QXgyjqHb+BWLYIWiWwru99OZd4
         Nz7zJtockBgZpD1vu/65FGMtgZiZuPtAF9ay5CvjqUvETuBvMo7iItKjX/JJzMPC8U7u
         w5qeaaRv0Y1p1p9Yoe2pmY/sWzRlKxWdr37Out1X1iDC7zr+iYKtaWYyJiKqoBVziB2a
         zOUYlJ0/YTsX+gjvJiXR0RNOGzQtY9orCr6QTMoMQvp8VORNT3DP2cVfOcV3XZX+Ap1y
         dZseqmTE45RjhjLQQRLz2+s740cmcXXz1K6fgdh7TRgxSrq9VRIomz64rOws1sk3kRMi
         DexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304557; x=1785909357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frFKFPi5OBqcPMYNxGlnXyb9hALwex/Cuxq1mVJSo0o=;
        b=GIU9akHG+JGKkyiLqcZungMtrmRq6JrQThQR2WKov/SdSRQ4qpIzUmjIWJPPKLKv7u
         apIVFcmPk9pzQuugNAjlt1ZbA8t3ZVvjHDDnksgQGhu+/BqpzswmYPkquKXLTW83j4vO
         GGds18sXmCdFVRKST+3PJMPKXm7+gJeUMH/pMPn5T0Zf2loaqcHsZK//WCtTBBLjr0ew
         U1GAboIlUngCy2T+klG3mQCTWC7Bg2DwH73u+HUjjIdj+YgsBfe5kLSr7YRNp4VFw1ft
         4qXlay85fps9PRcpmXXPALidOYJUfcrazaKecBqQXsqgDOv6jqp1hEVa9eCnWBebdjyc
         x8ew==
X-Gm-Message-State: AOJu0YwfgF+RcJ7gWmhQy+pjo4O9Liy6pH/vP/T1mDsQcrmPpnHjhyWT
	5VyxXi0PYAcVqo0iqtP916ADdveZv8OWpy4hbMdrqHU2YzwISF7hGxaPEblM3lMz
X-Gm-Gg: AR+sD12BItrIlGD2kwCqvcLY0Y5xtVG0TLZyHRk4e/lFFY+GZlwL8zw6LESUVNWh3to
	GfsV0uDfjK8DFvY6MDyu3bCUaOeRz+Zsvf7HYq40vCiSrDHWxIvyy/eg/CFGwiJkSZJDXanNzl3
	mbCKj85RGQCzdl56E7Lbt8P/Dh+mLue7dil2asBsGG78AKhEnZg4l7nKVwUYg663xlzf3QUGcTj
	L85ankNCLvunbSCJ4xKKT7+DQNrafAWBnYLM24wXSl2ypn6MsjoRU74O/AKh5lhIxpbTos4D6YP
	4DECwbYwgewoHbT4ghyh+Dpt6kwdSJND6OD2CJ68Wl9UnyUhUtacWoFCUwTIoSfzlNMKO8AUQo0
	d9sG/HavJIYGC6uZxwbVQDXJraQbcLskj+A4V/cl5nekk2MHl0fTNM7m+s+BViDp+/eqRYHEFbQ
	4liQkev42iMRPFms7cnDPYLmlwWXR1LDjF12TW9DWC0Feew3qc/RQvMT77zN+YY4XhlxSsPDFmW
	lAEKTAvNOranHXTBeZGeI6FMynOxsDwpt5gEoyBK+F/yhiFX1jnO1v2GA4I69WGsQS4ChjgBv62
	CyKRPOkxrUfuXUTea1pnxJk94osIYXoSWgdtMwsSjXwYMDB1I8uk1yS9MJVjgoM349q79BZemU2
	Dkhg=
X-Received: by 2002:a17:90b:5150:b0:38e:21da:9257 with SMTP id 98e67ed59e1d1-38f6a447a10mr5868291a91.37.1785304557420;
        Tue, 28 Jul 2026 22:55:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm5885830eec.19.2026.07.28.22.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:55:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/2] python3-black: Extend to native and nativesdk
Date: Tue, 28 Jul 2026 22:55:52 -0700
Message-ID: <20260729055553.3633678-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128542

From: Khem Raj <raj.khem@gmail.com>

python3-pytest-examples is built for native and nativesdk and RDEPENDS on
python3-black, but black itself was never extended, so parsing universe warns:

  WARNING: Nothing RPROVIDES 'nativesdk-python3-black' (but
  virtual:nativesdk:...python3-pytest-examples_0.0.18.bb RDEPENDS on or
  otherwise requires it)
  WARNING: Nothing RPROVIDES 'python3-black-native' (but
  virtual:native:...python3-pytest-examples_0.0.18.bb RDEPENDS on or
  otherwise requires it)

and both python3-pytest-examples-native and nativesdk-python3-pytest-examples
end up unbuildable and get dropped.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-black_26.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-black_26.5.1.bb b/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
index 00f027ea85..22f6deaac9 100644
--- a/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
@@ -24,3 +24,5 @@ RDEPENDS:${PN} = " \
     python3-typing-extensions \
     python3-pytokens \
 "
+
+BBCLASSEXTEND = "native nativesdk"

