Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756C4C3DA40
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:13:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.48424.1691773989135907199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 10:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KfFMXajM;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68783b2e40bso1694910b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691773988; x=1692378788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/LY8qOj9KY/sF4cLfRxRipiADSabMeJDKK2wWysip4=;
        b=KfFMXajME9SPK1p76U1ZecgXdhwEeKoqRWX8OuAC9bvh0RKWRZcDezjnbmyHLJgeae
         lmmogCpB2QD5Bmx9ZdAis9J1K0+o1wkAQdRp7UNYQFsyem4i3epGrggMCqrI1VDDwEJA
         NQB4LhIC++pn0vJW7egciN8ePQl55DHXObgpbNnbzf50LfDCbrYDvoiCuCRyfzt5Asf7
         dmy0fQjE/Bz+IdITCXjiV914MMQbKNbZL4qYi0kbcpdHU3WUBqpMuAgcAVoz3iuKj7uO
         6h58Lv2kmweRVf91+J7Hhd1oMs66+0YA8+6iK17PZf5EMwtGJsfUAD16GJ/Gt23qGXY+
         8EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691773988; x=1692378788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/LY8qOj9KY/sF4cLfRxRipiADSabMeJDKK2wWysip4=;
        b=cQQM2SpdirGgZdm7zIp27T0p7DthbEXKyMijrHYLDcp7o1EDjSJRk98pojD21MOHYo
         9X51lYWGjgeKQDdbYvkB78Ev/Y6FlgZqprO8PIb7xsh10VCwbpdGezGKDO1QzVLM/wwh
         LeY0s7ov/sNbbCm11KAJDDlCZAaGfQ52Ie358nLRls9g1mRlceB6JLZDEZ9+VO+DYpnx
         MBH1uQ4n4LvilDDcaNhCFf8J9BqH96IVoCZTobUm4opn3I7meXdz7Or3Jrq/8/STxrSG
         z/KOtnaXDHcWBg5mp7BGmfGqGl6tf6I58bK2OWnrCphxAPeg3UNE7VSiXjEJLqZxOhOL
         GY1w==
X-Gm-Message-State: AOJu0YzRBJaJnGm+finqXMD04SQ1C4cxddam9wsT5vN/5rvNEZ9xLZXC
	qK68GeU4BfAc+Gw/Ix0dvtoCDgNSd+SUKg==
X-Google-Smtp-Source: AGHT+IEWuh5UiwrOeRTRObmO0noeOZoNiIIbycGXL74/BolIJmZSb74Rlo1j2saoJAakDZF2T6rOTw==
X-Received: by 2002:a05:6a00:804:b0:675:ef91:7922 with SMTP id m4-20020a056a00080400b00675ef917922mr2979749pfk.4.1691773988380;
        Fri, 11 Aug 2023 10:13:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm3670572pfn.172.2023.08.11.10.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:13:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] libsdl2-ttf: Define SRCREV_FORMAT
Date: Fri, 11 Aug 2023 10:13:04 -0700
Message-ID: <20230811171305.1135317-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811171305.1135317-1-raj.khem@gmail.com>
References: <20230811171305.1135317-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 17:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104343

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
index 7d352f4218..6cd4a48aa8 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
@@ -15,6 +15,8 @@ SRCREV = "89d1692fd8fe91a679bb943d377bfbd709b52c23"
 SRCREV_freetype = "6fc77cee03e078e97afcee0c0e06a2d3274b9a29"
 SRCREV_harfbuzz = "43931e3e596c04044861770b831c8f9452e2d3b0"
 
+SRCREV_FORMAT .= "_freetype_harfbuzz"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
-- 
2.41.0


