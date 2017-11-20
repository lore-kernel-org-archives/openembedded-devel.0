Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC4971B99;
	Mon, 20 Nov 2017 10:16:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u83so9133066wmb.5;
	Mon, 20 Nov 2017 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1CA9S6jxJyIfRpf2/s7AiGofoctZumnMHV7C1238Ays=;
	b=PD3JgNlnxFvg1vUsTbOx5BSjCzuzi/yDPN/Htapu+x70zdFsqeB7tNDZvIOu8Z1sJw
	4miDr0GkbIpliywDrLBglyyz1DLC8Icw/DbzeNG1J/c47xR+ROqVgusVxGD38bPXd/ba
	iF01vdoUcO043r9xB2Cwt+v6rDzXAk/QKjNfjSXWHdk5mGAY4pB64BzVtZgjE/xkEPci
	hYxSAhcNgFsmQvqnTeG73MNBdQlugcNqSO36AzVLsORa61s535G4pXB/2PQFMKnOgcrc
	NrnPh/NFOkuu2MlIZi47ir8Pn/RyG+GZxrpnwR2No6Dcrg5UF2zaxBEwIBIp532MMl7j
	e8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1CA9S6jxJyIfRpf2/s7AiGofoctZumnMHV7C1238Ays=;
	b=M+FxHeeygidsTD1xNKj+f9ilqyPvgNQ2K9GjAtprBERkNzvk6otr1s5sPKjhr/wchG
	gGlmbEWcD830W0iaFfwcNEmYC09tnYX8/Cbg5jIEcOLJ7BVhtUq6v3nb3gEHWld6PtRd
	e7OkDgIFvVFW282thUFYNL52I8GXMW6kEUAlar+lQVslYM1dRnWPuWpPvWv8s3Us+G/W
	zlafUukVWCq9tshQHZZSU9ptGY3CeLDqmLqFlxTCfJo35VkBInB1EewBN78bbD93d7FT
	Lx1fhubsR1Za+e0OC+hchEbA7ARdw8LjFUeBSiiQOmYbCez61KvbYXuZab7bQdA7qMAK
	A8pA==
X-Gm-Message-State: AJaThX6zjjLTeqtYFvAKrXz3zopzxs7iE1iNX68PQfIY3M3VFm6H7eKS
	MihtW+S4Rc+LM74XxFz+4Ko+Xt7PKQ89rwmVl4JSIw==
X-Google-Smtp-Source: AGs4zMYmEoYwlGtzCP1Jy848I7szt+2a/eRHGzbQEHFQlmQH/FayhCUpoYoPooXOyoxrl08YH4k4BBOyEfSQ/4HhsHk=
X-Received: by 10.28.173.199 with SMTP id w190mr9889446wme.69.1511172975941;
	Mon, 20 Nov 2017 02:16:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.112.12 with HTTP; Mon, 20 Nov 2017 02:16:15 -0800 (PST)
In-Reply-To: <20171016225305.CBB5823794A@git.openembedded.org>
References: <150819438498.10724.11371220002282568783@git.openembedded.org>
	<20171016225305.CBB5823794A@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Nov 2017 11:16:15 +0100
Message-ID: <CA+chaQeQiiu3mVmEY2=BEmHVfShmcrsVix-_OobcH=gOYapb0Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 15/21: bash: add missing build dependencies for ptest
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
X-List-Received-Date: Mon, 20 Nov 2017 10:16:15 -0000
Content-Type: text/plain; charset="UTF-8"

Just FYI:

I see that this was merged, but it still doesn't resolve (for me) the QA
issue I've reported on the previous bash change which caused it:
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143289.html
and Juro was aware of this issue as well:
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143273.html

e.g. today's build:
http://errors.yoctoproject.org/Errors/Details/159106/

depends from bitbake -e:
DEPENDS="autoconf-native automake-native libtool-native libtool-cross
gnu-config-native   icecc-create-env-native virtual/aarch64-oe-linux-gcc
virtual/aarch64-oe-linux-compilerlibs virtual/libc gettext-native ncurses
bison-native virtual/libiconv texinfo-native glibc-locale
virtual/update-alternatives"

Then I've noticed that my local.conf has:
LIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 cs_CZ.UTF-8"
which prevented glibc-locale in generating de-de and fr-fr locales.

So the QA error was correct.

On Tue, Oct 17, 2017 at 12:53 AM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 2820a2c530018f59895fb57770caa8511d31afd4
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Fri Oct 13 14:52:16 2017 +0100
>
>     bash: add missing build dependencies for ptest
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> index f8a92b5..f4e1f7a 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -24,7 +24,9 @@ ALTERNATIVE_PRIORITY = "100"
>  RDEPENDS_${PN} += "base-files"
>  RDEPENDS_${PN}_class-nativesdk = ""
>  RDEPENDS_${PN}-ptest += "make"
> -RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr
> locale-base-de-de"
> +
> +DEPENDS_append_libc-glibc = " glibc-locale"
> +RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr
> locale-base-de-de"
>
>  USERADD_PACKAGES = "${PN}-ptest"
>  USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

