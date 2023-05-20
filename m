Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AEBC77B75
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 00:10:10 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.530.1684541409480029859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 17:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pmsCtJUq;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ab087111faso1603087a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684541408; x=1687133408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlywChS7yXumzuA0QJGrP+g1annQ9avJSe45r4xBOxs=;
        b=pmsCtJUq8Xq9j8HUpRKLzQwmsoIgEbXECo1xMaTAa1AnSbjN7M7EEEW/Qj0Tb3k9jb
         5MBkZ42jj+Ubn+eWPKG9KWfjVpYNY7sbrjwtO0r+yfjRBbrynlkR2i+Dgu3Lx+nzbjz8
         05KfSnjqMSICI0HhFB8mpZSh79/pIzWr/YRhOZzUT2qRPWBW/fM/VUn7pl5/hfb5Erop
         EY2FjrsOy0MDPRiahE3DmyPfBXUkerGRS+NxxBDwtv9WGSIPS2keRp+Zd717n4ZbjUXn
         5HGEATe+HsR4fbPNu2JZUGcmY3OPrK51dWL8yCOgSHFvV6YEjrzuAfWMSkeZncWiERUf
         5oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684541408; x=1687133408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlywChS7yXumzuA0QJGrP+g1annQ9avJSe45r4xBOxs=;
        b=LWJxm7BE2+R/N/AGu8TaGu05uH9QlwPppyquahDPgEJNR0R0yt+VCs/1n50+GArawf
         No8GylU24765qG6dsCIMMqKHWsKUZcBPVIv6uE252DjGEYpVW/KZ8AXj1yCJOdIDXbVn
         xnq0Q8+8zY8jAzbggqw5qqNZ5QuzGejrnX0KjYN5Z8mdePREhjldQPuVLwglD73agaeO
         gQxMeBeAmp6VCe+0inNfbgfZsAEEdVmeJDigmkQLu/7GdKXoLQPSG+Yxy03V62254wgn
         2TkIbQnsBQKLCbPJO/33OIOPXQ3RuAOl/Y7f1YRd2WC7bvJjQ0A7nhDeJ8hh298+0Mjd
         HHnw==
X-Gm-Message-State: AC+VfDxuDkgIgM0bbgfCqrmzM0ga24MFimsGljVM5d861RKUfmEFOrLu
	gK/Q4zpi/w34oAEGzQaORTb6+1yqDYsnS25BjFRFfaAqaX4=
X-Google-Smtp-Source: ACHHUZ6vEmh5Jp6JoPauzXM52VcrZ3nIfAUC9KHjnvTEpxAGODqkHLeb/S+MmL38hUbhefPKbinHV0h63eumr/gDHFA=
X-Received: by 2002:a05:6808:313:b0:394:2c5d:e8e4 with SMTP id
 i19-20020a056808031300b003942c5de8e4mr2074178oie.31.1684541408421; Fri, 19
 May 2023 17:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230519163440.2733149-1-ross.burton@arm.com> <20230519163440.2733149-5-ross.burton@arm.com>
In-Reply-To: <20230519163440.2733149-5-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 May 2023 17:09:42 -0700
Message-ID: <CAMKF1spWAJczQXkZBQBHdb5WJ4cdmw3bcfj=tn-RbF8EVhiAhw@mail.gmail.com>
Subject: Re: [oe] [PATCH 05/13] networkmanager: enable Vala iff
 gobject-introspection is available
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 May 2023 00:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102689

On Fri, May 19, 2023 at 9:34=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> If vala is enabled but gobject-introspection isn't:
>
>   meson.build:816:4: ERROR: Assert failed: vala api require GObject
>   introspection. Use -Dvapi=3Dfalse to disable it
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.42.6.bb
> index 31687a30b9..ec386a4fb1 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
> @@ -70,11 +70,12 @@ do_compile:prepend() {
>      export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PA=
TH:+:$GI_TYPELIB_PATH}"
>  }
>
> -PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
> +PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.uti=
ls.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d=
)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', =
'', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data'=
, 'vala', '', d)} \
>  "

This ends up in errors

https://errors.yoctoproject.org/Errors/Details/704795/

When gobject-introspection-data is in DISTRO_FEATURES

>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102679): https://lists.openembedded.org/g/openembedde=
d-devel/message/102679
> Mute This Topic: https://lists.openembedded.org/mt/99015894/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

