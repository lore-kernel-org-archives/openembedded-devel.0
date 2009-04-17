Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Luwkg-0007Kw-Uw
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 00:41:43 +0200
Received: by rv-out-0708.google.com with SMTP id f25so18811rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gnmD0KupmP/kzBJTpBi/oZNdJXFYxPrazsocm3Zp6fQ=;
	b=pqG/e6LmxPAyoE93+7rj4yvh6rMAlhpCHgGwn5OjDC3WPh+IDo6mVzEQlawqbI/6Df
	En6+TJpmy6Eb1ByTDb2T61uy9ihHV+jdcAARxKxrX5KAQ9OTMw/KgTNfi1fPYzI38gIf
	Dt9ousPR9Q6qSaF63HcXL+Me5JkMJTSHEVeEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DAXpZEBESJ3goIdBJr8b27C8rXY66tWUdse9hPO5AyqXkkylYgFzzpLtTJwVjuEWqZ
	sUhr4Nz5yf1n1VznitRm7xo56n4bEpNPHW/nPsH2JfwuxBkQproT337xP4aiWWGl/MXN
	XrwbiClahV239Wt3A7iSw13IFwspFdtOAKkpI=
Received: by 10.142.68.2 with SMTP id q2mr88447wfa.223.1240007860417;
	Fri, 17 Apr 2009 15:37:40 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 30sm8256206wfa.18.2009.04.17.15.37.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Apr 2009 15:37:39 -0700 (PDT)
Date: Fri, 17 Apr 2009 15:37:35 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090417223735.GB15643@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<200904160928.57879.khimov@altell.ru>
	<200904160014.29402.raj.khem@gmail.com>
	<200904161247.17071.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904161247.17071.khimov@altell.ru>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 02/11] binutils:	add?binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Fri, 17 Apr 2009 22:41:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/04/09 12:47), Roman I Khimov wrote:
> On Thursday 16 April 2009 11:14:29 Khem Raj wrote:
> > On Wednesday 15 April 2009 10:28:57 pm Roman I Khimov wrote:
> > > On Wednesday 15 April 2009 23:25:12 Khem Raj wrote:
> > > > On (15/04/09 16:35), Roman I Khimov wrote:
> > > > > ---
> > > > >  .../binutils-x86_64_i386_biarch.patch              |   25
> > > > > ++++++++++++++++++++ recipes/binutils/binutils_2.18.bb               
> > > > >   | 2 +-
> > > > >  2 files changed, 26 insertions(+), 1 deletions(-)
> > > > >  create mode 100644
> > > > > recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> > > >
> > > > Looks ok. Could you also make this on later versions of toolchains.
> > > > I am not worried about the older ones.
> > >
> > > Works good with 2.19 and 2.19.1, but not 2.18.50.0.7.
> >
> > FWIW 2.18.50.0.7 is default binutils for some distros (angstrom)
> 
> True, didn't check initially its usage, so it's going to be something like 
> attached.
> 
> Do I need to bump PR's for all binutils touched?

yes.


> From 39ead7fd8b9d8b3687b8564828fad4e9d52b128a Mon Sep 17 00:00:00 2001
> From: Roman I Khimov <khimov@altell.ru>
> Date: Wed, 15 Apr 2009 15:48:22 +0400
> Subject: [PATCH 02/11] binutils: add binutils-x86_64_i386_biarch.patch
> 
> Adds 'lib32' directories to binutils search paths on x86_64.
> ---
>  .../binutils-x86_64_i386_biarch.patch              |   26 ++++++++++++++++++++
>  .../binutils-x86_64_i386_biarch.patch              |   25 +++++++++++++++++++
>  .../binutils-x86_64_i386_biarch.patch              |   25 +++++++++++++++++++
>  .../binutils-x86_64_i386_biarch.patch              |   25 +++++++++++++++++++
>  recipes/binutils/binutils_2.18.50.0.7.bb           |    1 +
>  recipes/binutils/binutils_2.18.bb                  |    2 +-
>  recipes/binutils/binutils_2.19.1.bb                |    1 +
>  recipes/binutils/binutils_2.19.bb                  |    1 +
>  8 files changed, 105 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biarch.patch
>  create mode 100644 recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
>  create mode 100644 recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch
>  create mode 100644 recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
> 
> diff --git a/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biarch.patch
> new file mode 100644
> index 0000000..6054434
> --- /dev/null
> +++ b/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biarch.patch
> @@ -0,0 +1,26 @@
> +#!/bin/sh -e
> +## 127_x86_64_i386_biarch.dpatch
> +##
> +## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
> +## DP: Author: Aurelien Jarno <aurel32.debian.org>
> +## DP: Upstream status: Debian specific
> +#
> +# Hacked to apply with quilt
> +# Adapted to binutils 2.18.50.0.7
> +
> +--- binutils/ld/emulparams/elf_i386.sh
> ++++ binutils/ld/emulparams/elf_i386.sh
> +@@ -12,3 +12,13 @@
> + NO_SMALL_DATA=yes
> + SEPARATE_GOTPLT=12
> + SHARABLE_SECTIONS=yes
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
> diff --git a/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch
> new file mode 100644
> index 0000000..b79a76a
> --- /dev/null
> +++ b/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch
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
> diff --git a/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
> new file mode 100644
> index 0000000..b79a76a
> --- /dev/null
> +++ b/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
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
> diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils/binutils_2.18.50.0.7.bb
> index a89431e..fbd9189 100644
> --- a/recipes/binutils/binutils_2.18.50.0.7.bb
> +++ b/recipes/binutils/binutils_2.18.50.0.7.bb
> @@ -12,6 +12,7 @@ SRC_URI = "\
>       file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
>       file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
>       file://binutils-arm-pr7093.patch;patch=1 \
> +     file://binutils-x86_64_i386_biarch.patch;patch=1 \
>       "
>  
>  # powerpc patches
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
> diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binutils_2.19.1.bb
> index c399ab8..1802dfb 100644
> --- a/recipes/binutils/binutils_2.19.1.bb
> +++ b/recipes/binutils/binutils_2.19.1.bb
> @@ -12,6 +12,7 @@ SRC_URI = "\
>       file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
>       file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
>       file://binutils-arm-pr7093.patch;patch=1 \
> +     file://binutils-x86_64_i386_biarch.patch;patch=1 \
>       "
>  
>  # powerpc patches
> diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binutils_2.19.bb
> index aee5840..782d5c7 100644
> --- a/recipes/binutils/binutils_2.19.bb
> +++ b/recipes/binutils/binutils_2.19.bb
> @@ -12,6 +12,7 @@ SRC_URI = "\
>       file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
>       file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
>       file://binutils-arm-pr7093.patch;patch=1 \
> +     file://binutils-x86_64_i386_biarch.patch;patch=1 \
>       "
>  
>  # powerpc patches
> -- 
> 1.6.2.1
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



