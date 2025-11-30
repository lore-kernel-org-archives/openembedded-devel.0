Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F925D116F5
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 05:21:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8999.1764480064583896197
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Nov 2025 21:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKvjbtli;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2981f9ce15cso35877175ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 21:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764480064; x=1765084864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRP1f0qokcx4T9i5WPGizN0/ZUEv2/3IJMFS9YmZCfY=;
        b=WKvjbtlikXpOOTk2fQlA073Z1oy7WRPUpvtVfVERSyUZEhktYb3+AI7HAo/FqmyBUc
         3rkxuRHz+JBtuOU+cgrvca3lNhMy/QLatkrR02+NvGx59I/YdVoLTjLVSXYelcQKtmgo
         twJT2w7hzouTg/zKITmF/DyZxjJybQD7UbrzNdoHwPAjpqRDNqeDrVs/iamrokshVA9u
         uIG0EjkHs+PbIF73oTHDb6wzFIlKEugE+8iz5GLwUCEu7d5T1SzbiUEJjy+Ij5LaunU6
         DPFJdOWmWPNNvyFJk4JsNjkTvZ6ltYW11LzueIORVBH64+ptLcaP6N/IsUMuJX66sVuR
         KDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764480064; x=1765084864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRP1f0qokcx4T9i5WPGizN0/ZUEv2/3IJMFS9YmZCfY=;
        b=I+cL/YpmfBRskSqHwjbNaTDkXK873VajSa/41afxPr8RGjUfl8g9KJ9ILekUytp0FT
         mw8KC43ob8YKvNK/ZsUe8wDGbC3uDrmnbtXyH28tBG+YqMDNO87yWOh1B14MG3BU4EUx
         4u0bM7TuVsT1cWCuYLRT3z2aCiuJwTbdzs1zzI8rogkSBEjmcKgk56UDYKmlDv0HIth5
         fhKRsIq3M9bhDpF847pYPiH83N3EzO1levwlZVb3kO9SOAUC8NOuhyMq7LW8bhDR2wdL
         RdYBXS1DtowkiTO33nUsW3hZLToenmhRxzgAQqANZx71MQ/9Oso/c3Od6nqPXWK6xnCv
         ofYg==
X-Gm-Message-State: AOJu0YwBw9HWI5l/HnoxU5HGvycg+dK7kdnptYgC0ZWBo9LdjV6kRJ6E
	gRqB/w9ati4aqk7HZl6h/EqMzVs1OPbkzDt2iU2dd5+EE9P5vMLXdhlzmqOqTo19
X-Gm-Gg: ASbGncvIpISt71HYNEdWP7y7SatHLY+rhHthzGMpjtUakVfrVqVsgS+w9ABXYYyJ9C+
	Hiz+ZY1N1Nbgvsi95xOFoPR5JH2FDOn/p8sfhuDhDXrSjT9XesYnCyW+hBpbXqqV/VinWQALLyE
	jYTZcQWa/dfSTIfKghRFUkjjHFxdXS5ZAj58iHAMF/oZuMloE67oxRDSkHOD4T0Bget1zjCQ/An
	uw17xwW5SCxiU/xeSzgsq1QZm4sw9HbeBrpXeTHHszZgdrNn06TN61ffaWswKkEMo/+afwMsJ1U
	QzoNhKZyYE3k2g25BBEn/BGpvFUvKm3f8K+WUwghcxWbodn2spu0fAka2/k14KdNnJlah2ZYxJ9
	3mwnG0X4T34C82rG3ZfbkMCTyLpeEo0uUWjqZcW94TdeDtZ3//MUDhzZKAwAfkXW798jsdoF993
	IHh3ptVTInVCW2Eq+o2eCfL3YdzlgbjBS9Ff5PvBaHd+tPZXtpdE5U2dvkiNfzJDRpzEzi2Y6bj
	kHiZkCyBwT0z2dzIJpD74Tsaa8SStzM
X-Google-Smtp-Source: AGHT+IFTkzzpo/2b7dEPNNUvqU8TBAFa8G/NlsvydD1QqXi8yhfee9c8j5/Dp7TwXgybri9zoskX6Q==
X-Received: by 2002:a05:7022:4191:b0:119:e569:fbac with SMTP id a92af1059eb24-11c9d852cc6mr25297555c88.27.1764480063564;
        Sat, 29 Nov 2025 21:21:03 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee660asm47527382c88.3.2025.11.29.21.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 21:21:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] mpd: Upgrade to 0.24.6
Date: Sat, 29 Nov 2025 21:21:00 -0800
Message-ID: <20251130052100.469371-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130052100.469371-1-raj.khem@gmail.com>
References: <20251130052100.469371-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 05:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122161

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicpd/{mpd_0.24.3.bb => mpd_0.24.6.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.3.bb => mpd_0.24.6.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb
index d1dd4d7442..0d5a06931e 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb
@@ -18,10 +18,10 @@ DEPENDS += " \
     expat \
 "

-SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
+SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
+SRCREV = "c426749d4709e8d4ec4a6808c004625fae37b60d"


 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \

