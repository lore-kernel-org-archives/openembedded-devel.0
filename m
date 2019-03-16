Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5C36C44A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:09:13 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id k74so3585834ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7rQimJVgu9Bw0JodrxJpMolBWi2P0LdGoU/uQAlGvcY=;
	b=CWRvmEEIxYeANrB4YBbbYxCqXBZKG00VMxnRYOHHQOQjReJPzCQxDOsDV8NYwjeK9k
	9RknN7mxYHC7Cqz1jfNStWk1B0oNTBMu61ns4BOa3hxo1jXj8vfSEvqVYi1qrtp70Uq4
	ZOJ8pJ96FKLWjVzxNMbrL14H02YrSEhgRD+iGhgDSf6bIEOWJwnzbltFcXNyvXPuHV+z
	AuSOR5Y07QOgJAcYfy7A96x92ANxM/jbPxaT3MenhPUun7tBP8ahE80Pa/9GtH5p1wF/
	PN194gM+uYHGLmaJjYMhjUp3SlzG7EfwciObHDYctdZVwW/yjxanoz+n5x6XSgCu64b/
	KoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7rQimJVgu9Bw0JodrxJpMolBWi2P0LdGoU/uQAlGvcY=;
	b=eV0fZ2gds2qRgedFeQVOr2TkhE/tws04pFkXTNZ1YxEOOg1CdJ4lLhdBoTrFYnKn8J
	k4ry35wP27ytUwXcfr+ogxiFAZKQTSJUsdTEWTbXJK+hqG0zvKC9KNwbpg9igyljEXJd
	YPq1zbRkCKiU1XhFUUPs1er50TBRxius2LpxfjOWnle9QrGUZ/N8b6wSkHSLL2BXQiU8
	LZKYMo5Lb71UqsUQWUFH+UzKsn7Hp9WRKHNDHhbrXJD5VgMGhnrvghPirFL3cD68mY83
	QdW14Tqk1CdGtb9w5szRen3OaikloGm4qa8AVqjj7+wxWmGoBe6/SFlnznULYk38i6F1
	3lLQ==
X-Gm-Message-State: APjAAAUrD2MpLbVN9rfzBMhnpA3jhxeaNzybNV4qAkzGC+9LfmgARKLt
	eltQ7Kpy2q5dhnwgSFqEOxwXXi/d8bwfGI/4BtQ=
X-Google-Smtp-Source: APXvYqyCbfAnzQjW/jHO6An44NoSdmAPRXEWwotSpIsaTJ6IkALxxdEe3dYntZlBE0xGlVBiwyXcEyZdqQIUzmp6sz0=
X-Received: by 2002:a24:7d84:: with SMTP id b126mr4727635itc.58.1552727354257; 
	Sat, 16 Mar 2019 02:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190316080428.36688-1-raj.khem@gmail.com>
In-Reply-To: <20190316080428.36688-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 16 Mar 2019 10:09:02 +0100
Message-ID: <CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 09:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> xfce4-mixer can be replaced with xfce4-pulseaudio-plugin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...001-Fix-build-after-update-of-xfconf.patch | 61 -------------------
>  .../xfce4-mixer/xfce4-mixer_4.11.0.bb         | 17 ------
>  .../packagegroup-xfce-extended.bb             |  1 -
>  3 files changed, 79 deletions(-)
>  delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-bui=
ld-after-update-of-xfconf.patch
>  delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0=
.bb
>
> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-afte=
r-update-of-xfconf.patch b/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fi=
x-build-after-update-of-xfconf.patch
> deleted file mode 100644
> index 31216c0381..0000000000
> --- a/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-updat=
e-of-xfconf.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 6ecaeced291f935a9d41e9bc33411358c95a5e91 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Mon, 22 Jan 2018 15:35:08 +0100
> -Subject: [PATCH] Fix build after update of xfconf
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -xfconf stopped using dbus-glib so required flags must be included here
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - panel-plugin/Makefile.am | 2 ++
> - xfce4-mixer/Makefile.am  | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
> -index a494682..b094472 100644
> ---- a/panel-plugin/Makefile.am
> -+++ b/panel-plugin/Makefile.am
> -@@ -27,6 +27,7 @@ libmixer_la_CFLAGS =3D                                =
                 \
> -       $(LIBXFCE4UI_CFLAGS)                                            \
> -       $(LIBXFCE4PANEL_CFLAGS)                                         \
> -       $(XFCONF_CFLAGS)                                                \
> -+      $(DBUS_GLIB_CFLAGS)                                             \
> -       $(GST_PLUGINS_BASE_CFLAGS)                                      \
> -       $(KEYBINDER_CFLAGS)
> -
> -@@ -48,6 +49,7 @@ libmixer_la_LIBADD =3D                                =
                 \
> -       $(LIBXFCE4UI_LIBS)                                              \
> -       $(LIBXFCE4PANEL_LIBS)                                           \
> -       $(XFCONF_LIBS)                                                  \
> -+      $(DBUS_GLIB_LIBS)                                               \
> -       $(GST_PLUGINS_BASE_LIBS)                                        \
> -       -lgstaudio-0.10                                                 \
> -       -lgstinterfaces-0.10                                            \
> -diff --git a/xfce4-mixer/Makefile.am b/xfce4-mixer/Makefile.am
> -index 4af69e9..e076fc8 100644
> ---- a/xfce4-mixer/Makefile.am
> -+++ b/xfce4-mixer/Makefile.am
> -@@ -32,6 +32,7 @@ xfce4_mixer_CFLAGS =3D                                =
                         \
> -       $(UNIQUE_CFLAGS)                                                \
> -       $(LIBXFCE4UTIL_CFLAGS)                                          \
> -       $(LIBXFCE4UI_CFLAGS)                                            \
> -+      $(DBUS_GLIB_CFLAGS)                                             \
> -       $(XFCONF_CFLAGS)                                                \
> -       $(GST_PLUGINS_BASE_CFLAGS)
> -
> -@@ -46,6 +47,7 @@ xfce4_mixer_LDFLAGS =3D                               =
                         \
> -       $(UNIQUE_LIBS)                                                  \
> -       $(LIBXFCE4UTIL_LIBS)                                            \
> -       $(LIBXFCE4UI_LIBS)                                              \
> -+      $(DBUS_GLIB_LIBS)                                               \
> -       $(XFCONF_LIBS)                                                  \
> -       $(GST_PLUGINS_BASE_LIBS)                                        \
> -       -lgstaudio-0.10                                                 \
> ---
> -2.14.3
> -
> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/m=
eta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> deleted file mode 100644
> index 6c057d8845..0000000000
> --- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "A volume control application based on GStreamer"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> -
> -inherit xfce-panel-plugin
> -
> -DEPENDS +=3D "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
> -
> -SRC_URI =3D " \
> -    http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${B=
PN}-${PV}.tar.bz2 \
> -    file://0001-Fix-build-after-update-of-xfconf.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "1b3753b91224867a3a2dfddda239c28d"
> -SRC_URI[sha256sum] =3D "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda=
5609570c57112de2"
> -
> -RDEPENDS_${PN} =3D "gst-meta-audio"
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-exten=
ded.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> index 5f8c03cc5b..b412c27262 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -64,7 +64,6 @@ RRECOMMENDS_${PN} =3D " \
>      xfce4-appfinder \
>      xfce4-screenshooter \
>      xfce4-power-manager \
> -    xfce4-mixer \
>      ristretto \
>      xfce4-taskmanager \
>      gigolo \
> --
> 2.21.0
>
NAK - it works perfectly fine and xfce4-pulseaudio-plugin is not a
replacement because it is sitting on top of pulseaudio. Pulseaudio is
poison if you want to produce music (alll the jack based  stuff)

Andreas

