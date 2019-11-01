Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0167FC67
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 16:34:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c26so13604683qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 09:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IadQU/Tf8416kqVucHiJ0uyowsv+IgpsJEbY3EmAQJk=;
	b=VS4SK32KJ7UUxTYfvGO2zPoJ62GLpywz3DHlD5SHPo8mwNQhpAGbC1v8doRza30wbM
	GPZo+1Unp9TyizydvRBG5SJRtBWhKA4VZ2uK/idwiI8RjhJOXjpbMs9dwWfCBtyejWll
	zns0b2mQj/86owMg1JTyGxu1exqRAOr9qf0XMDE4wI/BcjCJCD4u/afAuVj2VE/hWe+4
	H+ix4A+rqjr6MQYkdNgyCXB+6lMnfUl2YlX35oqbHMkQJnDu9hZJDX8UqUKaUmdOfx2h
	JqMsZwCDtKZMbk7/+m8EIzfhZiQBpVF+jY6gMaQr8Mmk3zp9k1AfBBYmjFkeHz2XjQN4
	1WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IadQU/Tf8416kqVucHiJ0uyowsv+IgpsJEbY3EmAQJk=;
	b=gYyfQg3vi/9jlgsISAmKc7uVLkcEHf3nkO2706DxErmYW6b1ASfWIzEi3luLPsYW5S
	IxP3IkkMo5BDjmnrWwRh8sr83O9xi0Az78uu5iqlZNVONtDIkozs8sqQZPThiHXsMIJT
	opw4nv9fS/4+2wWLOo+RrOIOhFOawCUji6fZrNk8FRWdZp+Tkp266694ZC4vF1Tg+tx1
	yX0AaUE7hOS9uuDGDDtk54deGykQL+5awAyRsqTUHlJCmta2RQPG3ou0KpXfVAOdIAuq
	gi8ZBdB4WcGejBzkir81NziYMs6jbS+SRSY6b79ze/xGnWPJ3z9aPXF+TFrqN0FmiRo6
	zG9Q==
X-Gm-Message-State: APjAAAUCx0b1Lu6aByw2lRcRc53pG+LX7cDwvSSvoJalpI2G746dXqiw
	ohd7uQVk6KGqz9R+ULMC5s2Xb/TGfg2DPzhrrDI=
X-Google-Smtp-Source: APXvYqyLVRJpQPsQbA6PrK26M8A8Hh6F+KFYMeW/qTPt1Umq7GV5Opihr915oHQy9d98gL9rJGjIB3eeGWrz83PwRM8=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr193662qti.80.1572626066833;
	Fri, 01 Nov 2019 09:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<20191029010253.5784-4-schnitzeltony@gmail.com>
In-Reply-To: <20191029010253.5784-4-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 09:34:00 -0700
Message-ID: <CAMKF1srqmOG5k8mfAZ04YH0DUUROSLUCVLwMGUrRQ-=Y2yeFsg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 01 Nov 2019 16:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

I see this fail on ubuntu 18.04 host
https://errors.yoctoproject.org/Errors/Details/275175/

On Mon, Oct 28, 2019 at 6:03 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> It is a depency for gnome-shell
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>
> v1 -> v2: went out too early with breaking configure option
> v2 -> v3: avoid using build host's unicode-ucd / slightly rework PACKAGEC=
ONFIG
>           defaults
>
>  .../recipes-support/ibus/ibus-native.bb       | 30 ++++++++++++++
>  meta-gnome/recipes-support/ibus/ibus.bb       | 37 ++++++++++++++++++
>  meta-gnome/recipes-support/ibus/ibus.inc      | 36 +++++++++++++++++
>  ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
>  4 files changed, 142 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-=
to-start-dbus-we-do-not-have-dbus-lauch.patch
>
> diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/=
recipes-support/ibus/ibus-native.bb
> new file mode 100644
> index 000000000..3f8e1ed12
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
> @@ -0,0 +1,30 @@
> +require ${BPN}.inc
> +
> +inherit native
> +
> +DEPENDS +=3D " \
> +    glib-2.0-native \
> +    dbus-native \
> +    iso-codes \
> +"
> +
> +PACKAGECONFIG =3D ""
> +
> +# for allarch iso-codes
> +EXTRA_NATIVE_PKGCONFIG_PATH =3D ":${RECIPE_SYSROOT}${datadir_native}/pkg=
config"
> +# for allarch unicode-ucd - just to make configure happy
> +EXTRA_OECONF +=3D "--with-ucd-dir=3D${RECIPE_SYSROOT}${datadir_native}/u=
nicode/ucd"
> +
> +do_compile() {
> +    cd src
> +    oe_runmake ibusenumtypes.h ibusenumtypes.c
> +    oe_runmake unicode-parser
> +}
> +
> +do_install() {
> +    install -d ${D}/${libdir}
> +    install -m 755 ${S}/src/.libs/libibus-*.so* ${D}/${libdir}
> +
> +    install -d ${D}/${bindir}
> +    install -m 755 ${S}/src/.libs/unicode-parser ${D}/${bindir}
> +}
> diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes=
-support/ibus/ibus.bb
> new file mode 100644
> index 000000000..caec455b6
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus.bb
> @@ -0,0 +1,37 @@
> +require ${BPN}.inc
> +
> +DEPENDS +=3D " \
> +    ${BPN}-native \
> +    glib-2.0-native \
> +    glib-2.0 \
> +    dbus \
> +    iso-codes \
> +"
> +
> +inherit gtk-icon-cache bash-completion
> +
> +# for unicode-ucd
> +EXTRA_OECONF +=3D "--with-ucd-dir=3D${STAGING_DATADIR}/unicode/ucd"
> +
> +PACKAGECONFIG ??=3D " \
> +    dconf vala \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'g=
tk3', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
> +"
> +
> +do_configure_prepend() {
> +    # run native unicode-parser
> +    sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Make=
file.am
> +}
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/GConf \
> +    ${datadir}/glib-2.0 \
> +    ${libdir}/gtk-3.0 \
> +"
> +
> +FILES_${PN}-dev +=3D " \
> +    ${datadir}/gettext \
> +"
> +
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
> new file mode 100644
> index 000000000..0f4ae7d04
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "Intelligent Input Bus for Linux/Unix"
> +HOMEPAGE =3D "https://github.com/ibus/ibus/wiki"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +
> +inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-=
doc vala
> +
> +PV =3D "1.5.21"
> +
> +DEPENDS =3D "unicode-ucd"
> +
> +SRC_URI =3D " \
> +    git://github.com/ibus/ibus.git \
> +    file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
> +"
> +SRCREV =3D "ae0040c73466bb6e78fce5e669a55fcce6ffd16d"
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG[appindicator] =3D "--enable-appindicator,--disable-appindi=
cator,qtbase"
> +PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
> +PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
> +PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
> +PACKAGECONFIG[wayland]  =3D "--enable-wayland,--disable-wayland,wayland"
> +PACKAGECONFIG[vala]  =3D "--enable-vala,--disable-vala"
> +PACKAGECONFIG[x11]  =3D "--enable-xim --enable-ui,--disable-xim --disabl=
e-ui,virtual/libx11"
> +
> +EXTRA_OECONF =3D " \
> +    --disable-tests \
> +    --disable-emoji-dict \
> +    --disable-python2 \
> +"
> +
> +do_configure_prepend() {
> +    touch ${S}/ChangeLog
> +    touch ${S}/ABOUT-NLS
> +}
> diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-star=
t-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ib=
us/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> new file mode 100644
> index 000000000..3701d19f5
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-=
we-do-not-have-dbus-lauch.patch
> @@ -0,0 +1,39 @@
> +From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Fri, 10 May 2019 14:30:08 +0200
> +Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + data/dconf/make-dconf-override-db.sh | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dcon=
f-override-db.sh
> +index 9c650e97..02fbf059 100755
> +--- a/data/dconf/make-dconf-override-db.sh
> ++++ b/data/dconf/make-dconf-override-db.sh
> +@@ -12,10 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
> + export GSETTINGS_SCHEMA_DIR=3D"$TMPDIR/schemas"
> + mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
> +
> +-eval `dbus-launch --sh-syntax`
> +-
> +-trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
> +-
> + # in case that schema is not installed on the system
> + glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
> +
> +@@ -46,5 +42,3 @@ for schema in $schemas; do
> + done
> +
> + rm -rf $TMPDIR
> +-
> +-kill $DBUS_SESSION_BUS_PID
> +--
> +2.20.1
> +
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

