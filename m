Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1POVxq-0000M6-Dr for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 14:46:19 +0100
Received: from f053040093.adsl.alicedsl.de ([78.53.40.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1POVwW-0006iI-Nj; Fri, 03 Dec 2010 13:44:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 03 Dec 2010 14:44:55 +0100
Message-ID: <1291383895.3669.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eina: Remove `gnu_source.patch` which was applied upstream.
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
X-List-Received-Date: Fri, 03 Dec 2010 13:46:19 -0000
X-Groupsio-MsgNum: 26866
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qkV7X7Wl6pvjpeijrE6E"

--=-qkV7X7Wl6pvjpeijrE6E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 3 Dec 2010 14:01:20 +0100

Something similar to this patch was applied upstream r53157 [1] which close=
s upstream ticket 537 [2].

	$ git grep EFL_SRCREV
	classes/e-base.bbclass:EFL_SRCREV ?=3D "55157"

This change is build tested with the following configurations.

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "842f05d"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal"
	DISTRO_VERSION    =3D "dev-snapshot-20101203"
	TARGET_FPU        =3D "hard"

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "842f05d"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-uclibceabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal-uclibc"
	DISTRO_VERSION    =3D "dev-snapshot-20101203"
	TARGET_FPU        =3D "hard"

[1] http://trac.enlightenment.org/e/changeset/53157
[2] https://trac.enlightenment.org/e/ticket/537

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/efl1/eina/gnu_source.patch |   12 ------------
 recipes/efl1/eina_svn.bb           |    2 --
 2 files changed, 0 insertions(+), 14 deletions(-)
 delete mode 100644 recipes/efl1/eina/gnu_source.patch

diff --git a/recipes/efl1/eina/gnu_source.patch b/recipes/efl1/eina/gnu_sou=
rce.patch
deleted file mode 100644
index 8af08eb..0000000
--- a/recipes/efl1/eina/gnu_source.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: eina/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- eina.orig/configure.ac	2009-11-26 15:58:28.784112802 +0100
-+++ eina/configure.ac	2009-11-26 15:59:34.524939842 +0100
-@@ -273,6 +273,7 @@
- AC_C_INLINE
- AC_C___ATTRIBUTE__
- AC_PROG_CC_STDC
-+AC_GNU_SOURCE
-=20
- EINA_CPPFLAGS=3D""
- case "$host_os" in
diff --git a/recipes/efl1/eina_svn.bb b/recipes/efl1/eina_svn.bb
index 34e1aa8..406db18 100644
--- a/recipes/efl1/eina_svn.bb
+++ b/recipes/efl1/eina_svn.bb
@@ -6,8 +6,6 @@ SRCREV =3D "${EFL_SRCREV}"
=20
 inherit efl
=20
-SRC_URI +=3D "file://gnu_source.patch"
-
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS =3D ""
=20
--=20
1.7.2.3

--=-qkV7X7Wl6pvjpeijrE6E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkz49FcACgkQPX1aK2wOHVh75QCfZOXEoFAhT+cee7m5ZYX0uZyR
u4YAnRM1XaZgboGdAEi/3ieFX7e/9YXA
=z5d+
-----END PGP SIGNATURE-----

--=-qkV7X7Wl6pvjpeijrE6E--
