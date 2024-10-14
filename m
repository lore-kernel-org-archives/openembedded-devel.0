Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC463D1813D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 18:49:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2660.1728931790696272979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 11:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sZt4s+DC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EInnM7006672;
	Mon, 14 Oct 2024 13:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728931789;
	bh=IkYj6w6o/CjY1TDPTqgy/IeESkudfQg7tqsrODV6hbc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sZt4s+DCs1aJfjuHf0pr7qqNm1CS3G0dieCY/oAcWMhbCwqTxV1L95zpZlKzqdjxn
	 FqvXor7jPPWdHxG/TFsmy6U0Em4CG28OMP69Y75xQVs+Mms8q0khpb6E3fy0YGhjeo
	 rcRmQrEItDITpYnCuHkD9Os6imjj9sQmOuRbivdc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EInn77043316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 13:49:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 13:49:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 13:49:48 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EInmwF016275;
	Mon, 14 Oct 2024 13:49:48 -0500
Message-ID: <8c849c7a-49c8-4b67-a9de-3c709c5a58eb@ti.com>
Date: Mon, 14 Oct 2024 13:49:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] kernel-selftest: Update to allow
 for turning on all tests
To: <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20241011142416.12363-1-reatmon@ti.com>
 <17FD6C12638AFCCF.2207@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17FD6C12638AFCCF.2207@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 18:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112911


Now that the master version of this patch has been accepted and 
promoted, can this scarthgap version be looked at?  Thanks.


On 10/11/2024 9:24 AM, Ryan Eatmon via lists.openembedded.org wrote:
> In testing adding in more kernel-selftests there were a number of issues
> that arose that require changes that are more appropriate for the main
> recipe and not a bbappend.
> 
> 1) Stop looping over TEST_LIST ourselves and use the TARGETS="" provided
> by the kernel-sefltest Makefiles.  This correctly sets up various
> variables that the selftest Makefiles all need.  Also, do_install
> becomes cleaner because the main Makefile already installs the list of
> tests and the top level script.
> 
> 2) Add DEBUG_PREFIX_MAP to the CC setting to avoid some "buildpaths" QA
> errors.
> 
> 3) Add two INSANE_SKIPS for "already-stripped" and "ldflags".  Some of
> the selftest Makefiles are adding flags to their compiles that basically
> break the above checks.  Since these compiles are not really meant as
> user level tools and instead testing, it should be ok to just always set
> INSANE_SKIP for these two.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../kernel-selftest/kernel-selftest.bb        | 26 +++++++------------
>   1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 01f185adb..a070ceab5 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -55,7 +55,7 @@ TEST_LIST = "\
>   EXTRA_OEMAKE = '\
>       CROSS_COMPILE=${TARGET_PREFIX} \
>       ARCH=${ARCH} \
> -    CC="${CC}" \
> +    CC="${CC} ${DEBUG_PREFIX_MAP}" \
>       AR="${AR}" \
>       LD="${LD}" \
>       CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
> @@ -96,25 +96,13 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
>       sed -i -e '/mrecord-mcount/d' ${S}/Makefile
>       sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
>       sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
> -    for i in ${TEST_LIST}
> -    do
> -        oe_runmake -C ${S}/tools/testing/selftests/${i}
> -    done
> +    oe_runmake -C ${S}/tools/testing/selftests TARGETS="${TEST_LIST}"
>   }
>   
>   do_install() {
> -    for i in ${TEST_LIST}
> -    do
> -        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
> -        # Install kselftest-list.txt that required by kselftest runner.
> -        oe_runmake -s --no-print-directory COLLECTION=${i} -C ${S}/tools/testing/selftests/${i} emit_tests \
> -            >> ${D}/usr/kernel-selftest/kselftest-list.txt
> -    done
> -    # Install kselftest runner.
> -    install -m 0755 ${S}/tools/testing/selftests/run_kselftest.sh ${D}/usr/kernel-selftest/
> -    cp -R --no-dereference --preserve=mode,links -v ${S}/tools/testing/selftests/kselftest ${D}/usr/kernel-selftest/
> +    oe_runmake -C ${S}/tools/testing/selftests INSTALL_PATH=${D}/usr/kernel-selftest TARGETS="${TEST_LIST}" install
>       if [ -e ${D}/usr/kernel-selftest/bpf/test_offload.py ]; then
> -	sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
> +        sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
>       fi
>       chown root:root  -R ${D}/usr/kernel-selftest
>   }
> @@ -158,6 +146,12 @@ RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
>   
>   INSANE_SKIP:${PN} += "libdir"
>   
> +# A few of the selftests set compile flags that trip up the "ldflags" and
> +# "already-stripped" QA checks.  As this is mainly a testing package and
> +# not really meant for user level execution, disable these two checks.
> +INSANE_SKIP:${PN} += "ldflags"
> +INSANE_SKIP:${PN} += "already-stripped"
> +
>   SECURITY_CFLAGS = ""
>   COMPATIBLE_HOST:libc-musl = 'null'
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112803): https://lists.openembedded.org/g/openembedded-devel/message/112803
> Mute This Topic: https://lists.openembedded.org/mt/108949496/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

