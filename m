Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OphLy-0005ln-9Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 14:51:19 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 3B4A34B013B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 14:50:45 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Aug 2010 14:50:27 +0200
Message-Id: <1283086227-13224-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] alsa-utils-alsamixer: add ncurses-terminfo RDEPENDS
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
X-List-Received-Date: Sun, 29 Aug 2010 12:51:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

else I get "Error opening terminal: linux." when trying to run
it.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/alsa/alsa-utils_1.0.20.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/alsa/alsa-utils_1.0.20.bb b/recipes/alsa/alsa-utils_=
1.0.20.bb
index cca2980..51c963b 100644
--- a/recipes/alsa/alsa-utils_1.0.20.bb
+++ b/recipes/alsa/alsa-utils_1.0.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.alsa-project.org"
 SECTION =3D "console/utils"
 LICENSE =3D "GPLv2"
 DEPENDS =3D "alsa-lib ncurses"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.b=
z2 \
 	   file://alsa-utils-remove-xmlto-1.0.19plus.patch \
@@ -52,6 +52,8 @@ FILES_alsa-utils-alsactl     =3D "${sbindir}/alsactl"
 FILES_alsa-utils-aseqdump    =3D "${bindir}/aseqdump"
 FILES_alsa-utils-alsaconf    =3D "${sbindir}/alsaconf"
=20
+RDEPENDS_alsa-utils-alsamixer =3D "ncurses-terminfo"
+
 DESCRIPTION_alsa-utils-aplay        =3D "play (and record) sound files v=
ia ALSA"
 DESCRIPTION_alsa-utils-amixer       =3D "command-line based control for =
ALSA mixer and settings"
 DESCRIPTION_alsa-utils-alsamixer    =3D "ncurses based control for ALSA =
mixer and settings"
--=20
1.6.3.3



