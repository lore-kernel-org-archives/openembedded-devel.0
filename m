Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 14C4B6A596
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 23:15:47 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id q8so1115906lbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 15:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zIU+CoxmlzT9wN/JzULGtp1tu1InI7/qZGyyZWQEmsw=;
	b=EdFn2HxUtqtSDMkY7pmUkmymi+Z4ZgXoH+eZQxry6/aHD0tuAJ+j9CNZhdzB71FUFX
	o9p3VXaY+nvUj04+GZ8jLrOTzfeDG9a/Trav/9FpndggBgcZeTmGGd6N5P97EqQz6+hZ
	NY22fvyq3gFbZPpgF+u+L7sqyuG0qjdwVb0/YurloS+1sB3ANf5KrrICw8PrtDPc4ADJ
	ZR4PYuBzDOErFmsvPGitzoaBIige0+MRT5FLW9gU2PRFvQXgbK0BJ46cVCzPJJOzzV/3
	P+73p+IJvAJlg3nDJyS/fRSiIa/cg12FTu97gJOZsAccT/m3tbPX8lJL726mVkaez6Mj
	nZww==
MIME-Version: 1.0
X-Received: by 10.112.184.169 with SMTP id ev9mr9076lbc.25.1387235746679; Mon,
	16 Dec 2013 15:15:46 -0800 (PST)
Received: by 10.114.97.104 with HTTP; Mon, 16 Dec 2013 15:15:46 -0800 (PST)
In-Reply-To: <1386672101-30510-2-git-send-email-koen.kooi@linaro.org>
References: <1386672101-30510-1-git-send-email-koen.kooi@linaro.org>
	<1386672101-30510-2-git-send-email-koen.kooi@linaro.org>
Date: Tue, 17 Dec 2013 00:15:46 +0100
Message-ID: <CAAQYJAt2aVFKFZ8NMVdKKx5koCeg32Law1Zs1DgKCLO1kmeH+A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-initramfs][PATCH 2/2] klibc.inc: add mapping for 64-bit ARM builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 23:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 10, 2013 at 11:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Klibc is following the kernel naming ('arm64') instead of the toolchain naming ('aarch64').
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index d8af666..24ece9c 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -13,6 +13,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  INC_PR = "r1"
>
>  KLIBC_ARCH = '${TARGET_ARCH}'
> +KLIBC_ARCH_aarch64 = 'arm64'
>  KLIBC_ARCH_armeb = 'arm'
>  KLIBC_ARCH_mipsel = 'mips'
>  KLIBC_ARCH_x86 = 'i386'
> --
> 1.8.4.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Acked-by: Andrea Adami <andrea.adami@gmail.com>

