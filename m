Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TxbJU-0005c7-L0
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 11:42:47 +0100
Received: by mail-ob0-f172.google.com with SMTP id ta17so1761835obb.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=69T62ZLvRoIhUrLXwmYnwG7AevAeKxDkTx670PDaWHc=;
	b=xzwaO7tSxkhGy2wtFNE9P/hho7BoeyBDXkQTiA23N/yOkWS7gxfMTxh5/PDVgBrKtI
	MFFfJERPKecJZo1r4TKQRiKXeh1qt0rhv1ef6vC/BouBGrYn5CH9X4OuO7wnf4GYExef
	/ByExEz4AS2dkmwIlDhaAxHVgcfJG2HLaq5Wguj12mR7vRLknqdrpSlq9Wk8HSXKkgKW
	OLA/PpMmJjnwyEvCAUgUGKXr4w60MTZd221WfndDov9T+NXqFasLA/RhkeREwfykPs3o
	U0svjLauKpSO7ZIoD35pyvSIXg/zGWK8CMR5DyrIPy0FItkP2W/Voymo7HIa/DoQ8B5r
	sAlA==
MIME-Version: 1.0
X-Received: by 10.182.226.74 with SMTP id rq10mr16412779obc.32.1358850434156; 
	Tue, 22 Jan 2013 02:27:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 22 Jan 2013 02:27:13 -0800 (PST)
In-Reply-To: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
References: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 08:27:13 -0200
X-Google-Sender-Auth: NB2ObZDi8t6LAxKg6X3T5gHWafI
Message-ID: <CAP9ODKo5B6jmL5ndibMZ8iTbNMRa6tUYqBCirJaYQVJ_7DH-1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 22 Jan 2013 10:42:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 21, 2013 at 4:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
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

Please add a new line in the end of the file to avoid future warnings about it.

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



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


