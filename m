Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18067C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1213.1783903517147767441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NvVFyA8/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so1764784a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903516; x=1784508316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4v0zQmiByjhZ6dIHqEN3HKVcLkVtiAYjEyH6cCeF2Rk=;
        b=NvVFyA8/OYj+BgVzgOEHwY1DNtytvekz+MG9BAG1Tz+wEHuitadYgqhcr8+D/gTFcy
         jEVtHn6GTY4Bcd9gDx7T/isstc/2f8Atxupgm/08UjbHGXNynN0nTpNSMyuHjijeRMuQ
         w1u0m+eH3KDHUoPvE1ZI3TCLSfuf/AQQpMSZVVp9a0ERa0vpmjjaJQJhLKggViJ+7Qmt
         Dr2x4786tzQyY0Hnbp3tvKVUELkfyekQo6Z/UrZemZZISZ7VDy57HOuCp0gtuX2X/13C
         MvAaWk/e9k6oW+XKUjmOZlkMDBbWNhsUI8nRfeySdGBuA+lPjmwWB3u5HNDcPdI4R9Ga
         Kywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903516; x=1784508316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4v0zQmiByjhZ6dIHqEN3HKVcLkVtiAYjEyH6cCeF2Rk=;
        b=EwCeAIYuusDm6Xhx1vrohu6M5pf+EuW2ChV6Nyku0w2KvZFBewC3ba3PPscxERqzl8
         q4NIv9Ly/rvolPTxHGrIfdDX/oK57levOAkpe+yWCNeK+shXXbStEknWWdIaahxv2Umt
         QQT9fspcCfj5e30J2g8FyZJYUnjFzIZ+dMkaaT41YmngerWE/L5qZgT+uUbku0vQ+18y
         wevoMznU6PGQacZVerfe8e1TAhx2SWsfgbERrBom8xLdVW8m/1SHy+pRlpXF8ZuIdwWi
         Q3eA1msv82AWo2kF3y41Yu2mxeaNh+Gy2fQYIW/TPWlbX7SGKl9KNes1pYfPC/IhBtcl
         4nig==
X-Gm-Message-State: AOJu0YyUv9JAl9vgzg2h3fzE5+zlzLsmX/AfZJe6Znc5yCaGHcxvz36x
	D/9nPGEURL9QaJ9yiKJ6DE6heKf8SHCgzq9IWVt4Gbbz1cDVY5WRfsLV2fSAYoIqGQM=
X-Gm-Gg: AfdE7cnbczDgY95MZZ5VQBz6p28IlN0tyzfzGHe8Ar/njYVqSxu2oweZ6jDPQxRNk1B
	svgxGdEthzpdlZM+UMqFQvLXPMaqZmwILfCs33j0sZNT2A3VO6cOhhugr5kTRRnYEUu3nlnRaGz
	npobkwmCLnV5npiPOpqcrVDJDFO5VaU4t5lGE4UixdkFCXV2dbXm3/xS8UDmYxG77xx57LcWoUG
	S157V4ugjWnBeyTJvBoQdqhhRjpkQDk6hblurISrByzral2R9toi0oUoOZxh+JF5CLUDFTQ7sLD
	Up2um2HBIK72vgXzrBB1MLS/MfMgoFHYVQx9Y7xt6VwsNbRPnTMmlQwescB3Xhp1K2W1AvLppE0
	pSraOMy5/UzOjreMT0RMOWFyVpmInsqFM+ACY+MoMe68gYFL/EXsXyjRi4JwDVAOIZYWh31ZAvl
	SuP/PvJXI/9jtajjgJS+3vT0xz+dF789fax02/C/MHxsiIOAFYf16FmQuZTkRz3MP+0/laRBUUX
	tmhSCFnaR4LT4p7j5YsByeMP74wagW9Dj9Oyu3b42Q5eNzt9zd68/TtzF5ymU2hgLPtLbtFqvxQ
	vxnQPAi0flkEngU7DiDaykJ5RIQt5w==
X-Received: by 2002:a05:6a21:6e95:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c110a65fdcmr7427330637.25.1783903516384;
        Sun, 12 Jul 2026 17:45:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 8/8] mpd: fix build against fmt 12.2.0
Date: Sun, 12 Jul 2026 17:45:02 -0700
Message-ID: <20260713004502.716970-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128150

Since fmt 12.2.0, <fmt/core.h> is a shim that only includes <fmt/base.h>,
which does not declare fmt::format(). Building mpd 0.24.9 against it
fails with:

  src/net/ToString.cxx:80:16: error: no member named 'format' in namespace 'fmt'
  src/lib/avahi/Publisher.cxx:37:9: error: no member named 'format' in namespace 'fmt'

Add a patch that includes <fmt/format.h> directly in the files that
call fmt::format(). This mirrors the upstream fix (MPD commits
88d5b5248d71 and 109c26258b9d), extended to the files present in the
0.24.9 release that call fmt::format() but were not covered by those
commits.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...port-use-fmt-format.h-not-fmt-core.h.patch | 208 ++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.24.9.bb  |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch
new file mode 100644
index 0000000000..cf5da582c8
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch
@@ -0,0 +1,208 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 8 Jul 2026 00:00:00 +0000
+Subject: [PATCH] libfmt 12.2.0 support: use fmt/format.h not fmt/core.h
+
+Since libfmt 12.2.0, <fmt/core.h> is a shim that only includes
+<fmt/base.h>, which does not declare fmt::format(). Building against it
+fails with:
+
+  src/net/ToString.cxx:80:16: error: no member named 'format' in namespace 'fmt'
+  src/lib/avahi/Publisher.cxx:37:9: error: no member named 'format' in namespace 'fmt'
+
+Include <fmt/format.h> directly in the files that call fmt::format().
+This mirrors the upstream fix (MPD commits 88d5b5248d71 and 109c26258b9d)
+extended to the files present in this release that call fmt::format().
+
+Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/88d5b5248d71]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/client/New.cxx
++++ b/src/client/New.cxx
+@@ -17,7 +17,7 @@
+ #include "Log.hxx"
+ #include "Version.h"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+
+--- a/src/db/plugins/upnp/UpnpDatabasePlugin.cxx
++++ b/src/db/plugins/upnp/UpnpDatabasePlugin.cxx
+@@ -24,7 +24,7 @@
+ #include "util/StringSplit.hxx"
+ #include "config/Block.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+ #include <string>
+--- a/src/db/update/Playlist.cxx
++++ b/src/db/update/Playlist.cxx
+@@ -20,7 +20,7 @@
+ #include "fs/Traits.hxx"
+ #include "Log.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ inline void
+ UpdateWalk::UpdatePlaylistFile(Directory &directory,
+--- a/src/input/plugins/AlsaInputPlugin.cxx
++++ b/src/input/plugins/AlsaInputPlugin.cxx
+@@ -27,7 +27,7 @@
+
+ #include <alsa/asoundlib.h>
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+
+--- a/src/input/plugins/QobuzClient.cxx
++++ b/src/input/plugins/QobuzClient.cxx
+@@ -4,7 +4,7 @@
+ #include "QobuzClient.hxx"
+ #include "lib/crypto/MD5.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+ #include <stdexcept>
+--- a/src/input/plugins/QobuzLoginRequest.cxx
++++ b/src/input/plugins/QobuzLoginRequest.cxx
+@@ -6,7 +6,7 @@
+ #include "QobuzSession.hxx"
+ #include "lib/curl/Form.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <nlohmann/json.hpp>
+
+ #include <cassert>
+--- a/src/input/plugins/QobuzTrackRequest.cxx
++++ b/src/input/plugins/QobuzTrackRequest.cxx
+@@ -5,7 +5,7 @@
+ #include "QobuzErrorParser.hxx"
+ #include "QobuzClient.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <nlohmann/json.hpp>
+
+ using std::string_view_literals::operator""sv;
+--- a/src/lib/avahi/Publisher.cxx
++++ b/src/lib/avahi/Publisher.cxx
+@@ -13,7 +13,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/alternative.h>
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+
+--- a/src/lib/nfs/FileReader.cxx
++++ b/src/lib/nfs/FileReader.cxx
+@@ -10,7 +10,7 @@
+
+ #include <nfsc/libnfs.h> // for struct nfs_stat_64
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+ #include <cstring>
+--- a/src/output/Init.cxx
++++ b/src/output/Init.cxx
+@@ -24,7 +24,7 @@
+ #include "util/StringAPI.hxx"
+ #include "Log.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+ #include <stdexcept>
+--- a/src/output/plugins/httpd/HttpdClient.cxx
++++ b/src/output/plugins/httpd/HttpdClient.cxx
+@@ -13,7 +13,7 @@
+ #include "util/StringSplit.hxx"
+ #include "Log.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+
+--- a/src/output/plugins/httpd/IcyMetaDataServer.cxx
++++ b/src/output/plugins/httpd/IcyMetaDataServer.cxx
+@@ -5,7 +5,7 @@
+ #include "tag/Tag.hxx"
+ #include "util/TruncateString.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <iterator>
+
+--- a/src/song/AddedSinceSongFilter.cxx
++++ b/src/song/AddedSinceSongFilter.cxx
+@@ -6,7 +6,7 @@
+ #include "time/ISO8601.hxx"
+ #include "util/StringBuffer.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ using std::string_view_literals::operator""sv;
+
+--- a/src/song/AudioFormatSongFilter.cxx
++++ b/src/song/AudioFormatSongFilter.cxx
+@@ -5,7 +5,7 @@
+ #include "LightSong.hxx"
+ #include "util/StringBuffer.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ using std::string_view_literals::operator""sv;
+
+--- a/src/song/ModifiedSinceSongFilter.cxx
++++ b/src/song/ModifiedSinceSongFilter.cxx
+@@ -6,7 +6,7 @@
+ #include "time/ISO8601.hxx"
+ #include "util/StringBuffer.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ using std::string_view_literals::operator""sv;
+
+--- a/src/storage/plugins/NfsStorage.cxx
++++ b/src/storage/plugins/NfsStorage.cxx
+@@ -28,7 +28,7 @@
+ #include <nfsc/libnfs-raw-nfs.h>
+ }
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <cassert>
+ #include <string>
+--- a/src/net/ToString.cxx
++++ b/src/net/ToString.cxx
+@@ -6,7 +6,7 @@
+ #include "SocketAddress.hxx"
+ #include "IPv4Address.hxx"
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+
+ #include <algorithm>
+ #include <cassert>
+--
+2.43.0
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
index 0c3d672949..b4d6604b21 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
@@ -20,6 +20,7 @@ DEPENDS += " \

 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
+           file://0001-libfmt-12.2.0-support-use-fmt-format.h-not-fmt-core.h.patch \
            "
 SRCREV = "7a9afa059e95668c912f779219ee8fe1e44dd2aa"


