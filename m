Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DC86175874
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 20:31:54 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1ZI0gD-0006aG-Nr from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2015 13:31:53 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Jul 2015 13:31:53 -0700
Received: by burninator (Postfix, from userid 1000)	id 7CC5F58723E; Wed, 22
	Jul 2015 16:31:27 -0400 (EDT)
Date: Wed, 22 Jul 2015 16:31:27 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150722203127.GM22729@mentor.com>
References: <1437591250-9247-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1437591250-9247-1-git-send-email-jslater@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2015 20:31:56 -0000
X-Groupsio-MsgNum: 56350
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkilVOb9qhI0mB+X"
Content-Disposition: inline

--YkilVOb9qhI0mB+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as br=
oken] On 15.07.22 (Wed 11:54) Joe Slater wrote:

> We will need the conditional dependency on systemd.  It is
> not a good idea to use PNBLACKLIST in a recipe, and the

It isn't a good idea to have a recipe that needs to be blacklisted.  :-)

That said, it's here and there's still an argument for supporting it, so
why remove PNBLACKLIST and replace it with something less obvious?

No objection to a conditional dependency on systemd.

-J.

> version here does not suppress lib32-ypbind-mt.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-=
networking/recipes-support/nis/ypbind-mt_2.2.bb
> index 4f8bf48..359b020 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> @@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Binds to \
>  the server which answered as first. \
>  "
>  HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> -DEPENDS =3D "yp-tools"
> +DEPENDS =3D "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', 'sy=
stemd', '', d)}"
>  PROVIDES +=3D "ypbind"
> =20
> -PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> +python () {
> +    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-tools")
> +}
> =20
>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>             file://ypbind-yocto.init \
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--YkilVOb9qhI0mB+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVr/2fAAoJEEn8ffcsOfaWHkUIAK75pI9fgzE3rVbBHq3ZkQTR
14BIPcQLN2EJGftCxQlc3MFSkNMm8t1jON2s/7hncY8cNDrl+4yIihq8f2Zvp9iz
ISRXa+RKMsr7X2j0OIfVcEmGeTfUnjHnNbIy31TOWHvTELYr1IBisCbthuIrwHx5
NBiTw7OrimVPlJv3km/oi/c7++A8Uan+DNY3ei42UcW8N7orwM4xvI8I5WbcRjTi
ifCH75qAhOR1ny9EYGI9C0FMpLts1Dgiwt9FHgD3YnwzQL+OeuBBAOcix8yEqYyd
XkN9CPiweH/yqPTf60rzuChvtzjrcHsOSxF+VYd+vnOij2awhvhp5utcrkU2z1c=
=d2mw
-----END PGP SIGNATURE-----

--YkilVOb9qhI0mB+X--
