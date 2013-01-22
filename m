Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TxceE-0001UE-8K
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:08:18 +0100
Received: by mail-ob0-f181.google.com with SMTP id wc18so1563580obb.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=gWageqlkN2beFuBmsSXqv7YDw3/cI56FEnjVgM5gLXc=;
	b=RZR+7CKgypzGxYYTt6p+MCGcty6L3n++Z5Ni9GeShLK4zMcHHEIJHtx06xWXC/Oyeg
	tpJdnRVQgCSC9L+zPijjZHK5W8SPo0br+zUmC/4ntYpHLIGYTBD/TgwKlgkZ1csXgR+T
	hwQszpxaQy+//0fuj/8/yuvu18wkhPboXX01kWmgfMPIKuQ8LTI05M0ijj6XgGkEfLEq
	PeXlKLR04cOyudDtrT12zxLVEwacxyIQuwMNrD6ArBdqsuN6lCiqKF4YPUUFT46BwgiA
	IjA8dbWuUeKN1cBE0vpaz0QdkPcFRL4AzXK5k3rsJlMNwR0v4Ju2NpfYcuyJ5ELKSmNQ
	E8Jg==
MIME-Version: 1.0
X-Received: by 10.60.24.161 with SMTP id v1mr16106954oef.115.1358855563790;
	Tue, 22 Jan 2013 03:52:43 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Tue, 22 Jan 2013 03:52:43 -0800 (PST)
In-Reply-To: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
References: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 12:52:43 +0100
Message-ID: <CAGiJk9f-qGrO67xKBxMLpePWUq_cdvzhyH7TrCuad0xxU51GDQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH 1/2] qt4-native, qt4-x11-free: Rename bbappends to match current OE-Core recipes
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
X-List-Received-Date: Tue, 22 Jan 2013 12:08:18 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/21 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  README                                           |    3 ++-
>  recipes-misc-support/qt4-native_4.8.3.bbappend   |    8 --------
>  recipes-misc-support/qt4-native_4.8.4.bbappend   |    8 ++++++++
>  recipes-misc-support/qt4-x11-free_4.8.3.bbappend |   12 ------------
>  recipes-misc-support/qt4-x11-free_4.8.4.bbappend |   12 ++++++++++++
>  5 files changed, 22 insertions(+), 21 deletions(-)
>  delete mode 100644 recipes-misc-support/qt4-native_4.8.3.bbappend
>  create mode 100644 recipes-misc-support/qt4-native_4.8.4.bbappend
>  delete mode 100644 recipes-misc-support/qt4-x11-free_4.8.3.bbappend
>  create mode 100644 recipes-misc-support/qt4-x11-free_4.8.4.bbappend
>
> diff --git a/README b/README
> index a6164c9..0635e10 100644
> --- a/README
> +++ b/README
> @@ -9,6 +9,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
>
>  Contributors:
>  Copyright 2012 - Kai Kang
> +Copyright 2013 - Khem Raj
>  Copyright 2012 - Koen Kooi
>  Copyright 2012 - Robert Yang
>  Copyright 2011, 2012 - Samuel Stirtzel
> @@ -46,4 +47,4 @@ FAQ / Troubleshooting:
>    Q: How to report bugs / request features?
>    A: Send your bugreports / feature requests to the openembedded-developer mailing list.
>       Include the [meta-kde] tag in the subject for easier readability.
> -     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> \ No newline at end of file
> +     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> diff --git a/recipes-misc-support/qt4-native_4.8.3.bbappend b/recipes-misc-support/qt4-native_4.8.3.bbappend
> deleted file mode 100644
> index 5b04eb4..0000000
> --- a/recipes-misc-support/qt4-native_4.8.3.bbappend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# Needed by kdelibs4-native
> -DEPENDS += "openssl-native"
> -
> -EXTRA_OECONF += "-no-pch -no-sm -openssl"
> -
> -TOBUILD += "src/phonon"
> -
> -PRINC := "${@int(PRINC) + 1}"
> \ No newline at end of file
> diff --git a/recipes-misc-support/qt4-native_4.8.4.bbappend b/recipes-misc-support/qt4-native_4.8.4.bbappend
> new file mode 100644
> index 0000000..5b04eb4
> --- /dev/null
> +++ b/recipes-misc-support/qt4-native_4.8.4.bbappend
> @@ -0,0 +1,8 @@
> +# Needed by kdelibs4-native
> +DEPENDS += "openssl-native"
> +
> +EXTRA_OECONF += "-no-pch -no-sm -openssl"
> +
> +TOBUILD += "src/phonon"
> +
> +PRINC := "${@int(PRINC) + 1}"
> \ No newline at end of file
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.3.bbappend b/recipes-misc-support/qt4-x11-free_4.8.3.bbappend
> deleted file mode 100644
> index 32a6f27..0000000
> --- a/recipes-misc-support/qt4-x11-free_4.8.3.bbappend
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
> -QT_CONFIG_FLAGS_append = " --reduce-exports"
> -
> -# Build OpenGL/ES support if available
> -QT_GLFLAGS_omap3 = "-opengl es2 "
> -DEPENDS_append_omap3 = " libgles-omap3"
> -DEPENDS_append_ti33x = " libgles-omap3"
> -
> -# Needed by kdelibs
> -QT_DISTRO_FLAGS = "-accessibility -sm"
> -
> -PRINC := "${@int(PRINC) + 3}"
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> new file mode 100644
> index 0000000..32a6f27
> --- /dev/null
> +++ b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> @@ -0,0 +1,12 @@
> +#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
> +QT_CONFIG_FLAGS_append = " --reduce-exports"
> +
> +# Build OpenGL/ES support if available
> +QT_GLFLAGS_omap3 = "-opengl es2 "
> +DEPENDS_append_omap3 = " libgles-omap3"
> +DEPENDS_append_ti33x = " libgles-omap3"
> +
> +# Needed by kdelibs
> +QT_DISTRO_FLAGS = "-accessibility -sm"
> +
> +PRINC := "${@int(PRINC) + 3}"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


Applied thanks,

the newline Otavio mentioned was added too.


FYI: I had the same change in a local update branch (it is not ready yet)
On this branch I planned the following changes:
  "Sanitize" the layer with the oe-stylize script
  Update to latest versions of kdelibs, kde-workspace, kde-runtime and
libkactivities
  Enable full Krita support again (it was broken with Qt<4.8.2)
  Add full packaging imported from rpm .spec files (don't know yet if
this will work)

After the branch is done the layer will be split to desktop and mobile versions,
because the kdelibs are built with different configure flags for
desktop and mobile profiles causing ABI incompatibility.


--
Regards
Samuel


