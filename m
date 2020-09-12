Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.14815.1599905061659416869
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ytnzr9fd;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id j2so2044129eds.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2a5RYazcNmYMOSmJxqDOg+9RA8qqE0cjdrGr3N/i+U=;
        b=Ytnzr9fd0b8u0OSQxAzXNpnVXwmWaPDrdF1XQnvWZU2mE2isggfb8arTdLZ7/YDzIj
         A7Y5xgzkEt832zp5H0tWb4RWMaIpcdmgFVRUQzTDrJeXTQGykwBQ8VNFCnuAomlLzT3v
         fkIQ77Jwc2/PzlBOPajeBBZTKn7pwDtjHL2UoocaXRxEF9qTY7tCHKQQenRssCuAPI5V
         FooBV3kbgJ4iEhbjghep/3oCsiahi4QjYRDsboi8esYguZV5SugbY3jv8vUm30qcw3dp
         qIMrK+JZ5jgjnm3i37h0kdkid651Bhi1igGkVZ/cRBRtGbSsDFIzIy0Iis0Gvg0YdgRm
         tsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2a5RYazcNmYMOSmJxqDOg+9RA8qqE0cjdrGr3N/i+U=;
        b=sSz8BCWS5ejlAE0QU7NVfkRsDL8IQKm5rZrPf8qIhlGRCI8rpdNvC1v/86bzv8rRmd
         gfceQZ2MJIC0z3JIu2MYdnTyaU9PZhkmX8Pr1uu/636VzK4wwMBP3EAKgV7tajP7MZly
         3XL79gBZ7AW5T+TpMQf81oyN3sSSpV2m6Q7nbJXlutamXl/hphy9XPPJtVgZTdhku4m9
         DX2imSPwXrehy+aOiyuw9FR0ur04N+qt8lwnTN5uX6Aj4ErtvQRFv1SX21JIZf9FHO5M
         b3mtCkF5MkAhxTICdsOlg2+gQ09P0F0E2kn9bZldIzb3on3rVUvZVdttwybaMFPrx/Kt
         hGPQ==
X-Gm-Message-State: AOAM531+UlIsJkmNbWdBGOM7Kg7ag5AAZo6Nih+aXhQZ8iMa11Vz4EDO
	r19yUnSfJYyHRxNnjn6Eaig6Vg3wDtI=
X-Google-Smtp-Source: ABdhPJzSEKTSG9P/u3305NRosT8wqE+VKt/zbiaVDZRipM3Tg6XVCHM4mQ4YtOy0ioz68XEOqpeEGQ==
X-Received: by 2002:aa7:dcd9:: with SMTP id w25mr7082510edu.280.1599905059954;
        Sat, 12 Sep 2020 03:04:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 35sm4257059edg.71.2020.09.12.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:04:19 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] st: fix indentation
Date: Sat, 12 Sep 2020 11:44:27 +0200
Message-Id: <20200912094427.3904-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912094427.3904-1-Martin.Jansa@gmail.com>
References: <20200912094427.3904-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* using combination of 4, 2 and 1 space for indentation in the same file
  sucks almost the same as tabs and spaces in the same file!

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
index 7d859e1478..906179501b 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
@@ -1,9 +1,7 @@
 SECTION = "shadow"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04c3ca13a702147c62db90f556c5b3ca"
-SRC_URI = " \
- http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
-"
+SRC_URI = "http://dl.suckless.org/${BPN}/${BP}.tar.gz"
 
 inherit pkgconfig features_check
 
@@ -23,5 +21,5 @@ do_install() {
 }
 
 FILES_${PN} += " \
-  ${datadir}/terminfo \
+    ${datadir}/terminfo \
 "
-- 
2.25.1

