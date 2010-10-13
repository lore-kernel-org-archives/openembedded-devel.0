Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1P65NC-0006oc-Ls
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:44:19 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAAuMtUxbdWOb/2dsb2JhbACiQL8bhUgEiVODcYF8
X-IronPort-AV: E=Sophos;i="4.57,326,1283724000"; d="scan'208";a="292424040"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 13 Oct 2010 19:43:49 +0200
Received: from [192.168.12.206] (helo=lit.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1P65Mj-00085a-Gu
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 19:43:49 +0200
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1P65Mi-0004Ef-V9
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:43:48 +0200
Date: Wed, 13 Oct 2010 19:43:48 +0200
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101013174348.GB1072@lit.local.igalia.com>
References: <1286988161-20097-1-git-send-email-bengardiner@nanometrics.ca>
MIME-Version: 1.0
In-Reply-To: <1286988161-20097-1-git-send-email-bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] [PATCH] distro: make TARGET_VENDOR a weak assignment to enable external-csl
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
X-List-Received-Date: Wed, 13 Oct 2010 17:44:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 13, 2010 at 12:42:41PM -0400, Ben Gardiner wrote:
> Trying to use an external toolchain like the 2009q1 toolchain from codesourcery
> has some strange results since the toolchain has vendor 'none' but
> distributions like angstrom set TARGET_VENDOR unconditionally.
> 
> This changeset makes all assignments of TARGET_VENDOR in distros weak as was
> suggested by Denys Dmytriyenko in a recent mailing list discussion [1].

This patch has been send earlier and was rejected.

Check this thread:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg11415.html

Here's the patch:
http://patchwork.openembedded.org/patch/3195/

vmjl

> 
> Tested with angstrom-2008.1 and the codesourcery 2009q1 toolchain by assigning
> TARGET_VENDOR = "-none"
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"
> , in addition to putting the CSL in the PATH.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> CC: Denys Dmytriyenko <denis@denix.org>
> 
> [1] http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg10699.html
> 
> ---
> 
> A similar patch is applicable to the stable/2009 branch but this patch is not applicable as-is.
> ---
>  conf/distro/include/angstrom.inc       |    2 +-
>  conf/distro/include/kaeilos-2010.inc   |    2 +-
>  conf/distro/include/kaeilos.inc        |    2 +-
>  conf/distro/include/oplinux.inc        |    2 +-
>  conf/distro/include/sane-toolchain.inc |    2 +-
>  conf/distro/iphone-compat.conf         |    2 +-
>  conf/distro/mamona.conf                |    2 +-
>  conf/distro/nylon.conf                 |    2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
> index 8983c86..9e5c869 100644
> --- a/conf/distro/include/angstrom.inc
> +++ b/conf/distro/include/angstrom.inc
> @@ -9,7 +9,7 @@ DISTRO_NAME = "Angstrom"
>  
>  BUILDNAME = "Angstrom ${DISTRO_VERSION}"
>  
> -TARGET_VENDOR = "-angstrom"
> +TARGET_VENDOR ?= "-angstrom"
>  
>  SOC_FAMILY ?= "Unknown"
>  
> diff --git a/conf/distro/include/kaeilos-2010.inc b/conf/distro/include/kaeilos-2010.inc
> index 0896281..4edee26 100644
> --- a/conf/distro/include/kaeilos-2010.inc
> +++ b/conf/distro/include/kaeilos-2010.inc
> @@ -12,7 +12,7 @@ USERDISTRO := "${DISTRO}"
>  DISTRO = "kaeilos"
>  DISTRO_NAME = "KaeilOS"
>  BUILDNAME = "KaeilOS ${DISTRO_VERSION}"
> -TARGET_VENDOR = "-kaeilos"
> +TARGET_VENDOR ?= "-kaeilos"
>  
>  # Add FEED_ARCH to overrides
>  OVERRIDES .= ":${FEED_ARCH}"
> diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
> index edbad69..5254854 100644
> --- a/conf/distro/include/kaeilos.inc
> +++ b/conf/distro/include/kaeilos.inc
> @@ -12,7 +12,7 @@ DISTRO_NAME = "KaeilOS"
>  
>  BUILDNAME = "KaeilOS ${DISTRO_VERSION}"
>  
> -TARGET_VENDOR = "-kaeilos"
> +TARGET_VENDOR ?= "-kaeilos"
>  
>  # Add FEED_ARCH to overrides
>  OVERRIDES .= ":${FEED_ARCH}"
> diff --git a/conf/distro/include/oplinux.inc b/conf/distro/include/oplinux.inc
> index 36eca58..da1bd08 100644
> --- a/conf/distro/include/oplinux.inc
> +++ b/conf/distro/include/oplinux.inc
> @@ -43,7 +43,7 @@ DISTRO_FEATURES = "nfs smbfs ext2 usbhost pci"
>  
>  
>  #We need to set this to avoid problems when building for if host=target
> -TARGET_VENDOR = "-oplinux"
> +TARGET_VENDOR ?= "-oplinux"
>  
>  #URI for base feeds
>  OPLINUX_URI = "http://www.digital-opsis.com/oplinux"
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
> index 6d460a2..1d51a5f 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -60,7 +60,7 @@ PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
>  #############################################################################
>  
>  # Branding
> -TARGET_VENDOR = "-oe"
> +TARGET_VENDOR ?= "-oe"
>  
>  # Add FEED_ARCH to the overrides list so that we can override the
>  # ARM_INSTRUCTION_SET like below
> diff --git a/conf/distro/iphone-compat.conf b/conf/distro/iphone-compat.conf
> index be2017b..a62e2e3 100644
> --- a/conf/distro/iphone-compat.conf
> +++ b/conf/distro/iphone-compat.conf
> @@ -3,7 +3,7 @@ require conf/distro/angstrom-2008.1.conf
>  DISTRO_NAME = "iphone-compat"
>  
>  TARGET_OS = "darwin9"
> -TARGET_VENDOR = "-apple"
> +TARGET_VENDOR ?= "-apple"
>  
>  export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} -Wl,-L${STAGING_DIR_TARGET}${libdir}"
>  
> diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
> index 31d6c36..45fa1d8 100644
> --- a/conf/distro/mamona.conf
> +++ b/conf/distro/mamona.conf
> @@ -9,7 +9,7 @@ DISTRO_TYPE = "debug"
>  
>  MAINTAINER = "Mamona Team <mamona-devel@garage.maemo.org>"
>  
> -TARGET_VENDOR = "-mamona"
> +TARGET_VENDOR ?= "-mamona"
>  
>  require conf/distro/include/sane-srcdates.inc
>  require conf/distro/include/sane-srcrevs.inc
> diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
> index ae8d064..0d0e43f 100644
> --- a/conf/distro/nylon.conf
> +++ b/conf/distro/nylon.conf
> @@ -17,7 +17,7 @@ BUILDNAME := "${NYLON_VERSION}"
>  DISTRO_TYPE = "debug"
>  TARGET_FPU = "soft"
>  SRCDATE := "20050527"
> -TARGET_VENDOR = "-nylon"
> +TARGET_VENDOR ?= "-nylon"
>  
>  # Ensure some form of release config, so error out if someone thinks he knows better
>  DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION")


