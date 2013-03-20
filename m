Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UIFXF-0001yC-H6
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:42:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2013 02:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,876,1355126400"; d="scan'208";a="305006069"
Received: from unknown (HELO helios.localnet) ([10.255.13.114])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2013 02:25:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2013 09:25:24 +0000
Message-ID: <2143718.Cd3otbWQK5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1363769996-20782-1-git-send-email-raj.khem@gmail.com>
References: <1363769996-20782-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] recipes: Turn ALLOW_EMPTY to be package specific
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
X-List-Received-Date: Wed, 20 Mar 2013 09:42:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 March 2013 01:59:56 Khem Raj wrote:
> Fixes QA warnings during parse
> 
> ERROR: QA Issue:
> /b/kraj/angstrom/sources/meta-opie/recipes-opie/packagegroups/nativesdk-pack
> agegroup-opie-toolchain-host.bb: Variable ALLOW_EMPTY is set as not being
> package specific, please fix this.
> ERROR: QA Issue:
> /b/kraj/angstrom/sources/meta-opie/recipes-opie/packagegroups/packagegroup-o
> pie-toolchain-target.bb: Variable ALLOW_EMPTY is set as not being package
> specific, please fix this.
> ERROR: QA Issue:
> /b/kraj/angstrom/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-media
> player1_git.bb: Variable ALLOW_EMPTY is set as not being package specific,
> please fix this.
> ERROR: QA Issue:
> /b/kraj/angstrom/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-media
> player1_1.2.5.bb: Variable ALLOW_EMPTY is set as not being package specific,
> please fix this.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-opie/opie-help-en/opie-help-en.inc         |    2 +-
>  .../opie-mediaplayer1/opie-mediaplayer1.inc        |    2 +-
>  .../nativesdk-packagegroup-opie-toolchain-host.bb  |    2 +-
>  .../packagegroup-opie-toolchain-target.bb          |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-opie/opie-help-en/opie-help-en.inc
> b/recipes-opie/opie-help-en/opie-help-en.inc index 30295f3..6c0ae6c 100644
> --- a/recipes-opie/opie-help-en/opie-help-en.inc
> +++ b/recipes-opie/opie-help-en/opie-help-en.inc
> @@ -3,7 +3,7 @@ SECTION = "opie/help"
>  LICENSE = "GPLv2"
>  # FIXME stopgap until split archives have license files included
>  LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> -ALLOW_EMPTY = "1"
> +ALLOW_EMPTY_${PN} = "1"
>  PACKAGE_ARCH = "all"
> 
>  PACKAGES += "${PN}"
> diff --git a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
> b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc index
> 22b1069..df35e37 100644
> --- a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
> +++ b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "The classic Opie media player
> (core+plugins)." LICENSE = "GPLv2"
>  # FIXME stopgap until split archives have license files included
>  LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> -ALLOW_EMPTY = "1"
> +ALLOW_EMPTY_${PN} = "1"
>  PACKAGE_ARCH = "all"
>  RDEPENDS_${PN} = "opie-mediaplayer1-core"
>  RRECOMMENDS_${PN} = "opie-mediaplayer1-libmadplugin
> opie-mediaplayer1-libwavplugin \ diff --git
> a/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
> b/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
> index 52693ba..c97f84a 100644
> ---
> a/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
> +++
> b/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb
> @@ -3,6 +3,6 @@ require
> recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb DESCRIPTION =
> "Host packages for Opie SDK"
>  PR = "r3"
>  LICENSE = "MIT"
> -ALLOW_EMPTY = "1"
> +ALLOW_EMPTY_${PN} = "1"
> 
>  RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"
> diff --git
> a/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
> b/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb index
> ca42e0d..04fa21d 100644
> --- a/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
> +++ b/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Target packages for Opie SDK"
>  PR = "r7"
>  LICENSE = "MIT"
> -ALLOW_EMPTY = "1"
> +ALLOW_EMPTY_${PN} = "1"
> 
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

Merged, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


