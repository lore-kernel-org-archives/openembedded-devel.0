Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1N78XH-0005UC-DQ
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 15:14:34 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id C3B671D36077;
	Sun,  8 Nov 2009 15:13:14 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sun,  8 Nov 2009 15:13:16 +0100
Message-Id: <1257689597-31831-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libgsf: fix compile error, add missing dependency on gtk+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Nov 2009 14:14:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes this compile error:
main.c:38:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file or directory

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/gnome/libgsf_1.14.16.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/libgsf_1.14.16.bb b/recipes/gnome/libgsf_1.14.=
16.bb
index 5697275..9405b42 100644
--- a/recipes/gnome/libgsf_1.14.16.bb
+++ b/recipes/gnome/libgsf_1.14.16.bb
@@ -1,7 +1,7 @@
 LICENSE =3D "GPL"
 SECTION =3D "libs"
=20
-DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib gtk-doc libbonobo gnome-vfs"
+DEPENDS=3D "gtk+ libxml2 bzip2 glib-2.0 zlib gtk-doc libbonobo gnome-vfs=
"
 RDEPENDS =3D "gconf gnome-vfs"
=20
 PACKAGES =3D+ "${PN}-gnome ${PN}-gnome-dev "
--=20
1.5.6.3



