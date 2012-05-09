Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSDLj-0006Qh-04
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 22:19:17 +0200
Received: by wgbds1 with SMTP id ds1so1963808wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 13:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7gGn70Os6dM/DJc0Wuaam7fpkXiot2bnMmgd94oJON8=;
	b=QU6jeN6zpuX3iPj5IG9UvFm5pDAM+oZbJbzIWnL08fzIxuyG/A6eHA6+QvZrk2OMx7
	k65FCTPKeg5ybXenuBJoIxkC4LPfRJbLeAAbqvQvg3dP5UUPduLHk8hPb49aMETkb9MR
	tVzYFwiPaUPBI/nxrHzZ289OiRri7p4flveMOg/2AED37cMqNlrwo8Lin8guL6R3k6XQ
	NfyZq2uVsqYu63vubI+C5HdsB2dkBhO1JfH7W8SMnc1ZuqjtAiYLj5STHDW2g+4GW0qL
	SfCiTgcNxNb6rmbDP/4J6iO5K9RDeLxYOL3/uKN3hBcZ8SntnQ9nRoVtEzdmqt/J8goT
	K6Dg==
Received: by 10.180.78.164 with SMTP id c4mr9952819wix.10.1336594150069;
	Wed, 09 May 2012 13:09:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m4sm6605579wix.0.2012.05.09.13.09.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 13:09:09 -0700 (PDT)
Date: Wed, 9 May 2012 22:09:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120509200910.GG12898@jama.jama.net>
References: <1336594013-19408-1-git-send-email-Martin.Jansa@gmail.com>
	<1336594013-19408-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1336594013-19408-2-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Wed, 09 May 2012 20:19:29 -0000
X-Groupsio-MsgNum: 38640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Content-Disposition: inline

--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2012 at 10:06:53PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---

ignore this one.. only on ML I've noticed that
pkg_postrm_append() {
should be even improved to
pkg_postrm_${PN}_append() {


Cheers,

>  .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    2 +-
>  .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    2 +-
>  .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    1 +
>  .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    2 +-
>  .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    2 +-
>  .../ttf-fonts/ttf-liberation_0.2.bb                |    2 +-
>  .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
>  .../ttf-fonts/ttf-sazanami_20040629.bb             |    2 +-
>  .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |    2 +-
>  .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    8 ++++++--
>  11 files changed, 16 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216=
=2Ebb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> index 10fb922..97b67b2 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Arphic Public License"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3D62be011094b7865ddc4d1a648444d3=
1a"
>  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
>  RPROVIDES_${PN} =3D "virtual-chinese-font"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  SRC_URI =3D \
>  "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphi=
c-uming_0.2.${PV}.1.orig.tar.gz"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> index d4ddf16..d7b3977 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> @@ -12,7 +12,7 @@ RDEPENDS_${PN}-sans-condensed =3D "${PN}-common"
>  RDEPENDS_${PN}-serif =3D "${PN}-common"
>  RDEPENDS_${PN}-serif-condensed =3D "${PN}-common"
>  RDEPENDS_${PN}-common =3D ""
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2=
 \
>             file://30-dejavu-aliases.conf"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> index e0a6c65..2c3bf2e 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> @@ -6,6 +6,7 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D83544262a86f1f1ec761e75897=
df92bc"
>  SRCREV =3D "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
>  PV =3D "0.1+gitr${SRCPV}"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "git://github.com/android/platform_frameworks_base.git;proto=
col=3Dgit;branch=3Dmaster"
> =20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/met=
a-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> index b00bd75..ee27c12 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "Gentium fonts - TTF Version"
>  HOMEPAGE =3D "http://scripts.sil.org/gentium"
>  LICENSE =3D "SIL Open Font License"
>  LICENSE_URL =3D "http://scripts.sil.org/cms/scripts/page.php?site_id=3Dn=
rsi&item_id=3DOFL"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.=
tar.gz \
>             file://OFL.gz"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> index f841f1a..a2ef0cf 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
> @@ -3,7 +3,7 @@ require ttf.inc
>  DESCRIPTION =3D "Hunky fonts - TTF Version"
>  HOMEPAGE =3D "http://sourceforge.net/projects/hunkyfonts"
>  LICENSE =3D "LGPL"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
> =20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/m=
eta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> index 104915e..c0d77fd 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f \
>                      file://License.txt;md5=3D5b171c5100029d884fcea21d9a2=
b7543 \
>  "
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "http://fedorahosted.org/liberation-fonts/export/807b6dfd069=
b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
>  S =3D "${WORKDIR}/liberation-fonts-${PV}"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> index 62acf82..ab9be35 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> @@ -3,7 +3,7 @@ require ttf.inc
>  DESCRIPTION =3D "MPlus font - TTF Edition"
>  HOMEPAGE =3D "http://dejavu.sourceforge.net/wiki/"
>  LICENSE =3D "${PN}"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFL=
IGHT-${PV}.tar.gz"
>  S =3D "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> index 1e84fea..3c4cb26 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "Public domain"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e852830f55aa3c07d4=
a0"
>  SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
>  RPROVIDES_${PN} =3D "virtual-japanese-font"
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  SRC_URI =3D "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629=
=2Etar.bz2"
>  S =3D "${WORKDIR}/sazanami-20040629"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.=
69.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> index 1c71b1b..22a7aec 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
> @@ -3,7 +3,7 @@ require ttf.inc
>  DESCRIPTION =3D "Ubuntu Font Family - TTF Version"
>  HOMEPAGE =3D "http://font.ubuntu.com"
>  LICENSE =3D "UFL"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "http://font.ubuntu.com/download/ubuntu-font-family-${PV}+uf=
l.zip"
>  SRC_URI[md5sum] =3D "2c3287ea72f81ce025095f7a6d68af28"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> index 06de002..f1eb6ff 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "WenQuanYi Zen Hei - A Hei-Ti Style Chine=
se font"
>  AUTHOR =3D "Qianqian Fang and The WenQuanYi Project Contributors"
>  HOMEPAGE =3D "http://wqy.sourceforge.net/en/"
>  LICENSE =3D "GPLv2"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
>  S =3D "${WORKDIR}/wqy-zenhei"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes=
-graphics/ttf-fonts/ttf.inc
> index bba94bd..d48f692 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
> @@ -12,11 +12,15 @@ do_install() {
>  }
> =20
>  pkg_postinst_append() {
> -    update-fonts
> +    if [ -z "$D" ]; then
> +        update-fonts
> +    fi
>  }
> =20
>  pkg_postrm_append() {
> -    update-fonts
> +    if [ -z "$D" ]; then
> +        update-fonts
> +    fi
>  }
> =20
>  inherit allarch
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+qzuYACgkQN1Ujt2V2gByXTQCgqqNlpp2g42ylxvyNG4Ok6DWK
JcQAnjpvwL0OMIirWRHlbb6/MuuVrHDF
=ecbp
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
