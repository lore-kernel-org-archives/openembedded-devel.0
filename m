Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jlaine@waffle.bolloretelecom.eu>) id 1LpcCz-0000vR-1m
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 07:44:56 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 20A9B5FF20;
	Fri,  3 Apr 2009 07:42:22 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 68B135FF2F;
	Fri,  3 Apr 2009 07:42:20 +0200 (CEST)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 4707B5FF20;
	Fri,  3 Apr 2009 07:42:20 +0200 (CEST)
Received: from blini.bolloretelecom.eu (localhost [127.0.0.1])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id D488023E1D;
	Fri,  3 Apr 2009 07:42:19 +0200 (CEST)
Received: from blini.bolloretelecom.eu (localhost [127.0.0.1])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 0BD6C23E36;
	Fri,  3 Apr 2009 07:42:17 +0200 (CEST)
Received: from waffle.bolloretelecom.eu (waffle.bolloretelecom.eu
	[192.168.95.233])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 304EC23E1D;
	Fri,  3 Apr 2009 07:42:16 +0200 (CEST)
Received: by waffle.bolloretelecom.eu (Postfix, from userid 10000)
	id E3CA1FFDE; Fri,  3 Apr 2009 07:42:15 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Apr 2009 07:42:15 +0200
Message-Id: <1238737335-32556-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jlaine@waffle.bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] perl-5.8.8: use LDFLAGS for shared libraries (fixes QA error)
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
X-List-Received-Date: Fri, 03 Apr 2009 05:44:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/perl/perl-5.8.8/shared-ldflags.patch |   11 +++++++++++
 recipes/perl/perl_5.8.8.bb                   |    6 +++++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/perl/perl-5.8.8/shared-ldflags.patch

diff --git a/recipes/perl/perl-5.8.8/shared-ldflags.patch b/recipes/perl/=
perl-5.8.8/shared-ldflags.patch
new file mode 100644
index 0000000..b872dc9
--- /dev/null
+++ b/recipes/perl/perl-5.8.8/shared-ldflags.patch
@@ -0,0 +1,11 @@
+diff -urN perl-5.8.8.orig/Cross/generate_config_sh perl-5.8.8/Cross/gene=
rate_config_sh
+--- perl-5.8.8.orig/Cross/generate_config_sh	2003-09-05 08:31:08.0000000=
00 +0000
++++ perl-5.8.8/Cross/generate_config_sh	2009-04-02 14:59:56.000000000 +0=
000
+@@ -30,6 +30,7 @@
+ $callbacks->{'cppstdin'} =3D [\&simple_process_append, ["CC", "arm-linu=
x-gcc -E", "-E"]];
+ $callbacks->{'full_ar'} =3D [\&backtick, ["AR", "which $ENV{AR}", "/usr=
/local/arm/2.95.3/bin/arm-linux-ar"]];
+ $callbacks->{'ld'} =3D [\&simple_process, ["LD", "arm-linux-ld"]];
++$callbacks->{'lddlflags'} =3D [\&simple_process, ["LDDLFLAGS", ""]];
+ $callbacks->{'ldflags'} =3D [\&simple_process, ["LDFLAGS", ""]];
+ $callbacks->{'ldflags_uselargefiles'} =3D [\&simple_process, ["LDFLAGS"=
, ""]];
+ $callbacks->{'myarchname'} =3D [\&simple_process, ["SYS", "armv4l-linux=
"]];
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 2118bba..521cdf6 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE =3D "Artistic|GPL"
 PRIORITY =3D "optional"
 # We need gnugrep (for -I)
 DEPENDS =3D "virtual/db perl-native grep-native"
-PR =3D "r26"
+PR =3D "r27"
=20
 # Major part of version
 PVM =3D "5.8"
@@ -29,6 +29,7 @@ SRC_URI =3D "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}=
.tar.gz \
         file://62_debian_cpan_definstalldirs.patch;patch=3D1 \
         file://64_debian_enc2xs_inc.patch;patch=3D1 \
         file://asm-pageh-fix.patch;patch=3D1 \
+        file://shared-ldflags.patch;patch=3D1 \
         file://config.sh \
         file://config.sh-32 \
         file://config.sh-32-le \
@@ -43,6 +44,9 @@ HOSTPERL =3D "${STAGING_BINDIR_NATIVE}/perl${PV}"
 # Where to find .so files - use the -native versions not those from the =
target build
 export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
=20
+# LDFLAGS for shared libraries
+export LDDLFLAGS =3D "${LDFLAGS} -shared"
+
 do_configure() {
         # Make hostperl in build directory be the native perl
         cp -f ${HOSTPERL} hostperl
--=20
1.5.6.5


