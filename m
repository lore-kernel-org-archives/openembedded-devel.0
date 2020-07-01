Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.10582.1593562072142600205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5MoTWwd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id x8so8265195plm.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BT8YtZo1XU8/1GtRKJ1W46/azhOiEXZyokTKPtM3zcc=;
        b=S5MoTWwd6aoOnBiQssF91NDP9iqelc5yqDc1YklEG5Yb+oN5C18ROiozGw9OruBOpb
         bcwvMevTEEu5yc+j96SaLPVJHXsfTILTWvAY871BYTHKvY9/ijhr8++upyEdfgAHPr9N
         Ma63i43gAw6ET0AF7sHPEg0DHAXSzDWMl1GMUWHe8jV2zAy2uBhdeXdJnWqRp31Z4nHN
         lqMP9cNHu3KA7+5BQhN9XsdAqKRGGxwtg+Y5CRiiF1iL0hSVVjFM+2xE/gsFEBsFuO0M
         M4N2P9VzyKIQXwr3QUSRTyOocciz5N6qkxVIu5n2BXSEr69DI5lq+S3hO552+yh67iFn
         5nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BT8YtZo1XU8/1GtRKJ1W46/azhOiEXZyokTKPtM3zcc=;
        b=SD/IwHvcayWvOCh7I+FrH4HqpzC0mkLdMRW2FWyCrACXot6SoMw8PGrAuefxPCcdxt
         HzOWGCSJkQ54saJwd1coRNDX2DyHe+Kz98bFEalzcc5twfhoG80edRI8TePHtkAIx5YH
         tl9B/9JG73FZP7w4MJEM1pugM12ZUA2Ac7Ig77ItVk9Mxk/fZn2JQBbingfq/EWuhnGt
         a5GP9o1K/tcCyfn/SXFsGR8AKhtdxnsMl6BJJEtsfBh+iDBVNdgprsgn1Q+xnJrf1Z7x
         pNLPFniKWsdecFB1hIb6nt9+cVCyONXxX+VTOEYMQbPD4ClfnYpvOP0ng05gx4GiMFp4
         zC1w==
X-Gm-Message-State: AOAM5332ZHgqn4yXG4UrIZdZUO0tvw2kk5BlbxBFA/Y9DbHb82Tzhjip
	InSdINWWxfgjyDtzudxD6LBYLo1iKcM=
X-Google-Smtp-Source: ABdhPJzuwBjjhJzb7gAOKBlirrWjOl9abnJx7HgzjXDfJfTB9zdgr4GIGGoJ2A/hOopXDB4KkCgGqw==
X-Received: by 2002:a17:90b:1c12:: with SMTP id oc18mr23903895pjb.160.1593562071478;
        Tue, 30 Jun 2020 17:07:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 26/32] twm: upgrade 1.0.10 -> 1.0.11
Date: Tue, 30 Jun 2020 17:07:11 -0700
Message-Id: <e415e0bebea7bf6084693e9b4c123319f634de85.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

??Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8f6facb77e13c9dc53056f30283d0dd33a9c8679)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-app/{twm_1.0.10.bb => twm_1.0.11.bb}                | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.10.bb => twm_1.0.11.bb} (67%)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb
similarity index 67%
rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb
rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb
index 3a2267ae92..45caaacf2f 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb
@@ -5,8 +5,9 @@ DEPENDS += " libxext libxt libxmu bison-native"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
-SRC_URI[md5sum] = "e322c08eeb635f924ede5b8eba3db54e"
-SRC_URI[sha256sum] = "6449eadca16ce0f0d900605b0cc020b95f40619261b7beccfb46bcc1836445d7"
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "48e83210b39a7bfb492604ba0bcfb19e"
+SRC_URI[sha256sum] = "410ecabac54e6db7afd5c20a78d89c0134f3c74b149bee71b1fec775e6e060cc"
 
 FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
2.17.1

