Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0488CC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 06:58:22 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.26438.1743317897156830071
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Mar 2025 23:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id 813461AE
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 08:58:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.202]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tymcY-1swBUX0; Sun, 30 Mar 2025 08:58:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mpv: remove unused patch
Date: Sun, 30 Mar 2025 08:58:55 +0200
Message-ID: <20250330065855.1376920-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743317894-21FF95F9-BA4EB821/10/3626336762 SUSPECT URL
X-TOI-MSGID: 441ec913-5776-490f-97e6-8721c99df7d8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 06:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116375

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...b3e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch | 87 -------------------
 1 file changed, 87 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0a=
f86737f5ecb72d3a8e2a8c3b54.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0af86737f=
5ecb72d3a8e2a8c3b54.patch b/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3=
e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch
deleted file mode 100644
index b8fad22c72..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0af86737f5ecb72d=
3a8e2a8c3b54.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From a7efb3e62bbd0af86737f5ecb72d3a8e2a8c3b54 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Kacper=3D20Michaj=3DC5=3D82ow?=3D <kasper93@gmail.com>
-Date: Sun, 13 Oct 2024 19:18:11 +0200
-Subject: [PATCH] build: fix dynamic generation of mpv.desktop file proto=
cols
-
-Running cross-compiled binaries may be possible, but the runtime
-environment must be configured correctly. In some configurations, an
-exe_wrapper needs to be used, and in all cases, the library path must be
-set correctly for the given binary. Fortunately, Meson handles all of
-this if cross-compilation is configured correctly.
-
-Fix this by having Meson run the mpv binary directly, instead of as a
-subprocess of a Python script. This ensures that the environment is
-properly set for running host binaries, if possible.
-
-Fixes: #15075
-Fixes: 056b03f9ed05607786427da8f336e3ef819b3a1e
-
-Upstream-Status: Submitted [https://github.com/mpv-player/mpv/pull/15075=
]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- TOOLS/gen-mpv-desktop.py | 17 +++++++----------
- meson.build              |  9 +++++++--
- 2 files changed, 14 insertions(+), 12 deletions(-)
-
-diff --git a/TOOLS/gen-mpv-desktop.py b/TOOLS/gen-mpv-desktop.py
-index 7bbb33e5be..2c45a7038e 100755
---- a/TOOLS/gen-mpv-desktop.py
-+++ b/TOOLS/gen-mpv-desktop.py
-@@ -21,23 +21,28 @@
- #
-=20
- import sys
--from subprocess import check_output
-=20
- if __name__ =3D=3D "__main__":
--    with open(sys.argv[1], "r", encoding=3D"UTF-8") as f:
-+    with open(sys.argv[1], encoding=3D"UTF-8") as f:
-         next(f)
-         mpv_desktop =3D dict([line.split("=3D", 1) for line in f])
-=20
-     if not mpv_desktop["X-KDE-Protocols"]:
-         raise ValueError("Missing X-KDE-Protocols entry in mpv.desktop =
file")
-=20
--    mpv_protocols =3D check_output([sys.argv[2], "--no-config", "--list=
-protocols"], encoding=3D"UTF-8")
--    mpv_protocols =3D set(line.strip(" :/") for line in mpv_protocols.s=
plitlines() if "://" in line)
-+    with open(sys.argv[2], encoding=3D"UTF-8") as mpv_protocols:
-+        mpv_protocols =3D {
-+            line.strip(" :/")
-+            for line in mpv_protocols.read().splitlines()
-+            if "://" in line
-+        }
-+
-     if len(mpv_protocols) =3D=3D 0:
-         raise ValueError("Unable to parse any protocols from mpv '--lis=
t-protocols'")
-=20
-     protocol_list =3D set(mpv_desktop["X-KDE-Protocols"].strip().split(=
","))
--    mpv_desktop["X-KDE-Protocols"] =3D ",".join(sorted(mpv_protocols & =
protocol_list)) + "\n"
-+    compatible_protocols =3D sorted(mpv_protocols & protocol_list)
-+    mpv_desktop["X-KDE-Protocols"] =3D ",".join(compatible_protocols) +=
 "\n"
-=20
-     with open(sys.argv[3], "w", encoding=3D"UTF-8") as f:
-         f.write("[Desktop Entry]" + "\n")
-diff --git a/meson.build b/meson.build
-index b7bcb1b0ba..c2004b748c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1830,11 +1830,16 @@ if get_option('cplayer')
-=20
-     if not win32 and not darwin
-         if meson.can_run_host_binaries()
-+            mpv_protocols =3D custom_target('mpv_protocols',
-+                output: 'mpv_protocols',
-+                command: [mpv, '--no-config','--list-protocols'],
-+                capture: true,
-+            )
-             mpv_desktop_path =3D join_paths(source_root, 'etc', 'mpv.de=
sktop')
-             custom_target('mpv.desktop',
--                depends: mpv,
-+                input: mpv_protocols,
-                 output: 'mpv.desktop',
--                command: [mpv_desktop, mpv_desktop_path, mpv.full_path(=
), '@OUTPUT@'],
-+               command: [mpv_desktop, mpv_desktop_path, '@INPUT@', '@OU=
TPUT@'],
-                 install: true,
-                 install_dir: join_paths(datadir, 'applications'),
-             )
--=20
2.49.0


