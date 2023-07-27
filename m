Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F5FC001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 12:53:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.6601.1690462392643214603
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 05:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ll8snOgP;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so4610198a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690462390; x=1691067190;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gppjxbs5N5yV477DpuCClezZlMiUgsiRCzXmdqxyiwM=;
        b=ll8snOgPCXxS+sXRYcXy6x3p+4RwKr+4Sv5WlUXQagRqMy/5RH3rGvKAHiLuT9bZhQ
         /YTLQJ1BPXqwO1rx8vndItzHmO615tUmZ7KNBUmphxtDfZawvpFOHNhukmy36/doosRO
         b7oypWAadgXjQ38UrXFP9+iTseHA1Rbd9AAyBFpYroBfnPSYRKMfFkaMDqREtSJ6UWZY
         J/gspjIQQRuzf/IUuZg0phyeu0gNK2nNISVUE+uLI9VOjWxqi8aV0iyJEgKyFLdIY2xu
         NFUfOPp2HcTUWij7iuDQX77WN2eyXKXJbJE+ov38vG2deBMoCORj19TBFL4lR74ZR0Ds
         i2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690462390; x=1691067190;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gppjxbs5N5yV477DpuCClezZlMiUgsiRCzXmdqxyiwM=;
        b=bXpf7wzw+fnks7p9N96nqiLUuiwQl5fbX26WBErM88L3OxqK6a/Mc8+yuUdUHMMwvn
         sjbKUba8aFSFT6bXcydUsUUwdpiOAmu/wSSTmPINKYHXhjAI5BDrsBQltzjkiyu8/zJN
         km0gmVi55rVyF9n+dHnBQWVA0+f+udlj3aCqF4/E4C73fUJP5DVBMtYfpW8g2rTwZvwS
         yKClSF6BbjfbKJ+8HONviVnkp6VvlYVVruC6AhRinMZAT71szGpauwoDs8NXmanFYaCh
         GWbSFzWQQQpd+kV5K4cA8furtJwZ9AScYv06xU6zykdBwILSzJARJ0X2XZOvSQWrzOrk
         iBjA==
X-Gm-Message-State: ABy/qLZGorr9fUQnrbQRGEgEmKihv6ie/+LiONuTWTjB3/BVKIBJTiFx
	QQ9HwBEdH0bUgmhWwToI56g=
X-Google-Smtp-Source: APBJJlG+0eeNJEhi9imvJ3LyWOcZCjlURd0puu82P8hjUbySyItI1cFuWC4167qTw7l+Gn3DpB74Gw==
X-Received: by 2002:a17:906:cc45:b0:994:5457:269e with SMTP id mm5-20020a170906cc4500b009945457269emr2494284ejb.0.1690462390153;
        Thu, 27 Jul 2023 05:53:10 -0700 (PDT)
Received: from [192.168.2.51] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id jp21-20020a170906f75500b00988c0c175c6sm719782ejb.189.2023.07.27.05.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 05:53:09 -0700 (PDT)
Message-ID: <6ab3e55b-80b6-abc3-015b-7cd3ad5ab6b3@gmail.com>
Date: Thu, 27 Jul 2023 14:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [RFC][meta-gnome][PATCHv3] webkitgtk3: add recipe
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20230727113837.4774-1-f_l_k@t-online.de>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230727113837.4774-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 12:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104053

2023. 07. 27. 13:38 keltezéssel, Markus Volk írta:
> - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk

Can you also add the GTK4 variant, too? Pretty please.

> - Import gcr3 recipe from oe-core
>
> Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in the
> process of updating webkitgtk to be built with gtk4. It will be necessary
> to add a recipe that provides the gtk+3 variant, or we wont be able
> to use e.g. geary with gmail addresses or provide google integration for
> gnome-calendar or nautilus/files.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../recipes-connectivity/geary/geary_43.0.bb  |   2 +-
>   .../evolution-data-server.bb                  |   2 +-
>   ...ectly-handle-disabled-ssh_agent-opti.patch |  36 ++
>   meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb   |  59 ++++
>   .../gnome-online-accounts_3.48.0.bb           |   2 +-
>   meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   2 +-
>   .../recipes-gnome/zenity/zenity_3.44.0.bb     |   2 +-
>   ...spection.cmake-prefix-variables-obta.patch |  29 ++
>   ...tCore-CMakeLists.txt-ensure-reproduc.patch |  28 ++
>   ...44e17d258106617b0e6d783d073b188a2548.patch | 310 ++++++++++++++++++
>   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |  41 +++
>   .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |  33 ++
>   .../webkitgtk3/reproducibility.patch          |  22 ++
>   .../webkitgtk/webkitgtk3_2.40.2.bb            | 169 ++++++++++
>   .../wxwidgets/wxwidgets_3.2.1.bb              |   2 +-
>   meta-oe/recipes-graphics/surf/surf_2.1.bb     |   2 +-
>   16 files changed, 734 insertions(+), 7 deletions(-)
>   create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>   create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
>   create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
>
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> index 6085d94fdc..bab4f909e0 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> @@ -26,7 +26,7 @@ DEPENDS = " \
>       libstemmer \
>       libxml2 \
>       sqlite3 \
> -    webkitgtk \
> +    webkitgtk3 \
>   "
>   
>   RDEPENDS:${PN} = "gnome-keyring"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index 43717a84cd..edbe30ff87 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target = " -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scan
>   PACKAGECONFIG ?= "oauth"
>   
>   PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
> -PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
> +PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK=ON -DENABLE_OAUTH2_WEBKITGTK4=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk3 json-glib"
>   PACKAGECONFIG[goa]    = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
>   PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
>   # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs when
> diff --git a/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> new file mode 100644
> index 0000000000..d3c26d97ae
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> @@ -0,0 +1,36 @@
> +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 16 Nov 2022 11:27:24 +0100
> +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
> +
> +Existing code produces these errors:
> +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
> +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> +---
> + meson.build | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3f35173..11d7fa7 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++if get_option('ssh_agent')
> ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++endif
> + conf.set10('WITH_SYSTEMD', with_systemd)
> + config_file = configure_file(
> +   output: 'config.h',
> +--
> +2.34.1
> +
> diff --git a/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> new file mode 100644
> index 0000000000..ba5660a5ed
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -0,0 +1,59 @@
> +SUMMARY = "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
> +accessing key stores. It also provides the viewer for crypto files on the \
> +GNOME desktop."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
> +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> +UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
> +
> +SRC_URI = "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive"
> +SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
> +SRC_URI[archive.sha256sum] = "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
> +
> +S = "${WORKDIR}/gcr-${PV}"
> +
> +PACKAGECONFIG ??= " \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> +"
> +PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
> +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-3 \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> +"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20229/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gpg2 = '${bindir}/gpg2'
> +ssh-add = '${bindir}/ssh-add'
> +ssh-agent = '${bindir}/ssh-agent'
> +EOF
> +}
> diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> index ca78fa0119..cd14b48508 100644
> --- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] = "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a
>   PACKAGECONFIG ?= "goabackend kerberos owncloud lastfm google windows_live"
>   
>   # goabackend requires webkitgtk to be built with gtk+3 and gcr3
> -PACKAGECONFIG[goabackend] = "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk"
> +PACKAGECONFIG[goabackend] = "-Dgoabackend=true,-Dgoabackend=false,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3"
>   PACKAGECONFIG[kerberos] = "-Dkerberos=true, -Dkerberos=false,krb5 gcr3"
>   PACKAGECONFIG[exchange] = "-Dexchange=true, -Dexchange=false"
>   PACKAGECONFIG[google] = "-Dgoogle=true, -Dgoogle=false"
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> index 200ed0f709..51d51ee0ab 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -19,7 +19,7 @@ DEPENDS += " \
>       libxslt \
>       sqlite3 \
>       libhandy \
> -    webkitgtk \
> +    webkitgtk3 \
>       yelp-xsl \
>   "
>   PACKAGECONFIG_SOUP ?= "soup3"
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> index 8ea24ca49b..3548cc5bbe 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] = "c15582301ed90b9d42ce521dbccf99a989f22f12041bdd5279
>   SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
>   
>   PACKAGECONFIG ?= "webkitgtk"
> -PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
> +PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
>   
>   PACKAGES =+ "${PN}-gdialog"
>   FILES:${PN}-gdialog = "${bindir}/gdialog"
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> new file mode 100644
> index 0000000000..8ae39f14e1
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> @@ -0,0 +1,29 @@
> +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 27 Oct 2015 16:02:19 +0200
> +Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
> + from pkg-config with PKG_CONFIG_SYSROOT_DIR
> +
> +See discussion at https://bugs.webkit.org/show_bug.cgi?id=232933 for
> +reasons why this is not approproiate for upstream submission.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Source/cmake/FindGI.cmake | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
> +index af039cbb..b3e810cd 100644
> +--- a/Source/cmake/FindGI.cmake
> ++++ b/Source/cmake/FindGI.cmake
> +@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
> +     endif ()
> + endif ()
> +
> ++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
> ++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}")
> ++
> + find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
> + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler)
> +
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> new file mode 100644
> index 0000000000..bbe265059d
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> @@ -0,0 +1,28 @@
> +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Mon, 26 Jun 2023 14:30:02 +0200
> +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducibility
> + of __TIMESTAMP__
> +
> +__TIMESTAMP__ refers to mtime of the file that contains it, which is unstable
> +and breaks binary reproducibility when the file is generated at build time. To ensure
> +this does not happen, mtime should be set from the original file.
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/15293]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/JavaScriptCore/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
> +index 43dc22ff..c2e3b1cd 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -159,6 +159,7 @@ add_custom_command(
> +     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> +     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in
> +     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> ++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> +             VERBATIM
> + )
> +
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> new file mode 100644
> index 0000000000..34e0ff9af3
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> @@ -0,0 +1,310 @@
> +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Thu, 2 Jun 2022 11:19:06 +0300
> +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
> + unused https://bugs.webkit.org/show_bug.cgi?id=241182
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Move the NEON fast path for the SVG lighting filter effects into
> +FELightingSoftwareApplier, and arrange to actually use them by
> +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> +
> +Some changes were needed to adapt platformApplyNeon() to the current
> +state of filters after r286140. This was not detected because the code
> +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> +not get used much these days: CPU(ARM_THUMB2) is more common. It should
> +be possible to use the NEON fast paths also in Thumb mode, but that is
> +left for a follow-up fix.
> +
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> +(WebCore::FELighting::getPowerCoefficients): Deleted.
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> +(WebCore::FELighting::platformApplyNeon): Deleted.
> +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> +* Source/WebCore/platform/graphics/filters/FELighting.h:
> +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
> + .../graphics/filters/DistantLightSource.h     |  4 ++
> + .../platform/graphics/filters/FELighting.h    |  7 ---
> + .../graphics/filters/PointLightSource.h       |  4 ++
> + .../graphics/filters/SpotLightSource.h        |  4 ++
> + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> + 7 files changed, 56 insertions(+), 35 deletions(-)
> +
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +index f6ff8c20..42a97ffc 100644
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> +     return s_FELightingConstantsForNeon;
> + }
> +
> +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> + {
> +     neonDrawLighting(parameters);
> + }
> +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> +     "b .lightStrengthCalculated" NL
> + ); // NOLINT
> +
> +-int FELighting::getPowerCoefficients(float exponent)
> ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> + {
> +     // Calling a powf function from the assembly code would require to save
> +     // and reload a lot of NEON registers. Since the base is in range [0..1]
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +index b17c603d..e4629cda 100644
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +@@ -24,14 +24,15 @@
> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +  */
> +
> +-#ifndef FELightingNEON_h
> +-#define FELightingNEON_h
> ++#pragma once
> +
> + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +
> +-#include "FELighting.h"
> ++#include "FELightingSoftwareApplier.h"
> ++#include "ImageBuffer.h"
> + #include "PointLightSource.h"
> + #include "SpotLightSource.h"
> ++#include <wtf/ObjectIdentifier.h>
> + #include <wtf/ParallelJobs.h>
> +
> + namespace WebCore {
> +@@ -93,14 +94,14 @@ extern "C" {
> + void neonDrawLighting(FELightingPaintingDataForNeon*);
> + }
> +
> +-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
> ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
> + {
> +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> +-    FELightingPaintingDataForNeon neonData = {
> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> ++    WebCore::FELightingPaintingDataForNeon neonData = {
> +         data.pixels->data(),
> +         1,
> +-        data.widthDecreasedByOne - 1,
> +-        data.heightDecreasedByOne - 1,
> ++        data.width - 2,
> ++        data.height - 2,
> +         0,
> +         0,
> +         0,
> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> +     // Set light source arguments.
> +     floatArguments.constOne = 1;
> +
> +-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> ++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> +
> +     floatArguments.colorRed = color.red;
> +     floatArguments.colorGreen = color.green;
> +     floatArguments.colorBlue = color.blue;
> +     floatArguments.padding4 = 0;
> +
> +-    if (m_lightSource->type() == LS_POINT) {
> ++    if (data.lightSource->type() == LS_POINT) {
> +         neonData.flags |= FLAG_POINT_LIGHT;
> +-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
> ++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
> +         floatArguments.lightX = pointLightSource.position().x();
> +         floatArguments.lightY = pointLightSource.position().y();
> +         floatArguments.lightZ = pointLightSource.position().z();
> +         floatArguments.padding2 = 0;
> +-    } else if (m_lightSource->type() == LS_SPOT) {
> ++    } else if (data.lightSource->type() == LS_SPOT) {
> +         neonData.flags |= FLAG_SPOT_LIGHT;
> +-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
> ++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
> +         floatArguments.lightX = spotLightSource.position().x();
> +         floatArguments.lightY = spotLightSource.position().y();
> +         floatArguments.lightZ = spotLightSource.position().z();
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> +         if (spotLightSource.specularExponent() == 1)
> +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> +     } else {
> +-        ASSERT(m_lightSource->type() == LS_DISTANT);
> ++        ASSERT(data.lightSource->type() == LS_DISTANT);
> +         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> +         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> +         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> +     // Set lighting arguments.
> +     floatArguments.surfaceScale = data.surfaceScale;
> +     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
> +-    if (m_lightingType == FELighting::DiffuseLighting)
> +-        floatArguments.diffuseConstant = m_diffuseConstant;
> ++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> ++        floatArguments.diffuseConstant = data.diffuseConstant;
> +     else {
> +         neonData.flags |= FLAG_SPECULAR_LIGHT;
> +-        floatArguments.diffuseConstant = m_specularConstant;
> +-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
> +-        if (m_specularExponent == 1)
> ++        floatArguments.diffuseConstant = data.specularConstant;
> ++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
> ++        if (data.specularExponent == 1)
> +             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> +     }
> +     if (floatArguments.diffuseConstant == 1)
> +         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> +
> +-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> ++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
> ++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
> +     if (optimalThreadNumber > 1) {
> +         // Initialize parallel jobs
> +-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> ++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> +
> +         // Fill the parameter array
> +         int job = parallelJobs.numberOfJobs();
> +         if (job > 1) {
> +             int yStart = 1;
> +-            int yStep = (data.heightDecreasedByOne - 1) / job;
> ++            int yStep = (data.height - 2) / job;
> +             for (--job; job >= 0; --job) {
> +                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
> +                 params = neonData;
> +                 params.yStart = yStart;
> +-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
> ++                params.pixels += (yStart - 1) * data.width * 4;
> +                 if (job > 0) {
> +                     params.absoluteHeight = yStep;
> +                     yStart += yStep;
> +                 } else
> +-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
> ++                    params.absoluteHeight = (data.height - 1) - yStart;
> +             }
> +             parallelJobs.execute();
> +             return;
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> + } // namespace WebCore
> +
> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> +-
> +-#endif // FELightingNEON_h
> +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +index 70c6512f..b032c82e 100644
> +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +@@ -26,6 +26,10 @@
> + #include <wtf/ArgumentCoder.h>
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class DistantLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
> +index 53beb596..e78a9354 100644
> +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> +@@ -35,8 +35,6 @@
> +
> + namespace WebCore {
> +
> +-struct FELightingPaintingDataForNeon;
> +-
> + class FELighting : public FilterEffect {
> + public:
> +     const Color& lightingColor() const { return m_lightingColor; }
> +@@ -64,11 +62,6 @@ protected:
> +
> +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
> +
> +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +-    static int getPowerCoefficients(float exponent);
> +-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
> +-#endif
> +-
> +     Color m_lightingColor;
> +     float m_surfaceScale;
> +     float m_diffuseConstant;
> +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +index 3a5723f0..675d63f5 100644
> +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class PointLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +index 684626f7..dea58389 100644
> +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class SpotLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +index c974d921..e2896660 100644
> +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +@@ -36,6 +36,7 @@
> + namespace WebCore {
> +
> + class FELighting;
> ++struct FELightingPaintingDataForNeon;
> +
> + class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
> +     WTF_MAKE_FAST_ALLOCATED;
> +@@ -132,8 +133,23 @@ private:
> +
> +     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
> +     static void applyPlatformGenericWorker(ApplyParameters*);
> ++
> ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> ++    static int getPowerCoefficients(float exponent);
> ++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> ++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
> ++
> ++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
> ++    {
> ++        applyPlatformNeon(data, paintingData);
> ++    }
> ++#else
> +     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
> ++#endif
> ++
> +     static void applyPlatform(const LightingData&);
> + };
> +
> + } // namespace WebCore
> ++
> ++#include "FELightingNEON.h"
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
> new file mode 100644
> index 0000000000..79da855ff4
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
> @@ -0,0 +1,41 @@
> +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
> +From: Diego Pino Garcia <dpino@igalia.com>
> +Date: Mon, 22 May 2023 19:58:50 -0700
> +Subject: [PATCH] [GLIB] Fix build error after 264196@main
> + https://bugs.webkit.org/show_bug.cgi?id=256917
> +
> +Reviewed by Michael Catanzaro.
> +
> +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> +enabled.
> +
> +* Source/WTF/wtf/glib/Sandbox.cpp:
> +(WTF::isInsideUnsupportedContainer):
> +
> +Canonical link: https://commits.webkit.org/264395@main
> +Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandbox.cpp
> +index 7d84e830ab33e..9b07bb8cb5a9b 100644
> +--- a/Source/WTF/wtf/glib/Sandbox.cpp
> ++++ b/Source/WTF/wtf/glib/Sandbox.cpp
> +@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> +     return returnValue;
> + }
> +
> ++#if ENABLE(BUBBLEWRAP_SANDBOX)
> + bool isInsideUnsupportedContainer()
> + {
> +     static bool inContainer = g_file_test("/run/.containerenv", G_FILE_TEST_EXISTS);
> +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> +
> +     return inContainer && !supportedContainer;
> + }
> ++#endif
> +
> + bool isInsideSnap()
> + {
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
> new file mode 100644
> index 0000000000..ae99810ced
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch
> @@ -0,0 +1,33 @@
> +Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_display_x11_new_with_display
> +
> +This ensures that there is a compile time check for glx support in gstreamer as
> +runtime check is not enough because gst_gl_display_x11_new_with_display() API comes from
> +gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE_PLATFORM_GLX is defined
> +therefore make this check consistent to fix build with some platforms which use pvr gl drivers
> +where this problem appear at compile time.
> +
> +
> +/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: error: use of undeclared identifier 'gst_gl_display_x11_new_with_display'; did you mean 'gst_gl_display_egl_new_with_egl_display'?
> +   68 |         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
> +      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +      |                               gst_gl_display_egl_new_with_egl_display
> +
> +This issue is 2.40 specific since GLX support is removed [1] from trunk upstream, therefore
> +this patch wont be needed when upgrading to 2.42+
> +
> +[1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf
> +
> +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 01:22:18.917743700 -0800
> ++++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 08:45:09.739177065 -0700
> +@@ -63,7 +63,7 @@
> +     if (glPlatform == GST_GL_PLATFORM_EGL)
> +         return GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay()));
> + #endif
> +-#if USE(GLX)
> ++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
> +     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform == GST_GL_PLATFORM_GLX)
> +         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
> + #endif
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> new file mode 100644
> index 0000000000..e866a1a193
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> @@ -0,0 +1,22 @@
> +Injection a year based on the current date isn't reproducible. Hack this
> +to a specific year for now for reproducibilty and to avoid autobuilder failures.
> +
> +The correct fix would be to use SOURCE_DATE_EPOCH from the environment and
> +then this could be submitted upstream, sadly my ruby isn't up to that.
> +
> +Upstream-Status: Pending [could be reworked]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +===================================================================
> +--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
> ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +@@ -25,7 +25,7 @@ require 'date'
> + require 'digest'
> +
> + $LICENSE = <<-EOF
> +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
> ++Copyright (C) 2021 Apple Inc. All rights reserved.
> +
> + Redistribution and use in source and binary forms, with or without
> + modification, are permitted provided that the following conditions
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> new file mode 100644
> index 0000000000..9bd0c4e198
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> @@ -0,0 +1,169 @@
> +SUMMARY = "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE = "https://www.webkitgtk.org/"
> +BUGTRACKER = "https://bugs.webkit.org/"
> +
> +LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
> +                    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
> +                    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
> +                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
> +                    "
> +
> +SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> +           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
> +           file://reproducibility.patch \
> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> +           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
> +           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch \
> +           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
> +           "
> +SRC_URI[sha256sum] = "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
> +
> +inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
> +
> +S = "${WORKDIR}/webkitgtk-${PV}"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
> +
> +CVE_PRODUCT = "webkitgtk webkitgtk\+"
> +
> +DEPENDS += " \
> +          ruby-native \
> +          gperf-native \
> +          unifdef-native \
> +          cairo \
> +          harfbuzz \
> +          jpeg \
> +          atk \
> +          libwebp \
> +          gtk+3 \
> +          libxslt \
> +          libtasn1 \
> +          libnotify \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          glib-2.0-native \
> +          gettext-native \
> +          "
> +
> +PACKAGECONFIG_SOUP ?= "soup3"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
> +                   enchant \
> +                   libsecret \
> +                   ${PACKAGECONFIG_SOUP} \
> +                  "
> +
> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
> +PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
> +PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> +PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
> +PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
> +PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
> +PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
> +PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
> +PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
> +PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
> +PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
> +PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
> +PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> +PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
> +PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> +PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
> +PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
> +PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
> +PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
> +
> +EXTRA_OECMAKE = " \
> +		-DPORT=GTK \
> +		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> +		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> +		-DENABLE_MINIBROWSER=ON \
> +		"
> +
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS:append:arc = " -mlong-calls"
> +CXXFLAGS:append:arc = " -mlong-calls"
> +
> +# Needed for non-mesa graphics stacks when x11 is disabled
> +CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
> +
> +# ARM JIT code does not build on ARMv4/5/6 anymore
> +EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
> +
> +EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
> +EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
> +
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
> +
> +# JIT not supported on X32
> +# An attempt was made to upstream JIT support for x32 in
> +# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
> +# unresolved due to limited X32 adoption.
> +EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
> +
> +SECURITY_CFLAGS:remove:aarch64 = "-fpie"
> +SECURITY_CFLAGS:append:aarch64 = " -fPIE"
> +
> +FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +
> +RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20370/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET:armv7a = "thumb"
> +ARM_INSTRUCTION_SET:armv7r = "thumb"
> +ARM_INSTRUCTION_SET:armv7ve = "thumb"
> +
> +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> +COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
> +
> +# introspection inside qemu-arm hangs forever on musl/arm builds
> +# therefore disable GI_DATA
> +GI_DATA_ENABLED:libc-musl:armv7a = "False"
> +GI_DATA_ENABLED:libc-musl:armv7ve = "False"
> +
> +do_install:append() {
> +	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to ensure reproducibility
> +        sed -i -e "s,${WORKDIR},,g" \
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebCore/DerivedSources/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
> +}
> +
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> index 39b6a2bc7c..91653e2852 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
>   PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
>   PACKAGECONFIG[opengl] = "-DwxUSE_OPENGL=ON,-DwxUSE_OPENGL=OFF,libglu"
>   PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
> -PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
> +PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk3,,,no_gui"
>   PACKAGECONFIG[curl] = "-DwxUSE_WEBREQUEST_CURL=ON,-DwxUSE_WEBREQUEST_CURL=OFF,curl"
>   
>   # Support LFS unconditionally
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> index 7140a72845..4d9d4d3dd0 100644
> --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> @@ -5,7 +5,7 @@ SECTION = "x11/graphics"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146"
>   
> -DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr3"
> +DEPENDS = "webkitgtk3 gtk+3 glib-2.0 gcr3"
>   
>   REQUIRED_DISTRO_FEATURES = "x11 opengl"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104052): https://lists.openembedded.org/g/openembedded-devel/message/104052
> Mute This Topic: https://lists.openembedded.org/mt/100388556/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


