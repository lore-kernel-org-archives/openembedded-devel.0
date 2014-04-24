Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9776165DA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 00:00:33 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1271753eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LdTjsbyxmlVn/2Y0p2CkRC0oynvyAPWYnAP46CPyjG0=;
	b=iKBnFZBBp4P7wBnDGPmPWru6GgJpyP7TRybb5r+MbqU0sA5xkNjESV/NTIa2eKuWml
	mJcAmYUfJFChYu5h+fLKzWgyqbPXVyql8KKkkSjCovwPiFU1swhqn/bmY82q1Ln/Jq9w
	uPWaywAzB79mS/VMOUO2IzrB4B6CiaQEwbHtGKbk+udep3ADZaX4DhnpAWLomedKSBei
	QwRr28BeMq3kL3suBJD+gGhTnZoBScsOuKXcfin2nXnJhOIyocTQd0KPsIPwwhfKX1nM
	dLE2JQD9830d0U2oO7v7YeHRYu8wfplIZOSkWMNYM4DXqS2Ubun48XuVsPdyqKMTW3xL
	Hm4Q==
X-Received: by 10.14.115.1 with SMTP id d1mr66147585eeh.30.1398297634264;
	Wed, 23 Apr 2014 17:00:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm10561010eem.34.2014.04.23.17.00.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 17:00:33 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Apr 2014 02:00:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Message-ID: <20140424000042.GM2486@jama>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
	<20140423144521.GI2486@jama>
	<007601cf5f4e$fe3b4a20$fab1de60$@lge.com>
MIME-Version: 1.0
In-Reply-To: <007601cf5f4e$fe3b4a20$fab1de60$@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] fim: Add mirror site
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
X-List-Received-Date: Thu, 24 Apr 2014 00:00:35 -0000
X-Groupsio-MsgNum: 49460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bRSz5O7DOzi+nSIn"
Content-Disposition: inline

--bRSz5O7DOzi+nSIn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2014 at 08:51:49AM +0900, Changhyeok Bae wrote:
> Hi,
>=20
> I agree with your opinion.
> However there is no mirror classes in meta-oe.
> Is it fine to add the mirror site to oe-core/meta/classes/mirrors.bbclass?

Yes, sorry I wasn't clear, that's where I think the variables should be
introduced (bitbake.conf) and mirrors added (mirrors.bbclass), then you
would need 1 patch for oe-core and 1 for meta-oe to use these new
variables consistently from SRC_URI.

e.g. http://savannah.nongnu.org/download/dmidecode
seems to be he same as
http://download.savannah.nongnu.org/releases/dmidecode

and releases-noredirect is probably just work around for issues like
this non-working .jp mirror and you should be able to unify them all to
use just 2 variables (gnu and nongnu URL).

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, April 23, 2014 11:45 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/3] fim: Add mirror site
>=20
> On Wed, Apr 23, 2014 at 08:18:46PM +0900, Changhyeok Bae wrote:
> > * The SRC_URI is not accessible.
> >   So need to add mirror site referred by the original site.
> > * The problem is that
> >   http://download.savannah.nongnu.org/releases redirects to closest mir=
ror
> >   and few mirrors (e.g. .jp) weren't working correctly while
> >   http://download-mirror.savannah.gnu.org/releases/ seems to be reliabl=
e.
> >=20
>=20
> at this point I think we should add variable for http://savannah.nongnu.o=
rg
> and add this MIRROR setting globally:
> meta/recipes-devtools/dmidecode/dmidecode_2.12.bb:SRC_URI =3D
> "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI =3D
> "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
> meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb:SRC_URI=
 =3D
> "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:SRC_URI =3D
> "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.t=
ar.
> gz \ meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb:SRC_URI =3D
> "http://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.=
tar
> .bz2 \ meta-oe/recipes-support/libunwind/libunwind.inc:SRC_URI =3D
> "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
>=20
> we have also couple of recipes referencing gnu.org version:
> meta-networking/recipes-protocols/quagga/quagga.inc:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-$=
{PV
> }.tar.gz;name=3Dquagga-${PV} \
> meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
> meta-oe/recipes-support/lzip/lzip_1.14.bb:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
> meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb:SRC_URI =3D
> "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-$=
{PV
> }.tar.bz2 \ meta/recipes-devtools/quilt/quilt-0.61.inc:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
> meta/recipes-extended/ed/ed_0.5.bb:SRC_URI =3D
> "http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
> meta/recipes-extended/texi2html/texi2html_5.0.bb:SRC_URI     =3D
> "http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2=
 \
> meta/recipes-support/attr/acl.inc:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
> meta/recipes-support/attr/attr.inc:SRC_URI =3D
> "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
>=20
> > Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> > ---
> >  meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb |    2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb=20
> > b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> > index 6e5000b..c6537ac 100644
> > --- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> > +++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> > @@ -16,6 +16,8 @@ SRC_URI =3D=20
> > "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV
> >  SRC_URI[md5sum] =3D "d7362dde5541c2b6439c35c6e2bd5046"
> >  SRC_URI[sha256sum] =3D
> "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
> > =20
> > +MIRRORS +=3D "http://download.savannah.nongnu.org/releases/
> http://download-mirror.savannah.gnu.org/releases/ \n"
> > +
> >  PARALLEL_MAKE =3D ""
> > =20
> >  inherit autotools
> > --
> > 1.7.9.5
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bRSz5O7DOzi+nSIn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNYVCkACgkQN1Ujt2V2gBwbVwCfZWlxJwLzhmqYG3ZNG5lzUqlR
d3gAn1Rdom7rfbYEb07jLCXkz9ddaWIl
=S8G/
-----END PGP SIGNATURE-----

--bRSz5O7DOzi+nSIn--
