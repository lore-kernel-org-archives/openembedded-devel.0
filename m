Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76FAC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 21:16:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2983.1645218974748337908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHEQNJ5O;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d17so3342535pfl.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEz7WdmHHZgy4eIR7Vt8DXkP6cbqEoJq2zf2zjJ0mJs=;
        b=OHEQNJ5O0irA8ddBFyE8SjF1PsPdRN4DpCJgfFFqFLo6gwfUbkg1HotLzFhQKHfNrJ
         +IlxR0KAh9sFYGe3ZQBEeHDZYUvKlkxi6of84MK/DO8deQ+lsctEJsC/Pqkflk35PjL0
         jz7HADl7wmv9xyDPK9HfL+kSwe5cNOOqfu2bvzS/7eIrVUihQAyGnzzYgdnmXdvs19Vw
         TZB4aWiA4CsjrcS43TBdkhV4LB5zMHAzH7mhM3xcj4dpvk3lhxrbQb/RhAofrjbfGi5O
         itZv4YWBLvAwtxoKs04ZtzoJzjCUs9dP9EITJ3jT9zQpc9PtHgFkY8cuQsu7D9NiZh7g
         RWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEz7WdmHHZgy4eIR7Vt8DXkP6cbqEoJq2zf2zjJ0mJs=;
        b=TQEap4v1jbHAfS11xXMYg4kgYbGFCXQvscvfaRVvKdpUoYsbxvbozcrHjwI8wvlLcQ
         9ExPMRDS5E2dYH6mqaIE90eGfmwYrrN2RZNmSpXF/zTkQcx7l6ptFV3CN+DAYRbH/Ues
         zM1AAD72TfqkaIefHEWp2Hl/hBkYoO2/uamUxHQPKSAQ05kQeFKckPYH23jc9JYCwOEg
         4gPlRzLlcUH/2Da90W1vwuyyzXbxccc8NqPTfRPyln2Wnf48ykaSHhM996B5DIlW80OM
         HCUgP2pTjhr/Q5TKuUZKFyeIBivNnK+rX0KlJWUh+Wd7rww+sp59HIMVrABNk/j1wv7k
         yazw==
X-Gm-Message-State: AOAM5323ntmzcXKaPLhYkqlxpvtserJh/Sdf+vcLRqxOa59QfdLaWYeN
	4Ys2wkDeVYi1KNxZlBbcJlskUAIT48hg0Q==
X-Google-Smtp-Source: 
 ABdhPJw/agHF85/VatZsWNtq8z+xek3Xx2aIoTeGXvhPbu67lobMYmi4r8jGyJU72pAaKtgUonRocA==
X-Received: by 2002:a63:2607:0:b0:372:a24f:dde8 with SMTP id
 m7-20020a632607000000b00372a24fdde8mr7656009pgm.225.1645218974027;
        Fri, 18 Feb 2022 13:16:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nu11sm274252pjb.36.2022.02.18.13.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:16:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] pangomm: Upgrade to 2.50.0
Date: Fri, 18 Feb 2022 13:16:08 -0800
Message-Id: <20220218211608.1625215-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218211608.1625215-1-raj.khem@gmail.com>
References: <20220218211608.1625215-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 21:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95385

Changes in 2.50.0 release are here
https://gitlab.gnome.org/GNOME/pangomm/-/commit/cd00ba55a53b71a41fb566827db8b7d7c28c36b6#9f621eb5fd3bcb2fa5c7bd228c9b1ad42edc46c8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pango/{pangomm_2.46.1.bb => pangomm_2.50.0.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.1.bb => pangomm_2.50.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
index 0aa100fa29..e6e84633aa 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
@@ -10,8 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "c885013fe61a4c5117fda395770d507563411c63e49f4a3aced4c9efe34d9975"
-
+SRC_URI[archive.sha256sum] = "a27aa77e017b9afce9e751d85bd1cf890abbb3a58bf59d0fac917eef82db3b5b"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
-- 
2.35.1


