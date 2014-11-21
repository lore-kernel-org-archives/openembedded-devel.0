Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CA0537220D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:46:03 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XrpTI-0005io-Hn from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2014 06:46:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Fri, 21 Nov 2014 06:46:03 -0800
Received: by burninator (Postfix, from userid 1000)	id 491E458044A; Fri, 21
	Nov 2014 09:46:03 -0500 (EST)
Date: Fri, 21 Nov 2014 09:46:03 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141121144602.GC20204@mentor.com>
References: <20141119154912.GP3315@jama>
	<1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416556558-15428-2-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141121140616.GB20204@mentor.com> <20141121141904.GK2163@jama>
MIME-Version: 1.0
In-Reply-To: <20141121141904.GK2163@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 1/2] UMIP: add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 14:46:06 -0000
X-Groupsio-MsgNum: 52976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH v2 1/2] UMIP: add new recipe] On 14.11.21 (Fri 15:19) Mart=
in Jansa wrote:

> On Fri, Nov 21, 2014 at 09:06:18AM -0500, Joe MacDonald wrote:
> > [[oe] [PATCH v2 1/2] UMIP: add new recipe] On 14.11.21 (Fri 15:55) Qian=
 Lei wrote:
> >=20
> > > UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
> > > Support for Linux. It is released under the GPLv2 license. It supports
> > > the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
> > > and RFC4877 (IPsec and IKEv2).
> >=20
> > I think this recipe also probably belongs in meta-networking.  I'm
> > catching up on the merges today, so if there's no objection, I'll put it
> > there in the same place in the hierarchy.
>=20
> It's failing to build in my world builds, so please wait a bit more.

Yeah, I saw that.  It also wouldn't be able to get pushed for master
without the dependent package anyway, and I wouldn't be merging that.

> Also a lot of patches from last week were modified when I was
> cherry-picking them to master-next, please make sure you're using right
> version.

Of course, I always prefer to cherry pick from master-next rather than
merging from email.

-J.

>=20
> > > Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> > > ---
> > >  meta-oe/recipes-connectivity/umip/umip_1.0.bb | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb
> > >=20
> > > diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/=
recipes-connectivity/umip/umip_1.0.bb
> > > new file mode 100644
> > > index 0000000..76901ab
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY =3D "Mobile IPv6 and NEMO for Linux"
> > > +DESCRIPTION =3D "UMIP is an open source implementation of Mobile IPv=
6 and NEMO \
> > > +Basic Support for Linux. It is released under the GPLv2 license. It =
supports \
> > > +the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC37=
76 and \
> > > +RFC4877 (IPsec and IKEv2)."
> > > +HOMEPAGE =3D "http://umip.org/"
> > > +SECTION =3D "System Environment/Base"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D073dc31ccb2ebed70db54f1e8=
aeb4c33"
> > > +DEPENDS =3D "rpm indent-native"
> > > +
> > > +SRC_URI =3D "git://git.umip.org/umip.git"
> > > +SRCREV =3D "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +EXTRA_OE_CONF =3D "--enable-vt"
> > > +
> > > +inherit autotools-brokensep
> > > --=20
> > > 1.8.3.1
> > >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUb1AqAAoJEEn8ffcsOfaWcpYH/R5TbFzXK6b/j9GH8ap2paqJ
zcn1C79RTkfS9ScKSP5vuC+1Z9cx+iUDCCfRKs9x4f2aBn6Ci2e8yVvJB4J+XUTo
MkVffSCaAqNz8JLlGocLte5hWi5IO+Mx51g1wzqZ7TBZXQaGCwF5RHnU6aP3o0FM
/uB+piMjfbX4an5THgP0D7PkgqQq5gkvsjlX0Q0Ic2ed3kzKQQI6XiCAv849gIRp
Wb00oioU71UJPHdsM8j6L9gPO02Y5yVdWZemVp1K37a0fNKTMIE/ytgghsSLcOvo
yUoODFUVYutbP9Ti2j9icsv1ZFsPsOUeyfSF8WVkj9bOL/KnyU3OGg/eUyYpFJ8=
=PFqP
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
