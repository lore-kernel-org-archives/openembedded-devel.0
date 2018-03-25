Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 57062605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 15:39:49 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id q198so3157799vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x1dowuF1JCoR4WOqShhedRdwACk3Hfncztnok8EMyag=;
	b=CHLUgpkrPPF5kyX7+vLjohettJgbrVH6AMsZwhvfIionw2yV6ceNeA1qmXYjKodW9R
	0sR65L1BxE2N2E20lC6BtW1JkE/I+nGYvA+1rqXbvX8BXfm/xizya25hSVRmPfmH36vK
	BKrF5o7EuUsFmq769nzQdfCr8kcxwrXUbhIGPihOcm1PjwXZzzhZXoiWgUoV3RwLA3dK
	Cq6RHVqtIrl1SrjUVn+u2sjrTODzP/LOMvMlg0Dll+vMmQ6BwbvB04w4CNZKVQrMybp6
	AsWA34CuKC23c+3Vry3xlSyAuVSZQlkqr6suFF0gJIXz+iXxP8m6nf/gMmcGf0Sw4snc
	CD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x1dowuF1JCoR4WOqShhedRdwACk3Hfncztnok8EMyag=;
	b=TOjLQkZoC9R4XLv2uZNQk8dKjMpW5cZYpQELTqZGDTAxS4nNgYW4fj1nRbj2deH98p
	W28lLTtp2PhETSOQkteD6b4LMXhth+EbDz2iK08RUX9/4/DxiiQbsQKIrIULVHGNV+/x
	s0rhIjlk3gEZwW5LtJe91isojtNK4ZRyYdS35m0/btJdGqcgQnYapO9CD6M/g5pNi/9p
	sZytcQJRsd1fqZ0t+6VrLjvmjzD/aXaf62mbqL0wqdnaUAxxqmHPhAutr+buC0HmTSrY
	ke65/eIj6Zli7b6xGQLt3hsr05IQKAhUb7jPqHlYkwq51bWIWX5x11S6xzYlTzur7wqm
	3hGg==
X-Gm-Message-State: AElRT7FDYyTvIMTQrgpQvUd6lGWiLRF2sCJYMOJ97+N2/XM+eC8pkXg6
	WQAPM+KCNxrMsmDYYK8gUbH6hq1kNQoVeTk4iBs=
X-Google-Smtp-Source: AG47ELuj0n8R0mjdWt2S82yAnva6Lcfzko/v8518q2/kTulYHfiWB+4zzLGW+zcEcfJc7L2uSeflIEUjPPz2fO/+Rl8=
X-Received: by 10.31.201.70 with SMTP id z67mr22621906vkf.154.1521992390755;
	Sun, 25 Mar 2018 08:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
	<20180325123520.16452-6-schnitzeltony@gmail.com>
In-Reply-To: <20180325123520.16452-6-schnitzeltony@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 25 Mar 2018 15:39:40 +0000
Message-ID: <CANx9H-DVBfnq6cJuacs=suFguUKdUD2DR9XsabU3CtP7oM63EQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/20] metacity: remove
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
X-List-Received-Date: Sun, 25 Mar 2018 15:39:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems pretty safe to remove:

=E2=80=9CMetacity was the default window manager used by the GNOME 2 deskto=
p
environment until it was replaced by Mutter in GNOME 3.=E2=80=9D =E2=80=94W=
ikipedia [1]

[1] https://en.m.wikipedia.org/wiki/Metacity
On Sun, Mar 25, 2018 at 5:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> * as far as I can see nothing uses it - please stand up if I am wrong
> * this version was released in 2012
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 27 ----------------=
-
>  .../metacity/remove-yelp-help-rules-var.patch      | 28 ----------------=
-
>  .../recipes-gnome/metacity/metacity_2.34.13.bb     | 35
> ----------------------
>  3 files changed, 90 deletions(-)
>  delete mode 100644
> meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.pat=
ch
>  delete mode 100644
> meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.pat=
ch
>  delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>
> diff --git
> a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.p=
atch
> b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.p=
atch
> deleted file mode 100644
> index 539d756b3..000000000
> ---
> a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.p=
atch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From e7fd072f0df968f342878b77098e97ff07ed28d7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 14 Jul 2017 10:26:31 -0700
> -Subject: [PATCH] ui: Define _GNU_SOURCE
> -
> -it becomes portable across musl and glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/ui/theme.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/ui/theme.c b/src/ui/theme.c
> -index 84b57a0..c7eafc8 100644
> ---- a/src/ui/theme.c
> -+++ b/src/ui/theme.c
> -@@ -60,6 +60,7 @@
> - #include <gtk/gtk.h>
> - #include <string.h>
> - #include <stdlib.h>
> -+#define _GNU_SOURCE
> - #define __USE_XOPEN
> - #include <math.h>
> -
> ---
> -2.13.3
> -
> diff --git
> a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.p=
atch
> b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.p=
atch
> deleted file mode 100644
> index 1970e9afb..000000000
> ---
> a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.p=
atch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Remove unused variable (YELP_HELP_RULES)
> -
> -Upstream-Status: Pending
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -
> -Index: metacity-2.34.13/doc/creating_themes/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
> -+++ metacity-2.34.13/doc/creating_themes/Makefile.am
> -@@ -1,6 +1,5 @@
> - ### This part of Makefile.am can be customized by you.
> -
> --@YELP_HELP_RULES@
> -
> - # The name of the directory in /usr/share/gnome/help/,
> - # and the name of the main .xml file:
> -Index: metacity-2.34.13/doc/creating_themes/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
> -+++ metacity-2.34.13/doc/creating_themes/Makefile.in
> -@@ -455,7 +455,6 @@ uninstall-am:
> -       mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
> -
> -
> --@YELP_HELP_RULES@
> -
> - # Tell versions [3.59,3.63) of GNU make to not export all variables.
> - # Otherwise a system limit (for SysV at least) may be exceeded.
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> deleted file mode 100644
> index 370de7000..000000000
> --- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SECTION =3D "x11/wm"
> -SUMMARY =3D "Metacity is the boring window manager for the adult in you"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> -
> file://src/include/main.h;endline=3D24;md5=3Dc2242df552c880280315989bab62=
6b90"
> -
> -DEPENDS =3D "gsettings-desktop-schemas startup-notification gtk+ gconf
> gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
> -PR =3D "r1"
> -
> -inherit gnomebase update-alternatives distro_features_check
> -# depends on startup-notification which depends on virtual/libx11
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> -
> -GNOME_COMPRESS_TYPE =3D "xz"
> -
> -SRC_URI =3D
> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.ta=
r.${GNOME_COMPRESS_TYPE};name=3Darchive
> \
> -           file://remove-yelp-help-rules-var.patch \
> -           file://0001-ui-Define-_GNU_SOURCE.patch \
> -           "
> -SRC_URI[archive.md5sum] =3D "6d89b71672d4fa49fc87f83d610d0ef6"
> -SRC_URI[archive.sha256sum] =3D
> "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
> -
> -ALTERNATIVE_${PN} =3D "x-window-manager"
> -ALTERNATIVE_TARGET[x-window-manager] =3D "${bindir}/metacity"
> -ALTERNATIVE_PRIORITY =3D "10"
> -
> -EXTRA_OECONF +=3D "--disable-xinerama"
> -
> -do_configure_prepend() {
> -    sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.i=
n
> -}
> -
> -FILES_${PN} +=3D "${datadir}/themes ${datadir}/gnome-control-center
> ${datadir}/gnome"
> -RDEPENDS_${PN} +=3D "gsettings-desktop-schemas"
> -
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

