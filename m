Return-Path: <Joe_MacDonald@mentor.com>
X-Greylist: delayed 1558 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Aug 2018 15:34:22 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 103A67925A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 15:34:22 +0000 (UTC)
Received: from svr-orw-mbx-09.mgc.mentorg.com ([147.34.90.209])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fqJsv-0000rQ-Og from Joe_MacDonald@mentor.com ;
	Thu, 16 Aug 2018 08:08:25 -0700
Received: from svr-orw-mbx-04.mgc.mentorg.com (2002:9322:5acc::9322:5acc) by
	SVR-ORW-MBX-09.mgc.mentorg.com (2002:9322:5ad1::9322:5ad1) with
	Microsoft
	SMTP Server (TLS) id 15.0.1320.4; Thu, 16 Aug 2018 08:08:23 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Thu, 16 Aug 2018 08:08:22 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 5844)
	id B7A9128A2431; Thu, 16 Aug 2018 11:08:21 -0400 (EDT)
Date: Thu, 16 Aug 2018 11:08:21 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180816150820.GA9441@mentor.com>
References: <20180816024200.6394-1-joe_macdonald@mentor.com>
	<012861bd-9aa7-c612-66b4-e6617637d742@gmail.com>
MIME-Version: 1.0
In-Reply-To: <012861bd-9aa7-c612-66b4-e6617637d742@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org, stefan.bosak@gmail.com
Subject: Re: [meta-networking][PATCH] bird: initial import
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
X-List-Received-Date: Thu, 16 Aug 2018 15:34:23 -0000
X-Groupsio-MsgNum: 73975
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] bird: initial import] On 18.08.15 (Wed 2=
0:29) akuster808 wrote:

>=20
>=20
> On 08/15/2018 07:42 PM, Joe MacDonald wrote:
> > Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.
> >
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >
> > This set of recipes came my way quite a while back from Stefan Bosak.  =
I've
> > updated the recipes a bit, made them compile with MUSL and verified bas=
ic
> > functionality on x86_64 and qemuarm.
> >
> >  .../recipes-protocols/bird/bird.inc           |   32 +
> >  .../recipes-protocols/bird/bird_1.6.4.bb      |    9 +
> >  .../recipes-protocols/bird/bird_2.0.2.bb      |    9 +
> >  ...-extend-config.sub-to-recognize-musl.patch | 4428 +++++++++++++++++
> >  .../recipes-protocols/bird/files/bird.init    |    2 +
> >  5 files changed, 4480 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird.inc
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird_2.0.2.bb
> >  create mode 100644 meta-networking/recipes-protocols/bird/files/0001-m=
usl-extend-config.sub-to-recognize-musl.patch
> >  create mode 100755 meta-networking/recipes-protocols/bird/files/bird.i=
nit
> >
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
> > +    rm -rf ${D}/run ${D}/var/run=20
> > +}
> > +
> > +PACKAGES +=3D " bird-client"
> > +
> > +FILES_${PN} +=3D "/run /var/run"
> > +FILES_${PN}-client =3D "/usr/sbin/birdc*"
> > +
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
> > diff --git a/meta-networking/recipes-protocols/bird/files/0001-musl-ext=
end-config.sub-to-recognize-musl.patch b/meta-networking/recipes-protocols/=
bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
> > new file mode 100644
> > index 000000000..4feb7f786
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-con=
fig.sub-to-recognize-musl.patch
> > @@ -0,0 +1,4428 @@
> > +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17 00:00:00 2001
> > +From: Joe MacDonald <joe_macdonald@mentor.com>
> > +Date: Thu, 16 Aug 2018 01:56:05 +0000
> > +Subject: [PATCH] musl: update config.guess and config.sub
> > +
> > +Just bringing config.guess and config.sub up to date is enough to enab=
le
> > +musl to build BIRD.
> Think "Upstream-Status:" is missing

Oop, you're right.  I should've caught that since I intend to send this
upstream, too.

-J.

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlt1k2QACgkQSfx99yw5
9pbuYwf/VNr5oUuUf0QqVxe9FP82RafiAZOCcOVc9TRKSpKmm4tBx14K8dYFFiht
fmAo1LkEVA3unxoENMyaUKLhcBEnifDj8KYuVowjUNvb2hdaDqhbo3Fd855kdI3U
zUfbM3ZbBbrJUgPPX9SnUMtbUjvOiXHuVtTceYVv0lYAxp9IOyN3etl7az875j+L
cAi4IvS9CEjp13BwwD3XskMENyNIxERyG/KhjLNdjtjMEh++uT39B7mnw458bhb7
QKQuJkRMCLQbliWR4FW9Cn4qYQw8f2BfmzWA3XryP9gpdC+PL6ljOSQPlHkhHYLi
PjBBf0oEsw+4UqEq7qMiaSRROwrLPA==
=Fl2v
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
