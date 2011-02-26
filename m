Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1PtOD4-0006ej-R4
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 18:45:38 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A75361D360A9;
	Sat, 26 Feb 2011 18:44:11 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sat, 26 Feb 2011 18:44:13 +0100
Message-Id: <1298742255-23389-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 17:45:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/distro/micro-uclibc.conf |    1 +
 conf/distro/micro.conf        |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.con=
f
index 85ea9b3..55b4ebd 100644
--- a/conf/distro/micro-uclibc.conf
+++ b/conf/distro/micro-uclibc.conf
@@ -12,6 +12,7 @@
 ########################################################################=
#####
=20
 DISTRO_NAME =3D "micro-uclibc"
+DISTRO_FEATURES =3D "xattr"
=20
 ########################################################################=
#####
 # TOOLCHAIN
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index b1f8f1e..bb417b1 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -19,7 +19,7 @@ DISTRO_VERSION =3D "${SRCDATE}"
 # DISTRO FEATURE SELECTION
 ########################################################################=
#####
 # No features selected
-DISTRO_FEATURES =3D "eabi"
+DISTRO_FEATURES +=3D "eabi"
=20
 ########################################################################=
#####
 # LIBRARY NAMES
--=20
1.7.0.4



