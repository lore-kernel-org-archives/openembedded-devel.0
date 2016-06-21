Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4257062132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:45:15 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id q132so10374928lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ylk0ck82BPIt6qcHxYGpP5omIYI/xBRQznnQakZcE7w=;
	b=ATGrwSKS3lJsTjiAgk/4b9SDYCW7SiHADQ9q66zPwA4HD8ZH4zyZ4A+X1touKaBwj9
	ejwPmjIqT4ls9dMXe8gBniHqSRsQq2h6fo42HHhn/Hx5KJ/nYY0z0SOr3fM6tqJ2IqkQ
	EVbRtZKhWWfGlkj4MNy117KosnGD+h7GN2oKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ylk0ck82BPIt6qcHxYGpP5omIYI/xBRQznnQakZcE7w=;
	b=XqRn46R6E7Gw0QU1s6il2Xkhu6j96hzlOtzSZTJSwXoypaHXmJYSFOHrNtCeI8Bhgg
	r/7w7jSJur8ij40Ez6heZ2o4YSxYFWBdJv/ymKpht8aAHl7N8zjGhzsOqb5NkFOSUFjy
	BsypntvHNps00yMmxN4+f5qGARpTWJ5ND5c+aKd2HKNO8CYXufcvwEZR1aS7MR+uSWKT
	FwVrFFBbFf+HnGaKnjYleE5l7A1Qlctsk6IfNt3L30cZ6a2uGNKQRx77ZE49xQfiuzRm
	74fxa1+uaH8YWKlPV55/KABt/rwrNIpoqRlL0pLCV7w92zxDh7mq1bRZO0yAMbIAebN3
	K2Qg==
X-Gm-Message-State: ALyK8tKL+DC4mpfZ8agOVU8cghhWiRwrjSpPrAVCsY8gtSVaW7IzCVgMcE5xHDMi6xm5N4lPP+OVAw3fGG2fpBQC
X-Received: by 10.25.20.213 with SMTP id 82mr5903906lfu.90.1466495115431; Tue,
	21 Jun 2016 00:45:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.77.146 with HTTP; Tue, 21 Jun 2016 00:45:14 -0700 (PDT)
In-Reply-To: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
References: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
From: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 21 Jun 2016 09:45:14 +0200
Message-ID: <CAP0W-Rkd3y0k-5iR89HyxcHcRjKGg9VCDV-zeOM41aDsi79xpg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 21 Jun 2016 07:45:16 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 11:35, Koen Kooi <koen.kooi@linaro.org> wrote:
> License checksum change due to 2014->2016 changes. Fix build with gcc 5 by removing -Wno-werror:
>
>         cc1: error: -Werror=misleading-indentation: no option -Wmisleading-indentation
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

*sigh* this builds fine on armv8, but breaks on armv7 :(

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



-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

