Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1E29B7780A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:20:50 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id p144so7877631ywp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CdI02XRkNYoNr0/jkikNE4bNXzb9+sakYd79ZBtRLeA=;
	b=r/NmxEkqDVhYt8JFig2rZOHSpP9LC1hjEMpkBGGaORuGOzX/A1LZZIVupMp7H19Yt/
	cl5494PH0cKJoBQIt/oaKQ+CP7QURfEHvSPVXH1+Grtt80o6MNtdwJHNp6nGf92UbQtZ
	+HZa0fjnYetiPCg+v8m54Mw3xp2KWq3hx/kJ/XUG1QpnilfHB5BVL269mEeda6EpwhC4
	0Viq0tW7c8bc+ovRA+KWFHXjLwRNH/XwdFZOsUwVpHaEF6mMcmpo2GucAxl9O4838h0/
	EfdVajiH5n3r57TomRbhFNmKhKTZ0lWPSc03dmGsBOgqHGPRQieVG8OCIujO4IHhh6d8
	28IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CdI02XRkNYoNr0/jkikNE4bNXzb9+sakYd79ZBtRLeA=;
	b=o+kSAPNxAx2LGr/AFWDk8onvm/5mOqRL/0Tzdo8nwHktnQoVkbq4H/6v+Wev1MxVsf
	b+kVfVgD6yEkjwKwigH8sz6qi1UhSW4gT4dCxp4zAsz3mBAlZ2AJP0NN3WPeRyD++T7N
	ExoJXSyYjQG+Lpj6s0+b/CFsqA2g8PNwf3CjEdosjvTPCO+zyyTvgKuMd5E4Y+WABN1U
	v9y/EKsngV5Qc1SdRmd9n7/vMsORKiLmLnZy37Lf97PIQLp3J68DHMDNaC8/ePJumkve
	+ZTS7ccMg0SxoOHa/Zt1LuesswiRc3SkPR2oXvWwcnZsFmk8wuohCuo5w/fXNS18WJG6
	8oOw==
X-Gm-Message-State: AODbwcBASBfWCLGDM34N/izRiYGsa9SOeUgY5X8A9nN7HksmRDzVndjt
	ujTxv+xhJctMHvk2umzISH/8wUQC3w==
X-Received: by 10.13.196.4 with SMTP id g4mr14353452ywd.193.1496661652047;
	Mon, 05 Jun 2017 04:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Mon, 5 Jun 2017 04:20:51 -0700 (PDT)
In-Reply-To: <20170518203214.34947-1-raj.khem@gmail.com>
References: <20170518203214.34947-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Jun 2017 13:20:51 +0200
Message-ID: <CA+chaQdeQiU1vrjG+gUWmayEHMn4-x+7Urr-k0LKM5UEMH-vyg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Mon, 05 Jun 2017 11:20:51 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build for qemux86 now:
http://errors.yoctoproject.org/Errors/Details/143592/

On Thu, May 18, 2017 at 10:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Helps fixing build issues with gcc7
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-test/fwts/fwts_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb
> b/meta-oe/recipes-test/fwts/fwts_git.bb
> index 4c4ae66d6..7c8deb3ed 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=
> 31da590f3e9f3bd34dcdb9e4db568519"
>
> -PV = "17.03.00"
> +PV = "17.03.00+git${SRCPV}"
>
> -SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
> +SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
>             file://0001-ignore-constant-logical-operand-warning-with-clang.patch
> \
>             "
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

