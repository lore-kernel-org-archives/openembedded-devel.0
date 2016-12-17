Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 68A1777409
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:49:39 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1cIHEz-00048e-PT from Joe_MacDonald@mentor.com ;
	Sat, 17 Dec 2016 07:49:41 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 17 Dec 2016 07:49:41 -0800
Received: by burninator (Postfix, from userid 1000)	id 8F1475802AC; Sat, 17
	Dec 2016 10:49:40 -0500 (EST)
Date: Sat, 17 Dec 2016 10:49:40 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20161217154940.GD16746@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481940923-12914-5-git-send-email-joe_macdonald@mentor.com>
	<34560173-174e-2709-99a9-17c695f65731@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <34560173-174e-2709-99a9-17c695f65731@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 04/11] samba: add smbclient package
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
X-List-Received-Date: Sat, 17 Dec 2016 15:49:41 -0000
X-Groupsio-MsgNum: 64380
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline

--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH 04/11] samba: add smbclient package] On 16.12.=
17 (Sat 14:33) Andreas Oberritter wrote:

> On 17.12.2016 03:15, Joe MacDonald wrote:
> > From: Andreas Oberritter <obi@opendreambox.org>
> >=20
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >  .../recipes-connectivity/samba/samba_4.4.5.bb         | 19 +++++++++++=
++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > index c9e0953..37dabb6 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > @@ -143,10 +143,10 @@ do_install_append() {
> >      rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
> >  }
> > =20
> > -PACKAGES =3D+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-loca=
tor"
> > -PACKAGES =3D+ "libwbclient libnss-winbind winbind libnetapi libsmbshar=
emodes \
> > -             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests"
> > -
> > +PACKAGES =3D+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-loca=
tor \
> > +             libwbclient libnss-winbind winbind libnetapi libsmbsharem=
odes \
> > +             libsmbclient lib${PN}-base ${PN}-base ${PN}-ctdb-tests \
>                                   ^
> This partially reverts commit 8f92aa970a34fa5af019c164d9e650de8fe511d3.

Correct, I missed that.  Thanks.

-J.

>=20
> Regards,
> Andreas
>=20
> > +             smbclient"
> > =20
> >  RDEPENDS_${PN} +=3D "${PN}-base"
> > =20
> > @@ -301,5 +301,16 @@ FILES_${PN}-python =3D "${libdir}/python${PYTHON_B=
ASEVERSION}/site-packages/*.so \
> >                        ${libdir}/python${PYTHON_BASEVERSION}/site-packa=
ges/samba/web_server/* \
> >  "
> > =20
> > +FILES_smbclient =3D "${bindir}/cifsdd \
> > +                   ${bindir}/rpcclient \
> > +                   ${bindir}/smbcacls \
> > +                   ${bindir}/smbclient \
> > +                   ${bindir}/smbcquotas \
> > +                   ${bindir}/smbget \
> > +                   ${bindir}/smbspool \
> > +                   ${bindir}/smbtar \
> > +                   ${bindir}/smbtree \
> > +                   ${libdir}/samba/smbspool_krb5_wrapper"
> > +
> >  RDEPENDS_${PN}-pidl_append =3D " perl"
> >  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> >=20
>=20

--=20
-Joe MacDonald.
:wq

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYVV6UAAoJEEn8ffcsOfaWY2QH+wVQr3lK9L0+DjiIegZNIMd3
SK4APv0sd9A6DN5ci9Zxu+oHrNUQOeG1kjPlKylHavDeEzuNZZKpnIGqBuZvESt2
WHhGOnwQzWGwe+9IZVqsYkC+qTOgs1xTpkoMZssTh5WiN0BoIJPk4KI8PmLpFU5O
TVW/VUpKyipuonvM53FpOaQKGx1BJbnYSf0DJSmDP69GA2keZDLQ203aEy8n/OD1
HlE0/GI3LelawOJZjHXtLM73SnyWVyRjvprUFhtvG4Kg+8YkiAhx5Cn0bj+ZqBXE
dnKfNkvaJ1sQVufRHo4MrD56mETnK8kRLcSWvN+tk2527+hD42WGi+14p5nR7fs=
=mvgQ
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
