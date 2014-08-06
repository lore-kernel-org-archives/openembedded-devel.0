Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 68C4665CD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:08:58 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF0xg-0002HB-7T from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 06:09:00 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 06:09:00 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.2.247.3; Wed, 6 Aug 2014
	06:08:59 -0700
Received: by burninator (Postfix, from userid 1000)	id C1F46580DB1; Wed,  6
	Aug 2014 09:08:58 -0400 (EDT)
Date: Wed, 6 Aug 2014 09:08:58 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140806130856.GA14621@mentor.com>
References: <1406316789-27514-1-git-send-email-akuster@mvista.com>
	<53E1DC2A.5040903@windriver.com> <20140806091035.GE14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140806091035.GE14848@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 06 Aug 2014 13:09:00.0119 (UTC)
	FILETIME=[967F6670:01CFB177]
Subject: Re: [meta-networking][PATCH] V4 wireshark: fix build depends
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
X-List-Received-Date: Wed, 06 Aug 2014 13:09:01 -0000
X-Groupsio-MsgNum: 51443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] V4 wireshark: fix build depends] On 14.0=
8.06 (Wed 11:10) Martin Jansa wrote:

> On Wed, Aug 06, 2014 at 03:41:30PM +0800, Rongqing Li wrote:
> >=20
> >=20
> > On 07/26/2014 03:33 AM, Armin Kuster wrote:
> > > This should address issues found in test-dependencies 2014-07-25
> > >
> > > wireshark/wireshark/latest lost dependency on  libcap libnl libnl-gen=
l libnl-nf libnl-route portaudio-v19 sbc
> > >
> > > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > ---
> > >   meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb |=
 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12=
=2E0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc=
2.bb
> > > index 5d6df40..b965fdf 100644
> > > --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.=
bb
> > > +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.=
bb
> > > @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.wireshark.org"
> > >   SECTION =3D "network"
> > >   LICENSE =3D "GPL-2.0"
> > >
> > > -DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> > > +DEPENDS =3D "perl-native libcap libpcap pcre expat glib-2.0 libsmi l=
ibnl portaudio-v19 sbc"
> > >
> > >   inherit autotools pkgconfig
> > >
> >=20
> > 1. I can not download wireshark-1.12.0-rc2.tar.bz2, seems it has been=
=20
> > removed
> >=20
> > wget=20
> > http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-r=
c2.tar.bz2
> > --2014-08-06 15:00:13--=20
> > http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-r=
c2.tar.bz2
> > Resolving wiresharkdownloads.riverbed.com=20
> > (wiresharkdownloads.riverbed.com)... 69.4.231.52
> > Connecting to wiresharkdownloads.riverbed.com=20
> > (wiresharkdownloads.riverbed.com)|69.4.231.52|:80... connected.
> > HTTP request sent, awaiting response... 404 Not Found
> > 2014-08-06 15:00:14 ERROR 404: Not Found.
>=20
> rc3 and final 1.12.0 were released already, someone willing to send a
> patch?

Sure, I'll send it out now.

-J.

>=20
> > 2. which layers do I found the libsmi/portaudio recipes?
> >=20
> >=20
> > --=20
> > Best Reagrds,
> > Roy | RongQing Li
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJT4ijoAAoJEEn8ffcsOfaW7oAIAK7d5Yf85RqP0NKR4Ucy2J/n
BnWO21/IeOcTo5Kg+6kZuz58UpApXRDQQNnB4LYZdH/Oyg/8rL/xn8pQz6jGGvpC
X306L13OfDjsYk1ZNKBIxLSwT7F4VfPdSNkiLZ58+iVpxEFWV3cppnBWoKM1Fs0d
MBtrts9CRI4sQOgVgSIc39LbV/yhIWu+HYFEO7Z3kNerPbZqg1YjasR1X+btVJY9
v/1jsYFeMrefKWYDHo/xqvNbDqSV5ezycjsoYTtbFBQibzTlL5HrnGm5WsieTu0f
wFMT7h3wGaysuhYyop+VMSeB9z4YKmkBaWnepYFV/gzxngv6OEm2XmwgZMARbXc=
=kktl
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
