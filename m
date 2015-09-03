Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1740477020
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 07:22:32 +0000 (UTC)
Received: by ioii196 with SMTP id i196so48002259ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 00:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sqYLsT+nytuU7Mp9u9cZgfhbdutb+0mjgR3uU1e3iFg=;
	b=Ljl2QXGB17wj5OlLONQMUPkyLwp8OLyDzImIcXky/e2xI6f0IZtenbcrqXxsxcz6yn
	4jBlDcafpZYQ0rFR1abHQ+XbTbNYZH6FZOphjSJEGGmD0Gwi0JN9W4ymY1ZEwceXge8D
	6hBt5KoXNyPedu+8lwruK3iXZbUaOdbiOHnHx2LsAxCgCQfsWwho58oN8MfApqXScgFR
	IvaxQGwbTTzwe8+DUkK7q2vfs5dxf4mEuixX8uKUrHVWzm2xsN6vbZM202EYFJkMMGC0
	De723v1Gw3SEWU956tCZe92dUtcLuC01uPZ7zLWi1KkXGUei8mZx3mN2+U3EFvXDmsZG
	+Mww==
MIME-Version: 1.0
X-Received: by 10.107.152.12 with SMTP id a12mr18082123ioe.148.1441264952508; 
	Thu, 03 Sep 2015 00:22:32 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 3 Sep 2015 00:22:32 -0700 (PDT)
In-Reply-To: <1441240011-49718-1-git-send-email-raj.khem@gmail.com>
References: <1441240011-49718-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 3 Sep 2015 09:22:32 +0200
Message-ID: <CALbNGRThO4BbD=VVG=HVOUXeCfAeCaV2-TdYvLhrw+oryjmLZQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] plymouth: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Sep 2015 07:22:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

I was on my TODO - thanks. Tiny comment below.

On Thu, Sep 3, 2015 at 2:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 62 +++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> new file mode 100644
> index 0000000..f7f1af2
> --- /dev/null
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -0,0 +1,62 @@
> +SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
> +
> +DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
> +               (even before the root filesystem is mounted!) that provides a \
> +              graphical boot animation while the boot process happens in the background."
> +
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
> +SECTION = "base"
> +
> +LICENSE = "GPLv2+"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +DEPENDS = "libcap libpng cairo dbus udev"
> +PROVIDES = "virtual/psplash"
> +RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
> +
> +SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
> +SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
> +
> +EXTRA_OECONF += " --enable-shared --disable-static \
> +                  --disable-gtk --disable-pango \
^ This line should go - it is in PACKAGECONFIG
> +                 --with-logo=${LOGO} \
> +                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
> +                "
> +
> +PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
> +PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
> +PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
> +
> +PACKAGECONFIG ??= "pango"
> +
> +LOGO ??= "${datadir}/plymouth/bizcom.png"
> +
> +PACKAGECONFIG_append_x86 = " drm"
> +PACKAGECONFIG_append_x86-64 = " drm"
> +
> +inherit autotools pkgconfig systemd
> +
> +
> +do_install_append() {
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
> +       install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
> +       # Remove /var/run from package as plymouth will populate it on startup
> +       rm -fr "${D}${localstatedir}/run"
> +}
> +
> +PACKAGES =+ "${PN}-initrd ${PN}-set-default-theme"
> +
> +FILES_${PN}-initrd = "${libdir}/plymouth/plymouth/*"
> +FILES_${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
> +
> +FILES_${PN} += "${systemd_unitdir}/system/*"
> +FILES_${PN}-dbg += "${libdir}/plymouth/renderers/.debug"
> +
> +
> +RDEPENDS_${PN}-initrd = "bash dracut"
> +RDEPENDS_${PN}-set-default-theme = "bash"
> +
> +SYSTEMD_SERVICE_${PN} = "plymouth-start.service"
> --
> 2.5.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

