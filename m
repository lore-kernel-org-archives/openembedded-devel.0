Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id ECDBF79D6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2019 23:06:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w4so4416959plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2019 15:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=73u40mAYDfxUoMHkKhlhEhy1KM/aOVzGv1p4hOfqGBI=;
	b=ACO/8FzgJqieYeNMpJrr4k8VgsNEb+RpAHtSq+TbTMFj7Iy36wSRfVnvHyXPUcc8Cx
	n+rIwF6zbzvsiJc8053Ae9kxA72E36OV0KOq4JjRTYrLASNNfTgsLh+6xf18UaowqEHP
	tObVeDZ9RrHgXmDmDBdA4bOY1E3I1kRQVSgS4m3ou2UMAKIsnYio/9nob8C88Mo0dfIm
	DqSF/W62wzvybk708HBa5x5LK0RzyQ0u+rlujBW7zQq+N9FY6GpLFNvVbJ0LvD5tjAO3
	6zDaI3ezNP+kp8FQd6aGbAMV/JshizaJExiWaZmeZHgPI4lZecpkyosKe/42SBQ+tOm9
	1NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=73u40mAYDfxUoMHkKhlhEhy1KM/aOVzGv1p4hOfqGBI=;
	b=E5iGlww68lStxesUz4g879chPJGihbggmdaNlHrfMGSSu5l2Yjq4dvzHBU+7LC12rj
	GDPrGhUvs/QemgzEBN6ELippGzdekz3L4lDSEcUG8FsOnUFAgRlgi/Kt23G/qO8y86RY
	HBW3GoFBz06gPkSwt/ogOIJasUi3JDZkgdX0b78SDIzgnkdx4JKfnBDkGwUsTr8anglH
	X+lZRM0ftJ0flij7w54R2N2QygjyIcGRtyouMIfDMpf9Ot7NquU/VKTNw4Y/+lOZGRKo
	wbflZis0ndAIJC8DKo9SIfAvI/UBEJeppoqtUjy49YvdPr+NJ0+Z+fxJbPEjCRv7tRdN
	+T8Q==
X-Gm-Message-State: AHQUAuZHidDsjd/wO0YI/ZQZYH92tkuF4lroXyHQ9YWEwGpySfzCwg9W
	jQMOSSU8R9CGcOORM65xx+CWKtJYa9M=
X-Google-Smtp-Source: AHgI3IYAjTeY2QsK0grRazOc++4jppkqSuColoyoe1pACsEwHLbbcgDP9psaVCPWdPkBappRolr5GA==
X-Received: by 2002:a17:902:8c81:: with SMTP id
	t1mr32266802plo.107.1549839980587; 
	Sun, 10 Feb 2019 15:06:20 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:e546:3273:94f7:9238?
	([2601:202:4180:c33:e546:3273:94f7:9238])
	by smtp.gmail.com with ESMTPSA id
	p64sm13541925pfi.56.2019.02.10.15.06.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Feb 2019 15:06:19 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20190209185758.19856-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5c16f770-f31d-b3a7-95d1-ab668b17a056@gmail.com>
Date: Sun, 10 Feb 2019 15:06:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190209185758.19856-1-raj.khem@gmail.com>
Subject: Re: [PATCH V2] image_types.bbclass: Set 70% RAM memory usage limit and -T for xz
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
X-List-Received-Date: Sun, 10 Feb 2019 23:06:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/9/19 10:57 AM, Khem Raj wrote:
> when building with opkg backend and huge packages e.g. chromium/llvm all
> going in parallel, memory pressure causes xz to catapult with
>
> do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
>
> since there are many tasks going on in parallel, xz adds to memory pressure
> and it wants it all, put an upper limit for memory xz can use
>
> We add a variable XZ_MAXRAM with 30% of RAM limit and can be customized
> if builders have more memory one can set it like
err, wrong mailing list.. I think you self corrected : )

- armin
> XZ_DEFAULTS = "-M 0 -T 0"
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2: Consider all locations of xz use
>
>  meta/classes/image_types.bbclass       | 9 ++++-----
>  meta/classes/package_ipk.bbclass       | 2 +-
>  meta/classes/populate_sdk_base.bbclass | 2 +-
>  meta/conf/bitbake.conf                 | 3 +++
>  4 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 70bd315306..b12420310f 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -56,7 +56,6 @@ def imagetypes_getdepends(d):
>  
>  XZ_COMPRESSION_LEVEL ?= "-3"
>  XZ_INTEGRITY_CHECK ?= "crc32"
> -XZ_THREADS ?= "-T 0"
>  
>  ZIP_COMPRESSION_LEVEL ?= "-9"
>  
> @@ -152,12 +151,12 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
>  multiubi_mkfs() {
>  	local mkubifs_args="$1"
>  	local ubinize_args="$2"
> -    
> +
>          # Added prompt error message for ubi and ubifs image creation.
>          if [ -z "$mkubifs_args" ] || [ -z "$ubinize_args" ]; then
>              bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
>          fi
> -    
> +
>  	if [ -z "$3" ]; then
>  		local vname=""
>  	else
> @@ -284,7 +283,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> +CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -317,7 +316,7 @@ CONVERSION_DEPENDS_qcow2 = "qemu-native"
>  RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
>  RUNNABLE_MACHINE_PATTERNS ?= "qemu"
>  
> -DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
> +DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>  
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 508b7dcaff..d1b317b42b 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>  
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "--threads 0"'
> +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
>  
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 80fa443e4c..ebc30d39b3 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -226,7 +226,7 @@ fakeroot tar_sdk() {
>  	# Package it up
>  	mkdir -p ${SDKDEPLOYDIR}
>  	cd ${SDK_OUTPUT}/${SDKPATH}
> -	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
> +	tar ${SDKTAROPTS} -cf - . | xz ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>  }
>  
>  TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9452d5ac4f..3f5d84d348 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -791,6 +791,9 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>  # Default to setting automatically based on cpu count
>  PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
>  
> +# Default parallelism and resource usage for xz
> +XZ_DEFAULTS ?= "--memlimit=30% --threads=${BB_NUMBER_THREADS}"
> +
>  ##################################################################
>  # Magic Cookie for SANITY CHECK
>  ##################################################################


