Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U365G-0001CS-7z
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 15:34:51 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so827685pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HUtbV4tVWrjl6TLCWYMd3cABe9q/QPLjeXOn0zd+59U=;
	b=geFVe6ybVblFjTYWyorJwLX+R8K///tMO+o2BfN4S8WwpxJbxoNw9+VraCLlSZYlvJ
	RdHFD9Aoe8EMXAIrL3XqbwxEfmTfh0ySpRiTU62ON+te1c6Ex6CqVGJIOzKGi2iP44G9
	Dxk9jTUCKJ0sXfZaLT58YtkZQYEJEmYUzxoVdX/eg6TOzPw/fpqwoxkPkcjpMxz9bQti
	HyHTyx8T6zjRs3aeyCLkgMOWMGYPcaufC+WFO/P7Kx08IMJHefe+fOVx4jJrMEsDY5Gt
	UhUazZ6K3eQJbp22DgOf3vpEi0L0gIv+0py4vOrJ9mJ8xLJG1hOf/UjeXt2fzcCnHPpx
	9gzw==
X-Received: by 10.66.73.164 with SMTP id m4mr76402300pav.12.1360160334351;
	Wed, 06 Feb 2013 06:18:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y9sm38095464paw.1.2013.02.06.06.18.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:18:53 -0800 (PST)
Date: Wed, 6 Feb 2013 15:18:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130206141845.GX3271@jama>
References: <1359998082-2773-1-git-send-email-Martin.Jansa@gmail.com>
	<20130204183553.GF3271@jama>
MIME-Version: 1.0
In-Reply-To: <20130204183553.GF3271@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe] ttf: introduce update-fonts bbclass and change all ttf recipes to use it
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
X-List-Received-Date: Wed, 06 Feb 2013 14:34:52 -0000
X-Groupsio-MsgNum: 43024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O9T4zNOkGnr0n+A/"
Content-Disposition: inline

--O9T4zNOkGnr0n+A/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 07:35:53PM +0100, Martin Jansa wrote:
> On Mon, Feb 04, 2013 at 06:14:42PM +0100, Martin Jansa wrote:
> > * without this ttf.inc had to set RRECOMMENDS and
> >   postinst/postrm without PN suffix to cover all
> >   subpackages created in ttf recipes

v3 with small fix for ttf-mplus applied to keep meta-oe compatible with
https://github.com/openembedded/oe-core/commit/316228948e65f376f6c5be13ccd0=
c964ea630edf

It also depends on this change
https://github.com/openembedded/oe-core/commit/5aa52c6882d2929b2e530c4fa297=
c6d3e97d4f9f
but that was applied too

Regards,

> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/classes/update-fonts.bbclass               | 40 ++++++++++++++=
++++++++
> >  .../ttf-fonts/ttf-arphic-uming_20080216.bb         |  8 ++---
> >  .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |  8 ++---
> >  .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |  6 ++--
> >  .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb | 13 +++----
> >  .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |  7 ++--
> >  .../ttf-fonts/ttf-liberation_0.2.bb                |  6 ++--
> >  .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |  6 +++-
> >  .../ttf-fonts/ttf-sazanami_20040629.bb             | 11 +++---
> >  .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |  4 +--
> >  .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |  3 +-
> >  meta-oe/recipes-graphics/ttf-fonts/ttf.inc         | 16 +--------
> >  12 files changed, 81 insertions(+), 47 deletions(-)
> >  create mode 100644 meta-oe/classes/update-fonts.bbclass
> >=20
> > diff --git a/meta-oe/classes/update-fonts.bbclass b/meta-oe/classes/upd=
ate-fonts.bbclass
> > new file mode 100644
> > index 0000000..cbed6b0
> > --- /dev/null
> > +++ b/meta-oe/classes/update-fonts.bbclass
> > @@ -0,0 +1,40 @@
> > +
> > +update_fonts_postinst() {
> > +    if [ -z "$D" ]; then
> > +        update-fonts
> > +    fi
> > +}
> > +
> > +# the same but keep it separate for now
> > +update_fonts_postrm() {
> > +    if [ -z "$D" ]; then
> > +        update-fonts
> > +    fi
> > +}
> > +
> > +python populate_packages_append () {
> > +    update_fonts_pkgs =3D d.getVar('UPDATE_FONTS_PACKAGES', True).spli=
t()
> > +
> > +    for pkg in update_fonts_pkgs:
> > +        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getV=
ar('pkg_postinst', True)
> > +        if not postinst:
> > +            postinst =3D '#!/bin/sh\n'
> > +        postinst +=3D d.getVar('update_fonts_postinst', True)
> > +        d.setVar('pkg_postinst_%s' % pkg, postinst)
> > +
> > +        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('=
pkg_postrm', True)
> > +        if not postrm:
> > +            postrm =3D '#!/bin/sh\n'
> > +        postrm +=3D d.getVar('update_fonts_postrm', True)
> > +        d.setVar('pkg_postrm_%s' % pkg, postrm)
> > +
> > +        d.appendVar('RDEPENDS_%s' % pkg, 'font-update-common')
>=20
> missing space before font-update-common fixed locally
>=20
> > +}
> > +
> > +python __anonymous() {
> > +    if not bb.data.inherits_class('native', d) and not bb.data.inherit=
s_class('cross', d):
> > +        updatefonts_check =3D d.getVar('UPDATE_FONTS_PACKAGES')
> > +        if not updatefonts_check:
> > +            bb_filename =3D d.getVar('FILE')
> > +            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits updat=
e-fonts but doesn't set UPDATE_FONTS_PACKAGES" % bb_filename
> > +}
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_200802=
16.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > index 97b67b2..06e06ca 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> > @@ -4,16 +4,16 @@ LICENSE =3D "Arphic Public License"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D62be011094b7865ddc4d1a648444=
d31a"
> >  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> >  RPROVIDES_${PN} =3D "virtual-chinese-font"
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> > -SRC_URI =3D \
> > -"http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arp=
hic-uming_0.2.${PV}.1.orig.tar.gz"
> > +UPDATE_FONTS_PACKAGES =3D "${PN}"
> > +
> > +SRC_URI =3D "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-u=
ming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
> >  S =3D "${WORKDIR}"
> > =20
> >  require ttf.inc
> > =20
> >  FILES_${PN} =3D "${datadir}"
> > =20
> > -
> >  SRC_URI[md5sum] =3D "d219fcaf953f3eb1889399955a00379f"
> >  SRC_URI[sha256sum] =3D "8038a6db9e832456d5da5559aff8d15130243be1091bf2=
4f3243503a6f1bda98"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/me=
ta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > index d7b3977..eead861 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> > @@ -5,14 +5,14 @@ HOMEPAGE =3D "http://dejavu.sourceforge.net/wiki/"
> >  LICENSE =3D "Bitstream Vera"
> >  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE=
;md5=3D9f867da7a73fad2715291348e80d0763"
> > =20
> > -# all subpackages except ${PN}-dbg and ${PN}-common itself rdepends on=
 ${PN}-common
> > +# all subpackages except ${PN}-common itself rdepends on ${PN}-common
> >  RDEPENDS_${PN}-sans =3D "${PN}-common"
> >  RDEPENDS_${PN}-sans-mono =3D "${PN}-common"
> >  RDEPENDS_${PN}-sans-condensed =3D "${PN}-common"
> >  RDEPENDS_${PN}-serif =3D "${PN}-common"
> >  RDEPENDS_${PN}-serif-condensed =3D "${PN}-common"
> >  RDEPENDS_${PN}-common =3D ""
> > -PR =3D "r5"
> > +PR =3D "r6"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.b=
z2 \
> >             file://30-dejavu-aliases.conf"
> > @@ -24,14 +24,14 @@ do_install_append () {
> >  	install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/f=
onts/conf.d/
> >  }
> > =20
> > -PACKAGES =3D "${PN}-dbg \
> > +PACKAGES =3D "\
> >              ${PN}-sans \
> >              ${PN}-sans-mono \
> >              ${PN}-sans-condensed \
> >              ${PN}-serif \
> >              ${PN}-serif-condensed \
> >              ${PN}-common"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +UPDATE_FONTS_PACKAGES =3D "${PN}-sans ${PN}-sans-mono ${PN}-sans-conde=
nsed ${PN}-serif ${PN}-serif-condensed"
> > =20
> >  FILES_${PN}-sans            =3D "${datadir}/fonts/truetype/DejaVuSans.=
ttf ${datadir}/fonts/truetype/DejaVuSans-*.ttf"
> >  FILES_${PN}-sans-mono       =3D "${datadir}/fonts/truetype/DejaVuSansM=
ono*.ttf"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > index 2c3bf2e..1a04a5f 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D83544262a86f1f1ec761e758=
97df92bc"
> >  SRCREV =3D "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
> >  PV =3D "0.1+gitr${SRCPV}"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "git://github.com/android/platform_frameworks_base.git;pro=
tocol=3Dgit;branch=3Dmaster"
> > =20
> > @@ -16,9 +16,9 @@ do_install_prepend() {
> >  	rm ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf Clo=
ckopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf DroidSansFallbackLegacy.ttf # we=
're not packaging it
> >  }
> > =20
> > -PACKAGES =3D "${PN}-dbg ttf-droid-sans ttf-droid-sans-mono \
> > +PACKAGES =3D "ttf-droid-sans ttf-droid-sans-mono \
> >              ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-=
serif"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +UPDATE_FONTS_PACKAGES =3D "ttf-droid-sans ttf-droid-sans-mono ttf-droi=
d-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
> > =20
> >  FILES_ttf-droid-sans =3D "${datadir}/fonts/truetype/DroidSans.ttf ${da=
tadir}/fonts/truetype/DroidSans-Bold.ttf"
> >  FILES_ttf-droid-sans-mono =3D "${datadir}/fonts/truetype/DroidSansMono=
=2Ettf"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/m=
eta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > index 3c49e24..1e21e14 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "OFL"
> >  LICENSE_URL =3D "http://scripts.sil.org/cms/scripts/page.php?site_id=
=3Dnrsi&item_id=3DOFL"
> >  LIC_FILES_CHKSUM =3D "file://OFL;md5=3D33a5bf7b98a9c0ae87430760ba76229=
5 \
> >  "
> > -PR =3D "r6"
> > +PR =3D "r7"
> > =20
> >  SRC_URI =3D "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.ori=
g.tar.gz "
> > =20
> > @@ -22,15 +22,16 @@ do_install_append() {
> > =20
> >  }
> > =20
> > -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-alt"
> > +PACKAGES =3D "${PN} ${PN}-alt"
> > +UPDATE_FONTS_PACKAGES =3D "${PN} ${PN}-alt"
> > =20
> > -FILES_ttf-gentium-alt =3D "${datadir}/fonts/truetype/GenAI*.ttf \
> > -                         ${datadir}/fonts/truetype/GenAR*.ttf \
> > -			 ${datadir}/doc/ttf-gentium-alt/*"
> > +FILES_${PN}-alt =3D "${datadir}/fonts/truetype/GenAI*.ttf \
> > +                   ${datadir}/fonts/truetype/GenAR*.ttf \
> > +                   ${datadir}/doc/ttf-gentium-alt/*"
> > =20
> >  FILES_${PN} =3D "${datadir}/fonts/truetype/GenI*.ttf \
> >                 ${datadir}/fonts/truetype/GenR*.ttf \
> > -	       ${datadir}/doc/ttf-gentium/*"
> > +               ${datadir}/doc/ttf-gentium/*"
> > =20
> >  SRC_URI[md5sum] =3D "4c3e6ae586be277537ebb68f2a45b883"
> >  SRC_URI[sha256sum] =3D "4746c04c9a4ad9e0788a38e0a2f81919a630d8070ceabc=
89f156b6d41d8ceb37"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb=
 b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > index 4a23451..1f77211 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> > @@ -4,14 +4,15 @@ DESCRIPTION =3D "Hunky fonts - TTF Version"
> >  HOMEPAGE =3D "http://sourceforge.net/projects/hunkyfonts"
> >  LICENSE =3D "LGPL"
> >  LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D7fbc338309ac38fefcd64b04=
bb903e34"
> > -PR =3D "r5"
> > +PR =3D "r6"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
> > =20
> >  S =3D "${WORKDIR}/hunkyfonts-${PV}/TTF/"
> > =20
> > -PACKAGES =3D "${PN}-dbg ttf-hunky-sans ttf-hunky-serif"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +PACKAGES =3D "ttf-hunky-sans ttf-hunky-serif"
> > +UPDATE_FONTS_PACKAGES =3D "ttf-hunky-sans ttf-hunky-serif"
> > +
> >  FILES_ttf-hunky-sans =3D "${datadir}/fonts/truetype/HunkySans*.ttf"
> >  FILES_ttf-hunky-serif =3D "${datadir}/fonts/truetype/HunkySerif*.ttf"
> > =20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > index c0d77fd..901b8b2 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> > @@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a=
9ba36caa9b7df079bae19f \
> >                      file://License.txt;md5=3D5b171c5100029d884fcea21d9=
a2b7543 \
> >  "
> > =20
> > -PR =3D "r5"
> > +PR =3D "r6"
> > =20
> >  SRC_URI =3D "http://fedorahosted.org/liberation-fonts/export/807b6dfd0=
69b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
> >  S =3D "${WORKDIR}/liberation-fonts-${PV}"
> > =20
> > -PACKAGES =3D "${PN}-dbg ttf-liberation-mono ttf-liberation-sans ttf-li=
beration-serif"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +PACKAGES =3D "ttf-liberation-mono ttf-liberation-sans ttf-liberation-s=
erif"
> > +UPDATE_FONTS_PACKAGES =3D "ttf-liberation-mono ttf-liberation-sans ttf=
-liberation-serif"
> > =20
> >  FILES_ttf-liberation-mono  =3D "${datadir}/fonts/truetype/*Mono*"
> >  FILES_ttf-liberation-sans  =3D "${datadir}/fonts/truetype/*Sans*"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > index 9103dab..33f5771 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "${PN}"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE_E;md5=3Dac161e96eda00db9a3aec7870=
b5d9658 \
> >                      file://LICENSE_J;md5=3Da120ca8d7c8e4a475d5277c9aeb=
95221 \
> >  "
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  SRC_URI =3D "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TEST=
FLIGHT-${PV}.tar.gz"
> >  S =3D "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
> > @@ -14,8 +14,12 @@ S =3D "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
> >  python populate_packages_prepend() {
> >      plugindir =3D d.expand('${datadir}/fonts/ttf-mplus/')
> >      do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font=
 %s', extra_depends =3D "ttf-common")
> > +    d.setVar('UPDATE_FONTS_PACKAGES', packages)
> >  }
> > =20
> > +# for update-fonts.bbclass sake only, replaced later in populate_packa=
ges_prepend
> > +UPDATE_FONTS_PACKAGES =3D "${PN}"
> > +
> >  do_install() {
> >  	install -d ${D}${datadir}/fonts/ttf-mplus
> >  	install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > index 3c4cb26..d982c11 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> > @@ -9,17 +9,18 @@ LICENSE =3D "Public domain"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e852830f55aa3c07=
d4a0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> >  RPROVIDES_${PN} =3D "virtual-japanese-font"
> > -PR =3D "r7"
> > +PR =3D "r8"
> > =20
> >  SRC_URI =3D "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-200406=
29.tar.bz2"
> >  S =3D "${WORKDIR}/sazanami-20040629"
> > =20
> > -PACKAGES =3D "${PN}-dbg ttf-sazanami-gothic ttf-sazanami-mincho"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +PACKAGES =3D "ttf-sazanami-gothic ttf-sazanami-mincho"
> > +UPDATE_FONTS_PACKAGES =3D "ttf-sazanami-gothic ttf-sazanami-mincho"
> > +
> >  FILES_ttf-sazanami-gothic =3D "${datadir}/fonts/truetype/sazanami-goth=
ic.ttf \
> > -			     ${datadir}/doc/ttf-sazanami-gothic/README"
> > +                             ${datadir}/doc/ttf-sazanami-gothic/README"
> >  FILES_ttf-sazanami-mincho =3D "${datadir}/fonts/truetype/sazanami-minc=
ho.ttf \
> > -			     ${datadir}/doc/ttf-sazanami-mincho/README"
> > +                             ${datadir}/doc/ttf-sazanami-mincho/README"
> > =20
> >  do_install_append() {
> >  	# README contains the redistribution license
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_=
0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
> > index 08d79a1..8d99259 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
> > @@ -13,8 +13,8 @@ SRC_URI[sha256sum] =3D "107170099bbc3beae8602b97a5c42=
3525d363106c3c24f787d43e09811
> > =20
> >  S =3D "${WORKDIR}/ubuntu-font-family-${PV}"
> > =20
> > -PACKAGES =3D "${PN}-dbg ttf-ubuntu-mono ttf-ubuntu-sans"
> > -RRECOMMENDS_${PN}-dbg =3D ""
> > +PACKAGES =3D "ttf-ubuntu-mono ttf-ubuntu-sans"
> > +UPDATE_FONTS_PACKAGES =3D "ttf-ubuntu-mono ttf-ubuntu-sans"
> > =20
> >  FILES_ttf-ubuntu-mono  =3D "${datadir}/fonts/truetype/*Mono*"
> >  FILES_ttf-ubuntu-sans  =3D "${datadir}/fonts/truetype/Ubuntu-*"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > index d8c88d5..0263301 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> > @@ -5,7 +5,7 @@ AUTHOR =3D "Qianqian Fang and The WenQuanYi Project Con=
tributors"
> >  HOMEPAGE =3D "http://wqy.sourceforge.net/en/"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf540fc7d35b5777e36051280b3=
a911c"
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
> >  S =3D "${WORKDIR}/wqy-zenhei"
> > @@ -17,6 +17,7 @@ do_install_append () {
> >  }
> > =20
> >  PACKAGES =3D "${PN}"
> > +UPDATE_FONTS_PACKAGES =3D "${PN}"
> > =20
> >  FILES_${PN} =3D "${datadir}/fonts ${sysconfdir}"
> > =20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recip=
es-graphics/ttf-fonts/ttf.inc
> > index d48f692..70283be 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> > @@ -1,7 +1,5 @@
> >  DESCRIPTION ?=3D "TrueType font package ${PN}"
> >  SECTION =3D "fonts"
> > -# don't use RRECOMMENDS_${PN} here because sometimes each font is pack=
aged to separate package and each one needs this dep to call update-fonts
> > -RRECOMMENDS +=3D "font-update-common"
> > =20
> >  # we don't need a compiler nor a c library for these fonts
> >  INHIBIT_DEFAULT_DEPS =3D "1"
> > @@ -11,16 +9,4 @@ do_install() {
> >      find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/f=
onts/truetype/ \;
> >  }
> > =20
> > -pkg_postinst_append() {
> > -    if [ -z "$D" ]; then
> > -        update-fonts
> > -    fi
> > -}
> > -
> > -pkg_postrm_append() {
> > -    if [ -z "$D" ]; then
> > -        update-fonts
> > -    fi
> > -}
> > -
> > -inherit allarch
> > +inherit allarch update-fonts
> > --=20
> > 1.8.1.2
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O9T4zNOkGnr0n+A/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESZkUACgkQN1Ujt2V2gByIFACeLU1laQ99lvm+pf3N+dOAxqp+
/G8An2/k+LyjEAn8orQNwSW8AtKF3D/7
=zQd9
-----END PGP SIGNATURE-----

--O9T4zNOkGnr0n+A/--
