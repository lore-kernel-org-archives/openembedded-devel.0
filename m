Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 13B75608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:08:03 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j2so24534425qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TnPCt7chKMXsvq/mF8MnyqXu8O58d9dzua0mPGoi/bU=;
	b=oChf4KeOYtwSVI/IyAcYRvrCbNI+z8F+OXp+rqDAuzMcrppjcndBE1ZB0fZVsI9giH
	G2C+Xv7cE1lQmpvdzq3pOCuSr7aptYB+j1P7F4Bno8ACTOWOHnjPYHh3iDJ4rogirn+m
	7MsO5Wq5DrRudrkx38TrsU7LD1aXGD2uLBL+jVQdCIBtBcWQ088QJELXx3LLIR3G2wuG
	ydX9mfafc31oC2zKEnhM/+nNIKy8v0c8ZrH/GnIWj2udY2ytuW/JhrEmLmh+BaIqNnmd
	Eu0bvdR9BG2Ka8HXTWqQuJq8G7bpxF+rXpwU5L2T+DYMTjdKLn5UYyR+jK5ReW4ouJqW
	3yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TnPCt7chKMXsvq/mF8MnyqXu8O58d9dzua0mPGoi/bU=;
	b=FVNmnm7oqng2dgt31isMEd2HZrENPlxnaXPHUrGRjk+XMxfcyWe8sQXe8B3/1jBvNW
	PrkP6Tbuj7LAzCPKG8119Ow/nmZDtaV0ESOBZIjtCBJ0ldvzQZsqeO5uUK7NTjLOtPIO
	tCIgWbM1PwguIQZrKh8nzsB1SASluauJ5rLhasgLYoKW14YnoBQLIBq3tmiKUmYR8eub
	A28RhsRdLVukvdA2iLFFah7JtRVGwyQ/IVi7eo9nWOgX6YUYPstmoEs3zg2AfNLTkiGb
	B47o/1I7Nw+ICLJcTPcNy8b3iD2SxWxgtktt7TaqSg6XQTpPqy9g2BgbBDWhqDhW11Mx
	/hlw==
X-Gm-Message-State: ALyK8tLlueRr4wWwxB1joqumr92pfBq8EgF4hQ91m5Vu6S5/zMmegBg1vDQQNwY+TAv4alaMBGDJ5O/ZIiVHFA==
X-Received: by 10.200.33.172 with SMTP id 41mr23328449qty.26.1466438884141;
	Mon, 20 Jun 2016 09:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Mon, 20 Jun 2016 09:07:34 -0700 (PDT)
In-Reply-To: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
References: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2016 09:07:34 -0700
Message-ID: <CAMKF1sqc-6OpVNMb7m9FRg2tPtj32r9f4itzo4SSa4f_zh7BwA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH v2] fwts: update to latest git and fix build with gcc 5
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
X-List-Received-Date: Mon, 20 Jun 2016 16:08:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 20, 2016 at 2:35 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> License checksum change due to 2014->2016 changes. Fix build with gcc 5 by removing -Wno-werror:
>
>         cc1: error: -Werror=misleading-indentation: no option -Wmisleading-indentation

This would then break build with gcc6 unless the indentations are
fixed in new version. Can you confirm that
it works with gcc6 equally well ?

>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta-oe/recipes-test/fwts/fwts_git.bb | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
> index 197fe20..2868034 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -3,11 +3,11 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
>  HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
> +LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
>
> -PV = "14.12.00"
> +PV = "16.05.01"
>
> -SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
> +SRCREV = "4d9500d1fb119e2136e07c0cc2844f51b5e5b97a"
>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
>
>  S = "${WORKDIR}/git"
> @@ -16,7 +16,9 @@ DEPENDS = "libpcre json-c glib-2.0"
>
>  inherit autotools-brokensep
>
> -CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
> +CFLAGS += "-I${STAGING_INCDIR}/json-c"
> +
> +RDEPENDS_${PN} += "dtc"
>
>  FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
>  FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
> --
> 2.4.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

