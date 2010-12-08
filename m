Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PQPLW-0002ku-7f for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 20:06:34 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PQPK5-0006Mm-Sp for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 20:05:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 20:05:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 20:05:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Dec 2010 20:01:05 +0100
Message-ID: <idoklh$pb4$2@dough.gmane.org>
References: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] conf/distro: remove unused variable CVS_TARBALL_STASH
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
X-List-Received-Date: Wed, 08 Dec 2010 19:06:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

And it isn't used in bitbake either?

On 08-12-10 13:58, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  conf/distro/angstrom-2008.1.conf |    5 -----
>  conf/distro/include/oplinux.inc  |    4 ----
>  conf/distro/include/slugos.inc   |    1 -
>  conf/distro/kaeilos.conf         |    6 ------
>  conf/distro/shr.conf             |    2 --
>  5 files changed, 0 insertions(+), 18 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index ec03276..30ec35b 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -50,11 +50,6 @@ FEED_BASEPATH = "feeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
>  # Uncomment this to fetch packaged-staging packages from the central angstrom server
>  #PSTAGE_MIRROR = "${ANGSTROM_URI}/${FEED_BASEPATH}packaged-staging"
>  
> -#The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
> -CVS_TARBALL_STASH ?= "\
> -		     http://www.angstrom-distribution.org/unstable/sources/ \
> -		    "
> -
>  
>  #Make sure we use 2.6 on machines with a 2.4/2.6 selector
>  KERNEL = "kernel26"
> diff --git a/conf/distro/include/oplinux.inc b/conf/distro/include/oplinux.inc
> index 36eca58..6e6bddb 100644
> --- a/conf/distro/include/oplinux.inc
> +++ b/conf/distro/include/oplinux.inc
> @@ -28,10 +28,6 @@ MAINTAINER = "Digital OPSiS Developers Team <oplinux-developers@digital-opsis.co
>  # Packaging and output format
>  IMAGE_FSTYPES = "tar.gz jffs2 ext2.gz cramfs squashfs squashfs-lzma cpio.gz"
>  
> -# Specifies a location to search for pre-generated tarballs when fetching
> -# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
> -#CVS_TARBALL_STASH = "http://www.digital-opsis.com/oplinux/sources/"
> -
>  PREMIRRORS = "(ftp|http)://.*/.*/ http://source.digital-opsis.com/"
>  
>  #
> diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
> index c2a380d..07dfd65 100644
> --- a/conf/distro/include/slugos.inc
> +++ b/conf/distro/include/slugos.inc
> @@ -109,7 +109,6 @@ DISTRO_EXTRA_DEPENDS ?= ""
>  DISTRO_EXTRA_RDEPENDS ?= ""
>  DISTRO_EXTRA_RRECOMMENDS ?= ""
>  
> -CVS_TARBALL_STASH = "http://sources.nslu2-linux.org/sources/"
>  INHERIT += "nslu2-mirrors"
>  
>  #FIXME: HACK: REMOVE THIS
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index 815d40f..84ea4e7 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -48,12 +48,6 @@ EXTRA_IMAGECMD_ext2 = "-i 4096"
>  FEED_BASEPATH = "feeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
>  
>  
> -#The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
> -CVS_TARBALL_STASH ?= "\
> -		     http://www.angstrom-distribution.org/unstable/sources/ \
> -		    "
> -
> -
>  #Make sure we use 2.6 on machines with a 2.4/2.6 selector
>  KERNEL = "kernel26"
>  MACHINE_KERNEL_VERSION = "2.6"
> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
> index 0258231..bf615f8 100644
> --- a/conf/distro/shr.conf
> +++ b/conf/distro/shr.conf
> @@ -79,8 +79,6 @@ ANGSTROM_BLACKLIST_pn-linux-ml403-mvista-2.6.x = "strange kernel, spank maintain
>  ANGSTROM_BLACKLIST_pn-linux-davinci = "strange kernel, spank maintainer"
>  
>  
> -CVS_TARBALL_STASH += "http://build.shr-project.org/sources/"
> -
>  #The shr-mirrors.bbclass repleaces this
>  #PREMIRRORS = "(ftp|https?)$://.*/.* http://build.shr-project.org/sources/"
>  INHERIT += "shr-mirrors" 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM/9XwMkyGM64RGpERAindAJ9FJeNOloPLf/v2Jv9RKr7JW366ZwCdGimT
bFe9TDngOxtkNwXsFz+zsaE=
=wRqx
-----END PGP SIGNATURE-----



