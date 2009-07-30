Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MWTYT-0004oD-08
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 13:12:13 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id B1AC31402C; Thu, 30 Jul 2009 12:57:11 +0200 (CEST)
Date: Thu, 30 Jul 2009 12:57:11 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: Stanislav Brabec <utx@penguin.cz>
Message-ID: <20090730105711.GA29595@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
MIME-Version: 1.0
In-Reply-To: <1244635240.28486.7.camel@hammer.suse.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's	do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 11:12:13 -0000
X-Groupsio-MsgNum: 12142
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm not sure how you tested this, but there are quotes missing, so that
the "-E" argument to "grep" is passed to "export" instead. I guess some
shells have a "-E" flag to "export", so it is silently ignored, but mine
don't.

Patch attached.

Marc

--CE+1k2dSO48ffgeK
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="oe-libtool.patch"
Content-Transfer-Encoding: quoted-printable

commit 79eb6925a932b93a0ebcbdfa96f74a9cc5f8c99d
Author: Marc Olzheim <marc@iphion.nl>
Date:   Thu Jul 30 12:48:46 2009 +0200

    2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 broke do_configure.

diff --git a/recipes/libtool/libtool_2.2.4.bb b/recipes/libtool/libtool_2.2=
.4.bb
index ad4b0a0..5d59ce0 100644
--- a/recipes/libtool/libtool_2.2.4.bb
+++ b/recipes/libtool/libtool_2.2.4.bb
@@ -17,10 +17,10 @@ EXTRA_AUTORECONF =3D "--exclude=3Dlibtoolize"
 do_configure_prepend () {
 	# Skip this for native build:
 	if test -n "$CONFIG_SITE" ; then
-		export ac_cv_path_SED=3D${ac_cv_path_GREP=3D/bin/sed}
-		export ac_cv_path_GREP=3D${ac_cv_path_GREP=3D/bin/grep}
-		export ac_cv_path_EGREP=3D${ac_cv_path_EGREP=3D/bin/grep -E}
-		export ac_cv_path_FGREP=3D${ac_cv_path_FGREP=3D/bin/grep -F}
+		export ac_cv_path_SED=3D"${ac_cv_path_GREP=3D/bin/sed}"
+		export ac_cv_path_GREP=3D"${ac_cv_path_GREP=3D/bin/grep}"
+		export ac_cv_path_EGREP=3D"${ac_cv_path_EGREP=3D/bin/grep -E}"
+		export ac_cv_path_FGREP=3D"${ac_cv_path_FGREP=3D/bin/grep -F}"
 	fi
 }
=20
diff --git a/recipes/libtool/libtool_2.2.6a.bb b/recipes/libtool/libtool_2.=
2.6a.bb
index 6268576..6c87660 100644
--- a/recipes/libtool/libtool_2.2.6a.bb
+++ b/recipes/libtool/libtool_2.2.6a.bb
@@ -17,10 +17,10 @@ EXTRA_AUTORECONF =3D "--exclude=3Dlibtoolize"
 do_configure_prepend () {
 	# Skip this for native build:
 	if test -n "$CONFIG_SITE" ; then
-		export ac_cv_path_SED=3D${ac_cv_path_GREP=3D/bin/sed}
-		export ac_cv_path_GREP=3D${ac_cv_path_GREP=3D/bin/grep}
-		export ac_cv_path_EGREP=3D${ac_cv_path_EGREP=3D/bin/grep -E}
-		export ac_cv_path_FGREP=3D${ac_cv_path_FGREP=3D/bin/grep -F}
+		export ac_cv_path_SED=3D"${ac_cv_path_GREP=3D/bin/sed}"
+		export ac_cv_path_GREP=3D"${ac_cv_path_GREP=3D/bin/grep}"
+		export ac_cv_path_EGREP=3D"${ac_cv_path_EGREP=3D/bin/grep -E}"
+		export ac_cv_path_FGREP=3D"${ac_cv_path_FGREP=3D/bin/grep -F}"
 	fi
 }
=20

--CE+1k2dSO48ffgeK--

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxfIcACgkQezjnobFOgrHliACeONZQ1s3gd5KYMB+NcklubOU2
MBEAn0Kz4atodZdGRHGimMdo+R0p8m7v
=ZW5c
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
