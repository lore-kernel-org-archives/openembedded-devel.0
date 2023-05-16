Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67843C7EE24
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:13:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.16531.1684224828328483857
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 01:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SDhDPWcu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684224826; i=@fujitsu.com;
	bh=Z7oVBqI2ZQ5HkXVJ3T6ZHUV0vF42FVy4NEFlk79bZIM=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=SDhDPWcuX6oPCBtuZdQVc6tYzFM4ovp3w8oGFXslcN1yV7GoaZfWGFSB8DiKmu02a
	 lWMYlM7EzoOa3LshEEthJbuHWGMd415+VCZwern6YR1xklKc6u1YJnSbjL8MNRrQ7/
	 CUmI68nhiqYTpic/aO7uczWlxc7wTLKDKKuVZcgVVktebhOku/nil/mKPUZeffPWF1
	 5ZqCy3xCkzUjg7mPDV1aU+pVIZCJVTpcpTaPRgbdcQD31meYqv+Bj52O1SbFcUyAlj
	 h6GpPOHUfFtGRe0vn5cF8SPSx3pBcsgtX4xy2IgWGcL9ZinXAhGNonMgNQHLAnRSbu
	 cgZiCGZ7ok+Lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRWlGSWpSXmKPExsViZ8ORpGtpnZx
  icOePrMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF99wW2gkd6FV+vrWdtYLyl2cXIxSEksJFR
  4u726SxdjJxAzjQmiWvz00FsNgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+wgRiCwv4Sqx81
  QQWZxFQlfh69jQbiM0r4CQxdc90ZhBbQkBBYsrD91C2msTVc5uYJzByLWBkWMVoVpxaVJZapG
  upl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokR6OOU4tT
  ZOxgX7/qrd4hRkoNJSZSXZUFSihBfUn5KZUZicUZ8UWlOavEhRhkODiUJXm6r5BQhwaLU9NSK
  tMwcYLjBpCU4eJREeKstgNK8xQWJucWZ6RCpU4zGHFevXNnLzLFpX9cBZiGWvPy8VClxXnaQS
  QIgpRmleXCDYHFwiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7zojoCk8mXklcPteAZ3CBH
  TKrT3xIKeUJCKkpBqYypPNNiz0THlisWJ1uOm7RSvfWQp2LDP4ql1ocF1YovhejZrl7nsfOV6
  3zzGTu1ruJ8hzQTyY4ejpDSrp00Oyi2VXxrNUWPU95N9rcevQ8Z3b7dq+xJ6UnRoWZ7T4EG/H
  wWqv7c7lUrebi32zZ+192CWlFnF1g+LKHJ84vwWpHZVqGvYt8/Vt5s8rf7Zqzqq5SQIGXfs31
  W+JPrPhIZvT6XMq2QapLVnChT+Do+WK4+dwzd+6PObQ2fWTJzqVXHo5mdnZN79Ax1bhsBR/Bp
  82s2wD28LkEOH1hbw7JkYm3lo8Z9EDhokzAv7cvOHdaXMrSbLwyrcDKYVOD1/eXMb2XiTqciC
  HtluSdKxP+HElluKMREMt5qLiRABde3NG/gIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1684224825!119995!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27928 invoked from network); 16 May 2023 08:13:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 May 2023 08:13:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DFCB41B5;
	Tue, 16 May 2023 09:13:44 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2735C1AE;
	Tue, 16 May 2023 09:13:43 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-multimedia] [PATCH] mpd: fix build error when fmt updated
Date: Tue, 16 May 2023 16:13:31 +0800
Message-Id: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 08:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102623

From: Wang Mingyu <wangmy@fujitsu.com>

backport upstream patch for build error when fmt updated:
ix-build-error-when-fmt-updated.patch
minor-fixup-for-libfmt10.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fix-build-error-when-fmt-updated.patch    | 71 +++++++++++++++++++
 .../mpd/minor-fixup-for-libfmt10.patch        | 27 +++++++
 .../recipes-multimedia/musicpd/mpd_0.23.12.bb |  6 +-
 3 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
new file mode 100644
index 0000000000..ebbea2b358
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/181b96dd2d71bc8f2668776719d344466f258b5d]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+From 181b96dd2d71bc8f2668776719d344466f258b5d Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max.kellermann@gmail.com>
+Date: Mon, 15 May 2023 20:52:21 +0200
+Subject: [PATCH] command/player, SongPrint: use AudioFormatFormatter()
+
+libfmt version 10 apparently doesn't know how to format a
+`StringBuffer`, failing the MPD build.  Since we have a formatter
+specialization for `AudioFormat`, let's use that - it's better and
+easier to use.
+
+Closes https://github.com/MusicPlayerDaemon/MPD/issues/1807
+---
+ src/SongPrint.cxx              | 5 +++--
+ src/command/PlayerCommands.cxx | 3 ++-
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/SongPrint.cxx b/src/SongPrint.cxx
+index 98d544cc38..835669d276 100644
+--- a/src/SongPrint.cxx
++++ b/src/SongPrint.cxx
+@@ -8,6 +8,7 @@
+ #include "TagPrint.hxx"
+ #include "client/Response.hxx"
+ #include "fs/Traits.hxx"
++#include "lib/fmt/AudioFormatFormatter.hxx"
+ #include "time/ChronoUtil.hxx"
+ #include "util/StringBuffer.hxx"
+ #include "util/UriUtil.hxx"
+@@ -77,7 +78,7 @@ song_print_info(Response &r, const LightSong &song, bool base) noexcept
+ 		time_print(r, "Last-Modified", song.mtime);
+ 
+ 	if (song.audio_format.IsDefined())
+-		r.Fmt(FMT_STRING("Format: {}\n"), ToString(song.audio_format));
++		r.Fmt(FMT_STRING("Format: {}\n"), song.audio_format);
+ 
+ 	tag_print_values(r, song.tag);
+ 
+@@ -100,7 +101,7 @@ song_print_info(Response &r, const DetachedSong &song, bool base) noexcept
+ 		time_print(r, "Last-Modified", song.GetLastModified());
+ 
+ 	if (const auto &f = song.GetAudioFormat(); f.IsDefined())
+-		r.Fmt(FMT_STRING("Format: {}\n"), ToString(f));
++		r.Fmt(FMT_STRING("Format: {}\n"), f);
+ 
+ 	tag_print_values(r, song.GetTag());
+ 
+diff --git a/src/command/PlayerCommands.cxx b/src/command/PlayerCommands.cxx
+index 5108b9d3c4..0b5a917020 100644
+--- a/src/command/PlayerCommands.cxx
++++ b/src/command/PlayerCommands.cxx
+@@ -13,6 +13,7 @@
+ #include "Partition.hxx"
+ #include "Instance.hxx"
+ #include "IdleFlags.hxx"
++#include "lib/fmt/AudioFormatFormatter.hxx"
+ #include "util/StringBuffer.hxx"
+ #include "util/ScopeExit.hxx"
+ #include "util/Exception.hxx"
+@@ -170,7 +171,7 @@ handle_status(Client &client, [[maybe_unused]] Request args, Response &r)
+ 
+ 		if (player_status.audio_format.IsDefined())
+ 			r.Fmt(FMT_STRING(COMMAND_STATUS_AUDIO ": {}\n"),
+-			      ToString(player_status.audio_format));
++			      player_status.audio_format);
+ 	}
+ 
+ #ifdef ENABLE_DATABASE
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch
new file mode 100644
index 0000000000..0c9d979107
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+[https://github.com/MusicPlayerDaemon/MPD/commit/f869593ac8913e52c711e974257bd6dc0d5dbf26]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+From f869593ac8913e52c711e974257bd6dc0d5dbf26 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max.kellermann@gmail.com>
+Date: Mon, 15 May 2023 20:59:58 +0200
+Subject: [PATCH] TimePrint: minor fixup for libfmt 10
+
+libfmt version 10 has difficulties formatting a `StringBuffer`, and we
+need to help it by explicitly invoking the `c_str()` method.
+---
+ src/TimePrint.cxx | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/src/TimePrint.cxx b/src/TimePrint.cxx
+index 5bf05f6238..d47f3178bb 100644
+--- a/src/TimePrint.cxx
++++ b/src/TimePrint.cxx
+@@ -20,5 +20,5 @@ time_print(Response &r, const char *name,
+ 		return;
+ 	}
+ 
+-	r.Fmt(FMT_STRING("{}: {}\n"), name, s);
++	r.Fmt(FMT_STRING("{}: {}\n"), name, s.c_str());
+ }
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index 13938444c8..c6672ca46b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -18,10 +18,12 @@ DEPENDS += " \
     fmt \
 "
 
-SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
+SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            file://mpd.conf.in \
+           file://minor-fixup-for-libfmt10.patch \
+           file://fix-build-error-when-fmt-updated.patch \
            "
-SRCREV = "d91da9679801224847c30147f5914785b6f8f240"
+SRCREV = "b1422fbda40a1831d397fb161e7a555443c2a072"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.34.1


