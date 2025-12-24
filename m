Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75474E78499
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 22:18:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129022.1766614734366086628
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 14:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtxkmcDg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so41308885e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 14:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766614733; x=1767219533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=647Wfdn+R2UkMphhrf8AoHSfr8CmUV9h2UEVNgs6qwU=;
        b=HtxkmcDg0e7jcaxI2W+njs72MSyQOOl5Y8rlQ49slM7w3jDLpOjqy9+oz4/BN4LSbQ
         MPfqxBhDpYjA7Nrrs5dElELKtueeKVjYV4eHo+7R0Gw/EiJc9uiKD0AXmWCOOoQL1spM
         uDN7OeEbxXUsVOM9Ohdsal2u5k2NkOgv8U3LphuwbzhcgF7zlI58tuEmCXpx+2w1Rqw/
         BURJDGZLr2dNZPhdUvRe222lQmuhuNcCurnPp8k0VEMFkpQsnBs4sFrpw+2LlU+FAT5o
         RB5/8BXeaX9LdTbhKtwdQgsT80Ix/Q0AIbHv/0xQJTkEs8CA1VLcgtat9+QyT1WJi+GZ
         vKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766614733; x=1767219533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=647Wfdn+R2UkMphhrf8AoHSfr8CmUV9h2UEVNgs6qwU=;
        b=Ay4WVIr+JVh4Ch2DRrqDCDrMpALSdkRqOXsSQ2ClPjOIEpVU58UOEqVb96K9aw+r1i
         EjjZPXb1HkmCtTDniKQjD34BuWa3V5UnubAgXmqv2itjIGE8yQU18A358a04qGZTiTqa
         WEXFodT2brtRiIcX6TL6hvP+qB1oPRvGZ1PnY3D/DXnWZiz6ktbDlsLxIvZ+CpfNQyB1
         6402J+Wxekglb5oUCeLKFkZ0hv4FP30SR7H0s+Sp5EXMm6ak7LJ7LECGth+XAX7CX4RJ
         FK5X8d2b2jobqiKnpk+wyighQ/wDtXoU+1GdBfmpfrQ3mcc4MFn+FyAXHriD+/VnU3Fp
         5UrQ==
X-Gm-Message-State: AOJu0Yx1TlARejLqHiofzGDgCpMkuEWga70ISkpJ3//DYQiJhwM+sUDN
	Ly0TOMeZGacYhsBgKnhY7lao7Jm58968SfSBKpSqgDLDlGtytdCxCOyvdBkZFw==
X-Gm-Gg: AY/fxX7An9qy/c7XRVYb0Td8N4csq6ukjmdA7Y7aa8RgAReS2hQayrIC3nvvYECTV/9
	A6hYotlvYe8I+fMTpmAuaPfEmdwvFv9gRXzQRuHEz3Ec7dfpjLhhn3q5en6YafCXL8ER3wfLGf0
	loxcsSkscP2QAZCjv24pp0IQam4oKYeOtBCARcQhECZivScQHNNo+mS2SEAsEWFBsKTAA5w7TP0
	de6BeFmtDdVtxKtyTsPGf9/wlIzj8+dsVpwnbfX3/8SKCkJ7CyJbqaPbKZorWWlp3PjXOahcW3i
	/Xw9asRO2Gr7gVb3IMkWdRNoQHnHuMQyEU9aa/mXv/D/0dNTZkYPzqFQuj6q83EGOePxrNmKgSL
	7Ch9JwO7lXzGgVTAVRIB4RY86qhnjJoxGTIAIy+cTdha4+xOpWQze1kBJQlr09+TOLX1i6LV04j
	AfiLOOV5yV
X-Google-Smtp-Source: AGHT+IFBRPcbbPHuWgZaCDwjuL5+HKMxr+yvrLUok0SOw7Hyt/ywA2dCADsn+L38+R9V58H4zfoHtQ==
X-Received: by 2002:a05:600c:3b2a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47d1953bd29mr183064975e9.8.1766614732419;
        Wed, 24 Dec 2025 14:18:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm332859315e9.14.2025.12.24.14.18.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:18:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libmpdclient: upgrade 2.22 -> 2.24
Date: Wed, 24 Dec 2025 23:18:51 +0100
Message-ID: <20251224221851.2993458-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 22:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122907

Though the original recipe claiumed to be v2.22, actually it was
2.20.

The vala bindings have been dropped, so no need to delete them anymore.

License-Update: The license itself hasn't changed between versions, but
there are a couple of things to note:
- Half of the source files are covered by 2-Clause-BSD, and other half by
  3-Clause-BSD. This has been the case always, but until recently this
  was only specified in the source file headers, and there was a single
  license file with 3-Clause-BSD text. Now there is explicitly a 2-Clause-
  BSD file also.
- The 3-Clase-BSD text was reformatted, and added placeholders for year
  and author. That is causing the hash change for this particular license.

Changelog:
2.24:
* fix missing "mpd_send_list_tag_types_available" in libmpdclient.ld
* support MPD protocol 0.25
  - stringnormalization

2.23:
* support MPD protocol 0.24.0
  - allow window for listplaylist and listplaylistinfo
  - command "playlistlength", "protocol", "stickertypes", "stickernamestypes", "searchplaylist"
  - tag "ShowMovement"
  - new sticker find api
  - new subcommands for "tagtypes": "available", "reset"
* Support open end for mpd_search_add_window
* format floating-point numbers with the POSIX localew

2.22:
* drop the unmaintained Vala bindings
* fix "version.h" conflicts when used as a Meson subproject
* support MPD protocol 0.24.0
  - command "save [create|replace|append]"

2.21:
* meson.build: allow using as a Meson subproject
* add mpd_recv_replay_gain_status()
* support MPD protocol 0.24.0
  - tag "Mood", "TitleSort"
  - "oneshot" consume state
  - allow range in "playlistmove"
  - commands "searchcount", "stickernames"
  - added attribute for songs
  - search: support constraint "added-since"

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../musicpd/libmpdclient_2.22.bb              | 21 -------------------
 .../musicpd/libmpdclient_2.24.bb              | 15 +++++++++++++
 2 files changed, 15 insertions(+), 21 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
deleted file mode 100644
index a9dae6073a..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "C client library for the Music Player Daemon"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
-HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
-
-inherit meson
-
-SRC_URI = " \
-    git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https \
-"
-SRCREV = "7124a0ad4841a44db084bb785a6e7120bc8f0139"
-
-PACKAGECONFIG ??= "tcp"
-PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"
-
-do_install:append() {
-    # libmpdclient's Vala bindings are outdated and unmaintained; it
-    # is likely that nobody will ever use them, so let's not install
-    # them
-    rm -rf ${D}${datadir}/vala
-}
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
new file mode 100644
index 0000000000..3b12efa2e3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
@@ -0,0 +1,15 @@
+SUMMARY = "C client library for the Music Player Daemon"
+LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=63d6ee386b8aaba70b1bf15a79ca50f2 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=954f4d71a37096249f837652a7f586c0"
+HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
+
+inherit meson
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https;tag=v${PV} \
+"
+SRCREV = "5073329989bf52676d8c446176a1d29ed3ffccca"
+
+PACKAGECONFIG ??= "tcp"
+PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"

