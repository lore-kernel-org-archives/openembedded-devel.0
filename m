Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5D9C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 17:06:43 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.393.1648746402234659860
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HLtLqPw0;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id kk12so24839qvb.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jHOWWUPmNsA8nmBHFXOfN2I7NCmp6P7ZNoAtRx89HrY=;
        b=HLtLqPw0Or5e2mNZcgnIJRclhIgvEpvLu+oXkm9qNk5zdlmq6hJoxts0QBQNvgvZ6e
         0xiE9wAxS/R2JMGqFTQniTiZfUGhVKAl5r1172TVHs0WX7C0JOg4DjEPEYf5F+jgreG9
         RLTZVAAAnSlyJp3dpPfw0ZxNkS51RL+NpoWMWOmrUMhSGONLMDVLWwaX4zmBrHAHD8PO
         dX+O9IdM0Wn6FAiCqTalWNrWGYQKhmC5QYLu6WPWCxwcS9guUKcKpXbuR7qSHe9HEd00
         B6/KmuxuJfL1kDkwfKGGdir6FYkLtao00OrTw1QACbSh+uYC60MZGMw0bXuSrrZLeCdr
         GUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jHOWWUPmNsA8nmBHFXOfN2I7NCmp6P7ZNoAtRx89HrY=;
        b=Ewp70Z/cMWRnS9lcobrLqygm7Hs16Ie7SmU32qIbK5B7YEzo5B+5NlHF6TcjXHbN+6
         huvJEoU/uqaKZu6Tb+1qaYxIrIVJy/5Fym05HZrnhdsZSyVsNvXGrOk9EXtdBX01busm
         g8DdVb6nO7tm3foGMFRTfJ0u/Vp2BNUYm8FqrZ1bpwRMEy7G1L/bMUrwqM8AaCBA8U40
         g31NCL1CKJPhn05l7atoodKPEB90usr579TluWQaJ8W01QfvQspDxIcvbo6SlWJzLOQ6
         qRbQqvzZkmXtDkg0Occ8moZhUeIaGwOjlTVuB0GLPxfWPua8bqub+orgk6EUAngtBHmG
         QHrw==
X-Gm-Message-State: AOAM533iooiJcSk7cll3aZfC6OLKGA0VZq9xNZnAqFoNduh8RAz768Gg
	bWNPmPClytt2ILCXUMOq68e3RxJUJJsIQNlyM3w=
X-Google-Smtp-Source: 
 ABdhPJx+qZxS49umYYFRVj8uGI0O1Vz39xpZfDpiquSEV/61fqTl1ZAOSlqW6WgfMtWX7fmCAXHp4KEESHQZp6z/P4s=
X-Received: by 2002:a05:6214:d8d:b0:441:84f3:24e8 with SMTP id
 e13-20020a0562140d8d00b0044184f324e8mr4996449qve.16.1648746401237; Thu, 31
 Mar 2022 10:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-6-schnitzeltony@gmail.com>
 <CAMKF1sr2BuF6+XEa5YG5Ezp4fq=oNYt6FFhzO8ByBH_XV5Y4jg@mail.gmail.com>
 <CALbNGRTw-HJ9KapN0q4ezGn35TPcOtUv_RGRG=di2bL1XrSegQ@mail.gmail.com>
In-Reply-To: 
 <CALbNGRTw-HJ9KapN0q4ezGn35TPcOtUv_RGRG=di2bL1XrSegQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 10:06:15 -0700
Message-ID: 
 <CAMKF1sqFbJkuca_Mw0VbEpjvepKXpVu0uQ3Ym_N-NP2dO9J_Rw@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/6] gnome-text-editor: initial add 42.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 17:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96301

On Thu, Mar 31, 2022 at 10:00 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Mar 31, 2022 at 6:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > getting this error
> >
> > Build started at 2022-03-31T15:52:29.098624
> > Main binary: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome=
-text-editor/42.0-r0/recipe-sysroot-native/usr/bin/nativepython3
> > Build Options: -Dprefix=3D/usr -Dbindir=3Dbin -Ddatadir=3Dshare
> > -Dincludedir=3Dinclude -Dinfodir=3Dshare/info -Dlibdir=3Dlib
> > -Dlibexecdir=3Dlibexec -Dlocalstatedir=3D/var -Dmandir=3Dshare/man
> > -Dsbindir=3Dsbin -Dsharedstatedir=3D/com -Dsysconfdir=3D/etc
> > -Dbuildtype=3Dplain -Dwrap_mode=3Dnodownload '--cross-file
> > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/=
42.0-r0/meson.cross'
> > '--native-file /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gno=
me-text-editor/42.0-r0/meson.native'
> > Python system: Linux
> > The Meson build system
> > Version: 0.61.3
> > Source dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-=
text-editor/42.0-r0/gnome-text-editor-42.0
> > Build dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-t=
ext-editor/42.0-r0/build
> > Build type: cross build
> > Project name: gnome-text-editor
> > Project version: 42.0
> >
> > ../gnome-text-editor-42.0/meson.build:1:0: ERROR: Value "gnu17" (of
> > type "string") for combo option "C language standard to use" is not
> > one of the choices. Possible choices are (as string): "none", "c89",
> > "c99", "c11", "gnu89", "gnu99", "gnu11".
> Which compiler do you use?
>

this is with clang.

> Andreas

