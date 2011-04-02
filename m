Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q61hK-0006oR-G7
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:21:06 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id E7C471D36069;
	Sat,  2 Apr 2011 16:19:00 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 16:18:47 +0200
Message-Id: <1301753930-32581-4-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1301753930-32581-1-git-send-email-ynezz@true.cz>
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH 3/6] librs232: add version 1.0.1 and remove the old one
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
X-List-Received-Date: Sat, 02 Apr 2011 14:21:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/librs232/librs232_1.0.0.bb |   10 ----------
 recipes/librs232/librs232_1.0.1.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/librs232/librs232_1.0.0.bb
 create mode 100644 recipes/librs232/librs232_1.0.1.bb

diff --git a/recipes/librs232/librs232_1.0.0.bb b/recipes/librs232/librs2=
32_1.0.0.bb
deleted file mode 100644
index f9114e7..0000000
--- a/recipes/librs232/librs232_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "librs232 - library for serial communications over RS-23=
2 (serial port)"
-HOMEPAGE =3D "http://github.com/ynezz/librs232"
-LICENSE =3D "MIT"
-
-SRC_URI =3D "git://github.com/ynezz/librs232.git;protocol=3Dgit"
-
-SRCREV =3D "ecad1e03104bc9bf348e0c5e571660f270c86421"
-S =3D "${WORKDIR}/git/"
-
-inherit autotools
diff --git a/recipes/librs232/librs232_1.0.1.bb b/recipes/librs232/librs2=
32_1.0.1.bb
new file mode 100644
index 0000000..c81ce4e
--- /dev/null
+++ b/recipes/librs232/librs232_1.0.1.bb
@@ -0,0 +1,10 @@
+DESCRIPTION =3D "librs232 - library for serial communications over RS-23=
2 (serial port)"
+HOMEPAGE =3D "http://github.com/ynezz/librs232"
+LICENSE =3D "MIT"
+
+SRC_URI =3D "git://github.com/ynezz/librs232.git;protocol=3Dgit"
+
+SRCREV =3D "cd9811207ee08f0bd83354b609c13f56e39d5f6c"
+S =3D "${WORKDIR}/git/"
+
+inherit autotools
--=20
1.7.1



