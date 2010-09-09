Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Otg6g-0004pg-Vl
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 14:20:00 +0200
Received: by iwn2 with SMTP id 2so1098461iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/SQjnTBt95iYo/6w6P0rYWjOB4hxXx5WafwNQEzhh5U=;
	b=QdwL8IG/anv4BpV1RlhFfxqXY/5neUaTQijpKdYgXNX0VvrPw1ZMPqB1MdLSYSXNmo
	DHrRkiUKbHCJqAOpbOawoKm+0BYm+NZ/sfRF6iGfDFuorvXhTj9jZ6clVx/zkd5dcphC
	R+eYIKru4qMSdPDr0ikvv438iUYY8GlQJlkTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QIpphCXmaXuwam0VWWfEDQEIpfxd6PwvyO0v35gyYFvis51aCl6H/yXVH7Yi5Dqt3z
	UQjHURGaA/l2sTuM+o3GAEGU4HEdlJP5rsBVt/FD1pqJxS0BFUzppM+oyicbKwcGQs1J
	c+CDKI6sY+2YlhAASd7+JbClubm2wYYGE4foU=
MIME-Version: 1.0
Received: by 10.231.153.5 with SMTP id i5mr11590820ibw.105.1284034755439; Thu,
	09 Sep 2010 05:19:15 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 05:19:15 -0700 (PDT)
In-Reply-To: <1284034317-9428-1-git-send-email-eric@eukrea.com>
References: <1284034317-9428-1-git-send-email-eric@eukrea.com>
Date: Thu, 9 Sep 2010 14:19:15 +0200
Message-ID: <AANLkTinCrWVWNEAh-yXBzqO8eUxNG4JO=fH1GoEcFerx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fix bitbake ERRORS for machine not having virtual/egl
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
X-List-Received-Date: Thu, 09 Sep 2010 12:20:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Eric B=E9nard <eric@eukrea.com>:
> * several recipes depend on virtual/egl which currently has only one
> provider : powervr-drivers/libgles-omap. This provider sets
> COMPATIBLE_MACHINE to a few TI based machines.
> When building for machines which don't provide virtual/egl, we get
> the following errors :
> ERROR: '['path_to/openembedded/recipes/qt4/qt4-embedded-gles_4.6.3.bb']'
> =A0 =A0 =A0RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
> =A0 =A0 'qt4-embedded-gles' but it wasn't found in any PACKAGE or RPROVID=
ES
> =A0 =A0 variables of any buildable targets.
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
> =A0 =A0 entity 'virtual/egl' but it wasn't found in any PACKAGE or RPROVI=
DES
> =A0 =A0 variables
>
> * This patch creates a egl.inc which contains the compatible machines for
> recipes depending on virtual/egl and thus will workaround this error.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>


Thanks alot for creating this workaround.
These errors started to become a nuisance to me, so your workaround is
very appreciated.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> ---
> =A0recipes/egl/egl.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0recipes/irrlicht/irrlicht-examples-gles.bb | =A0 =A01 +
> =A0recipes/ogre/ogre-egl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/powervr-drivers/bc-cube_0.1.0.bb =A0 | =A0 =A01 +
> =A0recipes/powervr-drivers/bc-cube_0.2.0.bb =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-embedded-gles_4.6.0.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-embedded-gles_4.6.2.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-embedded-gles_4.6.3.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-x11-free-gles_4.5.2.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-x11-free-gles_4.6.0.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-x11-free-gles_4.6.2.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/qt4/qt4-x11-free-gles_4.6.3.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/xbmc/xbmc_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A013 files changed, 13 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/egl/egl.inc
>
> diff --git a/recipes/egl/egl.inc b/recipes/egl/egl.inc
> new file mode 100644
> index 0000000..6bbfaaf
> --- /dev/null
> +++ b/recipes/egl/egl.inc
> @@ -0,0 +1 @@
> +COMPATIBLE_MACHINE =3D "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t=
35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo=
|palmpre)"
> diff --git a/recipes/irrlicht/irrlicht-examples-gles.bb b/recipes/irrlich=
t/irrlicht-examples-gles.bb
> index 6bce68a..e515fc7 100644
> --- a/recipes/irrlicht/irrlicht-examples-gles.bb
> +++ b/recipes/irrlicht/irrlicht-examples-gles.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Irrlicht 3D rendering engine "
> =A0LICENSE =3D "zlib"
> =A0DEPENDS =3D "virtual/libx11 libxxf86vm virtual/egl"
> +require recipes/egl/egl.inc
>
> =A0SRCREV =3D "2409"
> =A0PV =3D "1.6+svnr${SRCPV}"
> diff --git a/recipes/ogre/ogre-egl_svn.bb b/recipes/ogre/ogre-egl_svn.bb
> index caa96c3..5cb7393 100644
> --- a/recipes/ogre/ogre-egl_svn.bb
> +++ b/recipes/ogre/ogre-egl_svn.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "OGRE (Object-Oriented Graphics Rendering Engine) is a=
 scene-oriented, flexible 3D engine "
> =A0LICENSE =3D "LGPL"
> =A0DEPENDS =3D "gtk+ wgois cppunit zziplib boost freeimage freetype virtu=
al/libx11 virtual/egl"
> +require recipes/egl/egl.inc
>
> =A0PR =3D "r3"
>
> diff --git a/recipes/powervr-drivers/bc-cube_0.1.0.bb b/recipes/powervr-d=
rivers/bc-cube_0.1.0.bb
> index 6323a79..62dfc5b 100644
> --- a/recipes/powervr-drivers/bc-cube_0.1.0.bb
> +++ b/recipes/powervr-drivers/bc-cube_0.1.0.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "TI Texture streaming using bufferclass API demo (spin=
ning video cube)"
> =A0LICENSE =3D "TI-BSD/GPLv2"
> =A0DEPENDS =3D "virtual/egl"
> +require recipes/egl/egl.inc
>
> =A0SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/apps_proces=
sors/OMAP35x_AM35x_Video_Texture_Streaming/1_0/exports/bc-cat-${PV}.tar.gz =
\
> =A0 =A0 =A0 =A0 =A0 =A0file://bc-cat-0.1.0-BC_PIX_FMT_.patch;striplevel=
=3D0"
> diff --git a/recipes/powervr-drivers/bc-cube_0.2.0.bb b/recipes/powervr-d=
rivers/bc-cube_0.2.0.bb
> index cf2aa95..c639283 100644
> --- a/recipes/powervr-drivers/bc-cube_0.2.0.bb
> +++ b/recipes/powervr-drivers/bc-cube_0.2.0.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "TI Texture streaming using bufferclass API demo (spin=
ning video cube)"
> =A0LICENSE =3D "TI-BSD/GPLv2"
> =A0DEPENDS =3D "virtual/egl"
> +require recipes/egl/egl.inc
>
> =A0PR =3D "r2"
>
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-emb=
edded-gles_4.6.0.bb
> index 3b3ea15..3e132bf 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> @@ -10,3 +10,4 @@ require qt-4.6.0.inc
> =A0FILESPATHPKG .=3D ":qt4-embedded-${PV}:qt4-embedded"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.2.bb b/recipes/qt4/qt4-emb=
edded-gles_4.6.2.bb
> index 21c461a..0b047fc 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.2.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
> @@ -11,3 +11,4 @@ SRC_URI +=3D "file://cursor-hack.diff"
> =A0FILESPATHPKG .=3D ":qt4-embedded-${PV}:qt4-embedded"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.3.bb b/recipes/qt4/qt4-emb=
edded-gles_4.6.3.bb
> index 21c461a..0b047fc 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> @@ -11,3 +11,4 @@ SRC_URI +=3D "file://cursor-hack.diff"
> =A0FILESPATHPKG .=3D ":qt4-embedded-${PV}:qt4-embedded"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb b/recipes/qt4/qt4-x11=
-free-gles_4.5.2.bb
> index 3fe7218..57e1524 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> @@ -11,6 +11,7 @@ require qt4-x11-free_${PV}.bb
> =A0PR =3D "${INC_PR}.3"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> =A0PROVIDES +=3D "qt4-x11-free"
> =A0#SRC_URI +=3D "file://sgx-hack.patch"
> =A0SRC_URI +=3D "file://hack-out-pg_config.patch"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb b/recipes/qt4/qt4-x11=
-free-gles_4.6.0.bb
> index dfd53e5..0821595 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS +=3D " \
> =A0FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> =A0PROVIDES +=3D "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb b/recipes/qt4/qt4-x11=
-free-gles_4.6.2.bb
> index 307770f..b7cbde5 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS +=3D " \
> =A0FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> =A0PROVIDES +=3D "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb b/recipes/qt4/qt4-x11=
-free-gles_4.6.3.bb
> index 307770f..b7cbde5 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS +=3D " \
> =A0FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
>
> =A0DEPENDS +=3D "virtual/egl"
> +require recipes/egl/egl.inc
> =A0PROVIDES +=3D "qt4-x11-free"
> diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
> index 5b1d8bb..b42d7fa 100644
> --- a/recipes/xbmc/xbmc_svn.bb
> +++ b/recipes/xbmc/xbmc_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "XBMC Media Center"
> =A0LICENSE =3D "xbmc"
>
> =A0DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libm=
odplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer =
virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca ava=
hi libsamplerate0 libxrandr bzip2 virtual/libsdl"
> +require recipes/egl/egl.inc
>
> =A0SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


