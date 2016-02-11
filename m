Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E677F60119
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 21:45:05 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id c3so47343233vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 13:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ukEyZEVtVe6gqmrGMNeGONncC+2ptbEd16OL/0+Hbf8=;
	b=uJIrDR3+MUBADea274xXaALbdmz7qTj4ydF5vt98NIPnp4QLwpoBevufZ9p2jitbqO
	uo9115uSm1X8Vat7MovDDqlY0VA0CAIy3TBYZ53DDbRnMmRdPONIEdmIdDHE9jigHdvt
	SeLcxIwS/UbwAvJNzyabl5WAiN/nibHMoS+q3aviOoAxjFbbJq0I1lospiDKQGMvUbYW
	aY4UkTVOYMBV4Eg3clL9YkzeeWqjYYMQjB4MAie4k8CtUxugSmIKgSxbf+bVA/8ks9Ya
	Kgy0ZH5yLbD3NvDvCWuwo2uzUWN0OXhdYOX2z+Qg9Q5j5Bw8NOqS/b4QmAumYug/cml0
	p28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ukEyZEVtVe6gqmrGMNeGONncC+2ptbEd16OL/0+Hbf8=;
	b=M2NynRn3Y6pArxJxioI+uXh6JWx1YFbVzQ/b8SM31ZWKLr6LSnLnz7WkK7ivGixo2M
	6Vke9MSucUDEOwgOP+cjKjlXZILdnRdw13deN8Wbb/2CUWGGvHaRJWNoPNz61gpwlKyr
	6tF63SgN+ky/nf3O954GZ8tlNvBmIqKtW60EYJqJzW+X6XzhuPR0W6WOaXYi0rMYnj/W
	nY1QPaQ13Y9OuFpVvfrLGg8XqwAcSGk8qfBUNhdk00r1yIQ33/XuKlqxYJLWBPg4+9vY
	oNWBVawmWSNMF2J3lVgVUCgdWyb+uNU3YTSW6sUUU8ZSJOn1hZemU/DoRFhC9HrOSEUK
	oCZw==
X-Gm-Message-State: AG10YOQJM8v3tgRmGVLSnqRcmkW/tkghpBVaqeuzIz5Utui7wVDLgBpP0JP2Oo0j7GpN8zGFTz2TMi4MhfMbTA==
MIME-Version: 1.0
X-Received: by 10.31.47.200 with SMTP id v191mr38187768vkv.116.1455227106065; 
	Thu, 11 Feb 2016 13:45:06 -0800 (PST)
Received: by 10.176.1.248 with HTTP; Thu, 11 Feb 2016 13:45:06 -0800 (PST)
In-Reply-To: <1454978906-28102-1-git-send-email-andrea.adami@gmail.com>
References: <1454978906-28102-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 11 Feb 2016 22:45:06 +0100
Message-ID: <CAAQYJAsrSwa_gsBx8Kfe2Nh7WPfS=7qhadkcZBkjh6kL1iJbJg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: silence QA Error about packaging
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
X-List-Received-Date: Thu, 11 Feb 2016 21:45:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 1:48 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Keeping debian packaging-style we have a copy of klibc-xxx.so in libklibc-dev.
> Wile there silence the warning about it being already stripped.
>
> NOTE: klcc in OE is used as cross-compiler so the packaging is tweaked and
>       there is no /bin/klcc for target (drifting from debian).
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index a707ed5..654d9f1 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -38,6 +38,8 @@ do_configure () {
>
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INSANE_SKIP_klibc += "already-stripped"
> +INSANE_SKIP_libklibc-dev += "dev-elf"
>  KLIBC_ARCH = "${TARGET_ARCH}"
>  KLIBC_ARCH_aarch64 = "arm64"
>  KLIBC_ARCH_armeb = "arm"
> --
> 1.9.1
>

Please discard this patch.
I'm sending a more complete set fixing build for qemux86 with latest kernel.

Thanks
Andrea

