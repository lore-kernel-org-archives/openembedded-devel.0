Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OenoC-0003XB-FO
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 13:31:25 +0200
Received: by bwz10 with SMTP id 10so732376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ScmS+vK6ZQ4Z9jQQ05HqcOgDPNQ5kyXLPa90fr8eUJQ=;
	b=b7wchKRlcHAP+Cw778ylZ7BFNLBv+zzH4GdjgwNHr17U1BubRHTIxHVWAXeFtYSO0M
	7f0lIfQZuBg0kAacLBIpPIjBtf/9q4wyWQE0hyEIrxsoFGdBHxETV70+f39Ui10Wj2c1
	lOURpCdcPw5Buo32gTXycsZ84FJUpDOUL6M7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WVRK0pEZVh4UZlAMN4qNLl6BiJOlhdJpkmYHPFh3jI3o7Ae3g+0FWKkS5fMseQJJee
	cbAAKz1ufiP502Yw/5nVCPIHr3y9IZElTpbjaJms8evincEeM2R4F+9LCOGjw2YV4skm
	IAK4eA5u2c82fyY3fAwvBnKTI3M455pQ1YjLE=
MIME-Version: 1.0
Received: by 10.204.83.167 with SMTP id f39mr1061896bkl.151.1280489465452; 
	Fri, 30 Jul 2010 04:31:05 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 30 Jul 2010 04:31:05 -0700 (PDT)
In-Reply-To: <1280488945-6196-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1280488945-6196-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Fri, 30 Jul 2010 13:31:05 +0200
Message-ID: <AANLkTi=mKtSOSr5cowgEVqNV2_QOHjMLVU033J-+CTMk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] liboil: removed old cruft before 0.3.15
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
X-List-Received-Date: Fri, 30 Jul 2010 11:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/30 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

> Versions before 0.3.15 are more than 2 years old and not referenced
> anywhere.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch |   11 -----------
>  recipes/liboil/liboil_0.3.10.bb                   |   15 ---------------
>  recipes/liboil/liboil_0.3.11.bb                   |   18
> ------------------
>  recipes/liboil/liboil_0.3.14.bb                   |   21
> ---------------------
>  recipes/liboil/liboil_0.3.9.bb                    |   15 ---------------
>  5 files changed, 0 insertions(+), 80 deletions(-)
>  delete mode 100644 recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
>  delete mode 100644 recipes/liboil/liboil_0.3.10.bb
>  delete mode 100644 recipes/liboil/liboil_0.3.11.bb
>  delete mode 100644 recipes/liboil/liboil_0.3.14.bb
>  delete mode 100644 recipes/liboil/liboil_0.3.9.bb
>
> diff --git a/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
> b/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
> deleted file mode 100644
> index 49485e3..0000000
> --- a/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /m4/orig-as-gcc-inline-assembly.m4 2007-03-17 04:03:30.000000000 +0200
> -+++ /m4/as-gcc-inline-assembly.m4      2007-11-20 12:20:24.000000000 +0200
> -@@ -38,7 +38,7 @@
> - [
> -   AC_MSG_CHECKING([if compiler supports FPU instructions on PowerPC])
> -
> --  AC_TRY_COMPILE([], [__asm__ ("fadd 0,0,0"::) ], [flag_ok=yes],
> [flag_ok=no])
> -+  AC_TRY_COMPILE([], [double x = 0; __asm__ ("fadd 0,0,0"::"f" (x):"32")
> ], [flag_ok=yes], [flag_ok=no])
> -
> -   if test "X$flag_ok" = Xyes ; then
> -     $1
> diff --git a/recipes/liboil/liboil_0.3.10.bb b/recipes/liboil/
> liboil_0.3.10.bb
> deleted file mode 100644
> index 7e5f951..0000000
> --- a/recipes/liboil/liboil_0.3.10.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Liboil is a library of simple functions that are optimized
> for various CPUs."
> -HOMEPAGE = "http://liboil.freedesktop.org/"
> -LICENSE = "liboil"
> -PR = "r1"
> -
> -SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz<http://liboil.freedesktop.org/download/$%7BP%7D.tar.gz>
> "
> -
> -inherit autotools pkgconfig
> -
> -do_stage() {
> -       autotools_stage_all
> -}
> -
> -SRC_URI[md5sum] = "770f656bca8166dab33b322d5886a4bf"
> -SRC_URI[sha256sum] =
> "4587753a023550a066abe59a7e467c1af35b9f5e81bfb40a12463ad2df8f088c"
> diff --git a/recipes/liboil/liboil_0.3.11.bb b/recipes/liboil/
> liboil_0.3.11.bb
> deleted file mode 100644
> index d8e055a..0000000
> --- a/recipes/liboil/liboil_0.3.11.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "Liboil is a library of simple functions that are optimized
> for various CPUs."
> -HOMEPAGE = "http://liboil.freedesktop.org/"
> -LICENSE = "liboil"
> -PR ="r3"
> -
> -DEPENDS = "glib-2.0"
> -
> -SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz<http://liboil.freedesktop.org/download/$%7BP%7D.tar.gz>\
> -           file://ppc-detect-fpu.patch"
> -
> -inherit autotools pkgconfig
> -
> -do_stage() {
> -       autotools_stage_all
> -}
> -
> -SRC_URI[md5sum] = "65ce3266be385d0c7cd9a1157433332f"
> -SRC_URI[sha256sum] =
> "deb6530d40ecad2b849d68912500e6d03bab4ac63de7a97340d05af1d7cf0ad4"
> diff --git a/recipes/liboil/liboil_0.3.14.bb b/recipes/liboil/
> liboil_0.3.14.bb
> deleted file mode 100644
> index 92db760..0000000
> --- a/recipes/liboil/liboil_0.3.14.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Liboil is a library of simple functions that are optimized
> for various CPUs."
> -HOMEPAGE = "http://liboil.freedesktop.org/"
> -LICENSE = "liboil"
> -PR = "r1"
> -
> -# The configure script seems to have bogus checks, so let's not make it
> the default
> -DEFAULT_PREFERENCE = "-1"
> -
> -DEPENDS = "glib-2.0"
> -
> -SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz<http://liboil.freedesktop.org/download/$%7BP%7D.tar.gz>\
> -          "
> -
> -inherit autotools pkgconfig
> -
> -do_stage() {
> -       autotools_stage_all
> -}
> -
> -SRC_URI[md5sum] = "7a9f719e50656b795c06c0167012a84f"
> -SRC_URI[sha256sum] =
> "a40c09db6ee24e03aa81f58329a57e45e55462a2e0f619b3796d4bf942c23f2f"
> diff --git a/recipes/liboil/liboil_0.3.9.bb b/recipes/liboil/
> liboil_0.3.9.bb
> deleted file mode 100644
> index c066fa4..0000000
> --- a/recipes/liboil/liboil_0.3.9.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Liboil is a library of simple functions that are optimized
> for various CPUs."
> -HOMEPAGE = "http://liboil.freedesktop.org/"
> -LICENSE = "liboil"
> -PR = "r1"
> -
> -SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz<http://liboil.freedesktop.org/download/$%7BP%7D.tar.gz>
> "
> -
> -inherit autotools pkgconfig
> -
> -do_stage() {
> -       autotools_stage_all
> -}
> -
> -SRC_URI[md5sum] = "5d139b1fb16f0e93f0c84290ad2aaff8"
> -SRC_URI[sha256sum] =
> "dd4d680ce95e586a1bbe767e1a7b25e1c53f842b8be6cf4e30e89cfa8232dd90"
> --
> 1.7.2
>

Given that
- they are so old
- no distro pinned them
- deletion is in compliance with the guidelines of the TSC
I say:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Thanks for cleaning this up!

Frans

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

