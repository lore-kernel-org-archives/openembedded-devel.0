Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96361F327B5
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:23:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14698.1776756205256082052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 00:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=abcW8SeA;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891f625344so18729325e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776756204; x=1777361004; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiKNG5EOl1tXfJDar2C9txFgsIrfZXxajF4X2dosDPA=;
        b=abcW8SeA7er7uTySkKHKDCuekjEiAYxMmkhLavbr5FlaeaK+iAz/ZRs2OiGrfpF6z9
         SZnCeA23HpC66dDdFwiZqGXbef4k1AOZtkOH590kptijFXNCOjZNGTiLmqC+R6rQ+N5o
         lQOTmYdV+7BJoqq8YsCOxIlRYK2aRuNwmxPBS+PaNokAMkanJ2CJrpjdVSvsmrxBcGXt
         0EtouR02yEmSTf9lklaDSeTozioJBcVK1vHGFBPtD4VUaNAyqnEVihkTeBvFGXPms4ah
         zHStnsgdSylCQYL2EuJ/aLU8zOwmByCl6Uci4B6KC3I3MUuoem8qNTPZVIY62Ci8NxOc
         fpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756204; x=1777361004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiKNG5EOl1tXfJDar2C9txFgsIrfZXxajF4X2dosDPA=;
        b=nTnTrw2m4YJaY8FPtUM3ODiLkC+8uqnAX8qrxbuSaqxFRth+yHOTF+swSuk30vbsbS
         LCoj7B+2LVOA0OvpwCxp8A8AxWBTjpXS0TEIPohZ7FKnor592sU5xHN06QpVJNDulp2S
         ot6+e1zZlB2pmpSyI3KfpdeeCudfH57NVD+VGAqISt/mD24KKuW6ztmY5DvgDHOhT1HK
         8MzeVCMLfsnXpiUtBlidcmifazOGEffQC75iFou6UluySqn411QW51gl+nrBTpUg3dpN
         UqRKcmezezMHRFOX7VcUsVlc574FHTvvRIsF0exhOpj3lJMe0yd5G+sN7Di8Ssy9XmA8
         6ziA==
X-Forwarded-Encrypted: i=1; AFNElJ9XiX7ZVLq4uqSVU02tgQGnblr0NgjmoQ0MEmVUgrzEAiUvZvCYH7d4mWugjEL8tlDdeIHPmLzPfxA853k2TW+CPjY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/QV6hsI/dnNVX5MSenSYRNjeikCmwYDqfcAr88+7zNmPQRkK0
	iyjk94NwHqoGDYTqDpbL1UTwIYJb46SM+lxNBTAp9dOlGk9frnx7PTbIlerHUw==
X-Gm-Gg: AeBDiesaSxv4E96C1S66DtM+rs1VDT3HjuP9E84t4ba6jr8kg9+oyNFUkeeDqXtcNjk
	eZ6dPqlfeJAagWf/RDrP4r4j6U8XSVpxO1RWEtlwior+8NskTnD3+hxClSxzq32F8GrD/deLaVQ
	VQ8jy3vBwzShzJCYOuUbUNBMxSUOtIi9ojxTPleqxwbRQP5MjLmMs3MWiqMRK+2K6Oljw27/4Yh
	1asE8nFFDuYfPImSPR+l35S3EAR3myLiRoatBog14mJU6aISOjG76SII6UIQ6EruJhBvEXh7L2i
	qMg7ab8gdeJ4xH3c7p9U2rkmoifrb5hfMxsBRWhfrp8qcJEcnEliICGcm/J6xG7Fv8On9bg1vYr
	4KXRmhYCTkD/d9+oP7Wh2ghIfSUYg7gSTzrcvYK3tAGb+Kc1Kwifh8eZK1aElnSXN5gtR9+3YNc
	zjE0HI6Ms2J9uzhHnqgehC/6VLgPfIaUnrPiPwn9ULRw==
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a53cb8949mr36925245e9.14.1776756203175;
        Tue, 21 Apr 2026 00:23:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm158659915e9.13.2026.04.21.00.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:23:22 -0700 (PDT)
Message-ID: <466f9753-b9f1-4ac4-a502-92a23d039e85@gmail.com>
Date: Tue, 21 Apr 2026 09:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][master][PATCH] tbb: Add ptest support
To: zeming.liu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20260421071052.2385333-1-zeming.liu@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260421071052.2385333-1-zeming.liu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 07:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126525



On 4/21/26 09:10, Zeming LIU via lists.openembedded.org wrote:
[...]
> Note:
> The test is executed on qemu with kvm and qemuparams="-m 2048",
> as tbb ptest is thread/mem consuming,  the tbb ptests will fail
> or timeout with limited resource.


You can customize the available memory for each PN in the ptest image
recipe:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/images/meta-oe-image-ptest.bb#n29

Another small note, since I already wrote the above:
"--force-new-ctest-process" flag in the run-ptest script is a no-op:
ctest has been ignoring it since a while:
https://cmake.org/cmake/help/latest/manual/ctest.1.html#cmdoption-ctest-force-new-ctest-process


> 
> Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc     |  1 +
>  meta-oe/recipes-support/tbb/files/run-ptest    |  3 +++
>  meta-oe/recipes-support/tbb/tbb_2022.3.0.bb    | 18 ++++++++++++++++--
>  3 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100755 meta-oe/recipes-support/tbb/files/run-ptest
> 
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index b764d5dd58..528ce16191 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -80,6 +80,7 @@ PTESTS_SLOW_META_OE = "\
>      postgresql \
>      re2 \
>      rocksdb \
> +    tbb \
>  "
>  PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
>  PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
> diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-support/tbb/files/run-ptest
> new file mode 100755
> index 0000000000..8bd5fd1efb
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
> diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> index 440b6e0f46..187c2061e5 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> @@ -15,20 +15,23 @@ PE = "1"
>  BRANCH = "onetbb_2022"
>  SRCREV = "f1862f38f83568d96e814e469ab61f88336cc595"
>  SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
> +           file://run-ptest \
>            "
>  
>  LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
>  
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig ptest
>  
>  # test build fails, error: 'mallinfo mallinfo()' is deprecated
>  EXTRA_OECMAKE += " \
> -                    -DTBB_TEST=OFF \
> +                    -DTBB_TEST=${@bb.utils.contains('PTEST_ENABLED', '1', 'ON', 'OFF', d)} \
>                      -DCMAKE_BUILD_TYPE=Release \
>                      -DTBB_STRICT=OFF \
>                      -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
>                  "
>  
> +RDEPENDS:${PN}-ptest += "cmake"
> +
>  # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
>  # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules
>  # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-264bc2.o
> @@ -60,5 +63,16 @@ do_install:append:class-target() {
>      sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/TBB/TBBTargets.cmake
>  }
>  
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    install ${B}/test/CTestTestfile.cmake ${D}${PTEST_PATH}/
> +    cp -rf ${B}/gnu* ${D}${PTEST_PATH}
> +    rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
> +    rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
> +    sed -i -e s#${S}#${PTEST_PATH}#g \
> +           -e s#${B}#${PTEST_PATH}#g \
> +            ${D}${PTEST_PATH}/CTestTestfile.cmake
> +}
> +
>  
>  BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126524): https://lists.openembedded.org/g/openembedded-devel/message/126524
> Mute This Topic: https://lists.openembedded.org/mt/118934237/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


