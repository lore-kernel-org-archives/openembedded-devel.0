Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A8EC64ED9
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.8122.1677534673376129302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E2oUWizk;
 spf=pass (domain: konsulko.com, ip: 209.85.219.47, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f47.google.com with SMTP id m4so5528181qvq.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74Kr+bbVVstweiwnzE7W3lwGe8+lbILmazhFZ6MRktQ=;
        b=E2oUWizk9FDhF5zd7x82HPVVjGoaMnhN/sS34Tm2ilUAeE4P2ep9P6A+xyQsCEiW8o
         w3vzkQCKZqKhz0R7HbzJa5inzEgd480ZgSaGNHrmLKXpFfRfyztmTjx1ZI8Eg6WFJtFA
         qCoZtI5C7B+Sbv3PwcDM1wpNyJKM6GnKqp71o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74Kr+bbVVstweiwnzE7W3lwGe8+lbILmazhFZ6MRktQ=;
        b=nrwckBcq82apVovNtyl7gReeGWme+bCDAlIZUdV7k0LzZR0tbCIcgoxJh1zd6DIkmh
         4RU6ofyr1C9s6xC7MoNgm4vzWnxQhBthlMINcfrC/+NJA2PEBYctB1kO8jE5bCGEXj1s
         TWd1CeNTAeejm/JAA1DpqyT+aIv7P8M+siMnBoIfVrXMPmE6qbaMTHUvInfq1FwYWUlN
         R2PjNFqvAHv2rzGvldN1XPRupLwilCtstgFyBEogCry8GgUXeJeMBmQ09uxdkbfdJFap
         9D3k+9WlUV70u3Rj9sW6BKgNu/xw/vQw5tGmd60qGqncsmlcVvFtJX6Gc9ddWcCVv4jw
         0uEg==
X-Gm-Message-State: AO0yUKXNLn9wW5XNpi1ZdSyso9hh+u3iHn6S/w/l3H2qEFF6R442S79z
	4WN1DroojmdAPOj54ZF67Pg6H/lVH1Qc4ivk
X-Google-Smtp-Source: AK7set96IR7rKrIwL3P9pnrWRxeBKFxKSOMnz9ICUb8Oe0ZW7B+RwqX/uH62nyBAE5mHsynvka3d9A==
X-Received: by 2002:a05:6214:2461:b0:56e:bc57:d646 with SMTP id im1-20020a056214246100b0056ebc57d646mr1914129qvb.43.1677534672223;
        Mon, 27 Feb 2023 13:51:12 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:11 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/5] mpd: Upgrade to 0.23.9
Date: Mon, 27 Feb 2023 16:51:00 -0500
Message-Id: <20230227215103.795230-3-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227215103.795230-1-scott.murray@konsulko.com>
References: <20230227215103.795230-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101304

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9ed1e62bbb17c66f8ab3d0601d4968e4b034484a)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.23.8.bb => mpd_0.23.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.8.bb => mpd_0.23.9.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
index 22bc15969..e63c1b5e1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "1f28790476f7bca935edec67eecae909741ff287"
+SRCREV = "12147f6d5822899cc4316799b494c093b4b47f91"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.39.0


