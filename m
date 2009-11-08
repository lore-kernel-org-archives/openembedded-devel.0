Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1N7BUs-0002pi-Fr
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 18:24:18 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id E0FCE1D36077;
	Sun,  8 Nov 2009 18:22:56 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sun,  8 Nov 2009 18:23:00 +0100
Message-Id: <1257700980-19879-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] wv: fix compile problem
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
X-List-Received-Date: Sun, 08 Nov 2009 17:24:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

base_do_compile() checks if there's Makefile or makefile in source direct=
ory,
and then it runs oe_runmake. Since there's GNUmakefile generated, change
do_compile accordingly.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/wv/wv_1.2.0.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/wv/wv_1.2.0.bb b/recipes/wv/wv_1.2.0.bb
index 7f06f58..b3114a5 100644
--- a/recipes/wv/wv_1.2.0.bb
+++ b/recipes/wv/wv_1.2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Programs for accessing Microsoft Word do=
cuments"
 HOMEPAGE =3D "http://wvware.sourceforge.net/"
 LICENSE =3D "GPLv2"
 DEPENDS =3D "libgsf glib-2.0"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
            file://pkgconfig.patch;patch=3D1"
@@ -16,3 +16,7 @@ EXTRA_OECONF =3D ""
 do_stage () {
 	autotools_stage_all
 }
+
+do_compile () {
+	oe_runmake -f GNUmakefile=20
+}
--=20
1.5.6.3



