Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A526CF258E
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 20:33:09 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.39700.1728851587215084078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 13:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id C422615659
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 22:33:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.41]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t05Gw-47rSPz0; Sun, 13 Oct 2024 22:33:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] mpv: update 0.38.0 -> 0.39.0
Date: Sun, 13 Oct 2024 22:34:59 +0200
Message-ID: <20241013203459.47304-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241013203459.47304-1-f_l_k@t-online.de>
References: <20241013203459.47304-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728851582-55FF9467-D6EFCF3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 43df568e-bbd5-4570-ab36-5a28bf785008
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 20:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112841

- add support for vulkan,pipewire,pulseaudio
- add patch to fix generation of mpv.desktop
- cleanup

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d-emitting-absolute-filepaths-into-g.patch | 33 -------
 ...b3e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch | 87 +++++++++++++++++++
 .../mplayer/{mpv_0.38.0.bb =3D> mpv_0.39.0.bb}  | 34 ++++----
 3 files changed, 103 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-file2stri=
ng-Avoid-emitting-absolute-filepaths-into-g.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0a=
f86737f5ecb72d3a8e2a8c3b54.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.38.0.bb =3D> mpv_0.39.0=
.bb} (77%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoi=
d-emitting-absolute-filepaths-into-g.patch b/meta-oe/recipes-multimedia/m=
player/mpv/0001-file2string-Avoid-emitting-absolute-filepaths-into-g.patc=
h
deleted file mode 100644
index b96ec5d4c..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-file2string-Avoid-emitt=
ing-absolute-filepaths-into-g.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9878681df9919d28da3e4c6cc706e264abd9df92 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Aug 2024 17:54:15 -0700
-Subject: [PATCH] file2string: Avoid emitting absolute filepaths into gen=
erated
- sources
-
-These sources are bundled into src packages to be distributed and leakin=
g
-buildpaths results in violating reproducibility norms.
-
-Upstream-Status: Submitted [https://github.com/mpv-player/mpv/pull/14763=
]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- TOOLS/file2string.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/TOOLS/file2string.py b/TOOLS/file2string.py
-index 5b1c4a95d1..39c1122a35 100755
---- a/TOOLS/file2string.py
-+++ b/TOOLS/file2string.py
-@@ -22,10 +22,10 @@
- # License along with mpv.  If not, see <http://www.gnu.org/licenses/>.
- #
-=20
--import sys
-+import os, sys
-=20
- def file2string(infilename, infile, outfile):
--    outfile.write("// Generated from %s\n\n" % infilename)
-+    outfile.write("// Generated from %s\n\n" % os.path.basename(infilen=
ame))
-=20
-     conv =3D ["\\%03o" % c for c in range(256)]
-     safe_chars =3D "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy=
z" \
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0af86737f=
5ecb72d3a8e2a8c3b54.patch b/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3=
e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch
new file mode 100644
index 000000000..b8fad22c7
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/a7efb3e62bbd0af86737f5ecb72d=
3a8e2a8c3b54.patch
@@ -0,0 +1,87 @@
+From a7efb3e62bbd0af86737f5ecb72d3a8e2a8c3b54 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Kacper=3D20Michaj=3DC5=3D82ow?=3D <kasper93@gmail.com>
+Date: Sun, 13 Oct 2024 19:18:11 +0200
+Subject: [PATCH] build: fix dynamic generation of mpv.desktop file proto=
cols
+
+Running cross-compiled binaries may be possible, but the runtime
+environment must be configured correctly. In some configurations, an
+exe_wrapper needs to be used, and in all cases, the library path must be
+set correctly for the given binary. Fortunately, Meson handles all of
+this if cross-compilation is configured correctly.
+
+Fix this by having Meson run the mpv binary directly, instead of as a
+subprocess of a Python script. This ensures that the environment is
+properly set for running host binaries, if possible.
+
+Fixes: #15075
+Fixes: 056b03f9ed05607786427da8f336e3ef819b3a1e
+
+Upstream-Status: Submitted [https://github.com/mpv-player/mpv/pull/15075=
]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ TOOLS/gen-mpv-desktop.py | 17 +++++++----------
+ meson.build              |  9 +++++++--
+ 2 files changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/TOOLS/gen-mpv-desktop.py b/TOOLS/gen-mpv-desktop.py
+index 7bbb33e5be..2c45a7038e 100755
+--- a/TOOLS/gen-mpv-desktop.py
++++ b/TOOLS/gen-mpv-desktop.py
+@@ -21,23 +21,28 @@
+ #
+=20
+ import sys
+-from subprocess import check_output
+=20
+ if __name__ =3D=3D "__main__":
+-    with open(sys.argv[1], "r", encoding=3D"UTF-8") as f:
++    with open(sys.argv[1], encoding=3D"UTF-8") as f:
+         next(f)
+         mpv_desktop =3D dict([line.split("=3D", 1) for line in f])
+=20
+     if not mpv_desktop["X-KDE-Protocols"]:
+         raise ValueError("Missing X-KDE-Protocols entry in mpv.desktop =
file")
+=20
+-    mpv_protocols =3D check_output([sys.argv[2], "--no-config", "--list=
-protocols"], encoding=3D"UTF-8")
+-    mpv_protocols =3D set(line.strip(" :/") for line in mpv_protocols.s=
plitlines() if "://" in line)
++    with open(sys.argv[2], encoding=3D"UTF-8") as mpv_protocols:
++        mpv_protocols =3D {
++            line.strip(" :/")
++            for line in mpv_protocols.read().splitlines()
++            if "://" in line
++        }
++
+     if len(mpv_protocols) =3D=3D 0:
+         raise ValueError("Unable to parse any protocols from mpv '--lis=
t-protocols'")
+=20
+     protocol_list =3D set(mpv_desktop["X-KDE-Protocols"].strip().split(=
","))
+-    mpv_desktop["X-KDE-Protocols"] =3D ",".join(sorted(mpv_protocols & =
protocol_list)) + "\n"
++    compatible_protocols =3D sorted(mpv_protocols & protocol_list)
++    mpv_desktop["X-KDE-Protocols"] =3D ",".join(compatible_protocols) +=
 "\n"
+=20
+     with open(sys.argv[3], "w", encoding=3D"UTF-8") as f:
+         f.write("[Desktop Entry]" + "\n")
+diff --git a/meson.build b/meson.build
+index b7bcb1b0ba..c2004b748c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1830,11 +1830,16 @@ if get_option('cplayer')
+=20
+     if not win32 and not darwin
+         if meson.can_run_host_binaries()
++            mpv_protocols =3D custom_target('mpv_protocols',
++                output: 'mpv_protocols',
++                command: [mpv, '--no-config','--list-protocols'],
++                capture: true,
++            )
+             mpv_desktop_path =3D join_paths(source_root, 'etc', 'mpv.de=
sktop')
+             custom_target('mpv.desktop',
+-                depends: mpv,
++                input: mpv_protocols,
+                 output: 'mpv.desktop',
+-                command: [mpv_desktop, mpv_desktop_path, mpv.full_path(=
), '@OUTPUT@'],
++               command: [mpv_desktop, mpv_desktop_path, '@INPUT@', '@OU=
TPUT@'],
+                 install: true,
+                 install_dir: join_paths(datadir, 'applications'),
+             )
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.39.0.bb
similarity index 77%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
index 80e0f7ca7..c97252bd3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.38.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
@@ -15,11 +15,11 @@ DEPENDS =3D " \
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
=20
-SRCREV_mpv =3D "02254b92dd237f03aa0a151c2a68778c4ea848f9"
-SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/0.38;protocol=3Dhttps \
-           file://0001-file2string-Avoid-emitting-absolute-filepaths-int=
o-g.patch \
-           "
-
+SRCREV =3D "a0fba7be57f3822d967b04f0f6b6d6341e7516e7"
+SRC_URI =3D " \
+	git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/0.39;protoc=
ol=3Dhttps \
+	file://a7efb3e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch \
+"
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig mime-xdg
@@ -37,21 +37,25 @@ LUA:powerpc  =3D ""
 # Note: lua is required to get on-screen-display (controls)
 PACKAGECONFIG ??=3D " \
     ${LUA} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', ''=
, d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland opengl pipewire p=
ulseaudio vulkan', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'egl', '',=
 d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'drm gbm', '',=
 d)} \
 "
=20
 PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
xsp libxv libxscrnsaver libxinerama libxpresent libxext"
 PACKAGECONFIG[xv] =3D "-Dxv=3Denabled,-Dxv=3Ddisabled,libxv"
 PACKAGECONFIG[opengl] =3D "-Dgl=3Denabled,-Dgl=3Ddisabled,virtual/libgl"
-PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl-disabled,virtual/egl"
+PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
 PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisabled,libdrm"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled,virtual/libgbm"
-PACKAGECONFIG[lua] =3D "-Dlua=3Dluajit,-Dlua=3Ddisabled,lua luajit"
+PACKAGECONFIG[lua] =3D "-Dlua=3Dluajit,-Dlua=3Ddisabled,luajit"
 PACKAGECONFIG[libarchive] =3D "-Dlibarchive=3Denabled,-Dlibarchive=3Ddis=
abled,libarchive"
+PACKAGECONFIG[libmpv] =3D "-Dlibmpv=3Dtrue,-Dlibmpv=3Dfalse"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack"
+PACKAGECONFIG[pipewire] =3D "-Dpipewire=3Denabled,-Dpipewire=3Ddisabled,=
pipewire"
+PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
 PACKAGECONFIG[vaapi] =3D "-Dvaapi=3Denabled,-Dvaapi=3Ddisabled,libva"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,shader=
c"
 PACKAGECONFIG[vdpau] =3D "-Dvdpau=3Denabled,-Dvdpau=3Ddisabled,libvdpau"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land wayland-native libxkbcommon"
=20
@@ -82,7 +86,7 @@ python __anonymous() {
=20
 #SIMPLE_TARGET_SYS =3D "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '=
')}"
=20
-EXTRA_OECONF =3D " \
+EXTRA_OEMESON =3D " \
     -Dmanpage-build=3Ddisabled \
     -Dlibbluray=3Ddisabled \
     -Ddvdnav=3Ddisabled \
@@ -91,17 +95,11 @@ EXTRA_OECONF =3D " \
     -Drubberband=3Ddisabled \
     -Dlcms2=3Ddisabled \
     -Dvapoursynth=3Ddisabled \
-    ${PACKAGECONFIG_CONFARGS} \
 "
=20
 do_configure:append() {
     sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
 }
=20
-FILES:${PN} +=3D " \
-    ${datadir}/icons \
-    ${datadir}/zsh \
-    ${datadir}/bash-completion \
-    ${datadir}/metainfo \
-    "
+FILES:${PN} +=3D "${datadir}"
 EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "=
commercial", "0", "1", d)}"
--=20
2.47.0


