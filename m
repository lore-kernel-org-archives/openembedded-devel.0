Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LqnpO-0005j9-Vi
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 14:21:29 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id B9C994C8037;
	Mon,  6 Apr 2009 14:18:34 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id D3AB64C8176;
	Mon,  6 Apr 2009 14:18:31 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id DDE8D1840D9; Mon,  6 Apr 2009 14:18:33 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 14:18:33 +0200
Message-Id: <1239020313-6865-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] cups: use LDFLAGS for shared libs (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:21:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/cups/cups.inc       |    4 +---
 recipes/cups/cups_1.2.12.bb |    2 +-
 recipes/cups/cups_1.3.8.bb  |    2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
index bbf2377..59075fb 100644
--- a/recipes/cups/cups.inc
+++ b/recipes/cups/cups.inc
@@ -8,8 +8,6 @@ SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${P=
V}-source.tar.bz2 \
=20
 inherit autotools binconfig
=20
-LDFLAGS +=3D " -L${STAGING_LIBDIR} "
-
 EXTRA_OECONF =3D " \
                 --enable-gnutls \
 		--enable-dbus \
@@ -26,7 +24,7 @@ EXTRA_OECONF =3D " \
 do_configure() {
 	gnu-configize
 	libtoolize --force
-	oe_runconf
+	DSOFLAGS=3D"${LDFLAGS}" oe_runconf
 }
=20
 do_compile () {
diff --git a/recipes/cups/cups_1.2.12.bb b/recipes/cups/cups_1.2.12.bb
index bbe3c5d..4f7d0d4 100644
--- a/recipes/cups/cups_1.2.12.bb
+++ b/recipes/cups/cups_1.2.12.bb
@@ -1,2 +1,2 @@
 require cups.inc
-PR =3D "r1"
+PR =3D "r2"
diff --git a/recipes/cups/cups_1.3.8.bb b/recipes/cups/cups_1.3.8.bb
index e9fd985..79cbc32 100644
--- a/recipes/cups/cups_1.3.8.bb
+++ b/recipes/cups/cups_1.3.8.bb
@@ -1,7 +1,7 @@
 require cups.inc
=20
 SRC_URI +=3D "file://use_echo_only_in_init.patch;patch=3D1"
-PR =3D "r1"
+PR =3D "r2"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
--=20
1.6.2.1



