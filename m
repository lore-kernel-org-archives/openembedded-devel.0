Received: from pasmtpa.tele.dk ([80.160.77.114])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NXDkS-0005t5-5m
	for openembedded-devel@openembedded.org; Tue, 19 Jan 2010 14:03:59 +0100
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpA.tele.dk (Postfix) with ESMTP id 2DDFD80079B
	for <openembedded-devel@openembedded.org>;
	Tue, 19 Jan 2010 13:39:30 +0100 (CET)
Received: from localhost.localdomain ([10.0.1.94]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 19 Jan 2010 13:40:02 +0100
From: sgh@sgh.dk
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 13:39:27 +0100
Message-Id: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Jan 2010 12:40:02.0640 (UTC)
	FILETIME=[85282500:01CA9904]
X-SA-Exim-Connect-IP: 80.160.77.114
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: =?utf-8?q?S=C3=B8ren=20Holm?= <sh@mikrofyn.com>
Subject: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 13:03:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: S=C3=B8ren Holm <sh@mikrofyn.com>

---
 recipes/perl/perl-native_5.8.4.bb |    2 +-
 recipes/perl/perl-native_5.8.7.bb |    2 +-
 recipes/perl/perl-native_5.8.8.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/perl/perl-native_5.8.4.bb b/recipes/perl/perl-native=
_5.8.4.bb
index d3ecb67..e4d5a88 100644
--- a/recipes/perl/perl-native_5.8.4.bb
+++ b/recipes/perl/perl-native_5.8.4.bb
@@ -6,7 +6,7 @@ PR =3D "r4"
 SECTION =3D "libs"
 inherit native
=20
-DEPENDS =3D "virtual/db-native gdbm-native"
+DEPENDS =3D "virtual/db-native gdbm-native make-native"
=20
 SRC_URI =3D "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz"
 S =3D "${WORKDIR}/perl-${PV}"
diff --git a/recipes/perl/perl-native_5.8.7.bb b/recipes/perl/perl-native=
_5.8.7.bb
index d8ccd0c..b933905 100644
--- a/recipes/perl/perl-native_5.8.7.bb
+++ b/recipes/perl/perl-native_5.8.7.bb
@@ -6,7 +6,7 @@ PR =3D "r6"
 SECTION =3D "libs"
 inherit native
=20
-DEPENDS =3D "virtual/db-native gdbm-native"
+DEPENDS =3D "virtual/db-native gdbm-native make-native"
=20
 SRC_URI =3D "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
            file://perl-5.8.8-gcc-4.2.patch;patch=3D1 \
diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native=
_5.8.8.bb
index 60a5cf5..a4c00a6 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Perl is a popular scripting language."
 HOMEPAGE =3D "http://www.perl.org/"
 SECTION =3D "libs"
 LICENSE =3D "Artistic|GPL"
-DEPENDS =3D "virtual/db-native gdbm-native"
+DEPENDS =3D "virtual/db-native gdbm-native make-native"
 PR =3D "r15"
=20
 FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}=
"
--=20
1.6.3.3



