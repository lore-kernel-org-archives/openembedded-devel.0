Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0099E9D3E6
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:28:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21544.1770215320271685172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=rvlggRTv;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.50, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so758545a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770215319; x=1770820119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNnHBe/OBPAhT2SD1BmWai+S5BPOpsiYfehSg8w/ScA=;
        b=rvlggRTvNXoO5pwtrwk00zMyhwz5Udq1zrfMcCjZf2j8O7mn9L/+CYbV+EOsITcpq6
         t3cQgvAPDJPBKoOb7nFE3VRoSwqwmarnszUMCU36B58Tdu/cYsFtOv03bIjSHXk6rNzL
         2EVM33jy2CRBIiY5ZA6ITwpsWLW3RfZX0ly84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215319; x=1770820119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNnHBe/OBPAhT2SD1BmWai+S5BPOpsiYfehSg8w/ScA=;
        b=E2pBH+bcWvyqD1jf+nNRFwMhVYPZ8dYi851zT/4XDdOceMXmga/4DIASGifFb42XEM
         dSw4+vFlm9RkFxVi9PfGmhQSN4wzkzflWukBLaZRNqGyXxP0c0m7HPET0dDaeFHmOi+U
         kEK90AG/tawqR3csMLuhhIKh2TOD0Ck+DPlWfU5/aUs8W+WIv/4d013FH2TFKUHYe4qj
         qGF0XgP2MwMwcuPMEDQ+BKUACyCXq8c/QLIRgZGiXiW+SR0memP2Qh9mhtBVPN9V52Xo
         t+pod5oCmdaqDq1i5cGKkmgkB1j5q5voehXFGT8IJ98wFaEJ3GoMTOOlvROsTvSr7cKy
         TYMA==
X-Gm-Message-State: AOJu0YyDk1/E6XjJB0Vd3zcjCFdAjTOjUDvWQqmEbECehIxI1SjmxVPL
	q2I/6/sWHtRdGQHhWFAPdEta8D5Dfl0Icc0tWL1VsxxOl6Yu4qS+zTWKUB0rTAXrhhuX+j1An5l
	vePks
X-Gm-Gg: AZuq6aLf+/qZBXAMP+1GKKvSziuTG3Xzv/RZ4URXdM3rbViJrWVQnOJCGrgatWEQTMG
	gamAqhiVuEYPOIqub2RpvNhPYmSA6HQIM1fajeXdX6d7WDFwOyn2ETH6PVgf7XxR12ool4sDBww
	nc9i1Rf6kLqtm0iaTvx0zPNauLu50jzZ00WlSgsbd4f4MWQ4fVKDacXj347VXNi7gjEDH73I+Gn
	/bzlNX6aufukODxTbidGDspA3lmOsB4+nQWd/u4a1a0Aqs09ipFfeP01t/mJcAlbUcI7UUE0f+m
	NL3iY7hhkpE2OdmNyj7FLJOacENQ1egNFkVx7ciM/09btaSxkii664DaQOxcQD0YAzkJ2aXOGDp
	bOXT22kboCZxu+ocYRpIZtbyC3QJkh0IVXbfvCsv1NLn0U1gz/oUbeySVmjHzQ/aZr9ZH8Bh0/V
	UwfEshqbPZEzgG0x6pL8CSm0TYQvCkJpe1Gm22yEhD2F8nkE4F1ghAPjA37j3ADV1hkKiT/A/9M
	Jdn5kOtCSf1S8Bzj9e9OO3B1aXVg4sO+hnq4YDdGFKWrCe9LMxg
X-Received: by 2002:a05:6402:40c5:b0:64b:a1e6:8013 with SMTP id 4fb4d7f45d1cf-65949dcc375mr1187507a12.6.1770215318468;
        Wed, 04 Feb 2026 06:28:38 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a23525fsm1232598a12.35.2026.02.04.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:28:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/2] libtsm: upgrade 4.4.0 -> 4.4.2
Date: Wed,  4 Feb 2026 15:28:34 +0100
Message-ID: <20260204142835.2157554-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124127

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb}               | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb} (92%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
index 074302bed7..8249826ce2 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
 
 inherit meson pkgconfig
 
@@ -31,3 +31,5 @@ EXTRA_OEMESON:append = " \
     -Dtests=false \
     -Dgtktsm=false \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


