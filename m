Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8796FC61CE7
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 14:32:31 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.19485.1749306746477740080
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 07:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 7283B75E
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Jun 2025 16:32:24 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.249]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNuau-2IW0XZ0; Sat, 7 Jun 2025 16:32:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.4 -> 1.4.5
Date: Sat,  7 Jun 2025 16:31:51 +0200
Message-ID: <20250607143151.3158945-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1749306744-2EFF4F2B-A42641B2/0/0 CLEAN NORMAL
X-TOI-MSGID: ad55cde8-0173-4a25-81e3-80315d71edd5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 14:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117772

PipeWire 1.4.5 (2025-06-04)

This is a quick bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Fix negotiation errors when using multichannel output. Fixes
    audio in some games and mpv in some cases.
  - 1 Small fix and 1 improvement.

SPA
  - Fix another bug caused by reversing the filter default value
    preference. (#4722)

pulse-server
  - Implement STREAM_DONT_INHIBIT_AUTO_SUSPEND flags. This can
    reduce power in pavucontrol when monitoring inactive streams.
    (#4255 #4726)

ALSA
  - Fix a potential deadlock when calling _drop and _drain at the
    same time. (#4728)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.4.bb =3D> pipewire_1.4.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.4.bb =3D=
> pipewire_1.4.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
index 5eefb07532..d4ae3381bd 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "3f79bcae5d4415f82907b49221ca05241a7f263c"
+SRCREV =3D "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
--=20
2.49.0


