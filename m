Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.40009.1595802910465654920
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mtgD38FF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id q4so7522213edv.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0P+eLBKOR6OjA1gHt7X70YOvNvCKfUH/IhsU+2HNNJk=;
        b=mtgD38FFUNm801NF+J8n1WTVAiNTwo/X4sAPtRBETfOJEXvM3QBsPzf0CSZrWp6Bh4
         VIOJIzlw4QWruMhnk8YasU9xw582LFXupeF6y6eLHV8unzpX2iKayGnVGS385tbukEWE
         hAklGuc1feGrvXcFYRUetnxqvwrCVEN+lVL2pgi+u8OaNb/PrH4LXlXZemqM85Z/GEo5
         kW7kmxqS7eRfWv2f9PKKo94Gijy8iZA8sMo5QnFin6M7S3CGLzHw/g4o///G7HrMn18u
         14LrkRRfWjstqRbkHtmKwwOi40BRWuxnK+xqkU0NGy6ei8nC6hqMxRmMxC4KV8sIidFp
         xuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0P+eLBKOR6OjA1gHt7X70YOvNvCKfUH/IhsU+2HNNJk=;
        b=QGZmwewwMW9axo13ysuvuYkfOS3Ku3LvINSx1pHPpn6OF0RzqjIR7xbazWKlV9zve6
         UhgvHAWoTVkFcf5Og686A5UNK9XHyABeYzlvIzxdgRe67jwBzmNx+RUD1OoFyBd9+iO9
         0xD/wEgo6lcbf3IlE/aXeTUJ6liinh+ZYSOh4K73QdgmPacy2BIznlzOPOJY6mLCL3Mt
         zej754pQe4SkN2WIP3SPoa364mliWSi7osX03qp0y/2h8u1sE/gT1a0a3oVCwZqF4l17
         ZeemVcLyUiwPgSsT8nrfYKHnzihu42MuNMsPKsnluWzC68em0DA2Zu2nQIkeL9J+HA+x
         4mGw==
X-Gm-Message-State: AOAM531Hrhk/Bz0tRP0xM+ZE0Y+dm49qbndvbFfOHnl3gZu4LqpfWzab
	2f9J0h3jAMINqvZBDcLDzKeUyFjU
X-Google-Smtp-Source: ABdhPJyzaIeMpog0jy6kWJkUTFvJ/CI1T//TMhajFYrGDapCe3GbCwpvBnuzOBPHW85ggLMtpSCWoQ==
X-Received: by 2002:a05:6402:1494:: with SMTP id e20mr18485336edv.2.1595802908783;
        Sun, 26 Jul 2020 15:35:08 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:08 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/10] gnome-desktop3: upgrade 3.36.3.1 -> 3.36.4
Date: Mon, 27 Jul 2020 00:34:49 +0200
Message-Id: <20200726223455.333001-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============
Version 3.36.4
===============

- tests: Don't run at build-time
- Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.36.3.1.bb => gnome-desktop3_3.36.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.36.3.1.bb => gnome-desktop3_3.36.4.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb
index b7ef7545a..6b0c53566 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb
@@ -16,8 +16,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "75e828342e51c88c866dcdd46c021d26"
-SRC_URI[archive.sha256sum] = "4bed119fa25ea0ff7880928142365c3c8726585fc072bc147157e66b63e96b7e"
+SRC_URI[archive.md5sum] = "285d5d8a97b7564809151d401199c239"
+SRC_URI[archive.sha256sum] = "007bbd48c1ca2fcb184713c923174c1d4328c3e33a2271ca536bdd3b71229bc6"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.26.2

