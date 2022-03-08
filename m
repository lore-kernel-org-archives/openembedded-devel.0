Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D18C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:25:58 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.10218.1646756757166130984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=cmuA8t8l;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id 85so7166366qkm.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sobc5KpkMXo+5SrF0W2BkK4hb+SbtXOQIY2LUFYdq9I=;
        b=cmuA8t8lXyJz4P5KKvYBVg3VzhLnjGUBRNFbu+vBYu2PuT5ggUvAztBEBuTHLqwxdw
         LxpClhjP3MwU9qS8Wv5Yv/qLGcTGgo1kIa6SjCsIfbONSzZx32LWyMRLZ0Mm3R+KKMrn
         RWrpExo+WinnC+wbeUEFoY+RngQOzLxo9tltaSaM2N21oHd5CybLwnQRvfkuFnVQizJ8
         /gxADniVIuwtRjayyQZTPN9HHssZQR8IQAHL3DWqwR2pcshVXeLaLq6puOInbP67sbfT
         /zYkU8h4Rj2Owad7EA5ozu9ToAUDfSu2+Xq6JGYvOKh4oSvAfqzs73XU5XzW6q4f602S
         Y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sobc5KpkMXo+5SrF0W2BkK4hb+SbtXOQIY2LUFYdq9I=;
        b=ibNgUT1IzRmC3YYJjnaAHUMfaUwuVW4+05rxf5Sip/h9Wothhl5gKzxOF5pZrziMm9
         Mvh4NSbJH6ogqYjb4WKr2IQCL/A3/UAJF90iiyH3RjAG/WzYt86vRiQy3tijHl1XBQzL
         A7J5fhV+Ajab7ejNjezet3Uqh3x8yIoewOzQo0fSxrbGd6bhVR2FoxWs8118KqQVuXVK
         es4JeVSjVf2l1qgjODrt6g1Kx8kBS7zyIhB3fMCstC34yDNwlg9WfP/FdzU5ZEMhcEFn
         vrs0ZaF2ekEAt1D87LX4qInfUtnrOhF4iXRvzlzZ0qKf575pOWmJXtmeCkF9QeVkeBiy
         bmlg==
X-Gm-Message-State: AOAM531mlHEk+0xkH/Kij4WumRZQBqxtCOecWf8LkqYZiTDInp+NhyLP
	fmtQpSnsm9nQYc8O81RGmjs/Iw==
X-Google-Smtp-Source: 
 ABdhPJwzfXsxmi3JFLkMt3ZhrXARebeXV0qY479kOA7ANMEazOOCn6E7SXk5Kp0xxnXBcd2pvotuCQ==
X-Received: by 2002:a37:2ec5:0:b0:5f0:7d12:9fa9 with SMTP id
 u188-20020a372ec5000000b005f07d129fa9mr11071175qkh.623.1646756756061;
        Tue, 08 Mar 2022 08:25:56 -0800 (PST)
Received: from kudzu.us ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 v9-20020a05622a144900b002dfedb4dccasm11040789qtx.66.2022.03.08.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:25:55 -0800 (PST)
Date: Tue, 8 Mar 2022 11:25:53 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>,
	=?iso-8859-1?Q?Eil=EDs_N=ED_Fhlannag=E1in?= <elizabeth.flanagan@huawei.com>,
	yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
Subject: Re: [meta-zephyr][PATCH 2/2] zephyr-kernel: add support for zephyr
 v3.0.0
Message-ID: <YieDkW7w0Si6bucx@kudzu.us>
References: <20220308101200.418279-1-brgl@bgdev.pl>
 <20220308101200.418279-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308101200.418279-2-brgl@bgdev.pl>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 16:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95887

On Tue, Mar 08, 2022 at 11:12:00AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
> 
> Add support for zephyr v3.0.0 and make it the preferred version.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>

Ran this patch through my nightly CI and it comes out green
https://gitlab.com/jonmason00/meta-zephyr/-/pipelines/487255541

Tested-by: Jon Mason <jon.mason@arm.com>

> ---
>  .../zephyr-kernel/zephyr-kernel-src-2.7.1.inc | 16 ++---
>  .../zephyr-kernel/zephyr-kernel-src-3.0.0.inc | 70 +++++++++++++++++++
>  .../zephyr-kernel/zephyr-kernel-src.inc       | 12 ++--
>  3 files changed, 83 insertions(+), 15 deletions(-)
>  create mode 100644 meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
> 
> diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.1.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.1.inc
> index e090234..a2c100c 100644
> --- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.1.inc
> +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.1.inc
> @@ -2,11 +2,11 @@ SRCREV_FORMAT = "default_cmsis"
>  
>  # These repositories are specific to post-2.6 branches
>  
> -SRC_URI += "\
> -    git://github.com/zephyrproject-rtos/hal_telink.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/telink;name=telink \
> -    git://github.com/zephyrproject-rtos/lz4.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/lz4;name=lz4 \
> -    git://github.com/zephyrproject-rtos/tflite-micro.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/tflite-micro;name=tflite-micro \
> -    "
> +SRC_URI += " \
> +    git://github.com/zephyrproject-rtos/mcumgr.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/mcumgr;name=mcumgr \
> +    git://github.com/zephyrproject-rtos/TraceRecorderSource.git;protocol=https;nobranch=1;destsuffix=git/modules/debug/TraceRecorder;name=TraceRecorder \
> +    git://github.com/zephyrproject-rtos/trusted-firmware-m.git;protocol=https;nobranch=1;destsuffix=git/modules/tee/tfm;name=tfm \
> +"
>  
>  #
>  # Generated from:
> @@ -62,8 +62,4 @@ SRCREV_tfm = "c74be3890c9d975976fde1b1a3b2f5742bec34c0"
>  ZEPHYR_BRANCH = "v2.7-branch"
>  PV = "2.7.1+git${SRCPV}"
>  
> -SRC_URI:append = " \
> -    file://0001-cmake-add-yocto-toolchain.patch \
> -    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.patch \
> -    file://dtc.patch \
> -"
> +SRC_URI:append = " file://dtc.patch"
> diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
> new file mode 100644
> index 0000000..64594a0
> --- /dev/null
> +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
> @@ -0,0 +1,70 @@
> +SRCREV_FORMAT = "default_cmsis"
> +
> +#
> +# Generated with:
> +#
> +# #!/usr/bin/python3
> +#
> +# import yaml
> +# import sys
> +#
> +# if __name__ == "__main__":
> +#     with open(sys.argv[1], "r") as fd:
> +#         data = yaml.safe_load(fd)
> +#
> +#         for project in data["manifest"]["projects"]:
> +#             print("SRCREV_{} = \"{}\"".format(project["name"], project["revision"]))
> +#
> +
> +SRCREV_default = "4f8d78ceeb436e82f528511998515f6fc137c6cd"
> +SRCREV_canopennode = "1052dae561497bef901f931ef75e117c9224aecd"
> +SRCREV_civetweb = "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"
> +SRCREV_cmsis = "b0612c97c1401feeb4160add6462c3627fe90fc7"
> +SRCREV_edtt = "1fc2e6f7d2a01a01074456f2ef2ccf1f3df7fac1"
> +SRCREV_fatfs = "09a9d913c61dccbb8ff92d8943b452c614ac5292"
> +SRCREV_fff = "6ce5ba26486e93d5b7696a3e23f0585932c14b16"
> +SRCREV_altera = "23c1c1dd7a0c1cc9a399509d1819375847c95b97"
> +SRCREV_atmel = "9f78f520f6cbb997e5b44fe8ab17dd5bf2448095"
> +SRCREV_cypress = "81a059f21435bc7e315bccd720da5a9b615bbb50"
> +SRCREV_espressif = "bcd7565ffa390d5774dc2fbe71a002faa9a7d082"
> +SRCREV_gigadevice = "242a7f4be7a3136606c7a65169775f7ef85ad444"
> +SRCREV_infineon = "f1fa8241f8786198ba41155413243de36ed878a5"
> +SRCREV_microchip = "870d05e6a64ea9548da6b907058b03c8c9420826"
> +SRCREV_nordic = "a42b016d7c7610489f5f8c79773fedc05ba352ee"
> +SRCREV_nuvoton = "b4d31f33238713a568e23618845702fadd67386f"
> +SRCREV_nxp = "9629f15fd80169cc9669e3fbb1260467c3aeb175"
> +SRCREV_openisa = "40d049f69c50b58ea20473bee14cf93f518bf262"
> +SRCREV_quicklogic = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
> +SRCREV_rpi_pico = "191f5ba46fda49523cdaaef27583d1c875ba2c36"
> +SRCREV_silabs = "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
> +SRCREV_st = "575de9d461aa6f430cf62c58a053675377e700f3"
> +SRCREV_stm32 = "300109f80730cb2477bfcc706a6602b9870336b3"
> +SRCREV_telink = "ffcfd6282aa213f1dc0848dbca6279b098f6b143"
> +SRCREV_ti = "1992a4c536554c4f409c36896eda6abdc414d277"
> +SRCREV_xtensa = "0e577021bb66e644afd067cd9f7c71ab11b62b3d"
> +SRCREV_libmetal = "f237c9d420a51cc43bc37d744e41191ad613f348"
> +SRCREV_littlefs = "33509ed9c3d369cdb9d909cd40c5eea8f64a902c"
> +SRCREV_loramac-node = "12019623bbad9eb54fe51066847a7cbd4b4eac57"
> +SRCREV_lvgl = "783c1f78c8e39751fe89d0883c8bce7336f55e94"
> +SRCREV_lz4 = "8e303c264fc21c2116dc612658003a22e933124d"
> +SRCREV_mbedtls = "3e3e58a92de76069730c63e0d524f40fea948a61"
> +SRCREV_mcuboot = "89936c338e46f43cb177a8b928cd80b90f3ace8f"
> +SRCREV_mipi-sys-t = "d9da086b11cda494d85f4d8a9829f505c2d5e380"
> +SRCREV_nanopb = "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
> +SRCREV_net-tools = "f49bd1354616fae4093bf36e5eaee43c51a55127"
> +SRCREV_nrf_hw_models = "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"
> +SRCREV_open-amp = "cfd050ff38a9d028dc211690b2ec35971128e45e"
> +SRCREV_openthread = "b7aa7686d3f4e326bd25abc234b209159977c26d"
> +SRCREV_segger = "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
> +SRCREV_sof = "500d77e0ac84ac2c969e0d4b2142cca192e893bc"
> +SRCREV_tflite-micro = "9156d050927012da87079064db59d07f03b8baf6"
> +SRCREV_tinycbor = "40daca97b478989884bffb5226e9ab73ca54b8c4"
> +SRCREV_tinycrypt = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
> +SRCREV_TraceRecorderSource = "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"
> +SRCREV_trusted-firmware-m = "5d32c3e64b3d589548e881eeeeb37d84944c90af"
> +SRCREV_tf-m-tests = "52814181f0fde6d1422fac204d42cde30c62e40e"
> +SRCREV_psa-arch-tests = "0aab24602cbef30f6422e7ef1066a8473073e586"
> +SRCREV_zscilib = "12bfe3f0a9fcbfe3edab7eabc9678b6c62875d34"
> +
> +ZEPHYR_BRANCH = "v3.0-branch"
> +PV = "3.0.0+git${SRCPV}"
> diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> index 60291ed..9a92ddf 100644
> --- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> +++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
> @@ -37,7 +37,6 @@ SRC_URI = "\
>      git://github.com/zephyrproject-rtos/lvgl.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/gui/lvgl;name=lvgl \
>      git://github.com/zephyrproject-rtos/mbedtls.git;protocol=https;nobranch=1;destsuffix=git/modules/crypto/mbedtls;name=mbedtls \
>      git://github.com/zephyrproject-rtos/mcuboot.git;protocol=https;nobranch=1;destsuffix=git/bootloader/mcuboot;name=mcuboot \
> -    git://github.com/zephyrproject-rtos/mcumgr.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/mcumgr;name=mcumgr \
>      git://github.com/zephyrproject-rtos/mipi-sys-t.git;protocol=https;nobranch=1;destsuffix=git/modules/debug/mipi-sys-t;name=mipi-sys-t \
>      git://github.com/zephyrproject-rtos/nanopb.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/nanopb;name=nanopb \
>      git://github.com/zephyrproject-rtos/net-tools.git;protocol=https;nobranch=1;destsuffix=git/tools/net-tools;name=net-tools \
> @@ -48,11 +47,14 @@ SRC_URI = "\
>      git://github.com/zephyrproject-rtos/sof.git;protocol=https;nobranch=1;destsuffix=git/modules/audio/sof;name=sof \
>      git://github.com/zephyrproject-rtos/tinycbor.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/tinycbor;name=tinycbor \
>      git://github.com/zephyrproject-rtos/tinycrypt.git;protocol=https;nobranch=1;destsuffix=git/modules/crypto/tinycrypt;name=tinycrypt \
> -    git://github.com/zephyrproject-rtos/TraceRecorderSource.git;protocol=https;nobranch=1;destsuffix=git/modules/debug/TraceRecorder;name=TraceRecorder \
> -    git://github.com/zephyrproject-rtos/trusted-firmware-m.git;protocol=https;nobranch=1;destsuffix=git/modules/tee/tfm;name=tfm \
> -    "
> +    git://github.com/zephyrproject-rtos/hal_telink.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/telink;name=telink \
> +    git://github.com/zephyrproject-rtos/lz4.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/lz4;name=lz4 \
> +    git://github.com/zephyrproject-rtos/tflite-micro.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/tflite-micro;name=tflite-micro \
> +    file://0001-cmake-add-yocto-toolchain.patch \
> +    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.patch \
> +"
>  S = "${WORKDIR}/git"
>  
>  # Default to a stable version
> -PREFERRED_VERSION_zephyr-kernel ??= "2.7.1"
> +PREFERRED_VERSION_zephyr-kernel ??= "3.0.0"
>  include zephyr-kernel-src-${PREFERRED_VERSION_zephyr-kernel}.inc
> -- 
> 2.30.1
> 
> 

