Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB97CF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 14:45:15 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.14804.1727534711351196555
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 07:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id 808CD91FC
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 16:45:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.24]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1suYh3-1mq5FB0; Sat, 28 Sep 2024 16:45:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.2.3 -> 1.2.5 PipeWire 1.2.5 (2024-09-27)
Date: Sat, 28 Sep 2024 16:47:01 +0200
Message-ID: <20240928144701.120491-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727534709-1E7FA561-42C36286/0/0 CLEAN NORMAL
X-TOI-MSGID: 38c207c3-ec3c-4036-a112-2a5b588d2ee2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 14:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112542

This is an important bugfix release that is API and ABI compatible with t=
he
previous 1.2.x and 1.0.x releases.

Highlights
  - Fix an fd mismatch in the protocol in some cases that could lead to
    fd leaks and crashes.
  - Fix a bug where the mixer was not updated after setting the port, whi=
ch would
    cause muted audio at boot or resume from suspend.
  - Fix a potential use-after-free in module-rt when stopping a thread.
  - Cached objects are now freed in the JACK API to avoid memory leaks.
  - Some more fixes and improvements.

PipeWire
  - RequestProcess commands are now only sent after the node completes
    the state change to RUNNING.
  - More FreeBSD fixes.
  - Handle ACTIVE links going to < PAUSED as well. This improves
    renegotiation in some cases.
  - Fix an fd mismatch in the protocol in some cases that could lead to
    fd leaks and crashes.

Modules
  - Many of the network modules can now also accept hostnames instead of
    IP addresses.
  - Fix a potential use-after-free in module-rt when stopping the thread.

SPA
  - Support for elogind was added.
  - Some more errors are checked when converting JSON to POD. (#4313)
  - Fix a bug where the mixer was not updated after setting the port, whi=
ch would
    cause muted audio at boot or resume from suspend. (#4084)

JACK
  - The BBT transport handling was improved. Some fields were added to be=
 able
    to handle the JACK semantics correctly. (#4314)
  - Buffers are now aligned according to the maximum CPU alignment instea=
d of
    the hardcoded 16 bytes alignment.
  - Cached objects are now freed correctly.

Doc
  - Some small doc updates. (#4272)

Older versions:

PipeWire 1.2.4 (2024-09-19)

This is a bugfix release that is API and ABI compatible with the
previous 1.2.x and 1.0.x releases.

Highlights
  - Avoid a crash in cleanup of globals. (#4250)
  - Use systemd-logind to scan for new devices in v4l2.
  - Some more bugfixes and improvements.

PipeWire
  - Avoid a crash in cleanup of globals. (#4250)
  - Improve RequestProcess dispatch.

Tools
  - Improve float parsing. (#4234)

SPA
  - Clear the ringbuffer when stopping in libcamera.
  - Use systemd-logind to scan for new devices in v4l2. (#3539, #3960)
  - Queue dropped first buffer in v4l2.
  - Unlink pcm devices when moving drivers to avoid broken pipe.

JACK
  - Emit buffer_size callback in jack_activate() to improve
    compatibility with GStreamer. (#4260)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.2.3.bb =3D> pipewire_1.2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.3.bb =3D=
> pipewire_1.2.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
index 0a2088a3c..b37ae0a53 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "e2a76824e2b112b15ae4a1a3d444696d5526f8d8"
+SRCREV =3D "71fac7fa818f21234da4c356de0b44e47e1a2ef2"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.46.0


