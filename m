Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FED2CD4F21
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 14:39:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6742.1778942364207956209
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2026 07:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ZuHqjggj;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 14197E062
	for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2026 16:39:22 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.165.218]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wOGAj-4YA6RF0; Sat, 16 May 2026 16:39:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.6.3 -> 1.6.5
Date: Sat, 16 May 2026 16:39:06 +0200
Message-ID: <20260516143906.33211-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1778942361-337FD8E9-D0C501CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 5dc2ee28-b727-42af-a998-213d1cffdac2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1778942362; i=f_l_k@t-online.de;
	bh=251lt9cAUmvN89jiO1+1Ur3g9uB7tXB4ufS8x9SimQg=;
	h=From:To:Subject:Date;
	b=ZuHqjggjPv0/QEDx6lmjvIvPj3dA3MA5CIdzeHAUC1KlQKUhjrME0y/BaVWTKPYzN
	 Bq8L9cHFvlorzAAqpucnxiK/mUMYLaMiyweUk4MrnmoibhzV2lCwMKYHs7FQEb2U4e
	 4wbxYqPYvE0R0dmLHodGf3UUJd2xcY+qnyJUo1ULI8QT6roLndIXRMOJk0Eb2E49ki
	 8HL/bnRwfXGMZ3wubxoRkd0ReWtF4jg07m4eFERdN4qTJzdcajfigqU3ViM4EPygiH
	 ikR60vqFLnHrryGriVlj/yBrhGsW6PkESTdIPhGnHCfbuqiGJXIP1HZj84ctTMadF4
	 9X+yB/kOvaTGQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2026 14:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127012

PipeWire 1.6.5 (2026-05-13)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix muted output in some cases.
  - Removed the pipe filter in filter-graph.
  - More fixes and improvements.

PipeWire
  - Fix an issue in pw-filter where it could end up in a loop where buffe=
rs
    are stuck on a port and the port becomes silent. (#5249)

Modules
  - Improve ROC receiver start/stop, fixes memory leaks. (#5250)
  - Remove the pipe filter from filter-graph, it's broken by design and a
    security nightmare.
  - Fix the midi buffer size in jack-tunnel.

SPA
  - Rate limit out-of-buffers errors. (#5249)
  - Partially revert the line-out mute patch, it seems to break things an=
d leave
    audio muted when plugging-unplugging jacks.  (#5246)
  - Improve renegotiation in audioconvert when the graph rate changes and=
 the
    resampler was disabled. (#4933).
  - Fix potential crash in alsa when logging.

Pulse-server
  - A whole bunch of extra security checks and hardening fixes.

Older versions:

PipeWire 1.6.4 (2026-04-22)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Small improvements and seqfault fixes.
  - Try to not emit ports that JACK doesn't understand. Fixes glitches in
    ardour and other JACK apps.

PipeWire
  - Refuse to load plugins and crash when pw_init() was not called. (!278=
4)

SPA
  - Fix LADSPA plugin loading, support LADSPA_PATH ending with /
  - Fix segfault in alsa-seq when removing devices in some cases. (#5221)
  - Allow negative gain in mixer. (#5228)
  - Improve alsa-seq port names, add : between client and port. (#5229)
  - ACP: don=E2=80=99t override user-selected port on availability change=
s.

Bluetooth
  - Backport some important fixes and minor improvements.

JACK
  - Ignore non DSP ports to avoid emitting extra callbacks.

GStreamer
  - Fix crop metadata.

Tools
  - Fix WAVEX saving in pw-cat. (#5233)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.6.3.bb =3D> pipewire_1.6.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.3.bb =3D=
> pipewire_1.6.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
index 82cd928b4a..5d610f5172 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "cc3d0d1191266b263f6d0fa03fce1d1ef57151cc"
+SRCREV =3D "55848f4260a2d2302f9f6bd304d82616976ef9af"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-con=
st-do-.patch"
--=20
2.54.0


