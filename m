Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7435.1794562164623076819
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LsFtICoR;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 69D5F108A3
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZL-2DfB2G0; Fri, 13 Nov 2026 10:27:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/16] libgedit-amtk: upgrade 5.9.0 -> 5.11.0
Date: Fri, 13 Nov 2026 10:27:16 +0100
Message-ID: <20261113092732.3895896-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562059-51FF882B-4543F7FF/0/0 CLEAN NORMAL
X-TOI-MSGID: fa776291-278a-4e3b-8fb3-a50fe454ef37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=lR+s5r+jUF7/ICBYjxeyHQswt7H3Rcqnqh5vBxRnBa0=;
	h=From:To:Subject:Date;
	b=LsFtICoRp5mMSMDcjm9uFoyqeph0yn9xA5SmpG9/zup7HrzJm7bfvZg9aA99jWNpq
	 +uofvBQGFeoFy6SD/3L74xP0kvS7OmybtW3yVGn/iKdKMa+Rcr1FbscKlIHgDeJnvE
	 VY6jWM8biP0aCMJeEl0UqNT8sU7OStANei8QNkH0cR02sR/aMdHae7EhGKSwoTbU3l
	 +6bHUsaI890yRNNgFVQNY+A6nqzKy06OnVOY+PToGHE3vEZD0YeG3NSWv9mHa7wT0Q
	 hVbrbFvGIEe5Evy3Vc5JHowJ99DXWxz39LXat2rH6wL44EjrvtDV3Y3gkZKoA4eHCj
	 vB9jlEQ7jnP1A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132239
Content-Type: text/plain; charset="utf-8"

5.10 and 5.11 are released as git tags only, so fetch from git.
libgedit-gtksourceview 299.8.0 requires amtk >=3D 5.11.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gedit/{libgedit-amtk_5.9.0.bb =3D> libgedit-amtk_5.11.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-amtk_5.9.0.bb =3D> libge=
dit-amtk_5.11.0.bb} (74%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-amtk_5.11.0.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.11.0.bb
index fc0356c14d..b87c59d16c 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.11.0.bb
@@ -7,7 +7,8 @@ DEPENDS =3D "glib-2.0 gtk+3"
=20
 inherit gobject-introspection features_check gtk-doc gnomebase
=20
-SRC_URI[archive.sha256sum] =3D "7fc3348bef242e08967bdbb9a6698cf39f7810f9=
5051fd8132910f36ed2d6d15"
+SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-amtk.git;branch=
=3Dmain;protocol=3Dhttps;tag=3D${PV}"
+SRCREV =3D "fcd22592dbe2589df622c31cf8fe823470ad28b5"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.56.0

