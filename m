Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id D49BD7F7DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:45:13 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r81so4170874ilk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=zllJnBUUiH5kO1sf5zX1/17NZxhXyGF5r1zy6WijEQw=;
	b=C9/lKCEsy+rtmbKpjKKNIhpSxd0g/DaVpQh9aUfcB2e1oSg/0wL5IGMikhJ3LYV4k9
	6Bg2orRD5CE6v8fPLenL9B+E6suHqD2GzlY8a3rndR0tDtaEiFU2bpCGZrwXfQz59mpe
	ees0oAhInkjKwuWlZornp/aijY5qp5dMoE4jZ/wh8cxDrlgbr6lESCPNTVKzrFi9uH39
	EBQTSwVhg28z48hi1qRh8SooYJzUVKokOYPzexvXT+hrMt5ynnsjMIT0plzDQ5SpQo0F
	0Upm9swyRG73RvPEMiSsGaM3Yord7e++mIEXWCGJVi7JfoyVTXvrpe+UlnUDpNs0Xalf
	2SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=zllJnBUUiH5kO1sf5zX1/17NZxhXyGF5r1zy6WijEQw=;
	b=eLQwcGZgAJyDTu6UbeUuxtifqDpRQ+TAXySDYu2gC/+pxQPfG3sAAr51sFKyhI7WfC
	oafZCpTwExp0/HLHEVI1LNkmJaPoJoPWvfe5FP/enp4jx5RRRWS3rBD29xsQfjPre8+v
	WEUlw5kOAN4F+opkQp8XyofV0Ys4zcj4IU8YLpdKiHbg/tgRcrc3MhLB/U0fVk+Cwmiv
	ZawTgzyRvjNrrB5bJIrYpreBz63fqHM1KOJkyT1hW2t7suNqJ29C7J5KCaT+jXFiSU18
	9+Ag87QfrM5I2XqA+QssxQx/ETnbACV6/bsY4u0pt2HbTTOy8KnuYfRT4sBZcgQZ4fwT
	aJiQ==
X-Gm-Message-State: APjAAAXlXrhuejFU+/Nd2B2DbvtjKMpaL2KiqkPHdKiuQ2T39MRwMUAY
	yTDhLicgKrVsYrlebv+apP9sZZXSDxBGbo0vBirFQw==
X-Google-Smtp-Source: APXvYqx7Tn8jcisuKcBUIIGOh3xp+kcj2XAM3GoZV37wX/9pVyXn3qKzIBMhNViWmsRfiMgplePyUC95AJ8rFiHfmh8=
X-Received: by 2002:a92:4781:: with SMTP id e1mr9966854ilk.147.1576460714673; 
	Sun, 15 Dec 2019 17:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
	<20191216012047.17312-6-schnitzeltony@gmail.com>
In-Reply-To: <20191216012047.17312-6-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 16 Dec 2019 02:45:03 +0100
Message-ID: <CALbNGRTpjUE0T+0A=p84GVVH2xMr0+qyYu8maZ3C6PxS_MgRfQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gnome-tweaks: initial add 3.34.0
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
X-List-Received-Date: Mon, 16 Dec 2019 01:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2019 at 2:21 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> It runs but the area I did it for 'Startup Applications'is empty and I wo=
uld
> like to disable some and see how gnome stores this.
The more I looked at this it seems we have a misunderstanding
GNOME-people: I don't want to add additional I want to remove as I was
used to in XFCE (and presumed - wrongly? - other desktops would
listen)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../0001-Make-python-path-configurable.patch  | 41 +++++++++++++++++++
>  .../gnome-tweaks/gnome-tweaks_3.34.0.bb       | 32 +++++++++++++++
>  .../packagegroup-gnome-desktop.bb             |  1 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/00=
01-Make-python-path-configurable.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.=
34.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make=
-python-path-configurable.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gno=
me-tweaks/0001-Make-python-path-configurable.patch
> new file mode 100644
> index 000000000..8129f85a4
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python=
-path-configurable.patch
> @@ -0,0 +1,41 @@
> +From db94983c93f38bd8494b47d9fa1b3e5368dc9abe Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Wed, 11 Dec 2019 01:34:01 +0100
> +Subject: [PATCH] Make python path configurable
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [Configuration]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + meson.build       | 2 +-
> + meson_options.txt | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> + create mode 100644 meson_options.txt
> +
> +diff --git a/meson.build b/meson.build
> +index b7da518..d58fb5b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -13,7 +13,7 @@ bindir =3D join_paths(prefix, get_option('bindir'))
> + datadir =3D join_paths(prefix, get_option('datadir'))
> + libexecdir =3D join_paths(prefix, get_option('libexecdir'))
> + localedir =3D join_paths(prefix, get_option('localedir'))
> +-pythondir =3D join_paths(prefix, python3.sysconfig_path('purelib'))
> ++pythondir =3D get_option('python_site_dir')
> +
> + pkgdatadir =3D join_paths(datadir, meson.project_name())
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +new file mode 100644
> +index 0000000..03455ca
> +--- /dev/null
> ++++ b/meson_options.txt
> +@@ -0,0 +1,2 @@
> ++option('python_site_dir', type: 'string', value: '')
> ++
> +--
> +2.21.0
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb=
 b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb
> new file mode 100644
> index 000000000..af4c8c641
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "GNOME tweaks: Advanced options for GNOME 3 session"
> +LICENSE =3D "GPLv3 & CC0-1.0"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSES/CC0-1.0;md5=3D65d3616852dbf7b1a6d4b53b00626032 \
> +    file://LICENSES/GPL-3.0;md5=3D9eef91148a9b14ec7f9df333daebc746 \
> +"
> +
> +DEPENDS =3D "libhandy"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +inherit gnomebase gtk-icon-cache gobject-introspection features_check up=
stream-version-is-even
> +
> +# same as gnome-shell
> +REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
> +
> +SRC_URI[archive.md5sum] =3D "a625d8b167c5549c68e1c6ac7a87d369"
> +SRC_URI[archive.sha256sum] =3D "003326fab46e6faad9485924bca503f0c583e3b4=
553d6f673406eda396205250"
> +SRC_URI +=3D "file://0001-Make-python-path-configurable.patch"
> +
> +EXTRA_OEMESON =3D "-Dpython_site_dir=3D${PYTHON_SITEPACKAGES_DIR}"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/metainfo \
> +    ${PYTHON_SITEPACKAGES_DIR} \
> +"
> +
> +RDEPENDS_${PN} +=3D "gnome-shell python3-core python3-logging libhandy"
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
desktop.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-de=
sktop.bb
> index e27678c89..3c333fe00 100644
> --- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop=
.bb
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop=
.bb
> @@ -21,6 +21,7 @@ RDEPENDS_${PN} =3D " \
>      gnome-settings-daemon \
>      gnome-shell \
>      gnome-shell-extensions \
> +    gnome-tweaks \
>      gmime \
>      gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash \
>  "
> --
> 2.21.0
>

