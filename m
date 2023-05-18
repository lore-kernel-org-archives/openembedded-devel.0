Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC9BC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:21:25 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.3051.1684434079548223814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 11:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JMMSCMxP;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3943fdc59f9so1318938b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684434079; x=1687026079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCCbJGn0YOW6i254U4PAiMwcHTNJenJuKWs/acQGAGI=;
        b=JMMSCMxPnKTlLLMNg/9ohFtbfd+GKEtl+Irv1UAmcZLHOt08st97b4qvuFf2HwL7y0
         RnwRUDpgqIYxUBgGPjB8gZgouH5wP7ouLGlOXKF5bXcoUNR+DVhZUkAoC6zO2MYqUMe4
         72I43tgAtUsR7n6EmsappEiRlikT0lRYiMR/zE1M+IgXYh4LhXaE7ijpzp0i+/wEEvW4
         93C8kDvvnf9oJIdsGB1WSWIu/gDxdmfaC2ToEp3A6vfnaU5Ss0J7nPuTlIzz1ckC2ERc
         q5wueIvcZDUgmy904vmmbB3tXqkZJ7LLrcsf3SU6QqLW07JZvNTyuNfzYnmLVAT+LRi3
         Hh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684434079; x=1687026079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCCbJGn0YOW6i254U4PAiMwcHTNJenJuKWs/acQGAGI=;
        b=VP0fKrdGiYgh3uZthLCiMOIeqnzvac8z2Y1fN3xTMsmlvNGbobM1JmbE+lhez4EO01
         lhc7SJFsZ2kwgaRk7Dj8IMBIu/S3EQ1Lg1vZ5x2N6vPjxD21bjcrsl7IgVowoeWHnY3y
         Wc621taUTemfDOMC81tKvjsxWHi1GyXNPmApHIhz0T8jcqjEtfmUlxz8xsbtJE5v5gGZ
         qSRKTHyh8mlwBkAi1MBRMWKJJuWheDsfuEDQkZPOzocO02sFGczAL9xrcS9f/XVKt3S5
         junrkcIaaczskcUDbyzc87CjbetRXpDBiESSn44ebgF/gDCdvKK+W6idlBTbTdL9tS69
         xz/g==
X-Gm-Message-State: AC+VfDwNAoNxzjJhVB3/S7szVt7WBH+MrEmUfWcv0lqcO0Upyoo2JY0R
	rOru3EUQfnA++/+mwvt6rheEonWr4OxfRAtJALjkANG9
X-Google-Smtp-Source: ACHHUZ5/OuAs01dRfCpL4GaomA88m+zlMk9k5ypDzM8qPJYDfOdKWkmuu7JjV1B2E8vagmSqoVcO1kozYkDFyN5k2WY=
X-Received: by 2002:a05:6808:1304:b0:396:d3b:ec9a with SMTP id
 y4-20020a056808130400b003960d3bec9amr1899056oiv.9.1684434078656; Thu, 18 May
 2023 11:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230518101233.3885135-1-Martin.Jansa@gmail.com>
 <CAMKF1sprnCmnaNkFtrg0h3ek-b=42sXf0Z=qSCCdzLG9+uu3Cg@mail.gmail.com> <CA+chaQfmXq4HPemB2dQboQvjQ7Ms5JpUGDdij=s3EZ0+UwX6AA@mail.gmail.com>
In-Reply-To: <CA+chaQfmXq4HPemB2dQboQvjQ7Ms5JpUGDdij=s3EZ0+UwX6AA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2023 11:20:52 -0700
Message-ID: <CAMKF1sqDPfF9uzkPCLOfc-X_zJ1rcWVWdgDwz2ekEiwC4w-yXg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: enable vala only with GI_DATA_ENABLED
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 18:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102661

On Thu, May 18, 2023 at 11:09=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> The vala inherit is conditional on vala PACKAGECONFIG, so it seems to wor=
k fine.
>
> On Thu, May 18, 2023 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> On Thu, May 18, 2023 at 3:12=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail=
.com> wrote:
>> >
>> > * cannot be enabled without:
>> >   http://errors.yoctoproject.org/Errors/Details/704353/
>> >   NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert failed: vala =
api require GObject introspection. Use -Dvapi=3Dfalse to disable it
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++=
-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager_1.42.6.bb
>> > index 31687a30b9..2412775cf1 100644
>> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er_1.42.6.bb
>> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er_1.42.6.bb
>> > @@ -70,11 +70,12 @@ do_compile:prepend() {
>> >      export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB=
_PATH:+:$GI_TYPELIB_PATH}"
>> >  }
>> >
>> > -PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
>> > +PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
>> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.=
utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
>> >      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', ''=
, d)} \
>> >      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
>> >      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit=
', '', d)} \
>> > +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)} \
>> >  "
>>
>> I think vala support should be added via inheriting vala class. The
>> problem is still there when GI_DATA_ENABLED
>> is True.
>>
>> >
>> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}

Its not working in my workspace and ends with error you were seeing
without this change.

>> > --
>> > 2.40.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#102657): https://lists.openembedded.org/g/openembe=
dded-devel/message/102657
>> > Mute This Topic: https://lists.openembedded.org/mt/98988017/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

