Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 51D566AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:06:18 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1Xsyxm-0002tc-RT from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2014 11:06:18 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 24 Nov 2014 11:06:17 -0800
Received: by burninator (Postfix, from userid 1000)	id 993765810B1; Mon, 24
	Nov 2014 14:06:16 -0500 (EST)
Date: Mon, 24 Nov 2014 14:06:16 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141124190615.GB6210@mentor.com>
References: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
	<547304C9.1060509@topic.nl>
MIME-Version: 1.0
In-Reply-To: <547304C9.1060509@topic.nl>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layers
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
X-List-Received-Date: Mon, 24 Nov 2014 19:06:22 -0000
X-Groupsio-MsgNum: 53012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layer=
s] On 14.11.24 (Mon 11:13) Mike Looijmans wrote:

> On 11/24/2014 09:53 AM, Huang, Jie (Jackie) wrote:
> >Hi,
> >
> >I know LAYERVERSION is optional but I think LAYERDEPENDS is required and=
 at least we should specify the main oe-core,
> >but I found only meta-networking and meta-webser have this:
> >
> >$ grep -r LAYERDEPENDS *
> >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "core"
> >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "opene=
mbedded-layer"
> >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "meta-=
python"
> >meta-webserver/conf/layer.conf:LAYERDEPENDS_webserver =3D "core"
> >$ grep -r LAYERVERSION *
> >meta-networking/conf/layer.conf:LAYERVERSION_networking-layer =3D "1"
> >meta-webserver/conf/layer.conf:LAYERVERSION_webserver =3D "1"
> >
> >I found dependencies section in README for most of the meta-FOO layers, =
but no definition of LAYERDEPENDS in the layer.conf.
> >
> >Thanks,
> >Jackie
> >
>=20
> And reading this:
>=20
> LAYERDEPENDS_networking-layer =3D "core"
> LAYERDEPENDS_networking-layer =3D "openembedded-layer"
> LAYERDEPENDS_networking-layer =3D "meta-python"
>=20
> makes me wonder whether:
> - The author forgot to use "+=3D" instead of "=3D"; or
> - The syntax of LAYERDEPENDS is different from what the rest of the
> variables use (in that case, an RFC may be in order here); or
> - These lines are parsed by something else than bitbake's regular parser.

I wondered that too.

% bitbake -e | grep LAYERDEPENDS_networking
# $LAYERDEPENDS_networking-layer [3 operations]
LAYERDEPENDS_networking-layer=3D"meta-python"

That answers that, then.  Guess I'll go fix that up.  :-)

-J.

>=20
>=20
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
>=20
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>=20
--=20
-Joe MacDonald.
:wq

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUc4GnAAoJEEn8ffcsOfaWQQUH/3yvwtly3xY67X1ZSoVV1hIB
csTAyMn7XmIsxVrFijuaI8dXgTMmIVBOlljZHDmLWKqONFU4MxGVz9JQpmSnPDOW
Jat5q6DsyTzh0llMeJpDzVX0sEn9lPZAi1H2t+5wsl4ksJz+/7tls7yPQyM1GFpG
2qDmZ+TfdoSfvkTGtvdtel0UN3dgLYrskZxz+VpxrfKWJxf2eXUezBTeeXLo980o
0AGnGkiW1Dm3afXxESEk7l2CiM8y/PiiODv9adfGeoZv5SNOCZXj0WBY102a2kao
6evkQoKbgz5oLBZxGtbXymFd04Qp/EZqQ9QGF/uuOazbHWY5nCno6aO7DzjSsfM=
=5sCQ
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
