Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C215979C9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z20-v6so11939978qti.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+v4QH7cOMVGPY4dWa6ly4kL2l7hU/FBgHvfdIfRKi14=;
	b=TX3B7RzOtAGSKv7N37NF+kquE+0bc2g8jjYkSoI2Rx5V/Z0i20eTJMKFcF8gXfS2NP
	usWkEqsuK4MbB/PBw/eRRO7/5uDRxGmpM5VJxb2gMbV6YNwZqkk0MzCAE3BopZ5fj6Y3
	DzpCKnxjfb575dB8FvsXLEjFQSOh/hvqWZsQsjRxTS0T00B5f6iHTIpK9+VO2XbvPkCB
	XeLCRAwi8Mlc8pqgkdVCwkaUcS3xTmyQb2PNdtAso5JFLXm7ktjuG+SRI2lUl6Q4rEZn
	S5tifuuqCVus0/k7hwDmCX06+W46oOaPSUYpNwQM4mzMhN41+yE+96CrsAAcoOcytD9Z
	wpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+v4QH7cOMVGPY4dWa6ly4kL2l7hU/FBgHvfdIfRKi14=;
	b=ZInxg1O0tn03oJTpJpVjYQjQpOYiPCv7v2S03Vhdg0N9//iq4sBTyx5XlRwv2cVveI
	X/lq1djzOh2k8VVgCam8wbfap75oVoPhY9ZkfvejHu8ucKdJox2KUHoNcZwpy2tsBLl2
	4LI2erWhn6wvQTDBTxVY1tgsp7I6STZ9eoVYLp9YYOMalui5ZC3G61CZJxNPmsNOd5Tb
	Os8tw1XOIfB4jUgfPDmIrsho1UCGI3NWDx4ymovR3EEUN1HobZMkAw+CLQHu8JIW2k+p
	1qdpOdZZncfg0mcUC+rkQT4i9knShG3ruK8vnowj8/WREJyje/iNOA+NIUXRzFgT2vQS
	mUmQ==
X-Gm-Message-State: AGRZ1gID0b1gTH7/G8cJ9/Mbyzo2swBUBxiHb0V0sgl4eLpFnMkqjifp
	/iLkyAtEGqdiPs75yONaH81FYokqX0ibgdhG9kDkSg==
X-Google-Smtp-Source: AJdET5dHI5Arm87EYyxxG/uXr2vFukDYp7UGMeRjZz6A+1IHUrRxfbewo8igTyt1Qunz/UcPIk6iJ+xZ/A6XVL961J8=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr13137204qvg.194.1540870959595;
	Mon, 29 Oct 2018 20:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<16012ad2ea09d37fb7a9b8ad4b0c0f01e641d821.1540830650.git.brendank310@gmail.com>
In-Reply-To: <16012ad2ea09d37fb7a9b8ad4b0c0f01e641d821.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:53:49 -0700
Message-ID: <CAMKF1sqMoSH4TEOxk4T58jmN+ypF9hdAeXKPf6fdB8ir4v-SAg@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 06/16] gnome-settings-daemon: add recipe for gnome-settings-daemon
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:42 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../0001-remove-extraneous-plugins.patch      | 52 +++++++++++++++++++
>  .../gnome3/gnome-settings-daemon_git.bb       | 43 +++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/
> gnome-settings-daemon_git.bb
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
> b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
> new file mode 100644
> index 000000000..6f5599058
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
> @@ -0,0 +1,52 @@
> +gnome-settings-daemon: Disable plugins, dependencies, and compiler errors
> +
> +  * Disable 'no-deprecated-declaration' to allow build to complete
> +  * Remove colord as a dependency
> +  * Remove unused plugins
> +
> +  Upstream-status: Inappropriate [configuration]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/meson.build b/meson.build
> +index d2121623..15fcc88d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -54,7 +54,7 @@ endforeach
> +
> + # compiler flags
> + common_flags = ['-DHAVE_CONFIG_H']
> +-compiler_flags = []
> ++compiler_flags = ['-Wno-deprecated-declarations']
> +
> + if gsd_buildtype.contains('debug')
> +   common_flags += ['-DG_ENABLE_DEBUG']
> +@@ -82,7 +82,6 @@ endif
> +
> + add_project_arguments(common_flags + compiler_flags, language: 'c')
> +
> +-colord_dep = dependency('colord', version: '>= 1.0.2')
> + geocode_glib_dep = dependency('geocode-glib-1.0', version: '>= 3.10.0')
> + gio_dep = dependency('gio-2.0', version: '>= 2.53.0')
> + gio_unix_dep = dependency('gio-unix-2.0')
> +diff --git a/plugins/meson.build b/plugins/meson.build
> +index 3db69da7..accb7b90 100644
> +--- a/plugins/meson.build
> ++++ b/plugins/meson.build
> +@@ -1,16 +1,11 @@
> + enabled_plugins = [
> +   ['a11y-settings', 'A11ySettings'],
> +   ['clipboard', 'Clipboard'],
> +-  ['color', 'Color'],
> +   ['datetime', 'Datetime'],
> +   ['dummy', ''],
> +-  ['power', 'Power'],
> +   ['housekeeping', 'Housekeeping'],
> +   ['keyboard', 'Keyboard'],
> +-  ['media-keys', 'MediaKeys'],
> +   ['mouse', 'Mouse'],
> +-  ['screensaver-proxy', 'ScreensaverProxy'],
> +-  ['sharing', 'Sharing'],
> +   ['sound', 'Sound'],
> +   ['xsettings', 'XSettings']
> + ]
> diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
> b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
> new file mode 100644
> index 000000000..167db3bd2
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION = "GNOME Settings Daemon"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +           libcanberra \
> +           prelink \
> +           glib-2.0 \
> +           gsettings-desktop-schemas \
> +           gnome-desktop3 \
> +           wayland \
> +           wayland-protocols \
> +           gettext-native \
> +           polkit \
> +           upower \
> +           libnotify \
> +           geocode-glib \
> +           libgweather \
> +           lcms2 \
> +           libwacom \
> +           networkmanager \
> +           geoclue \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +SRC_URI = "git://
> gitlab.gnome.org/GNOME/gnome-settings-daemon.git;protocol=http;branch=gnome-3-30
> \
> +           file://0001-remove-extraneous-plugins.patch \
> +           "
> +
> +SRCREV="${AUTOREV}"
>

No AUTOREV as we discussed earlier

+S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson gobject-introspection
> +
> +EXTRA_OEMESON += " -Denable-gtk-doc=false -Dcups=false "
> +
> +FILES_${PN} += "${datadir}"
> +FILES_${PN} += "${libdir}"
> +
> +do_configure_prepend() {
> +       # Fixup the gsettings version
> +       sed -i 's^3.27.90^3.24.1^g' ${S}/meson.build
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

