Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D79D6D253
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:46:06 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o125so10951445qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 17:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XUe3GpqsoaWg5J3/x0iqLv6qsL5MSEQXdRXwmYBL4x8=;
	b=W5BoLL/h+xErl3A/lsh4aWjkq/to0r7w2YtY1D/drLsTw2tQUOOfUPB2XtR1uIqZgz
	G7kB+yZSCzD/7N0xdEUmCIMLVdTRMe8Hd0FzOq83Z8DzuWsUQOVrk/7nut51/1/ztbP4
	/Kel9LQO/xG05/N1TviMORRvbmg1bHBXsBnQ/7J/DYKppAOe4RdIv3vcOxr3BcIb3BAl
	/BVU0+/wkcOZlg5BWOS4/wznY9wi2QtVGoc511qJ/zT1XVmBLvsUDv9fyf+Alnkltg7G
	SyEBBKFSnU+Do6Dq3oMKHINmZEBQUF6kvQYwAdx8zYGl9wgxdYQcKG32JHMYa9J7veW1
	ZOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XUe3GpqsoaWg5J3/x0iqLv6qsL5MSEQXdRXwmYBL4x8=;
	b=dvP+nHU3L6qg5bWMlE2G+WPwkUgdt1DtxiTNr9S+1wYU2W1BOqLa0ZR/aTH2kP/Xby
	E/zwxsuSM5m4kDFfSsrMAN/DnRlvqOYxGQmeb6wj1MhEbkOm1CyrmVb07g6kiyrmUZkf
	G6LI+9CH7+Zk5rFPlouGIi9qc5fF96g3EKCLmNHO0x2yVb8za4gwHrtDIQrXxjaG/5fP
	lgXQ47cjDOHBqcFbCjH5/gr5L11tCVqxG8lzw6c5jB/+vbtDvIyTPVWcmmL7k8/JNMym
	VRSgsGYHVvi571E2nbODOYPbr2tOaKj3XB2AT2YZ0zFRRH6houQZuuaWTgv+BD+J62Di
	FyAQ==
X-Gm-Message-State: AA+aEWbCpOYkvPm3LWSDwjP6A7+0g9Fyx4t6jSLKY8SRL2s9I88cZK8m
	dyx1vfeSc6CLlz7gtR4Gk/me2hgjY/rTlZ6NZExAQEQP
X-Google-Smtp-Source: AFSGD/XZUJ4GxzuJgPuReWHiXjg8Gz/E3xHWICQVwV8gxIf42D7/vQVK5CP3AaYc9r4kq5eZsymDhhIcAkTQETzJw24=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr21271606qkm.102.1543974366976; 
	Tue, 04 Dec 2018 17:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20181205014215.27690-1-dev@sashko.rv.ua>
In-Reply-To: <20181205014215.27690-1-dev@sashko.rv.ua>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Dec 2018 17:45:40 -0800
Message-ID: <CAMKF1sogkZsVND-PsSTb0BbERWHHXYPmCN0P+wXOn6SSh8v+WQ@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@sashko.rv.ua
Subject: Re: [PATCH] jansson: update to 2.12
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
X-List-Received-Date: Wed, 05 Dec 2018 01:46:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr


On Tue, Dec 4, 2018 at 5:42 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License MD5 hash has been changed due to modified copyright year in the
> LICENSE file.
>
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  .../0002-Fix-build-with-glibc-2.28.patch      | 34 -------------------
>  .../{plymouth_0.9.2.bb =3D> plymouth_0.9.4.bb}  |  7 ++--

this seems to be accidental to me. Did you mean to include this change here=
 ?
in any case it would be better to create it as a separate patch.

>  .../recipes-extended/jansson/jansson_2.11.bb  | 12 -------
>  .../recipes-extended/jansson/jansson_2.12.bb  | 12 +++++++
>  4 files changed, 15 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/plymouth/files/0002-Fix-build-wi=
th-glibc-2.28.patch
>  rename meta-oe/recipes-core/plymouth/{plymouth_0.9.2.bb =3D> plymouth_0.=
9.4.bb} (91%)
>  delete mode 100644 meta-oe/recipes-extended/jansson/jansson_2.11.bb
>  create mode 100644 meta-oe/recipes-extended/jansson/jansson_2.12.bb
>
> diff --git a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glib=
c-2.28.patch b/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glib=
c-2.28.patch
> deleted file mode 100644
> index 8638f75b3..000000000
> --- a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.=
patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 0c0345303b7971d6cec478fd8b81d64bc1fbe0f6 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Tue, 21 Aug 2018 23:26:45 +0200
> -Subject: [PATCH] Fix build with >=3D glibc 2.28
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Stolen from [1]
> -
> -[1] https://bugs.freedesktop.org/show_bug.cgi?id=3D102191
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - src/libply-splash-core/ply-terminal.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/libply-splash-core/ply-terminal.c b/src/libply-splash-c=
ore/ply-terminal.c
> -index a0954f2..f3b32fe 100644
> ---- a/src/libply-splash-core/ply-terminal.c
> -+++ b/src/libply-splash-core/ply-terminal.c
> -@@ -32,6 +32,7 @@
> - #include <sys/socket.h>
> - #include <sys/stat.h>
> - #include <sys/types.h>
> -+#include <sys/sysmacros.h>
> - #include <termios.h>
> - #include <unistd.h>
> - #include <wchar.h>
> ---
> -2.14.4
> -
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.4.bb
> similarity index 91%
> rename from meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> rename to meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
> index a5b16c979..b3b60cec6 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
> @@ -17,12 +17,11 @@ PROVIDES =3D "virtual/psplash"
>  RPROVIDES_${PN} =3D "virtual-psplash virtual-psplash-support"
>
>  SRC_URI =3D " \
> -    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.t=
ar.bz2 \
> +    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.t=
ar.xz \
>      file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.pat=
ch \
> -    file://0002-Fix-build-with-glibc-2.28.patch \
>  "
> -SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
> -SRC_URI[sha256sum] =3D "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294=
a06eade29fbed57f"
> +SRC_URI[md5sum] =3D "4efa5551d230165981b105e7c6a50aa7"
> +SRC_URI[sha256sum] =3D "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5f=
faafbb2dd6791351"
>
>  EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk --dis=
able-documentation \
>      --with-logo=3D${LOGO} \
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.11.bb b/meta-oe/r=
ecipes-extended/jansson/jansson_2.11.bb
> deleted file mode 100644
> index 370fa2248..000000000
> --- a/meta-oe/recipes-extended/jansson/jansson_2.11.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY =3D "Jansson is a C library for encoding, decoding and manipulat=
ing JSON data"
> -HOMEPAGE =3D "http://www.digip.org/jansson/"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b70213ec164c7bd876ec2120ba52=
f61"
> -
> -SRC_URI =3D "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "7af071db9970441e1eaaf25662310e33"
> -SRC_URI[sha256sum] =3D "6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed5=
34b82afc3fa5b2f4"
> -
> -inherit autotools pkgconfig
> -
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/r=
ecipes-extended/jansson/jansson_2.12.bb
> new file mode 100644
> index 000000000..5e7a1b8b2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Jansson is a C library for encoding, decoding and manipulat=
ing JSON data"
> +HOMEPAGE =3D "http://www.digip.org/jansson/"
> +BUGTRACKER =3D "https://github.com/akheron/jansson/issues"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc2548c0eb83800f29330040e18b5=
a05"
> +
> +SRC_URI =3D "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "0ed1f3a924604aae68067c214b0010ef"
> +SRC_URI[sha256sum] =3D "5f8dec765048efac5d919aded51b26a32a05397ea207aa76=
9ff6b53c7027d2c9"
> +
> +inherit autotools pkgconfig
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

