Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1267BC64ED9
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.8186.1677534675447695572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=msYM0K9X;
 spf=pass (domain: konsulko.com, ip: 209.85.160.173, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f173.google.com with SMTP id w23so8412490qtn.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnBiS6nlhJ0AEQnkF0eORKhchLgDF+kJ4g/7grqekwM=;
        b=msYM0K9Xhgz+VQV1I1d+Eqh/YH+xejMwVj4rX9qnugJepCORuCKqbIylB1KT7kiGVT
         fRW7zkk3+e4MLlbjFEangXLqhfDTfN06wooiyBZO01isODSFdhzKU88NSM1k7e51twJ0
         XXqcyD4Vdq4c01ojCbwE6Vl1OWlWbVCH0VNKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnBiS6nlhJ0AEQnkF0eORKhchLgDF+kJ4g/7grqekwM=;
        b=uv+kECPZHUuM/p6UBhPp06GrQ4VLs5iPzUSJculN1QvDVlcDhGmRH3JYYz/PVnTNAE
         hE/eIJqoNcRVKvLXpwxSZH2TMbCxcBjzN4+bOutO6yfJGu2Va3WLQIvLvMM8HMY57IeH
         Ax0c+UTc+ny+Z4OaJ7vUG2U79/jsiVxHst3+8wiojTyyUGdaIDZUjDyK2Xz3AuxuIPps
         pB28jjn2KU7/NAHQXrH1GVsRzi3TLGjkYOkbZcUyjyLerSci419JFY1LpPf8e4jaRYjG
         3FzkGeoLpuvbABAl/pbubTWn+ty7Gc+0l5FBh8NnN7EW/Ze5tw5UQQaZqsjGGS3bJvh/
         GeUg==
X-Gm-Message-State: AO0yUKUa6qcPyUlRpLhk5oinzS/QxJs5gWk31u1JAm4Z6XiNXjyOc2Aa
	o+LxRh6CnT5gVblGeQXPxaMtbsxQhHPqOXWE
X-Google-Smtp-Source: AK7set/mzQRBRzvjYae11xG1zX3LCqgSOWK0+Rz788c5airpHeq6KJXM1ge1Tl3RpFr8bfYuyR093w==
X-Received: by 2002:a05:622a:1101:b0:3bf:daae:7f24 with SMTP id e1-20020a05622a110100b003bfdaae7f24mr1428587qty.34.1677534674295;
        Mon, 27 Feb 2023 13:51:14 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:13 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 4/5] mpd: Upgrade to 0.23.12 release
Date: Mon, 27 Feb 2023 16:51:02 -0500
Message-Id: <20230227215103.795230-5-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227215103.795230-1-scott.murray@konsulko.com>
References: <20230227215103.795230-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101306

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ba5a86a51a459581d8f39afd95ddd27cca5def83)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index e63c1b5e1..13938444c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "12147f6d5822899cc4316799b494c093b4b47f91"
+SRCREV = "d91da9679801224847c30147f5914785b6f8f240"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.39.0


