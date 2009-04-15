Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuAnB-0002Lj-7s
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 21:29:07 +0200
Received: by rv-out-0708.google.com with SMTP id b17so44199rvf.0
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 12:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HSe+nPP3viEFKaydglaYVBcyi3ja79tGlqw2vFWtO3g=;
	b=D602UGR6Z/fbHKd23pZRQAhys+wAxPQH7bQFnagagBfmJRIkKo2Qw/kvaCRDAiZPGz
	wTZIOIP/MwjWFbzGF4EYugcf1WpYL5DWZJvKv6/XYMs8kRPwutNq38vhGlV3oN6RLLf9
	t6qLTx2L4guj7QS3WoitHN94am6wsu1wHFRIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PylfgIxYtxoo5ry6ffT5VylABi0Y63A7O3pIMniSuePQpIeXEc3XnaxNFNSrf57DPQ
	p3E/IeLB3ojjQp/z5iEaAx6Jx7RV/S11L2nPgMcAZpoWSlqzfIFh6MHi/G4R+g3zA+84
	DscmiEnlfrtiQT97o/OQDhjLwqlTBCJ/Sm/Mo=
Received: by 10.140.164.1 with SMTP id m1mr448555rve.8.1239823516208;
	Wed, 15 Apr 2009 12:25:16 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id c20sm334673rvf.40.2009.04.15.12.25.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Apr 2009 12:25:15 -0700 (PDT)
Date: Wed, 15 Apr 2009 12:25:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090415192512.GC29623@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1239798960-3586-2-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.243
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 02/11] binutils: add	binutils-x86_64_i386_biarch.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Apr 2009 19:29:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 16:35), Roman I Khimov wrote:
> ---
>  .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++++++
>  recipes/binutils/binutils_2.18.bb                  |    2 +-
>  2 files changed, 26 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> 
> diff --git a/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> new file mode 100644
> index 0000000..b79a76a
> --- /dev/null
> +++ b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> @@ -0,0 +1,25 @@
> +#!/bin/sh -e
> +## 127_x86_64_i386_biarch.dpatch
> +##
> +## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
> +## DP: Author: Aurelien Jarno <aurel32.debian.org>
> +## DP: Upstream status: Debian specific
> +#
> +# Hacked to apply with quilt
> +
> +--- binutils/ld/emulparams/elf_i386.sh
> ++++ binutils/ld/emulparams/elf_i386.sh
> +@@ -12,3 +12,13 @@
> + GENERATE_PIE_SCRIPT=yes
> + NO_SMALL_DATA=yes
> + SEPARATE_GOTPLT=12
> ++
> ++# Linux modify the default library search path to first include
> ++# a 32-bit specific directory.
> ++case "$target" in
> ++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-kfreebsd*-gnu)
> ++    case "$EMULATION_NAME" in
> ++      *i386*) LIBPATH_SUFFIX=32 ;;
> ++    esac
> ++    ;;
> ++esac
> diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.18.bb
> index 9367196..562c8ba 100644
> --- a/recipes/binutils/binutils_2.18.bb
> +++ b/recipes/binutils/binutils_2.18.bb
> @@ -12,8 +12,8 @@ SRC_URI = "\
>       file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
>       file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
>       file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
> +     file://binutils-x86_64_i386_biarch.patch;patch=1 \
>       "
>  
>  # powerpc patches
>  SRC_URI += "file://binutils-2.16.1-e300c2c3.patch;patch=1"
> -


Looks ok. Could you also make this on later versions of toolchains.
I am not worried about the older ones.

> -- 
> 1.6.2.1
> 
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


