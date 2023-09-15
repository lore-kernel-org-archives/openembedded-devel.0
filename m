Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48A9CD37AF
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 22:58:54 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.2164.1694818724716417435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 15:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CByH2E6y;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1cc87405650so1459406fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 15:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694818724; x=1695423524; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kRwNHY9JK8k8k4xQBGrw0CeTw7iJCYzqFGayObtlRo=;
        b=CByH2E6yENLOjARdpJcdKHZ8yXJunrfvk/sxpnt1zqHktKhxeDVdLJJhv9IXcFNTL+
         L8k138xMFF63sYRloSVtWektUUnxkla6ld098/Xp8r+DoadZgumAhTcWiVSzaK3u3QxK
         fPMbp2A19ed8jcd+NB1oexm3oxAaLRJp6bZAPHBZ/zfepfjBkPchJ2B0Vl4/ho0Z264B
         kqoxDqOlSwndH56YX4SatYQ1zcVJBc1t0OEQSczgdVvcE9D4jK+aGXqBJgciZsvD3k90
         DxpeloouuMQ+zhKtP5XXvOkcIufVwR58MiuZOzojf+oy17XA3L0DikH4/GTn05btbEoK
         u8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694818724; x=1695423524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kRwNHY9JK8k8k4xQBGrw0CeTw7iJCYzqFGayObtlRo=;
        b=Imv2WAIka9qyB3jfpbHvjAiG08gwlAsWy+A8WGi3ESP6HN3fthd8ktCGzSu9etEJK3
         OucNIDrmHOur5IKO+dMis3b1REA2SqgtPxls4iFUgtZLak70cgAIW8C13XEhz6c/xlO1
         aTdKRkQGi0+Yhe7GpvmAOjyYYGxQsV2DE3BmHY7i7Snv+UKjTvT43dbejTjz8JS/jWEp
         EatTstjoCTcRewWKQDUs4ZWFaJ7H9xPo/C4adxpSfdTG6MaTCfsiX8c1xX1Ov/3LcJTQ
         Xyrzi8tCZ5yChyGvBHnTFO8mQAmgDDE03sbMdPKp3yWyr3V7vV1/gpq76FnvUB129VF2
         t8qQ==
X-Gm-Message-State: AOJu0YwI9kzix/b22sqgXSm5V3l/HZbDmoZOCUDze2QMDnzqM9MxxnsA
	UUj0yDcIveoaLcXUqUqhOCey8fBm3lHwWQMyQno=
X-Google-Smtp-Source: AGHT+IGnMx2yvMYIIf+xOxtmooXU8iOSvVIrNWwyrbKBPwjI5MzRCmnn18HSfff7xKzqIgdJ8MsE6F7E3M/B/aJA9e0=
X-Received: by 2002:a05:6870:828a:b0:1d6:5b09:1584 with SMTP id
 q10-20020a056870828a00b001d65b091584mr3680163oae.5.1694818723857; Fri, 15 Sep
 2023 15:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230915120131.251678-1-f_l_k@t-online.de>
In-Reply-To: <20230915120131.251678-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Sep 2023 15:58:17 -0700
Message-ID: <CAMKF1sovTe-MVyh76RFxdQZny3u-y_gAkyPuCGkspUYDguamzQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] appstream: remove workaround for cross-compile
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 22:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104896

It fails to build

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3128/step=
s/14/logs/stdio

On Fri, Sep 15, 2023 at 5:01=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> This issue has been fixed upstream
> https://github.com/ximion/appstream/pull/510/commits/1f301baa5bf59d75d566=
a674bd76221847ca1d21
>
> - fix api documentation build
> - build vapi dependent on gobject-introspection-data
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../appstream/0001-fix-crosscompile.patch     | 43 -------------------
>  .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
>  .../appstream/appstream_0.16.3.bb             | 17 +++-----
>  3 files changed, 37 insertions(+), 54 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-=
crosscompile.patch
>  create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-remo=
ve-hardcoded-path.patch
>
> diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crossco=
mpile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscom=
pile.patch
> deleted file mode 100644
> index fe8dcff91..000000000
> --- a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.p=
atch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Mon, 12 Dec 2022 15:42:42 +0100
> -Subject: [PATCH] fix crosscompile
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> -
> -Upstream-Status: Inappropriate [oe-specific]
> ----
> - data/meson.build  | 2 +-
> - meson.build       | 2 +-
> - tools/meson.build | 9 +++++++++
> - 3 files changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/data/meson.build b/data/meson.build
> -index aea0cb25..1a085fc9 100644
> ---- a/data/meson.build
> -+++ b/data/meson.build
> -@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
> - metainfo_with_relinfo =3D custom_target('gen-output',
> -     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
> -     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainf=
o.xml'],
> --    command : [ascli_exe, 'news-to-metainfo', '--limit=3D6', '@INPUT0@'=
, '@INPUT1@', '@OUTPUT@']
> -+    command : ['appstreamcli', 'news-to-metainfo', '--limit=3D6', '@INP=
UT0@', '@INPUT1@', '@OUTPUT@']
> - )
> -
> - metainfo_i18n =3D i18n.itstool_join(
> -diff --git a/meson.build b/meson.build
> -index fd0e3373..2f273ada 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -124,7 +124,7 @@ if get_option ('gir')
> -     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> - endif
> -
> --stemmer_inc_dirs =3D include_directories(['/usr/include'])
> -+stemmer_inc_dirs =3D include_directories([''])
> - if get_option('stemming')
> -     stemmer_lib =3D cc.find_library('stemmer', required: true)
> -     if not cc.has_header('libstemmer.h')
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/appstream/appstream/0001-remove-hard=
coded-path.patch b/meta-oe/recipes-support/appstream/appstream/0001-remove-=
hardcoded-path.patch
> new file mode 100644
> index 000000000..9cbfaca82
> --- /dev/null
> +++ b/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-p=
ath.patch
> @@ -0,0 +1,31 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] remove hardcoded path
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Dont include hardcoded path. This fixes:
> +| cc1: error: include location "/usr/include" is unsafe for cross-compil=
ation [-Werror=3Dpoison-system-directories]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build       | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> + endif
> +
> +-stemmer_inc_dirs =3D include_directories(['/usr/include'])
> ++stemmer_inc_dirs =3D include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib =3D cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb b/meta=
-oe/recipes-support/appstream/appstream_0.16.3.bb
> index 222cd80be..5a6c5336c 100644
> --- a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
> +++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
> @@ -22,9 +22,12 @@ DEPENDS =3D " \
>  inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
>
>  GIR_MESON_OPTION =3D "gir"
> +GTKDOC_MESON_OPTION =3D "apidocs"
>
> -SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
> -SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"
> +SRC_URI =3D " \
> +       https://www.freedesktop.org/software/appstream/releases/AppStream=
-${PV}.tar.xz \
> +       file://0001-remove-hardcoded-path.patch \
> +"
>  SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8=
e6344a2b318b98b1"
>
>  S =3D "${WORKDIR}/AppStream-${PV}"
> @@ -36,14 +39,6 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemm=
ing=3Dfalse,libstemmer"
>
>  FILES:${PN} +=3D "${datadir}"
>
> -EXTRA_OEMESON:append =3D " -Ddocs=3Dfalse"
> -EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.c=
ross"
> -
> -do_write_config:append:class-target() {
> -    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> -[binaries]
> -appstreamcli =3D '${STAGING_BINDIR_NATIVE}/appstreamcli'
> -EOF
> -}
> +EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104894): https://lists.openembedded.org/g/openembedde=
d-devel/message/104894
> Mute This Topic: https://lists.openembedded.org/mt/101377808/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

