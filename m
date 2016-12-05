Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 54A626007A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 18:52:35 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1cDyNQ-0000K3-K7 from Joe_MacDonald@mentor.com ;
	Mon, 05 Dec 2016 10:52:36 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Dec 2016 10:52:36 -0800
Received: by burninator (Postfix, from userid 1000)	id 3FEF85810A5; Mon,  5
	Dec 2016 13:52:35 -0500 (EST)
Date: Mon, 5 Dec 2016 13:52:35 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20161205185234.GF18327@mentor.com>
References: <1479913709-20703-1-git-send-email-joe_macdonald@mentor.com>
	<20161129200045.GE2700@jama>
MIME-Version: 1.0
In-Reply-To: <20161129200045.GE2700@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] iscsi-initiator-utils: Update to 2.0.874
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
X-List-Received-Date: Mon, 05 Dec 2016 18:52:36 -0000
X-Groupsio-MsgNum: 64236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Content-Disposition: inline

--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] iscsi-initiator-utils: Update to 2.0.874=
] On 16.11.29 (Tue 21:00) Martin Jansa wrote:

> On Wed, Nov 23, 2016 at 10:08:29AM -0500, Joe MacDonald wrote:
> > The latest iscsi-initiator-utils has been available for a while now,
> > update our recipe.  The new version no longer bundles its own ISNS serv=
er,
> > so this update brings in open-isns as a dependency.
> >=20
> > Additionally, open-iscsi.org is defunct, the new home is at
> > open-iscsi.com, update the SRC_URI and homepage accordingly.
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
[...]
> > diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.b=
b b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
> > new file mode 100644
> > index 0000000..fe41093
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
> > @@ -0,0 +1,33 @@
> > +# Copyright (C) 2016 Joe MacDonald <joe_macdonald@mentor.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY =3D "iSNS daemon and utility programs"
> > +DESCRIPTION =3D "This is a partial implementation of RFC4171, the Inte=
rnet \
> > +Storage Name Service (iSNS).  The distribution includes the iSNS serve=
r, \
> > +supporting persisten storage of registrations, isnsadm, a command line=
 \
> > +utility for managing nodes, and isnsdd, a corresponding discovery daem=
on."
> > +HOMEPAGE =3D "http://github.com/gonzoleeman/open-isns/"
> > +LICENSE =3D "GPLv2+ & LGPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D321bf41f280cf805086dd5a720b=
37785"
> > +SECTION =3D "net"
> > +
> > +DEPENDS =3D "openssl systemd"
> > +
> > +SRC_URI =3D " \
> > +           git://github.com/open-iscsi/open-isns \
> > +"
> > +
> > +SRCREV ?=3D "09954404e948e41eb0fce8e28836018b4ce3d20d"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit systemd autotools-brokensep
> > +
> > +EXTRA_OECONF =3D " --prefix=3D${prefix} --enable-shared"
> > +
> > +do_install_append () {
> > +    oe_runmake -C ${B} INCDIR=3D${STAGING_INCDIR}/libisns/ install_hdrs
> > +    oe_runmake -C ${B} LIBDIR=3D${D}${libdir} install_lib
>=20
> This seems to bypass sstate and install it directly to sysroot, why did y=
ou use STAGING_INCDIR?

I'm not sure, some brain-fart from before I added the brokensep
dependency, I think.  I've pointed it at the appropriate place (and
dropped the unnecessary chdir) in v2, coming out now.

-J.

> ERROR: Following files are installed in sysroot, but not tracked by
> sstate:
> qemuarm/usr/include/guid.h
> qemuarm/usr/include/libisns
> qemuarm/usr/include/libisns/attrs.h
> qemuarm/usr/include/libisns/buffer.h
> qemuarm/usr/include/libisns/isns.h
> qemuarm/usr/include/libisns/isns-proto.h
> qemuarm/usr/include/libisns/message.h
> qemuarm/usr/include/libisns/paths.h
> qemuarm/usr/include/libisns/source.h
> qemuarm/usr/include/libisns/types.h
> qemuarm/usr/include/libisns/util.h
> qemuarm/usr/lib/libcrossguid.a
> INFO: Output written in:
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroot.cruft.1480448660
>=20
>=20
> > +}
> > +
> > +FILES_${PN} +=3D "${libdir}"
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYRbdyAAoJEEn8ffcsOfaWIOQIAImeYHpKvnyd0omE5lpvmJ+U
03ypEktbhxo5QPNWvYzdH/41KmfFQygeiJmNxiiwTpN0BF02MRwn1qgiIOxFUxPI
8kl65E0LZWJU2lIFZ++Uqr+Ee4dnleg02STLi03mGQF1KwGF0WcJSqaNnoodyMzN
yWpb71VUARbjSAygvmsSnYVIHgEo2GqhHeB8ScTTdLn4D+mjD1aTu7uP6vi41hey
UqC4C6L9X21cE3l79bWFKJqUrErbY6zpiuRXGyiI4J9jqLjpkyMRNIpQahNxxTC7
78kdjZ1028bkoRS+AOBorgzszinTdqEadaHVzwwAiAhpjQDHS41+aX8BjMOFiHY=
=eJUh
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--
