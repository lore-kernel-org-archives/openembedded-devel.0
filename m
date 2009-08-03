Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MXt74-0007R2-C4
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 10:41:46 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id E42641402C; Mon,  3 Aug 2009 10:26:19 +0200 (CEST)
Date: Mon, 3 Aug 2009 10:26:19 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090803082619.GA10022@zlo.nu>
References: <1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<4A73D370.3050104@mwester.net> <4A74ECAA.6020308@mwester.net>
	<4A750E80.2020704@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4A750E80.2020704@mwester.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks	libtool's do_configure [PATCH]
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
X-List-Received-Date: Mon, 03 Aug 2009 08:41:46 -0000
X-Groupsio-MsgNum: 12189
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline

--v9Ux+11Zm5mwPlX6
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 01, 2009 at 10:56:48PM -0500, Mike Westerhof wrote:
> And I think the answer is no, it doesn't build correctly for anybody.
>  The following line seems to be incorrect in the original patch:
>=20
> +               export ac_cv_path_SED=3D${ac_cv_path_GREP=3D/bin/sed}

Ah, doh, lol... How could we've overlooked this. :-/

Anyway, I'd say fix this for libtool_2.2.4.bb as well ;-)

Marc

--a8Wt8u1KmwUX3Y2C
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="lt224.patch"

commit 89c75a691b4c92aab6d29a85599824813813b205
Author: Marc Olzheim <marc@iphion.nl>
Date:   Mon Aug 3 10:23:10 2009 +0200

    libtool: Apply 0131d2ec1d1e49a1facbc02234d5a70f8b67425e on libtool 2.2.4 as well.

diff --git a/recipes/libtool/libtool_2.2.4.bb b/recipes/libtool/libtool_2.2.4.bb
index 5d59ce0..a36dd6e 100644
--- a/recipes/libtool/libtool_2.2.4.bb
+++ b/recipes/libtool/libtool_2.2.4.bb
@@ -17,7 +17,7 @@ EXTRA_AUTORECONF = "--exclude=libtoolize"
 do_configure_prepend () {
 	# Skip this for native build:
 	if test -n "$CONFIG_SITE" ; then
-		export ac_cv_path_SED="${ac_cv_path_GREP=/bin/sed}"
+		export ac_cv_path_SED="${ac_cv_path_SED=/bin/sed}"
 		export ac_cv_path_GREP="${ac_cv_path_GREP=/bin/grep}"
 		export ac_cv_path_EGREP="${ac_cv_path_EGREP=/bin/grep -E}"
 		export ac_cv_path_FGREP="${ac_cv_path_FGREP=/bin/grep -F}"

--a8Wt8u1KmwUX3Y2C--

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp2nysACgkQezjnobFOgrFXDQCfTsAWqfm2N5k67FNDglou/moG
+0YAn2eECW3NwQYGpbd0IYLvlRUi2d4n
=QcfA
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
