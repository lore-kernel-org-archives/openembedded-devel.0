Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5523977CE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 00:40:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d79so12305912wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 17:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d+Ru1VGrBAKeptn/IL2cahDdEgCf9gtqCTH8Fn80oUM=;
	b=BtJPcDkx/rwULDqqKVt09hNI23g+Aa1wwwkKtUwYpzd5n+2WKnXCsJU9c5AhbLAxAS
	Kb18ovq+y8FmRMMcIV/CY7+4P5WA9oM/vFvqpRxJXCKsPXt/KdVRJFNgrNJWa13KqBiu
	1KLiDJEXd9EPGsPDUQntv/+NXOKSTj5WhT84r+J0JXDqr0m3DRzZnvQS47pSXF4IIQBu
	Qu3uzu6+/c+NtgNFKGDwsKXTe0DHpmzBtzixyIVymouf1ngZX6+Ws4Y/1b6seigi04Ma
	kjl1kMy+hEh1KJxkXBrNCMnG+ZUWUzrypPlBiKBCUplpk3CuqMWZoM5WE9007hE7u/Jk
	rqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d+Ru1VGrBAKeptn/IL2cahDdEgCf9gtqCTH8Fn80oUM=;
	b=FkS+MZj1tp4tg/UYiyHashkzMf2EwHRA26sKqPTsHVp9NK3r/HwgtE/ENcrkQ0pPc7
	9X4a1RnQmc4ja3+gCj2PskMyKghv6HTqD0cMA7tjnVSVkdoY5uLduivTFeGoqdDo8DTU
	MZa2D2P51r5LTZ1R+8KtaezQ64icnp12Lg+NPiB6Pfz5ek7wLfDGOIEhKFSc636Kazw5
	HcfpBbLj+mWBQcYUQYXWRMqptZn7IQxedwH1iibaM64rnrpBfNakhm43v8BbHY2fD6Q3
	JAUnxzIfx/ihX9gr+fHiY7Hv74cinixDfpsLO+8mMcQILXlobCXNQcX7XBoY33tmuuS5
	sPaA==
X-Gm-Message-State: AN3rC/58bD+Z0W/i/g65e41W5Gh8Hl6d+ULh3PcbjwMQHYPkcOI7xdE/
	DeiCi/4Uh/FFzGSqwBjBz6nf+EEmKQ==
X-Received: by 10.28.129.147 with SMTP id c141mr7866488wmd.98.1491871214537;
	Mon, 10 Apr 2017 17:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Mon, 10 Apr 2017 17:40:14 -0700 (PDT)
In-Reply-To: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
References: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 10 Apr 2017 17:40:14 -0700
Message-ID: <CAJ86T=US2yATN4uK55O2vjoY-aJvU6Q-mJrkDuGOPEwsueHYug@mail.gmail.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] [PATCH] chromium: fix null pointer dereference in V8 with gcc-6
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
X-List-Received-Date: Tue, 11 Apr 2017 00:40:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 11:40 AM, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
> This patch prevents "Aw Snap" error when loading a page with JavaScript.
>
> Tested by running:
> - chromium-wayland on Beagle X15
> - chromium-wayland on HiKey (with a separate patch to enable aarch64 build)
> - cromium on dragonboard-410c (with a separate patch to enable aarch64 build)
>
> Based on the fix for Gentoo's bug 588596:
> https://bugs.gentoo.org/show_bug.cgi?id=588596#c10
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  recipes-browser/chromium/chromium.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index 60edccb..7e057ec 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -15,7 +15,8 @@ CHROMIUM_BUILD_TYPE ??= "Release"
>  inherit gettext pythonnative
>
>  ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"

Not related to the patch, but this over-ride should be duplicated for _armv7ve

> -GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
> +GYP_DEFINES += " ${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
> +       ${@bb.utils.contains("AVAILTUNES", "mips", "", "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"

What's the significance of skipping the workaround if AVAILTUNES
contains "mips" ?

>  GYP_DEFINES_append_x86 = " generate_character_data=0"
>
>  do_configure() {
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

