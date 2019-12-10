Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 801ED7F969
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:59:34 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id s8so3979551qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MkCq6lA9FhbXWd03ERqy0UL9TBpkUzQXKvCU8wRCXzA=;
	b=R/g6zNrX3ld+SnHZgR+ZZzq+O6nOGY0FgO9q4GxMwNVJ23F9GEq4VNTewxcOfCp1QP
	23da0w4j04rBc9Hf72ldpp/ywDWjXUb0+0W/uJ+ZzOWy3BkDzcnqDb4p4gT3ppRp9usT
	ceS7ANdp+tT21C5qdHb/LAtQ4kVds5Fl6H2C6x4Az2eBHWSkezOSBUNlWihUBhN9OPh+
	czjJ1WEQ0VEl8t3ajYWd+8gV6UkyKOvWhaMD0DwR6DHKwHkTbUt61h3Z3TtevjK1/wQy
	ZbB89FeZribR1XFeuqzhIcn68hAjVX7SvVbJFv2kv3i98bI05nDg6qsIY4AOHOWtBeaT
	Ndag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MkCq6lA9FhbXWd03ERqy0UL9TBpkUzQXKvCU8wRCXzA=;
	b=nOBVBacCn2hefrHdX2/tnzGusmi9jx50Yhs68ko0MxKkKay4JAqma8n5WX2MHYlpRe
	p3PCNkxIYbZkMqh1bA21Hiucpm/CYJNgiIVL4AoMc6t8S8fjPujWp4j5ChP34rGRJGy8
	7bVsWb5PHn0ahA10l3CQaqL7gIfGBox6oTZ8GZbSVohdpnlXCON/dML6x291VwDUGXVx
	QHmXJicDyELIK8DObmxCIfwKR6qarLLxyZ4nwZcSaRa94CdtFkEnINiK09qE8ThD9v6U
	HBV7tD17MKQfZyc17Ry899A3J0uXfYBJ1HZvdtt+0kM3bR/2mmSjJQJD79xRmBmsvn66
	xi6A==
X-Gm-Message-State: APjAAAXJvR4TVln8fO70kIxlfsArgoF8hnoXXK4JoVuLrIwVJ9UD/GN3
	49+za0Oy+pbihy7FmIdh1rJYpG3bN7T0RP2IIy0WmllJEv8=
X-Google-Smtp-Source: APXvYqyIhRRnw2n1qjLHbDBG5hw8jjMVL/MRBneA1V0K0Pcc6edx5KR3BPflGWijxdZAYehPUYbGreFpsMsVtB/DKPk=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr30827932qtj.80.1576007975005; 
	Tue, 10 Dec 2019 11:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-2-schnitzeltony@gmail.com>
In-Reply-To: <20191209083612.23922-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 11:59:08 -0800
Message-ID: <CAMKF1so_FSMQ3xqvK95hFz6gP8MBwELM=eCg9WHgaLn_gd9eiQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 01/20] gjs: initial add 1.58.3
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
X-List-Received-Date: Tue, 10 Dec 2019 19:59:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 12:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * it is a dependency for upcoming gnome shell
> * this is the latest stable version currently [1]
>
> [1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news
>

Managed to crash qemu on mips, that said it might be fine to mark this
incompatible with mips
since there might be fewer users needing it on mips arch

https://errors.yoctoproject.org/Errors/Details/296905/

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
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
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.58.3.bb
> new file mode 100644
> index 000000000..ddd5196b2
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
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
> +SRC_URI[archive.md5sum] =3D "bce6dea9a6583a8b3c6af5854df76aaf"
> +SRC_URI[archive.sha256sum] =3D "ca9fcd47b95ab0fc445301b2595e51fcea24d6f3=
cd87c190fe07006146d773ae"
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

