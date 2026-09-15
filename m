Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410AEC88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19803.1789467694956928681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=aLU+lluJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 64F191C09E
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:21:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QI6-35axkW0; Tue, 15 Sep 2026 12:21:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 1/5] glibmm: upgrade 2.66.9 -> 2.66.10
Date: Tue, 15 Sep 2026 12:21:19 +0200
Message-ID: <20260915102123.5530-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467690-E97F99C6-341A43F0/0/0 CLEAN NORMAL
X-TOI-MSGID: 4bf7ee5e-0366-4e0e-8de5-42e6f0c16524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467692; i=f_l_k@t-online.de;
	bh=IVmJMwqkAhiLd79fdF6WZwDIc85YW0usbMpv5on0u1g=;
	h=From:To:Subject:Date;
	b=aLU+lluJbkY+1UtTJvhNWrvKXOa6E2Lpil8NpkFNwkndlxcfCPqPc8xYynmP5NHfG
	 GfSI/THqA4sUnesjn1fAZm8iSKQXy0eDUCGpwoagOFcNLamYX3gXSMin/nIUBM3wQZ
	 CI5KgdcVoW1ArfdTjE2AxddRvgXuS3qDQ9pJNzuFxN0cnWbFeWa0thLxHrFJ6dLUf2
	 peCu5knKdqpfNX2baTPlHk7FED/ZgTxySdbnvYjCini62hqTyaTbVVzp0MoR4/40tH
	 6Wc9AIKRwYVMh5U9J2UL2c6se7aRi056PYR1GxLayCedVJxIzei75YOZIxw9OXa6Yj
	 QKLKr3uhZphHA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130071

GEmblem and GDBus::ActionGroup are final types as of GLib 2.89.2, which
makes the generated headers of 2.66.9 conflict with the class structs
GLib declares:

  error: conflicting declaration 'using GEmblemClass =3D struct _GEmblemC=
lass'

2.66.10 stops deriving those types.

Depends on the glib-2.0 2.90.0 upgrade in oe-core.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../glib-2.0/{glibmm_2.66.9.bb =3D> glibmm_2.66.10.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.9.bb =3D> glibmm_2.66.=
10.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb b/meta-oe/rec=
ipes-core/glib-2.0/glibmm_2.66.10.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb
index 49cc40a813..a9be4e6c55 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb
@@ -12,7 +12,7 @@ inherit gnomebase
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI[archive.sha256sum] =3D "5a026e5602085307c7dcb72b71b07261c40f8091=
4277bef5f8d7f2ecab739bec"
+SRC_URI[archive.sha256sum] =3D "2b61780203aed98e701d3ea57c8f353e7c8ada97=
06a79be782f6c5153dd035c0"
=20
 FILES:${PN} =3D "${libdir}/lib*.so.*"
 FILES:${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ =
${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
--=20
2.55.0


