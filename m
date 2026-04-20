Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9BCF588C4
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 13:12:21 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18860.1776690737279986953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 06:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Cd1hY0X6;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd95.mgt.mul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout04.t-online.de (Postfix) with SMTP id E620CE71
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:12:14 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.240]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wEoQ8-4P4OB70; Mon, 20 Apr 2026 15:12:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.6.2 -> 1.6.3
Date: Mon, 20 Apr 2026 15:12:07 +0200
Message-ID: <20260420131207.52107-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1776690732-03FFCA05-2B09C438/0/0 CLEAN NORMAL
X-TOI-MSGID: dbf4e2f6-8578-4421-b28d-a55511a2c53f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776690734; i=f_l_k@t-online.de;
	bh=aGtR+JWnkkEXQrMOvY682KZW9VnJft6InOjuCc+Qi9I=;
	h=From:To:Subject:Date;
	b=Cd1hY0X6/V4gQKbRvbt9QwF6BmKh1AVRZ6v4yGvOF6J3jLi03BkVMOsyxrFH+5Anz
	 OeDqtMJUImqn/J5/10Aaqhj/bjId7NB6Ozr3UfzeOPd5+2X77JLhCgBak6RQ9CJjjY
	 Ht5Lv28aedn/+bTNW7XWscCcuhkHP/BEvf1qwOS7Q2XMYdQMvWCxMTuUVHUtmzHXcE
	 2Oe1QPdSoqaz9SAPjHK1wHn9/Fur1ckoYoLZ0WNCjun/UPdD0k/lFnCewMNql5Qe7B
	 39kjeuYhvBpeH03OHlPdTILuFfbHb5MCGCK5taJYQYvOAYFBKDHkKySf9JHediADI9
	 Z4/Yu51Ke1ViQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 13:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126503

- remove backport patch

PipeWire 1.6.3 (2026-04-09)

Highlights
  - Fix some RAOP compatibility regressions.
  - Fix segfault in the mixer in some cases.
  - Most nodes now produce and consume MIDI1 again and avoid
    conversions to and from UMP.
  - Various small fixes and improvements.

PipeWire
  - Fix regression with sample rate changes. (#5207)
  - Fix a potential integer overflow in the memory mapping.

Modules
  - Align RTP timestamps to make RAOP work on more devices. (#5167)
  - Avoid crashes in RTP streams because of concurrent event
    emmission.
  - Avoid invalid fd usage in native-protocol with special crafted
    messages.
  - Fix properties and params enumeration in filter-chain (#5202).

SPA
  - Fix compilation with -Werror=3Ddiscarded-qualifiers
  - Avoid OOB read in mix matrix. (#5176)
  - Avoid loading plugins from absolute paths that are not in the
    search path.
  - Avoid MIDI conversions to and from UMP. (#5183)

Bluetooth
  - Backport some fixes and avoid some crashes.

JACK
  - Make sure timebase callback is never called with 0 frames.
  - Increase the notify queue to avoid losing notifications.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-acp-compat.h-Fix-missed-Wdiscarded-.patch | 28 -------------------
 .../{pipewire_1.6.2.bb =3D> pipewire_1.6.3.bb}  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-spa-plugins-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.2.bb =3D=
> pipewire_1.6.3.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-sp=
a-plugins-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch b/meta-multimedi=
a/recipes-multimedia/pipewire/pipewire/0001-spa-plugins-alsa-acp-compat.h=
-Fix-missed-Wdiscarded-.patch
deleted file mode 100644
index 6ded1c15f8..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-plugi=
ns-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c847b8162959c29b783585e0dcadbfb096e7cb73 Mon Sep 17 00:00:00 2001
-From: Ripley Tom <discofan420@protonmail.com>
-Date: Sat, 21 Feb 2026 19:33:11 +0100
-Subject: [PATCH] spa/plugins/alsa/acp/compat.h: Fix missed
- -Wdiscarded-qualifiers warning
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipew=
ire/-/commit/c847b8162959c29b783585e0dcadbfb096e7cb73]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- spa/plugins/alsa/acp/compat.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/spa/plugins/alsa/acp/compat.h b/spa/plugins/alsa/acp/compat=
.h
-index f7592e1a6..0f7b959df 100644
---- a/spa/plugins/alsa/acp/compat.h
-+++ b/spa/plugins/alsa/acp/compat.h
-@@ -429,9 +429,9 @@ static PA_PRINTF_FUNC(1,0) inline char *pa_vsprintf_=
malloc(const char *fmt, va_l
-=20
- #define pa_fopen_cloexec(f,m)	fopen(f,m"e")
-=20
--static inline char *pa_path_get_filename(const char *p)
-+static inline const char *pa_path_get_filename(const char *p)
- {
--    char *fn;
-+    const char *fn;
-     if (!p)
-         return NULL;
-     if ((fn =3D strrchr(p, PA_PATH_SEP_CHAR)))
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
index 1e5e5f0399..82cd928b4a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "95da54a482b68475958bbc3fa572a9c20df0df74"
+SRCREV =3D "cc3d0d1191266b263f6d0fa03fce1d1ef57151cc"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
-SRC_URI +=3D "file://0001-spa-plugins-alsa-acp-compat.h-Fix-missed-Wdisc=
arded-.patch"
 SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-con=
st-do-.patch"
=20
 inherit meson pkgconfig systemd gettext useradd
--=20
2.53.0


