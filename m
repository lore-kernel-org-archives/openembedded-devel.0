Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7886C27C78
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 17:52:23 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.733.1718128341602557726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 10:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id ADFAC2B060
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 19:52:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.218]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sH5fN-3yA4SQ0; Tue, 11 Jun 2024 19:52:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] pipewire: update 1.0.6 -> 1.0.7
Date: Tue, 11 Jun 2024 19:53:06 +0200
Message-ID: <20240611175306.57570-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611175306.57570-1-f_l_k@t-online.de>
References: <20240611175306.57570-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1718128337-A5C0AED6-CCDDD08A/0/0 CLEAN NORMAL
X-TOI-MSGID: 12d4a3bf-226f-4568-b8a2-faabf7f30ea7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 17:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110829

This is a small bugfix release that is API and ABI compatible with previo=
us
1.0.x releases.

  - Fix a potential race/crash.
  - Fix some problems with negotiation of large integers and floats.
  - Fix JACK sysex MIDI event handling.
  - Some more smaller fixes and improvements.

  - Fix a potential race when adding/removing a port to be scheduled.

  - Fix FFADO default device handling. (#4023)

  - Fix in integer overflow and float/double compare in POD.

  - Copy larger MIDI events correctly.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.0.6.bb =3D> pipewire_1.0.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.6.bb =3D=
> pipewire_1.0.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
index f60ede537..0c68cc4d2 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "1b8b683a6d7ee9f1c5dcef3fce5f93069f1357c4"
+SRCREV =3D "59fe89d41a67f6daad086f8f3fe522935be77a3f"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.45.1


