Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.300.1591714697339428599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=J3npISyu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.49, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qv1-f49.google.com with SMTP id x16so4513701qvr.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :organization:content-transfer-encoding;
        bh=+YZNh++KQvRLT0u8ops/rKgT+dd4Ij8VLiisk8cWQxQ=;
        b=J3npISyuTR5irCO0fHiOFIvvxal24Bf1rXdZCtBdPNWel/9U/boNLJdqpi1XXFmH9+
         mMkpI+BXM2MQwXpPn3xufiEy17zJpdkWKmljD1bLHgkv43ni1AsZPQtsiHGqZOUOMlqQ
         saDAGfilgTAVsO6stoSkq5E4p1P0+uvndc9n62qTnWUVHB9nr3LaYDaRxAkBSZRKFwic
         Y3aK5ZSPLoJr+fAFjvryYLPkwPiFCkeudkJ8eey86x2Il9Oejwsps7eIklXGhwkauaAV
         CTs23WmNVxnP6IpU8sZ0mroYnpR3DNHagQ1WSOOlcaEU7X4S986TLxIE+oqsFYIWeEzT
         2L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=+YZNh++KQvRLT0u8ops/rKgT+dd4Ij8VLiisk8cWQxQ=;
        b=jELz4DgvvRGRs2tA9kYCZnY3q4mkTaAPsX8engaY0XKNRtMrXmQPOOZrmnZJ/PUmn4
         +gMBaPWuhbr2cKe4o9aoGG5UvDuO0bthqSW6ETC/9F9GIf/CXFWf4c3q9F7inkiBhZYp
         DR2SiLzqDPESXsqITBQd38u+Tgk1WRN487T70lqiD5nzPr3mn+kkqGt5OSyh1hsJgdd/
         OaCWBHkET+OdN0P1J1e9v2XrkyexAn1Ws7bT8fGRWXReSI0vvqB4q9iFv4iFSmNRCO2O
         BsyCKYbKGq/Lc783jvHe9gsuopD9t8aqxCI3c0aHp7of1xOxFiHtvb/qnqzNmU3L9p7M
         E9EQ==
X-Gm-Message-State: AOAM530VBegOGQFIzTIT0HUM3BvEeArBSo02tBJgIbXHULScy+/jEtr7
	WTGyJwUNTw6QoUvYoLxAox4St1zRdxc=
X-Google-Smtp-Source: ABdhPJw/eGNQzByNAbcZ9AEoc9/zUXQ57+u+qusNkuGzuWo+X4UpSIHLdCLfxNNOwmZ5HJBIbAVpNw==
X-Received: by 2002:a05:6214:313:: with SMTP id i19mr4375771qvu.183.1591714696158;
        Tue, 09 Jun 2020 07:58:16 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from pikachu.lab.ossystems ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id j5sm10557995qtr.73.2020.06.09.07.58.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:58:15 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 2/2] openjdk-8-native: Build cups-native when using cups packageconfig
Date: Tue,  9 Jun 2020 11:58:10 -0300
Message-Id: <20200609145810.4058137-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
References: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-core/openjdk/openjdk-8-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index f6d617a..24b6f20 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -8,8 +8,8 @@ DEPENDS = "\
 "
 
 PACKAGECONFIG ??= "gif jpeg png zlib"
-PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native libxtst-native"
+PACKAGECONFIG[cups] = "--with-cups,,cups-native"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
 PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
-- 
2.26.2

