Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.253.1617899798796371613
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o1M7jAkM;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id d12so2760760oiw.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/6e5xrg6hJvfPUprSNxILMnq84qLpKGSPfxg09pjTM0=;
        b=o1M7jAkMtM2GkCw/W8xq4D96jyy4lSrsJF+KaoCQpTwGiZeqlk9ORsUdVAWnaMiKGC
         ZMaL4eGENjzPSpBog9VPCryC2CuwHjy8iDW54egkeDpwwft/c0J9Na5HerE7n86H+7eq
         pwHZDtRHNsKGiMvlzMBVri/I2dykUJZ9OYVI3P/44w8THd/FdghF3ciCq8tBb62gW9Ph
         VY+wwdw3AKMgZjYCkKdbeEMhGxgShSJfJAX+zGR2zaJHYq23lTcR7x12ctWy+IJrEaox
         zMBUh7vWk4hdAPE+TTe2J8+J/Uy4O1HHzBbKT5kovEfeHLZI2fIOotTD4G6PqN8kphcJ
         Npaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/6e5xrg6hJvfPUprSNxILMnq84qLpKGSPfxg09pjTM0=;
        b=d7FwFo02fCS2yb7127FW1LFeER2x8aKRoOs+fG1nmJTHBtA3wTo630HlJWEOyvYkPn
         vHSEEiO2b8CDRnuLw0PJ229d5VvfXMrgKTMnB4xBN+ig+I+yAJ5UxyxBpmDaGMOsKOkF
         OaS3XBTg1p0YHYRl6JF513+NdbZWi+BAunrilMZgI6pFeLta1Zs8udBkUlTdUhyu1WXK
         HBFP8HzSHGzjaaVOHdhM4FP634+lsPp8nLoZ/WadxXtFYX4rfjtWpkIDWoqPnvyymI5Y
         5aE7hyLNMrht0XRJbU8agXY/KriWT21+MlMwgJ6dWowZw33DMESEB9tzFoIvQZNpvrqM
         3/bQ==
X-Gm-Message-State: AOAM5310vTUwdmbrag8eUhsN8EUx87wvflUJyQwH27TFeKa4KtJR5rdq
	Nu0kgFsE6AtfR6p5htW79U97W9tRB6I=
X-Google-Smtp-Source: ABdhPJyxhpFwAhAdvR+AKwUJ+cHlBrAxhU/JtkAVwMibqS3iZ0inCSvn0i143VZg2aPI6DBBOtQvyQ==
X-Received: by 2002:aca:eb8c:: with SMTP id j134mr6815101oih.3.1617899797934;
        Thu, 08 Apr 2021 09:36:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 27/64] lldpd: upgrade 1.0.4 -> 1.0.8
Date: Thu,  8 Apr 2021 09:35:34 -0700
Message-Id: <d63cab7c0b678cd325359557f479170a1aa3629b.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55669e9214f3213ade48896e7cfe72396cb1e795)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.4.bb => lldpd_1.0.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.4.bb => lldpd_1.0.8.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index 8fdaf848ff2..bd94c091989 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[md5sum] = "33e8d58623f99184e4e709cbbfe45db3"
-SRC_URI[sha256sum] = "5319bc032fabf1008d5d91e280276aa7f1bbfbb70129d8526cd4526d7c22724f"
+SRC_URI[md5sum] = "000042dbf5b445f750b5ba01ab25c8ba"
+SRC_URI[sha256sum] = "98d200e76e30f6262c4a4493148c1840827898329146a57a34f8f0f928ca3def"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.17.1

