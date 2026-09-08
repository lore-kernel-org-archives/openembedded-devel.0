Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524B3C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:06:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9715.1788879994992156736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=nm7Eqaz6;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout04.t-online.de (Postfix) with SMTP id B13211061
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Sep 2026 17:06:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.236]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3xP6-0czMwb0; Tue, 8 Sep 2026 17:06:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gimp: add librsvg-gtk to RDEPENDS
Date: Tue,  8 Sep 2026 17:06:21 +0200
Message-ID: <20260908150627.2940117-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908150627.2940117-1-f_l_k@t-online.de>
References: <20260908150627.2940117-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788879992-EB7FD95A-98DFC5EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e7f322d-a749-4b47-b3c2-fcc12a0dc785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788879992; i=f_l_k@t-online.de;
	bh=LmYaFk+/VbwbViBKJfoO/JNTtB2Yalbqca6b/8GlF2E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nm7Eqaz6GylwnBFmx2xgBC+E3XdoBPaMrO2KWLd/CL18DJ4Oi2IdCD2bG3cDs6mFa
	 U5V62ytc0O+glVVraUwjA+rgf3BqwlVO1MyvTGLGvM1FehLwY0gOWocIj84rfZCS52
	 F2RjD3/8dlnZlgEvAjySmxCiya6NBFNiebYQuGABJdn5rGA5WEhPZwDRomwATNBEs+
	 QUAnFBnBs7pDwli5wMKYQE6vxKVQmwx9HMcU0+QLGWjhVRUh0YPV4nQ1sOuFZhwg8h
	 OThuMGrGIlakARgPpVrU757RjxVOU/4iMjV4+IzCPQnsTwLTYUrymZRi28rf7nYTNr
	 vsInZixZyyEPQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 15:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129863

The icon themes gimp ships are SVG only. Without the gdk-pixbuf SVG
loader GTK cannot load a single icon and gimp aborts at startup with
"Icon 'image-missing' not present in theme Default". Images built with
the GTK tooling usually carry the loader for other reasons, a Plasma
image does not.

Tested on a Plasma image on corei7-64, gimp starts with the loader
installed.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.4.bb
index cfb0c3a67f..bcd69985fb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
@@ -135,7 +135,7 @@ do_install:prepend() {
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
=20
-RDEPENDS:${PN} =3D "mypaint-brushes glib-networking python3-pygobject py=
thon3-pycairo"
+RDEPENDS:${PN} =3D "mypaint-brushes glib-networking librsvg-gtk python3-=
pygobject python3-pycairo"
=20
 CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] =3D "not-applicable-config: the vulnerability =
only affects MacOS"
--=20
2.55.0


