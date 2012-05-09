Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSDi8-0008Oy-ET
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 22:42:12 +0200
Received: by werb13 with SMTP id b13so554829wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+wIWzk0XyD3tNGBbjq9SLMC+OUdT5RhRUU3FK+MMvHA=;
	b=zHkGACzn/3wzAJs6xKVS3G4x07PgvaWm9yVAEU/hS+AsSVHeDEOtfnawpu+mCUL9/M
	mcNugVP/RUWSdKcKGj8x18Mpm3aUi7hluYTKav+Z3w3m+ukipWgRZ9MwMM3aEtUp7Rsw
	hwk+kHWN26kQGMMje+maH0vbchY2r9R5+K6Mga+qGtTAH0+AQB7ivw7+YA/YlVuzNNCn
	SyibuWpdBWn2d49oPQ6TClJFFl2Qa28ZGh22VXOtBs7zZuCHFEasfmxjJPukYnYE5CXa
	LSgxKoIpJjI6f3msrlrbAebr+ne6YUlVoeQp4Xx98wbKamsuOtjw+xj3qyacI+FUoaim
	Jkpw==
Received: by 10.180.104.65 with SMTP id gc1mr3358652wib.13.1336595539014;
	Wed, 09 May 2012 13:32:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm13174909wib.0.2012.05.09.13.32.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 13:32:17 -0700 (PDT)
Date: Wed, 9 May 2012 22:32:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120509203219.GH12898@jama.jama.net>
References: <1336594013-19408-1-git-send-email-Martin.Jansa@gmail.com>
	<1336594013-19408-2-git-send-email-Martin.Jansa@gmail.com>
	<20120509200910.GG12898@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120509200910.GG12898@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/2] ttf-fonts: call update-fonts only on target, not during do_rootfs
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
X-List-Received-Date: Wed, 09 May 2012 20:42:12 -0000
X-Groupsio-MsgNum: 38643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Content-Disposition: inline

--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2012 at 10:09:10PM +0200, Martin Jansa wrote:
> On Wed, May 09, 2012 at 10:06:53PM +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
>=20
> ignore this one.. only on ML I've noticed that
> pkg_postrm_append() {
> should be even improved to
> pkg_postrm_${PN}_append() {

Grr, otherway around.. v1 was better because recipes including ttf.inc
does e.g.
ttf-ubuntu-font-family_0.69.bb:
PACKAGES =3D "${PN}-dbg ttf-ubuntu-mono ttf-ubuntu-sans ttf-ubuntu-serif"

so we need this postins/postrm in all subpackages (except ${PN}-dbg
where I have noticed it first).

So better to apply it for all then for none (ttf-ubuntu-font-family
=3D=3D ${PN} doesn't exist)

I'll update patchwork status to keep only right one.

Sorry for noise..

Cheers,

>=20
>=20
> Cheers,
>=20
> >  .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    2 +-
> >  .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    2 +-
> >  .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    1 +
> >  .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    2 +-
> >  .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    2 +-
> >  .../ttf-fonts/ttf-liberation_0.2.bb                |    2 +-
> >  .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
> >  .../ttf-fonts/ttf-sazanami_20040629.bb             |    2 +-
> >  .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |    2 +-
> >  .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    2 +-
> >  meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    8 ++++++--
> >  11 files changed, 16 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_200802=
16.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > index 10fb922..97b67b2 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "Arphic Public License"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D62be011094b7865ddc4d1a648444=
d31a"
> >  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> >  RPROVIDES_${PN} =3D "virtual-chinese-font"
> > -PR =3D "r3"
> > +PR =3D "r4"
> > =20
> >  SRC_URI =3D \
> >  "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arp=
hic-uming_0.2.${PV}.1.orig.tar.gz"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/me=
ta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > index d4ddf16..d7b3977 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > @@ -12,7 +12,7 @@ RDEPENDS_${PN}-sans-condensed =3D "${PN}-common"
> >  RDEPENDS_${PN}-serif =3D "${PN}-common"
> >  RDEPENDS_${PN}-serif-condensed =3D "${PN}-common"
> >  RDEPENDS_${PN}-common =3D ""
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.b=
z2 \
> >             file://30-dejavu-aliases.conf"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > index e0a6c65..2c3bf2e 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > @@ -6,6 +6,7 @@ LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D83544262a86f1f1ec761e758=
97df92bc"
> >  SRCREV =3D "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
> >  PV =3D "0.1+gitr${SRCPV}"
> > +PR =3D "r1"
> > =20
> >  SRC_URI =3D "git://github.com/android/platform_frameworks_base.git;pro=
tocol=3Dgit;branch=3Dmaster"
> > =20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/m=
eta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > index b00bd75..ee27c12 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "Gentium fonts - TTF Version"
> >  HOMEPAGE =3D "http://scripts.sil.org/gentium"
> >  LICENSE =3D "SIL Open Font License"
> >  LICENSE_URL =3D "http://scripts.sil.org/cms/scripts/page.php?site_id=
=3Dnrsi&item_id=3DOFL"
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> >  SRC_URI =3D "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.ori=
g.tar.gz \
> >             file://OFL.gz"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb=
 b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > index f841f1a..a2ef0cf 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > @@ -3,7 +3,7 @@ require ttf.inc
> >  DESCRIPTION =3D "Hunky fonts - TTF Version"
> >  HOMEPAGE =3D "http://sourceforge.net/projects/hunkyfonts"
> >  LICENSE =3D "LGPL"
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
> > =20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > index 104915e..c0d77fd 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
> >                      file://License.txt;md5=3D5b171c5100029d884fcea21d9=
a2b7543 \
> >  "
> > =20
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> >  SRC_URI =3D "http://fedorahosted.org/liberation-fonts/export/807b6dfd0=
69b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
> >  S =3D "${WORKDIR}/liberation-fonts-${PV}"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > index 62acf82..ab9be35 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > @@ -3,7 +3,7 @@ require ttf.inc
> >  DESCRIPTION =3D "MPlus font - TTF Edition"
> >  HOMEPAGE =3D "http://dejavu.sourceforge.net/wiki/"
> >  LICENSE =3D "${PN}"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TEST=
FLIGHT-${PV}.tar.gz"
> >  S =3D "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > index 1e84fea..3c4cb26 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > @@ -9,7 +9,7 @@ LICENSE =3D "Public domain"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e852830f55aa3c07=
d4a0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> >  RPROVIDES_${PN} =3D "virtual-japanese-font"
> > -PR =3D "r6"
> > +PR =3D "r7"
> > =20
> >  SRC_URI =3D "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-200406=
29.tar.bz2"
> >  S =3D "${WORKDIR}/sazanami-20040629"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_=
0.69.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> > index 1c71b1b..22a7aec 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> > @@ -3,7 +3,7 @@ require ttf.inc
> >  DESCRIPTION =3D "Ubuntu Font Family - TTF Version"
> >  HOMEPAGE =3D "http://font.ubuntu.com"
> >  LICENSE =3D "UFL"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "http://font.ubuntu.com/download/ubuntu-font-family-${PV}+=
ufl.zip"
> >  SRC_URI[md5sum] =3D "2c3287ea72f81ce025095f7a6d68af28"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > index 06de002..f1eb6ff 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "WenQuanYi Zen Hei - A Hei-Ti Style Chi=
nese font"
> >  AUTHOR =3D "Qianqian Fang and The WenQuanYi Project Contributors"
> >  HOMEPAGE =3D "http://wqy.sourceforge.net/en/"
> >  LICENSE =3D "GPLv2"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
> >  S =3D "${WORKDIR}/wqy-zenhei"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recip=
es-graphics/ttf-fonts/ttf.inc
> > index bba94bd..d48f692 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> > @@ -12,11 +12,15 @@ do_install() {
> >  }
> > =20
> >  pkg_postinst_append() {
> > -    update-fonts
> > +    if [ -z "$D" ]; then
> > +        update-fonts
> > +    fi
> >  }
> > =20
> >  pkg_postrm_append() {
> > -    update-fonts
> > +    if [ -z "$D" ]; then
> > +        update-fonts
> > +    fi
> >  }
> > =20
> >  inherit allarch
> > --=20
> > 1.7.8.6
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+q1FMACgkQN1Ujt2V2gByAWACgmaaHcP8NYacUcBEvHajm1vVF
vsgAn1NGHPHFhx6aq4dlMyTMNf/JXgBE
=bkDS
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
