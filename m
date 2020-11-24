Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.46399.1606183460007823496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 18:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=NwbuDTwk;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E1EC1206C0;
	Tue, 24 Nov 2020 02:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606183459;
	bh=0olXK64/gG9JsjvLU8piUSWR5qITj3u/2JzPZBwU8MQ=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=NwbuDTwklGA8v6pjMc3aYJKBeFlzCbWQBTwNQiIB1P+mec0a2dGGy+CLidRiuezrf
	 Wu/4BeX9iBTKkbCJa4mmN0qQblVE3U5PiXcLPNxlU2B7AKxIMutfC1tDRGYfx9N7fT
	 dzb2Faqmo2WU6PQwiAAOTLS4f/A/mq5qY7TOaUcw=
Subject: Re: [meta-oe][PATCH] packagegroup-meta-oe: Exclude heaptrack for rv32/rv64
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201124005156.2021452-1-raj.khem@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <c2528753-8801-80b9-2e04-e9bb827dd4a1@kernel.org>
Date: Mon, 23 Nov 2020 21:04:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124005156.2021452-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2020 7:51 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Sinan Kaya <okaya@kernel.org>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 3f476d0518..ccbd01aaf0 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -283,7 +283,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
>      xerces-c-samples \
>      xmlrpc-c \
>      yasm \
> -    json-schema-validator \    
> +    json-schema-validator \
>  "
>  RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
>  RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pcimem pmtools"
> @@ -299,8 +299,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "luajit nodejs"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad lshw luajit uftrace"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit uftrace"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit uftrace"
> -RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
> -RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
> +RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
> +RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
>  RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
> @@ -951,4 +951,3 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
>  # rsyslog conflicts with syslog-ng so its not included here
>  
>  EXCLUDE_FROM_WORLD = "1"
> -
> 

Reviewed-by: Sinan Kaya <okaya@kernel.org>

