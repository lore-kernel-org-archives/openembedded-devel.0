Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMR7F-0000Ro-MU
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 23:48:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Apr 2012 14:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145016775"
Received: from unknown (HELO helios.localnet) ([10.252.120.17])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2012 14:38:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 22:38:36 +0100
Message-ID: <3861310.nzHrvT5BMK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
References: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 1/3] zaurus-installer: use linux-yocto-tiny-kexecboot kernel
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
X-List-Received-Date: Mon, 23 Apr 2012 21:48:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 April 2012 23:31:12 Andrea Adami wrote:
> * bump PR
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/zaurus-utils/zaurus-installer.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/zaurus-utils/zaurus-installer.bb
> b/recipes-bsp/zaurus-utils/zaurus-installer.bb index 785836f..62f01c8
> 100644
> --- a/recipes-bsp/zaurus-utils/zaurus-installer.bb
> +++ b/recipes-bsp/zaurus-utils/zaurus-installer.bb
> @@ -1,9 +1,9 @@
>  DESCRIPTION = "Installkit for kexecboot-kernel"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58" -DEPENDS
> = "${@base_conditional('MACHINE', 'collie', 'linux-kexecboot',
> 'zaurus-updater linux-kexecboot', d)}" +DEPENDS =
> "${@base_conditional('MACHINE', 'collie', 'linux-yocto-tiny-kexecboot',
> 'zaurus-updater linux-yocto-tiny-kexecboot', d)}" DEPENDS +=
> "${@base_conditional('MACHINE', 'spitz', 'zaurus-legacy-tar', '', d)}" -PR
> = "r6"
> +PR = "r7"
> 
>  INHIBIT_DEFAULT_DEPS = "1"
> 
> @@ -14,7 +14,7 @@ do_compile() {
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PACKAGES = ""
> 
> -COMPATIBLE_MACHINE = "(collie|poodle|c7x0|spitz|akita|tosa)"
> +COMPATIBLE_MACHINE = "collie|poodle|c7x0|spitz|akita|tosa"
> 
>  inherit deploy
> 
> @@ -24,7 +24,7 @@ do_deploy() {
>          cd ${DEPLOY_DIR_IMAGE}
>          rm -rf ${DEPLOY_DIR_IMAGE}/installkit-${MACHINE}/
>          mkdir installkit-${MACHINE}/
> -        [ -f "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}.bin" ] && cp
> ${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}.bin
> installkit-${MACHINE}/${KERNEL_IMAGETYPE} +        [ -f
> "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}.bin" ] && cp
> ${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}.bin
> installkit-${MACHINE}/${KERNEL_IMAGETYPE} if [ ! "${MACHINE}" = "collie" ];
> then
>                  cp updater.sh installkit-${MACHINE}/updater.sh
>          fi

Merged these three to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


