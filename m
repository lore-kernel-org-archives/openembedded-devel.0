Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TzYyM-0001v7-QI
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 21:37:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0RKLO8E012587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 12:21:24 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Sun, 27 Jan 2013 12:21:24 -0800
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 18CE67FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 15:19:26 -0500 (EST)
Received: by skynet (Postfix, from userid 1000)	id B836A6005B9; Sun, 27 Jan
	2013 15:20:58 -0500 (EST)
Date: Sun, 27 Jan 2013 15:20:58 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130127202054.GA18024@windriver.com>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
	<1359182715-3063-2-git-send-email-raj.khem@gmail.com>
	<20130127191320.GL16904@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130127191320.GL16904@jama.palm1.palmone.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 2/2] ebtables, arptables: add perl as runtime dependency
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
X-List-Received-Date: Sun, 27 Jan 2013 20:37:03 -0000
X-Groupsio-MsgNum: 42867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 2/2] ebtables, arptables: add perl as run=
time dependency] On 13.01.27 (Sun 20:13) Martin Jansa wrote:

> On Fri, Jan 25, 2013 at 10:45:15PM -0800, Khem Raj wrote:
> > Fixes errors like
>=20
> RDEPENDS_${PN}, fixed in jansa/in-test, I'll merge with that fix if Joe
> sends his ack.

Yes, please.  Thanks!

-J.

>=20
> Cheers,
>=20
> >=20
> > | Computing transaction...error: Can't install
> > arptables-0.0.3+4-r0.0@ppce500v2: no package provides /usr/bin/perl
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    2 ++
> >  .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 ++
> >  2 files changed, 4 insertions(+)
> >=20
> > diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.=
bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> > index 2596d2f..4e9b0bc 100644
> > --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> > +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> > @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a9999938=
71a28ab1488fdbd2e73e"
> >  SECTION =3D "console/network"
> >  PR =3D "r1"
> > =20
> > +RDEPENDS +=3D "perl"
> > +
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
> >             file://installnonroot.patch \
> >             file://01debian_defaultconfig.patch \
> > diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-=
4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> > index 71e2600..8da9bb7 100644
> > --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> > +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> > @@ -3,6 +3,8 @@ PRIORITY =3D "optional"
> >  LICENSE =3D "GPL-2.0"
> >  SECTION =3D "console/network"
> > =20
> > +RDEPENDS +=3D "perl"
> > +
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GP=
L-2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> >  SRC_URI =3D " \
> >  	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=3Darptabl=
es \
> > --=20
> > 1.7.9.5
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlEFjCMACgkQPN8S4W6ZZncyxgCfcRSH/MS+6psEfAeheIJTZUe7
Ck4An2D7EtY9et13WM4tzBXsgRZz8Rit
=9Z/I
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
