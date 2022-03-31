Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144D8C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 16:00:16 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.9005.1648742410173628057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V289DhC8;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id t2so21762071qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DTD5vWqGYK9x6B4UgHB5xMu44Uzl3QEl9BunJmMjyAk=;
        b=V289DhC8wkVyWkTlDN8/NwrRT6YUtgD60Iwwqi5WSMmZR3qKMnNphKzKtyoZTAoUlB
         3ueQhQynKma4xFIpL36x0RbGdswR0Stja5lO7qoNFgvPZlA2G69hW9a7X0a5clh7g0w2
         3KBCt164Hz2u1Sym4rJl4zVeFzV/QjnTeTvOKSU5GOi50Z+kNQdMEfsKYFBEUMBwNE1j
         c6PI86JSgTINqo+lI8NToAAB4IZ3HbK7AkeHanRkcSZP/FHRIa7ybySEfnh5biQVoE3y
         FQQ5qJiAj9h7c+pUIRQDv5Jdl+9ySTml0WLHxzZExQQ5l6IJTBYRmtayZ9gUTWgvxQ9U
         jgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DTD5vWqGYK9x6B4UgHB5xMu44Uzl3QEl9BunJmMjyAk=;
        b=2fPMlaHAUoQTja7Sa0nvDHelgWSX+4xzvsirmg/Tww1xtzCqnLKLZ05U/DSGH3CO6w
         pGTws/Sia0SR91KypP9YTYfe0+HlsHA9Ni+BJxIBHEE/fnsYnvYVkpi01AW+AoL2ZfIk
         I5gLzDB6mFfJI/5G5aZjdwhQVUDd7ccsKN4swMoo/a8TKUiTq+ltGI/ulw0MeHwa5Qvt
         +iqzWoCcWhHwihbcp++1j1D9Wh1LZqxKD4gV3q9H4RCm2DK/WMAcdkm4fWQRbnf0Was5
         KrNQKCF+5MLZ45Jgc7u2V0V5ldj0umV1BibdMoZ84c9n4j409bf73uabACEx9n6HOe4N
         1QTw==
X-Gm-Message-State: AOAM530h8C6hKTsMyDlvt1dfzIwy++zFWKrnNhmg0No2P4c2uTMWxG+1
	ffLwFngsQ3uTz8I/5bFAFgdk9dgx9R8s5mLYpgA=
X-Google-Smtp-Source: 
 ABdhPJzbJa0nlgJer0ZEPpHGW7ZqOvbt+X6Gu8CQfHyM9TBIMMpjIT8pGiQZb26GFiTUqqEvnT98zvbIDunNsJ90Czs=
X-Received: by 2002:ac8:5a84:0:b0:2e1:4f1d:36fb with SMTP id
 c4-20020ac85a84000000b002e14f1d36fbmr4878816qtc.54.1648742406970; Thu, 31 Mar
 2022 09:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-6-schnitzeltony@gmail.com>
In-Reply-To: <20220331064935.2763629-6-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 08:59:40 -0700
Message-ID: 
 <CAMKF1sr2BuF6+XEa5YG5Ezp4fq=oNYt6FFhzO8ByBH_XV5Y4jg@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/6] gnome-text-editor: initial add 42.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 16:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96298

getting this error

Build started at 2022-03-31T15:52:29.098624
Main binary: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-tex=
t-editor/42.0-r0/recipe-sysroot-native/usr/bin/nativepython3
Build Options: -Dprefix=3D/usr -Dbindir=3Dbin -Ddatadir=3Dshare
-Dincludedir=3Dinclude -Dinfodir=3Dshare/info -Dlibdir=3Dlib
-Dlibexecdir=3Dlibexec -Dlocalstatedir=3D/var -Dmandir=3Dshare/man
-Dsbindir=3Dsbin -Dsharedstatedir=3D/com -Dsysconfdir=3D/etc
-Dbuildtype=3Dplain -Dwrap_mode=3Dnodownload '--cross-file
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0=
-r0/meson.cross'
'--native-file /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-t=
ext-editor/42.0-r0/meson.native'
Python system: Linux
The Meson build system
Version: 0.61.3
Source dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text=
-editor/42.0-r0/gnome-text-editor-42.0
Build dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-=
editor/42.0-r0/build
Build type: cross build
Project name: gnome-text-editor
Project version: 42.0

../gnome-text-editor-42.0/meson.build:1:0: ERROR: Value "gnu17" (of
type "string") for combo option "C language standard to use" is not
one of the choices. Possible choices are (as string): "none", "c89",
"c99", "c11", "gnu89", "gnu99", "gnu11".

On Wed, Mar 30, 2022 at 11:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../gnome-text-editor_42.0.bb                 | 27 +++++++++++++++++++
>  .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-text-editor/gnome-text=
-editor_42.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_42.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.=
0.bb
> new file mode 100644
> index 000000000..01504b1cb
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.b=
b
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "A simple text editor"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +DEPENDS =3D " \
> +    desktop-file-utils-native \
> +    libadwaita \
> +    gtk4 \
> +    gtksourceview5 \
> +    enchant2 \
> +"
> +
> +GTKIC_VERSION =3D "4"
> +
> +inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_ch=
eck
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +
> +SRC_URI[archive.sha256sum] =3D "0e32140ee1c13428563bcd5f784e61ee22ffd1ad=
27d8c02283b4358a81dfab50"
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/metainfo \
> +    ${datadir}/dbus-1 \
> +"
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.=
bb
> index dc446237b..7151f9326 100644
> --- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
> @@ -20,6 +20,7 @@ RDEPENDS:${PN} =3D " \
>      gnome-photos \
>      gnome-screenshot \
>      gnome-terminal \
> +    gnome-text-editor \
>      gthumb \
>      libwnck3 \
>      nautilus \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96286): https://lists.openembedded.org/g/openembedded=
-devel/message/96286
> Mute This Topic: https://lists.openembedded.org/mt/90150031/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

