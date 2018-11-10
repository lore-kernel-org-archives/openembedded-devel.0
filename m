Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 97A8A6C232
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 01:11:54 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r71so4912188qkr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 17:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vv8GyDN04tWmA+DLt3UA0IBNA35Is9AbFqZi7n+/i8A=;
	b=tt33C3ZqwVrzW4srPKk6QTSfBVU4MY6GCajZxHp0DQ3p+BlBTty/UfTj1enah5O4zJ
	RBeB/BTdbO5Z5/NJIAnYuK/kxmC3PJ9uOmmfrWQFkoQoVsGVltEdJjmEpIWGVexYedxb
	FhwstDbPtC0LH2clwUg+nLHFws3KKI8BIHmzQ7MQ4IKjgARH2M7o481IVRjavSE8jaO3
	0o4ifmy03jTZwolDuNT7sygk7fhVu9hpmuII2OdYWag/KhP7dqgMJLsaF2CMp8Bkjd7b
	G8iO1smKpbMOKfrgHFUVQhX5jar59bGA+2Tf5neqtwIIsPIHjdQkSJM+6cTBqKfQMVq/
	nNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vv8GyDN04tWmA+DLt3UA0IBNA35Is9AbFqZi7n+/i8A=;
	b=qAbyDMsH6Y9dQLKvARS/vV268vTeAI9YREQ6cSN4kU+KNCKUzLIKdO27dbV4ak29z2
	cN+jKGWgzn0fLMSS3P4SfX0LtWjRi031j1H2kOH0El9rfK++3LrTTkn52P7HKXxmQf8h
	jHycBkBo3oapXunszZasN1L7LtbMURO5VtIerXAg4J7MHpGI4xA9kg1umtTQDEcxszFK
	yeize+4RXjb5ZI6HT6RgsQakWFgvIqPzy6STVzYffeP7ScSeVtCoEP5UH33EfkA4ikwK
	TUQPH+yjpkeWeS7pvhl8k322Hac3YA+bGUg11XwFSZLUncMJX2MCzWB0jEjQvcyFv7AE
	5lEQ==
X-Gm-Message-State: AGRZ1gKD+XGwRHGQP5v6ZdrDkHz6jJMMW5UmwoHb9BrhcnTgfyP/AZjS
	rkDQzgw85UpmqzxsUuOiQTUvfIemKmyBn/ET7pM=
X-Google-Smtp-Source: AJdET5cbUTxNaBtPiwJ5yG3rmw/pE/LdYS5gOv6XQGaZrYpR2+3w0vs5TXf4yqwIOhSFYAg+2gfSN28biBw2pXJfgEk=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr10329576qka.206.1541812313810;
	Fri, 09 Nov 2018 17:11:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541767729.git.psaavedra@igalia.com>
	<1fba7108a107251c7a300cd70decaebe642dbb5e.1541767729.git.psaavedra@igalia.com>
In-Reply-To: <1fba7108a107251c7a300cd70decaebe642dbb5e.1541767729.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Nov 2018 17:11:27 -0800
Message-ID: <CAMKF1srY7H72yjacOg7m4YmsiYEft57zHwyqVLVEnYTU_ov-Kg@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>,
	Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH 2/6] ibus: add ibus recipe
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
X-List-Received-Date: Sat, 10 Nov 2018 01:11:54 -0000
Content-Type: text/plain; charset="UTF-8"

This is failing
http://errors.yoctoproject.org/Errors/Details/199681/

It seems its including both py3 and py2 version of pygobject and there
are conflicting files in these two
I am adding Changqing touched this recipe last time so looking for
some more info on that.
On Fri, Nov 9, 2018 at 5:15 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> Intelligent Input Bus for Linux/Unix https://github.com/ibus/ibus/wiki
>
> Collision with: https://patchwork.openembedded.org/patch/155947/
> ---
>  meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97 +++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
>
> diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> new file mode 100644
> index 000000000..598629344
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
> +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify python-pygobject python3-pygobject adwaita-icon-theme librsvg"
> +DEPENDS_append_class-target = " intltool-native python3-pygobject-native"
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

pythonnative does not belong here. It should probably be in inherit
and it should be
python3native since below the recipe seems to set PYTHON=python3

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

may be we can just package directories and avoid this long list.

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

why do we need to move files from native sysroot in here ? arent they
available in build area or staging
area for build ?

> +  rm -rf ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides
> +  find ${D} -type d -empty -delete

dealing with native sysroot and deleting files does not look right here.

> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

