Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1024.1611269715358534468
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qPA0nEo8;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id e15so2847999wme.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8A6BoZ+0Nvr+JaNtsvJDLrr+P5lcBNNylrn9wLddThs=;
        b=qPA0nEo8qdVA39Atib2oZ3lUoEwtgvlaTvwEg56ixRN4ZfZNsSuPmiHGKqS7ZPjc/i
         8UjyxSgZ8AWspnnUH/3CaSr0WteO8npuyGe6opmfQKEtUciJf7QrnxA/prM/gEEbMg1G
         YXCAFpxNvQdm+Qw/6hbJkAg3U2HP+gmFwOPOz8rSb15+T5sk2CSXq5A/32UfAhVj3zFj
         ALFn3VVbPofQKSem04JvUo/+x+wnfkx9H8YuBDT5OcIa9BZ4YTd69gaA3Pwq7P27l/q9
         iBRo0VuPefJL7UltJtl30vxZourYCfYgEgvOI0XDznSDEe5krJ8GvVn4k1Rz+1P5dgTA
         Gr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8A6BoZ+0Nvr+JaNtsvJDLrr+P5lcBNNylrn9wLddThs=;
        b=VUa9eJeUUFkLJa4eTQGljTy2slRRqXpdHyofqfm+N+dL+erebtapHsHW+0wY4faFm8
         1kczqDdOoef2h8UllYXjU1e2W9vqDPlI2zIn3FZxkqZpy34PkjwMTJnvWP7AQwdjBzNE
         C1E5aQVb7vtmazHgc49UGov2sPWAIb/CCwTn2idPRfq8+AEgfiAonxIqNE27sd9Y1pwm
         hwMDNTTw81rooVEDHXCND1VFLvLtZQ3UhEV8UdQTb8cc2AmIY1DDMLkYm70Lkc4JVnOv
         2vKlTGyREFaTCl+Ect76KaeWp3AYZvfEV+UfVcLLt+y398pMqWuVPIexBHOwYYTFUZOC
         lJlg==
X-Gm-Message-State: AOAM533Cx2HkW2/J6HQS/Q1fLFuAmxBoPnsQGwV5apnxdsgDSslyh2Sn
	UXEBVO8rrxYAvoFiO6vGBukNK3iARmBVMA==
X-Google-Smtp-Source: ABdhPJxV1Fsy+OpZVEoz+CHBgPY5WjRwzVZV8nLCVOHGON4rxqTa5qu3UYmuNKYGkkr3CrL6xJIWOg==
X-Received: by 2002:a1c:9a90:: with SMTP id c138mr1293406wme.147.1611269714014;
        Thu, 21 Jan 2021 14:55:14 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:13 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] vlc: upgrade 3.0.11.1 -> 3.0.12
Date: Thu, 21 Jan 2021 23:54:58 +0100
Message-Id: <20210121225458.278343-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This at least a security upgrade. Although not mentioning CVEs in [1] it sounds
importand to upgrade.

[1] https://www.videolan.org/security/sb-vlc3012.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 -------------------
 ...Use-SYS_futex-instead-of-__NR_futex.patch} |  0
 .../vlc/{vlc_3.0.11.1.bb => vlc_3.0.12.bb}    |  5 +-
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch => 0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.11.1.bb => vlc_3.0.12.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
deleted file mode 100644
index c4465b6af..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 8 Jun 2020 00:50:08 +0200
-Subject: [PATCH] Fix build with Qt >= 5.15
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- modules/gui/qt/components/playlist/views.cpp | 1 +
- modules/gui/qt/dialogs/plugins.cpp           | 1 +
- modules/gui/qt/util/timetooltip.hpp          | 1 +
- 3 files changed, 3 insertion(+)
-
-diff --git a/modules/gui/qt/components/playlist/views.cpp b/modules/gui/qt/components/playlist/views.cpp
-index 24db9d9..71d8514 100644
---- a/modules/gui/qt/components/playlist/views.cpp
-+++ b/modules/gui/qt/components/playlist/views.cpp
-@@ -35,6 +35,7 @@
- #include <QMetaType>
- #include <QHeaderView>
- #include <QSvgRenderer>
-+#include <QPainterPath>
- 
- #include <assert.h>
- 
-diff --git a/modules/gui/qt/dialogs/plugins.cpp b/modules/gui/qt/dialogs/plugins.cpp
-index d233382..9ae9a63 100644
---- a/modules/gui/qt/dialogs/plugins.cpp
-+++ b/modules/gui/qt/dialogs/plugins.cpp
-@@ -66,6 +66,7 @@
- #include <QSplitter>
- #include <QToolButton>
- #include <QStackedWidget>
-+#include <QPainterPath>
- 
- //match the image source (width/height)
- #define SCORE_ICON_WIDTH_SCALE 4
-diff --git a/modules/gui/qt/util/timetooltip.hpp b/modules/gui/qt/util/timetooltip.hpp
-index 6a1329e..9f50b18 100644
---- a/modules/gui/qt/util/timetooltip.hpp
-+++ b/modules/gui/qt/util/timetooltip.hpp
-@@ -25,6 +25,7 @@
- #include "qt.hpp"
- 
- #include <QWidget>
-+#include <QPainterPath>
- 
- class TimeTooltip : public QWidget
- {
--- 
-2.26.2
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
index 7902825f2..046c059fb 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
@@ -24,10 +24,9 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0002-use-vorbisidec.patch \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
-           file://0005-Fix-build-with-Qt-5.15.patch \
-           file://0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
+           file://0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
 "
-SRC_URI[sha256sum] = "189311d28aa814f106a7b3645211ac52c0b3e2b9f4b348de2f63bab3218086b8"
+SRC_URI[sha256sum] = "eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879"
 
 inherit autotools features_check gettext pkgconfig mime-xdg
 
-- 
2.26.2

