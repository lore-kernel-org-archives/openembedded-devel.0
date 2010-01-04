Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NRkKA-0003Oj-Vt for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 11:38:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NRkIA-0002hr-Uw
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 11:36:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 11:36:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 11:36:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 04 Jan 2010 11:35:43 +0100
Message-ID: <hhsg9u$fd3$1@ger.gmane.org>
References: <200912190854.11510.holger+oe@freyther.de>	<201001040840.28000.holger+oe@freyther.de>	<hhs8ev$ogg$1@ger.gmane.org>
	<201001041125.50618.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <201001041125.50618.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Mon, 04 Jan 2010 10:38:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-01-10 11:25, Holger Hans Peter Freyther wrote:

> For X11 we already have a PREFERRED_PROVIDER setting in place and don't need to update.

Thats not quite true, only qt4x11 is defined, but we need qt4-x11-free.

> ---
>  conf/compatibility-providers.conf               |    1 +
>  recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled |    1 +
>  recipes/qt4/qt4-embedded-gles_4.6.0.bb          |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.5.2.bb          |    1 +
>  recipes/qt4/qt4-x11-free-gles_4.6.0.bb          |    1 +
>  5 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/compatibility-providers.conf b/conf/compatibility-providers.conf
> index 10a81f2..cf61ab5 100644
> --- a/conf/compatibility-providers.conf
> +++ b/conf/compatibility-providers.conf
> @@ -47,6 +47,7 @@ PREFERRED_PROVIDER_openmoko-alsa-scenarios ?= "alsa-scenarii-shr"
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  #PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
>  PREFERRED_PROVIDER_qemu-native ?= "qemu-native"
> +PREFERRED_PROVIDER_qt4-embedded ?= "qt4-embedded"
>  PREFERRED_PROVIDER_qt4x11 ?= "qt4-x11-free"
>  PREFERRED_PROVIDER_task-bootstrap ?= "task-bootstrap"
>  PREFERRED_PROVIDER_tslib-conf ?= "tslib"
> diff --git a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled b/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
> index 5aa07c2..a888e7d 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
> +++ b/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
> @@ -9,6 +9,7 @@ require qt4-embedded_${PV}.bb
>  LICENSE = "LGPLv2.1 GPLv3"
>  
>  DEPENDS += "virtual/egl"
> +PROVIDES += "qt4-embedded"
>  SRC_URI += "file://sgx-hack.patch;patch=1"
>  
>  export EXTRA_QMAKE_MUNGE = " glmunge "
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> index f819c66..06cdcc5 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> @@ -1,6 +1,7 @@
>  require qt4-embedded.inc
>  PR = "${INC_PR}.0"
>  
> +PROVIDES += "qt4-embedded"
>  QT_GLFLAGS = "-opengl es2 -openvg"
>  
>  require qt-4.6.0.inc
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> index cd81841..a3f60bf 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
> @@ -11,6 +11,7 @@ require qt4-x11-free_${PV}.bb
>  PR = "${INC_PR}.3"
>  
>  DEPENDS += "virtual/egl"
> +PROVIDES += "qt4-x11-free"
>  #SRC_URI += "file://sgx-hack.patch;patch=1"
>  SRC_URI += "file://hack-out-pg_config.patch;patch=1"
>  
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> index a74feaf..cc3aeed 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
> @@ -13,5 +13,6 @@ QT_CONFIG_FLAGS += " \
>  FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  
>  DEPENDS += "virtual/egl"
> +PROVIDES += "qt4-x11-free"
>  
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLQcR/MkyGM64RGpERAhihAJ4rTawa5X9G5LBJSUtKlNzLyW+WWACgiFKR
C1M0OR8CoPeTWwIVzGuBlgU=
=4yvX
-----END PGP SIGNATURE-----



