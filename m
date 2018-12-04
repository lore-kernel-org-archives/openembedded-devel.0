Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9876C526
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 05:00:31 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id v11so16672540qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 21:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jo1uqG3RjygLgso9XKbqDddqE7tGvUT5dA4Zph6apVA=;
	b=Y3QKLIeN5QWydhTzb5x8GKSD5YpdFiwiaqa1ipOAHiGHP9jt9XSEk5LFb4n40HjNQM
	l0KHAt/aYyoXjvJXOPwHHfnqPYeFt6fCXc1VoR9idrFO2kQ5btaXJ+5gwQXnysSKoLMz
	F2iwz72RJiK6vBUsLSi1871uQtJlHrSJWinRZDTROZIApmUtpZ6j63PpW3t/Yba6Skf0
	9Tk953Jp5+HV3g/pI6m2GOU69qtgeuQReV/5xzb0hBhWA2xVjyJGue7djnZahlkcs/41
	ERC8P1G1oDauW1IEFw6hSBMbnDQj/CnBeeAQMsxYVG+IeTWFkzxXij0JO6+67rXqa90S
	2Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jo1uqG3RjygLgso9XKbqDddqE7tGvUT5dA4Zph6apVA=;
	b=VRg9OaYWdhnRbw48SpnL8FLsQD9oCI7Lh3AbVPLlp393osZaPBluZMkxFIdfmUlMYX
	ta+X3zsvmbbTt0KbDCEVDJszw4vRDOEjUwLAON4q1TAxsLZzhr2/MBHeU70NnNN8gPL3
	uHqR+N57Vy3MSQUDbatxPoP85snJQLzAf7ylcqqyBL3UCmlfKQvVSW8o5xr6CBI82Mvg
	oZyp+t2dl3uTtANz1idvtnSt9pUyFoUjpVtwuqrJY+OniwlLX12K6/4d/ZLO+Yf9hs43
	pmUh3fjp7HhED6sD/H3+1ltzU3QaYS0aLXzR6x27Yvz2oWMkSQcz+3vyXKox8U5JkraT
	wUWw==
X-Gm-Message-State: AA+aEWY9kigyhfVIS8/6VPWcki9VPv2D9FmLgSiGhm2H8alJ2e3Jpgxh
	wwqLcxb3mz0ZiRVpi3u0DbSjX0uswkXO1/WoWtdO/HSYxP4=
X-Google-Smtp-Source: AFSGD/WJTona0ceb6jQN8ZWaENk1FlTYe3SKAlyudQENFQrVM4dEtLga7iYqznmF6HRKhHC4aUzINxW1X6ESMQ8J/LE=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr17620375qtn.254.1543899632117;
	Mon, 03 Dec 2018 21:00:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543840903.git.psaavedra@igalia.com>
	<db75b6498a90988d97f9fd2b13643e2cbfc66518.1543840903.git.psaavedra@igalia.com>
In-Reply-To: <db75b6498a90988d97f9fd2b13643e2cbfc66518.1543840903.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 21:00:06 -0800
Message-ID: <CAMKF1sofhFmeL1325_isvnQY8FgkH=dwS-qpMuHQ1SAnDMxDTQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v4 3/7] ibus: add ibus recipe
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
X-List-Received-Date: Tue, 04 Dec 2018 05:00:31 -0000
Content-Type: text/plain; charset="UTF-8"

fails - http://errors.yoctoproject.org/Errors/Details/203280/
On Mon, Dec 3, 2018 at 4:46 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
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
> index 000000000..57afe0ade
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> @@ -0,0 +1,97 @@
> +DESCRIPTION = "A multilingual user input method library"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +SECTION = "inputmethods"
> +
> +SRC_URI = "https://github.com/ibus/ibus/releases/download/${PV}/${BPN}-${PV}.tar.gz \
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
> +  cp ${S}/bindings/pygobject/gi/overrides/IBus.py ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
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

