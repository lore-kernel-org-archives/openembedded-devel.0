Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD74CD6E77
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:23:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.17824.1697034230134002545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 07:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hIk6fWID;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39BENlwA114723;
	Wed, 11 Oct 2023 09:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697034227;
	bh=z+73vUptO13CNmxr4HVWAp2Gs6AR21j9ESeOKNaR+WE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hIk6fWIDaVgzhFvEl2kl6WqKsA6NHxHW7TMqbji7n5nsB8GIGwE0ChIHtGiS9+SSl
	 kO5+6Y1s9np+aauDv6jdUjtsiYyTTbHB7TzR+70OqJhaZar+Yd7xKUauwVrcK/4rax
	 kuyGX17hvlJ6NM6XiR3xgzJK/UOp4GimQFlpo/gQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39BENlaS019918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Oct 2023 09:23:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Oct 2023 09:23:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Oct 2023 09:23:47 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39BENkKQ015497;
	Wed, 11 Oct 2023 09:23:47 -0500
Message-ID: <acd75534-fa71-4b49-9903-b8d691ca6701@ti.com>
Date: Wed, 11 Oct 2023 09:23:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] kernel-selftest: Use clang options when
 clang is available
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20231010185238.2842132-1-raj.khem@gmail.com>
 <20231010185238.2842132-2-raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231010185238.2842132-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 14:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105424


Thank you.  This fixed our nightly master builds.  Much appreciated.


On 10/10/2023 1:52 PM, Khem Raj wrote:
> Enable bpf only with clang
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../kernel-selftest/kernel-selftest.bb           | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 2e5680d775..291a83aaad 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -18,7 +18,9 @@ SRC_URI += "file://run-ptest \
>   # we will append other kernel selftest in the future
>   # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
>   # if you have older kernel than that you need to remove it from PACKAGECONFIG
> -PACKAGECONFIG ??= "firmware bpf"
> +PACKAGECONFIG ??= "firmware"
> +# bpf needs working clang compiler anyway
> +PACKAGECONFIG:append:toolchain-clang:x86-64 = " bpf"
>   PACKAGECONFIG:remove:x86 = "bpf"
>   PACKAGECONFIG:remove:arm = "bpf vm"
>   # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
> @@ -54,17 +56,15 @@ EXTRA_OEMAKE = '\
>       CC="${CC}" \
>       AR="${AR}" \
>       LD="${LD}" \
> -    LLVM=1 \
> -    CONFIG_CC_IS_GCC= \
> -    CONFIG_CC_IS_CLANG=y \
> -    CONFIG_CC_IMPLICIT_FALLTHROUGH= \
>       CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
> -    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
> -    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
>       DESTDIR="${D}" \
> -    MACHINE="${ARCH}" \
>       V=1 \
>   '
> +EXTRA_OEMAKE:append:toolchain-clang = "\
> +    LLVM=1 CONFIG_CC_IS_GCC= CONFIG_CC_IS_CLANG=y CONFIG_CC_IMPLICIT_FALLTHROUGH= \
> +    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
> +    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
> +"
>   
>   KERNEL_SELFTEST_SRC ?= "Makefile \
>                           include \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105415): https://lists.openembedded.org/g/openembedded-devel/message/105415
> Mute This Topic: https://lists.openembedded.org/mt/101881727/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

