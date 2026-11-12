Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8303.1794467649897658676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ojox4N/g;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd69954c755so2806839a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467649; x=1795072449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=Ojox4N/gjMNemM0nwV+9F/x8gGMm7sdNqoUBv3gxljZkHsDWMkKy9qmuMgWGS5f9Mi
         2hd8PsoEp+BlsnWK+AoYIFsW0Z9dpHLUnpmVBkeURyLvZmxhXJNDu+EYXMLfsaXu9RtL
         PBcfmntHDpjqlG1Ju8xeIVVOLvyjd5VjU3rr/Bf5oIgjOT6MRHCl3jEelk2hWYznL0Yd
         z2cVWk3avUIKe5F24fcZc0xj8+xhMHX2vUvu4kemp1QJZ8CsZO74NIm/97LmCzYo+E3l
         G5lBLXhlCehbnQKc3m1J/S8w9NIp2ud6KnKc0ZHHdnnsbeUwWcpnKvbLuNesdNkJVVNn
         JATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467649; x=1795072449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=rCpg2F21dNygSwRt5B/hs23lOw6EOC1K3LxXlQzzbc+AE7RwEAf8j6BVrCrHFMd25c
         6Bv7jVKKlToqfPacZYoMtshgmG74VOBDnNHS7tNpeIBXJOAcb/Fimf8SlkZDYnEwnOWD
         WbvRW264j3HD09ubOGJOo4mOe8eiIWf+FchujAn5PI9bV+9ETXBZvQ54exZ04jMw3/WA
         3LpGOL+Fxh7J+N7QS0jwHEZrVvx7d5dKMBHQsriKMVBgUWOjojAd7oZqHfO3MKqqb4zb
         UiClkr6LsrwqQPi2flkpk/Wi/+fha1iGJ8fSw6WErebKT8N8IyzOtps5Pr2ncujtRrUZ
         fJxA==
X-Gm-Message-State: APuU4Z9NQsKdRnJEVceBySEIe9vOiG4P3fw0rIC7Qf1pGI1KpWNJRTqT
	zOshU1ife2Y95ZdwwW8DaAwJprVycoBQltItNIw8hWwJdIWlOxwoNDyVnUVxQQ==
X-Gm-Gg: AYBFou0BgiS70ITA+1kTNNIneelEZRJdNO7Qf33jOAs5i0khCPTq6/kexPtuy/FqiBl
	Nbeaw2yS9qn+pcV07imftgGe9zMmzRFpxD+oSGBDQ/hO04PZdZXA4uWOaqcDTgE23A2CeabHP9O
	StZy3SWvEbeg4HTAIbC5sAitmvXZoqtOG4avI/VKHTzQZBntQHIWvC7pLO3u4Oodqg/shin0E7Z
	9t+jTyLSawsbAs16Una6CVDWo6tqzU9nxnj0V4fRHZTB26TlJI7cjQ8czf66+TsIvhTmPVgBh/d
	8UU8G0D7ZZT/p+SN5RwRW2wH6hXCa7LADxpP/MFF1C1XzZlQ9n3wSfE3GqaSkBmP1cDxE9tlQGf
	kZFT0J+LkgxXOLrdJfUHLM8bzUH8Ta/IPsVL84wE/1AzUXQbo7IOBM8eGe9KKUxmG1At7+iColy
	bEgEGb8/Es0f2o64JHEk0f8/vy0r+MXpWwrLvrIQs8W9pxrtQqoomsHsPpvcCcse8AstmJpaPuE
	kQxxTMhK+IlAshG3ApSJ5U29pIF+mGSmtDJyhmmAJ5XceFh1tlNrtuKp1NajnhMDDEoMOHFH5lL
	a/IGkiPSkVx/5iCnBJOuCQkj42dvRPwvCf4kN9e49Tc4lFpY17MmisrsrtjJZtSpqmEDrrCciyz
	UdEcmyoo=
X-Received: by 2002:a17:90b:590c:b0:3ac:adce:60af with SMTP id 98e67ed59e1d1-3b182e6f3ddmr4562522a91.16.1794467649159;
        Wed, 11 Nov 2026 23:14:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:14:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/6] mpv: patch CVE-2026-123095
Date: Thu, 12 Nov 2026 20:13:48 +1300
Message-ID: <20261112071348.4144113-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132205
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
