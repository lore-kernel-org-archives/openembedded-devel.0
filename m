Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757A8EF5852
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 18:49:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11753.1771094939042219452
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Feb 2026 10:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECYscK0B;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48378136adcso8079695e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 10:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771094937; x=1771699737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vck+Jo0MKnyPONLKl1BDf5+XcE/uk4RVH9UwLMJ5IAg=;
        b=ECYscK0BCJQMUBbGolmMKrWYnwmXNHearxEgcvIGyl0fgWRRj302pt0I9tkccT/wC8
         Rb7bcNo49O5bgCwz34D/W6ptBCj+b9yK5yImazcMY6W2U6rYhhea6lU/ESW24x6kLfJx
         anK9LU08cmbyExvDv28hshg39NiLT0JkZXA7GPApXR4M+ywzHR06k/jmsrlKGbpHmROa
         uv5ajCf9ZCxon7w4aIFDgk/XyFZ35ZfutllT/Gsdw/mogyF0MDBFJOcY+ZzWZ4XsC3Ms
         TZNL6WEvEeE0gIo79Izjb1nz+QA+7ciMiHylqV9a3OYnyhU+BMUtZ1C2EwOMVEe+D6uN
         BVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771094937; x=1771699737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vck+Jo0MKnyPONLKl1BDf5+XcE/uk4RVH9UwLMJ5IAg=;
        b=Jbuo0jqCzDxbpDH4V+6szDnsHh+sKAGsi3+mulQ5JdubmTUpSIG3D0lJuZ3nLiLBRJ
         6r3BOBBZUQ9R7tuQLnCH3mZflg/f5NId7auF+HR69tPHSC7FgaZKikeE2Swzt/Zrijoq
         zVFcfmffmdT3QR3GsMnH/MWb3S2mdHGmwaF+W+tH6/keOtLhGhnbwLQXnGtKGz56sVRk
         vILVO5I6WIfMAoe+a8ceIkO7yGHYrd6ljVy/caDSNgQdY634O5gNKswSmTKMp+JsDMPO
         CxVqeA9gIW5nm8ksfoHC3ga3gz+aQtYrZlFYnyCqYZX1yyjMrO2FHzN+gk0DbfOmLU7O
         v/dg==
X-Gm-Message-State: AOJu0Yy8TF09TuggOFBFNKwUrnzUkqVNK2DI8vOnmV9yr2iI24XohOXX
	bDACnwe38RrOpwW7EbqZ153acsuKKlEnnRvKOMWk9F221kDBBch03BWnklMn2Q==
X-Gm-Gg: AZuq6aIMAcRcIHjXJzUTLiNiZu9Mrwm+AuAOW0Wgxtv6Ru9wSVPG+arfylm6LbPdnmh
	otZTwAxvmCP/EsDQeGrUAQp2+JEnfEK1Yx9xFZAVSGDey1AQiReFxSx/5nDbbZsvetE8x9xIRtg
	pkHa3jooAe1EKm9sDHDqgYDgMrts74hVnTHYO2pozPIAAZ9anqlBRBk3aGqx2whrQq8kKO03CnR
	utL8r18+tqfLlXLeknTtj3f1JbC+1x8Xk/a9/lYNbCoxQ3LL261GuEYy0I/b4WfGq9zlT57mNAG
	pYRUeb0wJTwuoKb0S0/w3sLJXrNhKhn+Xi6v8Lf/gMZJ8Lx/Q2VWk1xG46Oxk2mIsw4P2sq0Onl
	/0+uDoU8pXrgCIJ8y5WwzAf4dQn1Ks+kPsxiS6Y1VaLmj8znTcSYEvOjyCW0iDr1JXOn6/4dHg4
	Cd+pBM/b9pHDXpLeSu+vhR
X-Received: by 2002:a05:600c:a44:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-48379bbc51bmr59920245e9.10.1771094937231;
        Sat, 14 Feb 2026 10:48:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a2998fsm43873025e9.17.2026.02.14.10.48.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:48:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ttf-sazanami: fix SRC_URI
Date: Sat, 14 Feb 2026 19:48:56 +0100
Message-ID: <20260214184856.99928-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 18:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124403

The original SRC_URI became inaccessible a while ago. Switch to a working source.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index b72307519c..e14a85b92c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 
 RPROVIDES:${PN} = "virtual-japanese-font"
 
-SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/sazanami-fonts/sazanami-20040629.tar.bz2/ceef10579a75c92483171f3bd7f77df2/sazanami-20040629.tar.bz2"
 S = "${UNPACKDIR}/sazanami-20040629"
 
 PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"

