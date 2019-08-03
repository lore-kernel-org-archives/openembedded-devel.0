Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id ED31471CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 00:54:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w10so36851453pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=sfD1V6EHLdcg5z5Axzp5+oV/9Rm8bTTIiVX/hkuznmE=;
	b=cfAH8ao5ShYOWUtZJEC489w5o+s1QKt0gBM857D+9kesf/syMTi6olSPv12lm10iUb
	vLGkiRlx/gnCjNdsI+w2YOG/5iN+c1mEBjWTBpsAAQPpi291VZlxxuo5rPnqPvyNzWpe
	PptQzZeD00VcaD2r9Oh5GyRTm7ydvnqUPJqSJIXceY5xSeEvSggT3LKWBIcbfzkJaWRz
	BhphOtmSErs2wpyzG8cayOnrmPOtKlkQ9MLzRnHx5y/xpNsTuO1Ej/ZMxaPlcfJwzNW8
	tPGyrkgRU7+yDNJJjWmA8akul5ssmGBqyAJdBpzhTDY5+H+V9lWQyC+/YWPmSIeUg2hd
	armQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sfD1V6EHLdcg5z5Axzp5+oV/9Rm8bTTIiVX/hkuznmE=;
	b=AhdcVlkD73EgLHINvRPbHIpzQYyplaklLW1i2Xia65NmvH8YHkEawVJKpMJ+XYVQl2
	VF5xoKD36IcPW3+ihC8sOXqW8K9i0NrT58/pezN5i9kSttwKL8l6oKajAGpnWY4otxQD
	9FV4pWsG8G6NhJVb167rZFU5Tqlmi7OTrUbZFZC4A2+nREtmg1SB+QWSbaZmupsliq8I
	e6s+1ChFOFoZnxqmEvB1vhzzJ/YBgo2jyQmYXf+jEo5j+OnJ4k3nmhO3MxcHkGy2HOUB
	17z4fs0dAigoYS3umJtbpdsR2A0FsOZYVk3Gp7aDymNp7SwMookXB+5xXgNtMR5n/yHw
	Ng7A==
X-Gm-Message-State: APjAAAVeNipvaLwGaI2jddDzUsrocSd7Dvzzh1JdDMI+TT1rWrHU2wds
	mF6k01l/+wKqrI6dN34gGPzcUmVGMBc=
X-Google-Smtp-Source: APXvYqxIM+7QOmo4OM6T9USvloZrlp84j02ASqABcwASwqwxzPffa73s6dqizYfp2b9fwEcg8Ju+ig==
X-Received: by 2002:a17:90a:d58c:: with SMTP id
	v12mr6797817pju.7.1564793645318; 
	Fri, 02 Aug 2019 17:54:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::d477? ([2601:646:8500:6bc6::d477])
	by smtp.gmail.com with ESMTPSA id
	j1sm103357893pgl.12.2019.08.02.17.54.04
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Aug 2019 17:54:04 -0700 (PDT)
To: Pablo Saavedra <psaavedra@igalia.com>,
	openembedded-devel@lists.openembedded.org
References: <20190802085032.32687-1-psaavedra@igalia.com>
	<20190802085032.32687-2-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <9df5c142-1127-b622-5b3d-ebe2e3ec6442@gmail.com>
Date: Fri, 2 Aug 2019 17:54:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802085032.32687-2-psaavedra@igalia.com>
Subject: Re: [meta-openembedded][PATCH v6 02/10] ibus: add ibus recipe
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
X-List-Received-Date: Sat, 03 Aug 2019 00:54:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/2/19 1:50 AM, Pablo Saavedra wrote:
> Intelligent Input Bus for Linux/Unix https://github.com/ibus/ibus/wiki
>
> Collision with: https://patchwork.openembedded.org/patch/155947/
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>   meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97 +++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
>   create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
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

this ends up in bunch of non existing dependencies on libnotify-native 
iso-codes-native, secondly pythonnative is to be inherited

and not bbextended

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


if you inherit python3native you dont need to export it like this


> +}
> +
> +do_install_append() {
> +  # Fix the installation path of the GObject Inspection overrides for Python3
> +  python_version=$(python3 -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')
> +  mkdir -p ${D}/usr/lib/python${python_version}/site-packages/gi/overrides

this will depend on version of native python and not target one even 
though they maybe same if python3-native is used but could be wrong

you might want to inherit python3-dir

and use PYTHON_SITEPACKAGES_DIR variable

> +  cp ${S}/bindings/pygobject/gi/overrides/IBus.py ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
> +  rm -rf ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-packages/gi/overrides
> +  find ${D} -type d -empty -delete
> +}

