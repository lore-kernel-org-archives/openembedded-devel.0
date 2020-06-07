Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.19178.1591572614219307489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 16:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lHTvnCgf;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id a25so16258319ejg.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2020 16:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+nRjOIpQAshftCgEOxB3Inc+tVikfymhU3FFWiWxCs=;
        b=lHTvnCgfOFdmQxLImWVIRmfl9UdGe5YlexDUCWRfvGPUs1fvg0lIflVMvEQwisDz1w
         nPculMMUhfU9x1xmwYfu+D61fT4rUiM/SjdfGnR1/Ib1+77Dz9l+O5j+WpKksu+8N2S5
         s+m2rF8Il1HgG5ufnEK2ZDUeIS/EtKPrj/isXgD3q7ds18MhXQOY5nDyZ273bsywe/3R
         6NdUbcElQidXd/+sUMVX7Nw2QXxXE37SJMVGA7u2XKN251IUCUbWXCmUgCU6oc+x3cWT
         mi1W2eTw1jGADRenAGHdT9AdrgBmPb4jeMr1q4Ty9qnpW4zbbuB0mN9q2aw4veM/X0Vl
         nwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+nRjOIpQAshftCgEOxB3Inc+tVikfymhU3FFWiWxCs=;
        b=ITyGCu6zRS28e17M6LRRGUOpSnQ/dD+nr8B7ny7NlMkPFbLnOVZqGyQfgspJ04Tigo
         Kz8ZvifEEJcnaMGk+rgUv91+XEBvOajTlSVTClN1lCmhKzP8HTJSmXt9Q8ohz6Ymxe+p
         qdciSKcjm/24TGQWdxGgVJiepaJuGUtEJA/mc2dCLi9wsdbCcwQAx6ORiVdQ1BEUjW2f
         NcQ56OAlNrPs63zyZgRx+pW2YcsAkjwxybwzaM7PwQwM0BX/RN6dPnODCcQuyRi1E+NL
         nsJ7rTTJZpLa7TTMvwfCsTj/ny5yf5XlNVDQJ8uwVuc1ywMJ/2sCanqK2/oyNK9qZnGK
         3nsw==
X-Gm-Message-State: AOAM531GWK9fuVqKbWSmZ2oWvPtLo0spyViXTGF8KDfIU9/n3358H9bJ
	aEzGuf3dl6t6IVcZsr55doBcD6KrvXo=
X-Google-Smtp-Source: ABdhPJwMsjLuIF0nrQKJt6ksjvo3wZLLglWJ1eI9n31/GirkVa22UrOqc1ZQ0DBhI9B23TrpKpgFoQ==
X-Received: by 2002:a17:906:c837:: with SMTP id dd23mr11734441ejb.272.1591572612259;
        Sun, 07 Jun 2020 16:30:12 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f081622be9c7682a114d3b8.dip0.t-ipconnect.de. [2003:f0:7f08:1622:be9c:7682:a114:d3b8])
        by smtp.gmail.com with ESMTPSA id x11sm3759053ejv.81.2020.06.07.16.30.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 16:30:11 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] vlc: Fix build with qt5 in PACKAGECONFIG and Qt >= 5.15 / renumber patches
Date: Mon,  8 Jun 2020 01:30:01 +0200
Message-Id: <20200607233002.2961063-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ch => 0001-make-opencv-configurable.patch} |  0
 ...isidec.patch => 0002-use-vorbisidec.patch} |  0
 ...int.patch => 0003-fix-luaL-checkint.patch} |  0
 ...ackageconfig-to-detect-mmal-support.patch} |  0
 .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |  9 +--
 6 files changed, 61 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-configurable.patch => 0001-make-opencv-configurable.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisidec.patch => 0002-use-vorbisidec.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-checkint.patch => 0003-fix-luaL-checkint.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packageconfig-to-detect-mmal-support.patch => 0004-Use-packageconfig-to-detect-mmal-support.patch} (100%)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
new file mode 100644
index 000000000..c4465b6af
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
@@ -0,0 +1,56 @@
+From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 8 Jun 2020 00:50:08 +0200
+Subject: [PATCH] Fix build with Qt >= 5.15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ modules/gui/qt/components/playlist/views.cpp | 1 +
+ modules/gui/qt/dialogs/plugins.cpp           | 1 +
+ modules/gui/qt/util/timetooltip.hpp          | 1 +
+ 3 files changed, 3 insertion(+)
+
+diff --git a/modules/gui/qt/components/playlist/views.cpp b/modules/gui/qt/components/playlist/views.cpp
+index 24db9d9..71d8514 100644
+--- a/modules/gui/qt/components/playlist/views.cpp
++++ b/modules/gui/qt/components/playlist/views.cpp
+@@ -35,6 +35,7 @@
+ #include <QMetaType>
+ #include <QHeaderView>
+ #include <QSvgRenderer>
++#include <QPainterPath>
+ 
+ #include <assert.h>
+ 
+diff --git a/modules/gui/qt/dialogs/plugins.cpp b/modules/gui/qt/dialogs/plugins.cpp
+index d233382..9ae9a63 100644
+--- a/modules/gui/qt/dialogs/plugins.cpp
++++ b/modules/gui/qt/dialogs/plugins.cpp
+@@ -66,6 +66,7 @@
+ #include <QSplitter>
+ #include <QToolButton>
+ #include <QStackedWidget>
++#include <QPainterPath>
+ 
+ //match the image source (width/height)
+ #define SCORE_ICON_WIDTH_SCALE 4
+diff --git a/modules/gui/qt/util/timetooltip.hpp b/modules/gui/qt/util/timetooltip.hpp
+index 6a1329e..9f50b18 100644
+--- a/modules/gui/qt/util/timetooltip.hpp
++++ b/modules/gui/qt/util/timetooltip.hpp
+@@ -25,6 +25,7 @@
+ #include "qt.hpp"
+ 
+ #include <QWidget>
++#include <QPainterPath>
+ 
+ class TimeTooltip : public QWidget
+ {
+-- 
+2.26.2
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index f6c7a606d..24898a5a7 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -19,10 +19,11 @@ LDFLAGS_append_riscv64 = " -latomic"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
-           file://0006-make-opencv-configurable.patch \
-           file://0007-use-vorbisidec.patch \
-           file://0008-fix-luaL-checkint.patch \
-           file://0001-Use-packageconfig-to-detect-mmal-support.patch \
+           file://0001-make-opencv-configurable.patch \
+           file://0002-use-vorbisidec.patch \
+           file://0003-fix-luaL-checkint.patch \
+           file://0004-Use-packageconfig-to-detect-mmal-support.patch \
+           file://0005-Fix-build-with-Qt-5.15.patch \
 "
 SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
 
-- 
2.26.2

