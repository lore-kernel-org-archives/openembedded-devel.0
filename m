Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCEC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:48:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.20710.1751986092074078363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMNfEOsh;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453066fad06so31624545e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986089; x=1752590889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwEAkuUjA/J02OEi75cf6OQ52GTx4hAV/7cxN1Eg7D8=;
        b=CMNfEOsh2wrV6x8WgXSxKJVNHnQdklW7Nsn2UcqFmiz0wej3tWvAIp6NvGeGj0laqR
         1YuEGVvKCRsrSqn4yquWITkuhlR/AruYe8QWQCNuDdAbVWMgIVPwxB8Pp1Br+wSwz0qF
         dYVaJ+RcmBtCJkysCNeTbU3zolaDbo40h0KlnMftzmmXqvV6jhY1uKX0gO+RKbo4s+ys
         KgTPxuIU5UPzFvjWu2YGaJVlT4WY5E+UbDDNKWMuAo8fCXSrzCxI72z3AJ9C1vDyFJRE
         S5N6hthCqY71vqHpgKOcxOD/0gLpsm9BS6kspUfrJHAAlQZ9v36fy3Ms9v254XPYE7yg
         i2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986089; x=1752590889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwEAkuUjA/J02OEi75cf6OQ52GTx4hAV/7cxN1Eg7D8=;
        b=jHSimPEKD0AVcXEbZJRVTfzm9LaiYDdDOJ1n/Qei9h59woBrDk+042HIuB6bMn7HOw
         kXPBg87ezHMTSNo79r3FvA4jlTSW8oE3pd9750OpHjxwU7HxTmMjKxl5NCnB24hECTF7
         lLsgwSAOoCbL0Lz0tzGCAZgZ4oOVptPicsmbqsJ/PdUcOVLL1N36cXU6xrZDqodCUnSQ
         8LKw2JQlsZjBknogndnfNVrNbNxCirgnPi84ZFiCVHOoRsqn5q0lkIdrAogGH7aKu2GY
         aunYWbOVcmgW8FkFpZ1sG7ch65a8w16kyivjBnJKr1xIQeGwed5TMr5tQbMWCNJE1bHJ
         GEUg==
X-Gm-Message-State: AOJu0YxuaCcssEaigG/hSA+lvDLUYmpqMJD8SHxxcveMIs8I98yHtoD2
	hYgnewdbNIwMNhw8DN6SP1ZutBjdUSRYqLUpF5GxucPBRY2odogvzpyyAtRZaw==
X-Gm-Gg: ASbGncuUQWAH0qFpg1kuzdDphggyWBPpAO8BMobveGe/CcrEsJaeXhHC5YqMdjcL8ib
	qoai9k2C3049NqSFThfjdb3M+k4yigURO2uklzbhV5SpU3FX7sdgx5gm4QRCKIBwMs/8hkPTLkU
	tkJe/RfHyvCIgPkIY7pQrXTW/7S703zhWlVWM4YaSErFQsRxKPg80EWzL6aFJpWv8qxxAG2p58m
	RRd6p9IfosS1BQcVNGK+k/zEU8sY1r70kzkLuQCnl/2OLSP0UgVfS+m6YwEW4nkOIt5kPWtJd5L
	LcB/TjQWP+g8vEenEghhvub/7CJpLijtR5jT8+Xer1Iy5gTngsOgyuBDPH7ixn9hvZYcrg==
X-Google-Smtp-Source: AGHT+IF1kJL/WTuL4wKHT35YQpkktSWFuK5r79Ec0UjcwmXE9nxtlGpLDStD9ZVtbRCLMlIcn1tNZg==
X-Received: by 2002:a05:600c:1c08:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-454cd4ba879mr33487575e9.5.1751986089207;
        Tue, 08 Jul 2025 07:48:09 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd49d0e0sm24628085e9.28.2025.07.08.07.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:48:08 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [meta-oe][PATCH] cpp-argparse: added recipe
Date: Tue,  8 Jul 2025 17:48:00 +0300
Message-Id: <20250708144800.286647-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 14:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118313

Added recipe for C++ argparse library

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../cpp-argparse/cpp-argparse_3.2.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb

diff --git a/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
new file mode 100644
index 0000000000..5d7965149f
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Argument Parser for Modern C++"
+HOMEPAGE = "https://github.com/p-ranav/argparse"
+BUGTRACKER = "https://github.com/p-ranav/argparse/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3ed9ec2c801700ac8fda1fcd29a330"
+
+SRCREV = "3eda91b2e1ce7d569f84ba295507c4cd8fd96910"
+SRC_URI = "git://github.com/p-ranav/argparse.git;branch=master;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+EXTRA_OECMAKE = "-DARGPARSE_BUILD_TESTS=OFF"
+
+BBCLASSEXTEND = "native nativesdk"

