Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3ZQY-0000L5-PZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 19:36:34 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJH00DVRPXDRTJE@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 May 2009 12:29:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3267C14AF5F; Mon,
	11 May 2009 13:29:37 -0400 (EDT)
Date: Mon, 11 May 2009 13:29:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090511172937.GA23731@denix.org>
References: <alpine.DEB.1.00.0905111020490.11037@localhost.localdomain>
MIME-version: 1.0
In-reply-to: <alpine.DEB.1.00.0905111020490.11037@localhost.localdomain>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Mon, 11 May 2009 17:36:35 -0000
X-Groupsio-MsgNum: 10167
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary=cWoXeonUoKmBZSoM
Content-disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2009 at 10:23:18AM -0700, Theodore A. Roth wrote:
>=20
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/evtest/evtest_1.23.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.bb
> index 4c5d195..6cf87be 100644
> --- a/recipes/evtest/evtest_1.23.bb
> +++ b/recipes/evtest/evtest_1.23.bb
> @@ -11,6 +11,8 @@ PR =3D "r0"
>  SRC_URI =3D "http://beagleboard.googlecode.com/files/evtest.c"
>  S =3D "${WORKDIR}"
> =20
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
>  do_compile() {
>      ${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBDIR}
>  }
> --=20
> 1.5.4.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkoIYIEACgkQQypAvBzwgeyRmwCfUySjC5e5cCIf/x438rhqKzK+
JL0AnR98PCAUlFkTTbQ/WoxpNgAddd3v
=jKVy
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
