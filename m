Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE2D861302
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:41:04 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id d5so818486pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 22:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=aAqObBRdVyAQtrF/10gYt1S6E2qkWmGcZcfHmDzEhHE=;
	b=HNnA7b2RV56j/lQb/6E7eBFxRGgiJ8kV+poT4QLotIVwC41WBFcP6tgL/Et1WYTbJk
	fvODXn82rOVnEMY5EKYUMq+08lhJ3lHdJ7RXrMH1d7yxTOJrDCbc+OphGeuL/stnDBZH
	qx5Q5uecZD7PMt0pjgy/JZ7t9z7584uq+SfHfD1gSHqF8e/1cXnWUs6mby/Hp8Ojz0ex
	ZaXCFPEOGh07bLcJUAvSOqhfSGb5oDtb3wLbRNKsmy1rMTD35I+G6o0hiACe1+TB+Pre
	mdg/dIpI863yGQANaft5ZknwZMGBSXH2rfvUQyCkECXLkDfvqymha/L4b9FNGtyib5ru
	glWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aAqObBRdVyAQtrF/10gYt1S6E2qkWmGcZcfHmDzEhHE=;
	b=eZmGHkLeA+h2exK/R9AmnL7GUNUafmYaykjZtWx5ozQNxR+3CRAp2xmyuBZBiYOzl2
	DEZuJuY46auSbBDsa6s0tQsR9jzFxkqgEj9sq+Ybe9yLQGugmMuTXBhtXr0RjoIM8xSC
	KhamT0OoMKY7qSCDdmNP+0rm8p2NsdfSMaU06tUYsWYBWJcbDUxxTj/P+Bx4ao/iEvpc
	7E5pvltkyghJvVtAU+A/a/55reI6A9W2Xe1lxq4S1EETDP3cLbr5kTHNrnUmYrBX37rI
	HyhFaWWmWyAf0JnhCO9lNqYs2MhRhUNVmXIJ9+s2QVRCum4r39SV/NqswbdHKAD/Q+WE
	QYEA==
X-Gm-Message-State: APjAAAVm8mDNccVCnm+0fAESijeVr+fUN4IHUjT/vpZgCKZ0HUsDM3PX
	gbHsRBvu/5FTpyfGBQTy3VQ=
X-Google-Smtp-Source: APXvYqxAMuE7h5auAqux2MsV4l7AGFaqdgcXhFHfDBwKAQeCa5yvfG4nuKy8X2pGlNfYH1FgDmhsbw==
X-Received: by 2002:a17:90a:d348:: with SMTP id
	i8mr3529244pjx.43.1582612865646; 
	Mon, 24 Feb 2020 22:41:05 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:a81f:d24b:3e8b:cce0?
	([2601:646:9200:4e0:a81f:d24b:3e8b:cce0])
	by smtp.gmail.com with ESMTPSA id
	v8sm15639843pgt.52.2020.02.24.22.41.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Feb 2020 22:41:05 -0800 (PST)
To: Leo Yan <leo.yan@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
References: <20200225063711.4848-1-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <263955b2-9b82-f24c-172c-0761d86a1391@gmail.com>
Date: Mon, 24 Feb 2020 22:41:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225063711.4848-1-leo.yan@linaro.org>
Subject: Re: [meta-oe][PATCH v3] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Tue, 25 Feb 2020 06:41:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/24/20 10:37 PM, Leo Yan wrote:
> Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   .../luajit/luajit/clang.patch                 | 19 -------------------


why is this patch dropped ? it building with clang handled differently 
now ? if so please add a line or two in commit msg


>   .../luajit/{luajit_2.0.5.bb => luajit_git.bb} | 14 ++++++--------
>   2 files changed, 6 insertions(+), 27 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch
>   rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (89%)
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> deleted file mode 100644
> index c39ef6fd4..000000000
> --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -clang pretends to be gcc 4.2.0 which is a big lie when it comes
> -to features, its same as latest gcc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Index: LuaJIT-2.0.5/src/lj_arch.h
> -===================================================================
> ---- LuaJIT-2.0.5.orig/src/lj_arch.h
> -+++ LuaJIT-2.0.5/src/lj_arch.h
> -@@ -313,7 +313,7 @@
> - #error "Need at least GCC 4.2 or newer"
> - #endif
> - #elif !LJ_TARGET_PS3
> --#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
> -+#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3) && !defined(__clang__)
> - #error "Need at least GCC 4.3 or newer"
> - #endif
> - #endif
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> similarity index 89%
> rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 93128dda8..da798328e 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -1,14 +1,13 @@
>   SUMMARY = "Just-In-Time Compiler for Lua"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
>   HOMEPAGE = "http://luajit.org"
>   
> -PV .= "+git${SRCPV}"
> -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> +PV = "2.0.5+2.1.0-beta3"
> +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
> +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>              file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> -           file://clang.patch \
> -"
> +           "
>   
>   S = "${WORKDIR}/git"
>   
> @@ -90,8 +89,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
>   "
>   FILES_luajit-common = "${datadir}/${BPN}-${PV}"
>   
> -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> -COMPATIBLE_HOST_aarch64 = "null"
> +# mips64/ppc/ppc64/riscv64 is not supported in this release
>   COMPATIBLE_HOST_mipsarchn32 = "null"
>   COMPATIBLE_HOST_mipsarchn64 = "null"
>   COMPATIBLE_HOST_powerpc = "null"
> 

