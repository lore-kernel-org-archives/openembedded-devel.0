Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB11C61DA3
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.96376.1674798887982528054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTjjsvqw;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id lp10so3608665pjb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMp9V/BwnFjk3bm/5JB6bQwBJNRIN3vuiRm21Rt21ak=;
        b=cTjjsvqwflJW0HcNezzmFXPhOKquppt4aC8fS2C/lWI1Ce5mknUY7TuzYW/1IWXrgQ
         oRLirbKlU/TTpg4iq5aD+ZLjAAE0PJLZaq2ISy1995OTVa5gBjS7i0MoydRRvV18FcNy
         Amy1tgqJU9j21GjSzQ86eCTcQPo6Je7hrYnSWfZcd1+5+knqAKvYLIKjSAcgZbEDytKH
         e0U7h7lj/RJyviMxHEFRMetKbHq804+ivBSL9B6T6QisgAUNC09CzZMEyZYsEqArhbLU
         aeTOUF6qpfzfBWk8eyCI8LkF1cdW3wNKln6yRldI5Zi9B0xBDER1vz5Vabt5+AwpGYCH
         0KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMp9V/BwnFjk3bm/5JB6bQwBJNRIN3vuiRm21Rt21ak=;
        b=AAHQ3koTWX9ZD/o6IiRmpiEAOzv4aNslcxYMABCh4/8nVycqza0RG3wjwtT01IJAST
         KLtOBd1T0NUtxM9W8QkR9aIP+Z2deJhOSYwP0U2CArd6uNmT5wr0oM9ILGPdnlge+Gxf
         FK/krURGV7hIwrfEImhTz7zy8V4oGShBOn6SGRp4MuOY27UUzenAzkFdWdUpP+nVeU65
         CL1wcj+2NDsYL+UVmv/AZHVYxg32yN/nrkqlbidzzx1G9vJRGWU7fPY8BLTPJ3fgvuKg
         bURdyWzpDygLvGvkI/Wn4v7EWeFnTd/plxV0qx4JeHCbYO3SOM8UFs2PA4FFi8RjfN03
         xCwA==
X-Gm-Message-State: AO0yUKUddc3txhV6/PSgubKQL+lgEgpD8H8xFk9f+pVuRav0W5yLZcfd
	/8LWu67hGLHUDJsmuyOmwy1TvyIXyNkBuA==
X-Google-Smtp-Source: AK7set+qLWHSRKGUbPXjNx01Xh7PrXFJ+gM0UWuJv7FAx/zU59SDfrIrm86Zv/UQSi6u9oK5Nira4Q==
X-Received: by 2002:a17:902:c602:b0:196:35cf:3afb with SMTP id r2-20020a170902c60200b0019635cf3afbmr5171399plr.54.1674798886942;
        Thu, 26 Jan 2023 21:54:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/10] geos: Upgrade to 3.9.4
Date: Thu, 26 Jan 2023 21:54:36 -0800
Message-Id: <20230127055440.2108933-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100810

Merge .inc into .bb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos_3.9.3.bb               | 3 ---
 meta-oe/recipes-navigation/geos/{geos.inc => geos_3.9.4.bb} | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.9.3.bb
 rename meta-oe/recipes-navigation/geos/{geos.inc => geos_3.9.4.bb} (81%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.9.3.bb b/meta-oe/recipes-navigation/geos/geos_3.9.3.bb
deleted file mode 100644
index fdb72204ea..0000000000
--- a/meta-oe/recipes-navigation/geos/geos_3.9.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require geos.inc
-
-SRC_URI[sha256sum] = "f8b2314e311456f7a449144efb5e3188c2a28774752bc50fc882a3cd5c89ee35"
diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
similarity index 81%
rename from meta-oe/recipes-navigation/geos/geos.inc
rename to meta-oe/recipes-navigation/geos/geos_3.9.4.bb
index 484ca9154f..7822cde30d 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
+SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "70dff2530d8cd2dfaeeb91a5014bd17afb1baee8f0e3eb18e44d5b4dbea47b14"
 
 inherit autotools pkgconfig binconfig
 
-- 
2.39.1


