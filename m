Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B06C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 17:34:49 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.12936.1700156084478261822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 09:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id B1D4934C44
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 18:34:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.171.151]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r3gGF-0NcHQn0; Thu, 16 Nov 2023 18:34:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade 0.3.84 -> 0.3.85
Date: Thu, 16 Nov 2023 18:35:11 +0100
Message-ID: <20231116173511.113526-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700156079-AA7FB9F9-1E77B819/0/0 CLEAN NORMAL
X-TOI-MSGID: 000c8ed7-f856-4d79-a150-20547cf0c632
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106821

PipeWire 0.3.85 (2023-11-16)

This is the fifth (and last) 1.0 release candidate that is API and ABI
compatible with previous 0.3.x releases.

Highlights
  - Fix an issue where a link could end up paused while not negotiated.
  - Fix an infinite recursion issue when finding runnable nodes.
  - Support XDG base directories when loading ACP config.
  - Fix MIDI event recording preview in Ardour.
  - Many more small fixes, cleanups and improvements.

PipeWire
  - Fix an issue where a link could end up paused while not negotiated.
    (#3619)
  - Fix an infinite recursion issue when finding runnable nodes by stoppi=
ng
    the scan on feedback links around the driver. (#3621)
  - The system service now has better socket permissions.

Modules
  - Add support for uclamp. This allows the scheduler to make better info=
rmed
    decisions about where tasks should be placed, and what pstate to set
    for the CPU it is running on.
  - Emit warnings when applications are not doing the right locking inste=
ad
    of crashing.
  - Improve media.name for RAOP sinks. (#3801)
  - Support pause/resume in pipe-tunnel. (#3197)
  - Remove time rlimit when probing for realtime to avoid SIGXCPU.

SPA
  - Fix a bug where the resampler would be activated even when there is a=
n
    ALSA pitch element. (#3628)
  - Improve resume from suspend in ALSA. (#3646)
  - Add option to expose ALSA controls as prop params.
  - Support XDG base directories when loading ACP config. This makes it p=
ossible
    to override the ACP config files.

Bluetooth
  - Schedule nodes in the same ISO group together.
  - More BAP fixes and cleanups.

JACK
  - Fix MIDI events from peer ports. This makes the MIDI event recording =
preview
    of Ardour work correctly.

GStreamer
  - Fix some error handling in the source and sink.

ALSA plugin
  - Improve poll descriptor handling. (#3648)

Docs
  - Many improvements to the layout and organization.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.84.bb =3D> pipewire_0.3.85.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.84.bb =3D=
> pipewire_0.3.85.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.bb
index 25d4762c8..883d02d51 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "cf46c4f5af6fc026881dbd4e837e71d8e507beef"
+SRCREV =3D "7db1e7f643a454056327999b2d8e35d8097b5593"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


