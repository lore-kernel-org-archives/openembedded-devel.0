Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUW93-0003R1-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 04:10:41 +0100
Received: by iyj18 with SMTP id 18so1954033iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 19:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cFyz9IlbK86Eh4xxnmTJhCI3ZDVBsUh36YD5yWA4/P4=;
	b=CSKqn38robYcPvN8kwAmwhbbH6Lzmv9hOj/G1ZnE4XVrwfAOQ1+NhFwFGOcRZQOmmY
	mhok/K1VO7zYKNY7pmsw60GmwFH8sXSBrS5nN/fLBzKWPVCpY109KNIp8Yj8xRZT4FXC
	OkD+7wI0gJYrtW/NY4P6+4cfiQCV/WfkhDlD4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DoYDqzKLidU0PYpO8M9nfw6/0963yMtQ9PPAOKhviKsY7D6lczqXYOIcd0hOrLp3tQ
	0PFwUXfM3JliTGt6rdSu5T+OmBwSzK42T6e5qh3y3UB7LAkVJ0hEwTgC1ZMginLfW3gK
	nloEy+A7qxwm8IoV5UUVdeY+XDztWx3qQzTcg=
Received: by 10.42.178.138 with SMTP id bm10mr3611109icb.277.1292814636104;
	Sun, 19 Dec 2010 19:10:36 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z4sm3090270ibg.19.2010.12.19.19.10.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Dec 2010 19:10:35 -0800 (PST)
Date: Sun, 19 Dec 2010 19:10:47 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220031047.GB26429@gmail.com>
References: <1292521608-26072-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1292521608-26072-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: naresh <naresh@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] lftp: add ti LFTB recipe
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
X-List-Received-Date: Mon, 20 Dec 2010 03:10:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/10 11:46), Chase Maupin wrote:
> From: naresh <naresh@ti.com>
> 
> * This package contains functional test suites for TI devices
>   used to verify the Linux kernel and drivers for the various
>   peripherals found on TI devices.
> 
> Signed-off-by: naresh <naresh@ti.com>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes/ti/ti-lftb.inc    |   47 +++++++++++++++++++++++++++++++++++++++++++++
>  recipes/ti/ti-lftb_2.0.bb |    9 ++++++++
>  2 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/ti-lftb.inc
>  create mode 100644 recipes/ti/ti-lftb_2.0.bb
> 
> diff --git a/recipes/ti/ti-lftb.inc b/recipes/ti/ti-lftb.inc
> new file mode 100644
> index 0000000..176f983
> --- /dev/null
> +++ b/recipes/ti/ti-lftb.inc
> @@ -0,0 +1,47 @@
> +DESCRIPTION = "Linux Functional test bench"

may be F should be f

> +HOMEPAGE = "http://arago-project.org/git/projects/?p=test-automation/target-code/psp/lftb.git;a=summary"
> +LICENSE="BSD"
> +
> +INC_PR = "r1"

New recipes begin at 'r0'

> +
> +DEPENDS = "virtual/kernel"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE = "(dm365|dm355|dm6446|dm6467|omapl137|omapl138|omap3|ti816x)"
> +

could it use SOC_FAMILY


> +S = "${WORKDIR}/git"
> +
> +#Machine specific overrides
> +PLATFORM_omap3evm="omap35x"
> +PLATFORM_am180x-evm="am18x"
> +PLATFORM_am3517-evm="am3517"
> +PLATFORM_am37x-evm="am37x"
> +PLATFORM_beagleboard="beagle"
> +PLATFORM_da830-omapl137-evm="am17x"
> +PLATFORM_da850-omapl138-evm="am18x"
> +PLATFORM_am181x-evm="am18x"
> +PLATFORM_dm355-evm="dm355"
> +PLATFORM_dm365-evm="dm365"
> +PLATFORM_dm37x-evm="am37x"
> +PLATFORM_dm6446-evm="dm644x"
> +PLATFORM_dm6467-evm="dm646x"
> +PLATFORM_ti816x="ti816x"
> +
> +do_compile () {
> +    cd ${S}
> +    make KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM} TOOL_PREFIX=${TARGET_PREFIX}
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}/lftb
> +    cd ${S}

is this cd needed ?

> +    make INSTALL_DIR=${D}${bindir}/lftb install
> +
> +    # Remove unneeded tarball placed in bindir by install target
> +    rm -rf ${D}${bindir}/lftb.tar.gz
> +}
> +
> +INSANE_SKIP_${PN} = True
> +
> +FILES_${PN} = "${bindir}/lftb"
> diff --git a/recipes/ti/ti-lftb_2.0.bb b/recipes/ti/ti-lftb_2.0.bb
> new file mode 100644
> index 0000000..62c936c
> --- /dev/null
> +++ b/recipes/ti/ti-lftb_2.0.bb
> @@ -0,0 +1,9 @@
> +require ti-lftb.inc
> +
> +SRCREV = "3d0be58aee659ef7e8eda43e916172bab300235f"
> +
> +PR = "${MACHINE_KERNEL_PR}+${INC_PR}"
> +PR_append = "a"
> +
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/target-code/psp/lftb.git;protocol=git \
> +"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


