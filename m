Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.1227.1597271985061273246
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIenFjCJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id c16so4014910ejx.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3U4FeC2UguD0GTc4US4dvVn4rszmqEHFZOtb+BrqbNU=;
        b=nIenFjCJwPmYw5rs9Zrf5TxklfrTloC//VhEWLuB5zmrDKRdMvzN9vff413usTo6Uz
         v3X64gzOPWXaMYihuGtwgeL/pAl6IyQgEcgj52Vca/D5dhk0HuTELFiKsBRftXIkgjZA
         qIVSX+w+CogDnNLnMCGGARyGfUZGZR/7OaGr8QMfVmIS628+YbepHDpisrcV9+imYnhL
         5SAoxaZfbOiq31Nst2BrnWX88UsrrUYX2tKxPvntlFPVQbHcBxbMnGTw9WtZCpVyVTFo
         86LUVtYV9lThyOYzN7bLL398msb0UXS7pC1xaPHoVa6ck5ZKloTgrDkfF0ptvVQQG7G+
         /rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3U4FeC2UguD0GTc4US4dvVn4rszmqEHFZOtb+BrqbNU=;
        b=dOwSYmNKZkaUuzDvPbIssjgipA+t/T2nh3LasFfIz+NTNnBbD5V6AswbWquBJNlT1z
         qdNV60GQQVdkSSWUhEOIVFxv3CFEYPTrbHEuYO9HTNkF1ycFZxJNIcf2QWCZNvkT3KV+
         upioGX5PboqeHwW5mQSRFBLi5+oakT27ZVXs3iKqTIXE1w33flkm7u2GW7RXtc+BX0m+
         ceA5JFZOb3WaJo0R5q4nqY2LERzBsxxCLFKG8+a42ZZtJfMO+yB8up35gO+hLXjTUOI/
         Z1XZn7RnCIr/f3Gbr+/NZ9RD1/z6SxOac79+97QYKehhV9lsAf8Q1UVPou9N4I6rb45C
         LAdw==
X-Gm-Message-State: AOAM532zPzGuUt8VYF2Lp5ejkgaTP0AR7x338VelRo2PF7q9OjbF0JH5
	K+P32NvhWI5UlIx5NmCOZbjy7lDQ
X-Google-Smtp-Source: ABdhPJxkFmpl9jdRyrxvmCOgTrHzx0xRlUWgaPxZ6tQgqvvbzWYFfNeaSKGy1A0nEXXJY9lERvox+g==
X-Received: by 2002:a17:906:5f8f:: with SMTP id a15mr2125963eju.291.1597271983394;
        Wed, 12 Aug 2020 15:39:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/8] gnome-desktop3: upgrade 3.36.4 -> 3.36.5
Date: Thu, 13 Aug 2020 00:39:28 +0200
Message-Id: <20200812223933.1119785-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major change is removal of md5 checksum because this is a very exciting
upgrade:

===============
Version 3.36.5
===============

- No changes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.36.4.bb => gnome-desktop3_3.36.5.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.36.4.bb => gnome-desktop3_3.36.5.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb
index 6b0c53566..fcdb2aee4 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.5.bb
@@ -16,8 +16,7 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "285d5d8a97b7564809151d401199c239"
-SRC_URI[archive.sha256sum] = "007bbd48c1ca2fcb184713c923174c1d4328c3e33a2271ca536bdd3b71229bc6"
+SRC_URI[archive.sha256sum] = "eea1242994109fa3f05793963ee25c3df23bc84b0f0b81f03ec3c294c27ab753"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.26.2

