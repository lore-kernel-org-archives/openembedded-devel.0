Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F81CD80DE
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:11:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.92681.1696947113612027864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ko8hqTUv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39AEBoCq057245;
	Tue, 10 Oct 2023 09:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696947110;
	bh=uYbAuhS7odPHqMB1Wx8E8Z0LILTCFdsFurpjgG6KvAs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Ko8hqTUvVloN4S/WD8/sMEr5LURY1mXzn2pDLJUrarVH7/yddTuZeE9wIfvxWZBiz
	 CVcX1tBv4wjFAndPX0q/34WUkZeNSuMCpxpmV6V8jNhS1m5F4fMRgq4VIM6sMmiLyd
	 hAnogzGfOGywl6Bvsxv2/1RxmmK/LvR/NlKTDbwI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39AEBoHo085775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Oct 2023 09:11:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Oct 2023 09:11:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Oct 2023 09:11:49 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39AEBnIE125460;
	Tue, 10 Oct 2023 09:11:49 -0500
Message-ID: <074cb098-5f31-47bd-85a9-f4db89a65659@ti.com>
Date: Tue, 10 Oct 2023 09:11:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] kernel-selftest: Build bpf tests again
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20231005213631.390714-1-raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231005213631.390714-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 14:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105407


Does this patch introduce a requirement on clang?  We are seeing build 
failures in our nightly master builds on kernel-selftst with clang not 
being found.


On 10/5/2023 4:36 PM, Khem Raj wrote:
> Fix run-ptest script to run all compiled selftests
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../kernel-selftest/kernel-selftest.bb        | 34 ++++++++++++++-----
>   .../kernel-selftest/kernel-selftest/run-ptest | 10 ++----
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 4d6e0e3717..8fab1df391 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
>   # we will append other kernel selftest in the future
>   # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
>   # if you have older kernel than that you need to remove it from PACKAGECONFIG
> -PACKAGECONFIG ??= "firmware"
> +PACKAGECONFIG ??= "firmware bpf"
>   PACKAGECONFIG:remove:x86 = "bpf"
>   PACKAGECONFIG:remove:arm = "bpf vm"
>   # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
> @@ -31,30 +31,39 @@ PACKAGECONFIG:remove:qemumips = "bpf vm"
>   PACKAGECONFIG:remove:riscv64 = "vm"
>   PACKAGECONFIG:remove:riscv32 = "vm"
>   
> -PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
> +PACKAGECONFIG[bpf] = ",,elfutils elfutils-native libcap libcap-ng rsync-native python3-docutils-native,"
>   PACKAGECONFIG[firmware] = ",,libcap, bash"
>   PACKAGECONFIG[vm] = ",,libcap libhugetlbfs,libgcc bash"
>   
>   do_patch[depends] += "virtual/kernel:do_shared_workdir"
> +do_compile[depends] += "virtual/kernel:do_install"
>   
> -inherit linux-kernel-base kernel-arch ptest
> +inherit linux-kernel-base module-base kernel-arch ptest siteinfo
>   
>   S = "${WORKDIR}/${BP}"
>   
> +DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
> +
>   TEST_LIST = "\
>       ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
>       rtc \
>   "
> -
>   EXTRA_OEMAKE = '\
>       CROSS_COMPILE=${TARGET_PREFIX} \
>       ARCH=${ARCH} \
>       CC="${CC}" \
> -    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS}" \
>       AR="${AR}" \
>       LD="${LD}" \
> +    LLVM=1 \
> +    CONFIG_CC_IS_GCC= \
> +    CONFIG_CC_IS_CLANG=y \
> +    CONFIG_CC_IMPLICIT_FALLTHROUGH= \
> +    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
> +    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
> +    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
>       DESTDIR="${D}" \
>       MACHINE="${ARCH}" \
> +    V=1 \
>   '
>   
>   KERNEL_SELFTEST_SRC ?= "Makefile \
> @@ -66,7 +75,6 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
>                           arch \
>                           LICENSES \
>   "
> -
>   do_compile() {
>       if [ ${@bb.utils.contains('PACKAGECONFIG', 'bpf', 'True', 'False', d)} = 'True' ]; then
>       if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True', 'False', d)} = 'False' ]; then
> @@ -74,7 +82,17 @@ do_compile() {
>   either install it and add it to HOSTTOOLS, or add clang-native from meta-clang to dependency"
>       fi
>       fi
> +    mkdir -p ${S}/include/config ${S}/bits
> +    touch ${S}/include/config/auto.conf
> +    if [ "${SITEINFO_BITS}" != "32" ]; then
> +        for f in long-double endianness floatn struct_rwlock; do
> +            cp ${RECIPE_SYSROOT}${includedir}/bits/$f-64.h ${S}/bits/$f-32.h
> +        done
> +    fi
>       oe_runmake -C ${S} headers
> +    sed -i -e 's|^all: docs|all:|' ${S}/tools/testing/selftests/bpf/Makefile
> +    sed -i -e '/mrecord-mcount/d' ${S}/Makefile
> +    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
>       for i in ${TEST_LIST}
>       do
>           oe_runmake -C ${S}/tools/testing/selftests/${i}
> @@ -133,9 +151,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>   FILES:${PN} += "/usr/kernel-selftest"
>   
> -RDEPENDS:${PN} += "python3 perl"
> +RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
>   # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
> -INSANE_SKIP:${PN} += "ldflags"
> +INSANE_SKIP:${PN} += "ldflags libdir"
>   
>   SECURITY_CFLAGS = ""
>   COMPATIBLE_HOST:libc-musl = 'null'
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> index d40b9576d8..0903d097e1 100755
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> @@ -1,11 +1,7 @@
>   #!/bin/sh
> -export PATH=$PATH:/usr/kernel-selftest/bpf
> -
> -# test_align
> -test_align | grep "12 pass" &> /dev/null
> +/usr/kernel-selftest/run_kselftest.sh -s
>   if [ $? == 0 ]; then
> -    echo "[PASS]: test_align"
> +    echo "PASS: kernel-selftest"
>   else
> -    echo "[FAIL]: test_align"
> +    echo "[FAIL]: kernel-selftest"
>   fi
> -
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105362): https://lists.openembedded.org/g/openembedded-devel/message/105362
> Mute This Topic: https://lists.openembedded.org/mt/101786204/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

