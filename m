Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6839.1794458688358851996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xdAd/A77;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b904d10882so1723165b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458688; x=1795063488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUz6b237LeBwom0vnUx9UXSM0szJhlsGYhXyLTK8h0Y=;
        b=xdAd/A77QVdHEKDi1Nrn5FaEyA6q6z5VK74X1pQQcTnTmTRv/nLlhc8pADhdCvMcNm
         Wu8Dpuce4MCRb/ld9J6nwAqNFAptW5IrzHDuX2oBfb1VaEu8SPIITornaKnLFz5zfmqM
         KTZjfsEnRXTYXnp/t6fn8UkHrDRCQjiH+mCYrkUC2lghpa8qCqto10zxqOEuMzgXldkO
         76c/sB1k5nIxdswSrA88BDwYAwPDRV28K09NK20wyN1bDUoyF+/se1wSv2HqVfR1AL84
         omEjz9NzoaRnP6fsIubEKTICgxP7ebrs99fYMwSssa4R7l+s2+isDsX+nbkJEmEFINLx
         JkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458688; x=1795063488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUz6b237LeBwom0vnUx9UXSM0szJhlsGYhXyLTK8h0Y=;
        b=SltzNPvejkl6x2J/Sdz/OpUG6qlaxXDiUHQ3UL4jxH8Zp2ytviyU4nwKUYuS+X+RJY
         LPStKunTX9YHTXCE6JwqdgVvTtBly5yqYCisWgV+9mRleX1EgtfFsBLbpGbF0LJxSViT
         PkUCC6rsZu0zzIbjM9PcEhd21ca2Y3PjGzoTPsBb9D6FlTeWQsyQKtxNfhxnQDhaRwXx
         viigodoXct+tOy34QQ1x6rRuHI60WdfKTTpwurTb2LjvpSVo34jLFMwSSWkcehnPis0i
         u1M2hQ1j9V0zHanNUtIIh5QQH5fk++tEujuFhoHkm8U+DDaUH0zF8Csbto3N4kO3waBo
         N8ag==
X-Gm-Message-State: APuU4Z+9Dp0He9INhsv3ePfvPYnuw9WbGsqXCP+rP+e7IQ7gJE3a+Y1I
	3h+Nz9wKAzhWkNU6NRrES6V3/SwbJT9bSBDPLG+CckCkmTbXP+O1BpJfNSVzCQ==
X-Gm-Gg: AYBFou3WwTOpCs2fDHA6DTiNL+MlrcapYEayLAfnSCYOloSnOWakBk2IbIAJcyLSa96
	5VnLE+1s3spwJmP3p/OHLdApBsJtrOp5/36nd8wI72muLfqlbRGv5+3N65gy5g4Z/RD4TEZM0vd
	hcMnIiAGeFPSbEn7t47SckP4EUPyFidorghZfNtmN5fm6KKl0F33mA1z7ypJDmOQK5Pm5N+StLX
	+AxyYMp0H/nY34jh2M5sIWnvpvhBfuEPecAuu2eiZwtyz5AIEYP+pFFB+uqI5EHp8lCLHA3YF8g
	mo2z9/PnKIM5nfCWazoiy9wY7IEVnTswrRBlSiY2JqJDtWNBTvTyZRqiE+HbaJURUnYUK+y5zcr
	t7k/AFji4o068nLUP4R/0SFx4Ue9uQI6hqLWpl8H7nrlbPzqgycRSukNMUVbBQ7D1ezxAe9hBFE
	kBoTpvuq8YhzqMPe9Ksi5g6HyFsCtgmmDCXvHyxCe27THugm3zeIECrld0DmOPekNLL87r+pLNz
	siF3p1TA9uZTJLV5GcVOWWqArGneQUCWsUr3/rb2+5GxqoluaS+jR/C9VV6WIJ5A4Z8ERg5c4mW
	kOtpGRLdPHhPWnOVkbX1yI25ZgNFYF0Mnbc1N6dvhlxj4iJl8y0V9JkHt0WJ5nyl8scdK7ZaTL+
	g09HTj5s=
X-Received: by 2002:a05:6a20:4388:b0:3e2:1aa6:ac24 with SMTP id adf61e73a8af0-3f2fd8a102emr4574061637.32.1794458687665;
        Wed, 11 Nov 2026 20:44:47 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 6/16] mpv: patch CVE-2026-123095
Date: Thu, 12 Nov 2026 17:44:16 +1300
Message-ID: <20261112044426.3933391-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132157
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-123095

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mplayer/mpv/CVE-2026-123095.patch         | 35 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
new file mode 100644
index 0000000000..9cbd7d8b96
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
@@ -0,0 +1,35 @@
+From 29025d6211cbbceb5e74c3619ddec9dc2fb20ed7 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-123095
+Upstream-Status: Backport [https://github.com/mpv-player/mpv/commit/c3096515dcd26c14004f985538b5aa41db613856]
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
index c8a0222ebf..8c68de04c2 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -23,7 +23,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 LICENSE_FLAGS = "commercial"
 
 SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV} \
+           file://CVE-2026-123095.patch \
+"
 
 inherit meson pkgconfig mime-xdg
 
