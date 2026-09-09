Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4D5C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 16:48:53 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17489.1788972530580889259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 09:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ZCVCIvoH;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 79F2FE342
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Sep 2026 18:48:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.113]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4LTZ-1ad3bM0; Wed, 9 Sep 2026 18:48:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] malcontent: pass the useradd options to every system user
Date: Wed,  9 Sep 2026 18:48:41 +0200
Message-ID: <20260909164841.336293-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788972526-B57F9916-5EBEC266/0/0 CLEAN NORMAL
X-TOI-MSGID: 39f1f3c2-89ce-4daa-a2ef-a962f09dd0bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788972528; i=f_l_k@t-online.de;
	bh=O+u/hdI8AKpO216be9xqa0hteDxXJCM7Ecbgk0QWyP4=;
	h=From:To:Subject:Date;
	b=ZCVCIvoHWamSJPBbERqeGfgb5IRSsNKHn+KFsrJGrg22UIIHiYEvlSoimfpdfy201
	 qrW4zJkBdFZ+eLgrUndC/SoOoxmagHvIBx9eghESrg3jx4hn0rX/QEIcAgpXzKOF+6
	 VqwQzvN6WVgakw8hesuGvKeeDtlyaMJhCwZiPV5DtLXF416h1SCsH1Muh41YY66fHs
	 0oZSSyXEbWTnVuy3Gtn97rEnt762DG2UYS4OiGZTTRXwqGcN3cuDe0LgcHo0L2Pjry
	 4zPVBRjaSw4gDskxaDtbdW0esYF8KoGe3ruhx9RT/k7t/E/pkChDchTADgOiRzCAWn
	 +Jx8n13P8NFig==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 16:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129892

USERADD_PARAM is a semicolon separated list of complete useradd
invocations. Only the first entry carried the options, so
malcontent-timerd and malcontent-webd were created with the useradd
defaults: regular UIDs from the user range, /bin/sh as shell and
/home/malcontent-timerd and /home/malcontent-webd created in the
rootfs. Upstream declares all three as system users without a home in
its sysusers.d fragments.

Repeat the options for each user and point the home of the two daemons
at the StateDirectory their units use, so no directory shows up under
/home.

Tested on corei7-64: the rootfs of plasma-image contains only the real
user under /home and all three accounts have system UIDs, /bin/false
and no home directory.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/malcontent/malcontent.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/rec=
ipes-gnome/malcontent/malcontent.bb
index a6aa59513d..0bb258e2b0 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -37,5 +37,9 @@ FILES:${PN} +=3D " \
 "
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell =
/bin/false --home-dir ${localstatedir}  malcontent-timer-ext-agent;malcon=
tent-timerd;malcontent-webd"
+USERADD_PARAM:${PN} =3D " \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir} malcontent-timer-ext-agent; \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir}/lib/malcontent-timerd malcontent-timerd; \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir}/lib/malcontent-webd malcontent-webd \
+"
=20
--=20
2.55.0


