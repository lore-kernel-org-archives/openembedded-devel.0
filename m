Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7328171BB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 21:14:14 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id q19so2501506itk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eXW+pQqTd3q3BFZxC6+6nsKUG2baJZKMrVTVzT4pZC4=;
	b=WN4P2WBkEYIdS2+BR1cNs9lqzEN6mnd3Xrl7BZdbwRe+ZPL2wU4+XmzI+UVQR4TlZI
	M6tzRdvTAY+1nYLkkCywASBL6tmQ2x4j1vmIGvNilfCRxJk5Ac5MFAXMv3QqXpTtN03C
	ezLqvkZWb6klDiGfuwKtJEHjakzkbtJ7nBdLCwkgi1kEr15J7IK1pFjzbAVCn7PMy9qf
	22uDe5oaFAtdrQcmLwt2uae9sYe7948+LTJFpZlP6FLcUynn7VokmfWQLXCLGA0xP/tT
	rEuTSWVZkhYuiJB2ig5Yicez9pPLxOJJGM7KdEKVNU5VJmazY+dqbSG+J4Q2aHphuGqm
	Jg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eXW+pQqTd3q3BFZxC6+6nsKUG2baJZKMrVTVzT4pZC4=;
	b=Bq07z4PPI/258KTFkWXAE+j5kRShzt1DpUg86xgonwJCTqcmvlwFGERqAet2yCkXmx
	0jfOg/EPna0KVP5jknu1KvrJmu1I0zIQ1mxLjVvLs6NeMdRFAj1fzDlvEnSBXMPVR8IT
	XZfnJZ/at5L/Dp23x3EIDpEke5TcIlahP/HIrTyPYvn/65r0Ef4Ztv51391yvb76UDc8
	ELEJ8onvaWcws6UbZ+M3pjDIRGZWiu4CnIeVt26R7hHWVSCU7AYuS+JKTlrVdfVhGIlm
	ZMLvhFl39hvdK6gPrC6B9VhNDCZljaZB+cVbN7csaBxU+rbQ+htFMuEU881EhXLmVNSn
	vSkw==
X-Gm-Message-State: APjAAAWzqPS7xKFLs/s6vzznRdobfd4QMNpNgcPafHIOXk9IdCbigSmJ
	Dar7gQcCGvwi5tyd0a02OfFcBEPnxLi/jMyOYcU=
X-Google-Smtp-Source: APXvYqwhJaMZRjfeYtYYx06487VgxG/eiEjafdcCYSfxLyGC9LuK+yKQesJVVILWEKdMSyrC2W40v/0vC0gnYTu9rX4=
X-Received: by 2002:a24:5c10:: with SMTP id q16mr5756326itb.81.1556226854701; 
	Thu, 25 Apr 2019 14:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190424190038.19593-1-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 25 Apr 2019 23:14:02 +0200
Message-ID: <CALbNGRQaA1=z05+uR2aMxF3WgFKs5PiZWCBuAOd5ovf8TiaVow@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Thu, 25 Apr 2019 21:14:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 24, 2019 at 9:01 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * set COMPATIBLE_MACHINE to (^$) to prevent building it for any other
>   architectures than armv7a and aarch64
> * with new arm tune files it's easy to have armv7a in OVERRIDES even
>   when there isn't armv7a in TUNE_FEATURES:
>   meta/conf/machine/include/tune-cortexa9.inc:7
>      "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '',d)}"
>   in cases like this COMPATIBLE_MACHINE was satisfied thanks to the
>   armv7a OVERRIDE, but then the anonymous python was failing with:
>   ne10 was skipped: Incompatible with archs other than armv7 and aarch64
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> index 3afdff7786..4e8986de18 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -15,22 +15,15 @@ PV .= "gitr+${SRCPV}"
>
>  inherit cmake
>
> -NE10_TARGET_ARCH = ""
> -EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
> -
> +# Incompatible with archs other than armv7 and aarch64
> +COMPATIBLE_MACHINE = "(^$)"
>  COMPATIBLE_MACHINE_aarch64 = "(.*)"
>  COMPATIBLE_MACHINE_armv7a = "(.*)"
> +NE10_TARGET_ARCH = ""
> +NE10_TARGET_ARCH_aarch64 = "aarch64"
> +NE10_TARGET_ARCH_armv7a = "armv7"
>
> -python () {
> -    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES').split()):
> -        d.setVar('NE10_TARGET_ARCH', 'armv7')
> -        bb.debug(2, 'Building Ne10 for armv7')
> -    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES').split()):
> -        d.setVar('NE10_TARGET_ARCH', 'aarch64')
> -        bb.debug(2, 'Building Ne10 for aarch64')
> -    else:
> -        raise bb.parse.SkipRecipe("Incompatible with archs other than armv7 and aarch64")
> -}
> +EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
>
>  do_install() {
>      install -d ${D}${libdir}
> --
> 2.17.1
>
Have stolen the idea of this patch for another recipe. I think
cortexa7 (raspi) needs COMPATIBLE_MACHINE_armv7ve and
NE10_TARGET_ARCH_armv7ve entries. I know they were not handled before
but...  - or do I miss something

Andreas

