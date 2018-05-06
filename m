Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41CB274C4D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 20:18:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v15-v6so25919814wrm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 May 2018 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KlylBwWxph0p6UbM/K0rx9oXeAKCUcVf9/CXgkIVIrw=;
	b=UqwxLlaK4F1ZYQECSLEth4PFPrm3jQGdasHAQHDiUiQdyAizMJu7lZA4WG657x13Pn
	YHwPfNMV8sQQpzjEK2ITqR1prZ7OYFfeWA1QvdmV0s1KXuyxymDtBvI5joUrLkPWfFOU
	m6E17KuQ1k3ltDjxMdZSS7Zj72O5zhPMao8HCvf73V6k5hxNEqb4ELo/k5bFa4rbJoRY
	jpF8yGwlLwLiFvJaGMNDKc8Bz1TSxBT4WXxZnGyCsoHLi89Hk77CSWHNf2sIAhHRd1MR
	p5ND3ZkcDGDOHMdCWPLEbJ1+5kKQ4Wk8QpyMLARIx1hmkam0Zrlmio4ddLp5azLCliEA
	picA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KlylBwWxph0p6UbM/K0rx9oXeAKCUcVf9/CXgkIVIrw=;
	b=jYi8lIMgcLTXNahL3l/gotFEaMtHj7rw/51wSeXEU1syGdGItd3kcGF2HwyvQWlG3z
	xgR4TajnbHzMfnGoQMsXKyImizuYpbu9Vt36awyO5SKKO8fIwDYxyREqC5hPrY6OkISN
	1Q/YHaF6aolPlv0/N06Jtr55IxAPMoKXLpa56F95ME/jLTGVsAIInNN3PFor4tZlFJmB
	iQWOodY5O3ZUdJX9Fj8nC7Eu5WbI66+vxB+Y45VB5Qli3bhJzHVRAx4Vhfcf17oX6pNv
	XMaUY38sxQmOcwDBvtBloe8mQJ618uX3ban8Eee+3fX0vIfEGur2F6G9t6Ark9RFvnnq
	h6Ew==
X-Gm-Message-State: ALQs6tDZMxS1SaottRIUq5IYeeqh6pAj5P+Gsl5kKP+VEV5qd6Xv4xSo
	M/jUzbzYbd3sAPhtcYBu+TOZppxg1rTwOgmZ4MA=
X-Google-Smtp-Source: AB8JxZqYImUgNZC3wN0WDXjdVEnlaLK8BVDanf0EFMEOUoFziCGbVZ4p4zER1kiYmRjMGIK5hNxgc8BV00bRw3GLHzw=
X-Received: by 2002:adf:ea8a:: with SMTP id
	s10-v6mr25885315wrm.223.1525637906452; 
	Sun, 06 May 2018 13:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Sun, 6 May 2018 13:18:25 -0700 (PDT)
In-Reply-To: <20180408201440.31986-2-Martin.Jansa@gmail.com>
References: <20180408201440.31986-1-Martin.Jansa@gmail.com>
	<20180408201440.31986-2-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 6 May 2018 22:18:25 +0200
Message-ID: <CA+chaQdAvReuiRsTkW+oLun3quo2tMj2H8a5EY7YaoL+10wg8A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] android-tools: use fixed SRCREVs instead of tag name
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
X-List-Received-Date: Sun, 06 May 2018 20:18:26 -0000
Content-Type: text/plain; charset="UTF-8"

ping

The other android-tools patch was merged now, is there some issue with this
one?

On Sun, Apr 8, 2018 at 10:14 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * so that bitbake doesn't need to use git ls-remote during parsing to
> resolve tag name into SRCREV
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../android-tools/android-tools_5.1.1.r37.bb           | 18
> ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb
> index 5d8f8a8435..780ecaa11a 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = " \
>  "
>  DEPENDS = "libbsd libpcre openssl zlib libcap"
>
> -ANDROID_TAG = "android-5.1.1_r37"
>  ANDROID_MIRROR = "android.googlesource.com"
>  CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
>  EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
> @@ -17,12 +16,19 @@ LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/
> hardware/libhardware"
>  LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
>  BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
>
> +# matches with android-5.1.1_r37
> +SRCREV_core = "2314b110bdebdbfd2d94c502282f9e57c849897e"
> +SRCREV_extras = "3ecbe8d841df96127d7855661293e5ab6ba6c205"
> +SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
> +SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
> +SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
> +
>  SRC_URI = " \
> -    git://${CORE_REPO};name=core;protocol=https;nobranch=1;
> destsuffix=git/system/core;tag=${ANDROID_TAG} \
> -    git://${EXTRAS_REPO};name=extras;protocol=https;
> nobranch=1;destsuffix=git/system/extras;tag=${ANDROID_TAG} \
> -    git://${LIBHARDWARE_REPO};name=libhardware;protocol=
> https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
> -    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;
> nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
> -    git://${BUILD_REPO};name=build;protocol=https;nobranch=
> 1;destsuffix=git/build;tag=${ANDROID_TAG} \
> +    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core
> \
> +    git://${EXTRAS_REPO};name=extras;protocol=https;
> nobranch=1;destsuffix=git/system/extras \
> +    git://${LIBHARDWARE_REPO};name=libhardware;protocol=
> https;nobranch=1;destsuffix=git/hardware/libhardware \
> +    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;
> nobranch=1;destsuffix=git/external/libselinux \
> +    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build
> \
>      file://remove-selinux-android.patch \
>      file://use-capability.patch \
>      file://use-local-socket.patch \
> --
> 2.15.1
>
>

