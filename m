Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.926.1625021235220230170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jun 2021 19:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ji0NWtGI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id a2so753830pgi.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jun 2021 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K2wH8dAkWSSxJ3QlffSyRWDgUgYTo3+UwhOR/oow3ZM=;
        b=ji0NWtGI8gwIG0KBtH0mbZ9PZ5BIk8cg51rqioSeU08BJ9oxa/acgLOtMJ23o1G9T7
         VvAhFjT4PTks9bu05ZJToYTIx9DjiKwUbE8RkjiMEC8jSoVJaJTXR0gTrS54uKDiML9j
         MYq5QkQiGD+lPvnITtigXLoxAnQ3HqEjXVKBFnED+3sX68uuyxgHdKE2+TGvRnHkKPlO
         M5TPoHL20O1bifnyoFmb7l8a9hWxATCSnXgQ46aT9YldYBofUDSuGRSptlyjM2YlxHGV
         UdWxZOY05w8BqwFicxIuCdEHbaLwo4PTB/5/QB97LTlQWYYwmTrk6eAmdrl3kr9Ut4SE
         hQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K2wH8dAkWSSxJ3QlffSyRWDgUgYTo3+UwhOR/oow3ZM=;
        b=JzwAU3t8c+M8pzALTjOv/X8XwszZBK5zF2v4j696+N3k2eEQFAi6FdSkkjKTLm2jiM
         unQ8789XkE+pxgV9TcftXJUlANrSZAf03HHRNDW8WCgXzv7qqqDsX4eqdZML0JHqIwcW
         LXrPpuso2+9cCFGGsLf+ktNUKjxvRTpItdG7rYxVTfnvxvKiHgtycDJA3xNWe9fieeoK
         d9Afs7jB1UUcnq31hO12WRuNQLmXucCeCjhvYlLjiCs3ZwkAvBKovZPM6i8iDRsNEAY0
         Vfte0j4z6z4faXgIC19vJr6wZhv4kZzd8qbOT79jrZImRt7SzordTTE19ofn7TUDHfui
         QWLA==
X-Gm-Message-State: AOAM533WdsVBRJaLCWoacQnUy7OhGZOil3/zawTn+ldF2QKKbWgnEsNI
	ASrgcyMHwmk73n3YWMICHplJwFsjz0ZHIw==
X-Google-Smtp-Source: ABdhPJy9fLrE6hG8ic3EjPa01Xh8o5kqL61q4cOYEi7rUXPJPrztAKjSTLRL96nyesrCfU0ui2qR7w==
X-Received: by 2002:a63:db06:: with SMTP id e6mr31694437pgg.244.1625021234481;
        Tue, 29 Jun 2021 19:47:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id 28sm20244637pgq.39.2021.06.29.19.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 19:47:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] mpd: Update to 0.22.9
Date: Tue, 29 Jun 2021 19:47:11 -0700
Message-Id: <20210630024711.2277396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-include-utility-for-std-forward.patch | 43 +++++++++++++++++++
 .../musicpd/{mpd_0.22.6.bb => mpd_0.22.9.bb}  |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.22.6.bb => mpd_0.22.9.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
new file mode 100644
index 0000000000..68ccb65835
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
@@ -0,0 +1,43 @@
+From 9bb962148672a3c20fb0119d7f71789b8ef3dc02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jun 2021 19:31:34 -0700
+Subject: [PATCH] include <utility> for std::forward
+
+Fixes
+../git/src/Log.hxx:121:42: error: no member named 'forward' in namespace 'std'
+        LogFormat(LogLevel::ERROR, e, fmt, std::forward<Args>(args)...);
+
+Upstream-Status: Submitted [https://github.com/MusicPlayerDaemon/MPD/pull/1201]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Log.hxx                   | 1 +
+ src/lib/expat/ExpatParser.hxx | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/Log.hxx b/src/Log.hxx
+index a295ed9f6..87097b086 100644
+--- a/src/Log.hxx
++++ b/src/Log.hxx
+@@ -24,6 +24,7 @@
+ #include "util/Compiler.h"
+ 
+ #include <exception>
++#include <utility>
+ 
+ class Domain;
+ 
+diff --git a/src/lib/expat/ExpatParser.hxx b/src/lib/expat/ExpatParser.hxx
+index e1723d109..4b5221e89 100644
+--- a/src/lib/expat/ExpatParser.hxx
++++ b/src/lib/expat/ExpatParser.hxx
+@@ -25,6 +25,7 @@
+ #include <expat.h>
+ 
+ #include <stdexcept>
++#include <utility>
+ 
+ class InputStream;
+ 
+-- 
+2.32.0
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
index b1fa96e1be..c112a40ce9 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
@@ -19,9 +19,10 @@ DEPENDS += " \
 
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/MPD;branch=v0.22.x \
+    file://0001-include-utility-for-std-forward.patch \
     file://mpd.conf.in \
 "
-SRCREV = "938728820b11d4544a071994fe3c63c6ab710e8e"
+SRCREV = "18628bf89ebfa5a806971479a71cf9b5764e500e"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.32.0

