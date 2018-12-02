Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFB36BC80
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 07:46:45 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id p17so10536056qtl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 23:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xALxHEwfA0nKuVJNfs834C1s8P3wDQIUBzgMhdz8YZs=;
	b=jTgTcIDIMsvmPmHrAVS7tTiFYmh63gU6Td/+YVbgtPNpRfYv31P9P2/M9/7K99nIl1
	/4OcFyIJhiYr5KPexm3DI7VGonqGppuMTUZ4uO2qxWX6QKEQfyXl/zNn6fi/iyGqrdNZ
	DUTUIraqza0e7pISmtiZsqDbhwaSPTEKuCHH5YmTK0GdKabLaOYPdLEd9jIsDMdXGodC
	FbMTordu0ZQcGOQgDplvuW4xPcFcn2LlJxl1GQ+Gw29Dniqgm6PQ8zYIBqSo3gqG3Zyc
	pgxkXaauZtmUsFZF6a2EH3uYhfQJshWl6k0XrsBAcMqtcAWohF+V6i2K8LGZL77gZU7/
	Qs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xALxHEwfA0nKuVJNfs834C1s8P3wDQIUBzgMhdz8YZs=;
	b=LVij7ixFtz/I2inxXxGaeF/cUirMzc1EWW9TEDwugZ/t5dvh6Z66HRz5mDlDYfi1Np
	gARMQxt/sXs9UXad0hkax3Y+bzWQiJlPOXzrDp5jqsfUSrgjlh+STWQm71rDnpSt2Ac2
	U8P4+bAD/sTHtegXy0uQZYVKXwVVO4+67L2f8NMHn2cQPpGm3i+T6g6vKupGWnYt2T8X
	9llrPs8BlevLbNYaNuJH4y01bFeNhohrzOjsjV9tcVBDpCa3I58Wdfl4H9emP4QFa2nb
	bc95UC2INF9LAXCaqsE8m8m7k8qrq50wy65P2Wv2SqN+xG6PmShhDQQ7f424idVHjwVT
	P+tg==
X-Gm-Message-State: AA+aEWbVMa0LUXwXKTHL1/MqnFrel4WU95nXF5xLmy3gUp6cNNXGStS2
	E2OVvIm/Te2J7NPuUrrICnm/68N/lGy1G2zjtAt9SyycknU=
X-Google-Smtp-Source: AFSGD/WHmzm72R0K6O4uJEt0SYABWGOQqgxZnSVYY9fWUp6NrfqWr0I/NBgofOziqjqkIqpD8hngWTV742IT1np8zQU=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr11517557qte.29.1543736800968; 
	Sat, 01 Dec 2018 23:46:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543694144.git.psaavedra@igalia.com>
	<4891c85a2b9bea50776b6f90089f41f6e48d4b2c.1543694144.git.psaavedra@igalia.com>
In-Reply-To: <4891c85a2b9bea50776b6f90089f41f6e48d4b2c.1543694144.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Dec 2018 23:46:14 -0800
Message-ID: <CAMKF1sqOki2vdkGnSwTtkTDoixRmi4buFHeRPA77-w=awLiE9Q@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v3 3/7] ibus: add ibus recipe
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
X-List-Received-Date: Sun, 02 Dec 2018 07:46:45 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/202859/
On Sat, Dec 1, 2018 at 12:00 PM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> Intelligent Input Bus for Linux/Unix https://github.com/ibus/ibus/wiki
>
> Collision with: https://patchwork.openembedded.org/patch/155947/
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97 +++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
>
> diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> new file mode 100644
> index 000000000..505cd108f
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> @@ -0,0 +1,97 @@
> +DESCRIPTION = "A multilingual user input method library"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +SECTION = "inputmethods"
> +
> +SRC_URI = "https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz \
> +          "
> +SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
> +SRC_URI[sha256sum] = "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
> +
> +inherit autotools pkgconfig gettext gtk-immodules-cache gobject-introspection gtk-doc gtk-icon-cache gsettings
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify python3-pygobject adwaita-icon-theme librsvg"
> +DEPENDS_append_class-target = " intltool-native python-pygobject-native"
> +RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
> +
> +PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
> +PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
> +PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
> +
> +PACKAGECONFIG ?= "gtk+ gtk+3"
> +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
> +
> +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'ibus-gtk2.0', '', d)}"
> +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+3', 'ibus-gtk3', '', d)}"
> +
> +EXTRA_OECONF += " \
> +    --disable-emoji-dict \
> +    --disable-unicode-dict \
> +"
> +
> +BBCLASSEXTEND = "native pythonnative"
> +
> +FILES_${PN} += " \
> +    ${sysconfdir}/dconf/profile \
> +    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
> +    ${sysconfdir}/dconf/profile/ibus \
> +    ${libdir}/libibus-1.0.so.5.0.518 \
> +    ${libdir}/libibus-1.0.so.5 \
> +    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
> +    ${bindir}/ibus \
> +    ${bindir}/ibus-setup \
> +    ${bindir}/ibus-daemon \
> +    ${datadir}/ibus/engine \
> +    ${datadir}/ibus/component \
> +    ${datadir}/ibus/setup \
> +    ${datadir}/ibus/component/gtkpanel.xml \
> +    ${datadir}/ibus/component/simple.xml \
> +    ${datadir}/ibus/component/dconf.xml \
> +    ${datadir}/ibus/setup/emojilang.py \
> +    ${datadir}/ibus/setup/main.py \
> +    ${datadir}/ibus/setup/enginecombobox.py \
> +    ${datadir}/ibus/setup/setup.ui \
> +    ${datadir}/ibus/setup/enginedialog.py \
> +    ${datadir}/ibus/setup/i18n.py \
> +    ${datadir}/ibus/setup/engineabout.py \
> +    ${datadir}/ibus/setup/icon.py \
> +    ${datadir}/ibus/setup/keyboardshortcut.py \
> +    ${datadir}/ibus/setup/enginetreeview.py \
> +    ${datadir}/ibus/keymaps/jp \
> +    ${datadir}/ibus/keymaps/kr \
> +    ${datadir}/ibus/keymaps/common \
> +    ${datadir}/ibus/keymaps/modifiers \
> +    ${datadir}/ibus/keymaps/us \
> +    ${datadir}/ibus/keymaps/in \
> +    ${datadir}/applications/ibus-setup.desktop \
> +    ${datadir}/dbus-1/services/org.freedesktop.IBus.service \
> +    ${datadir}/dbus-1/services/org.freedesktop.portal.IBus.service \
> +    ${datadir}/vala/vapi/ibus-1.0.vapi \
> +    ${datadir}/vala/vapi/ibus-1.0.deps \
> +    ${libexecdir}/ibus-engine-simple \
> +    ${libexecdir}/ibus-portal \
> +    ${libexecdir}/ibus-dconf \
> +    ${libexecdir}/ibus-x11 \
> +    ${libexecdir}/ibus-ui-gtk3 \
> +    ${datadir}/GConf/gsettings/ibus.convert \
> +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.gschema.xml \
> +    ${datadir}/bash-completion/* \
> +    ${datadir}/icons/* \
> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py? \
> +"
> +
> +do_configure_prepend() {
> +    export PYTHON=python3
> +}
> +
> +do_install_append() {
> +  # Fix the installation path of the GObject Inspection overrides for Python3
> +  python_version=$(python3 -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')
> +  mkdir -p ${D}/usr/lib/python${python_version}/site-packages/gi/overrides
> +  mv ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides/IBus.py ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
> +  rm -rf ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides
> +  find ${D} -type d -empty -delete
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

