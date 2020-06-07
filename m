Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1336.1591500288915902325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QyEY+y4K;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id s88so4524324pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AEdXWCvawc/X6UzxWEXHIrBJT11ITWa873wNEKEb41w=;
        b=QyEY+y4K+Krcfqaiy6lQ8/n+1yY3cuQDcFPcDDzOdeAZ+vTOYNniZ8S0s+q9Ynvr17
         jpvc9GmVXF+qXIIgtiNihQiqBTd+c1FGIpK2T7MuQXjpTfhxPfNrQWL2BeVv25ZmZ9W3
         0T2QScCwhZwnWxMbPBaeg9R7piXDY5RMj4fZfzBDEYFTpprvHYO42yaqs9W2zu7XLOoH
         GM4R2g54Yr2DT3EQyxBelnfimFKnO+/P5g5DuF+o4DQqjUwlZkmQx2RruCvpKpulgNL1
         LamR8Z1YIOllA89rayrPdijJS+zpXrlUxloIPdnXGsD+VmlPXzFZg8dAv70rC8WayrkW
         h6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AEdXWCvawc/X6UzxWEXHIrBJT11ITWa873wNEKEb41w=;
        b=MGcygTmI7RcVaB2ewDrgh+ijbPYBhixsbJ7K8ZCLLgtxOJDIqPhFjj79308DWd8vID
         vZhkxcwG5D+ShQ7ZH27AEh3AaqFCg2pzQvWV3LsZXZznPUnShYWTRvZ/XYVBUZ2PpPv7
         z5zYURIn92YyyGuairD/J9Xlgaq8/47EZtTe4eArh4bW3AhUdKA9RZP050C2hP6LL+Ht
         KArD+NBt5tLAyhBsTVEO0iHMzX6sjAySPhw68BKI06mnUKunjAG2mx36FLxiI/bbJZpu
         TE5cR6/MtnhtXYO9XuY9zNa7EOZNALUKlpPfCp7gFm3BarSwsVJGbUdKG8K5nswxXV7p
         Tb9g==
X-Gm-Message-State: AOAM533n7uhLPfYR/wjvNzdL9XzTKZibZDCKGbV4vVscFC2in3zTlz6V
	TKzna/OIZrSmQ/vy3ZQlIL57IRxT
X-Google-Smtp-Source: ABdhPJzzrmrQNYODJR8VPdqokW+ywsSGB4yj6woP5NJXY9Xhmurr49/s0mhbowiSKwviDNmg139h/w==
X-Received: by 2002:a17:90a:fe83:: with SMTP id co3mr10416617pjb.204.1591500288380;
        Sat, 06 Jun 2020 20:24:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/26] qpdf: fix typo in RDEPENDS
Date: Sat,  6 Jun 2020 20:24:17 -0700
Message-Id: <1f97b33ee11e132f4afc0b25d85d58ccea0b77ec.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7fdf615e571a317645e422ddb9363f491cdbd24)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 3883a8dcf0..600508097b 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf = "1"
 PACKAGES =+ "libqpdf"
 FILES_libqpdf = "${libdir}/libqpdf.so.*"
 
-RDEPEND_${PN} = "libqpdf"
+RDEPENDS_${PN} = "libqpdf"
-- 
2.17.1

