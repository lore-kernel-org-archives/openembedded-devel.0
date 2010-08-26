Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ookaw-0002wP-87
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:06:52 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 6D7232DF5D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:29:40 +0200 (CEST)
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0D8024B007A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:29:35 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 23:29:30 +0200
Message-Id: <1282858170-31241-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1282858170-31241-1-git-send-email-eric@eukrea.com>
References: <1282858170-31241-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ncurses-5.7 : fix sdk build
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
X-List-Received-Date: Thu, 26 Aug 2010 22:06:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ENABLE_WIDEC should also be false when building sdk
like when building native (tested on ubuntu server 9.10)

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/ncurses/ncurses_5.7.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7=
.bb
index 57374ec..29c1674 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 SECTION =3D "libs"
 PATCHDATE =3D "20100501"
 PKGV =3D "${PV}+${PATCHDATE}"
-PR =3D "r11"
+PR =3D "r12"
=20
 DEPENDS =3D "ncurses-native unifdef-native"
 DEPENDS_virtclass-native =3D "unifdef-native"
@@ -32,7 +32,7 @@ EXTRA_AUTORECONF =3D "-I m4"
 ENABLE_WIDEC =3D "true"
 # Build breaks on Ubuntu else :(
 ENABLE_WIDEC_virtclass-native =3D "false"
-
+ENABLE_WIDEC_virtclass-nativesdk =3D "false"
=20
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
@@ -170,7 +170,7 @@ pkg_prerm_ncurses-tools () {
         fi
 }
=20
-BBCLASSEXTEND =3D "native sdk"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGES =3D " \
   ncurses-dbg \
--=20
1.6.3.3



