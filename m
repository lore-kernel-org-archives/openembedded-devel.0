Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4B8C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 23:35:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.12968.1640129755407093692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 15:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Aa2pirwL;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id e5so1126224wrc.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VoeLcKV1MypWUlHWlMu6WUndoELQGanZOd+CGX4MfJ0=;
        b=Aa2pirwLTieZV7AJVeOMM07P+PaqONbaphG/TtPTeS2Lqrkgf8tXlp7yq8+u//IyKQ
         8kBhCV+H/5ErRmy4rVn4dmR77/s/31UsAsd3HGbqQcvaiizxYyKv/y/tntxB6YaHiJ1K
         QCYEnViVFr3NkxsKlu4a5R1ecuY2WiBszMdOCxwIc0tKtw7UbkZQkGTpdW2zbySDEZbQ
         eRaeDocPrzlNjnjvw4zTCgjevEp5tlCUHTP4DCiqtPBSq85ehwv00Fe24LxoPGiLUtCm
         bqVqOEfYoI2//ONry5YawwKu2Rnb84yeQXSQSJt75lW79TpmePCaXDooqs/z1/XB2o2I
         C7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VoeLcKV1MypWUlHWlMu6WUndoELQGanZOd+CGX4MfJ0=;
        b=XDUHoO4jBlMZE4EkqgeVa9Nbd7eyHdwVdn71diN67uyXpZo3qqkejQT/kLYhi76hm2
         XALHrMe+r9PsEc1FwbUPlUrLTcLMgOantY6srwKjaoMl5pjbxi8mIzotHizU6epOggFJ
         HtWTRxN3+UuZQHOxc/EP1YJd+9jcsHL3iwZUNI5BbKZL+XywP2nfS+R13qfgelHt9ivX
         KJ6X1euEXl+MSBbSpZE7/qvfgqAyZ+ffbjmRSt++L5319xZfvJcHb4iG9AzGvqoRwmAa
         MnfeGL3+cYeMhoxqSd4DvDTrvZw++X871QfZ0U/iYzDkbb6Qui9SXjFEFeACZZdL/7ww
         KLUg==
X-Gm-Message-State: AOAM5306VuxwCqGDwwN9gKMPJkUj9kXwYIcqy4ng6pKUdU49kCJNEv2+
	AOO430K72ZzBdOnmVNWKv6I0HYAGUqjJVli1CtNZiw==
X-Google-Smtp-Source: 
 ABdhPJzyXPu9liQRue6LKDr+TZ2r7FAtYmgP8YJuYPyLbOUtVYUcBBl0mA/QKqPVCbYdI+hUa479hPNJe3Gfzu7RymE=
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr276028wri.231.1640129753341;
 Tue, 21 Dec 2021 15:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20211221214933.3162445-1-schnitzeltony@gmail.com>
In-Reply-To: <20211221214933.3162445-1-schnitzeltony@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 21 Dec 2021 23:35:42 +0000
Message-ID: 
 <CAAnfSTs3_ccr4LQPV5ehcqPUVTB9wSjKWJU9=O85Egv01S81EA@mail.gmail.com>
Subject: Re: [oe] [PATCH] vlc: Fix build with un-renameed native libtool
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 23:35:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94474

Sorry, thought I caught all of these.  The name being doltlibtool
probably messed up my grep.

On Tue, 21 Dec 2021 at 21:49, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> Fixes:
> | ../doltlibtool: line 19: /home/superandy/tmp/oe-core-glibc/work/cortexa=
72-mortsgna-linux/vlc/3.0.12-r0/build/compat/../aarch64-mortsgna-linux-libt=
ool: No such file or directory
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb b/meta-=
multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
> index af256984c..384637281 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
> @@ -96,8 +96,6 @@ PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpa=
u,libvdpau"
>  PACKAGECONFIG[wayland] =3D "--enable-wayland,--disable-wayland,wayland w=
ayland-native"
>
>  do_configure:append() {
> -    sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${=
TARGET_SYS}-libtool:g ${B}/doltlibtool
> -
>      # moc needs support: precreate build paths
>      for qtpath in adapters components/epg components/playlist components=
/sout dialogs managers styles util/buttons; do
>          mkdir -p "${B}/modules/gui/qt/$qtpath"
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94471): https://lists.openembedded.org/g/openembedded=
-devel/message/94471
> Mute This Topic: https://lists.openembedded.org/mt/87886910/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
oss@burtonini.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

