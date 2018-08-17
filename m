Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F364379116
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 13:45:40 +0000 (UTC)
Received: from svr-orw-mbx-07.mgc.mentorg.com ([147.34.90.207])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fqf4Q-00070Z-4r from Joe_MacDonald@mentor.com ;
	Fri, 17 Aug 2018 06:45:42 -0700
Received: from svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) by
	SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 17 Aug 2018 06:45:39 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Fri, 17 Aug 2018 06:45:39 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 5844)
	id 1790D28A2431; Fri, 17 Aug 2018 09:45:37 -0400 (EDT)
Date: Fri, 17 Aug 2018 09:45:35 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180817134535.GB12454@mentor.com>
References: <20180816152927.4833-1-joe_macdonald@mentor.com>
	<20155edf-dc19-5d00-7a6f-dbadb24b66f8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20155edf-dc19-5d00-7a6f-dbadb24b66f8@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org, stefan.bosak@gmail.com
Subject: Re: [meta-networking][PATCH v2] bird: initial import
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 13:45:41 -0000
X-Groupsio-MsgNum: 74021
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] bird: initial import] On 18.08.16 (Th=
u 17:02) Khem Raj wrote:

>=20
>=20
> On 8/16/18 8:29 AM, Joe MacDonald wrote:
> > Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >=20
> > v2:
> >    - adding upstream-status and link to upstream commit accomplishing t=
he same
> >      goal.
> >=20
> >  .../recipes-protocols/bird/bird.inc           |   32 +
> >  .../recipes-protocols/bird/bird_1.6.4.bb      |    9 +
> >  .../recipes-protocols/bird/bird_2.0.2.bb      |    9 +
> >  ...-extend-config.sub-to-recognize-musl.patch | 4430 +++++++++++++++++
> >  .../recipes-protocols/bird/files/bird.init    |    2 +
> >  5 files changed, 4482 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird.inc
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird_2.0.2.bb
> >  create mode 100644 meta-networking/recipes-protocols/bird/files/0001-m=
usl-extend-config.sub-to-recognize-musl.patch
> >  create mode 100755 meta-networking/recipes-protocols/bird/files/bird.i=
nit
> >=20
> > diff --git a/meta-networking/recipes-protocols/bird/bird.inc b/meta-net=
working/recipes-protocols/bird/bird.inc
> > new file mode 100644
> > index 000000000..33d17dcb7
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/bird.inc
> > @@ -0,0 +1,32 @@
> > +SUMMARY =3D "BIRD Internet Routing Daemon"
> > +DESCRIPTION =3D "\
> > +BIRD is dynamic routing daemon supporting IPv4 and IPv6 versions of ro=
uting \
> > +protocols BGP, RIP and OSPF."
> > +HOMEPAGE =3D "http://bird.network.cz"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D87;endline=3D103;md5=
=3D0efecc23f039022580d0bac9a52f6117"
> > +DEPENDS =3D "flex bison ncurses readline"
> > +
>=20
> does it need flex and bison on target ? or just native versions

Confirmed in my rework tree now that we only need the native versions.

> > +inherit autotools
> > +
> > +EXTRA_OECONF  +=3D "\
> > +--enable-pthreads \
> > +"
> > +
> > +do_configure() {
> > +    oe_runconf ${EXTRA_OECONF}
> > +}
> > +
> > +do_install_append() {
> > +    install -m 0755 -d ${D}${sysconfdir}/init.d
> > +    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird
>=20
> may be use a single line
>=20
> install -D -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird

I actually prefer this split over two steps since it makes things
cleaner when we inevitably need to change what gets included in our
do_install*().  In my reworked version I've removed the mode set on the
first line, though, to better align with the other examples elsewhere in
the meta-openembedded tree.

> > +    rm -rf ${D}/run ${D}/var/run=20
> > +}
> > +
> > +PACKAGES +=3D " bird-client"
> > +
> > +FILES_${PN} +=3D "/run /var/run"
>=20
> I think we don't need this

Yeah, we don't need this.

> > +FILES_${PN}-client =3D "/usr/sbin/birdc*"
> > +
>=20
> may be use ${sbindir} here

I've fixed this too.

> > +RUNIT_SERVICES =3D "bird"
> > diff --git a/meta-networking/recipes-protocols/bird/bird_1.6.4.bb b/met=
a-networking/recipes-protocols/bird/bird_1.6.4.bb
> > new file mode 100644
> > index 000000000..27c62aeee
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> > @@ -0,0 +1,9 @@
> > +require bird.inc
> > +
> > +SRC_URI =3D "\
> > +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> > +    file://bird.init \
> > +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> > +    "
> > +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7b2faa4"
> > +SRC_URI[sha256sum] =3D "c26b8caae988dba81a9dbbee93502463d4326d1b749d72=
8d62aa5529c605afc0"
> > diff --git a/meta-networking/recipes-protocols/bird/bird_2.0.2.bb b/met=
a-networking/recipes-protocols/bird/bird_2.0.2.bb
> > new file mode 100644
> > index 000000000..92d858869
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/bird_2.0.2.bb
> > @@ -0,0 +1,9 @@
> > +require bird.inc
> > +
> > +SRC_URI =3D "\
> > +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> > +    file://bird.init \
> > +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> > +    "
> > +SRC_URI[md5sum] =3D "de17645b045fa13912409aea59420132"
> > +SRC_URI[sha256sum] =3D "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf20=
1322c307732883480f"
>=20
> do we need to maintain both 1.6 and 2.x versions ?
> I guess they must be incompatible with each other and 1.6 still
> deployed. but I would prefer to just maintain latest version

That's a much bigger question, ongoing in the v1 thread.

-J.


--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlt20X8ACgkQSfx99yw5
9pZBxgf6A+XWpICSDyX54RspeNnuacjli2NxW80X9tPBGFdjFzDdbGkBMhChA0T9
dR4bp+RMDsQCbE+xHXiUnLfoKpx3tBo7dlxEEE1O6eyQ0j0Z4QW9ODq16aX6fTN3
y9wDgZBdV9PcnInBBxAgktb7NWSES1nhVOJ8d5YcU5n9loOqgkA3rB8cMYr5YFdv
OAuMh13m8Lh4Ak4+A/TxvBrqPwAIkPo/GyLRtx8weJN0gFU1WsQ4uRreaSqvxcJF
acwZ9AZibgOMA+FDAHbNoncgeKXvujVB/7SPTSeaxxxbgbwlLg7FMGan15p0ZJPl
5kAo9cFWuzyl8Q1fPSlyVSyHZ1djAQ==
=NObY
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
