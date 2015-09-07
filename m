Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 466AA762B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 11:55:35 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so52628708igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Sep 2015 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=JfUBzf8sFuTRRcnoNbhV0ZPHxeEyfaZfi/RwX3EOTPU=;
	b=Mf+qyNUXyh58mllA16KXP4O3hb2FcIhC5ReXEa/Ytz+9K/y3fJDhy3Xne7+Mmo8QFG
	FYze90MDLQSWpT7gjupjFYmY7hiMoCB6cpCXItclvYzG2YzC3jrVXGKGmFBPzyJVUqCc
	lVcTRmFPXht128y66Z+EbWVGaLnnvZcp3mHoxPRXl6rUz3vXpEhf6we6Fi6HB38EEd2h
	CS4XGkxXqyCXBclCGVJbGMx9PHrtzuQ588+gMQ1qarqHqNFlYt1z5cnQNGTXgU4VnmWP
	0XN311nB4uBweOxV7OmrzgNO/lBAEsYTsBdCed87FhvgRKM5UKgXFjG2YS4peQMJXmsb
	98Kw==
MIME-Version: 1.0
X-Received: by 10.50.43.193 with SMTP id y1mr27054839igl.64.1441626935149;
	Mon, 07 Sep 2015 04:55:35 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 7 Sep 2015 04:55:35 -0700 (PDT)
In-Reply-To: <1441265994-116028-1-git-send-email-raj.khem@gmail.com>
References: <1441265994-116028-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 7 Sep 2015 13:55:35 +0200
Message-ID: <CALbNGRR8RCdZM0=DKErk4X_ge1wpa9FjxE1y1966T7Dz9D4DLw@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Sep 2015 11:55:40 -0000
Content-Type: text/plain; charset=UTF-8

Played around a bit with this and have two notes (which could be done
as follow up - depends on Martin's apply queue)

On Thu, Sep 3, 2015 at 9:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> new file mode 100644
> index 0000000..b8c82ed
> --- /dev/null
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -0,0 +1,61 @@
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
> +EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk \
^ --disable-gtk is set by PACKAGCONFIG
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
^ plymouth-set-default-theme can be called with '-R' |
'--rebuild-initrd' which makes use of plymouth's initrd-scripts. So I
would replace 'bash' by '${PN}-initrd' here
> +
> +SYSTEMD_SERVICE_${PN} = "plymouth-start.service"
> --
> 2.5.1


Andreas

