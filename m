Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1379179C8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n12so6396228qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=83fLFmhiv3b4JL+oCa+Pj+iUbFqfeW6ZVkFgagCWd9Y=;
	b=fZrdg5DqL6eaXMyRJvhuVvcozdbPefhfsuOPpkS5PWUjK7Yi0PwFP/wk4O839AtgZ4
	0ogajTJSH0hXaMfKjLUylKDlyoaj42Zogx9hKlLoe+Gm/Ju/or8hQuWLhg484qQvOx3t
	QN3dsuuL9/k9AXGQqJ0FzF5zCE8UP6NIpUeKo7bOhRhh/2Xi638Jsw9Ny32nb4zTbv2z
	nfvKZTnF5ofuKbkd7Yt00ruDK36D2acePSyycJDYyAez4uSME+OppCbDQWYG+eUNfFq5
	iC4xfdM0aXTMMozt5QuWb+b8YUNsL5GQJdtQz6Ua9fWj2UhMgQ4ZY8XtBBgqTi1QZo1M
	y6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=83fLFmhiv3b4JL+oCa+Pj+iUbFqfeW6ZVkFgagCWd9Y=;
	b=GFPMA4YcHAMLqJ1frbjxLavDJWWgAWTOOUIYZ3fWLMTt+KMBoY3feTC4Ql0Pqh4GtG
	FWKJ3n5bPausDmgay4JZIqcZ2U7Vd2gWSwiRpgwgs6pbaQx7+PmFU5Oz/Bms/hOEHIaO
	wgBY6Z1sxT1roMnXE7IGEfDWgFL8/asTsikHxQYus+ij15iQS6C/Gv/MytSwg1S48cpT
	TcmwoJdYkAth0sgVLIJoeSUlEF9098vY4vwICjOMhYl7QYWAx53DMopgCuKqrGfikiuW
	hHRrPWTAPKfDePFNtb49EIWEh57SUJmOL0/0TdDp3SQwrlvh9THOFfYgn70vzICAup9O
	PYFQ==
X-Gm-Message-State: AGRZ1gKRC9+A2POvEr7OS48sN6RhmG43XlyHcPxQeRpBcm1wtkw6UseB
	gVYbCo9+WTsHSESUb/K7GZwcpICy0bXo3fpO/2Rjow==
X-Google-Smtp-Source: AJdET5fMK8rYyiyQ3s6LL2NvMDEkGLeenLCA4AfKQ0GFETOG2vS32kdJBEECba2GRh0Vf1fnDzdTWPZ0dp3HQOeZkdo=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr3926871qka.206.1540870956840; 
	Mon, 29 Oct 2018 20:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ef386b75ac95432d2fa8c4bcfcda95f16db6d555.1540830650.git.brendank310@gmail.com>
In-Reply-To: <ef386b75ac95432d2fa8c4bcfcda95f16db6d555.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:44:58 -0700
Message-ID: <CAMKF1sqeqF8WO3JbAm_rwXcBzRFt5kMVurm-8LQxk4+HazA7mg@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 13/16] gnome-shell: add recipe for gnome-shell.
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:43 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../gnome-shell/0001-dont-detect-python.patch | 24 ++++++++++
>  .../recipes-gnome/gnome3/gnome-shell_git.bb   | 46 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
> b/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
> new file mode 100644
> index 000000000..50d874061
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
> @@ -0,0 +1,24 @@
> +gnome-shell: Add decoration to tweak python3 path
> +
> +  The python detection used in the meson script doesn't
> +  resolve correctly. Add a decoration to allow the
> +  do_configure_prepend to sed in the correct path for
> +  python3-native.
> +
> +  Upstream-status: Innappropriate [embedded-specific]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 178e05899..d3d8df97b 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -13,7 +13,7 @@ script_data.set('libdir', libdir)
> + script_data.set('libexecdir', libexecdir)
> + script_data.set('pkgdatadir', pkgdatadir)
> + script_data.set('pkglibdir', pkglibdir)
> +-script_data.set('PYTHON', python.path())
> ++script_data.set('PYTHON', '@PYTHON3_PATH@')
> + script_data.set('VERSION', meson.project_version())
> +
> + foreach tool : ['gnome-shell-extension-tool', 'gnome-shell-perf-tool']
> diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
> b/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
> new file mode 100644
> index 000000000..d8f8a4c77
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION = "GNOME Shell"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +            glib-2.0 \
> +            gsettings-desktop-schemas \
> +            gjs \
> +            gdm \
> +            gnome-desktop3 \
> +            mutter \
> +            wayland \
> +            wayland-protocols \


Wayland is a distro feature so we need to control these depends with that
knob

>
> +            evolution-data-server \
> +            libcroco \
> +            polkit \
> +            gnome-bluetooth \
> +            gstreamer \
> +            keybinder \
> +            gnome-settings-daemon \
> +            ibus \
> +            librsvg \
> +            sassc-native \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://
> gitlab.gnome.org/GNOME/gnome-shell.git;protocol=http;branch=master;tag=3.30.1
> \
> +           file://0001-dont-detect-python.patch \
> +           "
> +
> +RDEPENDS_gnome-shell += " python3-core python3-pygobject
> gnome-settings-daemon gnome-bluetooth gdm "
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson gobject-introspection gettext
> +
> +EXTRA_OEMESON += " -Dman=false -Dnetworkmanager=false "
> +
> +FILES_${PN} += "${datadir}"
> +FILES_${PN} += "${libdir}"
> +FILES_${PN} += "${bindir}"
> +
> +do_configure_prepend() {
> +       # Fixup the gsettings version
> +       sed -i 's^3.27.90^3.24.1^g' ${S}/meson.build
> +       sed -i "s^@PYTHON3_PATH@^${RECIPE_SYSROOT_NATIVE}/${bindir}/python3^g"
> ${S}/meson.build
> +}
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

