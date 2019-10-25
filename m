Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 160B57E265
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:38:23 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t20so5424760qtr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8lzmtM/hixKWnf2ejQnfR3uwE2EpFY6qndnzzTjoLVQ=;
	b=Oc9fK8WyKVHQFH1UcAqTnbP4fc4hvtQPg0V+JXb2q+B8A4LzeYGbuSQNXQ8pSoUHjF
	MiTZU8kQvXGCSumQ7nOj21PrphIZHgstw2QDthjrXm2IPUllLWSzbEAmneDBg13gWCjb
	Tt2AoCubKc/c7q5laSR9RBsGtT0fVnZWc4Cm3BK5aZVUE8aoalCWrBjw8ify8FxT+dOO
	AqW8/ewINxDtGX88U7AZG9TVuNZ9qbx9kq+xmg8HgRlv45meHX5hFre/4rYPtEucYPSV
	6nYJ2Qasz4UJlCuq9vBvNgtUKCbhPcR2dQmqzLV/TG9G+lKNQ730IPOSgqGUGwohSS72
	6HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8lzmtM/hixKWnf2ejQnfR3uwE2EpFY6qndnzzTjoLVQ=;
	b=UFyoBjIOaBG9HZE8oblBqQ9peDh5wVm84xyE3bhnaSMmBPdjNOA22/j96SfAqSc471
	jxeXK3wvlJ5mo4Bsrl+H+jghR1n3lybpl8HNkBsZeLxPFLC0tjughZwx8e4yXsVnvJFH
	Zc53Q3jgKIk5DfgMsVtiQPEAzTQktKDzEHdvdR8KCddj/MWT6sc2eJPWOxoc+jWMiHR4
	FOgGp1+KI+oao7LtV8FIoQg6oDX6yput6jcr7osoCRPX/ea9xnZKlO7ZnYBjlpoIK5oe
	OE5VoVWJLjPKJesVvfzOnHaqn87aYCB7yawvOEDJIs0yWcYUfPqMFLCq4ESUGZ/11M8/
	Fr3w==
X-Gm-Message-State: APjAAAVO7e0Dacm0DvwE9S+Qvg0CnIouXpwkhJaizektIEw4FU9ZIo+J
	DcpeSb2BZwkoiQ8czZxjv0Z14OCx2A6SkBwtSLg=
X-Google-Smtp-Source: APXvYqwpY/vyUQ8Psw9Y+RmtJknyJxJlYy4fiWqco5mGVGPWEhetSbZXNKnTP2UcOWuxNzzFNnn8z7KcDeAXPs+W5yA=
X-Received: by 2002:ad4:45b1:: with SMTP id y17mr3709132qvu.55.1572039504686; 
	Fri, 25 Oct 2019 14:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-13-schnitzeltony@gmail.com>
In-Reply-To: <20191025072113.11172-13-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 22:37:58 +0100
Message-ID: <CAMKF1spm8LGyxHQ4gae7bT4Hm8UG1Kv3NteCN1JQgYE6P1+ojw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 12/15] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 25 Oct 2019 21:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails

https://errors.yoctoproject.org/Errors/Details/274650/

On Fri, Oct 25, 2019 at 8:23 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> It is a depency for gnome-shell
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-support/ibus/ibus-native.bb       | 28 +++++++++++++
>  meta-gnome/recipes-support/ibus/ibus.bb       | 33 ++++++++++++++++
>  meta-gnome/recipes-support/ibus/ibus.inc      | 33 ++++++++++++++++
>  ...start-dbus-we-do-not-have-dbus-lauch.patch | 39 +++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-=
to-start-dbus-we-do-not-have-dbus-lauch.patch
>
> diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/=
recipes-support/ibus/ibus-native.bb
> new file mode 100644
> index 000000000..0c095f15e
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
> @@ -0,0 +1,28 @@
> +require ${BPN}.inc
> +
> +inherit native
> +
> +DEPENDS =3D " \
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
> index 000000000..28f572ee7
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus.bb
> @@ -0,0 +1,33 @@
> +require ${BPN}.inc
> +
> +DEPENDS =3D " \
> +    ${BPN}-native \
> +    glib-2.0-native \
> +    glib-2.0 \
> +    dbus \
> +    iso-codes \
> +"
> +
> +inherit gtk-icon-cache bash-completion
> +
> +PACKAGECONFIG ??=3D " \
> +    dconf gtk3 vala \
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
> index 000000000..8b98b892a
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -0,0 +1,33 @@
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

