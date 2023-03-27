Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011AAC7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:20:07 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.26700.1679887204617160101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a+4lvhBr;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id q27so4586147oiw.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679887204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJEh1fnJh3P7WSR5jv8JfvL+TnjRFKnmFY0LOlYMyxU=;
        b=a+4lvhBr/RA3v2Ty10NSqQvY/3uJn3TKYOhaCN97lOcgxqkAdO8eAw5tvRO8FVQmeQ
         tOBIopuD5isYpVPuR+aQ743B3hrqT5ntmQoctpuoSsJ9zH66licuzr6K99gH29585ZJU
         aERKdrTnTUCqB0oaOzPPv+xwlS808MiT5XpVU+JWmz0GMoCcL1mOZlSUqd0A+j1Q5xYj
         dyH7pj85UL7KgeAZOzxATe5PIE35oE87O9HLI7vymlBWDHukbuSCWkg072VZZLN9alBv
         cdEFnjPC/lhk1eUjk6oCkCV2QC2aoRKg17BBBR6aY5engrbzhP6n4PQnJ2foT0PLvXD8
         /rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679887204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJEh1fnJh3P7WSR5jv8JfvL+TnjRFKnmFY0LOlYMyxU=;
        b=ZHJrPBDH+on5B9gMpQ6Fof9J57l+hx/GS/ZhVUmb+G0VTCXlggvx2YIUUbZPyOafIw
         XAmAwoSemu7WhdrqmhIqrioayOgeUAMOu4sUm6v8uM+qjdPpm0ZN1Dqo9z17Ry0wr47o
         3zNssTaqX07+QXZnmboe4vjb5erNBLXc8rhpyzvqpRDhXXxHd/kGq+9iDI/JcF2v0QwO
         7Y2R1DlHdXz29zEIQgsECvfJkFVKCINLt1lOMzizlobQKyMj+eciMTqCiaRtQMgB+8VY
         hpiNAcJI+b5k0ws4pNTcuhnruaVGR3JIEufrF3UY0VShS+62rivzoInpUmO5BSoWqDZT
         7VpQ==
X-Gm-Message-State: AAQBX9eEBNv4kR39lroImB2Vwh5sJcubqvmw2G2hI6HD7BJCvvTtUqbB
	sUct+toDKNW1DWDs24Al8/nG56NuuA6YYT3LSU7M15Fu1VU=
X-Google-Smtp-Source: AKy350bpGV5ByCvKt16ZBqSiMYeqAik3yWDbWktmJefuUKPFLNoiNC3dUiO5uO8oWHLJWz/KfJ6h2WejOzTky0gPAqQ=
X-Received: by 2002:aca:240d:0:b0:388:c626:a331 with SMTP id
 n13-20020aca240d000000b00388c626a331mr1889940oic.4.1679887203814; Sun, 26 Mar
 2023 20:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com> <1679886322-20954-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679886322-20954-5-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 20:19:37 -0700
Message-ID: <CAMKF1sqt6EWwHp5=tcLraRWqBzSryxA=4Dkg_azN3=S2Tbs-LA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] gnome-online-accounts: upgrade 3.46.0
 -> 3.48.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101767

please rebase on master-next and see if its still needed then resend.

On Sun, Mar 26, 2023 at 8:05=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-build-Use-the-appropriate-dependency-object.patch
> removed since it's included in 3.48.0.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Build fixes [#226]
> * Expired Kerberos tickets not re-acquired on resume from suspend [#160]
> * Update CalDAV/CardDAV OwnCloud endpoints [#67]
> * Attempt to cope with multiple credential caches per identity [#79]
> * Error in solving Nextcloud account address [#243]
> * Translation updates
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...se-the-appropriate-dependency-object.patch | 35 -------------------
>  ...6.0.bb =3D> gnome-online-accounts_3.48.0.bb} |  3 +-
>  2 files changed, 1 insertion(+), 37 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
>  rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.46.0.bb =3D> gnome-online-accounts_3.48.0.bb} (92%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts/0001-build-Use-the-appropriate-dependency-object.patch b/meta-gnom=
e/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-Use-=
the-appropriate-dependency-object.patch
> deleted file mode 100644
> index 838ca1a7d..000000000
> --- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s/0001-build-Use-the-appropriate-dependency-object.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 06240574626eb21af37cf7dde5bf81e892dff467 Mon Sep 17 00:00:00 2001
> -From: Emmanuele Bassi <ebassi@gnome.org>
> -Date: Wed, 5 Oct 2022 22:15:37 +0100
> -Subject: [PATCH] build: Use the appropriate dependency object
> -
> -Just using `link_with` will not ensure that the GOA web extension shared
> -module is properly built against libgoa-backend and libgoa; the
> -generated headers must be transitively available by the time we build
> -the shared module.
> -
> -Fixes: #226
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-online-a=
ccounts/-/commit/fe86bfb0271735c8130367c46536b08dad5c20d8]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/goabackend/meson.build | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/src/goabackend/meson.build b/src/goabackend/meson.build
> -index f5382b3..865b2d2 100644
> ---- a/src/goabackend/meson.build
> -+++ b/src/goabackend/meson.build
> -@@ -157,9 +157,8 @@ libgoa_web_extension =3D shared_module(
> -   'goawebextension',
> -   libgoawebextension_sources,
> -   include_directories: common_incs + [goa_inc],
> --  dependencies: deps,
> -+  dependencies: [deps, libgoa_backend_dep],
> -   c_args: cflags,
> --  link_with: libgoa_backend,
> -   install: true,
> -   install_dir: join_paths(goa_pkglibdir, 'web-extensions')
> - )
> ---
> -2.39.0
> -
> diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-o=
nline-accounts_3.48.0.bb
> similarity index 92%
> rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.46.0.bb
> rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.48.0.bb
> index ce02a507d..e059500ab 100644
> --- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
> @@ -8,8 +8,7 @@ inherit gnomebase gsettings gobject-introspection gtk-ico=
n-cache vala features_c
>
>  DEPENDS =3D "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkit=
gtk glib-2.0 rest libsecret"
>
> -SRC_URI +=3D "file://0001-build-Use-the-appropriate-dependency-object.pa=
tch"
> -SRC_URI[archive.sha256sum] =3D "5e7859ce4858a6b99d3995ed70527d66e297bb90=
bbf75ec8780fe9da22c1fcaa"
> +SRC_URI[archive.sha256sum] =3D "418bb9fcffdbd72a98205ad365137617fc1e3551=
a54de74f6a98d45d266175bf"
>
>  PACKAGECONFIG_SOUP ?=3D "soup3"
>  PACKAGECONFIG ?=3D "kerberos owncloud lastfm google windows_live ${PACKA=
GECONFIG_SOUP}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101763): https://lists.openembedded.org/g/openembedde=
d-devel/message/101763
> Mute This Topic: https://lists.openembedded.org/mt/97874735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

