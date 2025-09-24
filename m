Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B1CAC5BD
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11314.1758716947845736326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWm0+vim;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd1so8031063a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716946; x=1759321746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w85tOYFbo1uVa5fvlU6YLOfKq+tsGgnPJrlf3/u/4mg=;
        b=EWm0+vimemZzzfTEmJlNeQ4IiJkpReWPerf7HhuNb3Y1+xPbIDn64ucsGK5vTT1Hse
         OXldbeMfNPSGBRz11dQ84yrdwQYOusTjQy1IfQYZhNAZCkcON88WniCV5DwI/cSj3I0+
         VOPxvZsivrFPmgtTNijYL8vdg06bH1tssfyLac/rNRdFrOd6WvN52jdYzTJGD2btfQvH
         PzqAP5l+jy9z26fLusaBxzW8JcOXAfTRHCx2MsOjrB3OukPt78raWkLXD47B2G9px+Nm
         cVPk/ococstkcik2PglDMEI6vXNafC3qWMe/q7Dqql45LDvMvXTm8qDRpyaZ81OMOQLJ
         HqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716946; x=1759321746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w85tOYFbo1uVa5fvlU6YLOfKq+tsGgnPJrlf3/u/4mg=;
        b=DGVRW8fwJW5OmIYaE9RXsWl+ur0utwx0Gj3KGsyuVI3/2VgSREOdTjnsudilb7WnYn
         lQfPbgymUv6FBYywh8Zr4h2I8Eq4G3kJ8J/zyDIAd2XdBoz0CVthtZ9hjTggCaQ55Df1
         p66laLQNRQR8o/UL6M+zdZ84ebPiZ/k6XWDw9vqcvHw1V5YYMq+bbuXME5N/Vt8p49GR
         gk6/F905cYx/2pARSSJ6ZCHt2xr1Td7vZI8UjQJEv3idzRLRrlE5e770eNpRhlwMQ4m4
         QGNCKFNJylCApFKHrxJAsPKx0V4MkVT3oZ4QboRKi01BzfWeyGvrApFzrajx4++ldrbP
         9fxw==
X-Gm-Message-State: AOJu0Ywsf5rS8Xvu9uHQjLvDOGrru1xJ5rAAFmOSfCwK+1kNP0JgNYX7
	D8q4pwLWuAE0dik16a75BklkpprUbgVvSIzUFDTTeY2Bq9m7iZ89UZvKtg3VdQ==
X-Gm-Gg: ASbGncs48O5akXZka8Zn45qnDmkstyTQQR28fJqAvrRGyNb+9D0laGrRDzGn/A9LLzb
	pAmDnD06PB5gRv3QqZAJ47Z+c3TvAKQ6RRjnoA+i4d4mCUI9XrzyBLgc0UOLfEZiCDtzKjqxYed
	AmxBgBtF81xnJPyktH33vvZEERxhl7Kpa6IS+DixROX4CQ9dIImPahXQpyuYY3fD5JYgyeM9JLz
	qe7tPMaNL2bwga9S2sdrEpM1yWv8RQMJ8124HWD3VQCyFFQMruGphrnbyLsSO2xWnk1y7WsL7IV
	zlagWpJgbeHFtudPsljZh/0EoGyjGTvS5nb+nFITgobnCuRWr7NWSMtj83JjXAPwY42Yb5vjA8U
	ATdXsSGmMP4g7Vr/9f9wh
X-Google-Smtp-Source: AGHT+IGq6OBHbItCspieXm8DUDUbwGLupPzmQm6kAHnU5RN1ao1CFPiq9EFSO1Q+5j4jSA+V+deXBQ==
X-Received: by 2002:a05:6402:1d24:b0:634:5722:cc3f with SMTP id 4fb4d7f45d1cf-6346779876dmr4456949a12.16.1758716946101;
        Wed, 24 Sep 2025 05:29:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.29.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 20/20] yelp-tools: upgrade 42.0 -> 42.1
Date: Wed, 24 Sep 2025 14:28:38 +0200
Message-ID: <20250924122839.4184719-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119823

From: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b0eeb48a28070f75aa16437e599a46ebbb5e2ebf)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
index a5da8590ff..28ba392884 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     yelp-xsl \
 "
 
-SRC_URI[archive.sha256sum] = "2cd43063ffa7262df15dd8d379aa3ea3999d42661f07563f4802daa1149f7df4"
+SRC_URI[archive.sha256sum] = "3e496a4020d4145b99fd508a25fa09336a503a4e8900028421e72c6a4b11f905"
 
 RDEPENDS:${PN} += "python3-core yelp-xsl"
 

