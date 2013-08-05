Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1302B61223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:35:04 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m1so5629906oag.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2013 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3udg4yUpjG+DYC215nVHeOqpKMmfNgwRrGQSYJhMVyM=;
	b=vkQUIrOoIVsSN+B6u9HRzr2FNGCKc0r/grP76jO3Q31Tip1qcR9kY9tFEIKN+nfR5Q
	z4OK4KGQ7tV3xiIWdPaU48lmeQoCEkOuG9FecGK5nm8G3vJqk8lXwqg+/BZCFhCktWN0
	PShvYpk2Ll7pBokhpe/+JLRvLtK1dXbpo7A+42NQBXaDVV231a+p6Hs6ByV3dttFeM5h
	8q7IvdcleAbxy5ouFLVhNtVjFpX1V4b84v5ZV5gtbMK7Idwjy5gKeYbg6FAQECNN+BCn
	R8mBTH6mA7Q2uemrRNqamOYQvt4t57HC2xZXGTMzyq0SBAYG25sNkpmElBfrcFWtDxSJ
	aEUw==
X-Received: by 10.182.101.165 with SMTP id fh5mr13717819obb.58.1375691704184; 
	Mon, 05 Aug 2013 01:35:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.37.65 with HTTP; Mon, 5 Aug 2013 01:34:44 -0700 (PDT)
In-Reply-To: <1375399572-4926-1-git-send-email-raj.khem@gmail.com>
References: <1375399572-4926-1-git-send-email-raj.khem@gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Mon, 5 Aug 2013 10:34:44 +0200
Message-ID: <CAGiJk9cZrg5fChUMWstx188gP-UPSXn=rDA7EyWmWsRb-fgBng@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH] qt4: Rename bbappend to match oe-core
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
X-List-Received-Date: Mon, 05 Aug 2013 08:35:04 -0000
Content-Type: text/plain; charset=UTF-8

2013/8/2 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-misc-support/qt4-native_4.8.4.bbappend   |    9 ---------
>  recipes-misc-support/qt4-native_4.8.5.bbappend   |    9 +++++++++
>  recipes-misc-support/qt4-x11-free_4.8.4.bbappend |   11 -----------
>  recipes-misc-support/qt4-x11-free_4.8.5.bbappend |   11 +++++++++++
>  4 files changed, 20 insertions(+), 20 deletions(-)
>  delete mode 100644 recipes-misc-support/qt4-native_4.8.4.bbappend
>  create mode 100644 recipes-misc-support/qt4-native_4.8.5.bbappend
>  delete mode 100644 recipes-misc-support/qt4-x11-free_4.8.4.bbappend
>  create mode 100644 recipes-misc-support/qt4-x11-free_4.8.5.bbappend
>
> diff --git a/recipes-misc-support/qt4-native_4.8.4.bbappend b/recipes-misc-support/qt4-native_4.8.4.bbappend
> deleted file mode 100644
> index b6ee9f2..0000000
> --- a/recipes-misc-support/qt4-native_4.8.4.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# Needed by kdelibs4-native
> -DEPENDS += "openssl-native"
> -PRINC := "${@int(PRINC) + 1}"
> -
> -EXTRA_OECONF += "-no-pch -no-sm -openssl"
> -
> -TOBUILD += "src/phonon"
> -
> -PRINC := "${@int(PRINC) + 1}"
> diff --git a/recipes-misc-support/qt4-native_4.8.5.bbappend b/recipes-misc-support/qt4-native_4.8.5.bbappend
> new file mode 100644
> index 0000000..b6ee9f2
> --- /dev/null
> +++ b/recipes-misc-support/qt4-native_4.8.5.bbappend
> @@ -0,0 +1,9 @@
> +# Needed by kdelibs4-native
> +DEPENDS += "openssl-native"
> +PRINC := "${@int(PRINC) + 1}"
> +
> +EXTRA_OECONF += "-no-pch -no-sm -openssl"
> +
> +TOBUILD += "src/phonon"
> +
> +PRINC := "${@int(PRINC) + 1}"
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> deleted file mode 100644
> index 9d13ffa..0000000
> --- a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DEPENDS_append_omap3 = " libgles-omap3"
> -DEPENDS_append_ti33x = " libgles-omap3"
> -PRINC := "${@int(PRINC) + 3}"
> -
> -#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
> -QT_CONFIG_FLAGS_append = " --reduce-exports"
> -
> -# Build OpenGL/ES support if available
> -QT_GLFLAGS_omap3 = "-opengl es2 "
> -# Needed by kdelibs
> -QT_DISTRO_FLAGS = "-accessibility -sm"
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.5.bbappend b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> new file mode 100644
> index 0000000..9d13ffa
> --- /dev/null
> +++ b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> @@ -0,0 +1,11 @@
> +DEPENDS_append_omap3 = " libgles-omap3"
> +DEPENDS_append_ti33x = " libgles-omap3"
> +PRINC := "${@int(PRINC) + 3}"
> +
> +#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
> +QT_CONFIG_FLAGS_append = " --reduce-exports"
> +
> +# Build OpenGL/ES support if available
> +QT_GLFLAGS_omap3 = "-opengl es2 "
> +# Needed by kdelibs
> +QT_DISTRO_FLAGS = "-accessibility -sm"
> --
> 1.7.9.5

Applied,
thanks for the patch.

In a follow up I have removed the platform dependent configuration, as
it has become an unnecessary hurdle.


Some questions towards meta-kde "users":
Do you actually use (or try to use) meta-kde, or is it just enabled
for tests like world builds?
What are your expectations regarding this layer?
I am asking since the feedback for this layer is very sparse (mostly
because it is very uncommon for embedded devices and the recipes are
incomplete).

TBH it is unlikely that my priorities will shift back to meta-kde in this year.



-- 
Regards
Samuel

