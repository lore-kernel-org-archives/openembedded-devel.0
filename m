Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C104C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 12:55:30 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.6563.1690462527676377779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 05:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QcXI/WSJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so1607184e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690462526; x=1691067326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LNkrj2EAbXj8Pdeyy4Lcj6kWSyCkCqc0I+r6onq3Sow=;
        b=QcXI/WSJVAeRJz0xB0CvMklC4MW1tvaxY7aroTPSA9Nn4yPinGjrwnMVOtt4xxMIi6
         HAl6zLPkuwZEz7IhfjL3/tb2vC7dYJJ3QO/R00oe1quFI5ENO2nyyuXuQ1gllyb5aEcr
         EUj7sxc+DeVgDdX1KqiNMyXZEVHQ6NS/n/N/AM87YXH0vpTw/DV14TkbVjq0hRhu5RZF
         wPYS5WLJttrZJSmcqg/ufhY/zPsRDZtuTYYsMbRFFbo+GCPFqk5XJLNbwbN88rXcn5/r
         addF3wsDkvQ089P574I1uo40A2fv0rDiYjL2TWyXKTm2mIp1q3iRywKvoNBPPmTrzKpu
         4VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690462526; x=1691067326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNkrj2EAbXj8Pdeyy4Lcj6kWSyCkCqc0I+r6onq3Sow=;
        b=NaqhKQs0CJxWuungYzxwYGMWGYGFrwnn8O0UQ3pAF5n9Xn28DhtHA/7EyujMjQqfus
         ngGkRYPXww/wFFZkx31qbaS9d08Ab+6ejSMoTlehJSRBX7XYFNcq3navvWczHX1KEWIN
         3TUWt7mbq7YY32xcDqfx7etUAyVXUFb1gzPAfXI3IVkYNdPDStMMopicHRENBIhbhM4x
         ddabNfpd4BvG48hHx5dP2v4vrLcvGZU02WwdyuETdY5DhSfZEsQ8F+vUbXgnR/n2G4ex
         Q9qDxCWhBrZY/TMGE3qqfqZUMWNTwfEwKWtH/q86Zr76Mae4VRYs9IbjdadhC6YjxmSm
         UwBg==
X-Gm-Message-State: ABy/qLYmZeUtmkRSoXUPv4VnibhpnfeYFRvz/Oh2qHBK8DaVBWFMWv2x
	xf3bEeRaqrt0J4mKDfYEBlnVmof8yTFvup4O34g=
X-Google-Smtp-Source: APBJJlFBxbncFQyaTbR2U2/9tCeYXRoEotnGXFuHvOHLb2ooRm/Sl/eArBaTlJ0C7ibioZ39HoSh1n4RqNDyeXnjyrI=
X-Received: by 2002:a19:504c:0:b0:4fd:f7a8:a9f3 with SMTP id
 z12-20020a19504c000000b004fdf7a8a9f3mr1729212lfj.38.1690462525057; Thu, 27
 Jul 2023 05:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230727113837.4774-1-f_l_k@t-online.de> <6ab3e55b-80b6-abc3-015b-7cd3ad5ab6b3@gmail.com>
In-Reply-To: <6ab3e55b-80b6-abc3-015b-7cd3ad5ab6b3@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 14:55:13 +0200
Message-ID: <CANNYZj9-6Q8Vpha9NxFrfk+ThmbdQi3=avQf3LTCiWOsWSdu7g@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-gnome][PATCHv3] webkitgtk3: add recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ff1940601777a9c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 12:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104054

--0000000000004ff1940601777a9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is coming shortly to oe-core.

Alex

On Thu 27. Jul 2023 at 14.53, Zoltan Boszormenyi <zboszor@gmail.com> wrote:

> 2023. 07. 27. 13:38 keltez=C3=A9ssel, Markus Volk =C3=ADrta:
> > - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk
>
> Can you also add the GTK4 variant, too? Pretty please.
>
> > - Import gcr3 recipe from oe-core
> >
> > Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in th=
e
> > process of updating webkitgtk to be built with gtk4. It will be necessa=
ry
> > to add a recipe that provides the gtk+3 variant, or we wont be able
> > to use e.g. geary with gmail addresses or provide google integration fo=
r
> > gnome-calendar or nautilus/files.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >   .../recipes-connectivity/geary/geary_43.0.bb  |   2 +-
> >   .../evolution-data-server.bb                  |   2 +-
> >   ...ectly-handle-disabled-ssh_agent-opti.patch |  36 ++
> >   meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb   |  59 ++++
> >   .../gnome-online-accounts_3.48.0.bb           |   2 +-
> >   meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   2 +-
> >   .../recipes-gnome/zenity/zenity_3.44.0.bb     |   2 +-
> >   ...spection.cmake-prefix-variables-obta.patch |  29 ++
> >   ...tCore-CMakeLists.txt-ensure-reproduc.patch |  28 ++
> >   ...44e17d258106617b0e6d783d073b188a2548.patch | 310 +++++++++++++++++=
+
> >   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |  41 +++
> >   .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |  33 ++
> >   .../webkitgtk3/reproducibility.patch          |  22 ++
> >   .../webkitgtk/webkitgtk3_2.40.2.bb            | 169 ++++++++++
> >   .../wxwidgets/wxwidgets_3.2.1.bb              |   2 +-
> >   meta-oe/recipes-graphics/surf/surf_2.1.bb     |   2 +-
> >   16 files changed, 734 insertions(+), 7 deletions(-)
> >   create mode 100644
> meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disab=
led-ssh_agent-opti.patch
> >   create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospec=
tion.cmake-prefix-variables-obta.patch
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCor=
e-CMakeLists.txt-ensure-reproduc.patch
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d7=
83d073b188a2548.patch
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13=
795c9b0f7894bf4.patch
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFOR=
M_GLX.patch
> >   create mode 100644
> meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> >   create mode 100644 meta-gnome/recipes-support/webkitgtk/
> webkitgtk3_2.40.2.bb
> >
> > diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> > index 6085d94fdc..bab4f909e0 100644
> > --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> > +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> > @@ -26,7 +26,7 @@ DEPENDS =3D " \
> >       libstemmer \
> >       libxml2 \
> >       sqlite3 \
> > -    webkitgtk \
> > +    webkitgtk3 \
> >   "
> >
> >   RDEPENDS:${PN} =3D "gnome-keyring"
> > diff --git a/meta-gnome/recipes-gnome/evolution-data-server/
> evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server=
/
> evolution-data-server.bb
> > index 43717a84cd..edbe30ff87 100644
> > --- a/meta-gnome/recipes-gnome/evolution-data-server/
> evolution-data-server.bb
> > +++ b/meta-gnome/recipes-gnome/evolution-data-server/
> evolution-data-server.bb
> > @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D "
> -DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scan
> >   PACKAGECONFIG ?=3D "oauth"
> >
> >   PACKAGECONFIG[canberra] =3D
> "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3DOFF,libcanberra"
> > -PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON
> -DENABLE_OAUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF
> -DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
> > +PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON
> -DENABLE_OAUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF
> -DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk3 json-glib"
> >   PACKAGECONFIG[goa]    =3D
> "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-online-accounts"
> >   PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,kr=
b5"
> >   # BROKEN: due missing pkg-config in openldap eds' cmake finds
> host-libs when
> > diff --git
> a/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-dis=
abled-ssh_agent-opti.patch
> b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-dis=
abled-ssh_agent-opti.patch
> > new file mode 100644
> > index 0000000000..d3c26d97ae
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-dis=
abled-ssh_agent-opti.patch
> > @@ -0,0 +1,36 @@
> > +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Wed, 16 Nov 2022 11:27:24 +0100
> > +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent
> option
> > +
> > +Existing code produces these errors:
> > +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found
> external program
> > +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> > +
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507a=
cbd73a30eab
> ]
> > +---
> > + meson.build | 12 ++++++++----
> > + 1 file changed, 8 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 3f35173..11d7fa7 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> > + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> > + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> > + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> > +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> > +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> > ++if get_option('ssh_agent')
> > ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> > ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> > ++endif
> > + conf.set10('WITH_SYSTEMD', with_systemd)
> > + config_file =3D configure_file(
> > +   output: 'config.h',
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> b/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> > new file mode 100644
> > index 0000000000..ba5660a5ed
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY =3D "A library for bits of crypto UI and parsing etc"
> > +DESCRIPTION =3D "GCR is a library for displaying certificates, and cry=
pto
> UI, \
> > +accessing key stores. It also provides the viewer for crypto files on
> the \
> > +GNOME desktop."
> > +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
> > +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
> > +
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605"
> > +
> > +DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
> > +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> 'libxslt-native', '', d)}"
> > +
> > +CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
> > +
> > +CFLAGS +=3D "-D_GNU_SOURCE"
> > +
> > +GNOMEBASEBUILDCLASS =3D "meson"
> > +GTKDOC_MESON_OPTION =3D "gtk_doc"
> > +inherit gnomebase gtk-icon-cache gi-docgen features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> > +UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
> > +
> > +SRC_URI =3D "
> https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=3Darchi=
ve"
> > +SRC_URI +=3D
> "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
> > +SRC_URI[archive.sha256sum] =3D
> "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
> > +
> > +S =3D "${WORKDIR}/gcr-${PV}"
> > +
> > +PACKAGECONFIG ??=3D " \
> > +     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)}=
 \
> > +"
> > +PACKAGECONFIG[gtk] =3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3"
> > +PACKAGECONFIG[ssh_agent] =3D
> "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,libsecret,openssh"
> > +#'Use systemd socket activation for server programs'
> > +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,s=
ystemd"
> > +
> > +FILES:${PN} +=3D " \
> > +    ${datadir}/dbus-1 \
> > +    ${datadir}/gcr-3 \
> > +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> > +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> > +"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/20229/
> > +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> > +
> > +EXTRA_OEMESON +=3D "--cross-file ${WORKDIR}/meson-${PN}.cross"
> > +do_write_config:append() {
> > +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> > +[binaries]
> > +gpg2 =3D '${bindir}/gpg2'
> > +ssh-add =3D '${bindir}/ssh-add'
> > +ssh-agent =3D '${bindir}/ssh-agent'
> > +EOF
> > +}
> > diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/
> gnome-online-accounts_3.48.0.bb
> b/meta-gnome/recipes-gnome/gnome-online-accounts/
> gnome-online-accounts_3.48.0.bb
> > index ca78fa0119..cd14b48508 100644
> > --- a/meta-gnome/recipes-gnome/gnome-online-accounts/
> gnome-online-accounts_3.48.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/
> gnome-online-accounts_3.48.0.bb
> > @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] =3D
> "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a
> >   PACKAGECONFIG ?=3D "goabackend kerberos owncloud lastfm google
> windows_live"
> >
> >   # goabackend requires webkitgtk to be built with gtk+3 and gcr3
> > -PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfals=
e,gtk+3
> gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk"
> > +PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfals=
e,gtk+3
> gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3"
> >   PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,kr=
b5 gcr3"
> >   PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
> >   PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
> > diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> > index 200ed0f709..51d51ee0ab 100644
> > --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> > +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> > @@ -19,7 +19,7 @@ DEPENDS +=3D " \
> >       libxslt \
> >       sqlite3 \
> >       libhandy \
> > -    webkitgtk \
> > +    webkitgtk3 \
> >       yelp-xsl \
> >   "
> >   PACKAGECONFIG_SOUP ?=3D "soup3"
> > diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> > index 8ea24ca49b..3548cc5bbe 100644
> > --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> > +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> > @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] =3D
> "c15582301ed90b9d42ce521dbccf99a989f22f12041bdd5279
> >   SRC_URI +=3D
> "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
> >
> >   PACKAGECONFIG ?=3D "webkitgtk"
> > -PACKAGECONFIG[webkitgtk] =3D
> "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,webkitgtk"
> > +PACKAGECONFIG[webkitgtk] =3D
> "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,webkitgtk3"
> >
> >   PACKAGES =3D+ "${PN}-gdialog"
> >   FILES:${PN}-gdialog =3D "${bindir}/gdialog"
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrosp=
ection.cmake-prefix-variables-obta.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrosp=
ection.cmake-prefix-variables-obta.patch
> > new file mode 100644
> > index 0000000000..8ae39f14e1
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrosp=
ection.cmake-prefix-variables-obta.patch
> > @@ -0,0 +1,29 @@
> > +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Tue, 27 Oct 2015 16:02:19 +0200
> > +Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables
> obtained
> > + from pkg-config with PKG_CONFIG_SYSROOT_DIR
> > +
> > +See discussion at https://bugs.webkit.org/show_bug.cgi?id=3D232933 for
> > +reasons why this is not approproiate for upstream submission.
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + Source/cmake/FindGI.cmake | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
> > +index af039cbb..b3e810cd 100644
> > +--- a/Source/cmake/FindGI.cmake
> > ++++ b/Source/cmake/FindGI.cmake
> > +@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
> > +     endif ()
> > + endif ()
> > +
> > ++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
> > ++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}=
")
> > ++
> > + find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
> > + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler)
> > +
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptC=
ore-CMakeLists.txt-ensure-reproduc.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptC=
ore-CMakeLists.txt-ensure-reproduc.patch
> > new file mode 100644
> > index 0000000000..bbe265059d
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptC=
ore-CMakeLists.txt-ensure-reproduc.patch
> > @@ -0,0 +1,28 @@
> > +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Mon, 26 Jun 2023 14:30:02 +0200
> > +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure
> reproducibility
> > + of __TIMESTAMP__
> > +
> > +__TIMESTAMP__ refers to mtime of the file that contains it, which is
> unstable
> > +and breaks binary reproducibility when the file is generated at build
> time. To ensure
> > +this does not happen, mtime should be set from the original file.
> > +
> > +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1529=
3
> ]
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + Source/JavaScriptCore/CMakeLists.txt | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Source/JavaScriptCore/CMakeLists.txt
> b/Source/JavaScriptCore/CMakeLists.txt
> > +index 43dc22ff..c2e3b1cd 100644
> > +--- a/Source/JavaScriptCore/CMakeLists.txt
> > ++++ b/Source/JavaScriptCore/CMakeLists.txt
> > +@@ -159,6 +159,7 @@ add_custom_command(
> > +     OUTPUT
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> > +     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/
> JSCBytecodeCacheVersion.cpp.in
> > +     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__=
/
> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in >
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> > ++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/
> JSCBytecodeCacheVersion.cpp.in
> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> > +             VERBATIM
> > + )
> > +
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6=
d783d073b188a2548.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6=
d783d073b188a2548.patch
> > new file mode 100644
> > index 0000000000..34e0ff9af3
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6=
d783d073b188a2548.patch
> > @@ -0,0 +1,310 @@
> > +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
> > +From: Adrian Perez de Castro <aperez@igalia.com>
> > +Date: Thu, 2 Jun 2022 11:19:06 +0300
> > +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path
> seems
> > + unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
> > +
> > +Reviewed by NOBODY (OOPS!).
> > +
> > +Move the NEON fast path for the SVG lighting filter effects into
> > +FELightingSoftwareApplier, and arrange to actually use them by
> > +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> > +
> > +Some changes were needed to adapt platformApplyNeon() to the current
> > +state of filters after r286140. This was not detected because the code
> > +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which doe=
s
> > +not get used much these days: CPU(ARM_THUMB2) is more common. It shoul=
d
> > +be possible to use the NEON fast paths also in Thumb mode, but that is
> > +left for a follow-up fix.
> > +
> > +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> > +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> > +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> > +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> > +(WebCore::FELighting::getPowerCoefficients): Deleted.
> > +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> > +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> > +(WebCore::FELighting::platformApplyNeon): Deleted.
> > +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> > +* Source/WebCore/platform/graphics/filters/FELighting.h:
> > +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> > +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> > +*
> Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAppli=
er.h:
> > +
> > +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233=
]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> > + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++---------=
-
> > + .../graphics/filters/DistantLightSource.h     |  4 ++
> > + .../platform/graphics/filters/FELighting.h    |  7 ---
> > + .../graphics/filters/PointLightSource.h       |  4 ++
> > + .../graphics/filters/SpotLightSource.h        |  4 ++
> > + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> > + 7 files changed, 56 insertions(+), 35 deletions(-)
> > +
> > +diff --git
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> > +index f6ff8c20..42a97ffc 100644
> > +---
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> > ++++
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> > +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> > +     return s_FELightingConstantsForNeon;
> > + }
> > +
> > +-void
> FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon*
> parameters)
> > ++void
> FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingData=
ForNeon*
> parameters)
> > + {
> > +     neonDrawLighting(parameters);
> > + }
> > +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> > +     "b .lightStrengthCalculated" NL
> > + ); // NOLINT
> > +
> > +-int FELighting::getPowerCoefficients(float exponent)
> > ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> > + {
> > +     // Calling a powf function from the assembly code would require t=
o
> save
> > +     // and reload a lot of NEON registers. Since the base is in range
> [0..1]
> > +diff --git
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> > +index b17c603d..e4629cda 100644
> > +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
h
> > ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
h
> > +@@ -24,14 +24,15 @@
> > +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAG=
E.
> > +  */
> > +
> > +-#ifndef FELightingNEON_h
> > +-#define FELightingNEON_h
> > ++#pragma once
> > +
> > + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > +
> > +-#include "FELighting.h"
> > ++#include "FELightingSoftwareApplier.h"
> > ++#include "ImageBuffer.h"
> > + #include "PointLightSource.h"
> > + #include "SpotLightSource.h"
> > ++#include <wtf/ObjectIdentifier.h>
> > + #include <wtf/ParallelJobs.h>
> > +
> > + namespace WebCore {
> > +@@ -93,14 +94,14 @@ extern "C" {
> > + void neonDrawLighting(FELightingPaintingDataForNeon*);
> > + }
> > +
> > +-inline void FELighting::platformApplyNeon(const LightingData& data,
> const LightSource::PaintingData& paintingData)
> > ++inline void FELightingSoftwareApplier::applyPlatformNeon(const
> FELightingSoftwareApplier::LightingData& data, const
> LightSource::PaintingData& paintingData)
> > + {
> > +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> > +-    FELightingPaintingDataForNeon neonData =3D {
> > ++    WebCore::FELightingFloatArgumentsForNeon alignas(16)
> floatArguments;
> > ++    WebCore::FELightingPaintingDataForNeon neonData =3D {
> > +         data.pixels->data(),
> > +         1,
> > +-        data.widthDecreasedByOne - 1,
> > +-        data.heightDecreasedByOne - 1,
> > ++        data.width - 2,
> > ++        data.height - 2,
> > +         0,
> > +         0,
> > +         0,
> > +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const
> LightingData& data, const LightS
> > +     // Set light source arguments.
> > +     floatArguments.constOne =3D 1;
> > +
> > +-    auto color =3D
> m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> > ++    auto color =3D
> data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> > +
> > +     floatArguments.colorRed =3D color.red;
> > +     floatArguments.colorGreen =3D color.green;
> > +     floatArguments.colorBlue =3D color.blue;
> > +     floatArguments.padding4 =3D 0;
> > +
> > +-    if (m_lightSource->type() =3D=3D LS_POINT) {
> > ++    if (data.lightSource->type() =3D=3D LS_POINT) {
> > +         neonData.flags |=3D FLAG_POINT_LIGHT;
> > +-        PointLightSource& pointLightSource =3D
> static_cast<PointLightSource&>(m_lightSource.get());
> > ++        const auto& pointLightSource =3D *static_cast<const
> PointLightSource*>(data.lightSource);
> > +         floatArguments.lightX =3D pointLightSource.position().x();
> > +         floatArguments.lightY =3D pointLightSource.position().y();
> > +         floatArguments.lightZ =3D pointLightSource.position().z();
> > +         floatArguments.padding2 =3D 0;
> > +-    } else if (m_lightSource->type() =3D=3D LS_SPOT) {
> > ++    } else if (data.lightSource->type() =3D=3D LS_SPOT) {
> > +         neonData.flags |=3D FLAG_SPOT_LIGHT;
> > +-        SpotLightSource& spotLightSource =3D
> static_cast<SpotLightSource&>(m_lightSource.get());
> > ++        const auto& spotLightSource =3D *static_cast<const
> SpotLightSource*>(data.lightSource);
> > +         floatArguments.lightX =3D spotLightSource.position().x();
> > +         floatArguments.lightY =3D spotLightSource.position().y();
> > +         floatArguments.lightZ =3D spotLightSource.position().z();
> > +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const
> LightingData& data, const LightS
> > +         if (spotLightSource.specularExponent() =3D=3D 1)
> > +             neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
> > +     } else {
> > +-        ASSERT(m_lightSource->type() =3D=3D LS_DISTANT);
> > ++        ASSERT(data.lightSource->type() =3D=3D LS_DISTANT);
> > +         floatArguments.lightX =3D
> paintingData.initialLightingData.lightVector.x();
> > +         floatArguments.lightY =3D
> paintingData.initialLightingData.lightVector.y();
> > +         floatArguments.lightZ =3D
> paintingData.initialLightingData.lightVector.z();
> > +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const
> LightingData& data, const LightS
> > +     // Set lighting arguments.
> > +     floatArguments.surfaceScale =3D data.surfaceScale;
> > +     floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceSc=
ale
> / 4;
> > +-    if (m_lightingType =3D=3D FELighting::DiffuseLighting)
> > +-        floatArguments.diffuseConstant =3D m_diffuseConstant;
> > ++    if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting)
> > ++        floatArguments.diffuseConstant =3D data.diffuseConstant;
> > +     else {
> > +         neonData.flags |=3D FLAG_SPECULAR_LIGHT;
> > +-        floatArguments.diffuseConstant =3D m_specularConstant;
> > +-        neonData.specularExponent =3D
> getPowerCoefficients(m_specularExponent);
> > +-        if (m_specularExponent =3D=3D 1)
> > ++        floatArguments.diffuseConstant =3D data.specularConstant;
> > ++        neonData.specularExponent =3D
> getPowerCoefficients(data.specularExponent);
> > ++        if (data.specularExponent =3D=3D 1)
> > +             neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1;
> > +     }
> > +     if (floatArguments.diffuseConstant =3D=3D 1)
> > +         neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1;
> > +
> > +-    int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) *
> (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> > ++    static constexpr int minimalRectDimension =3D 100 * 100; //
> Empirical data limit for parallel jobs
> > ++    int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)=
) /
> minimalRectDimension;
> > +     if (optimalThreadNumber > 1) {
> > +         // Initialize parallel jobs
> > +-        ParallelJobs<FELightingPaintingDataForNeon>
> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker,
> optimalThreadNumber);
> > ++        ParallelJobs<FELightingPaintingDataForNeon>
> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker,
> optimalThreadNumber);
> > +
> > +         // Fill the parameter array
> > +         int job =3D parallelJobs.numberOfJobs();
> > +         if (job > 1) {
> > +             int yStart =3D 1;
> > +-            int yStep =3D (data.heightDecreasedByOne - 1) / job;
> > ++            int yStep =3D (data.height - 2) / job;
> > +             for (--job; job >=3D 0; --job) {
> > +                 FELightingPaintingDataForNeon& params =3D
> parallelJobs.parameter(job);
> > +                 params =3D neonData;
> > +                 params.yStart =3D yStart;
> > +-                params.pixels +=3D (yStart - 1) *
> (data.widthDecreasedByOne + 1) * 4;
> > ++                params.pixels +=3D (yStart - 1) * data.width * 4;
> > +                 if (job > 0) {
> > +                     params.absoluteHeight =3D yStep;
> > +                     yStart +=3D yStep;
> > +                 } else
> > +-                    params.absoluteHeight =3D data.heightDecreasedByO=
ne
> - yStart;
> > ++                    params.absoluteHeight =3D (data.height - 1) - ySt=
art;
> > +             }
> > +             parallelJobs.execute();
> > +             return;
> > +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const
> LightingData& data, const LightS
> > + } // namespace WebCore
> > +
> > + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> > +-
> > +-#endif // FELightingNEON_h
> > +diff --git
> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> > +index 70c6512f..b032c82e 100644
> > +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> > +@@ -26,6 +26,10 @@
> > + #include <wtf/ArgumentCoder.h>
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class DistantLightSource : public LightSource {
> > +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h
> b/Source/WebCore/platform/graphics/filters/FELighting.h
> > +index 53beb596..e78a9354 100644
> > +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> > ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> > +@@ -35,8 +35,6 @@
> > +
> > + namespace WebCore {
> > +
> > +-struct FELightingPaintingDataForNeon;
> > +-
> > + class FELighting : public FilterEffect {
> > + public:
> > +     const Color& lightingColor() const { return m_lightingColor; }
> > +@@ -64,11 +62,6 @@ protected:
> > +
> > +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() cons=
t
> override;
> > +
> > +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > +-    static int getPowerCoefficients(float exponent);
> > +-    inline void platformApplyNeon(const LightingData&, const
> LightSource::PaintingData&);
> > +-#endif
> > +-
> > +     Color m_lightingColor;
> > +     float m_surfaceScale;
> > +     float m_diffuseConstant;
> > +diff --git
> a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> > +index 3a5723f0..675d63f5 100644
> > +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> > +@@ -26,6 +26,10 @@
> > + #include "LightSource.h"
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class PointLightSource : public LightSource {
> > +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.=
h
> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> > +index 684626f7..dea58389 100644
> > +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> > +@@ -26,6 +26,10 @@
> > + #include "LightSource.h"
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class SpotLightSource : public LightSource {
> > +diff --git
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> > +index c974d921..e2896660 100644
> > +---
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> > ++++
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> > +@@ -36,6 +36,7 @@
> > + namespace WebCore {
> > +
> > + class FELighting;
> > ++struct FELightingPaintingDataForNeon;
> > +
> > + class FELightingSoftwareApplier final : public
> FilterEffectConcreteApplier<FELighting> {
> > +     WTF_MAKE_FAST_ALLOCATED;
> > +@@ -132,8 +133,23 @@ private:
> > +
> > +     static void applyPlatformGenericPaint(const LightingData&, const
> LightSource::PaintingData&, int startY, int endY);
> > +     static void applyPlatformGenericWorker(ApplyParameters*);
> > ++
> > ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > ++    static int getPowerCoefficients(float exponent);
> > ++    static void
> platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> > ++    inline static void applyPlatformNeon(const LightingData&, const
> LightSource::PaintingData&);
> > ++
> > ++    inline static void applyPlatformGeneric(const LightingData& data,
> const LightSource::PaintingData& paintingData)
> > ++    {
> > ++        applyPlatformNeon(data, paintingData);
> > ++    }
> > ++#else
> > +     static void applyPlatformGeneric(const LightingData&, const
> LightSource::PaintingData&);
> > ++#endif
> > ++
> > +     static void applyPlatform(const LightingData&);
> > + };
> > +
> > + } // namespace WebCore
> > ++
> > ++#include "FELightingNEON.h"
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b=
13795c9b0f7894bf4.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b=
13795c9b0f7894bf4.patch
> > new file mode 100644
> > index 0000000000..79da855ff4
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b=
13795c9b0f7894bf4.patch
> > @@ -0,0 +1,41 @@
> > +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
> > +From: Diego Pino Garcia <dpino@igalia.com>
> > +Date: Mon, 22 May 2023 19:58:50 -0700
> > +Subject: [PATCH] [GLIB] Fix build error after 264196@main
> > + https://bugs.webkit.org/show_bug.cgi?id=3D256917
> > +
> > +Reviewed by Michael Catanzaro.
> > +
> > +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> > +enabled.
> > +
> > +* Source/WTF/wtf/glib/Sandbox.cpp:
> > +(WTF::isInsideUnsupportedContainer):
> > +
> > +Canonical link: https://commits.webkit.org/264395@main
> > +Upstream-Status: Backport [
> https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f=
7894bf4
> ]
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp
> b/Source/WTF/wtf/glib/Sandbox.cpp
> > +index 7d84e830ab33e..9b07bb8cb5a9b 100644
> > +--- a/Source/WTF/wtf/glib/Sandbox.cpp
> > ++++ b/Source/WTF/wtf/glib/Sandbox.cpp
> > +@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> > +     return returnValue;
> > + }
> > +
> > ++#if ENABLE(BUBBLEWRAP_SANDBOX)
> > + bool isInsideUnsupportedContainer()
> > + {
> > +     static bool inContainer =3D g_file_test("/run/.containerenv",
> G_FILE_TEST_EXISTS);
> > +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> > +
> > +     return inContainer && !supportedContainer;
> > + }
> > ++#endif
> > +
> > + bool isInsideSnap()
> > + {
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATF=
ORM_GLX.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATF=
ORM_GLX.patch
> > new file mode 100644
> > index 0000000000..ae99810ced
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATF=
ORM_GLX.patch
> > @@ -0,0 +1,33 @@
> > +Add additional check on GST_GL_HAVE_PLATFORM_GLX before using
> gst_gl_display_x11_new_with_display
> > +
> > +This ensures that there is a compile time check for glx support in
> gstreamer as
> > +runtime check is not enough because
> gst_gl_display_x11_new_with_display() API comes from
> > +gst/gl/x11/gstgldisplay_x11.h which is only included when
> GST_GL_HAVE_PLATFORM_GLX is defined
> > +therefore make this check consistent to fix build with some platforms
> which use pvr gl drivers
> > +where this problem appear at compile time.
> > +
> > +
> >
> +/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/w=
ebkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayG=
Streamer.cpp:68:31:
> error: use of undeclared identifier 'gst_gl_display_x11_new_with_display'=
;
> did you mean 'gst_gl_display_egl_new_with_egl_display'?
> > +   68 |         return
> GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDispl=
ayX11>(sharedDisplay).native()));
> > +      |
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +      |
>  gst_gl_display_egl_new_with_egl_display
> > +
> > +This issue is 2.40 specific since GLX support is removed [1] from trun=
k
> upstream, therefore
> > +this patch wont be needed when upgrading to 2.42+
> > +
> > +[1]
> https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75=
eb91abf
> > +
> > +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +---
> a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp
>       2023-02-20 01:22:18.917743700 -0800
> > ++++
> b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp
>       2023-07-08 08:45:09.739177065 -0700
> > +@@ -63,7 +63,7 @@
> > +     if (glPlatform =3D=3D GST_GL_PLATFORM_EGL)
> > +         return
> GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglD=
isplay()));
> > + #endif
> > +-#if USE(GLX)
> > ++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
> > +     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform =3D=3D
> GST_GL_PLATFORM_GLX)
> > +         return
> GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDispl=
ayX11>(sharedDisplay).native()));
> > + #endif
> > diff --git
> a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> > new file mode 100644
> > index 0000000000..e866a1a193
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> > @@ -0,0 +1,22 @@
> > +Injection a year based on the current date isn't reproducible. Hack th=
is
> > +to a specific year for now for reproducibilty and to avoid autobuilder
> failures.
> > +
> > +The correct fix would be to use SOURCE_DATE_EPOCH from the environment
> and
> > +then this could be submitted upstream, sadly my ruby isn't up to that.
> > +
> > +Upstream-Status: Pending [could be reworked]
> > +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +
> > +Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.=
rb
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +---
> webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
> > ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> > +@@ -25,7 +25,7 @@ require 'date'
> > + require 'digest'
> > +
> > + $LICENSE =3D <<-EOF
> > +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
> > ++Copyright (C) 2021 Apple Inc. All rights reserved.
> > +
> > + Redistribution and use in source and binary forms, with or without
> > + modification, are permitted provided that the following conditions
> > diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> > new file mode 100644
> > index 0000000000..9bd0c4e198
> > --- /dev/null
> > +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> > @@ -0,0 +1,169 @@
> > +SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
> > +HOMEPAGE =3D "https://www.webkitgtk.org/"
> > +BUGTRACKER =3D "https://bugs.webkit.org/"
> > +
> > +LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later"
> > +LIC_FILES_CHKSUM =3D
> "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d84286dda758da=
57bd691
> \
> > +
> file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8bab0b1=
2 \
> > +
> file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494445b79d=
21 \
> > +
> file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6e=
ec80
> \
> > +                    "
> > +
> > +SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz=
 \
> > +
>  file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
> > +           file://reproducibility.patch \
> > +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> > +           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
> > +
>  file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch \
> > +           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
> > +           "
> > +SRC_URI[sha256sum] =3D
> "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
> > +
> > +inherit cmake pkgconfig gobject-introspection perlnative features_chec=
k
> upstream-version-is-even gi-docgen
> > +
> > +S =3D "${WORKDIR}/webkitgtk-${PV}"
> > +
> > +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> > +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'wayland', 'opengl', '', d)}"
> > +
> > +CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> > +
> > +DEPENDS +=3D " \
> > +          ruby-native \
> > +          gperf-native \
> > +          unifdef-native \
> > +          cairo \
> > +          harfbuzz \
> > +          jpeg \
> > +          atk \
> > +          libwebp \
> > +          gtk+3 \
> > +          libxslt \
> > +          libtasn1 \
> > +          libnotify \
> > +          gstreamer1.0 \
> > +          gstreamer1.0-plugins-base \
> > +          glib-2.0-native \
> > +          gettext-native \
> > +          "
> > +
> > +PACKAGECONFIG_SOUP ?=3D "soup3"
> > +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd
> wayland x11', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'webgl opengl', '', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> 'webgl gles2', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl-or-es', '', d)} \
> > +                   enchant \
> > +                   libsecret \
> > +                   ${PACKAGECONFIG_SOUP} \
> > +                  "
> > +
> > +PACKAGECONFIG[wayland] =3D
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwp=
e
> wpebackend-fdo wayland-native"
> > +PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DO=
FF"
> > +PACKAGECONFIG[x11] =3D
> "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11
> libxcomposite libxdamage libxrender libxt"
> > +PACKAGECONFIG[geoclue] =3D
> "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue"
> > +PACKAGECONFIG[enchant] =3D
> "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2"
> > +PACKAGECONFIG[gles2] =3D
> "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual/libgles2"
> > +PACKAGECONFIG[webgl] =3D
> "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual/egl"
> > +PACKAGECONFIG[opengl] =3D
> "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GRAPHICS_CONTEXT_GL=3DOFF,vir=
tual/egl"
> > +PACKAGECONFIG[opengl-or-es] =3D
> "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF"
> > +PACKAGECONFIG[libsecret] =3D
> "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,libsecret"
> > +PACKAGECONFIG[libhyphen] =3D
> "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,libhyphen"
> > +PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
> > +PACKAGECONFIG[openjpeg] =3D
> "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpeg"
> > +PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,sys=
temd"
> > +PACKAGECONFIG[reduce-size] =3D
> "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,,"
> > +PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> > +PACKAGECONFIG[soup2] =3D
> "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4,,,soup3"
> > +PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
> > +PACKAGECONFIG[journald] =3D
> "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DOFF,systemd"
> > +PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,libavif"
> > +PACKAGECONFIG[media-recorder] =3D
> "-DENABLE_MEDIA_RECORDER=3DON,-DENABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-=
plugins-bad"
> > +PACKAGECONFIG[gamepad] =3D
> "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,libmanette"
> > +PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOF=
F"
> > +PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON
> -DBWRAP_EXECUTABLE=3D${bindir}/bwrap
> -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SA=
NDBOX=3DOFF,,bubblewrap
> xdg-dbus-proxy"
> > +
> > +EXTRA_OECMAKE =3D " \
> > +             -DPORT=3DGTK \
> > +             ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
> > +             ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True',
> '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
> > +             -DENABLE_MINIBROWSER=3DON \
> > +             "
> > +
> > +# Javascript JIT is not supported on ARC
> > +EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
> > +# By default 25-bit "medium" calls are used on ARC
> > +# which is not enough for binaries larger than 32 MiB
> > +CFLAGS:append:arc =3D " -mlong-calls"
> > +CXXFLAGS:append:arc =3D " -mlong-calls"
> > +
> > +# Needed for non-mesa graphics stacks when x11 is disabled
> > +CXXFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> '-DEGL_NO_X11=3D1', d)}"
> > +
> > +# Javascript JIT is not supported on powerpc
> > +EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
> > +EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
> > +
> > +# ARM JIT code does not build on ARMv4/5/6 anymore
> > +EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
> > +EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
> > +EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
> > +
> > +EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
> > +EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
> > +
> > +# JIT and gold linker does not work on RISCV
> > +EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3D=
OFF"
> > +EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF"
> > +
> > +# JIT not supported on MIPS either
> > +EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=
=3DON "
> > +
> > +# JIT not supported on X32
> > +# An attempt was made to upstream JIT support for x32 in
> > +# https://bugs.webkit.org/show_bug.cgi?id=3D100450, but this was close=
d
> as
> > +# unresolved due to limited X32 adoption.
> > +EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
> > +
> > +SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
> > +SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
> > +
> > +FILES:${PN} +=3D
> "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> > +
> > +RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/20370/
> > +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> > +
> > +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
> > +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
> > +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> > +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
> (-mthumb).
> > +ARM_INSTRUCTION_SET:armv7a =3D "thumb"
> > +ARM_INSTRUCTION_SET:armv7r =3D "thumb"
> > +ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
> > +
> > +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> > +COMPATIBLE_HOST:x86 =3D "${@bb.utils.contains_any('TUNE_FEATURES', 'co=
re2
> corei7', '.*', 'null', d)}"
> > +
> > +# introspection inside qemu-arm hangs forever on musl/arm builds
> > +# therefore disable GI_DATA
> > +GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
> > +GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
> > +
> > +do_install:append() {
> > +     mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
> > +}
> > +
> > +PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
> > +src_package_preprocess () {
> > +        # Trim build paths from comments in generated sources to ensur=
e
> reproducibility
> > +        sed -i -e "s,${WORKDIR},,g" \
> > +            ${B}/JavaScriptCore/DerivedSources/*.h \
> > +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> > +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> > +            ${B}/WebCore/DerivedSources/*.cpp \
> > +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
> > +}
> > +
> > diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> > index 39b6a2bc7c..91653e2852 100644
> > --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> > +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> > @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] =3D
> "-DwxUSE_LIBLZMA=3DON,-DwxUSE_LIBLZMA=3DOFF,xz"
> >   PACKAGECONFIG[mspack] =3D
> "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DOFF,libmspack"
> >   PACKAGECONFIG[opengl] =3D "-DwxUSE_OPENGL=3DON,-DwxUSE_OPENGL=3DOFF,l=
ibglu"
> >   PACKAGECONFIG[sdl_audio] =3D
> "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,libsdl2"
> > -PACKAGECONFIG[webkit] =3D
> "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_WEBKIT=3DOFF,webkitgtk,,,no_=
gui"
> > +PACKAGECONFIG[webkit] =3D
> "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_WEBKIT=3DOFF,webkitgtk3,,,no=
_gui"
> >   PACKAGECONFIG[curl] =3D
> "-DwxUSE_WEBREQUEST_CURL=3DON,-DwxUSE_WEBREQUEST_CURL=3DOFF,curl"
> >
> >   # Support LFS unconditionally
> > diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> > index 7140a72845..4d9d4d3dd0 100644
> > --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> > +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> > @@ -5,7 +5,7 @@ SECTION =3D "x11/graphics"
> >   LICENSE =3D "MIT"
> >   LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2a6f86d002ae9ae1eb1ccc466289f146"
> >
> > -DEPENDS =3D "webkitgtk gtk+3 glib-2.0 gcr3"
> > +DEPENDS =3D "webkitgtk3 gtk+3 glib-2.0 gcr3"
> >
> >   REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104053):
> https://lists.openembedded.org/g/openembedded-devel/message/104053
> Mute This Topic: https://lists.openembedded.org/mt/100388556/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004ff1940601777a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is coming shortly to oe-core.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu 27. Jul 2023 at 14.53, Zoltan =
Boszormenyi &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">2023. 07. 27. 13:38 keltez=C3=A9ssel, =
Markus Volk =C3=ADrta:<br>
&gt; - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk<b=
r>
<br>
Can you also add the GTK4 variant, too? Pretty please.<br>
<br>
&gt; - Import gcr3 recipe from oe-core<br>
&gt;<br>
&gt; Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in t=
he<br>
&gt; process of updating webkitgtk to be built with gtk4. It will be necess=
ary<br>
&gt; to add a recipe that provides the gtk+3 variant, or we wont be able<br=
>
&gt; to use e.g. geary with gmail addresses or provide google integration f=
or<br>
&gt; gnome-calendar or nautilus/files.<br>
&gt;<br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-connectivity/geary/<a href=3D"http://geary_43.=
0.bb" rel=3D"noreferrer" target=3D"_blank">geary_43.0.bb</a>=C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://evolution-data-server.bb" rel=3D"nor=
eferrer" target=3D"_blank">evolution-data-server.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0...ectly-handle-disabled-ssh_agent-opti.patch |=C2=A0 36 +=
+<br>
&gt;=C2=A0 =C2=A0meta-gnome/recipes-gnome/gcr/<a href=3D"http://gcr3_3.41.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gcr3_3.41.1.bb</a>=C2=A0 =C2=A0|=
=C2=A0 59 ++++<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://gnome-online-accounts_3.48.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gnome-online-accounts_3.48.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0meta-gnome/recipes-gnome/yelp/<a href=3D"http://yelp_42.2.=
bb" rel=3D"noreferrer" target=3D"_blank">yelp_42.2.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0.../recipes-gnome/zenity/<a href=3D"http://zenity_3.44.0.b=
b" rel=3D"noreferrer" target=3D"_blank">zenity_3.44.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0...spection.cmake-prefix-variables-obta.patch |=C2=A0 29 +=
+<br>
&gt;=C2=A0 =C2=A0...tCore-CMakeLists.txt-ensure-reproduc.patch |=C2=A0 28 +=
+<br>
&gt;=C2=A0 =C2=A0...44e17d258106617b0e6d783d073b188a2548.patch | 310 ++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |=C2=A0 41 +=
++<br>
&gt;=C2=A0 =C2=A0.../check-GST_GL_HAVE_PLATFORM_GLX.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 33 ++<br>
&gt;=C2=A0 =C2=A0.../webkitgtk3/reproducibility.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 ++<br>
&gt;=C2=A0 =C2=A0.../webkitgtk/<a href=3D"http://webkitgtk3_2.40.2.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk3_2.40.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 169 ++++++++++<br>
&gt;=C2=A0 =C2=A0.../wxwidgets/<a href=3D"http://wxwidgets_3.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">wxwidgets_3.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/surf/<a href=3D"http://surf_2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">surf_2.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A016 files changed, 734 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3/0001-=
meson.build-correctly-handle-disabled-ssh_agent-opti.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-gnome/gcr/<a href=3D=
"http://gcr3_3.41.1.bb" rel=3D"noreferrer" target=3D"_blank">gcr3_3.41.1.bb=
</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch<br=
>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch<br=
>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/we=
bkitgtk3/reproducibility.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-support/webkitgtk/<a=
 href=3D"http://webkitgtk3_2.40.2.bb" rel=3D"noreferrer" target=3D"_blank">=
webkitgtk3_2.40.2.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-connectivity/geary/<a href=3D"http://g=
eary_43.0.bb" rel=3D"noreferrer" target=3D"_blank">geary_43.0.bb</a> b/meta=
-gnome/recipes-connectivity/geary/<a href=3D"http://geary_43.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">geary_43.0.bb</a><br>
&gt; index 6085d94fdc..bab4f909e0 100644<br>
&gt; --- a/meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_43=
.0.bb" rel=3D"noreferrer" target=3D"_blank">geary_43.0.bb</a><br>
&gt; +++ b/meta-gnome/recipes-connectivity/geary/<a href=3D"http://geary_43=
.0.bb" rel=3D"noreferrer" target=3D"_blank">geary_43.0.bb</a><br>
&gt; @@ -26,7 +26,7 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libstemmer \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite3 \<br>
&gt; -=C2=A0 =C2=A0 webkitgtk \<br>
&gt; +=C2=A0 =C2=A0 webkitgtk3 \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot;gnome-keyring&quot;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/evolution-data-server/<a href=3D=
"http://evolution-data-server.bb" rel=3D"noreferrer" target=3D"_blank">evol=
ution-data-server.bb</a> b/meta-gnome/recipes-gnome/evolution-data-server/<=
a href=3D"http://evolution-data-server.bb" rel=3D"noreferrer" target=3D"_bl=
ank">evolution-data-server.bb</a><br>
&gt; index 43717a84cd..edbe30ff87 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/evolution-data-server/<a href=3D"http:/=
/evolution-data-server.bb" rel=3D"noreferrer" target=3D"_blank">evolution-d=
ata-server.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/evolution-data-server/<a href=3D"http:/=
/evolution-data-server.bb" rel=3D"noreferrer" target=3D"_blank">evolution-d=
ata-server.bb</a><br>
&gt; @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D &quot; -DG_IR_=
SCANNER=3D${STAGING_BINDIR}/g-ir-scan<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ?=3D &quot;oauth&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[canberra] =3D &quot;-DENABLE_CANBERRA=3DON,-=
DENABLE_CANBERRA=3DOFF,libcanberra&quot;<br>
&gt; -PACKAGECONFIG[oauth]=C2=A0 =C2=A0 =3D &quot;-DENABLE_OAUTH2_WEBKITGTK=
=3DON -DENABLE_OAUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DE=
NABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib&quot;<br>
&gt; +PACKAGECONFIG[oauth]=C2=A0 =C2=A0 =3D &quot;-DENABLE_OAUTH2_WEBKITGTK=
=3DON -DENABLE_OAUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DE=
NABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk3 json-glib&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[goa]=C2=A0 =C2=A0 =3D &quot;-DENABLE_GOA=3DO=
N,-DENABLE_GOA=3DOFF,gnome-online-accounts&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[kerberos]=C2=A0 =C2=A0 =3D &quot;-DWITH_KRB5=
=3DON,-DWITH_KRB5=3DOFF,krb5&quot;<br>
&gt;=C2=A0 =C2=A0# BROKEN: due missing pkg-config in openldap eds&#39; cmak=
e finds host-libs when<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correc=
tly-handle-disabled-ssh_agent-opti.patch b/meta-gnome/recipes-gnome/gcr/gcr=
3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d3c26d97ae<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-han=
dle-disabled-ssh_agent-opti.patch<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +Date: Wed, 16 Nov 2022 11:27:24 +0100<br>
&gt; +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent=
 option<br>
&gt; +<br>
&gt; +Existing code produces these errors:<br>
&gt; +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found =
external program<br>
&gt; +| gcr/meson.build:101:5: ERROR: Unknown variable &quot;ssh_add_path&q=
uot;.<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [ <a href=3D"https://gitlab.gnome.org/GNOME=
/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409=
e0e693cc6000507acbd73a30eab</a> ]<br>
&gt; +---<br>
&gt; + meson.build | 12 ++++++++----<br>
&gt; + 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 3f35173..11d7fa7 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -96,8 +98,10 @@ conf.set(&#39;HAVE_TIMEGM&#39;, cc.has_function(&#=
39;timegm&#39;))<br>
&gt; + conf.set(&#39;HAVE_MLOCK&#39;, cc.has_function(&#39;mlock&#39;))<br>
&gt; + conf.set_quoted(&#39;GPG_EXECUTABLE&#39;, gpg_path)<br>
&gt; + conf.set_quoted(&#39;LIBGCRYPT_VERSION&#39;, libgcrypt_dep.version()=
)<br>
&gt; +-conf.set_quoted(&#39;SSH_ADD_EXECUTABLE&#39;, ssh_add_path)<br>
&gt; +-conf.set_quoted(&#39;SSH_AGENT_EXECUTABLE&#39;, ssh_agent_path)<br>
&gt; ++if get_option(&#39;ssh_agent&#39;)<br>
&gt; ++=C2=A0 conf.set_quoted(&#39;SSH_ADD_EXECUTABLE&#39;, ssh_add_path)<b=
r>
&gt; ++=C2=A0 conf.set_quoted(&#39;SSH_AGENT_EXECUTABLE&#39;, ssh_agent_pat=
h)<br>
&gt; ++endif<br>
&gt; + conf.set10(&#39;WITH_SYSTEMD&#39;, with_systemd)<br>
&gt; + config_file =3D configure_file(<br>
&gt; +=C2=A0 =C2=A0output: &#39;config.h&#39;,<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gcr/<a href=3D"http://gcr3_3.41.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gcr3_3.41.1.bb</a> b/meta-gnome/=
recipes-gnome/gcr/<a href=3D"http://gcr3_3.41.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcr3_3.41.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ba5660a5ed<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-gnome/gcr/<a href=3D"http://gcr3_3.41.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gcr3_3.41.1.bb</a><br>
&gt; @@ -0,0 +1,59 @@<br>
&gt; +SUMMARY =3D &quot;A library for bits of crypto UI and parsing etc&quo=
t;<br>
&gt; +DESCRIPTION =3D &quot;GCR is a library for displaying certificates, a=
nd crypto UI, \<br>
&gt; +accessing key stores. It also provides the viewer for crypto files on=
 the \<br>
&gt; +GNOME desktop.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/gcr" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gcr</a>&qu=
ot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/gcr/is=
sues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/g=
cr/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D55ca817ccb7d5b5b66355=
690e9abc605&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;p11-kit glib-2.0 libgcrypt gnupg-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;GI=
_DATA_ENABLED&#39;, &#39;True&#39;, &#39;libxslt-native&#39;, &#39;&#39;, d=
)}&quot;<br>
&gt; +<br>
&gt; +CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_GPG=3D&#39;gpg2&#39;&quot;=
<br>
&gt; +<br>
&gt; +CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
&gt; +<br>
&gt; +GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt; +GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&gt; +inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-ve=
rsion-is-even vala gobject-introspection gettext mime mime-xdg<br>
&gt; +UPSTREAM_CHECK_REGEX =3D &quot;[^\d\.](?P&lt;pver&gt;3.(?!9\d+)\d+(\.=
\d+)+)\.tar&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gcr/3=
.41/gcr-$%7BPV%7D.tar.xz;name=3Darchive" rel=3D"noreferrer" target=3D"_blan=
k">https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=3Darch=
ive</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;file://0001-meson.build-correctly-handle-disabled-=
ssh_agent-opti.patch&quot;<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;bb7128a3c2febbfee9c03b90d77d498d=
0ceb237b0789802d60185c71c4bea24f&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/gcr-${PV}&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;systemd&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;wayland&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
&gt; +&quot;<br>
&gt; +PACKAGECONFIG[gtk] =3D &quot;-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3&quot;<b=
r>
&gt; +PACKAGECONFIG[ssh_agent] =3D &quot;-Dssh_agent=3Dtrue,-Dssh_agent=3Df=
alse,libsecret,openssh&quot;<br>
&gt; +#&#39;Use systemd socket activation for server programs&#39;<br>
&gt; +PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Denabled,-Dsystemd=3Ddisa=
bled,systemd&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/gcr-3 \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_user_unitdir}/gcr-ssh-agent.socket \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_user_unitdir}/gcr-ssh-agent.service \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20229/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/20229/</a><br>
&gt; +ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMESON +=3D &quot;--cross-file ${WORKDIR}/meson-${PN}.cross&qu=
ot;<br>
&gt; +do_write_config:append() {<br>
&gt; +=C2=A0 =C2=A0 cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF<br>
&gt; +[binaries]<br>
&gt; +gpg2 =3D &#39;${bindir}/gpg2&#39;<br>
&gt; +ssh-add =3D &#39;${bindir}/ssh-add&#39;<br>
&gt; +ssh-agent =3D &#39;${bindir}/ssh-agent&#39;<br>
&gt; +EOF<br>
&gt; +}<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/<a href=3D=
"http://gnome-online-accounts_3.48.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">gnome-online-accounts_3.48.0.bb</a> b/meta-gnome/recipes-gnome/gnome-onl=
ine-accounts/<a href=3D"http://gnome-online-accounts_3.48.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">gnome-online-accounts_3.48.0.bb</a><br>
&gt; index ca78fa0119..cd14b48508 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/gnome-online-accounts/<a href=3D"http:/=
/gnome-online-accounts_3.48.0.bb" rel=3D"noreferrer" target=3D"_blank">gnom=
e-online-accounts_3.48.0.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/<a href=3D"http:/=
/gnome-online-accounts_3.48.0.bb" rel=3D"noreferrer" target=3D"_blank">gnom=
e-online-accounts_3.48.0.bb</a><br>
&gt; @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] =3D &quot;418bb9fcffdbd72=
a98205ad365137617fc1e3551a54de74f6a<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ?=3D &quot;goabackend kerberos owncloud last=
fm google windows_live&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# goabackend requires webkitgtk to be built with gtk+3 and=
 gcr3<br>
&gt; -PACKAGECONFIG[goabackend] =3D &quot;-Dgoabackend=3Dtrue,-Dgoabackend=
=3Dfalse,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkit=
gtk&quot;<br>
&gt; +PACKAGECONFIG[goabackend] =3D &quot;-Dgoabackend=3Dtrue,-Dgoabackend=
=3Dfalse,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkit=
gtk3&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[kerberos] =3D &quot;-Dkerberos=3Dtrue, -Dker=
beros=3Dfalse,krb5 gcr3&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[exchange] =3D &quot;-Dexchange=3Dtrue, -Dexc=
hange=3Dfalse&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[google] =3D &quot;-Dgoogle=3Dtrue, -Dgoogle=
=3Dfalse&quot;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/yelp/<a href=3D"http://yelp_42.2=
.bb" rel=3D"noreferrer" target=3D"_blank">yelp_42.2.bb</a> b/meta-gnome/rec=
ipes-gnome/yelp/<a href=3D"http://yelp_42.2.bb" rel=3D"noreferrer" target=
=3D"_blank">yelp_42.2.bb</a><br>
&gt; index 200ed0f709..51d51ee0ab 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/yelp/<a href=3D"http://yelp_42.2.bb" re=
l=3D"noreferrer" target=3D"_blank">yelp_42.2.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/yelp/<a href=3D"http://yelp_42.2.bb" re=
l=3D"noreferrer" target=3D"_blank">yelp_42.2.bb</a><br>
&gt; @@ -19,7 +19,7 @@ DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxslt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libhandy \<br>
&gt; -=C2=A0 =C2=A0 webkitgtk \<br>
&gt; +=C2=A0 =C2=A0 webkitgtk3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0yelp-xsl \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG_SOUP ?=3D &quot;soup3&quot;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/zenity/<a href=3D"http://zenity_=
3.44.0.bb" rel=3D"noreferrer" target=3D"_blank">zenity_3.44.0.bb</a> b/meta=
-gnome/recipes-gnome/zenity/<a href=3D"http://zenity_3.44.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">zenity_3.44.0.bb</a><br>
&gt; index 8ea24ca49b..3548cc5bbe 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/zenity/<a href=3D"http://zenity_3.44.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zenity_3.44.0.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/zenity/<a href=3D"http://zenity_3.44.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zenity_3.44.0.bb</a><br>
&gt; @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] =3D &quot;c15582301ed90b9=
d42ce521dbccf99a989f22f12041bdd5279<br>
&gt;=C2=A0 =C2=A0SRC_URI +=3D &quot;file://0001-Harcode-shebang-to-avoid-po=
inting-to-build-system-s-.patch&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ?=3D &quot;webkitgtk&quot;<br>
&gt; -PACKAGECONFIG[webkitgtk] =3D &quot;-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Df=
alse,webkitgtk&quot;<br>
&gt; +PACKAGECONFIG[webkitgtk] =3D &quot;-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Df=
alse,webkitgtk3&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGES =3D+ &quot;${PN}-gdialog&quot;<br>
&gt;=C2=A0 =C2=A0FILES:${PN}-gdialog =3D &quot;${bindir}/gdialog&quot;<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Find=
GObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-gnome/recipes=
-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-va=
riables-obta.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8ae39f14e1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObject=
Introspection.cmake-prefix-variables-obta.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 27 Oct 2015 16:02:19 +0200<br>
&gt; +Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obt=
ained<br>
&gt; + from pkg-config with PKG_CONFIG_SYSROOT_DIR<br>
&gt; +<br>
&gt; +See discussion at <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=
=3D232933" rel=3D"noreferrer" target=3D"_blank">https://bugs.webkit.org/sho=
w_bug.cgi?id=3D232933</a> for<br>
&gt; +reasons why this is not approproiate for upstream submission.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + Source/cmake/FindGI.cmake | 3 +++<br>
&gt; + 1 file changed, 3 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake<br=
>
&gt; +index af039cbb..b3e810cd 100644<br>
&gt; +--- a/Source/cmake/FindGI.cmake<br>
&gt; ++++ b/Source/cmake/FindGI.cmake<br>
&gt; +@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0endif ()<br>
&gt; + endif ()<br>
&gt; +<br>
&gt; ++set(_GI_SCANNER_EXE &quot;$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_=
EXE}&quot;)<br>
&gt; ++set(_GI_COMPILER_EXE &quot;$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILE=
R_EXE}&quot;)<br>
&gt; ++<br>
&gt; + find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)<b=
r>
&gt; + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler=
)<br>
&gt; +<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Sour=
ce-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/meta-gnome/recipes=
-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ens=
ure-reproduc.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bbe265059d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-Java=
ScriptCore-CMakeLists.txt-ensure-reproduc.patch<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +Date: Mon, 26 Jun 2023 14:30:02 +0200<br>
&gt; +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reprodu=
cibility<br>
&gt; + of __TIMESTAMP__<br>
&gt; +<br>
&gt; +__TIMESTAMP__ refers to mtime of the file that contains it, which is =
unstable<br>
&gt; +and breaks binary reproducibility when the file is generated at build=
 time. To ensure<br>
&gt; +this does not happen, mtime should be set from the original file.<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/WebKit/WebK=
it/pull/15293" rel=3D"noreferrer" target=3D"_blank">https://github.com/WebK=
it/WebKit/pull/15293</a>]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + Source/JavaScriptCore/CMakeLists.txt | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScript=
Core/CMakeLists.txt<br>
&gt; +index 43dc22ff..c2e3b1cd 100644<br>
&gt; +--- a/Source/JavaScriptCore/CMakeLists.txt<br>
&gt; ++++ b/Source/JavaScriptCore/CMakeLists.txt<br>
&gt; +@@ -159,6 +159,7 @@ add_custom_command(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCB=
ytecodeCacheVersion.cpp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/<a =
href=3D"http://JSCBytecodeCacheVersion.cpp.in" rel=3D"noreferrer" target=3D=
"_blank">JSCBytecodeCacheVersion.cpp.in</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKS=
UM/__TIMESTAMP__/ ${JAVASCRIPTCORE_DIR}/runtime/<a href=3D"http://JSCByteco=
deCacheVersion.cpp.in" rel=3D"noreferrer" target=3D"_blank">JSCBytecodeCach=
eVersion.cpp.in</a> &gt; ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeC=
acheVersion.cpp<br>
&gt; ++=C2=A0 =C2=A0 COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/<a href=
=3D"http://JSCBytecodeCacheVersion.cpp.in" rel=3D"noreferrer" target=3D"_bl=
ank">JSCBytecodeCacheVersion.cpp.in</a> ${JavaScriptCore_DERIVED_SOURCES_DI=
R}/JSCBytecodeCacheVersion.cpp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VERBATIM<br>
&gt; + )<br>
&gt; +<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17=
d258106617b0e6d783d073b188a2548.patch b/meta-gnome/recipes-support/webkitgt=
k/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..34e0ff9af3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106=
617b0e6d783d073b188a2548.patch<br>
&gt; @@ -0,0 +1,310 @@<br>
&gt; +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.com"=
 target=3D"_blank">aperez@igalia.com</a>&gt;<br>
&gt; +Date: Thu, 2 Jun 2022 11:19:06 +0300<br>
&gt; +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path s=
eems<br>
&gt; + unused <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D241182" =
rel=3D"noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?i=
d=3D241182</a><br>
&gt; +<br>
&gt; +Reviewed by NOBODY (OOPS!).<br>
&gt; +<br>
&gt; +Move the NEON fast path for the SVG lighting filter effects into<br>
&gt; +FELightingSoftwareApplier, and arrange to actually use them by<br>
&gt; +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().<=
br>
&gt; +<br>
&gt; +Some changes were needed to adapt platformApplyNeon() to the current<=
br>
&gt; +state of filters after r286140. This was not detected because the cod=
e<br>
&gt; +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which do=
es<br>
&gt; +not get used much these days: CPU(ARM_THUMB2) is more common. It shou=
ld<br>
&gt; +be possible to use the NEON fast paths also in Thumb mode, but that i=
s<br>
&gt; +left for a follow-up fix.<br>
&gt; +<br>
&gt; +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp=
:<br>
&gt; +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):<br>
&gt; +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):<br>
&gt; +(WebCore::FELighting::platformApplyNeonWorker): Deleted.<br>
&gt; +(WebCore::FELighting::getPowerCoefficients): Deleted.<br>
&gt; +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:<=
br>
&gt; +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):<br>
&gt; +(WebCore::FELighting::platformApplyNeon): Deleted.<br>
&gt; +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:<br>
&gt; +* Source/WebCore/platform/graphics/filters/FELighting.h:<br>
&gt; +* Source/WebCore/platform/graphics/filters/PointLightSource.h:<br>
&gt; +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:<br>
&gt; +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwar=
eApplier.h:<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/WebKit/WebK=
it/pull/1233" rel=3D"noreferrer" target=3D"_blank">https://github.com/WebKi=
t/WebKit/pull/1233</a>]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../cpu/arm/filters/FELightingNEON.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +-<br>
&gt; + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++--------=
--<br>
&gt; + .../graphics/filters/DistantLightSource.h=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 4 ++<br>
&gt; + .../platform/graphics/filters/FELighting.h=C2=A0 =C2=A0 |=C2=A0 7 --=
-<br>
&gt; + .../graphics/filters/PointLightSource.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++<br>
&gt; + .../graphics/filters/SpotLightSource.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++<br>
&gt; + .../software/FELightingSoftwareApplier.h=C2=A0 =C2=A0 =C2=A0 | 16 ++=
++++<br>
&gt; + 7 files changed, 56 insertions(+), 35 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELight=
ingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNE=
ON.cpp<br>
&gt; +index f6ff8c20..42a97ffc 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.cpp<br>
&gt; ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.cpp<br>
&gt; +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return s_FELightingConstantsForNeon;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNe=
on* parameters)<br>
&gt; ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPa=
intingDataForNeon* parameters)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0neonDrawLighting(parameters);<br>
&gt; + }<br>
&gt; +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) &quot;:&quot; NL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;b .lightStrengthCalculated&quot; NL<br>
&gt; + ); // NOLINT<br>
&gt; +<br>
&gt; +-int FELighting::getPowerCoefficients(float exponent)<br>
&gt; ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)<=
br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Calling a powf function from the assembly code=
 would require to save<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// and reload a lot of NEON registers. Since the =
base is in range [0..1]<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELight=
ingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.h<br>
&gt; +index b17c603d..e4629cda 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.h<br>
&gt; ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.h<br>
&gt; +@@ -24,14 +24,15 @@<br>
&gt; +=C2=A0 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH=
 DAMAGE.<br>
&gt; +=C2=A0 */<br>
&gt; +<br>
&gt; +-#ifndef FELightingNEON_h<br>
&gt; +-#define FELightingNEON_h<br>
&gt; ++#pragma once<br>
&gt; +<br>
&gt; + #if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILE=
R(GCC_COMPATIBLE)<br>
&gt; +<br>
&gt; +-#include &quot;FELighting.h&quot;<br>
&gt; ++#include &quot;FELightingSoftwareApplier.h&quot;<br>
&gt; ++#include &quot;ImageBuffer.h&quot;<br>
&gt; + #include &quot;PointLightSource.h&quot;<br>
&gt; + #include &quot;SpotLightSource.h&quot;<br>
&gt; ++#include &lt;wtf/ObjectIdentifier.h&gt;<br>
&gt; + #include &lt;wtf/ParallelJobs.h&gt;<br>
&gt; +<br>
&gt; + namespace WebCore {<br>
&gt; +@@ -93,14 +94,14 @@ extern &quot;C&quot; {<br>
&gt; + void neonDrawLighting(FELightingPaintingDataForNeon*);<br>
&gt; + }<br>
&gt; +<br>
&gt; +-inline void FELighting::platformApplyNeon(const LightingData&amp; da=
ta, const LightSource::PaintingData&amp; paintingData)<br>
&gt; ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELig=
htingSoftwareApplier::LightingData&amp; data, const LightSource::PaintingDa=
ta&amp; paintingData)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 alignas(16) FELightingFloatArgumentsForNeon floatArgum=
ents;<br>
&gt; +-=C2=A0 =C2=A0 FELightingPaintingDataForNeon neonData =3D {<br>
&gt; ++=C2=A0 =C2=A0 WebCore::FELightingFloatArgumentsForNeon alignas(16) f=
loatArguments;<br>
&gt; ++=C2=A0 =C2=A0 WebCore::FELightingPaintingDataForNeon neonData =3D {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data.pixels-&gt;data(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data.widthDecreasedByOne - 1,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data.heightDecreasedByOne - 1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data.width - 2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data.height - 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
&gt; +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const=
 LightingData&amp; data, const LightS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Set light source arguments.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.constOne =3D 1;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 auto color =3D m_lightingColor.toColorTypeLossy&lt;SRG=
BA&lt;uint8_t&gt;&gt;().resolved();<br>
&gt; ++=C2=A0 =C2=A0 auto color =3D data.lightingColor.toColorTypeLossy&lt;=
SRGBA&lt;uint8_t&gt;&gt;().resolved();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.colorRed =3D color.red;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.colorGreen =3D color.green;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.colorBlue =3D color.blue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.padding4 =3D 0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 if (m_lightSource-&gt;type() =3D=3D LS_POINT) {<br>
&gt; ++=C2=A0 =C2=A0 if (data.lightSource-&gt;type() =3D=3D LS_POINT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D FLAG_POINT_LIGH=
T;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PointLightSource&amp; pointLightSource =
=3D static_cast&lt;PointLightSource&amp;&gt;(m_lightSource.get());<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const auto&amp; pointLightSource =3D *st=
atic_cast&lt;const PointLightSource*&gt;(data.lightSource);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightX =3D pointLigh=
tSource.position().x();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightY =3D pointLigh=
tSource.position().y();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightZ =3D pointLigh=
tSource.position().z();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.padding2 =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 } else if (m_lightSource-&gt;type() =3D=3D LS_SPOT) {<=
br>
&gt; ++=C2=A0 =C2=A0 } else if (data.lightSource-&gt;type() =3D=3D LS_SPOT)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D FLAG_SPOT_LIGHT=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SpotLightSource&amp; spotLightSource =3D=
 static_cast&lt;SpotLightSource&amp;&gt;(m_lightSource.get());<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const auto&amp; spotLightSource =3D *sta=
tic_cast&lt;const SpotLightSource*&gt;(data.lightSource);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightX =3D spotLight=
Source.position().x();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightY =3D spotLight=
Source.position().y();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightZ =3D spotLight=
Source.position().z();<br>
&gt; +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const L=
ightingData&amp; data, const LightS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (spotLightSource.specularExponen=
t() =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D F=
LAG_CONE_EXPONENT_IS_1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(m_lightSource-&gt;type() =3D=3D L=
S_DISTANT);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(data.lightSource-&gt;type() =3D=
=3D LS_DISTANT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightX =3D paintingD=
ata.initialLightingData.lightVector.x();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightY =3D paintingD=
ata.initialLightingData.lightVector.y();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0floatArguments.lightZ =3D paintingD=
ata.initialLightingData.lightVector.z();<br>
&gt; +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const=
 LightingData&amp; data, const LightS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Set lighting arguments.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.surfaceScale =3D data.surfaceScale=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0floatArguments.minusSurfaceScaleDividedByFour =3D=
 -data.surfaceScale / 4;<br>
&gt; +-=C2=A0 =C2=A0 if (m_lightingType =3D=3D FELighting::DiffuseLighting)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 floatArguments.diffuseConstant =3D m_dif=
fuseConstant;<br>
&gt; ++=C2=A0 =C2=A0 if (data.filterType =3D=3D FilterEffect::Type::FEDiffu=
seLighting)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 floatArguments.diffuseConstant =3D data.=
diffuseConstant;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D FLAG_SPECULAR_L=
IGHT;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 floatArguments.diffuseConstant =3D m_spe=
cularConstant;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 neonData.specularExponent =3D getPowerCo=
efficients(m_specularExponent);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m_specularExponent =3D=3D 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 floatArguments.diffuseConstant =3D data.=
specularConstant;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 neonData.specularExponent =3D getPowerCo=
efficients(data.specularExponent);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data.specularExponent =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D F=
LAG_SPECULAR_EXPONENT_IS_1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (floatArguments.diffuseConstant =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0neonData.flags |=3D FLAG_DIFFUSE_CO=
NST_IS_1;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 int optimalThreadNumber =3D ((data.widthDecreasedByOne=
 - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;<br>
&gt; ++=C2=A0 =C2=A0 static constexpr int minimalRectDimension =3D 100 * 10=
0; // Empirical data limit for parallel jobs<br>
&gt; ++=C2=A0 =C2=A0 int optimalThreadNumber =3D ((data.width - 2) * (data.=
height - 2)) / minimalRectDimension;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (optimalThreadNumber &gt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Initialize parallel jobs<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ParallelJobs&lt;FELightingPaintingDataFo=
rNeon&gt; parallelJobs(&amp;WebCore::FELighting::platformApplyNeonWorker, o=
ptimalThreadNumber);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ParallelJobs&lt;FELightingPaintingDataFo=
rNeon&gt; parallelJobs(&amp;FELightingSoftwareApplier::platformApplyNeonWor=
ker, optimalThreadNumber);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Fill the parameter array<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int job =3D parallelJobs.numberOfJo=
bs();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (job &gt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int yStart =3D 1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int yStep =3D (data.height=
DecreasedByOne - 1) / job;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int yStep =3D (data.height=
 - 2) / job;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (--job; job &gt;=
=3D 0; --job) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FELight=
ingPaintingDataForNeon&amp; params =3D parallelJobs.parameter(job);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params =
=3D neonData;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.=
yStart =3D yStart;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params.pixel=
s +=3D (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params.pixel=
s +=3D (yStart - 1) * data.width * 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (job=
 &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0params.absoluteHeight =3D yStep;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0yStart +=3D yStep;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params.absoluteHeight =3D data.heightDecreasedByOne - yStart;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 params.absoluteHeight =3D (data.height - 1) - yStart;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parallelJobs.execute(=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const L=
ightingData&amp; data, const LightS<br>
&gt; + } // namespace WebCore<br>
&gt; +<br>
&gt; + #endif // CPU(ARM_NEON) &amp;&amp; COMPILER(GCC_COMPATIBLE)<br>
&gt; +-<br>
&gt; +-#endif // FELightingNEON_h<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSou=
rce.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h<br>
&gt; +index 70c6512f..b032c82e 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h<b=
r>
&gt; ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h<b=
r>
&gt; +@@ -26,6 +26,10 @@<br>
&gt; + #include &lt;wtf/ArgumentCoder.h&gt;<br>
&gt; + #include &lt;wtf/Ref.h&gt;<br>
&gt; +<br>
&gt; ++namespace WTF {<br>
&gt; ++class TextStream;<br>
&gt; ++} // namespace WTF<br>
&gt; ++<br>
&gt; + namespace WebCore {<br>
&gt; +<br>
&gt; + class DistantLightSource : public LightSource {<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/=
Source/WebCore/platform/graphics/filters/FELighting.h<br>
&gt; +index 53beb596..e78a9354 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/filters/FELighting.h<br>
&gt; ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h<br>
&gt; +@@ -35,8 +35,6 @@<br>
&gt; +<br>
&gt; + namespace WebCore {<br>
&gt; +<br>
&gt; +-struct FELightingPaintingDataForNeon;<br>
&gt; +-<br>
&gt; + class FELighting : public FilterEffect {<br>
&gt; + public:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const Color&amp; lightingColor() const { return m=
_lightingColor; }<br>
&gt; +@@ -64,11 +62,6 @@ protected:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0std::unique_ptr&lt;FilterEffectApplier&gt; create=
SoftwareApplier() const override;<br>
&gt; +<br>
&gt; +-#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILE=
R(GCC_COMPATIBLE)<br>
&gt; +-=C2=A0 =C2=A0 static int getPowerCoefficients(float exponent);<br>
&gt; +-=C2=A0 =C2=A0 inline void platformApplyNeon(const LightingData&amp;,=
 const LightSource::PaintingData&amp;);<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Color m_lightingColor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0float m_surfaceScale;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0float m_diffuseConstant;<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSourc=
e.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h<br>
&gt; +index 3a5723f0..675d63f5 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h<br>
&gt; ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h<br>
&gt; +@@ -26,6 +26,10 @@<br>
&gt; + #include &quot;LightSource.h&quot;<br>
&gt; + #include &lt;wtf/Ref.h&gt;<br>
&gt; +<br>
&gt; ++namespace WTF {<br>
&gt; ++class TextStream;<br>
&gt; ++} // namespace WTF<br>
&gt; ++<br>
&gt; + namespace WebCore {<br>
&gt; +<br>
&gt; + class PointLightSource : public LightSource {<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource=
.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h<br>
&gt; +index 684626f7..dea58389 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h<br>
&gt; ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h<br>
&gt; +@@ -26,6 +26,10 @@<br>
&gt; + #include &quot;LightSource.h&quot;<br>
&gt; + #include &lt;wtf/Ref.h&gt;<br>
&gt; +<br>
&gt; ++namespace WTF {<br>
&gt; ++class TextStream;<br>
&gt; ++} // namespace WTF<br>
&gt; ++<br>
&gt; + namespace WebCore {<br>
&gt; +<br>
&gt; + class SpotLightSource : public LightSource {<br>
&gt; +diff --git a/Source/WebCore/platform/graphics/filters/software/FELigh=
tingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/F=
ELightingSoftwareApplier.h<br>
&gt; +index c974d921..e2896660 100644<br>
&gt; +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSof=
twareApplier.h<br>
&gt; ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSof=
twareApplier.h<br>
&gt; +@@ -36,6 +36,7 @@<br>
&gt; + namespace WebCore {<br>
&gt; +<br>
&gt; + class FELighting;<br>
&gt; ++struct FELightingPaintingDataForNeon;<br>
&gt; +<br>
&gt; + class FELightingSoftwareApplier final : public FilterEffectConcreteA=
pplier&lt;FELighting&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WTF_MAKE_FAST_ALLOCATED;<br>
&gt; +@@ -132,8 +133,23 @@ private:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static void applyPlatformGenericPaint(const Light=
ingData&amp;, const LightSource::PaintingData&amp;, int startY, int endY);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0static void applyPlatformGenericWorker(ApplyParam=
eters*);<br>
&gt; ++<br>
&gt; ++#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILE=
R(GCC_COMPATIBLE)<br>
&gt; ++=C2=A0 =C2=A0 static int getPowerCoefficients(float exponent);<br>
&gt; ++=C2=A0 =C2=A0 static void platformApplyNeonWorker(FELightingPainting=
DataForNeon*);<br>
&gt; ++=C2=A0 =C2=A0 inline static void applyPlatformNeon(const LightingDat=
a&amp;, const LightSource::PaintingData&amp;);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 inline static void applyPlatformGeneric(const Lighting=
Data&amp; data, const LightSource::PaintingData&amp; paintingData)<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 applyPlatformNeon(data, paintingData);<b=
r>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static void applyPlatformGeneric(const LightingDa=
ta&amp;, const LightSource::PaintingData&amp;);<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static void applyPlatform(const LightingData&amp;=
);<br>
&gt; + };<br>
&gt; +<br>
&gt; + } // namespace WebCore<br>
&gt; ++<br>
&gt; ++#include &quot;FELightingNEON.h&quot;<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab=
4ab35258a6da9b13795c9b0f7894bf4.patch b/meta-gnome/recipes-support/webkitgt=
k/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..79da855ff4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab3525=
8a6da9b13795c9b0f7894bf4.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Diego Pino Garcia &lt;<a href=3D"mailto:dpino@igalia.com" targe=
t=3D"_blank">dpino@igalia.com</a>&gt;<br>
&gt; +Date: Mon, 22 May 2023 19:58:50 -0700<br>
&gt; +Subject: [PATCH] [GLIB] Fix build error after 264196@main<br>
&gt; + <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D256917" rel=3D"=
noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D256=
917</a><br>
&gt; +<br>
&gt; +Reviewed by Michael Catanzaro.<br>
&gt; +<br>
&gt; +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is<=
br>
&gt; +enabled.<br>
&gt; +<br>
&gt; +* Source/WTF/wtf/glib/Sandbox.cpp:<br>
&gt; +(WTF::isInsideUnsupportedContainer):<br>
&gt; +<br>
&gt; +Canonical link: <a href=3D"https://commits.webkit.org/264395@main" re=
l=3D"noreferrer" target=3D"_blank">https://commits.webkit.org/264395@main</=
a><br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/WebKit/WebKi=
t/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9=
b13795c9b0f7894bf4</a>]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sa=
ndbox.cpp<br>
&gt; +index 7d84e830ab33e..9b07bb8cb5a9b 100644<br>
&gt; +--- a/Source/WTF/wtf/glib/Sandbox.cpp<br>
&gt; ++++ b/Source/WTF/wtf/glib/Sandbox.cpp<br>
&gt; +@@ -36,6 +36,7 @@ bool isInsideFlatpak()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return returnValue;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++#if ENABLE(BUBBLEWRAP_SANDBOX)<br>
&gt; + bool isInsideUnsupportedContainer()<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static bool inContainer =3D g_file_test(&quot;/ru=
n/.containerenv&quot;, G_FILE_TEST_EXISTS);<br>
&gt; +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return inContainer &amp;&amp; !supportedContainer=
;<br>
&gt; + }<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; + bool isInsideSnap()<br>
&gt; + {<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST=
_GL_HAVE_PLATFORM_GLX.patch b/meta-gnome/recipes-support/webkitgtk/webkitgt=
k3/check-GST_GL_HAVE_PLATFORM_GLX.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ae99810ced<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAV=
E_PLATFORM_GLX.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_=
display_x11_new_with_display<br>
&gt; +<br>
&gt; +This ensures that there is a compile time check for glx support in gs=
treamer as<br>
&gt; +runtime check is not enough because gst_gl_display_x11_new_with_displ=
ay() API comes from<br>
&gt; +gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE=
_PLATFORM_GLX is defined<br>
&gt; +therefore make this check consistent to fix build with some platforms=
 which use pvr gl drivers<br>
&gt; +where this problem appear at compile time.<br>
&gt; +<br>
&gt; +<br>
&gt; +/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r=
0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDispl=
ayGStreamer.cpp:68:31: error: use of undeclared identifier &#39;gst_gl_disp=
lay_x11_new_with_display&#39;; did you mean &#39;gst_gl_display_egl_new_wit=
h_egl_display&#39;?<br>
&gt; +=C2=A0 =C2=A068 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GST_GL_DISP=
LAY(gst_gl_display_x11_new_with_display(downcast&lt;PlatformDisplayX11&gt;(=
sharedDisplay).native()));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_gl_di=
splay_egl_new_with_egl_display<br>
&gt; +<br>
&gt; +This issue is 2.40 specific since GLX support is removed [1] from tru=
nk upstream, therefore<br>
&gt; +this patch wont be needed when upgrading to 2.42+<br>
&gt; +<br>
&gt; +[1] <a href=3D"https://github.com/WebKit/WebKit/commit/320560f9e53ddc=
d53954059bd005e0c75eb91abf" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf</a><=
br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +--- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStre=
amer.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-02-20 01:22:18.917743700 -0800<br>
&gt; ++++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStre=
amer.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-08 08:45:09.739177065 -0700<br>
&gt; +@@ -63,7 +63,7 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (glPlatform =3D=3D GST_GL_PLATFORM_EGL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GST_GL_DISPLAY(gst_gl_displa=
y_egl_new_with_egl_display(sharedDisplay.eglDisplay()));<br>
&gt; + #endif<br>
&gt; +-#if USE(GLX)<br>
&gt; ++#if USE(GLX) &amp;&amp; GST_GL_HAVE_PLATFORM_GLX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (is&lt;PlatformDisplayX11&gt;(sharedDisplay) &=
amp;&amp; glPlatform =3D=3D GST_GL_PLATFORM_GLX)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GST_GL_DISPLAY(gst_gl_displa=
y_x11_new_with_display(downcast&lt;PlatformDisplayX11&gt;(sharedDisplay).na=
tive()));<br>
&gt; + #endif<br>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproduci=
bility.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibil=
ity.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e866a1a193<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.=
patch<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +Injection a year based on the current date isn&#39;t reproducible. Ha=
ck this<br>
&gt; +to a specific year for now for reproducibilty and to avoid autobuilde=
r failures.<br>
&gt; +<br>
&gt; +The correct fix would be to use SOURCE_DATE_EPOCH from the environmen=
t and<br>
&gt; +then this could be submitted upstream, sadly my ruby isn&#39;t up to =
that.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending [could be reworked]<br>
&gt; +Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; +<br>
&gt; +Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile=
.rb<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFi=
le.rb<br>
&gt; ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb=
<br>
&gt; +@@ -25,7 +25,7 @@ require &#39;date&#39;<br>
&gt; + require &#39;digest&#39;<br>
&gt; +<br>
&gt; + $LICENSE =3D &lt;&lt;-EOF<br>
&gt; +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.<br>
&gt; ++Copyright (C) 2021 Apple Inc. All rights reserved.<br>
&gt; +<br>
&gt; + Redistribution and use in source and binary forms, with or without<b=
r>
&gt; + modification, are permitted provided that the following conditions<b=
r>
&gt; diff --git a/meta-gnome/recipes-support/webkitgtk/<a href=3D"http://we=
bkitgtk3_2.40.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.40.2.=
bb</a> b/meta-gnome/recipes-support/webkitgtk/<a href=3D"http://webkitgtk3_=
2.40.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.40.2.bb</a><br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..9bd0c4e198<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-support/webkitgtk/<a href=3D"http://webkitgtk=
3_2.40.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk3_2.40.2.bb</a><=
br>
&gt; @@ -0,0 +1,169 @@<br>
&gt; +SUMMARY =3D &quot;WebKit web rendering engine for the GTK+ platform&q=
uot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.webkitgtk.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://www.webkitgtk.org/</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://bugs.webkit.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://bugs.webkit.org/</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;BSD-2-Clause &amp; LGPL-2.0-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://Source/JavaScriptCore/COPYING.LIB;m=
d5=3Dd0c6d6397a5d84286dda758da57bd691 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8bab0b12=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494445b79d2=
1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6ee=
c80 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/releases/webki=
tgtk-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.web=
kitgtk.org/releases/webkitgtk-${PV}.tar.xz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-FindGObjectIntro=
spection.cmake-prefix-variables-obta.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducibility.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0d3344e17d258106617b0=
e6d783d073b188a2548.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://4977290ab4ab35258a6da=
9b13795c9b0f7894bf4.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Source-JavaScrip=
tCore-CMakeLists.txt-ensure-reproduc.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-GST_GL_HAVE_PLA=
TFORM_GLX.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;96898870d994da406ee7a632816dcde9a3bb395e=
e5f344fcb3f3b8cc8a77e000&quot;<br>
&gt; +<br>
&gt; +inherit cmake pkgconfig gobject-introspection perlnative features_che=
ck upstream-version-is-even gi-docgen<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/webkitgtk-${PV}&quot;<br>
&gt; +<br>
&gt; +ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;wayland&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; +<br>
&gt; +CVE_PRODUCT =3D &quot;webkitgtk webkitgtk\+&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ruby-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gperf-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unifdef-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cairo \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 harfbuzz \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jpeg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atk \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libwebp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk+3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxslt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libtasn1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libnotify \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-plugins-base \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gettext-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG_SOUP ?=3D &quot;soup3&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;systemd wayland x11&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;=
webgl opengl&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, =
&#39;webgl gles2&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;open=
gl-or-es&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
enchant \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
libsecret \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${PACKAGECONFIG_SOUP} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
<br>
&gt; +<br>
&gt; +PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABL=
E_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native&quot;<b=
r>
&gt; +PACKAGECONFIG[angle] =3D &quot;-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEB=
GL=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TA=
RGET=3DOFF,virtual/libx11 libxcomposite libxdamage libxrender libxt&quot;<b=
r>
&gt; +PACKAGECONFIG[geoclue] =3D &quot;-DENABLE_GEOLOCATION=3DON,-DENABLE_G=
EOLOCATION=3DOFF,geoclue&quot;<br>
&gt; +PACKAGECONFIG[enchant] =3D &quot;-DENABLE_SPELLCHECK=3DON,-DENABLE_SP=
ELLCHECK=3DOFF,enchant2&quot;<br>
&gt; +PACKAGECONFIG[gles2] =3D &quot;-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DO=
FF,virtual/libgles2&quot;<br>
&gt; +PACKAGECONFIG[webgl] =3D &quot;-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DO=
FF,virtual/egl&quot;<br>
&gt; +PACKAGECONFIG[opengl] =3D &quot;-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DE=
NABLE_GRAPHICS_CONTEXT_GL=3DOFF,virtual/egl&quot;<br>
&gt; +PACKAGECONFIG[opengl-or-es] =3D &quot;-DUSE_OPENGL_OR_ES=3DON,-DUSE_O=
PENGL_OR_ES=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[libsecret] =3D &quot;-DUSE_LIBSECRET=3DON,-DUSE_LIBSECR=
ET=3DOFF,libsecret&quot;<br>
&gt; +PACKAGECONFIG[libhyphen] =3D &quot;-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPH=
EN=3DOFF,libhyphen&quot;<br>
&gt; +PACKAGECONFIG[woff2] =3D &quot;-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,wof=
f2&quot;<br>
&gt; +PACKAGECONFIG[openjpeg] =3D &quot;-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=
=3DOFF,openjpeg&quot;<br>
&gt; +PACKAGECONFIG[systemd] =3D &quot;-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Do=
ff,systemd&quot;<br>
&gt; +PACKAGECONFIG[reduce-size] =3D &quot;-DCMAKE_BUILD_TYPE=3DMinSizeRel,=
-DCMAKE_BUILD_TYPE=3DRelease,,&quot;<br>
&gt; +PACKAGECONFIG[lcms] =3D &quot;-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms&q=
uot;<br>
&gt; +PACKAGECONFIG[soup2] =3D &quot;-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,lib=
soup-2.4,,,soup3&quot;<br>
&gt; +PACKAGECONFIG[soup3] =3D &quot;,,libsoup,,,soup2&quot;<br>
&gt; +PACKAGECONFIG[journald] =3D &quot;-DENABLE_JOURNALD_LOG=3DON,-DENABLE=
_JOURNALD_LOG=3DOFF,systemd&quot;<br>
&gt; +PACKAGECONFIG[avif] =3D &quot;-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,li=
bavif&quot;<br>
&gt; +PACKAGECONFIG[media-recorder] =3D &quot;-DENABLE_MEDIA_RECORDER=3DON,=
-DENABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-bad&quot;<br>
&gt; +PACKAGECONFIG[gamepad] =3D &quot;-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEP=
AD=3DOFF,libmanette&quot;<br>
&gt; +PACKAGECONFIG[webrtc] =3D &quot;-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RT=
C=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[bubblewrap] =3D &quot;-DENABLE_BUBBLEWRAP_SANDBOX=3DON =
-DBWRAP_EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xd=
g-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy&q=
uot;<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPORT=3DGTK \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(=
&#39;GI_DATA_ENABLED&#39;, &#39;True&#39;, &#39;-DENABLE_INTROSPECTION=3DON=
&#39;, &#39;-DENABLE_INTROSPECTION=3DOFF&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(=
&#39;GIDOCGEN_ENABLED&#39;, &#39;True&#39;, &#39;-DENABLE_DOCUMENTATION=3DO=
N&#39;, &#39;-DENABLE_DOCUMENTATION=3DOFF&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_MINIBROWSER=
=3DON \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +# Javascript JIT is not supported on ARC<br>
&gt; +EXTRA_OECMAKE:append:arc =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +# By default 25-bit &quot;medium&quot; calls are used on ARC<br>
&gt; +# which is not enough for binaries larger than 32 MiB<br>
&gt; +CFLAGS:append:arc =3D &quot; -mlong-calls&quot;<br>
&gt; +CXXFLAGS:append:arc =3D &quot; -mlong-calls&quot;<br>
&gt; +<br>
&gt; +# Needed for non-mesa graphics stacks when x11 is disabled<br>
&gt; +CXXFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39;&#39;, &#39;-DEGL_NO_X11=3D1&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# Javascript JIT is not supported on powerpc<br>
&gt; +EXTRA_OECMAKE:append:powerpc =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +EXTRA_OECMAKE:append:powerpc64 =3D &quot; -DENABLE_JIT=3DOFF &quot;<b=
r>
&gt; +<br>
&gt; +# ARM JIT code does not build on ARMv4/5/6 anymore<br>
&gt; +EXTRA_OECMAKE:append:armv5 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +EXTRA_OECMAKE:append:armv6 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +EXTRA_OECMAKE:append:armv4 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE:append:mipsarch =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<b=
r>
&gt; +EXTRA_OECMAKE:append:powerpc =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<br=
>
&gt; +<br>
&gt; +# JIT and gold linker does not work on RISCV<br>
&gt; +EXTRA_OECMAKE:append:riscv32 =3D &quot; -DUSE_LD_GOLD=3DOFF -DENABLE_=
JIT=3DOFF&quot;<br>
&gt; +EXTRA_OECMAKE:append:riscv64 =3D &quot; -DUSE_LD_GOLD=3DOFF&quot;<br>
&gt; +<br>
&gt; +# JIT not supported on MIPS either<br>
&gt; +EXTRA_OECMAKE:append:mipsarch =3D &quot; -DENABLE_JIT=3DOFF -DENABLE_=
C_LOOP=3DON &quot;<br>
&gt; +<br>
&gt; +# JIT not supported on X32<br>
&gt; +# An attempt was made to upstream JIT support for x32 in<br>
&gt; +# <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D100450" rel=3D=
"noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D10=
0450</a>, but this was closed as<br>
&gt; +# unresolved due to limited X32 adoption.<br>
&gt; +EXTRA_OECMAKE:append:x86-x32 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
&gt; +<br>
&gt; +SECURITY_CFLAGS:remove:aarch64 =3D &quot;-fpie&quot;<br>
&gt; +SECURITY_CFLAGS:append:aarch64 =3D &quot; -fPIE&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;${libdir}/webkit2gtk-4.*/injected-bundle/libwe=
bkit2gtkinjectedbundle.so&quot;<br>
&gt; +<br>
&gt; +RRECOMMENDS:${PN} +=3D &quot;ca-certificates shared-mime-info&quot;<b=
r>
&gt; +<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20370/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/20370/</a><br>
&gt; +ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
&gt; +<br>
&gt; +# <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D9474</a><br>
&gt; +# <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D159880" rel=3D=
"noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D15=
9880</a><br>
&gt; +# JSC JIT can build on ARMv7 with -marm, but doesn&#39;t work on runt=
ime.<br>
&gt; +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mt=
humb).<br>
&gt; +ARM_INSTRUCTION_SET:armv7a =3D &quot;thumb&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv7r =3D &quot;thumb&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv7ve =3D &quot;thumb&quot;<br>
&gt; +<br>
&gt; +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86<br>
&gt; +COMPATIBLE_HOST:x86 =3D &quot;${@bb.utils.contains_any(&#39;TUNE_FEAT=
URES&#39;, &#39;core2 corei7&#39;, &#39;.*&#39;, &#39;null&#39;, d)}&quot;<=
br>
&gt; +<br>
&gt; +# introspection inside qemu-arm hangs forever on musl/arm builds<br>
&gt; +# therefore disable GI_DATA<br>
&gt; +GI_DATA_ENABLED:libc-musl:armv7a =3D &quot;False&quot;<br>
&gt; +GI_DATA_ENABLED:libc-musl:armv7ve =3D &quot;False&quot;<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/We=
bKitWebDriver3<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGE_PREPROCESS_FUNCS +=3D &quot;src_package_preprocess&quot;<br>
&gt; +src_package_preprocess () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Trim build paths from comments in gener=
ated sources to ensure reproducibility<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s,${WORKDIR},,g&quot; \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/JavaScriptCore/Derived=
Sources/*.h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/JavaScriptCore/Derived=
Sources/yarr/*.h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/JavaScriptCore/Private=
Headers/JavaScriptCore/*.h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/WebCore/DerivedSources=
/*.cpp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/WebKitGTK/DerivedSourc=
es/webkit/*.cpp<br>
&gt; +}<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwi=
dgets_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.1.bb</a>=
 b/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.1.bb</a><br>
&gt; index 39b6a2bc7c..91653e2852 100644<br>
&gt; --- a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.1.bb</a><br>
&gt; @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] =3D &quot;-DwxUSE_LIBLZMA=3DON,-=
DwxUSE_LIBLZMA=3DOFF,xz&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[mspack] =3D &quot;-DwxUSE_LIBMSPACK=3DON,-Dw=
xUSE_LIBMSPACK=3DOFF,libmspack&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[opengl] =3D &quot;-DwxUSE_OPENGL=3DON,-DwxUS=
E_OPENGL=3DOFF,libglu&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[sdl_audio] =3D &quot;-DwxUSE_LIBSDL=3DON,-Dw=
xUSE_LIBSDL=3DOFF,libsdl2&quot;<br>
&gt; -PACKAGECONFIG[webkit] =3D &quot;-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_W=
EBVIEW_WEBKIT=3DOFF,webkitgtk,,,no_gui&quot;<br>
&gt; +PACKAGECONFIG[webkit] =3D &quot;-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_W=
EBVIEW_WEBKIT=3DOFF,webkitgtk3,,,no_gui&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D &quot;-DwxUSE_WEBREQUEST_CURL=3DON=
,-DwxUSE_WEBREQUEST_CURL=3DOFF,curl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Support LFS unconditionally<br>
&gt; diff --git a/meta-oe/recipes-graphics/surf/<a href=3D"http://surf_2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">surf_2.1.bb</a> b/meta-oe/recipes-=
graphics/surf/<a href=3D"http://surf_2.1.bb" rel=3D"noreferrer" target=3D"_=
blank">surf_2.1.bb</a><br>
&gt; index 7140a72845..4d9d4d3dd0 100644<br>
&gt; --- a/meta-oe/recipes-graphics/surf/<a href=3D"http://surf_2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">surf_2.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/surf/<a href=3D"http://surf_2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">surf_2.1.bb</a><br>
&gt; @@ -5,7 +5,7 @@ SECTION =3D &quot;x11/graphics&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2a6f86d002=
ae9ae1eb1ccc466289f146&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -DEPENDS =3D &quot;webkitgtk gtk+3 glib-2.0 gcr3&quot;<br>
&gt; +DEPENDS =3D &quot;webkitgtk3 gtk+3 glib-2.0 gcr3&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104053): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104053" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104053</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100388556/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100388556/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004ff1940601777a9c--

