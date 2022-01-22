Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7FFC433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:47:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2076.1642888020043688439
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/t1l7gj;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id f17so6464836wrx.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m6C52p0/otumOp1CU3xDtS41twLhl9sjFPpuZZQakT4=;
        b=J/t1l7gjI2ao7Hn/8Y3x13B/MdQNG435hkOaGlihdJZddRDB8ltRAQFpW9fQ5MUpJ5
         nIURLwaDDK9lrgy8JRcOhGBCTw5bPv44qA/cPGljh0sEn+Ur/3JUdWFYMnnvDJIYX+8X
         G7rvCCwj91ew7ebvRHuoZw5MUe5ZJD00B6xAqNgBKGBt0rB2QnQcaGmlvvHB2VzD+wDS
         g3xoYt8Tua7jBN3j+65dfCV7QLK7NOCOTzWCSwMdMHM1l5C9yF2MAdRec4fYR6eP5hTE
         fisavaVc/3n2iuz21FrH8zclXPRC+TfD3Sv8MrOGtyJis6R0vDy5OsaX0HsfYun/RrYb
         yLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6C52p0/otumOp1CU3xDtS41twLhl9sjFPpuZZQakT4=;
        b=4XcJtp/FJ0CBV6b5f8yR1nDChO6eDPhlHtakZHUDp6QeJe0qt3JpYtXk4Ol1yeXpVQ
         w5IJYIyvY7thf3LzLB2msQdCnhznCJOEyxcjnWBpcLvfGXvlagp6cAk/AgceUoEC+TZY
         FZKyBPLG6+NYdS/G8w8JLQrAbB7H6w+QVdLmE9rghvui24nfzcL9oaAq5MPLtwyhxDXb
         GuJkms62lg/KnKCm0N3lJy32Uemfi7FIze4LJSIwyCEc0LtXAloBWUeXHTIlLDnJUzYv
         FrLypj9lj+ctossRP1k24JSX7k+YL3bC4wO15w+1xT5SPuiQXugfESyj7hSb7sjNB/sr
         5TpQ==
X-Gm-Message-State: AOAM531e2uEdBizKCJ7/XyZQdEg/9hhgeMUtH1WwTCNjCQbVLKaiuUpK
	pYhr3ejW9p24mFZNoY37FP7Twn10ZEo=
X-Google-Smtp-Source: 
 ABdhPJyU+dbo1DVAoT8/kZ1wmbi8TYNIpWUjHRWN/mgG05hsMUvpHMrh1DpsNt9+Sxk6nr0Jw2bPkg==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr8741792wrv.412.1642888018676;
        Sat, 22 Jan 2022 13:46:58 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 h11sm14491343wmb.12.2022.01.22.13.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 13:46:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] mpd: update 0.22.9 -> 0.23.5
Date: Sat, 22 Jan 2022 22:46:50 +0100
Message-Id: <20220122214652.929263-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220122214652.929263-1-alex@linutronix.de>
References: <20220122214652.929263-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95009

This resolves ffmpeg 5.0 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-include-utility-for-std-forward.patch | 43 -------------------
 .../musicpd/{mpd_0.22.9.bb => mpd_0.23.5.bb}  | 13 +++---
 2 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.22.9.bb => mpd_0.23.5.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
deleted file mode 100644
index 68ccb6583..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-include-utility-for-std-forward.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9bb962148672a3c20fb0119d7f71789b8ef3dc02 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Jun 2021 19:31:34 -0700
-Subject: [PATCH] include <utility> for std::forward
-
-Fixes
-../git/src/Log.hxx:121:42: error: no member named 'forward' in namespace 'std'
-        LogFormat(LogLevel::ERROR, e, fmt, std::forward<Args>(args)...);
-
-Upstream-Status: Submitted [https://github.com/MusicPlayerDaemon/MPD/pull/1201]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Log.hxx                   | 1 +
- src/lib/expat/ExpatParser.hxx | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/Log.hxx b/src/Log.hxx
-index a295ed9f6..87097b086 100644
---- a/src/Log.hxx
-+++ b/src/Log.hxx
-@@ -24,6 +24,7 @@
- #include "util/Compiler.h"
- 
- #include <exception>
-+#include <utility>
- 
- class Domain;
- 
-diff --git a/src/lib/expat/ExpatParser.hxx b/src/lib/expat/ExpatParser.hxx
-index e1723d109..4b5221e89 100644
---- a/src/lib/expat/ExpatParser.hxx
-+++ b/src/lib/expat/ExpatParser.hxx
-@@ -25,6 +25,7 @@
- #include <expat.h>
- 
- #include <stdexcept>
-+#include <utility>
- 
- class InputStream;
- 
--- 
-2.32.0
-
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
index 4eac25674..3c6f3e41c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
@@ -15,14 +15,13 @@ DEPENDS += " \
     icu \
     dbus \
     expat \
+    fmt \
 "
 
-SRC_URI = " \
-    git://github.com/MusicPlayerDaemon/MPD;branch=v0.22.x;protocol=https \
-    file://0001-include-utility-for-std-forward.patch \
-    file://mpd.conf.in \
-"
-SRCREV = "18628bf89ebfa5a806971479a71cf9b5764e500e"
+SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
+           file://mpd.conf.in \
+           "
+SRCREV = "df4b6b92f2c4bba1b55fe0a5559b19808abb28ff"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
@@ -63,7 +62,7 @@ PACKAGECONFIG[oss] = "-Doss=enabled,-Doss=disabled,"
 PACKAGECONFIG[recorder] = "-Drecorder=true,-Drecorder=false"
 PACKAGECONFIG[smb] = "-Dsmbclient=enabled,-Dsmbclient=disabled,samba"
 PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
-PACKAGECONFIG[upnp] = "-Dupnp=enabled,-Dupnp=disabled,libupnp"
+PACKAGECONFIG[upnp] = "-Dupnp=pupnp,-Dupnp=disabled,libupnp"
 PACKAGECONFIG[vorbis] = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis libogg"
 PACKAGECONFIG[wavpack] = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
 PACKAGECONFIG[zlib] = "-Dzlib=enabled,-Dzlib=disabled,zlib"
-- 
2.20.1


