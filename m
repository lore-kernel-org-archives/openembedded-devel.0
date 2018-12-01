Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8836C119
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 06:12:16 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k12so8412914qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 22:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AkQ8ZXEMUiWIZSqYFroO35b1EFjujeFkqcDe/LLdln0=;
	b=OuYGDllh9mfEJhzisTBEOZakPzm+fxrnMXkvZSLzDOExkIsWyQSDYYYX0H8KkUnGPU
	ohYxjWMZBYAWnXNWVvub6AgoW0s3HZoQN4Clkcnf8AXQVzfMXpZ2yC11qWZWFz+kVGly
	XbeUh++lt3u9eX80Z4qGBNrqntPmX5LtUmkiyhh2Ccu6MUoVdUG0ztSoICG6l4cPtQw5
	ntfocNC58irDpEbHqr6aYhi2s7JwP7D3G1y5waIJeDlK1UD6xFHnWmW/0e8UYQLG11CC
	yQDWWLWrFuBGFZJij30k5u2ZmxqxQ8g+Lb5lSt7ccowncQFSFy95z8OF7vMiEuxCjfKM
	+iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AkQ8ZXEMUiWIZSqYFroO35b1EFjujeFkqcDe/LLdln0=;
	b=my8tnGrWB4tu+eJ4jgaUmc6xDlOaaVFUWxua5xwd01CWiFzSwuuRqLHl2WJo7oC8Mj
	ECTdYSrq6HlB2+gH3PVemYMXEMO+sXU1XT5C8myHmkSM8uga7CxQ4/QyQu6a0yvpmlUD
	sOpkTsL0GRVictMnav7o6BULs6EPEEfvzp3UT5nyMbIPscKzpjylLeu6u1xUySz1/4pb
	fOXK/iiPpgcKxXMy8OqLjG1TzRQjyo1q8Yc4Cdi2u9sBGs9YZBoTYvaXBhlKRc4n8X80
	O6hA8caqyyNYfDO8AjL1/ls9PQ8UbtTMDJzsI7h2Yr1tMS2XSeugG4812Wys7MrtyHgM
	ThrA==
X-Gm-Message-State: AA+aEWZDKjsyhPQ4TfMh6FqYEo1IoAY5Hnh4kCj0iMn1nr+hnYmvwo02
	knHUGHiATTdpA8L8kDsv2WTGMV0j4TBMmGwBiHw=
X-Google-Smtp-Source: AFSGD/VUUU6Gxpt0KTJMOwJbNuQksO74Cbcw077w4kdiunLkbBARrbPD30yjMyPgpnyj/t5+4mYmwYj8JEZjRDo66Jc=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr8312010qte.29.1543644737533; 
	Fri, 30 Nov 2018 22:12:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541767729.git.psaavedra@igalia.com>
	<1fba7108a107251c7a300cd70decaebe642dbb5e.1541767729.git.psaavedra@igalia.com>
	<CAMKF1srY7H72yjacOg7m4YmsiYEft57zHwyqVLVEnYTU_ov-Kg@mail.gmail.com>
	<02227f789917fc833db31f190c896f9207c7f65b.camel@igalia.com>
	<4023b776-e927-4457-ac70-269853598bdb@igalia.com>
In-Reply-To: <4023b776-e927-4457-ac70-269853598bdb@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Nov 2018 22:11:51 -0800
Message-ID: <CAMKF1spvc7LNSZ+gPgdLWsKWHtREnw4pjxQaFfkYYTc89XM-Tg@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
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
X-List-Received-Date: Sat, 01 Dec 2018 06:12:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo

Can you implement what Ross suggested here
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13040#c1

and send a v2 of the whole series ?

On Mon, Nov 26, 2018 at 8:11 AM Pablo Saavedra <psaavedra@igalia.com> wrote=
:
>
> I can fix this problem with this patch:
>
>
> diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> index 579773d38..d42f87ae5 100644
> --- a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> +++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> @@ -16,10 +16,10 @@ inherit autotools pkgconfig gettext
> gobject-introspection gtk-immodules-cache gt
>
>   REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -DEPENDS =3D " anthy ibus gobject-introspection python-pygobject
> adwaita-icon-theme"
> +DEPENDS =3D " anthy ibus gobject-introspection adwaita-icon-theme"
>   RDEPENDS_${PN} +=3D " ibus takao-fonts anthy libanthy0"
>
> -DEPENDS_append_class-target =3D " intltool-native python-pygobject-nativ=
e
> qemu-native"
> +DEPENDS_append_class-target =3D " intltool-native qemu-native"
>
>   do_configure_prepend() {
>       export PYTHON=3Dpython2
> diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> index 598629344..85ef8489e 100644
> --- a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> @@ -12,8 +12,8 @@ inherit autotools pkgconfig gettext
> gtk-immodules-cache gobject-introspection gt
>
>   REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -DEPENDS =3D " intltool dbus-glib python3-dbus iso-codes dconf libnotify
> python-pygobject python3-pygobject adwaita-icon-theme librsvg"
> -DEPENDS_append_class-target =3D " intltool-native python3-pygobject-nati=
ve"
> +DEPENDS =3D " intltool dbus-glib python3-dbus iso-codes dconf libnotify
> python3-pygobject adwaita-icon-theme librsvg"
> +DEPENDS_append_class-target =3D " intltool-native"
>   RDEPENDS_${PN} +=3D " iso-codes adwaita-icon-theme librsvg-gtk"
>
>   PACKAGECONFIG[gtk+] =3D ",--disable-gtk2,gtk+,gtk+"
>
>
>
> but unfortunately I find out unexpected obstacle with the dconf
> postinstall script. I filled a issue where I describe the issue:
>
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13040
>
>
> On 13/11/18 10:11, psaavedra wrote:
> > It seems python3 is provided by to packages
> >
> >    conflicts between attempted installs of python-pygobject-3.28.3-
> > r0.core2_64 and python3-pygobject-3.28.3-r0.core2_64
> >
> >
> > I'll investigate about this.
> >
> > On Fri, 2018-11-09 at 17:11 -0800, Khem Raj wrote:
> >> This is failing
> >> http://errors.yoctoproject.org/Errors/Details/199681/
> >>
> >> It seems its including both py3 and py2 version of pygobject and
> >> there
> >> are conflicting files in these two
> >> I am adding Changqing touched this recipe last time so looking for
> >> some more info on that.
> >> On Fri, Nov 9, 2018 at 5:15 AM Pablo Saavedra <psaavedra@igalia.com>
> >> wrote:
> >>> Intelligent Input Bus for Linux/Unix
> >>> https://github.com/ibus/ibus/wiki
> >>>
> >>> Collision with: https://patchwork.openembedded.org/patch/155947/
> >>> ---
> >>>   meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97
> >>> +++++++++++++++++++++++++++++
> >>>   1 file changed, 97 insertions(+)
> >>>   create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> >>>
> >>> diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-
> >>> oe/recipes-support/ibus/ibus_1.5.19.bb
> >>> new file mode 100644
> >>> index 000000000..598629344
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> >>> @@ -0,0 +1,97 @@
> >>> +DESCRIPTION =3D "A multilingual user input method library"
> >>> +LICENSE =3D "GPLv2"
> >>> +LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
> >>> +SECTION =3D "inputmethods"
> >>> +
> >>> +SRC_URI =3D "
> >>> https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.=
gz
> >>>   \
> >>> +          "
> >>> +SRC_URI[md5sum] =3D "a2be6f200dd9ada2501474a6877a73ef"
> >>> +SRC_URI[sha256sum] =3D
> >>> "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
> >>> +
> >>> +inherit autotools pkgconfig gettext gtk-immodules-cache gobject-
> >>> introspection gtk-doc gtk-icon-cache gsettings
> >>> +
> >>> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >>> +
> >>> +DEPENDS =3D " intltool dbus-glib python3-dbus iso-codes dconf
> >>> libnotify python-pygobject python3-pygobject adwaita-icon-theme
> >>> librsvg"
> >>> +DEPENDS_append_class-target =3D " intltool-native python3-pygobject-
> >>> native"
> >>> +RDEPENDS_${PN} +=3D " iso-codes adwaita-icon-theme librsvg-gtk"
> >>> +
> >>> +PACKAGECONFIG[gtk+] =3D ",--disable-gtk2,gtk+,gtk+"
> >>> +PACKAGECONFIG[gtk+3] =3D ",--disable-gtk3,gtk+3,gtk+3"
> >>> +PACKAGECONFIG[wayland] =3D "--enable-wayland,,wayland,wayland"
> >>> +
> >>> +PACKAGECONFIG ?=3D "gtk+ gtk+3"
> >>> +PACKAGECONFIG +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> >>> 'wayland', 'wayland', '', d)}"
> >>> +
> >>> +GTKIMMODULES_PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>> 'gtk+', 'ibus-gtk2.0', '', d)}"
> >>> +GTKIMMODULES_PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>> 'gtk+3', 'ibus-gtk3', '', d)}"
> >>> +
> >>> +EXTRA_OECONF +=3D " \
> >>> +    --disable-emoji-dict \
> >>> +    --disable-unicode-dict \
> >>> +"
> >>> +
> >>> +BBCLASSEXTEND =3D "native pythonnative"
> >> pythonnative does not belong here. It should probably be in inherit
> >> and it should be
> >> python3native since below the recipe seems to set PYTHON=3Dpython3
> >>
> >>> +
> >>> +FILES_${PN} +=3D " \
> >>> +    ${sysconfdir}/dconf/profile \
> >>> +    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
> >>> +    ${sysconfdir}/dconf/profile/ibus \
> >>> +    ${libdir}/libibus-1.0.so.5.0.518 \
> >>> +    ${libdir}/libibus-1.0.so.5 \
> >>> +    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
> >>> +    ${bindir}/ibus \
> >>> +    ${bindir}/ibus-setup \
> >>> +    ${bindir}/ibus-daemon \
> >>> +    ${datadir}/ibus/engine \
> >>> +    ${datadir}/ibus/component \
> >>> +    ${datadir}/ibus/setup \
> >>> +    ${datadir}/ibus/component/gtkpanel.xml \
> >>> +    ${datadir}/ibus/component/simple.xml \
> >>> +    ${datadir}/ibus/component/dconf.xml \
> >>> +    ${datadir}/ibus/setup/emojilang.py \
> >>> +    ${datadir}/ibus/setup/main.py \
> >>> +    ${datadir}/ibus/setup/enginecombobox.py \
> >>> +    ${datadir}/ibus/setup/setup.ui \
> >>> +    ${datadir}/ibus/setup/enginedialog.py \
> >>> +    ${datadir}/ibus/setup/i18n.py \
> >>> +    ${datadir}/ibus/setup/engineabout.py \
> >>> +    ${datadir}/ibus/setup/icon.py \
> >>> +    ${datadir}/ibus/setup/keyboardshortcut.py \
> >>> +    ${datadir}/ibus/setup/enginetreeview.py \
> >>> +    ${datadir}/ibus/keymaps/jp \
> >>> +    ${datadir}/ibus/keymaps/kr \
> >>> +    ${datadir}/ibus/keymaps/common \
> >>> +    ${datadir}/ibus/keymaps/modifiers \
> >>> +    ${datadir}/ibus/keymaps/us \
> >>> +    ${datadir}/ibus/keymaps/in \
> >>> +    ${datadir}/applications/ibus-setup.desktop \
> >>> +    ${datadir}/dbus-1/services/org.freedesktop.IBus.service \
> >>> +    ${datadir}/dbus-1/services/org.freedesktop.portal.IBus.service
> >>> \
> >>> +    ${datadir}/vala/vapi/ibus-1.0.vapi \
> >>> +    ${datadir}/vala/vapi/ibus-1.0.deps \
> >>> +    ${libexecdir}/ibus-engine-simple \
> >>> +    ${libexecdir}/ibus-portal \
> >>> +    ${libexecdir}/ibus-dconf \
> >>> +    ${libexecdir}/ibus-x11 \
> >>> +    ${libexecdir}/ibus-ui-gtk3 \
> >>> +    ${datadir}/GConf/gsettings/ibus.convert \
> >>> +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.gschema.xml \
> >>> +    ${datadir}/bash-completion/* \
> >>> +    ${datadir}/icons/* \
> >>> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
> >>> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py? \
> >>> +"
> >> may be we can just package directories and avoid this long list.
> >>
> >>> +
> >>> +do_configure_prepend() {
> >>> +    export PYTHON=3Dpython3
> >>> +}
> >>> +
> >>> +do_install_append() {
> >>> +  # Fix the installation path of the GObject Inspection overrides
> >>> for Python3
> >>> +  python_version=3D$(python3 -c 'import sys; print("%s.%s" %
> >>> (sys.version_info.major, sys.version_info.minor))')
> >>> +  mkdir -p ${D}/usr/lib/python${python_version}/site-
> >>> packages/gi/overrides
> >>> +  mv
> >>> ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-
> >>> packages/gi/overrides/IBus.py
> >>> ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
> >> why do we need to move files from native sysroot in here ? arent they
> >> available in build area or staging
> >> area for build ?
> >>
> >>> +  rm -rf
> >>> ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-
> >>> packages/gi/overrides
> >>> +  find ${D} -type d -empty -delete
> >> dealing with native sysroot and deleting files does not look right
> >> here.
> >>
> >>> +}
> >>> --
> >>> 2.11.0
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>
> --
> Pablo Saavedra Rodi=C3=B1o
> psaavedra@igalia.com | Mail
> +34 630 566 474      | Phone
>

