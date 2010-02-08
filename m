Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NeZf0-0008CP-IK
	for openembedded-devel@openembedded.org; Mon, 08 Feb 2010 20:52:45 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id E9F461D36079;
	Mon,  8 Feb 2010 20:50:07 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 20:50:12 +0100
Message-Id: <1265658612-19262-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
References: <20100208173821.GA24852@ibawizard.net>
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] mc 4.6.2: fix do_configure error on missing config.rpath
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
X-List-Received-Date: Mon, 08 Feb 2010 19:52:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes configure error, complaining about missing config.rpath =
file
which gets deleted by autofoo in recipe, so to avoid error bellow we crea=
te
empty file, making configure happy.

configure.ac:104: required file `config/config.rpath' not found
[...snip...]
autoreconf: automake failed with exit status: 1
FATAL: autoreconf execution failed.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/mc/mc_4.6.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/mc/mc_4.6.2.bb b/recipes/mc/mc_4.6.2.bb
index 387187d..3eb6bf3 100644
--- a/recipes/mc/mc_4.6.2.bb
+++ b/recipes/mc/mc_4.6.2.bb
@@ -1,5 +1,5 @@
 require mc.inc
-PR =3D "r4"
+PR =3D "r5"
 HOMEPAGE =3D "http://www.midnight-commander.org/"
=20
 # most of these fixes were copied from openSUSE Factory.
@@ -86,4 +86,6 @@ AUTOFOO=3D"config.guess config.rpath config.sub depcomp=
 install-sh missing mkinsta
          for i in ${AUTOFOO}; do
            rm config/${i}
          done
+         # raises error if it's not found
+         touch config/config.rpath
 }
--=20
1.6.0.4



