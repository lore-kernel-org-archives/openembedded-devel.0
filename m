Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.10721.1593562054741458149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bn9q1v4S;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id t11so5291757pfq.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YXrFX+e2OXVNvfO0PEF5ZRlp6RFuzLgQl+eL9PF5y2w=;
        b=bn9q1v4SvAFw4qCFUFW9cn0rwSyAcIABvdXntrVD+5O6y1EpCMuPUD1eNJkBiF1Wxt
         0FiMhrsUS7X0Jmzss/Z9TcyqrYlG2s5q9ct2+wlIxXo/VyQ45qzVUFBlmhDxG8aYjUKI
         hy3s+7UC6bjsA20/6DDI+rUEIsnF/c2j+GwU9ysqeWDnSdIB94tTaEZ9kZ0aDPWAtiLV
         qaizP2qvHEi1LHZS1ULG8qr9mTUTyiRADlYt9NN343NKdfDs5xaKgMmIjXDD4pgCUTs3
         Mue8wY9NxA47tP8Rp41mE2SeOmMLCMpiJ8D11Vvp4B+ieR08UPKJkxwG+ueVkqodyTQz
         Fzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXrFX+e2OXVNvfO0PEF5ZRlp6RFuzLgQl+eL9PF5y2w=;
        b=SPHBWQpwlkgqbxEutFeJJB337zefNi2TgZ1kkPJcf0zO0y9ZNKxk+xR87tZGIURuFZ
         l3xmNvPNqB5p4GneCtNy237aStZkn1Q+8CZCTCfoZ1FXgnQibWiaFceM5pK/ZjrjfHY4
         xR1fBvA6ofbYEMpZaV/TGhqCRr8TYT3IYn316vtUsWU+E87/dv4gZP9wiZ8NNMzPDu0A
         C2cDA/BfSJMh+glXpcGdGZ17vzaJwzORScGwxJqvimH7w3K0m+8tZ6KZK5mJuFbiGhJ/
         OYhQXyOUb9CvLgRkOL/oMYJSsuyDz4tAjpSpALZsttZ4WVeG97O5/rM+xYBAO/qCvFuF
         wEyA==
X-Gm-Message-State: AOAM531OqqdNwZPd/xT4192FnZh5fZ46zG7ZSTVInsP8nyxP9TkeacbT
	DmOGzAeIdTnO9AFi38OaXLkjpJAt4uU=
X-Google-Smtp-Source: ABdhPJwO8PAX5axNneqIr3jw2PY3DPTQlk+mddGANK3tIVn0bebCrm8NChqSkIcd6Stwn/cpPxaqfg==
X-Received: by 2002:a63:c152:: with SMTP id p18mr17804041pgi.64.1593562053980;
        Tue, 30 Jun 2020 17:07:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 11/32] vlc: Fix build with qt5 in PACKAGECONFIG and Qt >= 5.15 / renumber patches
Date: Tue, 30 Jun 2020 17:06:56 -0700
Message-Id: <24303fe200ad0d7f273bb36d93fa1756c6d665cd.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aadbc77f8e132301403c1187e8d0488d526f8817)
[AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 0000000000..c4465b6af3
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
index f6c7a606d5..24898a5a7f 100644
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
2.17.1

