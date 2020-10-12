Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.39172.1602505065509164595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uR8gHlHp;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h5so8856221wrv.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=uR8gHlHp9WJRKfGm1W9uULde0zPs4u3cECRUK5Wo3G+Jg3UOpb/lqSiE5W61NqU7GC
         CuM71t6lFJNf1Vq2PnsdJ2KnPGcK4bl3090u3qLkBeI/9b07qBuYwbeTqKIlCUgGQxsD
         G84XYoFbQ+J7inNn0wdjzxx9Xjf1n0jwigkiJ8mGIeNEv6tduJ6DnkINWkqupaYeEvR7
         X8oif+ZjaaXxUn+/CK7tVZydR9Ru07DLpa3/S4ZvcL2OyRRRKgqlGRW/T++UfGv8VzKB
         SS4TIifvCu9L+K26Vb0HMW85ktcedK1ApKJ0jJHNHa2cRhPaeNTmAzToi2IZu+d8utgs
         ooGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=qXVLcor0GpXchuBLTIvpfiK6+MDKEa/A6nzUeeChOndCq59rd8182yo1U2PnzgNNCT
         PyyGTUWxggn+dQ9YM4kFSSNACtap5lkctNsNnVLQLyjBnbIooTn/Qfo4DRoz2k4eB478
         Wx+jeVlbpDzjzKpndyQ37bdey8Bt4i7qw7Mwwfq+fB6hmFbcRtLyjrlLpGR9xfJj9rDI
         Cz2hCuU+PNMsqqshkgRmk1hy8TATs6mLEeBVFqRlqDG2XPDn5a8wbt+rKzbW8pw9R4Nb
         bFSEYzm4MPnjHncVNRdfQMltNXWHRolmD3TKQEV8lQgH+Cp2zubJthn/pmNWZKZzb1qj
         ZV2g==
X-Gm-Message-State: AOAM532wLIa5wRvySouDm3TJErCYGMnuAP7z9jlqxUUX+kYVrfJu0bmY
	tLrNBU5fRwFiTAoSEp0d1jcF+jag6+0iaw==
X-Google-Smtp-Source: ABdhPJySmGKpc+82Hc8pmu0eLf7pHxEZP6XqYD5fiWSEdvTS8ndGxDMHiDDdR1zOoA+/SKMKW8M1CA==
X-Received: by 2002:a05:6000:c5:: with SMTP id q5mr31382688wrx.175.1602505063538;
        Mon, 12 Oct 2020 05:17:43 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:42 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 10/13] gst-examples: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:17:26 +0100
Message-Id: <20201012121729.2094355-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...001-Make-player-examples-installable.patch | 24 +++++++++----------
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |  2 +-
 2 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb => gst-examples_1.18.0.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 0338bad1c0..ab93c13244 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 755f6dab07565aca7b6aefacad8be65de364ff75 Mon Sep 17 00:00:00 2001
+From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -7,16 +7,17 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Denied [Upstream considers these code examples, for now a least]
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
+
 ---
  playback/player/gst-play/meson.build | 1 +
  playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
-index 719b55b..a56fe13 100644
+index 8ec021d..977cc5c 100644
 --- a/playback/player/gst-play/meson.build
 +++ b/playback/player/gst-play/meson.build
-@@ -8,5 +8,6 @@ executable('gst-play',
+@@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
       'gst-play-kb.h'],
@@ -24,16 +25,13 @@ index 719b55b..a56fe13 100644
      dependencies : [gst_dep, gstplayer_dep, m_dep])
  
 diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
-index 08aae4f..671a65d 100644
+index f7a7419..6281130 100644
 --- a/playback/player/gtk/meson.build
 +++ b/playback/player/gtk/meson.build
-@@ -18,5 +18,6 @@ executable('gtk-play',
-       gtk_play_resources,
-      'gtk-video-renderer.h',
-      'gtk-video-renderer.c'],
+@@ -13,5 +13,6 @@ if gtk_dep.found()
+         gtk_play_resources,
+        'gtk-video-renderer.h',
+        'gtk-video-renderer.c'],
 +    install: true,
-     dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
- 
--- 
-2.13.3
-
+       dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
+ endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
index e23d23d9ca..bb998f6526 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
+SRCREV = "009290dc8784e6714dc2a29be123110c14a38123"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

