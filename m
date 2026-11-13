Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7425.1794562110183185695
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=qS82BFC7;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id 79ECE4BFB
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2J0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/16] gedit: upgrade 50.0 -> 51.0
Date: Fri, 13 Nov 2026 10:27:19 +0100
Message-ID: <20261113092732.3895896-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-317F982B-6E1565B1/0/0 CLEAN NORMAL
X-TOI-MSGID: 0d799160-6c5f-45d9-8b9c-d7bc86ef0e99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=qPMP65sGsYHC/pZtiWYlMjV7uAlhkt5kKJ7vFoYB+ww=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qS82BFC7XpbFjIBKsAaLRu96w4Z9ojGlcE/YmR558P/7uorz2weEQj1pIGu0AkWFD
	 lFgg7oUQlnltbBYQY2X3vImR4K2WHrI5xJQbZpYM253eW/qZ7mcsFZQvXHl+ivMmp2
	 +dExNloWIKlKlb8w2xTIpTQCCzNsVFBlZVGiFYW91D8vO0GXTCnLT7gZee7/h2/QIH
	 Sh9/YGLniAmGeQiJrgCUVZZWTA8wq/39H/LJJMLwMktjqlbh/f142hw/zAbF9jRkH7
	 EZnEGjXuorr6vG9rlLtQad6YttV1syiA7JpcCMn4yCCA0Dt6UqWDpjOL3URHf4KYm8
	 hnliigS+KBZkg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132236
Content-Type: text/plain; charset="utf-8"

The default branch is main now.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gedit/{gedit_50.0.bb =3D> gedit_51.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_50.0.bb =3D> gedit_51.0.bb}=
 (93%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_51.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_51.0.bb
index d15ab8665d..6c648c5e21 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_51.0.bb
@@ -23,8 +23,8 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc get
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI =3D "gitsm://gitlab.gnome.org/World/gedit/gedit.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3D${PV}"
-SRCREV =3D "25d0bf0c3c40b0866fc23ec875f0af6c67f728ef"
+SRC_URI =3D "gitsm://gitlab.gnome.org/World/gedit/gedit.git;protocol=3Dh=
ttps;branch=3Dmain;tag=3D${PV}"
+SRCREV =3D "b7651f36c9337d20694ae6fe41f0fbe33a043f41"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.56.0

