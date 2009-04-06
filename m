Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqs1O-0007E3-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:50:09 +0200
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 1AA4CD4807F;
	Mon,  6 Apr 2009 18:47:12 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 32512D480EC;
	Mon,  6 Apr 2009 18:47:09 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 073251840D9; Mon,  6 Apr 2009 18:47:11 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 18:47:11 +0200
Message-Id: <1239036431-26959-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] gd: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 16:50:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/gd/gd_2.0.33.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gd/gd_2.0.33.bb b/recipes/gd/gd_2.0.33.bb
index 7c1f7c3..7e47b08 100644
--- a/recipes/gd/gd_2.0.33.bb
+++ b/recipes/gd/gd_2.0.33.bb
@@ -2,7 +2,7 @@ SECTION =3D "libs"
 LICENSE =3D "GD"
 DESCRIPTION =3D "gd is a library used to create PNG, JPEG, or WBMP image=
s."
 DEPENDS =3D "libpng jpeg zlib"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "http://www.boutell.com/gd/http/gd-${PV}.tar.gz"
 S =3D "${WORKDIR}/gd-${PV}"
@@ -17,7 +17,7 @@ EXTRA_OECONF +=3D " --with-zlib=3D${STAGING_LIBDIR}/.. =
\
                   --without-xpm \
                   --without-x"
=20
-EXTRA_OEMAKE =3D "LDFLAGS=3D-L${STAGING_LIBDIR}"
+EXTRA_OEMAKE =3D 'LDFLAGS=3D"${LDFLAGS}"'
=20
 headers =3D "gd.h gdcache.h gd_io.h gdfx.h gdfontmb.h \
 	   gdfontg.h gdfontl.h gdfonts.h gdfontt.h"
--=20
1.6.2.1



