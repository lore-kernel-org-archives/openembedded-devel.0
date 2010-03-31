Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx4tj-0006sy-IU
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:52:24 +0200
Received: by ywh35 with SMTP id 35so247581ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=x84R+VHW8YglHr3l7iALoI4Ape/DvjQYrK/TuK15y8s=;
	b=Kq285hx0XolkMExzb4DN4l7FnXq28V9LhKbOpvbxicN+LCHj13cun5ynUvNLVWL2Gx
	hSRuzpQb71l6JWGwE21Z8p+Zi4CRICVUsvU7nUdQXzoqZ3c9lE5WzjoZXXqdfTTuSfNb
	N43J7AtR4lTWgcg9c05TVM5qHw4kecZdZlyVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=dvK+vKyvkBlxKfYBCuYOeKryaHfN2B3UI5emA5tVWF2Y+ln2ys3R2YYSvTLJtLIQWA
	h0qFLVm370l4i11uuhVO4jvs9JtBDoqQRS4VphmH8lyHJnNzHTmd/Ej2MZpfGhomirKp
	XCZTm7STE+d5p9l1QG1gtZRl2uhyJiuIwYvJo=
Received: by 10.150.208.19 with SMTP id f19mr359118ybg.208.1270068518634;
	Wed, 31 Mar 2010 13:48:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 16sm4484986gxk.5.2010.03.31.13.48.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 13:48:37 -0700 (PDT)
Date: Wed, 31 Mar 2010 13:49:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331204928.GB14197@gmail.com>
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
MIME-Version: 1.0
In-Reply-To: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?Q?Micka=C3=ABl?= CHAZAUX <mchazaux@adeneo-embedded.com>
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Wed, 31 Mar 2010 20:52:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (30/03/10 09:46), Mickaël CHAZAUX wrote:
> This patch adds support for the i.MX25 3Stack platform.
> 	It is based on the patches released by Freescale as
> 	part of LTIB.
> ---
>  conf/machine/mx25-3stack.conf                    |   23 +
>  recipes/linux/linux-2.6.28/mx25-3stack/defconfig | 1725 ++++++++++++++++++++++
>  recipes/linux/linux_2.6.28.bb                    |    8 +
>  recipes/u-boot/u-boot_2009.01.bb                 |    6 +
>  4 files changed, 1762 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/mx25-3stack.conf
>  create mode 100644 recipes/linux/linux-2.6.28/mx25-3stack/defconfig
> 
Thanks for the patch.

<snip>
> diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.bb
> index 5288208..2dfc19e 100644
> --- a/recipes/linux/linux_2.6.28.bb
> +++ b/recipes/linux/linux_2.6.28.bb
> @@ -14,6 +14,7 @@ DEFAULT_PREFERENCE_wrap = "1"
>  DEFAULT_PREFERENCE_tx27 = "1"
>  DEFAULT_PREFERENCE_nokia900 = "1"
>  DEFAULT_PREFERENCE_mh355 = "1"
> +DEFAULT_PREFERENCE_mx25-3stack = "1"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2 \
>             ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;patch=1 \
> @@ -81,4 +82,11 @@ SRC_URI_nokia900 = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.b
>  		    http://repository.maemo.org/pool/maemo5.0/free/k/kernel/kernel_2.6.28-20094803.3+0m5.diff.gz;patch=1 \
>  		    file://defconfig"
>  
> +SRC_URI_mx25-3stack = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2 \
> +                       http://download.berlios.de/mx25patches/linux-2.6.28-imx_4.5.1.patch.bz2;patch=1;name=patchmx25\
> +                       file://defconfig"
> +

We also have the latest minor patch on top of stock 2.6.28 as well which
brings it to 2.6.28.10. Can you
try to check if you can build on top of that ?

Just SRC_URI_append_mx25-3stack =
"http://download.berlios.de/mx25patches/linux-2.6.28-imx_4.5.1.patch.bz2;patch=1;name=patchmx25"


> +SRC_URI[patchmx25.md5sum] = "7d8de4524713fce3124162fae7a20503"
> +SRC_URI[patchmx25.sha256] = "fa3caff8d5def01c668dba441bfde577b7e3c1975773cb42f9313a14b662b0d3"
> +
>  S = "${WORKDIR}/linux-2.6.28/"
> diff --git a/recipes/u-boot/u-boot_2009.01.bb b/recipes/u-boot/u-boot_2009.01.bb
> index dfb3b3a..ca115d7 100644
> --- a/recipes/u-boot/u-boot_2009.01.bb
> +++ b/recipes/u-boot/u-boot_2009.01.bb
> @@ -13,6 +13,7 @@ DEFAULT_PREFERENCE_at91sam9263ek = "1"
>  DEFAULT_PREFERENCE_at91cap9adk	 = "1"
>  DEFAULT_PREFERENCE_atngw100	 = "1"
>  DEFAULT_PREFERENCE_atstk1000	 = "1"
> +DEFAULT_PREFERENCE_mx25-3stack	 = "1"
>  
>  PR = "r1"
>  
> @@ -28,4 +29,9 @@ SRC_URI_append_at91sam9g20ek = "\
>  	   file://u-boot-2009.01-exp-003-drivers-net-macb.c.patch;patch=1 \
>             file://at91sam9g20-fix-config.patch;patch=1 \
>             "
> +SRC_URI_append_mx25-3stack ="\
> +           http://download.berlios.de/mx25patches/u-boot-v2009.01-imx_4.5.1.patch.bz2;patch=1;name=ubootmx25patch \
> +           "
>  
> +SRC_URI[ubootmx25patch.md5sum] = "32cac5f5241c6eb8ce716f3e0e05de0a"
> +SRC_URI[ubootmx25patch.sha256sum] = "c3ec96dc0f5e9213d20e9e0865a896eb61feed0033d93fd04dcc378b75cf59e7"
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


