Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FB6CA5FE5
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 20:40:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3850.1790973645470126422
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 13:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=eqzoYOGf;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 9C395C3A
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Oct 2026 22:40:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.105]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xCk3b-2JxvXA0; Fri, 2 Oct 2026 22:40:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] glycin: upgrade 2.2.0 -> 2.2.1
Date: Fri,  2 Oct 2026 22:40:21 +0200
Message-ID: <20261002204022.70439-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002204022.70439-1-f_l_k@t-online.de>
References: <20261002204022.70439-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790973640-DCFF69F1-FBE18EDE/0/0 CLEAN NORMAL
X-TOI-MSGID: 49af368a-bbfe-4931-b967-ac9600317f0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790973642; i=f_l_k@t-online.de;
	bh=iUWrmyb7ptxBBoJ1mBTxlYw4UJ3NA8KPKOQVnP+KUE4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eqzoYOGfJ7AcbdEKbwthqh3HAsX5ObZkfrPhBxrPQhhT7WvTThH2u56xvSRtey0gr
	 xzdFmqszQEFanmFgqNvydnzqf5tbABo2FEZFQJewo0jlvVz6LHwao/ceVEZSRUdrsq
	 B0cdC0O43DClR1rZo3Pjnc1Yy5uks0VxlK8vGKJoB9PPYAJ8L8VrwjiyVEjv1OzwPz
	 pOLjqoF+Tz9tvjnZ7FL+8DjbmcsbR9U/3lf6HJe4bTP1aqLSWJuq/2uOeKr+Tj+otL
	 8ijYhqnU3eOmBPTyu/Gb590A1nHcWWptuD18X1/izUtRw2e/zqLyCKpFjGxuN5ktK1
	 udxirc5H9SUCw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 20:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130609

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/glycin/{glycin_2.2.0.bb =3D> glycin_2.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/glycin/{glycin_2.2.0.bb =3D> glycin_2.2.=
1.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb b/meta-gnome=
/recipes-gnome/glycin/glycin_2.2.1.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
rename to meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
index 69d1566fe2..279124200f 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MPL-2.0;md5=3Df75d=
2927d3c1ed2414ef72048f5ad640
 inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext =
gobject-introspection
=20
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3D${PV}"
-SRCREV =3D "a5c2d58d6ae0bd7233f6705781b17dd083ebde73"
+SRCREV =3D "6b7226d495755772bcd4bcfb5c8051a446e625ef"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/glycin/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


