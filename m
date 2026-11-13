Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7436.1794562164806398658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=K9+jjitC;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 861B2108EA
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2K0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/16] tepl: upgrade 6.14.0 -> 6.15.0
Date: Fri, 13 Nov 2026 10:27:20 +0100
Message-ID: <20261113092732.3895896-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-517F982B-0EA9465A/0/0 CLEAN NORMAL
X-TOI-MSGID: a1fb06bd-039b-442f-8d1f-187ccc6881d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=QWtaKftWDczO/5afES8voSlBXgwD242It5zZUqVgOH4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=K9+jjitCDxZXbtSAJjZMuk5C5H8Bu3Q2wvdt5lLhSxr59T6DrhciMpKjKwWWgBqNI
	 8nuEptcdCQPFqnf08s4vEX3lYGw19YRuCnXLJD4jtOQ4+V59Thy0kbZScmAZkC65D1
	 bng9her3XwkOGwi+Bqh/kOuV/Z6TvEILaeWrwpy8Ke37hrUijZt4sAbajGMvhSt9tn
	 4MYrzRqGOs0cfQ90g6nYCS+GcX+jU9Ye10FoCw353KjCvHoUIhPi6uk5S5islbaHX5
	 Cu0oXZ9Tkn9aBlQaaUI4h0MTmjmeZDUUr7nqZq9PRe/3/jD9mlG+ytcl7dtUkhS9GX
	 AYZcfv4NjOnnA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132241
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/tepl/{tepl_6.14.0.bb =3D> tepl_6.15.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_6.14.0.bb =3D> tepl_6.15.0.bb=
} (94%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb b/meta-gnome/re=
cipes-gnome/tepl/tepl_6.15.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.15.0.bb
index 4350f69068..7ffe05480a 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.15.0.bb
@@ -23,7 +23,7 @@ inherit meson gobject-introspection gettext features_ch=
eck pkgconfig
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-tepl.git;protoc=
ol=3Dhttps;branch=3Dmain;tag=3D${PV}"
-SRCREV =3D "d60f7ded17b52ea42091c073ea81090e91f38620"
+SRCREV =3D "621fa9e8c43fafca8a0f299ac116715b3a835fbe"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
--=20
2.56.0

