Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB31C47258
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.156006.1703876556162794239
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ub3e7FFc;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5edfcba97e3so29062537b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876555; x=1704481355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxVCyGeO2J3uRUAheo8rOy9rXi2thyeWkIjeDis65vo=;
        b=Ub3e7FFckdYZBWHZ+6aLwfoz/oI5Iy+DifFAHElVOYHgWGn9uH25QmJtRIHRzIAORr
         NZ4pzke40IPWyRRCQTgyuI2lztL4T5osFwMTNH7gwvPDdyyax9GZXzgv8IIGEEcZbZKA
         C7wK99LiSbAuGD+9faBh7crSX1F99h8Qz5xN62GvS80gQT6K6IqX6xQJsEb87Hdt3jsC
         88LBIqr47STpjXnhDPAbQoxBzS8IjQI4uBaPXwEgbzISi5GfaHY517NY7krV2MFckPsb
         Wrx+yf82uaBfACoRuzh0Huks7K6TrjcjLsrlYCaGyAx7BzHmegK5jK3EzRXVqlGyfRqV
         y7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876555; x=1704481355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxVCyGeO2J3uRUAheo8rOy9rXi2thyeWkIjeDis65vo=;
        b=DJpnaXq5FhJjYdQ5XDFhlyoCDcoVUcjisQcCuUAt0VISkP4z/mpXN5Rf+oLrLHzZrP
         +sRFdGPSPGt6fDHRLieewib0sY0cswjiGiwTaBBGWJ1Otpvv4f7lOb2Alu9R1wvcdt55
         Wy1ZLFRwIGpJhUWBqIcuZRwnz0bGYFGO02lbScArF+xpBW1nD+HbpI9uK2DtAvTESbH1
         4DgEclSV5zUAo/nKNf0fXrRRMVwjyGSr66WKX36z9wANKvCie5kxw1O4Z5aJxw6jFiYS
         muFbxzLvAqxO0cfWdk/BzGnP8+CeDe9NHAgnwMP6E87hrTSnGn+rCqt1Gz8hu4lPPdaa
         Tmxg==
X-Gm-Message-State: AOJu0YxL5VIEHXAX7kn+meQyoUZgIVB+CYYhcPiz0869YAH865Rk61P3
	eNo79hMEztsDgP5aoquUM+gvNPKzlnXj8A==
X-Google-Smtp-Source: AGHT+IHoyQRrJyr7hWTl0dWVh8Jy9G2ZFtcmmc1bfxP6BpbmnnCxSwu+BoZBph2PqgbmE24tJVC7kA==
X-Received: by 2002:a81:8582:0:b0:5e9:1b3e:a409 with SMTP id v124-20020a818582000000b005e91b3ea409mr7208422ywf.100.1703876555083;
        Fri, 29 Dec 2023 11:02:35 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 03/17] multipath-tools: Use https for github
Date: Fri, 29 Dec 2023 14:02:16 -0500
Message-Id: <20231229190230.135480-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107885

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4cef1e68ea59510d85b778e11179a2dac47c658b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.9.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
index ae4b3b9bf6..a7a9019e33 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.34.1


