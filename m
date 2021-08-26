Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.30382.1629985438931293339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=r9xIRA8I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id y6so5258281lje.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfwqnrBMKLxkFobuK9FfKICs80VoC+mhs9x9+a6dAaM=;
        b=r9xIRA8IoeX4tgIFOF2XE+9mgliRw5mjK7v6MZzYT2/+UVtKuJyTuCMuukSNW5nftC
         c+SBzLnCkoai4GTPjLPegK47IDJOYMF02kQe9zfexKntsLgX1tZpOoQ78VFi5XDEGHOn
         a4Q/3Cn4H0CXiGfxrBPBU22OeKCgPIh4Cusn9sQEMMtBieTktEcQvAR4RL2GNuO8IqRd
         hUiGoNvgppcxJwK+nhKokm/e3iog6uWmdGw50K0E7sU2136mjHNTWF8PBzlQqsLQ99aE
         I44MXDLXoxCZ01p9DwRMdOuwFixJ8/1wvqruzqpgh6qQyuw9rddEau0FW2on2JDHzHVH
         dz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfwqnrBMKLxkFobuK9FfKICs80VoC+mhs9x9+a6dAaM=;
        b=a8/eXXU74x6C4FDfV9NnaoQalsrZHBhFaqA2DKQ/HdYHzwOt/A0th7XlTbzyyQ+zj0
         BYyu9+PZKj14y41FJxDrLPE93Nz2DPChycyd3Ptk/ZlHsI0E2sdEgyb4Vt9aOCIkvmYr
         phhn0H+1AucIPVwIiYuiA1flB/g+T53nWp/Bo120Dg8Z1fa/dpiPZ7eqH0dzwu175dLb
         GZ9LCdPslZ8BrSxsyuOm4fr3m/pEt2TaXgAFu6oj47UBxGehGkaLpkKwrEfN+Y2ClYjN
         f1LCEmjJ+AXJjlGfIj6oCHpv34ZBcfT9xUL1NCDRWw8ZVxvFMvZzSRdI0xQVkw0c06Bc
         +2hw==
X-Gm-Message-State: AOAM531cgtpYrKO1tQ+dJ5SGl8lxgjwjKuL3MACv2IAyPwMVfzUA0+eD
	aWvV6uq7IePyrHtjHY/l6kVvGReCbMcqyKle
X-Google-Smtp-Source: ABdhPJy3ZOFlmPmfxBV5gB/4FMh8OV9E9eTLCuyJNdS2ppKo0hDY1+PfwKdL2eC8zZpav85+gRx+jA==
X-Received: by 2002:a2e:96c7:: with SMTP id d7mr3141746ljj.191.1629985436889;
        Thu, 26 Aug 2021 06:43:56 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id p18sm327571lfr.12.2021.08.26.06.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:43:56 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 3/5] font-bh-100dpi: fix UPSTREAM_CHECK_REGEX
Date: Thu, 26 Aug 2021 15:43:25 +0200
Message-Id: <20210826134327.2535535-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
References: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'-100dpi' is part of the package name, not version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index 67ebccd02..5d321acc6 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -10,6 +10,8 @@ DEPENDS += "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"
 
+UPSTREAM_CHECK_REGEX = "font\-bh\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1

