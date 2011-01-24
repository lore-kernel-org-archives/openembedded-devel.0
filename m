Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhIKS-0004zm-3K for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 10:03:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhIJl-0007wx-5A for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 10:02:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 10:02:33 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 10:02:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 24 Jan 2011 10:02:22 +0100
Message-ID: <ihjf6u$c5u$1@dough.gmane.org>
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 09:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-11 03:03, Khem Raj wrote:
> * no need to pin older udev with uclibc/git either
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

NAK! binutils 2.21 introduces way too many problem at this moment, those
need to get solved before switching to it.

> ---
>  conf/distro/angstrom-2010.x.conf                   |    6 +++---
>  .../include/angstrom-2010-preferred-versions.inc   |    1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
> index c6fb07d..3ac3847 100644
> --- a/conf/distro/angstrom-2010.x.conf
> +++ b/conf/distro/angstrom-2010.x.conf
> @@ -71,8 +71,8 @@ PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
>  #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>  PREFERRED_VERSION_glibc 		?= "2.10.1"
>  PREFERRED_VERSION_glibc-initial 	?= "2.10.1"
> -PREFERRED_VERSION_uclibc        	?= "0.9.30.2"
> -PREFERRED_VERSION_uclibc-initial	?= "0.9.30.2"
> +PREFERRED_VERSION_uclibc        	?= "git"
> +PREFERRED_VERSION_uclibc-initial	?= "git"
>  PREFERRED_VERSION_eglibc		?= "2.12"
>  PREFERRED_VERSION_eglibc-initial	?= "2.12"
>  
> @@ -95,7 +95,7 @@ ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
>  #Everybody else can just use this: 
>  ANGSTROM_GCC_VERSION                     ?= "4.5"
>  
> -ANGSTROM_BINUTILS_VERSION                ?= "2.20.1"
> +ANGSTROM_BINUTILS_VERSION                ?= "2.21"
>  
>  PREFERRED_VERSION_binutils               ?= "${ANGSTROM_BINUTILS_VERSION}"
>  PREFERRED_VERSION_binutils-cross         ?= "${ANGSTROM_BINUTILS_VERSION}"
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 5532f29..66ee5ab 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -66,7 +66,6 @@ PREFERRED_VERSION_samba		= "3.3.9"
>  PREFERRED_VERSION_tiff 		= "3.9.4+4.0.0beta6"
>  
>  PREFERRED_VERSION_udev 		= "165"
> -PREFERRED_VERSION_udev_libc-uclibc = "141"
>  UDEV_GE_141 = "1"
>  
>  PREFERRED_VERSION_usbutils = "0.86"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPUAeMkyGM64RGpERAm6CAJsHFPAQdphhKT4liYnMNE57ubU32wCfeJim
6pPp+1le2CwVszFtrNlJ+Qk=
=ihdt
-----END PGP SIGNATURE-----



