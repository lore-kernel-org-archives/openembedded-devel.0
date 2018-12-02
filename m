Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 160A26BC80
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 07:48:30 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id i7so10512190qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 23:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L5ejy4FRMx18gVoKtJJENpubCQzYNtk4kjv7q7K+/QI=;
	b=ADMnQzHs+KSweLho3cmfLecphRWNEi1xFWGO8C8CY8Su6fpXavbjLbI41ilaxBOzh7
	42eRdqzCy3RC65qbt7MYu0Fl9+mxvXXhonOHmv7ZJr8+Qu5dgFByGxaWY4E52sThKXuQ
	4j0irtBnyYwynYz85fmsfYTdUN1WG59BywSbvprZF36TWLZKtjZv3CsN0M+8kdwTq+dz
	WStHzD8CGEfZbZdNC6tcL0QPfnEway++Ki6DWrEBX0j+01N4CWmeXirDRjuuYn6WgozY
	XUMWbzcANmxXyZziCBHb8cohIrg4IHW5wAmflGdSHsv5YrdaHtC8Y1P5CVzn2IDwch8M
	wWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L5ejy4FRMx18gVoKtJJENpubCQzYNtk4kjv7q7K+/QI=;
	b=qAaMl8oSBrHMnZqf98Shem1dDNHq6Pezrgl2MxH/AEEUMQaAAgBisqUJ63yRaAkO/o
	xFtBSfn5Rn1sNALPZiCXv18un/FCCYGbmJDG4w2q211ADYUkFZVaqMbyRDhcD4QGiDCw
	hOMnND9ta+7j4A/8wrgkgoSSBk5dGo57p+fOjk6wG+lFl2EKCRfcIgFtc2/9TW3bv009
	2A7PWEzPY57cRwZ5tY6FJfLGzleKOiU830IVLvjPogoWjruyu3OUl8sZ+faPyctmohUE
	fu0TBc4P7cYQhNmjDDELkQSsY8ARmJQcR/aFhYztlSHFufRxwIw6Rtau0n31yM8LXwpC
	JNQQ==
X-Gm-Message-State: AA+aEWYymhu+OG7QrqXJlfLDIHE63hsC1tsBtzDhWTKciRpFOEkA6Hkj
	qt0mXxD/CDSCQYenOOod2aCNFac6xsufkegVubnpR/foMXo=
X-Google-Smtp-Source: AFSGD/X3BVlqnzkydWs7V4IojIT9S8lQQ582OWPP/QEYeeoLtYTP8N4aB7eHqPUBEopoyicZyIhOcgNlp/OZjLmaL/c=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr11316384qvd.224.1543736906630;
	Sat, 01 Dec 2018 23:48:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543694144.git.psaavedra@igalia.com>
	<4891c85a2b9bea50776b6f90089f41f6e48d4b2c.1543694144.git.psaavedra@igalia.com>
	<CAMKF1sqOki2vdkGnSwTtkTDoixRmi4buFHeRPA77-w=awLiE9Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqOki2vdkGnSwTtkTDoixRmi4buFHeRPA77-w=awLiE9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Dec 2018 23:48:00 -0800
Message-ID: <CAMKF1spBm9k=vmQWYT1qXnrKG7UnUpYDdHa78yho-Y5sW_M++Q@mail.gmail.com>
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
X-List-Received-Date: Sun, 02 Dec 2018 07:48:31 -0000
Content-Type: text/plain; charset="UTF-8"

and
http://errors.yoctoproject.org/Errors/Details/202863/
On Sat, Dec 1, 2018 at 11:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> http://errors.yoctoproject.org/Errors/Details/202859/
> On Sat, Dec 1, 2018 at 12:00 PM Pablo Saavedra <psaavedra@igalia.com> wrote:
> >
> > Intelligent Input Bus for Linux/Unix https://github.com/ibus/ibus/wiki
> >
> > Collision with: https://patchwork.openembedded.org/patch/155947/
> >
> > Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > ---
> >  meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97 +++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> >
> > diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > new file mode 100644
> > index 000000000..505cd108f
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > @@ -0,0 +1,97 @@
> > +DESCRIPTION = "A multilingual user input method library"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> > +SECTION = "inputmethods"
> > +
> > +SRC_URI = "https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz \
> > +          "
> > +SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
> > +SRC_URI[sha256sum] = "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
> > +
> > +inherit autotools pkgconfig gettext gtk-immodules-cache gobject-introspection gtk-doc gtk-icon-cache gsettings
> > +
> > +REQUIRED_DISTRO_FEATURES = "x11"
> > +
> > +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify python3-pygobject adwaita-icon-theme librsvg"
> > +DEPENDS_append_class-target = " intltool-native python-pygobject-native"
> > +RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
> > +
> > +PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
> > +PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
> > +PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
> > +
> > +PACKAGECONFIG ?= "gtk+ gtk+3"
> > +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
> > +
> > +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'ibus-gtk2.0', '', d)}"
> > +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+3', 'ibus-gtk3', '', d)}"
> > +
> > +EXTRA_OECONF += " \
> > +    --disable-emoji-dict \
> > +    --disable-unicode-dict \
> > +"
> > +
> > +BBCLASSEXTEND = "native pythonnative"
> > +
> > +FILES_${PN} += " \
> > +    ${sysconfdir}/dconf/profile \
> > +    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
> > +    ${sysconfdir}/dconf/profile/ibus \
> > +    ${libdir}/libibus-1.0.so.5.0.518 \
> > +    ${libdir}/libibus-1.0.so.5 \
> > +    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
> > +    ${bindir}/ibus \
> > +    ${bindir}/ibus-setup \
> > +    ${bindir}/ibus-daemon \
> > +    ${datadir}/ibus/engine \
> > +    ${datadir}/ibus/component \
> > +    ${datadir}/ibus/setup \
> > +    ${datadir}/ibus/component/gtkpanel.xml \
> > +    ${datadir}/ibus/component/simple.xml \
> > +    ${datadir}/ibus/component/dconf.xml \
> > +    ${datadir}/ibus/setup/emojilang.py \
> > +    ${datadir}/ibus/setup/main.py \
> > +    ${datadir}/ibus/setup/enginecombobox.py \
> > +    ${datadir}/ibus/setup/setup.ui \
> > +    ${datadir}/ibus/setup/enginedialog.py \
> > +    ${datadir}/ibus/setup/i18n.py \
> > +    ${datadir}/ibus/setup/engineabout.py \
> > +    ${datadir}/ibus/setup/icon.py \
> > +    ${datadir}/ibus/setup/keyboardshortcut.py \
> > +    ${datadir}/ibus/setup/enginetreeview.py \
> > +    ${datadir}/ibus/keymaps/jp \
> > +    ${datadir}/ibus/keymaps/kr \
> > +    ${datadir}/ibus/keymaps/common \
> > +    ${datadir}/ibus/keymaps/modifiers \
> > +    ${datadir}/ibus/keymaps/us \
> > +    ${datadir}/ibus/keymaps/in \
> > +    ${datadir}/applications/ibus-setup.desktop \
> > +    ${datadir}/dbus-1/services/org.freedesktop.IBus.service \
> > +    ${datadir}/dbus-1/services/org.freedesktop.portal.IBus.service \
> > +    ${datadir}/vala/vapi/ibus-1.0.vapi \
> > +    ${datadir}/vala/vapi/ibus-1.0.deps \
> > +    ${libexecdir}/ibus-engine-simple \
> > +    ${libexecdir}/ibus-portal \
> > +    ${libexecdir}/ibus-dconf \
> > +    ${libexecdir}/ibus-x11 \
> > +    ${libexecdir}/ibus-ui-gtk3 \
> > +    ${datadir}/GConf/gsettings/ibus.convert \
> > +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.gschema.xml \
> > +    ${datadir}/bash-completion/* \
> > +    ${datadir}/icons/* \
> > +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
> > +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py? \
> > +"
> > +
> > +do_configure_prepend() {
> > +    export PYTHON=python3
> > +}
> > +
> > +do_install_append() {
> > +  # Fix the installation path of the GObject Inspection overrides for Python3
> > +  python_version=$(python3 -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')
> > +  mkdir -p ${D}/usr/lib/python${python_version}/site-packages/gi/overrides
> > +  mv ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides/IBus.py ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
> > +  rm -rf ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides
> > +  find ${D} -type d -empty -delete
> > +}
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

