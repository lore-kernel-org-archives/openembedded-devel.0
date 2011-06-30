Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcL5c-0003DW-23 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 19:31:44 +0200
Received: from f053041173.adsl.alicedsl.de ([78.53.41.173]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcL27-0005SC-Ge for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 17:28:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309429335-3762-1-git-send-email-sledz@dresearch-fe.de>
References: <1309428937.2551.107.camel@phil-desktop>
	<1309429335-3762-1-git-send-email-sledz@dresearch-fe.de>
Date: Thu, 30 Jun 2011 19:28:00 +0200
Message-ID: <1309454880.4401.32.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] ppp: 2.4.5 seems to be ready for oe-dev too
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
X-List-Received-Date: Thu, 30 Jun 2011 17:31:44 -0000
X-Groupsio-MsgNum: 32923
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9StOF3fQmgSb9W6hOTSf"

--=-9StOF3fQmgSb9W6hOTSf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.06.2011, 12:22 +0200 schrieb Steffen Sledz:

ppp_2.4.5: remove `DP =3D "-1"`

is a more appropriate and precise commit summary in my opinion.

> Oe-core is using 2.4.5 and it works OK there.
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/ppp/ppp_2.4.5.bb |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
> index 2b6b6f7..86d5ae5 100644
> --- a/recipes/ppp/ppp_2.4.5.bb
> +++ b/recipes/ppp/ppp_2.4.5.bb
> @@ -4,8 +4,6 @@ HOMEPAGE =3D "http://samba.org/ppp/"
>  DEPENDS =3D "libpcap"
>  LICENSE =3D "BSD GPLv2"
>  PR =3D "r1"
> -# Not well tested
> -DEFAULT_PREFERENCE =3D "-1"
> =20
>  PARALLEL_MAKE =3D ""

I am getting the following warning when building the recipe with
`minimal{,-uclibc}` which I do not get with PPP 2.4.3.

        NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started
        WARNING: the following files were installed but not shipped in any =
package:
        WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so
        WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so

Could you fix this in a separate patch before committing this patch?

With the points above fixed/done this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-9StOF3fQmgSb9W6hOTSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4MshsACgkQPX1aK2wOHVjXeQCfT4oP3voF4NjtEbC7emrtwdJC
cJIAn09+mfFkR9rrjg6satrTlLb4Hc7w
=oGC3
-----END PGP SIGNATURE-----

--=-9StOF3fQmgSb9W6hOTSf--
