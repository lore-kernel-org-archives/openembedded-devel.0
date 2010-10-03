Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NSz-0004gA-JG
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:15:09 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 5A1C91D363F6;
	Sun,  3 Oct 2010 14:14:33 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:14:34 +0200
Message-Id: <1286108074-11096-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ntpclient: fix adjtimex compile error on uclibc
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
X-List-Received-Date: Sun, 03 Oct 2010 12:15:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ntpclient.o: In function `set_freq':
ntpclient-2007_365-r3/ntpclient-2007/ntpclient.c:166: undefined reference=
 to `__adj timex'
ntpclient.o: In function `get_current_freq':
ntpclient-2007_365-r3/ntpclient-2007/ntpclient.c:149: undefined reference=
 to `__adj timex'

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/ntpclient/files/fix-adjtimex-uclibc.patch |   22 +++++++++++++++=
++++++
 recipes/ntpclient/ntpclient_2007_365.bb           |   10 +++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes/ntpclient/files/fix-adjtimex-uclibc.patch

diff --git a/recipes/ntpclient/files/fix-adjtimex-uclibc.patch b/recipes/=
ntpclient/files/fix-adjtimex-uclibc.patch
new file mode 100644
index 0000000..49472c9
--- /dev/null
+++ b/recipes/ntpclient/files/fix-adjtimex-uclibc.patch
@@ -0,0 +1,22 @@
+Index: ntpclient-2007/ntpclient.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ntpclient-2007.orig/ntpclient.c	2010-10-01 17:25:20.000000000 +0200
++++ ntpclient-2007/ntpclient.c	2010-10-01 17:25:38.000000000 +0200
+@@ -146,7 +146,7 @@
+ #ifdef __linux__
+ 	struct timex txc;
+ 	txc.modes=3D0;
+-	if (__adjtimex(&txc) < 0) {
++	if (adjtimex(&txc) < 0) {
+ 		perror("adjtimex"); exit(1);
+ 	}
+ 	return txc.freq;
+@@ -163,7 +163,7 @@
+ 	struct timex txc;
+ 	txc.modes =3D ADJ_FREQUENCY;
+ 	txc.freq =3D new_freq;
+-	if (__adjtimex(&txc) < 0) {
++	if (adjtimex(&txc) < 0) {
+ 		perror("adjtimex"); exit(1);
+ 	}
+ 	return txc.freq;
diff --git a/recipes/ntpclient/ntpclient_2007_365.bb b/recipes/ntpclient/=
ntpclient_2007_365.bb
index 40a4e1b..9d38245 100644
--- a/recipes/ntpclient/ntpclient_2007_365.bb
+++ b/recipes/ntpclient/ntpclient_2007_365.bb
@@ -4,14 +4,20 @@ AUTHOR =3D "Larry Doolittle <larry@doolittle.boa.org>"
 RDEPENDS_${PN} =3D "busybox"
 SECTION =3D "admin"
 LICENSE =3D "GPLv2"
-PR =3D "r3"
+PR =3D "r4"
 # The ntpclient package uses version numbers that include an underscore =
:(
 PV =3D "2007_365"
 # ntpclient unpacks into a directory that doesn't include version info :=
(
 S =3D "${WORKDIR}/${PN}-2007"
=20
 SRC_URI =3D "http://doolittle.icarus.com/ntpclient/ntpclient_${PV}.tar.g=
z \
-           file://init"
+           file://init \
+          "
+
+UCLIBC_PATCHES =3D " file://fix-adjtimex-uclibc.patch \
+                 "
+SRC_URI_append_linux-uclibc =3D ${UCLIBC_PATCHES}
+SRC_URI_append_linux-uclibceabi =3D ${UCLIBC_PATCHES}
=20
 INITSCRIPT_NAME =3D "ntpclient"
 INITSCRIPT_PARAMS =3D "defaults 65"
--=20
1.7.0.4



