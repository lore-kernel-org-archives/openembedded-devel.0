Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF3C55182
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:46 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13599.1785620741947833185
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gatAposd;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1224280a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620741; x=1786225541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8LX+LElT+QvEnuwsHDEFLVgFIwGBCoCYZFAl27S5qs=;
        b=gatAposdSLRVilCSQ7bG/dkKVjqDGZ5eFldNkuN07OuJchdpJhy/V76l56cZOKoP2c
         VyOagKX9MyU5o1btDT8chPMFJ1sdiiabShgmQF+7dVQDTcr3PocS2Y0rR/3I9wBPGaVd
         2scENPYYZTj7xj1zkhjmWdjV0Wtc8LCvsI6Gk9GXG1DgMi2Y3kblPB0KGPHLGpTlKTaM
         F1rGhSsmxa/8ES/agCdAuw+Kdrqtr8zowjTeLgN0QZW1M05US84hlcTcACQxmCYsarT2
         lo/rHVk6y9jw2bhjfySebyS3i3czS/14CJyTw+WNm6W5b7Cn1XTBlwxha/1vAzydpkZX
         Rg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620741; x=1786225541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8LX+LElT+QvEnuwsHDEFLVgFIwGBCoCYZFAl27S5qs=;
        b=hWj1QyP8d0h6XMS3XQu3Jt8OErhtY79B8zaCvkwRubCf/nbjUVVxly+HKYvCK6j8PU
         eUCutb+2BtSv6/7+KefczMWnk1QdBJWbPamvvadlldMD5t8Cq0/IudK3ijpEr0VTbsz7
         sJ8kwQLoO1hNeIiJyfPWU6PNvYBRMpMtclPYVj7BdJ4DXX6987ywTuw7g7CrhX0D0NAX
         9ZFN2Mpp8CY2sDDoEc0fpwqqgvlrhZjF6duIdUw5OnaAitM8aG215GijpCFj0oF6+Fla
         JCJJgAeQhhcvGGqXzbvG18k2GXZ37UngsQGOJLQYbv+aACttbse/NwPND4bQa4zNY+yv
         /WyQ==
X-Gm-Message-State: AOJu0YzPdUBLVKHsjj+TBhoWzBuZQ7/K3xGapOKRlRt0g8FP88P7kh3s
	1bBxKh/hB1YvkfzOZDFjdu2hwZUsWDP3nOU4YIkIO+FpwYefky84TbosfPTXLvjN
X-Gm-Gg: AR+sD13Q5aP4YWoxj02EoBq6RRCeYGBaxczNzwarnEj7rpC+ZzrRiSVK0qIhO75u5A5
	26ZxlmP1gHQaLlDcx4hfPGdngNSjquiOHlGjgKHCzTsFeseZoWsuyqDGuSV64CeIbsSfEjQpr7h
	acEEWEzMepO/NMT6wr89LCXqIDMUSVL4GlQBGlCYZct+AaxuUai4sPzW1JtkNZ9j1sQjOsPcG6X
	p60xlS6xSxFkSizFa/OCPA9QkhxC02pzDAKyNwJuorkuMwe6q0PTy/q+YjAwiYS9wkyPaYxdLAG
	33wj6sWNEEoLsyYYAeQGRtWfIXzbODCHgP2EDdCLzDPR8cAtjTSZ0F49T0cBSTHEq2qePWWMRPJ
	KRfyUXQIPU9J7XzPS2Xn8a9VBNMdeLWIrn0n98Y2XV/F9gCmF/7TkfaG7X3rXOnUqnMRwlcdAPF
	lMsdYYTSYyUYiCpJBA8MNgZ++Fvq63sGyTJEH6PH8SL9nFrUSg8QnnxhVzF2geS2Fn+LJYwC0W+
	vudgONy8wt8A3bPBczDIPcaVh83376xvAiZ8JxP2vmQc4sDhcJBdQSFAIoDZCYR0GlXxjSg9Ejh
	ea9oAJUXkNeJ18uK8hl2dw64AM47WO3nCaKznrp3za4ge0Lx6Z/KoQbdUFiaAHQsWtfgA2HrKor
	PI/w8G1QeXt50
X-Received: by 2002:a05:6a21:6007:b0:3c3:7ecd:72df with SMTP id adf61e73a8af0-3c92a848362mr4591486637.30.1785620741151;
        Sat, 01 Aug 2026 14:45:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 13/31] mpd: upgrade 0.24.9 -> 0.24.13
Date: Sat,  1 Aug 2026 14:45:08 -0700
Message-ID: <20260801214526.788343-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128630

Upstream changes (NEWS):
 * 0.24.10: fix input cache deadlock; sidplay millisecond timestamps and
   libsidplayfp 3 support; allow building the upnp database plugin with
   libupnp 1.14.30 (API breakage fixed upstream).
 * 0.24.11: fix a path-traversal bug and disallow newlines in song URIs;
   curl input requires >= 7.85.0; fix a PCM decoder stack buffer overflow.
 * 0.24.12: allow empty URI in "lsinfo"/"add" (0.24.11 regression).
 * 0.24.13: number-parser range checks; curl storage drops auth probe
   requests; Opus decoder no longer adds 5 dB to header playback gain;
   limit ID3 tags to 4 MB; pipewire fd-leak fix and "media.album" tag;
   allow AF_NETLINK under systemd when UPnP is enabled.

Drop 0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch:
0.24.13 already migrated the affected sources off <fmt/core.h>, and this
distro's fmt 12.2.0 still ships the <fmt/core.h> compat header, so the
patch no longer applies cleanly and is unnecessary.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
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

