Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.2327.1613440713741276364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dLo7Sssq;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k22so4672406pll.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=S+TL1FtmA9qRYr5B93piDFTu4ttAj/hEliIzvohHV4A=;
        b=dLo7SssqnPiouZ7bmM3cPByb983Z+klqZJEQB2pQYkdHlzxkXn5txBuu3LeN1loOsR
         POlQ0eugOeI7GKqtJxpTCCtvEdKerqXsbM3DHXPJvZ2eeSDTBUFpEyj2JzE5n9EXMxmg
         Il5pQpLs52lVcqB9EbcNoEMxJC2llz6wzZRZ9G9vzEr92Uq6VX1rdrmuKc4+et3xp3g8
         7TpJFqqMAVWYd50RumKAAfqhJ58SFP6Wwk+Bif0CZYYdTNe89j6Emgotk5QtmMiRYbMK
         0NiMWHeP0JhYQuwcMdFyK1yy0bTNoUUmSeSzUQmo62dhi+Ddk7AbeVO+PV0VfiaKoNz/
         vE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=S+TL1FtmA9qRYr5B93piDFTu4ttAj/hEliIzvohHV4A=;
        b=Pl45LFOGXCZB4nBD1F+nd4091gWUHMn5d5lnvsUx4p8kU9O0no6Tm3DGbXuwaxkSa1
         N8FOI9nbut+vjr6yReLRtLA972WAdkgMyFxcuzbBfsw3d2F3EUOKXeCZlKvafiWLAIev
         2Q8WshChNwXAJyYPz1igALlJElN5vTr6YIxfW8Q0q21uvqHvJwTKiKgssJEplm38Rs6N
         O82E/nz5L3vLKDRjh5IHh7Ast66yrBzQfTR1n0tZ3KeKWziYVx+jJmf94LlCEAL08jZy
         8jkuLAdiWoq/Ce9a6h2xzwA8kSlsdo5KSMC4I9OR0XRLmaFs4ajSrkOc3DcO7e6X4o6r
         Aowg==
X-Gm-Message-State: AOAM530TR0JemfZ0Lmi0gmdsPNqTH1YE2ET4gsGYCBQDiLinETephW7m
	VYyJGfcrJhEYJ6vJcfJWg1r/ywi7oPeAPg==
X-Google-Smtp-Source: ABdhPJyrm1iblzdC6pONFSDy9RwLiXfbHlGnvYR3imFaDelDf68QJuAL8YaEvHNvwy72ZB4ZHxypJQ==
X-Received: by 2002:a17:90a:657:: with SMTP id q23mr1759574pje.192.1613440713234;
        Mon, 15 Feb 2021 17:58:33 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:33 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/11] python-grpcio-tools: Add missing space for append
Date: Mon, 15 Feb 2021 17:58:19 -0800
Message-Id: <7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 6b3e3bdaf878881bd6dee09ae369e379fd7b8149)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit c3a9e5b9907279043bb7b270e9c6b4e587881d9a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
index 1a15c48de0..6675f904c1 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC tools"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
 
-DEPENDS_append = "${PYTHON_PN}-grpcio"
+DEPENDS_append = " ${PYTHON_PN}-grpcio"
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 LICENSE = "Apache-2.0"
-- 
2.17.1

