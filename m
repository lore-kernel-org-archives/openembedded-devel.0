Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.18016.1590941794396176032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z+537pv4;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id h185so1297440pfg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H/r6z9lFQeVICnlZ794L8pt+q1GwXlxOHqC3CjzflgY=;
        b=Z+537pv42X5v6ra2EBw7nUXdK599AjuUydw7UY0q2hnPCwUtXLZtZgyR/UOYhv8/gN
         1jcjagnkU2XMCgk7otgsIylfxuuVIk8ziLlJlHDS1AdoZouw+qg42LMz7tomubD5uoHu
         VicILs7NVoxZ1K+4uqR2b1DW4jkRiqFZaOHUnArMywUL4IPZDP6f5pTnpOUeLgfUv7dS
         VpNf/pyvd5L3QO/psIVnWgrrqEjSUmJS1L1x/I+V1WHs3xvbtT+ATBDJHgncuJ/hsmD+
         j/iyUET8uzoD7HDY5eiht0ZY4ynj3zJbCrzpvftIBpiCW5R8BNEe5mbvt1NB7fKxI3lZ
         pNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/r6z9lFQeVICnlZ794L8pt+q1GwXlxOHqC3CjzflgY=;
        b=fm1Cr5a7v0UhJ2g4oNzYIV2UZaMOUg1D59jEr+gpRyK9GvRh+BiQ1zWUURKzDuLoJz
         2FZwO6/rBX5b9E4+qWSNsAqcfkJeUf7GfagTdstTCr+oFbOSDcvsDPXAmJuWhItY/nGv
         FdenY9tNBWdjzNXa8EmV3AQ0+xO3W97sVgIg9SHw3P6yoHQSBf9b4bdmuXnLKlAqSI+O
         vJP3yERvb0vyn1AxKmpIcwvVhfSMzLM4ah9D65vtG6GMYME5HDVvBaPH1wGaB56BNWTr
         my/yrI8hfOeFe4/xmPlqKs5ysF/Ro6R4zTGPH1tlWdt+F3/Pp+HcA4RJ6/pa8I8kAd84
         /cBQ==
X-Gm-Message-State: AOAM531x1UKN1dRo+cZ4JhppUiWVDGIaw0uJs5x2Y1S3H0WgH2jPFctv
	yCkwu+/e5yt/xTU4t6knh7cNJWa5
X-Google-Smtp-Source: ABdhPJxPTgCONVUxxZHJj+eZPrJHu8h2yKcY/f3BR41LTmid18HeV0HO8FVVW2qfBUlfNIfpX3vJjg==
X-Received: by 2002:a62:8c15:: with SMTP id m21mr5914808pfd.182.1590941793770;
        Sun, 31 May 2020 09:16:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/35] catfish: 1.4.11 -> 1.4.13
Date: Sun, 31 May 2020 09:15:53 -0700
Message-Id: <3e6c7472fc0cb79857f80b99b04aa77caf68084c.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

v1.4.13:
 + General:
   - Optimized svg and png assets
 + Bug Fixes:
   - Fix missing results from symbolic links (Xfce #16318)
   - Do not load catfishconfig during setup as it breaks Debian packaging
 + Translation Updates:
   Bulgarian, Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech,
   Danish, Dutch, French, Galician, German, Hungarian, Interlingue, Italian,
   Japanese, Lithuanian, Norwegian Bokmål, Polish, Portuguese, Russian,
   Spanish, Swedish, Turkish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e33792ef0d2da35d8c1f44803222c12098364fd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../catfish/{catfish_1.4.11.bb => catfish_1.4.13.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb => catfish_1.4.13.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
index 27b5d5ed42..01a36e1fcc 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3-distutils-extra-native"
 
 B = "${S}"
 
-SRC_URI[md5sum] = "67e23d45fded026ef3445bc7fe1d1653"
-SRC_URI[sha256sum] = "617baf9309e3cdfb20c8357ac786eb26f30e6fd4280d4534d3cdd742c7ffcd85"
+SRC_URI[md5sum] = "750b65401c9445e185e71c808d7509a4"
+SRC_URI[sha256sum] = "58c0ea06e5f286019295545fbfd1dbca23aea74c625762bbb4c89a6f484ae839"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.17.1

