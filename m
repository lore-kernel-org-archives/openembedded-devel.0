Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvKK-0006sl-22
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:41:56 +0200
Received: by mail-pw0-f47.google.com with SMTP id 5so702901pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kGFNdbjSo5NKhKl/tX34uNTvtW9ro2cGI/ledpeCwaU=;
	b=bW8mR6Usj6pRpc4gD0T6eYtBxk1MTaw8K1BS81IuXym+SZrHuTl2GNVzgNtkowKU18
	mwzZoG2hpNMXMF4Upi7LxM0xMIOt6EPb3pM5NDUGwKNEuy73FpBhqE4OYIsHBa6Vd/AV
	SCpN8ZbjZEyIJ5csptwybxGs/J+wQtzZKEMQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pz95a0bam0pt7X6X9NmOOnrAtt8CuDvj+GmdimscTjXrB8Df2523rh4dqWQzbkswDG
	hxo8bE2Y/h/IboBCH6hEIN6CzHDD41TI77rIF0dgz2NvdRhqHmgsa62oll1IPOFyYoNm
	xGswgieohSqUFN0nu7p7X6VVcTlIAEn1zxfwY=
Received: by 10.115.86.38 with SMTP id o38mr6247946wal.170.1274798265302;
	Tue, 25 May 2010 07:37:45 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d20sm48268062waa.15.2010.05.25.07.37.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:37:44 -0700 (PDT)
Date: Tue, 25 May 2010 07:37:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525143737.GB26493@gmail.com>
References: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
	<1274794225-16222-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274794225-16222-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] linux-openmoko: remove linux-openmoko-devel as it will be merged with linux-openmoko-shr-devel to linux-openmoko_2.6.29
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
X-List-Received-Date: Tue, 25 May 2010 14:41:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/05/10 15:30), Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  .../linux/linux-openmoko-devel/defconfig-oe.patch  |   12 -------
>  recipes/linux/linux-openmoko-devel_git.bb          |   34 --------------------
>  2 files changed, 0 insertions(+), 46 deletions(-)
>  delete mode 100644 recipes/linux/linux-openmoko-devel/defconfig-oe.patch
>  delete mode 100644 recipes/linux/linux-openmoko-devel_git.bb
> 
> diff --git a/recipes/linux/linux-openmoko-devel/defconfig-oe.patch b/recipes/linux/linux-openmoko-devel/defconfig-oe.patch
> deleted file mode 100644
> index 3f65387..0000000
> --- a/recipes/linux/linux-openmoko-devel/defconfig-oe.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> ---- gta02-packaging-defconfig	2009-01-12 13:09:33.000000000 +0000
> -+++ defconfig-oe	2009-01-12 13:18:23.000000000 +0000
> -@@ -337,9 +337,6 @@
> - #
> - # At least one emulation must be selected
> - #
> --CONFIG_FPE_NWFPE=y
> --# CONFIG_FPE_NWFPE_XP is not set
> --# CONFIG_FPE_FASTFPE is not set
> - 
> - #
> - # Userspace binary formats
> diff --git a/recipes/linux/linux-openmoko-devel_git.bb b/recipes/linux/linux-openmoko-devel_git.bb
> deleted file mode 100644
> index 9d4aa22..0000000
> --- a/recipes/linux/linux-openmoko-devel_git.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -KERNEL_RELEASE = "2.6.29"
> -KERNEL_VERSION = "${KERNEL_RELEASE}"
> -
> -SRCREV = "a15608f241a40b41fed5bffe511355c2067c4e88"
> -OEV = "oe1"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -PR = "r2"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
> -"
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> -CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
> -
> -do_configure_prepend() {
> -
> -        # Rename getline in ./scripts/unifdef.c
> -        # Kernels up to 2.6.29 are currently failing to build unifdef.c,
> -        # clashing with exposed getline() from <stdio.h>
> -        # see https://patchwork.kernel.org/patch/11166/
> -        # committed in 2.6.29 (commit d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7)
> -
> -        sed -i -e 's/getline/parseline/g' ${S}/scripts/unifdef.c
> -
> -	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -	cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
> -}
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


