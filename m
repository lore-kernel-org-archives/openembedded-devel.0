Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BB1C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:31:01 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.42.1684434661121021905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 11:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SHVGXmC+;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6a984993740so1061792a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684434660; x=1687026660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IimE8HDNZqU7Cg8DE+/sSASWmGzWkhGHZUkoH25bXN0=;
        b=SHVGXmC++f+LugCf/oUv8RSuMkBaHdu22NAmnRbp4Q5p23yw+/aOHPNQ0FkWya0MZH
         7XFKph7p2LnnUTf95FgT1Ih47tAgW2oIyHAWb8HAKwGwH2tsjMuPQt+Zd1Lqs8GExiUh
         vbKzD4UV1oh95qqfh2jvLwpeXZ0ITHhAloKyMD6xcXAq84dl+I4xAmA971V00bNThwhF
         FZk0G830jKUuTpUDASRBXEQMbZugXJddtZ7HYvbt2cvRxegcoB/9m7jqosQOi0pIY+qw
         7xfB5Y4Bm7cPNUMVHiq12elsPf/B/y5OOVtPlGxxJMHABPb8Rc+/tbtXSFUaLF6rltlK
         atgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684434660; x=1687026660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IimE8HDNZqU7Cg8DE+/sSASWmGzWkhGHZUkoH25bXN0=;
        b=lFyZP9YHRtgGPiSKrV+4cdK5lCp9yoj+vKQ2Gghg6roo5txlUuJBj/TCqTyOhGlrf7
         cGr01Dx1j+28pYIQvNYzNQr6CZti0/o1w1UlDL9vdhEhzndTUOPHS0uKTnd1PQ7HA6uo
         4O6i10k06lt9w7o/Y+EEToyjfeYtX2ZNStH/AvzWu8KQHrzsBRs8nWnZUbxAp+4MCcKV
         hQXG2Oihy1t24TZ/IXHWINCzWNk5WnoidBuHYfOIpXpIhWD8+n347vKhT0TE46HlCZYn
         fujKtuHBHR6DsFv5T7wylnKAUOs/cd5OVqs1+B+bkyh3xFDaNGSPNjOXvXFKjC3lpOcs
         bJTg==
X-Gm-Message-State: AC+VfDxGb9gJ1HbeVVxxFjbxstEfD1h62PDYiXuamHoLa3LAaYaDfVcq
	MEr1NtZ8Fpgyn26/njvdoGKiiO7P4KaHoblkRD0FsVRL3bc=
X-Google-Smtp-Source: ACHHUZ5hq9EjRZdJbM3KulMbKXVm8D5ZBBs9pE6mPhKPV7dPkCRs5uSQs2NiI5sf0FFPEBjYK++UzoMK7P/ed1oc8X4=
X-Received: by 2002:a9d:7758:0:b0:6ab:2abf:35ed with SMTP id
 t24-20020a9d7758000000b006ab2abf35edmr1787639otl.0.1684434660262; Thu, 18 May
 2023 11:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230518101233.3885135-1-Martin.Jansa@gmail.com>
 <CAMKF1sprnCmnaNkFtrg0h3ek-b=42sXf0Z=qSCCdzLG9+uu3Cg@mail.gmail.com>
 <CA+chaQfmXq4HPemB2dQboQvjQ7Ms5JpUGDdij=s3EZ0+UwX6AA@mail.gmail.com> <CAMKF1sqDPfF9uzkPCLOfc-X_zJ1rcWVWdgDwz2ekEiwC4w-yXg@mail.gmail.com>
In-Reply-To: <CAMKF1sqDPfF9uzkPCLOfc-X_zJ1rcWVWdgDwz2ekEiwC4w-yXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2023 11:30:34 -0700
Message-ID: <CAMKF1spA9N9WdREDdhcb40aGw_tg3XQoSUAoKw+qcO=W3xkXHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: enable vala only with GI_DATA_ENABLED
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 18:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102662

On Thu, May 18, 2023 at 11:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Thu, May 18, 2023 at 11:09=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com> wrote:
> >
> > The vala inherit is conditional on vala PACKAGECONFIG, so it seems to w=
ork fine.
> >
> > On Thu, May 18, 2023 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> On Thu, May 18, 2023 at 3:12=E2=80=AFAM Martin Jansa <Martin.Jansa@gma=
il.com> wrote:
> >> >
> >> > * cannot be enabled without:
> >> >   http://errors.yoctoproject.org/Errors/Details/704353/
> >> >   NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert failed: val=
a api require GObject introspection. Use -Dvapi=3Dfalse to disable it
> >> >
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> >  .../networkmanager/networkmanager_1.42.6.bb                    | 3 =
++-
> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta-networking/recipes-connectivity/networkmanager/net=
workmanager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager=
/networkmanager_1.42.6.bb
> >> > index 31687a30b9..2412775cf1 100644
> >> > --- a/meta-networking/recipes-connectivity/networkmanager/networkman=
ager_1.42.6.bb
> >> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkman=
ager_1.42.6.bb
> >> > @@ -70,11 +70,12 @@ do_compile:prepend() {
> >> >      export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPEL=
IB_PATH:+:$GI_TYPELIB_PATH}"
> >> >  }
> >> >
> >> > -PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
> >> > +PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
> >> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', b=
b.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
> >> >      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', =
'', d)} \
> >> >      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
> >> >      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux aud=
it', '', d)} \
> >> > +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}=
 \
> >> >  "
> >>
> >> I think vala support should be added via inheriting vala class. The
> >> problem is still there when GI_DATA_ENABLED
> >> is True.
> >>
> >> >
> >> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d=
)}
>
> Its not working in my workspace and ends with error you were seeing
> without this change.

I am building with
abelloni/master-next
from poky-contrib btw. which has the g-i rework changes.

>
> >> > --
> >> > 2.40.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#102657): https://lists.openembedded.org/g/openem=
bedded-devel/message/102657
> >> > Mute This Topic: https://lists.openembedded.org/mt/98988017/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >

