Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.40068.1595802916497740435
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BRZ/nopq;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gg18so11779323ejb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UWB0wciaVi+TUV97b3Ov7Sipc8iBg7A28KARhAAytmU=;
        b=BRZ/nopqO99PD3VHVYilaSIHijxE+W3K3KsQc9t2OgGbOFwHPGTFNA6XqjTnKxAYED
         g0LdoWhlYsTz2rmaTNPaLLaG9pUyQy4TRjZVya5SIL7VFDAGzPoJ9kIAqDgqhsSnKX8Z
         BPxGo9+WtQC4xZzrnxq8unh60pKzIvOP6EwU7aRd8fGePrnQaI6+Hy4yLyXl2viZj2Km
         Z78LHYpWrNPe1I+RMMTmu8kpq3U3moixI9MqSuUt0mToVTHraWCnEoceniG4vCGJ9frl
         PGcbgVuCSlUd3YDlnpSCgYKMUs5g4lKtXGZd455yVKGyft2to8Tr+GMG48WOnNt8jDtw
         fP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWB0wciaVi+TUV97b3Ov7Sipc8iBg7A28KARhAAytmU=;
        b=gZ3YIaDWsCsI7T+kT2mv1o+Eapl5VSbetXy0mDl5ngnoDYA8rlbZYHVskM8SKhPxL+
         6rIhtSVShvYaS9SssUZIIOFWh37QFAGw2evzIbDry8yvWdk2Xf/KdLkW4VmQuWZ3/2pR
         dOcGgDQlLVwOjPpjb6/qCQho2Oq9v1t16AEO6dwsqKO5ye1aLfnZ0LY6XfVSogShPcXo
         9UTW1FhHnBe7iwfjJm0Kvhm2DR4G3hUpM5kHLSoO+xdBLymuPv/4p+SmZb6zWbbBcW7S
         o66k6HgV1HkNxTCXZSJ7g7BM7dxZHrf1jIygHqwWvsTokyXNpfu4pYWeZWY2EIi8zdL2
         owRQ==
X-Gm-Message-State: AOAM533jvrdzp3V70yDNpgF/XX4jZCIpnKjKgfpZLYmW89LtIXXxGiI3
	ruov+mPUS/R80cYjOD5KWJf7KvJy
X-Google-Smtp-Source: ABdhPJzevqZ1Nof+z0g5p7U/fF82N38qeSKSg/cb+lEIOqiFzctptdNSKbIxSFqCS9ejRwSpe0a5LQ==
X-Received: by 2002:a17:906:7c86:: with SMTP id w6mr8222692ejo.178.1595802914869;
        Sun, 26 Jul 2020 15:35:14 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:13 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/10] evince: upgradew 3.36.5 -> 3.36.7
Date: Mon, 27 Jul 2020 00:34:55 +0200
Message-Id: <20200726223455.333001-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Evince    3.36.7
================

pdf:
  * Add back 'de facto' tooltip feature (#842, Nelson BenÃ­tez LeÃ³n)

Translations:
  * Baurzhan Muftakhidinov (Kazakh)

================
Evince    3.36.6
================

backend:
  * Fix -Werror=format=2 on dvi on ARM (#1429, GermÃ¡n Poo-CaamaÃ±o)

snap:
  * Don't specify candidate channel for the build snap (Ken VanDine)
  * updated to use latest snapcraft extension. Fixes #1426 (Ken VanDine)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evince/{evince_3.36.5.bb => evince_3.36.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.36.5.bb => evince_3.36.7.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.36.5.bb b/meta-gnome/recipes-gnome/evince/evince_3.36.7.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/evince/evince_3.36.5.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.36.7.bb
index a82e44b02..3ea54101c 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.36.5.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.36.7.bb
@@ -20,8 +20,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
 
-SRC_URI[archive.md5sum] = "5d68c81a3d4c5d27754b97405451f04e"
-SRC_URI[archive.sha256sum] = "6f0dd6e30639eb620f201a6ae40f21c4b78c030f0d6437f9e309f7240195e97c"
+SRC_URI[archive.md5sum] = "a7ebf1f76552579be71fc63947a15297"
+SRC_URI[archive.sha256sum] = "65d61a423e3fbbe07001f65e87422dfb7d2e42b9edf0ca6a1d427af9a04b8f32"
 SRC_URI += " \
     file://0001-Add-format-attribute-to-_synctex_malloc.patch \
     file://0002-add-a-formatting-attribute-check.patch \
-- 
2.26.2

