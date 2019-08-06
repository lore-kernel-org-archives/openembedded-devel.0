Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F66A7ECCF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 18:10:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id r6so81260023qtt.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K/YuJb5tVyE53SYzS0ku8XesAum0cJWIxp2XCO64d+Q=;
	b=Bu03ESOtNw2TFPZW8m/s3eTgYI/bpg0mNR/rjbr3KZUWgBvltqRm0Ey2yDNyJky/24
	dE6iHMTSBNGQlcDos5tyFt1qEiR3gtyC2t8PZ4JjWcLPYhO7z2Qi8vVcb5GhL2jCbVRj
	mlheFmBEG0q9wg35YfnFa9ope9QxygER9JfH9LGyxfwKniJqsfluX0yn/ScPBMNcdsKH
	yaAJihliAN2qnB9yUbr1bNzxayr1Uee2kzysTVsOjd5+fZKd7foljKwwv4+MED9VuxBT
	ud7JNHqRNZ3cj/jEurg4AmAWHJkpMURRNiJk9B/sxfTf3Aq1D9o7qGDdgomwdgA7REjP
	tdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K/YuJb5tVyE53SYzS0ku8XesAum0cJWIxp2XCO64d+Q=;
	b=lGeh+wsXeMcAUB/aBS/7pQu6R4LwGkaZx73MMieGsqF4joodxBHERfBRyEzcU1JG+/
	xpdDubRicqSjVlBii03uH5luylwqgipAT+3GFBMLdhjfJkLY/bp8K3HsY+JBDYMUqN7/
	ZAifaRIi+5cdNjX4DdGHrAAQjqHmQUvbJZEBLdBOXkBwYiQmZ5Bj/upwsVOJSmxP4C1O
	VmYfOdLTQaYlESTiQKV0eKrYNsbOMhdJAFKVHa9K7Y5+88+XEgGiUgOOtoILEikSwxJz
	RTVrB7n52wQZIv5hH96os+BAasuI8BB0hBBOXK4eOfUXF+EXD1Ipnw+w75U/OER36pec
	G4Cw==
X-Gm-Message-State: APjAAAXp5JK/eB8+NS7ELKM3++m8LLS0aInDLbQ4jXOEN0Xs+9Trnwsr
	UTP9r049Plq4ylwccOXTKVia92spxGOzBS/oF//hV/HJ
X-Google-Smtp-Source: APXvYqwY+Few2/Sa5wcvHlXmLkqWcs9uFrCV8RwRXEn6ic7tdJmO2st0SqzcWGZyIHREGJYUJBydnejo5GO1QpDd94g=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr4352879qtn.378.1565115016605; 
	Tue, 06 Aug 2019 11:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190806153909.5965-1-bunk@stusta.de>
In-Reply-To: <20190806153909.5965-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 11:09:50 -0700
Message-ID: <CAMKF1srCPKCXiAVqBcZWXPytw7dLgPVED-deVbHRrHABbGcTxg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] modemmanager: Use a simpler workaround for the clang build
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
X-List-Received-Date: Tue, 06 Aug 2019 18:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 6, 2019 at 8:39 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The check whether the compiler understands an option is broken
> in m4/compiler_warnings.m4, but if we are just workarounding it
> then do a minimal workaround without patching.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...-not-set-Wno-unused-but-set-variable.patch | 30 -------------------
>  .../modemmanager/modemmanager_1.10.0.bb       |  3 +-
>  2 files changed, 1 insertion(+), 32 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
> deleted file mode 100644
> index dcbe01d5e..000000000
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d4f73b037d11d20f080e74c05df28853fb833075 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 7 Dec 2018 22:59:47 -0800
> -Subject: [PATCH] Do not set Wno-unused-but-set-variable
> -
> -This is gcc specific warning, not implemented by  pretending to be  gcc
> -like compilers e.g. clang.
> -
> -We will pass this option from recipe
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - m4/compiler_warnings.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/m4/compiler_warnings.m4 b/m4/compiler_warnings.m4
> -index f498a28..e65e97f 100644
> ---- a/m4/compiler_warnings.m4
> -+++ b/m4/compiler_warnings.m4
> -@@ -11,7 +11,7 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
> -                     -Wdeclaration-after-statement -Wstrict-prototypes \
> -                     -Wno-unused-parameter -Wno-sign-compare \
> -                     -Wno-deprecated-declarations \
> --                    -Wno-unused-but-set-variable -Wformat-security; do
> -+                    -Wno-unused -Wformat-security; do
> -               SAVE_CFLAGS="$CFLAGS"
> -               CFLAGS="$CFLAGS $option"
> -               AC_MSG_CHECKING([whether gcc understands $option])
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
> index 1ad19e8f7..ef5af3a57 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
> @@ -12,7 +12,6 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
>  DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
>
>  SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
> -           file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
>             "
>  SRC_URI[md5sum] = "92d25176d0cc9d588ca29700b33c7d98"
>  SRC_URI[sha256sum] = "fd0f39996025dac96995daea8a58ec7dd571582f7563a8ae0d5f65b571b76ee2"
> @@ -33,7 +32,7 @@ PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
>  EXTRA_OECONF = " \
>      --with-udev-base-dir=${nonarch_base_libdir}/udev \
>  "
> -CFLAGS_append_toolchain-gcc = " -Wno-unused-but-set-variable"
> +EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
>

I think this will disable extra warnings but since the patch was
anyway doing same although just for one warning
this is fine by me. I still would like to have an option to be able to
build with default warning set and have easy way for OE devs to
fix/report such issues to package upstream instead of masking them
out.

>  FILES_${PN} += " \
>      ${datadir}/icons \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

