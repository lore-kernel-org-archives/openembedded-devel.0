Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8420.1794467546445440918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZKBezOsj;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1662262a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467546; x=1795072346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=ZKBezOsjN9vgBwTqohCM1H+lzu+cKVXFIvf2mO6GOOuq4D/CuMiRNy0GuDF3rBniAz
         CQTLQtJst3P9m54tgTd+v/KVQH20gToLoY+bmERe0FvkdTO+FLq8hJlrZH8XRkaYTCDG
         b0+X/irLtXR7JHJcUBcnktu5e02LA8ZVm2WoerySmvwYbTNktKwBNHy0DBoeyoP0yKA4
         eALl6Be9Lgbxj4ejMqluEz52oC7dVip8ZMsqg2j/+ByQf7Ntlx86l65qphaMOLY/ltBN
         qplygTVFsIb9BlQKSOHMIIaSREWkwptBRX40dtmxLRgek1uLhgofR2f/w5DSjvr/26W6
         iAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467546; x=1795072346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=vwjuNuI/DQFrH71ZWS66gKAB/Z68uIW0VlVkSs1S3K67Svivmcy9XA4EnN5C+CLUG8
         HprZwyNezZ+QW72XvwQ0zgbgRqgVyUlH9CldQ3h+uWP7JD2EZ6/jyXKHptHvISGM52ab
         qTEAQxLI9RUENBjPmBXn+XBb4n6GcDfkBv8nUfQZQybRthFzVJh9Tjboutg7Rp1N0vTf
         ODiO300fo0xtQvaf/ZsqbJ+0iXu4BjWSSraGcn+t1pQPZVMFs4bJ25CUWjt153xzJ2gj
         +jkpVLIc17kQaiHYHsPToPltbqiuckeEVwufvORLdzuuppf8huzxRfpqEE0HLJyE2uan
         ZGNA==
X-Gm-Message-State: APuU4Z/1kN2O+O/2IolbJJap5MV1xlPfnIdG0D2WLQEOpYb5c9fK2Dxc
	/h0KrxtTXJBC8z+Xx0BYDQXqsM6QavATiNWDYxopPpHdWE2ueLTCcNc4Hp385g==
X-Gm-Gg: AYBFou0Xg+vvFjGQLF4gWGfqy8P36cvuu7mXGVue9C6aLYZKwpEgpaOUhrDS9Ic44Z2
	NanbWnf6q0H1CO/gJ8ih5V2zNPSyfPZQmLy6Mxokqs2DW87WEsDwV6XclggJ7rWq8YLEjZqL79b
	lkt5JcHTdlZiANYkMO/zHEW9k0s+2e5oTyscEpVNkXgi1b6WmYrL9cY/JUvSsB8SDP4m0jG790K
	euz6bhwAxW5kIvBlnwbYcdetNZX6Tt+UucCoPfM80f7ALLdnOW3t1H1ZxGVTaKqQs0nUDJJ/ls3
	V2Utk3rf7dF2IpoTk5QtyDYnY7fKXAzxA/PqnbAgmCx8U3u3IikMvTn/UYcnhtvhBobDKhujDP3
	oa+eNifcWrYbWyKkeYJ9k7yU2BDB6iPyEULIt8AY6SZ7u/61TYk32502GffhZsGVR4uBdlysTnG
	mwhZ1hJOa7Ilq1IGvlcfM8hBVmi4mMnDU+sCEjBuJ+IvTjh0xpFHFOvNML4eYoikgWngTQR+OPU
	aUjCAejlBEn5FajHoYGgzJbePJlQNyjZwrM+zNpv74kcL4CFL+T8yAvW93QAkEtPP310SaqcCue
	uzaZgs8vkKSaCQqfug6ax/QPRNTuxzVoK4GdwkYSfDOlYWM+8nksWTfFU4Uz9u9ZtKFFvdmhfbr
	DweErvQA=
X-Received: by 2002:a17:90b:1d0c:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b182f59b68mr3444398a91.45.1794467545455;
        Wed, 11 Nov 2026 23:12:25 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm3016298a91.15.2026.11.11.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:12:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH v2] mpv: patch CVE-2026-123095
Date: Thu, 12 Nov 2026 20:12:17 +1300
Message-ID: <20261112071217.4141727-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132199
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-123095

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mplayer/mpv/CVE-2026-123095.patch         | 37 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
new file mode 100644
index 0000000000..1efa0fdee6
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
@@ -0,0 +1,37 @@
+From 2c6599aa7d16efd29ae49865757eb449d9306742 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
+Date: Wed, 4 Nov 2026 20:28:57 +0100
+Subject: [PATCH] ytdl_hook: reject playlist entry URLs with control characters
+
+The entries are joined into a memory:// M3U playlist, one URL per line.
+A URL with a line break became several entries, and only the first line
+went through url_is_safe(). The other lines were loaded with the origin
+of the opened URL, so any protocol was allowed. Skip any URLs with
+control characters.
+
+Fixes: e6e6b0dcc7
+Fixes: GHSA-p99g-m25w-x8xv
+(cherry picked from commit c3096515dcd26c14004f985538b5aa41db613856)
+
+CVE: CVE-2026-123095
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/c3096515dcd26c14004f985538b5aa41db613856]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ player/lua/ytdl_hook.lua | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/player/lua/ytdl_hook.lua b/player/lua/ytdl_hook.lua
+index 65ef859595..2b0edb193a 100644
+--- a/player/lua/ytdl_hook.lua
++++ b/player/lua/ytdl_hook.lua
+@@ -1111,6 +1111,9 @@ local function run_ytdl_hook(url)
+                 -- links without protocol as returned by --flat-playlist
+                 if not site then
+                     msg.error("Playlist entry does not have unique URL, can't add it.")
++                elseif site:find("%c") then
++                    -- a line break would add entries to the playlist
++                    msg.error("Playlist entry URL contains control characters, can't add it.")
+                 elseif not site:find("://") then
+                     -- youtube extractor provides only IDs,
+                     -- others come prefixed with the extractor name and ":"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index f37ae4ac50..0c99e354e7 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
     file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
     file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch \
+    file://CVE-2026-123095.patch \
 "
 
 inherit meson pkgconfig mime-xdg
