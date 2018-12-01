Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF7A6D143
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=K4KTzVBIvlO1V1z8cC2wfgqd0quGTNR7SClMNdTOCwA=; 
	b=PNszgYbCz7cIm+5FuOkoDADXZz1uD0GTcfofZv4a3eVou/AKux7h8Ysr5tBDIdwB5nUjVsARcmfdii35I5H9vzWneMPtX8AX+FGDGWjEKF/E6WAib3AmXEB+xgfcuHCZy9imV8mBjkEjpeaKVckZdLseYeuglMinQLnZnz91VIsvE6Sab9ayPc/CWB05rLrCwghnhBSX5hql3U8GiaYXf89ocx3/J8kxBITWQ46k1oSWWi9kmHbsQ44cyE2YwoRNxn4Xjn/QsGq57x8JTNUnWw8r/zTSSZdQ/Gexmra8wLoDq0N2p4GPIRaXFt2unxs+1PyZcSxcW9aM5zro04Svrg==;
Received: from [91.116.67.22] (helo=alves) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1gT8w8-0007cJ-QY; Sat, 01 Dec 2018 18:20:13 +0100
Message-ID: <e732ded484d9911a1d45f44f2585a4dc1bb3ff39.camel@igalia.com>
From: psaavedra <psaavedra@igalia.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 01 Dec 2018 18:20:01 +0100
In-Reply-To: <CAMKF1spvc7LNSZ+gPgdLWsKWHtREnw4pjxQaFfkYYTc89XM-Tg@mail.gmail.com>
References: <cover.1541767729.git.psaavedra@igalia.com>
	<1fba7108a107251c7a300cd70decaebe642dbb5e.1541767729.git.psaavedra@igalia.com>
	<CAMKF1srY7H72yjacOg7m4YmsiYEft57zHwyqVLVEnYTU_ov-Kg@mail.gmail.com>
	<02227f789917fc833db31f190c896f9207c7f65b.camel@igalia.com>
	<4023b776-e927-4457-ac70-269853598bdb@igalia.com>
	<CAMKF1spvc7LNSZ+gPgdLWsKWHtREnw4pjxQaFfkYYTc89XM-Tg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 01 Dec 2018 17:20:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Unfortunately, I'm not agree at all what the provided answer. I've
replied [1] him just now. Let's wait for the reply.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040#c2

On Fri, 2018-11-30 at 22:11 -0800, Khem Raj wrote:
> Hi Pablo
> 
> Can you implement what Ross suggested here
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040#c1
> 
> and send a v2 of the whole series ?
> 
> On Mon, Nov 26, 2018 at 8:11 AM Pablo Saavedra <psaavedra@igalia.com>
> wrote:
> > 
> > I can fix this problem with this patch:
> > 
> > 
> > diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> > b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> > index 579773d38..d42f87ae5 100644
> > --- a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> > +++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> > @@ -16,10 +16,10 @@ inherit autotools pkgconfig gettext
> > gobject-introspection gtk-immodules-cache gt
> > 
> >   REQUIRED_DISTRO_FEATURES = "x11"
> > 
> > -DEPENDS = " anthy ibus gobject-introspection python-pygobject
> > adwaita-icon-theme"
> > +DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
> >   RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"
> > 
> > -DEPENDS_append_class-target = " intltool-native python-pygobject-
> > native
> > qemu-native"
> > +DEPENDS_append_class-target = " intltool-native qemu-native"
> > 
> >   do_configure_prepend() {
> >       export PYTHON=python2
> > diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > index 598629344..85ef8489e 100644
> > --- a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > @@ -12,8 +12,8 @@ inherit autotools pkgconfig gettext
> > gtk-immodules-cache gobject-introspection gt
> > 
> >   REQUIRED_DISTRO_FEATURES = "x11"
> > 
> > -DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf
> > libnotify
> > python-pygobject python3-pygobject adwaita-icon-theme librsvg"
> > -DEPENDS_append_class-target = " intltool-native python3-pygobject-
> > native"
> > +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf
> > libnotify
> > python3-pygobject adwaita-icon-theme librsvg"
> > +DEPENDS_append_class-target = " intltool-native"
> >   RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
> > 
> >   PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
> > 
> > 
> > 
> > but unfortunately I find out unexpected obstacle with the dconf
> > postinstall script. I filled a issue where I describe the issue:
> > 
> >    https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040
> > 
> > 
> > On 13/11/18 10:11, psaavedra wrote:
> > > It seems python3 is provided by to packages
> > > 
> > >    conflicts between attempted installs of python-pygobject-
> > > 3.28.3-
> > > r0.core2_64 and python3-pygobject-3.28.3-r0.core2_64
> > > 
> > > 
> > > I'll investigate about this.
> > > 
> > > On Fri, 2018-11-09 at 17:11 -0800, Khem Raj wrote:
> > > > This is failing
> > > > http://errors.yoctoproject.org/Errors/Details/199681/
> > > > 
> > > > It seems its including both py3 and py2 version of pygobject
> > > > and
> > > > there
> > > > are conflicting files in these two
> > > > I am adding Changqing touched this recipe last time so looking
> > > > for
> > > > some more info on that.
> > > > On Fri, Nov 9, 2018 at 5:15 AM Pablo Saavedra <
> > > > psaavedra@igalia.com>
> > > > wrote:
> > > > > Intelligent Input Bus for Linux/Unix
> > > > > https://github.com/ibus/ibus/wiki
> > > > > 
> > > > > Collision with: 
> > > > > https://patchwork.openembedded.org/patch/155947/
> > > > > ---
> > > > >   meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97
> > > > > +++++++++++++++++++++++++++++
> > > > >   1 file changed, 97 insertions(+)
> > > > >   create mode 100644 meta-oe/recipes-
> > > > > support/ibus/ibus_1.5.19.bb
> > > > > 
> > > > > diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > > > > b/meta-
> > > > > oe/recipes-support/ibus/ibus_1.5.19.bb
> > > > > new file mode 100644
> > > > > index 000000000..598629344
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
> > > > > @@ -0,0 +1,97 @@
> > > > > +DESCRIPTION = "A multilingual user input method library"
> > > > > +LICENSE = "GPLv2"
> > > > > +LIC_FILES_CHKSUM =
> > > > > "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> > > > > +SECTION = "inputmethods"
> > > > > +
> > > > > +SRC_URI = "
> > > > > 
https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz
> > > > >   \
> > > > > +          "
> > > > > +SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
> > > > > +SRC_URI[sha256sum] =
> > > > > "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d
> > > > > 2429"
> > > > > +
> > > > > +inherit autotools pkgconfig gettext gtk-immodules-cache
> > > > > gobject-
> > > > > introspection gtk-doc gtk-icon-cache gsettings
> > > > > +
> > > > > +REQUIRED_DISTRO_FEATURES = "x11"
> > > > > +
> > > > > +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf
> > > > > libnotify python-pygobject python3-pygobject adwaita-icon-
> > > > > theme
> > > > > librsvg"
> > > > > +DEPENDS_append_class-target = " intltool-native python3-
> > > > > pygobject-
> > > > > native"
> > > > > +RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-
> > > > > gtk"
> > > > > +
> > > > > +PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
> > > > > +PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
> > > > > +PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
> > > > > +
> > > > > +PACKAGECONFIG ?= "gtk+ gtk+3"
> > > > > +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES',
> > > > > 'wayland', 'wayland', '', d)}"
> > > > > +
> > > > > +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFI
> > > > > G',
> > > > > 'gtk+', 'ibus-gtk2.0', '', d)}"
> > > > > +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFI
> > > > > G',
> > > > > 'gtk+3', 'ibus-gtk3', '', d)}"
> > > > > +
> > > > > +EXTRA_OECONF += " \
> > > > > +    --disable-emoji-dict \
> > > > > +    --disable-unicode-dict \
> > > > > +"
> > > > > +
> > > > > +BBCLASSEXTEND = "native pythonnative"
> > > > 
> > > > pythonnative does not belong here. It should probably be in
> > > > inherit
> > > > and it should be
> > > > python3native since below the recipe seems to set
> > > > PYTHON=python3
> > > > 
> > > > > +
> > > > > +FILES_${PN} += " \
> > > > > +    ${sysconfdir}/dconf/profile \
> > > > > +    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
> > > > > +    ${sysconfdir}/dconf/profile/ibus \
> > > > > +    ${libdir}/libibus-1.0.so.5.0.518 \
> > > > > +    ${libdir}/libibus-1.0.so.5 \
> > > > > +    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
> > > > > +    ${bindir}/ibus \
> > > > > +    ${bindir}/ibus-setup \
> > > > > +    ${bindir}/ibus-daemon \
> > > > > +    ${datadir}/ibus/engine \
> > > > > +    ${datadir}/ibus/component \
> > > > > +    ${datadir}/ibus/setup \
> > > > > +    ${datadir}/ibus/component/gtkpanel.xml \
> > > > > +    ${datadir}/ibus/component/simple.xml \
> > > > > +    ${datadir}/ibus/component/dconf.xml \
> > > > > +    ${datadir}/ibus/setup/emojilang.py \
> > > > > +    ${datadir}/ibus/setup/main.py \
> > > > > +    ${datadir}/ibus/setup/enginecombobox.py \
> > > > > +    ${datadir}/ibus/setup/setup.ui \
> > > > > +    ${datadir}/ibus/setup/enginedialog.py \
> > > > > +    ${datadir}/ibus/setup/i18n.py \
> > > > > +    ${datadir}/ibus/setup/engineabout.py \
> > > > > +    ${datadir}/ibus/setup/icon.py \
> > > > > +    ${datadir}/ibus/setup/keyboardshortcut.py \
> > > > > +    ${datadir}/ibus/setup/enginetreeview.py \
> > > > > +    ${datadir}/ibus/keymaps/jp \
> > > > > +    ${datadir}/ibus/keymaps/kr \
> > > > > +    ${datadir}/ibus/keymaps/common \
> > > > > +    ${datadir}/ibus/keymaps/modifiers \
> > > > > +    ${datadir}/ibus/keymaps/us \
> > > > > +    ${datadir}/ibus/keymaps/in \
> > > > > +    ${datadir}/applications/ibus-setup.desktop \
> > > > > +    ${datadir}/dbus-1/services/org.freedesktop.IBus.service
> > > > > \
> > > > > +    ${datadir}/dbus-
> > > > > 1/services/org.freedesktop.portal.IBus.service
> > > > > \
> > > > > +    ${datadir}/vala/vapi/ibus-1.0.vapi \
> > > > > +    ${datadir}/vala/vapi/ibus-1.0.deps \
> > > > > +    ${libexecdir}/ibus-engine-simple \
> > > > > +    ${libexecdir}/ibus-portal \
> > > > > +    ${libexecdir}/ibus-dconf \
> > > > > +    ${libexecdir}/ibus-x11 \
> > > > > +    ${libexecdir}/ibus-ui-gtk3 \
> > > > > +    ${datadir}/GConf/gsettings/ibus.convert \
> > > > > +    ${datadir}/glib-
> > > > > 2.0/schemas/org.freedesktop.ibus.gschema.xml \
> > > > > +    ${datadir}/bash-completion/* \
> > > > > +    ${datadir}/icons/* \
> > > > > +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
> > > > > +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py?
> > > > > \
> > > > > +"
> > > > 
> > > > may be we can just package directories and avoid this long
> > > > list.
> > > > 
> > > > > +
> > > > > +do_configure_prepend() {
> > > > > +    export PYTHON=python3
> > > > > +}
> > > > > +
> > > > > +do_install_append() {
> > > > > +  # Fix the installation path of the GObject Inspection
> > > > > overrides
> > > > > for Python3
> > > > > +  python_version=$(python3 -c 'import sys; print("%s.%s" %
> > > > > (sys.version_info.major, sys.version_info.minor))')
> > > > > +  mkdir -p ${D}/usr/lib/python${python_version}/site-
> > > > > packages/gi/overrides
> > > > > +  mv
> > > > > ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}
> > > > > /site-
> > > > > packages/gi/overrides/IBus.py
> > > > > ${D}/usr/lib/python${python_version}/site-
> > > > > packages/gi/overrides/
> > > > 
> > > > why do we need to move files from native sysroot in here ?
> > > > arent they
> > > > available in build area or staging
> > > > area for build ?
> > > > 
> > > > > +  rm -rf
> > > > > ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}
> > > > > /site-
> > > > > packages/gi/overrides
> > > > > +  find ${D} -type d -empty -delete
> > > > 
> > > > dealing with native sysroot and deleting files does not look
> > > > right
> > > > here.
> > > > 
> > > > > +}
> > > > > --
> > > > > 2.11.0
> > > > > 
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > 
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > 
> > --
> > Pablo Saavedra Rodiño
> > psaavedra@igalia.com | Mail
> > +34 630 566 474      | Phone
> > 
> 
> 


