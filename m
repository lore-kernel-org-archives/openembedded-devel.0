Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P7aBI-0003MU-Lv
	for openembedded-devel@openembedded.org; Sun, 17 Oct 2010 22:50:13 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 223C61D36172;
	Sun, 17 Oct 2010 22:49:37 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 22:49:44 +0200
Message-Id: <1287348584-11948-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287348584-11948-1-git-send-email-ynezz@true.cz>
References: <1287348584-11948-1-git-send-email-ynezz@true.cz>
In-Reply-To: <1287344571-13760-1-git-send-email-ynezz@true.cz>
References: <1287344571-13760-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 3/3] lua-rs232: use standard prefix for Lua libraries
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
X-List-Received-Date: Sun, 17 Oct 2010 20:50:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua-rs232_1.0.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/lua/lua-rs232_1.0.0.bb b/recipes/lua/lua-rs232_1.0.0=
.bb
index c11e3ac..d8de225 100644
--- a/recipes/lua/lua-rs232_1.0.0.bb
+++ b/recipes/lua/lua-rs232_1.0.0.bb
@@ -2,6 +2,8 @@ DESCRIPTION =3D "Lua bindings for librs232 - library for =
serial communications ove
 HOMEPAGE =3D "http://github.com/ynezz/librs232"
 LICENSE =3D "MIT"
=20
+PR =3D "r1"
+
 DEPENDS +=3D "lua5.1"
 RDEPENDS_${PN} +=3D "librs232"
=20
@@ -12,7 +14,7 @@ S =3D "${WORKDIR}/git/"
=20
 inherit autotools
=20
-LUA_LIB_DIR =3D "/usr/local/lib/lua/5.1"
+LUA_LIB_DIR =3D "${libdir}/lua/5.1"
 LUA_LIB =3D "luars232.so"
=20
 PACKAGES =3D "${PN} ${PN}-dbg"
--=20
1.7.0.4



