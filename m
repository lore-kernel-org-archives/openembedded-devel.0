Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD5637FA42
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:31:31 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z3so344401qvn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ASERlOnc7Xp7xEo5rZLA9tIbxH+rbH0W6erPj+8pXG0=;
	b=JYhaHwxNRxKQND+vgSvcgk6ili6Qo7D10cTd+7FrHUHtT9myJYOBd/TgwLzlVDtksA
	Sg9Kesf8ruKwdaW1XULWsueE4rGLoZHF7FLxpv/7cJ8rgR8OkSXyG7J/BMdF4tmBQZA0
	2gtP++cwuT+NgKPTwvYbelmzFMWayW9DyKSFHRCW5kDCIOlbu8mVUINGAnBd+TBSxERB
	3xy41Sm+q0LiILH871Yu3ENl8G43USb5fZTt4moFIP3TY47FR5Uv3BWpDz7j0tWB5sf0
	Hk5wwiAK4b5tf9n59t4tDqbFBYmZ017Ovzih4vmBOFxaOlQJMduqleD834PUNqYESMoe
	VqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ASERlOnc7Xp7xEo5rZLA9tIbxH+rbH0W6erPj+8pXG0=;
	b=I8n9k4ODwlozVoj1T4mhwhb36TXANZ7LxN/RfFJHG0vhazmwIgqxQUYSC0xE6Z6kcD
	tA/1EHapMh3P0DxgWsJs0wajnE+Vp5TfrCp8nvxWre8r1kHfDRfthK+k1iQy3DjWdUd+
	2vgc0sOw0F5CRb/ekuPnBxqvjd/FDbWQnz/vKS1jQ7gVJKLno8onOkXbhcl5mMAOMdfi
	VGxQjxfRaOxdaztDSsf5ih0IyhBjMD9R1J5Gr+0zNecBKh7QXsJ2D1eeJHXdk8l+RSvG
	F+J/lkWe3zonnbKOiuBRDrDZjmzZsJfIimUHT0PEx+J0cd5dRleoYYoa8rQdLkaaNTNo
	Irlw==
X-Gm-Message-State: APjAAAU7V4w1u4Vbu4dyT1+aPAuN59avVwo1gT04vu2xQ08GJhxNAbsD
	TN5G72XuEzci10cEwpyFxOYkVZlf2/TJkO8aIKg=
X-Google-Smtp-Source: APXvYqz7dA6nobXrUQm70tEBQ0OUNZw2q+LfOcXwQr3EsjddN+sER8Vo0A0AUKozlOJXTSdgnxHysy1mBPCOOW9NLRY=
X-Received: by 2002:a0c:ada3:: with SMTP id w32mr13783117qvc.99.1575660692254; 
	Fri, 06 Dec 2019 11:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-6-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-6-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Dec 2019 11:31:06 -0800
Message-ID: <CAMKF1soSL_ad0Ry6hq0=ihEBQh6RnoCWdedFrC_H30G=QuJ35w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/21] gjs: initial add 1.58.1
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
X-List-Received-Date: Fri, 06 Dec 2019 19:31:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails to build on mips due to qemu-user crash FYI

https://errors.yoctoproject.org/Errors/Details/290491/

On Thu, Dec 5, 2019 at 4:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> * it is a dependency for upcoming gnome shell
> * this is currently tha latest stable version [1]
>
> [1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb    | 37 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.=
patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> new file mode 100644
> index 000000000..0953214fb
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> @@ -0,0 +1,33 @@
> +From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Sat, 18 May 2019 01:14:07 +0200
> +Subject: [PATCH] Disable tests on host
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + configure.ac | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fa4e136..056e96e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" !=3D "xno"], [
> + ])
> + AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" !=3D "xno"])
> +
> +-AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
> +-TESTS_LOCALE=3D$($srcdir/build/choose-tests-locale.sh)
> +-AC_MSG_RESULT([$TESTS_LOCALE])
> ++TESTS_LOCALE=3DC
> + AC_SUBST([TESTS_LOCALE])
> +
> + AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
> +--
> +2.20.1
> +
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.58.1.bb
> new file mode 100644
> index 000000000..85730c742
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "Javascript bindings for GNOME"
> +LICENSE =3D "MIT & LGPLv2+"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Dbeb29cf17fabe736f0639b09ee6e76fa \
> +    file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
> +"
> +
> +GNOMEBASEBUILDCLASS =3D "autotools"
> +
> +DEPENDS =3D "mozjs gtk+3"
> +
> +inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even
> +
> +SRC_URI[archive.md5sum] =3D "49ae54cccbf212e2f80fa1726d5f974c"
> +SRC_URI[archive.sha256sum] =3D "b4df16ea87dc78c0df5412f9134efb14f7c51077=
3aee117d5ad4cda75646c6f5"
> +SRC_URI +=3D "file://0001-Disable-tests-on-host.patch"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disabl=
e-introspection"
> +
> +EXTRA_OECONF =3D " \
> +    --without-dbus-tests \
> +    --disable-installed-tests \
> +"
> +
> +do_configure_prepend() {
> +    # make configure find gobject-introspection test code. Although we s=
et
> +    # --disable-installed-tests gjs builds them
> +    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}/con=
figure.ac
> +}
> +
> +FILES_${PN} +=3D "${datadir}/gjs-1.0/lsan"
> +
> +PACKAGES =3D+ "${PN}-valgrind"
> +FILES_${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> +RSEPENDS_${PN}-valgrind +=3D "valgrind"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

