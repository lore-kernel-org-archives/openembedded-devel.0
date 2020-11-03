Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.2725.1604432519930326667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HCvzWt8n;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id g11so2551850pll.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2020 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VceUkR8+ljHkRELVV9k02zodW4wlfiY69xnZ9b4QcgY=;
        b=HCvzWt8n0eJQzEJ17zJ0q9+wtOTEAvud1R1UELdz97R5jPdtZJ7naK5ZwRL2lxbPy/
         B3TIhOa0YImBfn7eNVkcS3PgvyU0B5WnowLpKL7h0TEOrdRirn210qGzwgs0j4xTOobx
         dVga1OUbX3qSRS2gjQmnHHOEpKFdcFshQfdkIe5oIgkgAU+fKd+VHmqUUY/Hohlij0Hh
         XBrRNtS2qFuIBwbiuQ9rTxkobOlOtQC/tGQb7+Gr7k8Vng5EjBOBIQNT4WomQ5HF2yMR
         zAUSMxpcqBpBOCWoYoKT6W1zTqtHBX7cKsYml4jHOXh47x+Of99BlhpA2snQaCYAFMuk
         GtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VceUkR8+ljHkRELVV9k02zodW4wlfiY69xnZ9b4QcgY=;
        b=MN13vpdI1MurgkkGaAeupgq40i0fXbY7TqOLrZeLtBllwJxAtAiMa+L88CDIz2B+Pk
         TTd/A64XMWVkbpNIqTMSuq1MbSCmoPryeNw050NPXNSDOAV5CBNeBVVAuBm0Jx3Yxn14
         4FuM+udE1Dvc+iw2QmYm+mvf8284AoWI3up0ghY53mtKuvkRvjjVjDScYG/MIaX1an+J
         fHM2E7BjgG+GZSwEps5auTrbp/GY2l0osAZd7o71k/1XICo3lAdWp2LxkGZfwZnXHJwv
         p+n3M2/02tjr5+AN3/XunDWnWvhRYJ/hlN3d8wLi7NenDs7nVHS+MHEx/tRJmRinPbhs
         sUHg==
X-Gm-Message-State: AOAM533+AcVFAElDIKa6TbXsYNkt4pO2DjdRjZW+yY/vPbCRjFaTJif6
	IQWTsqU6bhthAeRgZBhtklc38Qgx53tsBg==
X-Google-Smtp-Source: ABdhPJz63HPxgtRnq9c5rNJLshvodUE+ehf+PONWUWZSiyBV54qHIPZHtYJD9vHOIVfsrsohqqT3aw==
X-Received: by 2002:a17:902:9a44:b029:d3:f10c:944a with SMTP id x4-20020a1709029a44b02900d3f10c944amr26354992plv.11.1604432519216;
        Tue, 03 Nov 2020 11:41:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id 136sm6201240pfb.152.2020.11.03.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 11:41:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] geoclue: Use git fetcher
Date: Tue,  3 Nov 2020 11:41:56 -0800
Message-Id: <20201103194156.1622608-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gitlab archives are not consistent and can be regenerated as well like
github, its therefore better to use git fetcher directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
index 03a10ce62c..b37441ecc6 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.6.bb
@@ -12,9 +12,10 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRC_URI = "https://gitlab.freedesktop.org/geoclue/geoclue/-/archive/${PV}/geoclue-${PV}.tar"
+SRCREV = "555d676a91494b98ad0d52639590608a9594a8d3"
+SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1"
 
-SRC_URI[sha256sum] = "76494f1262fd90faea05116aface7f580b9b50f7c525bc86ccf33409cea95e8d"
+S = "${WORKDIR}/git"
 
 # Without this line, package is declared a library and named libgeoclue*
 AUTO_LIBNAME_PKGS = ""
-- 
2.29.2

