Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9316.1616275428724845080
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=vKoRJPgn;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so9708801wmq.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWEZ62QzGOd6fNot4aghoWvvrXtftqa2NAHNKD3nU4Q=;
        b=vKoRJPgn/Ymf/W6yRDES4kHS/H34RDipMI7mZLVo7GBxZ40bUJBlgRGJt4rNTWsH9S
         VO2f2HseEWllC0pq59BLSHItItUSb+VMgPPEHnXLRAIw64QiKexDiuuInI1ecblqkQMP
         X6K13m5As7k218hHNCpifODLK8SBxOD9EBY134Y5enhF1u4wLB97qDQX6HAVB5CgHyQf
         YSb1VpZCl8vhns6f/YAC8P8LjmLo0xmgO1gJDE2Q6Nheybn/BUAor50QQmnryJDAL0YY
         9A33kezMx2/G9/ndXGcz2GAgackiJtu7GsSJd/NohosxyqbqSY7P8AsNIRUSp9HEdVhF
         wHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWEZ62QzGOd6fNot4aghoWvvrXtftqa2NAHNKD3nU4Q=;
        b=ZYgBmPEdrEyjKA2H2a790fZyMMX41lQkIuV72pggTw3sghRix2fI9d1gWXc1r9nzpn
         JfirjtbWQLH06/67fz3ljrJeVOo5iy9zjjs39YD3KWZ17wzG7BfMC6lcsyhtrlXi2hBQ
         vIrC5saMq5Mk+RL2VqcI/PuEj1rcZJ+hWPmLOPcL9v3rdcbVxHfHNNxRyoRfNdruw4zF
         RutAVLOnLa3J0dyYGA8AprRLhKeydLqc/e9Lo5RCsHbbxy8UV16zEesZbSaelBdTgcoC
         tR/pIRD/nCqdHC3Ey3fW1H03flMTxaeYjXN6XIOJJlI3iUynqKVm+lzA1+dFZq513wjH
         j8Rw==
X-Gm-Message-State: AOAM530ryDpGua88aoeo0OU5BP+i7oTmlBp1gVZ8TYdDDU0Qn/ORq4I3
	urUS/iIYs3B0r7yAB0L99UaeZuvRA5gvdA==
X-Google-Smtp-Source: ABdhPJzqGUSRNrir552sve4/a9KERoVkKtnffLEsbb7M4j6XFZB36M6oJnEp0kRr92IFgSH6kkXSOw==
X-Received: by 2002:a05:600c:204a:: with SMTP id p10mr8462914wmg.55.1616275427266;
        Sat, 20 Mar 2021 14:23:47 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm11308962wmq.47.2021.03.20.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:23:47 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 2/4] python3-wpa-supplicant: add runtime dependencies
Date: Sat, 20 Mar 2021 22:23:07 +0100
Message-Id: <20210320212309.11310-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210320212309.11310-1-brgl@bgdev.pl>
References: <20210320212309.11310-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds missing runtime dependencies for python3-wpa-supplicant.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index a62ccb72f..9a2e3f3bc 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045
 PYPI_PACKAGE = "wpa_supplicant"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-twisted python3-click python3-txdbus"
-- 
2.30.1

