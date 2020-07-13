Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.11834.1594608986383136867
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GU8dXRH4;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id w17so4869193ply.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5p6CnYvoi8ggw/k1b4kWwC47U/h0RP9ZkxQM5gVdQuc=;
        b=GU8dXRH4vSs73xPe3RuI/F0RcA+13jV2VZHcfP9SrEdTG6qC7FrGkcr5LmXjwvRynH
         3nZMCY//DFbeM6rTZu2K4h0uVe0kzE9pc8Xn2x7ha8tPQ/zhsYMsKXb4mFMgzBjf8y8D
         wh+w3s8+hZ+gRS/GVi+VoOxVZCju1ArVu+5zQdJJybmkVIpQTBQn+OgyYN49ssNU6fRX
         7y9KPmgBXTvBw6p4uy1D1D7H0XARqZCR8xtsFVqLQzDR+JR7hVJLF+RryXSBzkpoMzjT
         B8pAzzyJRnfwdrt0gccI+U0XTKWDsYkUMPrk4d9Xs2jB6wn2yF5STizBg+hg6Pms0Qj2
         l2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5p6CnYvoi8ggw/k1b4kWwC47U/h0RP9ZkxQM5gVdQuc=;
        b=nC97XqfYLNmHUruvZZ5HAaaYEqXHHtLyxeDYcB06y8DibmLvRkBtys0wUSC9J7py0B
         J4DXz+kSLUPAxDtWJ/Fi6biCoNJQ+9jZrKZtkHr6glHMkGBBrH4VwUJ/ptQRqcB7pBVb
         TJs2TegAWjHVeE5theuN4RXM5F2B3GrIbHoZV5iyMfgy2GSF1tqAMzcCxMJEr3ZM6iji
         trqrlfT7WMpqRlry9WISxLmVdPBFGx6QVTxR9ACoadCcpOBbnFPBaP1xgegy1LrJyPvw
         zf7sdnTSO7wzjvnMu6anFm0M5nBiOh7QGPbTUD0KNAdr9QCT3hRR2DCL8MN0DvqZkFB/
         aoQg==
X-Gm-Message-State: AOAM532fPx1rocyEUvh+mj9GtPbLm5EPxM9prjIV0BOXLZDb3iO+Qyf1
	gHXH6KjQ6gSmYc5JlrxQRJVCvueiH6w=
X-Google-Smtp-Source: ABdhPJym6WSStqKLpHoh0SZtuP9qihNrT0Z98uhtAv3LfLU/xg1ksSlzkw5cnMu90M94qdSqkHEhow==
X-Received: by 2002:a17:90a:290e:: with SMTP id g14mr18402202pjd.85.1594608985765;
        Sun, 12 Jul 2020 19:56:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/18] ibus: upgrade 1.5.21 -> 1.5.22
Date: Sun, 12 Jul 2020 19:56:04 -0700
Message-Id: <66a457908d72cd75edf687b10b409882c0fa9bc3.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

1.5.22

* GDBusAuthObserver security fix 3d442db
* Use XDG_CACHE_HOME for Unix socket directory a141a14 982c40f 5742e1b d53401e a1705ad
* Hangul button press handling 25d11f5 c662a02 ecc3465
* Fix deprecated APIs 48a8d7e 35863d8
* Bug fixes 773420f 745ffb8 26a8105 bccf94d d50627f 7486385 cd4fef5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 43e3c0da024f49e428aff6eef94feef8a17bf941)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 0f4ae7d04b..1bbeb2c481 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
 
-PV = "1.5.21"
+PV = "1.5.22"
 
 DEPENDS = "unicode-ucd"
 
@@ -13,7 +13,7 @@ SRC_URI = " \
     git://github.com/ibus/ibus.git \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
-SRCREV = "ae0040c73466bb6e78fce5e669a55fcce6ffd16d"
+SRCREV = "e3262f08b9e3efc57808700823b0622ec03a1b5f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
-- 
2.17.1

