Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FD6C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 12:58:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.1000.1702385870575964019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 04:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PL/V3gSh;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3360ae2392eso3748832f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702385869; x=1702990669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha1mZNkymJ6jtjX0iPpKN+DVet/Lozzh7T7Nv2xiE84=;
        b=PL/V3gShY/+G3IE959lFLmes6gnxj+TvSBNYDmaMmSKyZwSwdRU0sAP8fBn67M0bCL
         uSoyaXxeuYgk+8XTqclPFo6BmB2H/miue+eGEZ+zwVQ5QCPwwukKAJFBc+Y8/HNvT1nh
         360ZHgF5u7L4zFWFjh2XCvAM6IavdQq1yrqeJ+yyqAgYZF7k+Z/1sSEHvl9lBQa29ZJI
         AiuGqQVnpQ/SwJ0d6uPCxfv+NhveFQpGcED7qsQDFpb0498vz6aYyb7xucGd2HvOj1S1
         1sepSHpv+VrkVURc6Muf/7fvrzOcRdcGOMMV53+WT/11Za29cR4DUnNd/7dt7ZyPaGw5
         ODNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702385869; x=1702990669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ha1mZNkymJ6jtjX0iPpKN+DVet/Lozzh7T7Nv2xiE84=;
        b=hqqPvcxDXMHovYo1rCrCw3zVKPg9SqKppBx7Pvk3Xk7/gIU+CimjesH233IoF1+7AI
         RNaYQjDBFn22echQHwxNan6VD9WsihIAX81Q2ZViIIK3/HUlE5l6JXoFdvvUyVzcOMao
         7eudkyy6+MlHBTWyTbaYnVvA8NJXSNdsfsGkx4m6Eg22WoZTDabAwJ7bNm2X0sprHwVA
         +x1tlxS8ASnpq7sopD+XjifuVQ4Ep99a3CtTvdYv6HLQeVkNyInbeShTaNeTi41C/Ai4
         ljLUH1NdJahoSQqSmK236I7et+LkuZjJlkY3nP9dH9xy7if8pJk6oN9EsMuEDFJzf47m
         CLvg==
X-Gm-Message-State: AOJu0YwCADoAgVVbydUnsbyR4ynUhjT87PmdDYdKEEusB3bJOcPSrju8
	EZnb6Uo1b7GSATcZVJwN46DVI44EVKU=
X-Google-Smtp-Source: AGHT+IHfgXFlDwvLZpUDofogOZremTWm4FHcQPg13DB/WtdKYUaaUXOp6O4c58lZMEb9ngJDDj+Krw==
X-Received: by 2002:adf:fd49:0:b0:336:35ed:af0f with SMTP id h9-20020adffd49000000b0033635edaf0fmr141552wrs.12.1702385868701;
        Tue, 12 Dec 2023 04:57:48 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb44000000b003362d0eefd3sm1364154wrs.20.2023.12.12.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:57:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] rygel: add x11 to DISTRO_FEATURES
Date: Tue, 12 Dec 2023 13:57:42 +0100
Message-ID: <20231212125742.2494501-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212125742.2494501-1-martin.jansa@gmail.com>
References: <20231212125742.2494501-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107333

* it was added in rygel-0.41.0 with:
  https://github.com/GNOME/rygel/commit/18cd2cff6f64b7a54156ac97e5c4f50eb8fd8d67

* it might need libx11 dependency as well which would probably
  be pulled by gtk+3 already when x11 is in DISTRO_FEATURES

* as shown in:
  http://errors.yoctoproject.org/Errors/Details/746017/
  it requires x11 even when gtk support is disabled, meson-log.txt:

Determining dependency 'x11' with pkg-config executable '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot-native/usr/bin/pkg-config'
env[PKG_CONFIG_DIR]: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot/usr/lib/pkgconfig
env[PKG_CONFIG_PATH]: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot/usr/lib/pkgconfig:/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot/usr/share/pkgconfig
env[PKG_CONFIG_LIBDIR]: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot/usr/lib/pkgconfig
env[PKG_CONFIG_DISABLE_UNINSTALLED]: yes
env[PKG_CONFIG_SYSROOT_DIR]: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot
env[PKG_CONFIG_SYSTEM_LIBRARY_PATH]: /usr/lib:/usr/lib
env[PKG_CONFIG_SYSTEM_INCLUDE_PATH]: /usr/include
env[PKG_CONFIG]: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot-native/usr/bin/pkg-config
-----------
Called: `/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/rygel/0.42.4/recipe-sysroot-native/usr/bin/pkg-config --modversion x11` -> 1
stderr:
Package x11 was not found in the pkg-config search path.
Perhaps you should add the directory containing `x11.pc'
to the PKG_CONFIG_PATH environment variable
No package 'x11' found
-----------
CMake binary for host machine is cached as not found
Dependency lookup for x11 with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
Run-time dependency x11 found: NO (tried pkgconfig)

../rygel-0.42.4/src/rygel/meson.build:9:80: ERROR: Dependency "x11" not found, tried pkgconfig

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb      | 2 +-
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
index 5212e78333..4fbdce0867 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
@@ -18,7 +18,7 @@ RRECOMMENDS:${PN} = "rygel-plugin-media-export"
 inherit gnomebase features_check vala gobject-introspection gettext systemd
 
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
 SRC_URI[archive.sha256sum] = "6310dfaa2d332b66119b9b020fad6a4bd27d9bc61faf780ca5ca0b62813303f7"
 
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b18ad6ad1b..672c8abc9a 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -62,7 +62,7 @@ RDEPENDS:packagegroup-meta-multimedia-connectivity = "\
     gupnp-dlna \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
     libupnp \
-    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "rygel", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "rygel", "", d), "", d)} \
 "
 RDEPENDS:packagegroup-meta-multimedia-dvb = "\
     oscam \
-- 
2.43.0


