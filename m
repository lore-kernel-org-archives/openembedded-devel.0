Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB9C55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:40 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5289.1785589952021691102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=msNtGwPd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1096963a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589951; x=1786194751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqAFkLti4J+hv8z3r0djAoGHyqk/0rWPPlcPtBUHFXY=;
        b=msNtGwPdo/vB6TAorDBAIMB5QmjiX/Hv6PyfnKj48s9CJILHQ1KBsQspbZQWCqOtdH
         GCYGiRI/CCEoTWHBG6AqKv776QrCV5ge6jNUsoDzZf+tFI/hvXK31jX5gv9HfF4b8wg7
         O2MfjbEISJB6CvRdtLyyfUzKSERqEMKVBh9/uYZIsHsllMMLmeALghCT8S7TnpXOSiKJ
         xyHcULWiZL+vKNNozFMje7osiObW/LOCqdM8kb1nlfgwP5tyZgtA3hT4x6ijN/+4ICKu
         ZxIN+Fz3ahdmnGLJOXiJPtkwhzWyPaSxAlfXI576d12yZ7b/J2H0ceJkoAubK4WgFHsQ
         x7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589951; x=1786194751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqAFkLti4J+hv8z3r0djAoGHyqk/0rWPPlcPtBUHFXY=;
        b=A5zzNRwNSvKHbL0tkb8CdY6uyJUpopPVpHxj4ATVcjU4p8aM4iz8g9c2Y9SeE+MYas
         LsQ1figVo4Nd6UQjlVORYnJx2KW8VxJZkG0oZTqlg1Ek4MvFCPO99cUwFULB0eVBr+Ug
         0WTXEXuAW06k2guAf48B2YLUMVHRBbbniMFm7XqoZG9bmMp2xYTbPV8VORLDXX16xF1I
         jA181eVaAHmmJXb5DG/4cDLYRNBlQCh6/rKUpXsBAnUEmZBjok6NL2sRTX8G98emlQDj
         sKH2NdxMWTmMHnTpteVX3TVEsnrMsDxHcQDoBqKaTUQfEERn380ZUyMYHxalKHq5WB32
         g3Kg==
X-Gm-Message-State: AOJu0Yxa5zaHrNBofPbgPfepA1LibqUI52CABvzaw0Jag5/CstUmMDP8
	8pez4s2Nto8EFCykxEyQeJFC+8FB5vyZD9/n8kvuq/yDHecvC9bxEWTK/7f9icpW
X-Gm-Gg: AR+sD11j1NrMg7e0Auwssn/Fxsl1EuekGTD4b0NipjLDtAMfEE+R9pPmXviPVzbqhxN
	kE9PiqdFV9Js7/S1+E29LzZW7RrxGa5C5nOidMckjhyFM9jfpzhVYFJ8qJNHWAVHIDfc+xri1E5
	3Jth5b+xuLPj7eYI1Iz95uWnduBGsNnV+Nwao8K0Av6s/dYjPGZy78jMLXGGv/E5HpKKouADppl
	k93OOSBPrkzswtYfEZC5v6FIOBGRDx25+g7xtX05vR55J2kVrtgw12VKPmNPV7rl7kiYb1P0JXt
	Lc79YeHnd0BeFeBQ7xVU/YwQaFLrNyhS5ce5WirtUJzr2Du0JsPwKvC2/zKH6u4opIyvtQDE+R8
	6ELU1kFafoCHM7O1wM05zSetXZLI2LsUWsrzeprcSnZex/W+An1TnVJiXhXRhZCiBtRKyDF/oD2
	lZ3D31+X4hBa8kE2sZkNWK4w35PDPUK1nTOBSCqUrb4RZyXmZFOiFi3CFsGI3ZnYK3v5gjI86Vf
	w==
X-Received: by 2002:a05:6a00:391f:b0:848:65f3:23c1 with SMTP id d2e1a72fcca58-84ee49aa1a8mr2764871b3a.69.1785589951297;
        Sat, 01 Aug 2026 06:12:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 16/20] mpd: upgrade 0.24.9 -> 0.24.13
Date: Sun,  2 Aug 2026 01:11:34 +1200
Message-ID: <20260801131138.3299410-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128610

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.13/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...port-use-fmt-format.h-not-fmt-core.h.patch | 208 ------------------
 .../musicpd/{mpd_0.24.9.bb => mpd_0.24.13.bb} |   3 +-
 2 files changed, 1 insertion(+), 210 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.9.bb => mpd_0.24.13.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch
deleted file mode 100644
index cf5da582c8..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 8 Jul 2026 00:00:00 +0000
-Subject: [PATCH] libfmt 12.2.0 support: use fmt/format.h not fmt/core.h
-
-Since libfmt 12.2.0, <fmt/core.h> is a shim that only includes
-<fmt/base.h>, which does not declare fmt::format(). Building against it
-fails with:
-
-  src/net/ToString.cxx:80:16: error: no member named 'format' in namespace 'fmt'
-  src/lib/avahi/Publisher.cxx:37:9: error: no member named 'format' in namespace 'fmt'
-
-Include <fmt/format.h> directly in the files that call fmt::format().
-This mirrors the upstream fix (MPD commits 88d5b5248d71 and 109c26258b9d)
-extended to the files present in this release that call fmt::format().
-
-Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/88d5b5248d71]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
---- a/src/client/New.cxx
-+++ b/src/client/New.cxx
-@@ -17,7 +17,7 @@
- #include "Log.hxx"
- #include "Version.h"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- 
---- a/src/db/plugins/upnp/UpnpDatabasePlugin.cxx
-+++ b/src/db/plugins/upnp/UpnpDatabasePlugin.cxx
-@@ -24,7 +24,7 @@
- #include "util/StringSplit.hxx"
- #include "config/Block.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- #include <string>
---- a/src/db/update/Playlist.cxx
-+++ b/src/db/update/Playlist.cxx
-@@ -20,7 +20,7 @@
- #include "fs/Traits.hxx"
- #include "Log.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- inline void
- UpdateWalk::UpdatePlaylistFile(Directory &directory,
---- a/src/input/plugins/AlsaInputPlugin.cxx
-+++ b/src/input/plugins/AlsaInputPlugin.cxx
-@@ -27,7 +27,7 @@
- 
- #include <alsa/asoundlib.h>
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- 
---- a/src/input/plugins/QobuzClient.cxx
-+++ b/src/input/plugins/QobuzClient.cxx
-@@ -4,7 +4,7 @@
- #include "QobuzClient.hxx"
- #include "lib/crypto/MD5.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- #include <stdexcept>
---- a/src/input/plugins/QobuzLoginRequest.cxx
-+++ b/src/input/plugins/QobuzLoginRequest.cxx
-@@ -6,7 +6,7 @@
- #include "QobuzSession.hxx"
- #include "lib/curl/Form.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <nlohmann/json.hpp>
- 
- #include <cassert>
---- a/src/input/plugins/QobuzTrackRequest.cxx
-+++ b/src/input/plugins/QobuzTrackRequest.cxx
-@@ -5,7 +5,7 @@
- #include "QobuzErrorParser.hxx"
- #include "QobuzClient.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <nlohmann/json.hpp>
- 
- using std::string_view_literals::operator""sv;
---- a/src/lib/avahi/Publisher.cxx
-+++ b/src/lib/avahi/Publisher.cxx
-@@ -13,7 +13,7 @@
- #include <avahi-common/malloc.h>
- #include <avahi-common/alternative.h>
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- 
---- a/src/lib/nfs/FileReader.cxx
-+++ b/src/lib/nfs/FileReader.cxx
-@@ -10,7 +10,7 @@
- 
- #include <nfsc/libnfs.h> // for struct nfs_stat_64
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- #include <cstring>
---- a/src/output/Init.cxx
-+++ b/src/output/Init.cxx
-@@ -24,7 +24,7 @@
- #include "util/StringAPI.hxx"
- #include "Log.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- #include <stdexcept>
---- a/src/output/plugins/httpd/HttpdClient.cxx
-+++ b/src/output/plugins/httpd/HttpdClient.cxx
-@@ -13,7 +13,7 @@
- #include "util/StringSplit.hxx"
- #include "Log.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- 
---- a/src/output/plugins/httpd/IcyMetaDataServer.cxx
-+++ b/src/output/plugins/httpd/IcyMetaDataServer.cxx
-@@ -5,7 +5,7 @@
- #include "tag/Tag.hxx"
- #include "util/TruncateString.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <iterator>
- 
---- a/src/song/AddedSinceSongFilter.cxx
-+++ b/src/song/AddedSinceSongFilter.cxx
-@@ -6,7 +6,7 @@
- #include "time/ISO8601.hxx"
- #include "util/StringBuffer.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- using std::string_view_literals::operator""sv;
- 
---- a/src/song/AudioFormatSongFilter.cxx
-+++ b/src/song/AudioFormatSongFilter.cxx
-@@ -5,7 +5,7 @@
- #include "LightSong.hxx"
- #include "util/StringBuffer.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- using std::string_view_literals::operator""sv;
- 
---- a/src/song/ModifiedSinceSongFilter.cxx
-+++ b/src/song/ModifiedSinceSongFilter.cxx
-@@ -6,7 +6,7 @@
- #include "time/ISO8601.hxx"
- #include "util/StringBuffer.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- using std::string_view_literals::operator""sv;
- 
---- a/src/storage/plugins/NfsStorage.cxx
-+++ b/src/storage/plugins/NfsStorage.cxx
-@@ -28,7 +28,7 @@
- #include <nfsc/libnfs-raw-nfs.h>
- }
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <cassert>
- #include <string>
---- a/src/net/ToString.cxx
-+++ b/src/net/ToString.cxx
-@@ -6,7 +6,7 @@
- #include "SocketAddress.hxx"
- #include "IPv4Address.hxx"
- 
--#include <fmt/core.h>
-+#include <fmt/format.h>
- 
- #include <algorithm>
- #include <cassert>
---
-2.43.0
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb
index b4d6604b21..60abcdb90f 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb
@@ -20,9 +20,8 @@ DEPENDS += " \
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
-           file://0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch \
            "
-SRCREV = "7a9afa059e95668c912f779219ee8fe1e44dd2aa"
+SRCREV = "e9a65d66ef2a64ac6881e6e9e316e8665dcfd4a3"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \

