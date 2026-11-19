Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1957.1795113491633560854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sSveAVLh;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a60f90a924so59383b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113491; x=1795718291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=sSveAVLh5wW3X2EgJfGz55vMJrp0wn7YHthOf8NAkUYGOlzWBWib19ZREjfiK7kQH4
         8tXQZOHxFPu+GFyHFHigKJa2FIoO/HfFRNeFh+da5GyxBigHhZ04c7OMNSTzKYBzURuH
         KeCliPTvtXv/JTobYpRXZVamGtO/7tHOH/x76e0mmARlV/WXXYESPvn7BHiIhis9XfBB
         tr7NumNrJknLSk8OJEGwFPT50AHV+7SE2jvahIeRu3xC67elDYI0vOHpFBPxB3H8PE3o
         CeIMvAeSeDYnY4uJ9LYkqkIJPaFF9/dE11O14LXU8RsH+AdGh26c0B2eJ+PiI6HwZ+yX
         JslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113491; x=1795718291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd5SD3p0efXkTUYyLJO4uC1u5tQVNvKva8m39m31jKo=;
        b=Lhv6b6wMFosz+HsmDaUuTM8TayivxQdA3CPWlTNa5HGz9Y01bbrUMUbpukIjaEHeMI
         f5I1jJA7JI4WZ7zaufhsndzzkX1VfC5lRtidA8ows0OgLQ7OoKnRkyf9tfmvh8yK8f77
         VGavcWrjMMlh4Hmt4sK0Yv18895z28krQZ91pyHHXtV1TTeYAZXZ1bbf63n8BG+8lDvt
         8qVv0O35qEckkv/k+2ZYpY6lOm5tF7J4VJzlvDPUl31erS3yeubRAkvj2MtOFUfFpCUo
         pcM7+8+DCIfGJh0teZ/X24Ka26XAIDdtTGSXFUzSQOq0Kx2go4H/nvSwJgWUMEuqUtwL
         kZlQ==
X-Gm-Message-State: APuU4Z+DyADdNbcDOcZWQK2+OHgw8ijSVmq1jn4TTkmFGgKAj0tiNzhE
	lXbiFT+NcBccS7S259TeEHTtR6KTb4vGw6mQcRGfE8HkAS989CvBZS43MlN71Q==
X-Gm-Gg: AYBFou1QkoKoDnXa9aOJQZI2DHbBAnOcNhwNvvdGtXfeZ+SQ4noIZhbgG6pqKX9vhzx
	oVb1+ecjSIyFXtz/bauT/DeC9f3MRuQ89+gxw2Lv0LxqAlTxA9/tYsi+/lWzNr6ns/vKqG2R528
	2+Y2IR8TPQke9maBrBYr84VvPmti2YMB58hgMKHFstH6jqujJr+pjXZqeTKZ8x2LlC4/ogdjNye
	E60XFhlkRRvcmAfjjpB+q8paGU5PSwnBmDHqyIsEiplQcl8d3vB2jNFrjFeIy0NojXNZTp0qqzG
	Z7mPCV244VUYk4scJE8AVJoaT+PDJIeyuF3vcoUikqZ6N+WS92cfzGt0KVBXJAYNGqCZuDbJcMO
	NTohc2YPLbpB3X+1DM3DxltV0XB+dYP3luJZY4XF01NlwVk2EIa/zXqnqdvRmgzlk43gZTsAuXf
	sn+1gL/gi5JzEOfJBhjRCKOZ0chFlfLwXrmpKZiDmdgOQgG2MjQR2qoSQoAOGtu88LCB3Osu3Qx
	lR12yAqUHi5igPYr8lQy0FaitBEOiP4fcozousJW7fKN4rQAYDEe/v0Q64HNbiPNnu5m2Vw8Usc
	O0kmYQcAQAr3ACdIF95cz8TB2FW7IzXAaB1auJOCllhvoKvsY2MIsXhouJUjaA==
X-Received: by 2002:a05:6a20:9148:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-4014ae820dcmr514861637.23.1795113490894;
        Thu, 19 Nov 2026 10:38:10 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 54/64] mpv: patch CVE-2026-123095
Date: Fri, 20 Nov 2026 07:33:22 +1300
Message-ID: <0eb3681e733ab8a11def8c52978698e77d259057.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132744
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
