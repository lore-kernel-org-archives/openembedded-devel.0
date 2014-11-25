Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B7EF370A61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 15:34:28 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XtI8J-0007Fx-Uo from Joe_MacDonald@mentor.com ;
	Tue, 25 Nov 2014 07:34:27 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 25 Nov 2014 07:34:27 -0800
Received: by burninator (Postfix, from userid 1000)	id F23C55811BA; Tue, 25
	Nov 2014 10:34:26 -0500 (EST)
Date: Tue, 25 Nov 2014 10:34:26 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20141125153425.GC5079@mentor.com>
References: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
	<547304C9.1060509@topic.nl> <20141124190615.GB6210@mentor.com>
	<1B858668EC6A94408DCA5225FDFA85AABD59E3A6@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD59E3A6@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 25 Nov 2014 15:34:32 -0000
X-Groupsio-MsgNum: 53030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layer=
s] On 14.11.25 (Tue 09:05) Huang, Jie (Jackie) wrote:

>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> > Sent: Tuesday, November 25, 2014 3:06 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most me=
ta-FOO layers
> >=20
> > [Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO l=
ayers] On 14.11.24 (Mon
> > 11:13) Mike Looijmans wrote:
> >=20
> > > On 11/24/2014 09:53 AM, Huang, Jie (Jackie) wrote:
> > > >Hi,
> > > >
> > > >I know LAYERVERSION is optional but I think LAYERDEPENDS is required
> > > >and at least we should specify the main oe-core, but I found only me=
ta-networking and meta-
> > webser have this:
> > > >
> > > >$ grep -r LAYERDEPENDS *
> > > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "c=
ore"
> > > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "o=
penembedded-layer"
> > > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "m=
eta-python"
> > > >meta-webserver/conf/layer.conf:LAYERDEPENDS_webserver =3D "core"
> > > >$ grep -r LAYERVERSION *
> > > >meta-networking/conf/layer.conf:LAYERVERSION_networking-layer =3D "1"
> > > >meta-webserver/conf/layer.conf:LAYERVERSION_webserver =3D "1"
> > > >
> > > >I found dependencies section in README for most of the meta-FOO laye=
rs, but no definition of
> > LAYERDEPENDS in the layer.conf.
> > > >
> > > >Thanks,
> > > >Jackie
> > > >
> > >
> > > And reading this:
> > >
> > > LAYERDEPENDS_networking-layer =3D "core"
> > > LAYERDEPENDS_networking-layer =3D "openembedded-layer"
> > > LAYERDEPENDS_networking-layer =3D "meta-python"
> > >
> > > makes me wonder whether:
> > > - The author forgot to use "+=3D" instead of "=3D"; or
> > > - The syntax of LAYERDEPENDS is different from what the rest of the
> > > variables use (in that case, an RFC may be in order here); or
> > > - These lines are parsed by something else than bitbake's regular par=
ser.
> >=20
> > I wondered that too.
> >=20
> > % bitbake -e | grep LAYERDEPENDS_networking # $LAYERDEPENDS_networking-=
layer [3 operations]
> > LAYERDEPENDS_networking-layer=3D"meta-python"
> >=20
> > That answers that, then.  Guess I'll go fix that up.  :-)
>=20
> Thanks, Joe.
>=20
> But for other layers, I think we should add for them, right?=20

Hey Jackie,

Feel free to submit patches.  The layers where I'm a maintainer already
have 'em and I can't speak for anyone else.  :-)

-J.

>=20
> Thanks,
> Jackie
>=20
> >=20
> > -J.
> >=20
> > >
> > >
> > >
> > >
> > > Met vriendelijke groet / kind regards,
> > >
> > > Mike Looijmans
> > > System Expert
> > >
> > >
> > > TOPIC Embedded Systems
> > > Eindhovenseweg 32-C, NL-5683 KH Best
> > > Postbus 440, NL-5680 AK Best
> > > Telefoon: (+31) (0) 499 33 69 79
> > > Telefax:  (+31) (0) 499 33 69 70
> > > E-mail: mike.looijmans@topic.nl
> > > Website: www.topic.nl
> > >
> > > Please consider the environment before printing this e-mail
> > >
> > > Topic zoekt gedreven (embedded) software specialisten!
> > > http://topic.nl/vacatures/topic-zoekt-software-engineers/
> > >
> > --
> > -Joe MacDonald.
> > :wq
--=20
-Joe MacDonald.
:wq

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUdKGBAAoJEEn8ffcsOfaWVNwH/0k5MeT3VdlZszESxDhthUQU
88yFI3xQu1qNzZln/AcetEtIbC7eYuJ5gkXaQGjPGU0NXb0yj76IoRcwVomvyKK6
asr34EceQonNnyIB+MN4qzXaZnHC8gD8SbtoUxSRTjIg9nKztUNcyf30uqU67YQA
Pjb6EDnur8rHqGPp+tcq3OpL/hwGhNr9Xhg5cu4BxD/d8BZey1UQYSNfJXp8BuBe
VNXciin2Y8s20xqep00ILvOmmubjkHsFNEIz6gJBDjbJ5/y60eFsrevwyV51uK4B
G5gVxbST93nDnvsZlYrLwbwSAT6Cx05n/MCATtw+/JAOJnDvygm2OSvb+mC3dgA=
=MPGZ
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
