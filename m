Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5ACD58B18
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 07:49:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24871.1773560951621473236
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 00:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U39cydki;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485345e1013so32788495e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773560950; x=1774165750; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/vrRJ2kGtOO82v82io0cSY0odab93VrPZC+b/o8UdBo=;
        b=U39cydkiLSpQBArpP/NbMfbuJz5bVT7qB6qDR8xnQaScLsJHxoHu1LGRsb46BNHNeY
         ZwueCVtyKOWIno3U69GKYHtp3AC4Kzb81t+OjtR3dVjpp5/7fY2GTAfLIdyw2rWSBrku
         lfaIdlb/4pAktAVXZAm0Rh6LsqRH99kfUd076Wq7a9XpVjhHusAMxEIMjmxL+oJCbPNf
         JJ/c+tveIMcDdfealLj5jBQXMUED0R1xGR/G35t8Pz8dMWbETrevzrMjc1WgifYkR6Ro
         TDFGmC6Yn5CQ/wlPhws01t+v5mSsr0HnVHGWMNSbj8g4dfQAij6y5gNkFIzt9vxHQDCP
         m5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773560950; x=1774165750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vrRJ2kGtOO82v82io0cSY0odab93VrPZC+b/o8UdBo=;
        b=Y2uN2K/ZDkXBl7VE5FznLjW1wxvfd0BWOxBwjADokDtvMpsZjN/0vrvE8/dqHcnWfo
         m88qXmm6RyoS5/axGfMGNiKwTj8DSJlJkf48hA9gEOcFKDsXlAKTc6UA2WrQqk/N6f4N
         B+mO7BjS435ShzU1m+IggUgGVM7KfTFQQPMjxSJggCWCmA87dzVWGuJpk2ThrNvmHMzb
         IEqPy7Yrj40VRI7zZP6a+1ZEdAZXPMN2hNYt568D+qEtTB5OKkJeNjIlSywFvSTvPC9O
         A1JJeOr1mYjliIumepbyq1UNOwhpPYkaShzgyWHnlFi2j6o9xW+mKnl2zNNK6tjOAjGt
         m2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxJGhRIPUjRpgqeEpA/4iWDaAJXyQ/dX+/VgzJft/uFHQEnwy9OQYsTvpmz1w2gmXNqaq8zX4+ax+Dx5qT04Lemnk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBPNaTeqLUtNkPdJeBTT4TXXTOT4Xnny94jAfjYKJmKxNXBuET
	GWJjjCxxyGA7om81IBZ8160NUXhHjqGK84fgGD6NKbZrX9P9MQ+g/oEn3fpcRw==
X-Gm-Gg: ATEYQzxWakGpT8TOrDxIXD/MjTID7veRkcrGQFVeCTbBM9t6LkaHquKmNJYi1xV/sac
	x2zKJAVuYkXffrLeKsnl6WKDSe9QTxDBn2yyWJ8tcSSg25qzJCOaf4RarCYLy5FCFYojnWTnCLY
	iDuuJleGMROAsTnAMQ0Pwv7ethGzFHTL8eN6mYpCCpfDXVSBiaUroE28BlLI8vmiOiIvl6cYLX2
	Pmne/lToJEPFCKMBeqpPgMpMJkY9UHxtwUExx4J4lp8XYGmJJc/cPeQuSDLyNnpp5qBx0ZldGUj
	HD3QUFK1OhcxuzkhD4Iu+QTeNUtCnGgeeQtK7YmbRMh/hVJxIP5m6Y2W79Wj2o70ugmsEgS8kAa
	7/6U93vEZOhELTM3l8jqfpHjHiqMescdkj2/pTCI42wfE68zSdn/khDN+Br8OxhydJ8wkckY7DX
	fMDzupIzr13/KPZcQNrvcTRVJcwLRaq10=
X-Received: by 2002:a05:600c:1907:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48555a5689amr142247595e9.0.1773560949633;
        Sun, 15 Mar 2026 00:49:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm439699545e9.12.2026.03.15.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 00:49:09 -0700 (PDT)
Message-ID: <5936c190-5ec4-478f-8cf1-e27c209b0979@gmail.com>
Date: Sun, 15 Mar 2026 08:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] rtla: add recipe for real-time linux
 analysis tool
To: peter@berginkonsult.se, openembedded-devel@lists.openembedded.org
References: <20260306113922.3319380-1-peter@berginkonsult.se>
 <20260306113922.3319380-2-peter@berginkonsult.se>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260306113922.3319380-2-peter@berginkonsult.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 07:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125218

When built against musl, this fails with the following error:
https://gist.github.com/OldManYellsAtCloud/3a96bf193bad86c8cd67ab30faa38d3a


On 3/6/26 12:39, Peter Bergin via lists.openembedded.org wrote:
> rtla source code is present in the kernel source tree at tools/tracing/rtla.
> There is another build option for rtla to enable bpf bindings, this was
> not a quick one to get working and left as a future improvement.
> 
> Makefile for rtla has evolved in newer kernels (v6.9). Some fixes needed for
> support with older kernels. This commit was tested against 6.18 and 6.8.
> 
> Also add rtla to packagegroup-meta-oe-benchmarks.
> 
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  meta-oe/recipes-kernel/rtla/rtla.bb           | 47 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/rtla/rtla.bb
> 
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 9fd7af6c08..0cbe3964c4 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -68,6 +68,7 @@ RDEPENDS:packagegroup-meta-oe-benchmarks = "\
>      nbench-byte \
>      phoronix-test-suite \
>      qperf \
> +    rtla \
>      s-suite \
>      stressapptest \
>      tinymembench \
> diff --git a/meta-oe/recipes-kernel/rtla/rtla.bb b/meta-oe/recipes-kernel/rtla/rtla.bb
> new file mode 100644
> index 0000000000..af40fd5bd2
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/rtla/rtla.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "Real-Time Linux Analysis tool"
> +LICENSE = "GPL-2.0-only"
> +
> +DEPENDS = "libtraceevent libtracefs"
> +PROVIDES = "virtual/rtla"
> +
> +B = "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit kernelsrc kernel-arch pkgconfig
> +
> +do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[cpupower] = ",,cpupower"
> +
> +EXTRA_OEMAKE = "V=1 -C ${S}/tools/tracing/rtla O=${B} CROSS=${TARGET_PREFIX} \
> +    CC="${CC} ${DEBUG_PREFIX_MAP}" LD="${LD}" AR=${AR} ARCH=${ARCH} \
> +    BUILD_BPF_SKEL=0"
> +
> +do_compile() {
> +    # Older kernels (before 6.9) use a standalone rtla Makefile that does not honor
> +    # O= so outputs land in the kernel source tree (shared workdir). Remove
> +    # build output to make sure it is rebuilt. For newer kernels this wil be a no-op.
> +    rm -f ${S}/tools/tracing/rtla/rtla
> +    rm -f ${S}/tools/tracing/rtla/src/*.o
> +
> +    # Older kernels need additional variable EXTRA_LDFLAGS to pick up correct linker options.
> +    export EXTRA_LDFLAGS="${LDFLAGS}"
> +    oe_runmake
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +
> +    # Older kernels (before 6.9) use a standalone rtla Makefile that does not honor
> +    # O= for the final binary, so it ends up in the kernel source tree.
> +    rtla_bin="${B}/rtla"
> +    [ -f "${rtla_bin}" ] || rtla_bin="${S}/tools/tracing/rtla/rtla"
> +    install -m 755 "${rtla_bin}" ${D}${bindir}/rtla
> +
> +    # rtla, osnoise, hwnoise, and timerlat are all the same binary
> +    ln -s rtla ${D}${bindir}/osnoise
> +    ln -s rtla ${D}${bindir}/hwnoise
> +    ln -s rtla ${D}${bindir}/timerlat
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124904): https://lists.openembedded.org/g/openembedded-devel/message/124904
> Mute This Topic: https://lists.openembedded.org/mt/118168854/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


