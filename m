Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 84B3074D03
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 23:42:22 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j205-v6so6816182oib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 16:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Tc9hUkzXoouJVj2uAdpod+VdsDBK861lDg7EMs4g/7U=;
	b=fnW2jp3XqX1jgMagxqSIYqZk7QGsbpwFBLsUX/82VlYWuV7QJX0gPR6b8a/PQ9eTXJ
	3j8NU1/Zb5GpcT9Ti4ZX+Ee8QqMS8uifyunjYHLDK9d421nvMo52ZQddLak4FGLS6mtg
	7iMgaZC/Fy6Gpo7BB+aETMPR5GPAWtIyECVlybPUi393d7gyfgp7WWI2YHAikFcRHfax
	UFZzRDpn/extjj9n0YgQ2nSpUGlBhVqBWHDAggBj2b2UuzFI4/MUxegojY6SxLBF3FHd
	UpU40ZfenQhhGXA8AHIOnyiwNGozpQx/YqSULSQlTo14PNPh/WM8tuwk0G2BEj/Wd6lL
	NvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=Tc9hUkzXoouJVj2uAdpod+VdsDBK861lDg7EMs4g/7U=;
	b=eGPEMIPc6F7ZNC8FYwGA86d1fm3d/YKC6PeFtqGc1GLBQNFgeskxhF2tClyymEXPZr
	n8hULW7MYXaSKQHi7fSGOCw4+gfgfAAxKLh/FOTY6ule14dJn0S+BP0epita/lail5rT
	OTJn5ZPj5m6KTOEkATSu/ifNncGUQymD8irbOZ5Fq1Nd+nbj8wL34/QMYTfTenB672ce
	lh/mS/R/vzM6WqnB6KABpIg10mNU35eTKB0JAsE3GW/is/duUhj319YwaJidC3GUUgPN
	/pxLHaQVL4mMZ6MJTCgzN6D5sqUsvBY3a4DLC6e3wdlacjzQvjlSw7vBETe+JwPNWoJl
	H9MA==
X-Gm-Message-State: AOUpUlHZkwzF/2HMb3NnE4uo+PdUaZX5Pp73qQwgrkDQG/V8AWuvnYpf
	VqQQGGW0XnpPUanZbUXVgRAJwC1u
X-Google-Smtp-Source: AA+uWPxKrPEDl4E62Xfb5Iyi0G+J2B0niaun48hsZfE0eh5Hgp1F7vqTLyEtBLs5ms75okqISTlmsA==
X-Received: by 2002:aca:4455:: with SMTP id
	r82-v6mr5397126oia.260.1533771743301; 
	Wed, 08 Aug 2018 16:42:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7d5f:b84e:a37e:2b6c?
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	19-v6sm2656092ois.13.2018.08.08.16.42.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 16:42:22 -0700 (PDT)
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
	openembedded-devel@lists.openembedded.org
References: <20180808202411.9293-1-maciej.pijanowski@3mdeb.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1d866228-6e17-a8a9-c7ff-c997a82d579e@gmail.com>
Date: Wed, 8 Aug 2018 16:42:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180808202411.9293-1-maciej.pijanowski@3mdeb.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-yocto][PATCH] meta-yocto-bsp: replace deprecated "SERIAL_CONSOLE"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 23:42:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 08/08/2018 01:24 PM, Maciej Pijanowski wrote:
> SERIAL_CONSOLE was already deprecated in 2013, yet still some
> machine configuration files were using it. This patch replaces
> it with SERIAL_CONSOLES, which is the successor.
>
> The documentation seems to be already up do date.
> beaglebone-yocto.conf in the bsp-guide already uses
> SERIAL_CONSOLES. The ref-manual redirects from SERIAL_CONSOLE
> to SERIAL_CONSOLES.
>
> [YOCTO #12653]

Wrong mailing list. try poky@yoctoproject.org
<mailto:poky@yoctoproject.org> as this it specific to the Poky release.

- armin


>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 2 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf       | 2 +-
>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> index ae682a47d31b..44c7a1af8d97 100644
> --- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> +++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> @@ -20,7 +20,7 @@ WKS_FILE ?= "beaglebone-yocto.wks"
>  IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
>  do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
>  
> -SERIAL_CONSOLE = "115200 ttyO0"
> +SERIAL_CONSOLES = "115200;ttyO0"
>  
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "4.15%"
> diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
> index 61f2145fd59a..a3eeebf2f66a 100644
> --- a/meta-yocto-bsp/conf/machine/edgerouter.conf
> +++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
> @@ -13,7 +13,7 @@ KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "4.15%"
>  
> -SERIAL_CONSOLE = "115200 ttyS0"
> +SERIAL_CONSOLES = "115200;ttyS0"
>  USE_VT ?= "0"
>  
>  MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
> diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> index eae8157eab4a..441987a78e92 100644
> --- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> +++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> @@ -1,5 +1,5 @@
>  #@TYPE: Machine
> -#@DESCRIPTION: Machine configuration for running 
> +#@DESCRIPTION: Machine configuration for running
>  
>  TARGET_FPU = ""
>  
> @@ -10,7 +10,7 @@ KERNEL_IMAGETYPE = "uImage"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  UBOOT_MACHINE = "MPC8315ERDB_config"
>  
> -SERIAL_CONSOLE = "115200 ttyS0"
> +SERIAL_CONSOLES = "115200;ttyS0"
>  
>  MACHINE_FEATURES = "keyboard pci ext2 ext3 serial"
>  


