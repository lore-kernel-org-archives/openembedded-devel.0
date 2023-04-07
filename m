Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0460C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 15:43:15 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.11890.1680882186883810527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 08:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6HM/kdB;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17786581fe1so46002177fac.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680882186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJJkshZMm8kfe2h1c3qK2JSTLA9vQq7YQQF4XMwoqsc=;
        b=G6HM/kdBFefmEc0lVNxMurJHHHRS7JiGvTXS9c8mTb7Qk7a2IdD+qBPOoLfkB4oocM
         eovkTYEyEN0krFYTwm6flrdUb3JWuQ2ZZBzuh2sgoZJyLxErLixU7xp/ByCK/OQfsqDp
         yAVklSlq63TIufFsGQ/sxeFnqUORC+qT+3UGm/KvRyJ/qa6YqXOsk9FSVEji9ZYUCP1a
         L6v0dntqY+VAxe4P8zlOG0LpadaPI+ua3ohOg4YiWDyp7sg62ExnCdPEnDWnWHgfTar5
         FdL7WLhBM81AYcQWFrWbKJU18yD5jO1A90Nqw3itGfNL0xryVPgTQ38m0CaXUqQMJBCz
         yCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJJkshZMm8kfe2h1c3qK2JSTLA9vQq7YQQF4XMwoqsc=;
        b=2zymxcGZ8C/fz93fl8YVQ6O70XXPlQkx+92NBRXWJV9/6p6II5PFmist1jghfddLmZ
         MEPOzTC+pVCqFfX/V6b+yovnojH7AQU8retAN6JuNGly1JcYc59Hb3yO6qHMyEHYoraU
         Ug470QfMcrRItEfQd1UySGt57oK9RywWQ0QAoP6+EzVokxrJn2Xywlbey/IVUq7M+s/a
         0Rd+xtLrZNqAvY3AgDU5bR3Rd6DKH29DX20XaPWif5H/aBx7HbqospldXp/MoKGOL4dO
         ADUGJPngGe4YpZCpPFyklA4KvdGcAr/DM4RTVzJA8xdzVF4rdJuvB2SSx9gF1zcr+Fjq
         4vhg==
X-Gm-Message-State: AAQBX9e/BtEU6gTBEdPNU8/yIMn3gmD4EvcZZqGsLJkKxjXSXBYYbOjf
	mHlnLCvMzbPmXchjYM3Uxyd7rIFc3Mot7ZtBZdBOCTT5
X-Google-Smtp-Source: AKy350a+/BbSVYOynX6KpKv/uapd1LHiMTnItkSdakB8lzLGjQNWhEiXnIkk2MLTwS4jSfldod+x9L0bJV9FV9VfnWo=
X-Received: by 2002:a05:6870:41ca:b0:17e:915c:84a2 with SMTP id
 z10-20020a05687041ca00b0017e915c84a2mr1355643oac.4.1680882186057; Fri, 07 Apr
 2023 08:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230407091722.5576-1-kai.kang@windriver.com>
In-Reply-To: <20230407091722.5576-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2023 08:42:40 -0700
Message-ID: <CAMKF1sri3Mh0=ZU_Jzjb7YLr=+D+_Af3wCAcFjcm24iMOtmoBw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 1/4] xfce4-notifyd: 0.6.3 -> 0.8.2
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101988

On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.com=
> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update xfce4-notifyd from 0.6.3 to 0.8.2
>
> * update HOMEPAGE that goodies.xfce.org has been decommissioned
> * the content of license file has been updated but license not changed
> * patch for configure.ac to get the absolute path of pkg-config variables
> * drop dependencies dbus and dbus-glib that xfce4-notifyd has been
>   ported to gdbus
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../xfce4-notifyd-get-var-abs-path.patch      | 41 +++++++++++++++++++
>  ...otifyd_0.6.3.bb =3D> xfce4-notifyd_0.8.2.bb} | 12 +++---
>  2 files changed, 48 insertions(+), 5 deletions(-)
>  create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-noti=
fyd-get-var-abs-path.patch
>  rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.3.bb =3D>=
 xfce4-notifyd_0.8.2.bb} (66%)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get=
-var-abs-path.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-noti=
fyd-get-var-abs-path.patch
> new file mode 100644
> index 000000000..719267fd1
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-ab=
s-path.patch
> @@ -0,0 +1,41 @@
> +Native pkg_config only return basename of the variable queried. Invoke `=
which`
> +to get the absolute path.
> +
> +Upstream-Status: Inappropriate [oe specific]

I think this patch could be submitted upstream unless its regressing
something in normal build.
it is enhancing the search for a tool

> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + configure.ac | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0f49e2b..a589147 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -116,7 +116,7 @@ AC_MSG_CHECKING([for gdbus-codegen])
> + if test x"$GDBUS_CODEGEN" =3D x""; then
> +     GDBUS_CODEGEN=3D`$PKG_CONFIG --variable=3Dgdbus_codegen gio-2.0`
> + fi
> +-if test -x "$GDBUS_CODEGEN"; then
> ++if test -x "$(which $GDBUS_CODEGEN)"; then
> +     AC_MSG_RESULT([$GDBUS_CODEGEN])
> + else
> +     AC_MSG_ERROR([could not find gdbus-codegen in \$PATH. You can run
> +@@ -129,7 +129,7 @@ AC_MSG_CHECKING([for glib-compile-resources])
> + if test x"$GLIB_COMPILE_RESOURCES" =3D x""; then
> +     GLIB_COMPILE_RESOURCES=3D`$PKG_CONFIG --variable=3Dglib_compile_res=
ources gio-2.0`
> + fi
> +-if test -x "$GLIB_COMPILE_RESOURCES"; then
> ++if test -x "$(which $GLIB_COMPILE_RESOURCES)"; then
> +     AC_MSG_RESULT([$GLIB_COMPILE_RESOURCES])
> + else
> +     AC_MSG_ERROR([could not find glib-compile-resources in \$PATH. You =
can run
> +@@ -142,7 +142,7 @@ AC_MSG_CHECKING([for glib-genmarshal])
> + if test x"$GLIB_GENMARSHAL" =3D x""; then
> +     GLIB_GENMARSHAL=3D`$PKG_CONFIG --variable=3Dglib_genmarshal glib-2.=
0`
> + fi
> +-if test -x "$GLIB_GENMARSHAL"; then
> ++if test -x "$(which $GLIB_GENMARSHAL)"; then
> +     AC_MSG_RESULT([$GLIB_GENMARSHAL])
> + else
> +     AC_MSG_ERROR([could not find glib-genmarshal in \$PATH. You can run
> diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb =
b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
> similarity index 66%
> rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
> rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
> index 608660811..7dbd90c18 100644
> --- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
> +++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
> @@ -1,10 +1,10 @@
>  SUMMARY =3D "Easily themable notification daemon with transparency effec=
ts"
> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-notify=
d"
> +HOMEPAGE =3D "https://docs.xfce.org/apps/notifyd/start"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
>  DEPENDS =3D " \
> -    dbus \
> -    dbus-glib \
> +    glib-2.0-native \
>      libnotify \
>      libxfce4util \
>      libxfce4ui \
> @@ -14,7 +14,9 @@ DEPENDS =3D " \
>
>  inherit xfce-app
>
> -SRC_URI[sha256sum] =3D "56a9f895aed460042f2abe09bb1a899e29b7c7d5a76ecac6=
3dead3ced990859f"
> +SRC_URI:append =3D " file://xfce4-notifyd-get-var-abs-path.patch"
> +
> +SRC_URI[sha256sum] =3D "e3a28adb08daa1411135142a0d421e4d6050c4035a4e513a=
673a59460ff2ae84"
>
>  # Avoid trouble with other desktops e.g KDE which also ships dbus servic=
e named
>  # org.freedesktop.Notifications
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101979): https://lists.openembedded.org/g/openembedde=
d-devel/message/101979
> Mute This Topic: https://lists.openembedded.org/mt/98121602/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

