Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7429.1794562074016623372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=tgzOlPrj;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id 882171900
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2L0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/16] devilspie2: upgrade 0.44 -> 0.45
Date: Fri, 13 Nov 2026 10:27:21 +0100
Message-ID: <20261113092732.3895896-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-F27FB82B-EE7C5051/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f1765a7-3917-4d99-9f69-f1ed09f1b1cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=5OFSa2sPBxNUwp7B4sFX07S0oQGnL4IzCF7ZgwE3SQM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tgzOlPrjcFewqZim9oxzIvX3qr1LxAW3Kc0xGpI9lv4GI0ve9AbRr2NoCsIqFndiK
	 +14tp8FPUiBz7ebLurHtI18377JJiOqmKTwG629ttPpLsLZsAy9nLisPyBmyql0m3o
	 9Ez4Dg3mdoHxCXMI7SIgn8yQg3xy1sxZrpznm31cJTwvZu2phVsJfKyhDqf/77UrK3
	 Sr3YPqlsoN8JsQOjIb5omgz2cCFIsC0tA1NmjuruNvtveCVnjMaytQURa5D72B6CRG
	 CPOcKEaSu162PfsJKOu12b9Ra9qqWzevRhJpUToi+HCFnFknW2CbUErXw5I8KcOsyh
	 AnTKoIrtjmO0g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132231
Content-Type: text/plain; charset="utf-8"

0.45 uses the WnckHandle API, which libwnck for gtk2 lacks, so build
against gtk+3 and libwnck3. COPYING holds the GPLv3 text now and
GPL3.txt is gone; the sources are GPL-3.0-or-later. Pass PREFIX to
make in do_compile too, so LOCALEDIR is not /usr/local/share/locale.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{devilspie2_0.44.bb =3D> devilspie2_0.45.bb}       | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.44.bb =3D> devil=
spie2_0.45.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta=
-gnome/recipes-gnome/devilspie/devilspie2_0.45.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.45.bb
index 2bbf73dffc..e6ee118935 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.45.bb
@@ -1,14 +1,13 @@
 DESCRIPTION =3D "Devilspie2 is a window matching utility, allowing the u=
ser to perform scripted actions on windows as they are created"
 HOMEPAGE =3D "http://www.gusnan.se/devilspie2"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D00aefaa50aad75c21367df66102d5=
42c \
-                    file://GPL3.txt;md5=3Dd32239bcb673463ab874e80d47fae5=
04"
+LICENSE =3D "GPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-DEPENDS =3D "gtk+ glib-2.0 libwnck libxinerama lua virtual/libx11"
+DEPENDS =3D "gtk+3 glib-2.0 libwnck3 libxinerama lua virtual/libx11"
=20
 PV .=3D "+git"
=20
-SRCREV =3D "b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9"
+SRCREV =3D "ab0a1a04315d683cbb086bd973e2bc78720832c2"
=20
 SRC_URI =3D "git://github.com/dsalt/devilspie2;branch=3Dmaster;protocol=3D=
https \
     file://default.lua \
@@ -21,8 +20,7 @@ inherit features_check pkgconfig gettext
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 do_compile() {
-    export GTK2=3D1
-    oe_runmake CC=3D"${CC}" CPPFLAGS=3D"${CPPFLAGS}" LDFLAGS=3D" -ldl -l=
m ${LDFLAGS}"
+    oe_runmake CC=3D"${CC}" PREFIX=3D"${prefix}" CPPFLAGS=3D"${CPPFLAGS}=
" LDFLAGS=3D" -ldl -lm ${LDFLAGS}"
 }
=20
 do_install() {
--=20
2.56.0

