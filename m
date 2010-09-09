Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Otimm-00050T-1W for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 17:11:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Otim7-0002su-0I for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 17:10:55 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 17:10:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 17:10:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Sep 2010 17:10:43 +0200
Message-ID: <i6atdj$5b0$1@dough.gmane.org>
References: <1284034317-9428-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1284034317-9428-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 09 Sep 2010 15:11:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-09-10 14:11, Eric Bénard wrote:
> * several recipes depend on virtual/egl which currently has only one
> provider : powervr-drivers/libgles-omap. This provider sets
> COMPATIBLE_MACHINE to a few TI based machines.
> When building for machines which don't provide virtual/egl, we get
> the following errors :
> ERROR: '['path_to/openembedded/recipes/qt4/qt4-embedded-gles_4.6.3.bb']'
>       RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
>      'qt4-embedded-gles' but it wasn't found in any PACKAGE or RPROVIDES
>      variables of any buildable targets.
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
>      entity 'virtual/egl' but it wasn't found in any PACKAGE or RPROVIDES
>      variables
> 
> * This patch creates a egl.inc which contains the compatible machines for
> recipes depending on virtual/egl and thus will workaround this error.

The intent is good, but I have to NAK this for the time being.

Could you change that to use:

COMPATIBLE_MACHINE = "omap3"?

That would future proof it a lot better :)

regards,

Koen

> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/egl/egl.inc                        |    1 +
>  recipes/irrlicht/irrlicht-examples-gles.bb |    1 +
>  recipes/ogre/ogre-egl_svn.bb               |    1 +
>  recipes/powervr-drivers/bc-cube_0.1.0.bb   |    1 +
>  recipes/powervr-drivers/bc-cube_0.2.0.bb   |    1 +
>  recipes/qt4/qt4-embedded-gles_4.6.0.bb     |    1 +
>  recipes/qt4/qt4-embedded-gles_4.6.2.bb     |    1 +
>  recipes/qt4/qt4-embedded-gles_4.6.3.bb     |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.5.2.bb     |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.6.0.bb     |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.6.2.bb     |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.6.3.bb     |    1 +
>  recipes/xbmc/xbmc_svn.bb                   |    1 +
>  13 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/egl/egl.inc
> 
> diff --git a/recipes/egl/egl.inc b/recipes/egl/egl.inc
> new file mode 100644
> index 0000000..6bbfaaf
> --- /dev/null
> +++ b/recipes/egl/egl.inc
> @@ -0,0 +1 @@
> +COMPATIBLE_MACHINE = "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
> diff --git a/recipes/irrlicht/irrlicht-examples-gles.bb b/recipes/irrlicht/irrlicht-examples-gles.bb
> index 6bce68a..e515fc7 100644
> --- a/recipes/irrlicht/irrlicht-examples-gles.bb
> +++ b/recipes/irrlicht/irrlicht-examples-gles.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "Irrlicht 3D rendering engine "
>  LICENSE = "zlib"
>  DEPENDS = "virtual/libx11 libxxf86vm virtual/egl"
> +require recipes/egl/egl.inc
>  
>  SRCREV = "2409"
>  PV = "1.6+svnr${SRCPV}"
> diff --git a/recipes/ogre/ogre-egl_svn.bb b/recipes/ogre/ogre-egl_svn.bb
> index caa96c3..5cb7393 100644
> --- a/recipes/ogre/ogre-egl_svn.bb
> +++ b/recipes/ogre/ogre-egl_svn.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "OGRE (Object-Oriented Graphics Rendering Engine) is a scene-oriented, flexible 3D engine "
>  LICENSE = "LGPL"
>  DEPENDS = "gtk+ wgois cppunit zziplib boost freeimage freetype virtual/libx11 virtual/egl"
> +require recipes/egl/egl.inc
>  
>  PR = "r3"
>  
> diff --git a/recipes/powervr-drivers/bc-cube_0.1.0.bb b/recipes/powervr-drivers/bc-cube_0.1.0.bb
> index 6323a79..62dfc5b 100644
> --- a/recipes/powervr-drivers/bc-cube_0.1.0.bb
> +++ b/recipes/powervr-drivers/bc-cube_0.1.0.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "TI Texture streaming using bufferclass API demo (spinning video cube)"
>  LICENSE = "TI-BSD/GPLv2"
>  DEPENDS = "virtual/egl"
> +require recipes/egl/egl.inc
>  
>  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/apps_processors/OMAP35x_AM35x_Video_Texture_Streaming/1_0/exports/bc-cat-${PV}.tar.gz \
>             file://bc-cat-0.1.0-BC_PIX_FMT_.patch;striplevel=0"
> diff --git a/recipes/powervr-drivers/bc-cube_0.2.0.bb b/recipes/powervr-drivers/bc-cube_0.2.0.bb
> index cf2aa95..c639283 100644
> --- a/recipes/powervr-drivers/bc-cube_0.2.0.bb
> +++ b/recipes/powervr-drivers/bc-cube_0.2.0.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "TI Texture streaming using bufferclass API demo (spinning video cube)"
>  LICENSE = "TI-BSD/GPLv2"
>  DEPENDS = "virtual/egl"
> +require recipes/egl/egl.inc
>  
>  PR = "r2"
>  
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> index 3b3ea15..3e132bf 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> @@ -10,3 +10,4 @@ require qt-4.6.0.inc
>  FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.2.bb b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
> index 21c461a..0b047fc 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.2.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
> @@ -11,3 +11,4 @@ SRC_URI += "file://cursor-hack.diff"
>  FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.3.bb b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> index 21c461a..0b047fc 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> @@ -11,3 +11,4 @@ SRC_URI += "file://cursor-hack.diff"
>  FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> index 3fe7218..57e1524 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> @@ -11,6 +11,7 @@ require qt4-x11-free_${PV}.bb
>  PR = "${INC_PR}.3"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
>  #SRC_URI += "file://sgx-hack.patch"
>  SRC_URI += "file://hack-out-pg_config.patch"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> index dfd53e5..0821595 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
>  FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
> index 307770f..b7cbde5 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
>  FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> index 307770f..b7cbde5 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> @@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
>  FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  
>  DEPENDS += "virtual/egl"
> +require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
> diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
> index 5b1d8bb..b42d7fa 100644
> --- a/recipes/xbmc/xbmc_svn.bb
> +++ b/recipes/xbmc/xbmc_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION = "XBMC Media Center"
>  LICENSE = "xbmc"
>  
>  DEPENDS = "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi libsamplerate0 libxrandr bzip2 virtual/libsdl"
> +require recipes/egl/egl.inc
>  
>  SRCREV = "e2ab481ebe964321c358ab9d6402088c714adcbe"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMiPjzMkyGM64RGpERAuZ/AKC7Et1WKxMgwE1YIPJaPh7/SUlfPACdFWRG
SSWCIpmBl7NFBZIryUgLR1I=
=yas7
-----END PGP SIGNATURE-----



