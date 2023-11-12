Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D443AC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 15:55:02 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.17322.1699804499702525804
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 07:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RW7BhLAQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo5637917a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699804497; x=1700409297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/2edTc1x3RohR22FsPxoXlZLvpSUhTQzYJAVtsRCvE=;
        b=RW7BhLAQAqVOlem6ZgQ/dbskCF/QAtqFZB+NLfF6n/b62Q5YqDzaZyCFFwU43sXdiT
         GthEGRO+WbY1gPoWX2qifarnvuaZeFzdpGw31KKTJSqOCnEG7g4iCmAbCTzri0rjR9NM
         q4aRzkH1vUp8uq5d+R9/z1D6RMBPw9QE1dM2kJrqhw50eFBNVFn/UfbAtT9sbHBgAUWK
         RgaxZJTXEmHT+vdHPUYeNRY9P80z1VtwM4AZ+PTO3d1TeC91wdHoNq++Gey2tSZCkgCC
         0tN5mD8UPd+7IkJ6crmtQLcsU/uLwNojbjZqvryxJQgoU/7usGQayuoK0HuwOX4inp4Z
         WF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699804497; x=1700409297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/2edTc1x3RohR22FsPxoXlZLvpSUhTQzYJAVtsRCvE=;
        b=OgOMrftja6j6x/ltPCbijv6d7SoGteEuyUY0s4wgQNvEQ4l23gidHhU5u+ZwiW/QaC
         o/YA8t1bjKOzstll55O83BqPHQ3WsFWDF9s3xReMMiynuqIweWnC9jkQdBtWalkntE9z
         Y2znJI3WWyDg8PtQ7E+fZyarAW12uON16qmARWC1UB8U9ynBC9SkLKeDxUfJzax+RTaX
         pjmkpUZkie6cW0UNE7XHTA8YUnJQV8NbP670Rwe6ADpDJGdlrf2vBtYKhXd9LkwZKDwS
         PQqzWGNGn0zRAeECpZGLxkBfhkEfdruqS6KwAfUkkij8nPr2I+YlmIDcXDBFMRDrhc7R
         R3fQ==
X-Gm-Message-State: AOJu0YyXQYWHf6dAOEQ6qBQSFNo9NkFl10t7QelDvOBaAhQOn5x8DM46
	QXBxuexBkEed3m3wKetOfz8h3MghMPBNJA==
X-Google-Smtp-Source: AGHT+IEJvaCXuVS0PnZywCEroLZdo0CUudYe+42AwQiAhXmt3gPY3BPNimmeDM1QUeaZZrGktncHhQ==
X-Received: by 2002:a50:ff14:0:b0:543:75cb:214e with SMTP id a20-20020a50ff14000000b0054375cb214emr3326005edu.11.1699804497199;
        Sun, 12 Nov 2023 07:54:57 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id f10-20020a056402160a00b0053e36dd75dfsm2416010edv.35.2023.11.12.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 07:54:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] mpd: upgrade 0.23.12 -> 0.23.14
Date: Sun, 12 Nov 2023 18:54:44 +0300
Message-Id: <20231112155444.524147-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106591

Patches deleted because issues fixed in the new version.

Changelog:

ver 0.23.14 (2023/10/08)
* decoder
  - flac: fix scanning files with non-ASCII names on Windows
  - mad: fix calculation of LAME peak values
* mixer
  - wasapi: fix problem setting volume
* more libfmt 10 fixes
* fix auto-detected systemd unit directory
* Android
  - require Android 7 or newer

ver 0.23.13 (2023/05/22)
* input
  - curl: fix busy loop after connection failed
  - curl: hide "404" log messages for non-existent ".mpdignore" files
* archive
  - zzip: fix crash bug
* database
  - simple: reveal hidden songs after deleting containing CUE
* decoder
  - ffmpeg: reorder to a lower priority than "gme"
  - gme: require GME 0.6 or later
* output
  - pipewire: fix corruption bug due to missing lock
* Linux
  - shut down if parent process dies in --no-daemon mode
  - determine systemd unit directories via pkg-config
* support libfmt 10

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...lugin-Fix-type-mismatch-for-std-span.patch | 28 --------
 .../fix-build-error-when-fmt-updated.patch    | 71 -------------------
 .../mpd/minor-fixup-for-libfmt10.patch        | 27 -------
 .../{mpd_0.23.12.bb => mpd_0.23.14.bb}        |  5 +-
 4 files changed, 1 insertion(+), 130 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-span.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.12.bb => mpd_0.23.14.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-span.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-span.patch
deleted file mode 100644
index 37aa448e9..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-span.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f2fbfeeb9c4ff7aa9ba4b95604ee0fb14ecec763 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 May 2023 17:54:09 -0700
-Subject: [PATCH] SndfileDecoderPlugin: Fix type mismatch for std::span
-
-Fixes
-../git/src/decoder/plugins/SndfileDecoderPlugin.cxx:231:25: error: non-constant-expression cannot be narrowed from type 'sf_count_t' (aka 'long long') to 'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
-                                         std::span{buffer, num_frames * frame_size},
-                                                           ^~~~~~~~~~~~~~~~~~~~~~~
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/decoder/plugins/SndfileDecoderPlugin.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/decoder/plugins/SndfileDecoderPlugin.cxx b/src/decoder/plugins/SndfileDecoderPlugin.cxx
-index ad3908847..a3cb87ca9 100644
---- a/src/decoder/plugins/SndfileDecoderPlugin.cxx
-+++ b/src/decoder/plugins/SndfileDecoderPlugin.cxx
-@@ -228,7 +228,7 @@ sndfile_stream_decode(DecoderClient &client, InputStream &is)
- 			break;
- 
- 		cmd = client.SubmitAudio(is,
--					 std::span{buffer, num_frames * frame_size},
-+					 std::span{buffer, static_cast<std::size_t>(num_frames * frame_size)},
- 					 0);
- 		if (cmd == DecoderCommand::SEEK) {
- 			sf_count_t c = client.GetSeekFrame();
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
deleted file mode 100644
index ebbea2b35..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/fix-build-error-when-fmt-updated.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/181b96dd2d71bc8f2668776719d344466f258b5d]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
-From 181b96dd2d71bc8f2668776719d344466f258b5d Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max.kellermann@gmail.com>
-Date: Mon, 15 May 2023 20:52:21 +0200
-Subject: [PATCH] command/player, SongPrint: use AudioFormatFormatter()
-
-libfmt version 10 apparently doesn't know how to format a
-`StringBuffer`, failing the MPD build.  Since we have a formatter
-specialization for `AudioFormat`, let's use that - it's better and
-easier to use.
-
-Closes https://github.com/MusicPlayerDaemon/MPD/issues/1807
----
- src/SongPrint.cxx              | 5 +++--
- src/command/PlayerCommands.cxx | 3 ++-
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/SongPrint.cxx b/src/SongPrint.cxx
-index 98d544cc38..835669d276 100644
---- a/src/SongPrint.cxx
-+++ b/src/SongPrint.cxx
-@@ -8,6 +8,7 @@
- #include "TagPrint.hxx"
- #include "client/Response.hxx"
- #include "fs/Traits.hxx"
-+#include "lib/fmt/AudioFormatFormatter.hxx"
- #include "time/ChronoUtil.hxx"
- #include "util/StringBuffer.hxx"
- #include "util/UriUtil.hxx"
-@@ -77,7 +78,7 @@ song_print_info(Response &r, const LightSong &song, bool base) noexcept
- 		time_print(r, "Last-Modified", song.mtime);
- 
- 	if (song.audio_format.IsDefined())
--		r.Fmt(FMT_STRING("Format: {}\n"), ToString(song.audio_format));
-+		r.Fmt(FMT_STRING("Format: {}\n"), song.audio_format);
- 
- 	tag_print_values(r, song.tag);
- 
-@@ -100,7 +101,7 @@ song_print_info(Response &r, const DetachedSong &song, bool base) noexcept
- 		time_print(r, "Last-Modified", song.GetLastModified());
- 
- 	if (const auto &f = song.GetAudioFormat(); f.IsDefined())
--		r.Fmt(FMT_STRING("Format: {}\n"), ToString(f));
-+		r.Fmt(FMT_STRING("Format: {}\n"), f);
- 
- 	tag_print_values(r, song.GetTag());
- 
-diff --git a/src/command/PlayerCommands.cxx b/src/command/PlayerCommands.cxx
-index 5108b9d3c4..0b5a917020 100644
---- a/src/command/PlayerCommands.cxx
-+++ b/src/command/PlayerCommands.cxx
-@@ -13,6 +13,7 @@
- #include "Partition.hxx"
- #include "Instance.hxx"
- #include "IdleFlags.hxx"
-+#include "lib/fmt/AudioFormatFormatter.hxx"
- #include "util/StringBuffer.hxx"
- #include "util/ScopeExit.hxx"
- #include "util/Exception.hxx"
-@@ -170,7 +171,7 @@ handle_status(Client &client, [[maybe_unused]] Request args, Response &r)
- 
- 		if (player_status.audio_format.IsDefined())
- 			r.Fmt(FMT_STRING(COMMAND_STATUS_AUDIO ": {}\n"),
--			      ToString(player_status.audio_format));
-+			      player_status.audio_format);
- 	}
- 
- #ifdef ENABLE_DATABASE
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch
deleted file mode 100644
index 0c9d97910..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/minor-fixup-for-libfmt10.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-[https://github.com/MusicPlayerDaemon/MPD/commit/f869593ac8913e52c711e974257bd6dc0d5dbf26]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
-From f869593ac8913e52c711e974257bd6dc0d5dbf26 Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max.kellermann@gmail.com>
-Date: Mon, 15 May 2023 20:59:58 +0200
-Subject: [PATCH] TimePrint: minor fixup for libfmt 10
-
-libfmt version 10 has difficulties formatting a `StringBuffer`, and we
-need to help it by explicitly invoking the `c_str()` method.
----
- src/TimePrint.cxx | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/src/TimePrint.cxx b/src/TimePrint.cxx
-index 5bf05f6238..d47f3178bb 100644
---- a/src/TimePrint.cxx
-+++ b/src/TimePrint.cxx
-@@ -20,5 +20,5 @@ time_print(Response &r, const char *name,
- 		return;
- 	}
- 
--	r.Fmt(FMT_STRING("{}: {}\n"), name, s);
-+	r.Fmt(FMT_STRING("{}: {}\n"), name, s.c_str());
- }
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
index 0c309ded0..310b5f7c3 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
@@ -20,11 +20,8 @@ DEPENDS += " \
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            file://mpd.conf.in \
-           file://minor-fixup-for-libfmt10.patch \
-           file://fix-build-error-when-fmt-updated.patch \
-           file://0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-span.patch \
            "
-SRCREV = "b1422fbda40a1831d397fb161e7a555443c2a072"
+SRCREV = "feac1a3f56591ccfb00870aba66c9ac3abac4773"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.25.1


