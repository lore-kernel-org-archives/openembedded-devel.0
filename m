Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A98DA782BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:56:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id w191so26155430wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=afVMErZYRixvq5hnblqR+OMx/ZcUl/YLhS5e1Q+C8V0=;
	b=Vd/lw/mv1KZRwknNFqCdxi7fcCD4aDq1wG1ITBj3Kc+j1yVujxFDKy4QHLT1Vo1gRq
	5+EGC+B9D5D7aVXUyzCfonIU+rKpxg+FS0o22vZutAvCWp0rKBO0eJZBBw6n4Y1ww9Js
	BDpKDOJYnie9QdhSPFIW8hCgP2G0tlLjo4kkZ2Jbfcj8i/vNu49TPxfUxbGleEdn9fBL
	GThPHWYj+8BSow5V4NUiKwp9WOGiLmydhMvNHHHuUlB5WtyJFmxwWy2oKcs9vhaWc9F3
	rYa2J9Txbh+5Zu8jsULWp7brG9PxScY3u2kvldzM1yFnn+eeA1NXfmMaYoucBjKP62DK
	J38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=afVMErZYRixvq5hnblqR+OMx/ZcUl/YLhS5e1Q+C8V0=;
	b=LBCwC9IUFWxrnVBOwn80erKYXxfgrKvJkTm0q1B9bQejIU8vvp1ZEEdQCii/4qeT6K
	g6/A1yYJEr5HaBOjqFz3K44EzdRJEJndL2INxjDjG6bbzVdUnxFHfHFMoftnKl0BxTY0
	pN6KoIbbt4a+6LAk82+Br6pCEo/fyRRpieQ94DN0+XV2U9w7jvy2TOkiGBaKvT5ckp8+
	xqweXJVQxzBJXgz93UDB+CJaEfNtdq63LaXHv72tadMsfRrzRypAE4S7UWiY2WYaVAfh
	RYAs0uzL0/PTsgOc/LPC8V2WWC3bSu+0wceFhpRjhjRURGE8l335/F431WtsATPBq0rh
	RaiA==
X-Gm-Message-State: AIVw1135Y0I9/kfkXOmwKSeEh9j2S/dF/h2ncl3VAkwUB1Yq2axJDegF
	pK8G1FlpavqwgyJcOnhBh+FzOzeORg==
X-Received: by 10.80.176.162 with SMTP id j31mr2965012edd.186.1500555399470;
	Thu, 20 Jul 2017 05:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 05:56:09 -0700 (PDT)
In-Reply-To: <8ed13ec40929590cc5daa25b13e8f6c0f10b0f3f.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
	<8ed13ec40929590cc5daa25b13e8f6c0f10b0f3f.1500536448.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 08:56:09 -0400
Message-ID: <CAMKF1srDQnVVjzu7U-UQ00Ooe73Nw==igbYQaOxNAUL=2DLxXQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/8] libgnomekbd: 2.32 -> 3.22
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
X-List-Received-Date: Thu, 20 Jul 2017 12:56:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 3:44 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Remove --disable-schemas-install:
> ...
> |QA Issue: libgnomekbd: configure was passed unrecognised
> options: --disable-schemas-install [unknown-configure-option]
> ...

can you also build all these packages on musl and see if they build ?

>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../gnome-settings-daemon_2.32.1.bb                  |  3 ---
>  .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb     | 20 --------------------
>  .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb     | 17 +++++++++++++++++
>  3 files changed, 17 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
> index c1db6d3..9a18972 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
> @@ -40,7 +40,4 @@ FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
>  FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
>  FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
>
> -
> -PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted libgnomekbd - the recipe will be removed on 2017-09-01 unless the issue is fixed"
> -
>  PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> deleted file mode 100644
> index 852d8e1..0000000
> --- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "GNOME keyboard library"
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
> -
> -SECTION = "x11/gnome/libs"
> -
> -DEPENDS = "gconf gtk+ glib-2.0 libxklavier intltool-native gnome-common-native"
> -
> -inherit gnome
> -
> -SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
> -SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
> -GNOME_COMPRESS_TYPE="bz2"
> -
> -do_configure_append() {
> -    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
> -    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
> -}
> -
> -PNBLACKLIST[libgnomekbd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130608/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
> new file mode 100644
> index 0000000..12ed81d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "GNOME keyboard library"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
> +
> +SECTION = "x11/gnome/libs"
> +
> +DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
> +
> +inherit gnome gobject-introspection gettext
> +
> +GNOME_COMPRESS_TYPE = "xz"
> +
> +SRC_URI[archive.md5sum] = "7b1ebf99f4254c99922163c262c7ff04"
> +SRC_URI[archive.sha256sum] = "340b30dabfebbd4e0e6c0fe34a378966dd5640b5d44595ab8a19b0be255d77df"
> +
> +EXTRA_OECONF_remove = "--disable-schemas-install"
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

