Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGRLL-0007Su-VP for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 08:13:12 +0100
Received: from f053038093.adsl.alicedsl.de ([78.53.38.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGRKQ-0006RE-OZ for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 07:12:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289414144-18181-2-git-send-email-msmith@cbnco.com>
References: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
	<1289414144-18181-2-git-send-email-msmith@cbnco.com>
Date: Thu, 11 Nov 2010 08:12:12 +0100
Message-ID: <1289459533.10621.4.camel@mattotaupa>
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
Subject: Re: [PATCH 2/2] smpeg: configure with --disable-rpath
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
X-List-Received-Date: Thu, 11 Nov 2010 07:13:12 -0000
X-Groupsio-MsgNum: 26068
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-N9Wk5U+sIlHXq1Jo3hSP"

--=-N9Wk5U+sIlHXq1Jo3hSP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 10.11.2010, 13:35 -0500 schrieb Michael Smith:
> Otherwise libtool and ld try to link against ${libdir}/libdl.so.2 on the
> host system.
>=20
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  .../smpeg-0.4.5+svnr387/add-disable-rpath.patch    |   47 ++++++++++++++=
++++++
>  recipes/smpeg/smpeg_svn.bb                         |    6 ++-
>  2 files changed, 51 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.p=
atch

[=E2=80=A6]

> -SRC_URI =3D "svn://svn.icculus.org/smpeg/;module=3Dtrunk"
> +SRC_URI =3D "svn://svn.icculus.org/smpeg/;module=3Dtrunk \
> +	file://add-disable-rpath.patch;apply=3Dyes"

Please remove the `apply=3Dyes` since that is assumed implicitly if a file
has the extension `patch` [1].

        commit 6fe7cef27069415f2eba36bc640cf59013d4979b
        Author: Chris Larson <chris_larson@mentor.com>
        Date:   Mon May 24 13:01:00 2010 -0700
       =20
            Make the do_patch apply=3Dyes param implicit if extension is .d=
iff/.patch
           =20
            For .diff/.patch you need to apply manually, you can specify ap=
ply=3Dno.
           =20
            Signed-off-by: Chris Larson <chris_larson@mentor.com>
            Acked-by: Denys Dmytriyenko <denis@denix.org>
            Acked-by: Khem Raj <raj.khem@gmail.com>
=20
>  S =3D "${WORKDIR}/trunk"
> =20
>  inherit autotools binconfig
> =20
>  EXTRA_OECONF =3D "--disable-gtktest --disable-opengl-player --without-x =
\
> -		--without-gtk --disable-gtk-player"
> +		--without-gtk --disable-gtk-player --disable-rpath"
> =20
>  do_configure_prepend () {
>  	touch NEWS AUTHORS ChangeLog


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6fe7cef=
27069415f2eba36bc640cf59013d4979b

--=-N9Wk5U+sIlHXq1Jo3hSP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzbl0YACgkQPX1aK2wOHVhmpgCfY1jzMNUccQLGGKKzOgaZ0jnL
gykAmwXP30mRO9cImk9LbOgxIowtmfFU
=xZdl
-----END PGP SIGNATURE-----

--=-N9Wk5U+sIlHXq1Jo3hSP--
