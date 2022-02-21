Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D4EC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:47 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.7487.1645421926257681167
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QWnDjDy9;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so2677642pjw.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCCMezfjaNG+kQ+33g2BZxGHc05cdKVAsThNkbmPBLM=;
        b=QWnDjDy97rBWSRyqPNWrtBCEpQ8s2Pdm/Z3tbQxCmCi+RNKJJqYP0F4QHsfnoOI7Jd
         GFve0LibKDArJFZUX3PedXnHlh7D4AzKbhf7ztypOVc/4N02MzE03MTx3PrhA5qUK5Sl
         2CfKkhGvvhz4ytkqWuW3j68eB5tDOohCAPajacrbRennvWsEjek2Gfl+aUlVqwBhjA6U
         TT2XfF2pGzreWYr3DTTOvcNJBmcQw8sPuMbxwPnaSXcz2xiCZ7TmR7F1gs4AGGBLSh+6
         K/uuFtZWW7zMOyPp9EKE4wIWRitdveF57Ke0G6JgqOuU9d0JfxNDDiA/TvGImwypy4Ly
         U/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCCMezfjaNG+kQ+33g2BZxGHc05cdKVAsThNkbmPBLM=;
        b=14TQnuVEwyi4Mp7QmrP4fpgyp1CfK2LEQWgzicz/tQssAGi6Bu3QjUEcvEYMT6Qp65
         bPs27DN6f9HnKVAXRox7BsMjpp28aA3aCZX8nyJyOgbcBoHboxHGvXycqK4T9AkrRf75
         z+1LvYGH3/2EUhPU8pmUYls/vE/fDb8HKbG94Q9ybvV+AiB/BA5Wwgu2ELN6/YmZMdP7
         rw0LIGNCKh2aOv081J+vYr4JnBGajStD3J/cA+7oVzMHGJOV0m63nX7LDapWUMGwGQ3e
         pWjhicATwWM3QeuxSJdIY4v0ZjB41Lz7ZK2xAaFNviVAfjkC4GTZtMwS2hHtt++eVSZc
         2P0Q==
X-Gm-Message-State: AOAM530TjZvmHslA8ugCslu3yZoc7nf4FQZAZTSRyBHAn6bBUWLNXsEb
	g2HpFAaSneoOtDdsZHTb4+w5iXjAFU0tXg==
X-Google-Smtp-Source: 
 ABdhPJxYsuUwmiu/0Zv7vw2nSGNdibBj3DFyUxarIaD6RHEIxM8UwWTEZbuTL2T1Xoj+RCUsuxRKQQ==
X-Received: by 2002:a17:902:b208:b0:14f:14e8:1e49 with SMTP id
 t8-20020a170902b20800b0014f14e81e49mr17359579plr.35.1645421925471;
        Sun, 20 Feb 2022 21:38:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 3/6] pangomm: Add recipe for pangomm-2.48
Date: Sun, 20 Feb 2022 21:38:38 -0800
Message-Id: <20220221053841.98265-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221053841.98265-1-raj.khem@gmail.com>
References: <20220221053841.98265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95401

Upgrade normal pangomm to 2.46.2

Changes in 2.50.0 release are here
https://gitlab.gnome.org/GNOME/pangomm/-/commit/cd00ba55a53b71a41fb566827db8b7d7c28c36b6#9f621eb5fd3bcb2fa5c7bd228c9b1ad42edc46c8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pango/{pangomm_2.46.1.bb => pangomm-2.48_2.50.0.bb}  | 9 +++++----
 .../pango/{pangomm_2.46.1.bb => pangomm_2.46.2.bb}       | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)
 copy meta-oe/recipes-graphics/pango/{pangomm_2.46.1.bb => pangomm-2.48_2.50.0.bb} (68%)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.1.bb => pangomm_2.46.2.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb
similarity index 68%
copy from meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
copy to meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb
index 0aa100fa29..29d7b285f4 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb
@@ -4,16 +4,17 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common cairomm glibmm pango"
+DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
 
 GNOMEBASEBUILDCLASS = "meson"
-
+GNOMEBN = "pangomm"
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "c885013fe61a4c5117fda395770d507563411c63e49f4a3aced4c9efe34d9975"
-
+SRC_URI[archive.sha256sum] = "a27aa77e017b9afce9e751d85bd1cf890abbb3a58bf59d0fac917eef82db3b5b"
 REQUIRED_DISTRO_FEATURES = "x11"
 
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
+
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
index 0aa100fa29..0ba0a77812 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
@@ -10,8 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "c885013fe61a4c5117fda395770d507563411c63e49f4a3aced4c9efe34d9975"
-
+SRC_URI[archive.sha256sum] = "57442ab4dc043877bfe3839915731ab2d693fc6634a71614422fb530c9eaa6f4"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
-- 
2.35.1


