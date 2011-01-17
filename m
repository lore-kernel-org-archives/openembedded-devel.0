Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PekFW-0004YV-Ex for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 09:15:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PekEx-0003pS-IO for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 09:15:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:15:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Jan 2011 09:14:36 +0100
Message-ID: <ih0tpc$ra$2@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295220721.13967.13.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] libomxil-bellagio: cosmetics: unify recipes
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
X-List-Received-Date: Mon, 17 Jan 2011 08:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-11 00:32, Paul Menzel wrote:
> Date: Sun, 16 Jan 2011 23:34:08 +0100
> 
> Just reorder the lines to be consistent throughout all recipes and to adhere to the style guide [1].
> 
> [1] http://wiki.openembedded.org/index.php/Styleguide
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ++----
>  recipes/openmax/libomxil-bellagio_0.9.1.bb |   10 ++++------


FWIW, the above two aren't used and can get deleted, I suspect they
don't even build against our recent ffmpeg

>  recipes/openmax/libomxil-bellagio_0.9.2.bb |   10 ++++------
>  3 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/libomxil-bellagio_0.9.0.bb
> index 3be6dde..aa78d6f 100644
> --- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
> +++ b/recipes/openmax/libomxil-bellagio_0.9.0.bb
> @@ -6,13 +6,11 @@ DEPENDS = "alsa-lib ffmpeg \
>  PR = "r7"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "6d6b6a75bc8751a7421b5e739c53ef6e"
> +SRC_URI[sha256sum] = "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d33040803cdaf0997e442c"
>  
>  inherit autotools
>  
>  FILES_${PN} += "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
>  FILES_${PN}-dev += "${libdir}/bellagio/*.a"
>  FILES_${PN}-dbg += "${libdir}/bellagio/.debug"
> -
> -
> -SRC_URI[md5sum] = "6d6b6a75bc8751a7421b5e739c53ef6e"
> -SRC_URI[sha256sum] = "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d33040803cdaf0997e442c"
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/libomxil-bellagio_0.9.1.bb
> index 942f963..958ac26 100644
> --- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
> +++ b/recipes/openmax/libomxil-bellagio_0.9.1.bb
> @@ -3,16 +3,14 @@ LICENSE = "LGPLv2"
>  DEPENDS = "alsa-lib ffmpeg \
>             ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
> -
>  PR = "r1"
>  
> +SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "757371e21e4f3653ce4d12d3ba0be1e0"
> +SRC_URI[sha256sum] = "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6d47909287a353a"
> +
>  inherit autotools
>  
>  FILES_${PN} += "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
>  FILES_${PN}-dev += "${libdir}/bellagio/*.a"
>  FILES_${PN}-dbg += "${libdir}/bellagio/.debug"
> -
> -
> -SRC_URI[md5sum] = "757371e21e4f3653ce4d12d3ba0be1e0"
> -SRC_URI[sha256sum] = "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6d47909287a353a"
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/libomxil-bellagio_0.9.2.bb
> index a58b296..ff30c10 100644
> --- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
> +++ b/recipes/openmax/libomxil-bellagio_0.9.2.bb
> @@ -3,10 +3,12 @@ LICENSE = "LGPLv2"
>  DEPENDS = "alsa-lib ffmpeg \
>             ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
> -
>  PR = "r1"
>  
> +SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "42ab7383c4ca4093000ec7062289112b"
> +SRC_URI[sha256sum] = "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3e92a6a279c38fc"
> +
>  inherit autotools
>  
>  FILES_${PN} += "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
> @@ -14,7 +16,3 @@ FILES_${PN}-dev += "${libdir}/bellagio/*.a"
>  FILES_${PN}-dbg += "${libdir}/bellagio/.debug"
>  
>  PARALLEL_MAKE = ""
> -
> -
> -SRC_URI[md5sum] = "42ab7383c4ca4093000ec7062289112b"
> -SRC_URI[sha256sum] = "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3e92a6a279c38fc"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNM/psMkyGM64RGpERAoYrAKCTFgLDR/mHygAKKwmD5pqJxfCtSACfb5Wg
TsuMu6328pV5Il9+0+ZBN1w=
=K64M
-----END PGP SIGNATURE-----



