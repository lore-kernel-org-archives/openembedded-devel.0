Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.21179.1610905032105893521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mgG/3VOQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p18so9451646pgm.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1VbreF0cftV3IEZrGAwDk6NPBSkra6DEwIQqupKykHc=;
        b=mgG/3VOQhZgR+qEOnnor8N2KQ1y4cLJQBKBU0z2ZFaYfycvdY/jNRG6GFy+5nu3vav
         JSAmVpsW0oNsp1dvWB9xbt/zkBtxlGmd2lC7Vh4Ek04yt1sTOzGxdL0YmJ63iHNWeTg1
         fBtJmNJPOGSg8Dh65mtRJvY2kwSzYvYL4JaD7NDFkCPrAnOfrI/3c8p8u1aGByICgygR
         Tb7Re5+8aAsfRYZsoHgQpejK4w4ZSVdssOmednvsauY5wKp08p5ZAfIaLI1iNvMA7Km4
         bDa91MJNjG4orsFfUUGvCw2suX3oVmqfh+H0GBGG8RwFNIZKYUlWX0z4x/fA7q5e0ObM
         Yopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1VbreF0cftV3IEZrGAwDk6NPBSkra6DEwIQqupKykHc=;
        b=toka826840IlHyOBodaz1V5eMpgHiJCP2q3wvVpkWoWQd+rBwChHk3JjZwzFaL9DrD
         KhkPnv+CpbBSB5q9xLdrLCaMUsa2lJzBDKU5tqvc93X6Qlg1al6X+QHaO6dtBAqKz3oa
         ZaZBDEFhLu1sHJOpnBn8stKgp3AQtUvEBrxwSsBj6mkEIN7PXAO4thBjFzetg/WCoAin
         xjzfCUcUgq9uWtiMMkZiis5bG0q429rCbRRNXnMngWfHwlQZLekiRUMK9fvoQeo+Qmot
         N+gK8qrt9v7ds0FuyBQsK+B0ogKVH5sL0eOPkDmXszIYoB6Fbulc84cNJv6QCRU+h5CR
         LLVg==
X-Gm-Message-State: AOAM533/k3MQ5Jtd4n9SeSKaCo5utjE77CXmUCLLJ0QKPPrrpDu/lgsp
	niHUwRQSW9LCMSe65FSMjXh8QYShojHhjQ==
X-Google-Smtp-Source: ABdhPJwrTGZA8HgfEoc0xi170MS3HgLly66zcXj69YAzpbLdtCkhwmE2KazSG3hHGmHIsINnNQswUw==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr22508187pgm.135.1610905031566;
        Sun, 17 Jan 2021 09:37:11 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:11 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 30/31] gupnp: Upgrade to 1.2.2 -> 1.2.4
Date: Sun, 17 Jan 2021 09:36:35 -0800
Message-Id: <25285ded6360a3a25216b66e89e346b89500b5b2.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Diego Santa Cruz <diego.santacruz@spinetix.com>

gupnp 1.2.3 adds mitigation for CVE-2020-12695 (CallStranger)

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
similarity index 64%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
index e603497161..c7b330fa00 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
@@ -1,8 +1,8 @@
 require gupnp.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
-SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
+SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
+SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.17.1

