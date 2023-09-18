Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22234CD13D9
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 22:24:29 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.4914.1695075867370070732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 15:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmcHSm4r;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1c26bb27feeso3312603fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 15:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695075866; x=1695680666; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPc0CkXWSfvNAbJ/osBCQa2S0iC0bbLsPZTC31KARsg=;
        b=hmcHSm4rze7IXq1L1lKzZ8y4Mznc06SFpQHkLW7fIWYXdz1EQqZeLcQjVD60C9RXpY
         poCLnby6Any+gc83jkjx7rxusylYwZuhLhhO74P8S0RaESy5hxeLbA7A2mG0V8WcmRFN
         yWwwOEaJgqOyzq9qyGD4LFCvwhREEr9IWjzYIBc1XnAlhYG5r6yRif7GBoGpch0Duq1J
         5WOuUnFh5Z8ZYXMjppVXC7cKFN9cUbGCqTTBJkmYVQ9n4aGfanUVop1W72W1/MUwI4t2
         i3G2l2eDZpE7hpFQL1roArD+wG+k28QP+VskM4a6IdhlTIyco9uXU8aijuXOaBCqJvNx
         CsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695075866; x=1695680666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPc0CkXWSfvNAbJ/osBCQa2S0iC0bbLsPZTC31KARsg=;
        b=Leu+Ok5kC92RWBTdw+0FxAm2ovxvJnul31YR+3g6Odday8Q5l0nly/G/NrKymPWBil
         4FVqs4jTrTUaXTdUK2jodkUgw2uYS2LOe3fUu8J3WCRwKF8cj7yotyro5VloRBqnDqGo
         m1rFdm5vM+FbubgWDH/Wi6Cio94T5a2MzJaAx2G2YfWFBddqA6RB6oMKpKU+u+sYoCwh
         h+VzXvIW8YUmpaOSMLYzJiZMQx1NLhIqP6Tk74goMXSbSRiJ3Yeuh4BEL1ixF6jAkokJ
         PsdTih7pbKcqwq9Q+HH18xK0u0a9Sioq/hdcQnXme59gNJ4gR67Wn34VJ/yHfXCh3mLr
         N3Qg==
X-Gm-Message-State: AOJu0YyM5fEJ8R8zlbGUrLjKprIIl0rfWnZGoVqUB8D472NTyBQslVx/
	yLDVT2hn4Spis3iXi8LkJmCzpcE0oxXZ2PG+RKk=
X-Google-Smtp-Source: AGHT+IF6DM4gN2xdxAjzEvDM+zKoxnU8TwZ27mkcM2iDh3xj5Al8RCA9ffrP/yjavWs34LmYJKFJwwRGEqDkF7xgXUI=
X-Received: by 2002:a05:6870:468e:b0:1bf:e2a6:b287 with SMTP id
 a14-20020a056870468e00b001bfe2a6b287mr11867658oap.0.1695075866502; Mon, 18
 Sep 2023 15:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230918215156.1920452-1-f_l_k@t-online.de> <20230918215156.1920452-17-f_l_k@t-online.de>
In-Reply-To: <20230918215156.1920452-17-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2023 15:24:00 -0700
Message-ID: <CAMKF1sqLhLdjVfXgBx2RU4X4f8eYwT2S8Wq9GN9y0cBC9sLmfA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 17/18] libxmlb: remove recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 22:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104945

Cool. Also need to get rid of the references in

meta-oe/conf/include/ptest-packagelists-meta-oe.inc

and

meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

On Mon, Sep 18, 2023 at 2:52=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> It was moved to oe-core
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 35 -------------------
>  .../recipes-gnome/libxmlb/libxmlb/run-ptest   |  3 --
>  .../recipes-gnome/libxmlb/libxmlb_0.3.14.bb   | 25 -------------
>  3 files changed, 63 deletions(-)
>  delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftes=
t.c-hardcode-G_TEST_SRCDIR.patch
>  delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
>  delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
>
> diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-har=
dcode-G_TEST_SRCDIR.patch b/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-s=
elftest.c-hardcode-G_TEST_SRCDIR.patch
> deleted file mode 100644
> index da8ce68df..000000000
> --- a/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G=
_TEST_SRCDIR.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Sat, 16 Sep 2023 14:02:57 +0200
> -Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
> -
> -This avoids:
> - libxmlb-0.3.14-r0 do_package_qa: QA Issue: File
> - /usr/libexec/installed-tests/libxmlb/xb-self-test in package libxmlb-pt=
est
> - contains reference to TMPDIR [buildpaths]
> -
> -and also fixes the runtime for the ptest.
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - src/xb-self-test.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/xb-self-test.c b/src/xb-self-test.c
> -index 47d9728..8b3dd0e 100644
> ---- a/src/xb-self-test.c
> -+++ b/src/xb-self-test.c
> -@@ -2870,7 +2870,7 @@ xb_speed_func(void)
> - int
> - main(int argc, char **argv)
> - {
> --      g_setenv("G_TEST_SRCDIR", SRCDIR, FALSE);
> -+      g_setenv("G_TEST_SRCDIR", "/usr/libexec/installed-tests/libxmlb",=
 FALSE);
> -
> -       g_test_init(&argc, &argv, NULL);
> -
> ---
> -2.41.0
> -
> diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb/run-ptest
> deleted file mode 100644
> index 6d0bb95d3..000000000
> --- a/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#! /bin/sh
> -
> -gnome-desktop-testing-runner libxmlb
> diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.14.bb
> deleted file mode 100644
> index 1d3b0de29..000000000
> --- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY =3D "A library to help create and query binary XML blobs"
> -HOMEPAGE =3D "https://github.com/hughsie/libxmlb"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
> -
> -SRC_URI =3D " \
> -       git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhtt=
ps \
> -       file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
> -       file://run-ptest \
> -"
> -SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS =3D "glib-2.0 xz zstd"
> -
> -inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
> -PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
> -
> -GTKDOC_MESON_OPTION =3D "gtkdoc"
> -
> -FILES:${PN} +=3D "${datadir}"
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104942): https://lists.openembedded.org/g/openembedde=
d-devel/message/104942
> Mute This Topic: https://lists.openembedded.org/mt/101444173/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

