Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 829DC734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:34:22 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so43287436ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0CCcXCfpIKzp+gviEbIl3iHAO6TANGp7cBUOK2WZ66Q=;
	b=a84yOzKlqXHsKr8jhKf9717AgTsboB7zIpV4Mwe3KzHgmQ4c0dBW+FJ+Sz4yZ1BaIc
	g9gJlplNe0AEdjhs7v40G3b3NGYiJ/69lVgHBUNQ2UOKnPFypqq13BKzYw32js6Lfyak
	W6Q8cbJMHnG4uBucNXywx0mnympSy6FZk1+SUM7TQmzGP4CBI1RhuzRo6eEW+tCT0BRq
	ltU8GSBUrAPg3AOOoU5s1s3xE0tfATKzouPnVdLHWXk3phoDLb/fNbVFH4A0HqOzGbTN
	Aeq8tgHan8NomeiXxwgaywo41LjfNW1xrs9U269cozMV/PDTY753fWLIqICCF0z+cMTN
	yTtg==
MIME-Version: 1.0
X-Received: by 10.107.16.160 with SMTP id 32mr5661890ioq.54.1433446463249;
	Thu, 04 Jun 2015 12:34:23 -0700 (PDT)
Received: by 10.107.3.166 with HTTP; Thu, 4 Jun 2015 12:34:23 -0700 (PDT)
Received: by 10.107.3.166 with HTTP; Thu, 4 Jun 2015 12:34:23 -0700 (PDT)
In-Reply-To: <1433445666-7207-3-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
	<1433445666-7207-3-git-send-email-armccurdy@gmail.com>
Date: Thu, 4 Jun 2015 12:34:23 -0700
Message-ID: <CAMKF1srvUs9pVeS7T0zd8QpCAwCjTTR-uryJxRNmuPGNFh2sSQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/7] klibc.inc: use x86 over-ride instead of i486/i586/i686
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
X-List-Received-Date: Thu, 04 Jun 2015 19:34:23 -0000
Content-Type: text/plain; charset=UTF-8

On Jun 4, 2015 12:21 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>
> 32bit x86 is covered by the x86 over-ride, so duplicate over-rides for
> i486/i586/i686 are not required.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 9f445e1..41b0b29 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -44,9 +44,6 @@ KLIBC_ARCH_armeb = "arm"
>  KLIBC_ARCH_mipsel = "mips"
>  KLIBC_ARCH_x86 = "i386"
>  KLIBC_ARCH_x86-64 = "x86_64"
> -KLIBC_ARCH_i486 = "i386"
> -KLIBC_ARCH_i586 = "i386"
> -KLIBC_ARCH_i686 = "i386"
>  KLIBC_ARCH_pentium = "i386"

You forgot pentium

>  KLIBC_ARCH_powerpc = "ppc"
>  KLIBC_ARCH_powerpc64 = "ppc64"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

