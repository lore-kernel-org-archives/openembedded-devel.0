Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9114C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18111.1789458271393364188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=poL2JEoO;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id B336B1C3BE
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5i0; Tue, 15 Sep 2026 09:44:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/31] evolution-data-server: upgrade 3.60.2 -> 3.62.0
Date: Tue, 15 Sep 2026 09:43:19 +0200
Message-ID: <20260915074347.6003-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458249-FBD159B9-AEA6C885/0/0 CLEAN NORMAL
X-TOI-MSGID: 1863f6ea-b038-4395-b94b-fb23ebfe35c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=CBXwkzxovgIaKFX0KxO5RNNZW0f3ddRUMdb6rj4oeqI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=poL2JEoOvEot4o3I6VIGu4zUvwHDFUC4fNLgbZmuXwfBafI+KFb75ZyfZzgWxODay
	 7lQGvPlcrzvP7oebrSNIK65g5i3Pd79kBf3EhmpBy2jdqQH4wkTSS2WHk6t4KvZqYF
	 /IdtzDkXrNclXgqyD0cZIZ5Bis9SusHRXc6RM8n+hd24V2tNLkv7Qjp6adxzvf7fhW
	 +Ig7ikByQBRwwnq4MB8ideP6BgNILQir+UJRFA1h5vjRqD2X9b9VTcS6WDrkzNBxtu
	 /CMTQbmn5OzNrPwRy2f3q7FDMizj+bQn001kIIV9ZXkqwVagi21W1feOeZh8YIG+p8
	 ZGvLke406QO/g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130048

The license headers of camel.h and e-data-server-util.h were converted to
SPDX tags; the license itself is unchanged. Point LIC_FILES_CHKSUM at the
end of the header comment so that added includes no longer change the
checksum.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.inc       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 31db864bcd..8f248c7362 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -4,12 +4,12 @@ BUGTRACKER =3D "https://bugzilla.gnome.org/"
=20
 LICENSE =3D "LGPL-2.0-only AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255cf0557f3fe7d7068=
212 \
-                    file://src/camel/camel.h;endline=3D24;md5=3D4150eec6=
c74e359401d8ed7f266984b9 \
-                    file://src/libedataserver/e-data-server-util.h;endli=
ne=3D20;md5=3Dfa7fca32c1bf07f87a52094b414fe7a8 \
+                    file://src/camel/camel.h;endline=3D5;md5=3Dfd00ddcc6=
fd84a9e7c8a3b1f760617da \
+                    file://src/libedataserver/e-data-server-util.h;endli=
ne=3D7;md5=3D48ebc221795bd4ff17dec7035065e865 \
                     "
=20
 GNOMEBASEBUILDCLASS =3D "cmake"
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "2084dbdac396371b365d504c1ff45866ba8dca2f=
1252e5da1d3d9c33abdc1286"
-PV =3D "3.60.2"
+SRC_URI[archive.sha256sum] =3D "78be88e9a511f5afe7ff2e363eade84b622dd028=
2647fc576edb2d4ff2962cba"
+PV =3D "3.62.0"
--=20
2.55.0


