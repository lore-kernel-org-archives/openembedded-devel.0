Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.48683.1591047958438385707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NSQ58gm0;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id c3so1272046wru.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I1kVJXmEkhjuEL96gZEdJUen3FYKxh6TVIiEpj0DDcM=;
        b=NSQ58gm0kv5oxOdhwx0kQ+6g91ClahxHvPcntn3yrxsYq1vE3OQCZOLvVA3+6oI4wP
         HKrKOgDaXCKCgc5mqpTIXRzFf4TGu5yGUqSU0oDTSvjsKzWTeG47jzIEx9R7wuhoR6zz
         gSdob+UJv/2IiTbrFzft+3BkfOJiCi3ZCbUPMlMFD7Pqp0kMk3TugnK49Ibec79KK7it
         xG7FvCmBy7kLfQiaMN0g0UHtUvcvjmphQ4by/svudlOfwxBgwH5V2FV4hFpjVP11EnLO
         aURHqgDh6o/mvhiIO07ca4LKMb3rz+tZy8k86tNtGn3zReLh8mAOz14MMTg4+Z+k0lFO
         2wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I1kVJXmEkhjuEL96gZEdJUen3FYKxh6TVIiEpj0DDcM=;
        b=KFV160oGPWoelOWRLpEV3gieS4ny8iJGwhwLtCBJZJsJUusky2ZLCl1UJ7wh7cKzYr
         zyhn2kq1zd0QSuL3dvBtZIzIgYEUVkdYv7r1Lc2zlcRJn4wWmFQHNNv8FS/7TEYa2plg
         ViAS8ZNgIf8FmmF07DsHZyIWgs4jPBHyCnTx32v3gPBLK7BAh4Jq5ye4wOx/G/qvoNn9
         sA9CIcvEN2fWIQoOkZDPVYFRHavYjaNw0+yFm/WQ3ExLZV5pEFujk0mTc7Bp9AeJcQOW
         3yLjYo+geB7KcgxtfkYLhUTp+0iZ/Qh4O8gaQ7X2wFi0OWknpgmjSORgpd/noz3jBcxM
         DyXA==
X-Gm-Message-State: AOAM533USl6o0+un+/l4xNebmG9hLQ0uNrnJhSFyhh/Y3AfJ6TVe9h2s
	B8fkBHdadOcXz/irXEEUWbvM6aB3PGw=
X-Google-Smtp-Source: ABdhPJwrk5dgjqWvO205GeX3j/QGnmnlQ64ls5VtGC2RVBk75bY2dH901TANlqX9W6+Pa/KiLPBYcw==
X-Received: by 2002:a5d:4390:: with SMTP id i16mr22507676wrq.186.1591047956827;
        Mon, 01 Jun 2020 14:45:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 29/38] grilo: upgrade 0.3.10 -> 0.3.12
Date: Mon,  1 Jun 2020 23:45:07 +0200
Message-Id: <20200601214516.26624-30-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 0.3.12
=============
  * #107 grl-source: Fix reference count in the bindings

  * Updated translations
    * Japanese
    * British English

  * Contributors to this release:
    Jean Felder <jfelder@gnome.org>

NEW in 0.3.11
=============
  * !52 pls: Support totem-pl-parser 3.26.4
  * !51 build: Add a Meson dependency variable for libgrlpls
  * !50 build: Avoid using meson.source_root()

  * Contributors to this release:
    Sam Thursfield <sam@afuera.me.uk>
    Bastien Nocera <hadess@hadess.net>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/grilo/{grilo_0.3.10.bb => grilo_0.3.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.10.bb => grilo_0.3.12.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
rename to meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb
index e3fd67172..0338455bc 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb
@@ -11,8 +11,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc gettext vala
 
-SRC_URI[archive.md5sum] = "f02bf585d1a48dc65be8b90ae3b08330"
-SRC_URI[archive.sha256sum] = "7e44b2e74c31ed24eb97e43265a9e41effe8660287b02295111805c7bda7f1e8"
+SRC_URI[archive.md5sum] = "b464ce84db6f9354996a1d47b3c613da"
+SRC_URI[archive.sha256sum] = "dbfbd6082103288592af97568180b9cc81a336a274ed5160412f87675ec11a71"
 
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
-- 
2.21.3

