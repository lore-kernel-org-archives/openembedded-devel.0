Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7018BC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 17:10:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.452.1648746627000704935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RaomyGGr;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id o8so283852pgf.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5uWwzx1Afazx4HstSyBV8nKAso9cktTH8kdzj2P2260=;
        b=RaomyGGr41a+jqrqvLs3AD3dm9TXddOXmFbCgI+TV6/t0+lfUvD02MuvAeIVM1vwRD
         mbsqxDtbXrMG3tdsbOJszchAsmN9D8CNJQEYH7RbPnt3YMGdS8la/t+21K39E2tgPIWz
         SxoZsn0Eab1yTIZoiKPM4EJ6dI+ilk/HDbvFvA96tZo34OiVysAdcsj5BmgLIrCZ15Xz
         1wZOO80Y/c8lzyAjByrJPkNOfi7O0UyF8/Snf+wSfzWp55c+lTc4mSo0bhQD5d81vRLN
         1ihfEDJVMFHIGKDiSAg6/toYVNn1WboBkF/qHfeq6drTH9NjDby7V9T9JEJSU70/0YRD
         AOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5uWwzx1Afazx4HstSyBV8nKAso9cktTH8kdzj2P2260=;
        b=D7rbGKArA8hKZE60F5uucMbePxeY1v0HvYd56K4vNNl8Dv4UnR3tRf2AZby0SDWzkg
         3JCzGGPHPpZbHRXMnzsLiRrzt6aT2G594TytpqLZ2A7bqSLK91z7l3nuUHyJEPSr+SbC
         CWs3PRyhRqp5JIKoffh1dOwIiTKMVCGhUqJqEeFErkMZQ1Hm3t5VVMEZ/yN/+0vTK2Oc
         metaJ4NfnRDI0BJGiXtcFsF5W+2gfLlqeXgv+B2qwU3GgK+33dFZ1mLnwWaJf4U6DKbo
         zotHjbvdGzAUVIjMefYa5pm7nPzDFsY4o+Vpm5J20zJ4LZMHIKL5jQfiWnxAZbMfrdqb
         xVrQ==
X-Gm-Message-State: AOAM530aOfcJ9lpuxJqS9NKXkd93bHAoQVtFSMPpbUtwCKfE/TtbMRc3
	d5FX8ilOC4f5x0ZIUMBkPn/k58pQKhpVMpTURQE=
X-Google-Smtp-Source: 
 ABdhPJyU0CfOv/nP5LRwsx9SjR7VmNE51rdAU0QpT//Xn7Kb4OSiGs18mf70NkYuAoYW0UI2lqutz3utRa3w80gkSHg=
X-Received: by 2002:a63:d44c:0:b0:380:8c48:e040 with SMTP id
 i12-20020a63d44c000000b003808c48e040mr11839806pgj.14.1648746626496; Thu, 31
 Mar 2022 10:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-6-schnitzeltony@gmail.com>
 <CAMKF1sr2BuF6+XEa5YG5Ezp4fq=oNYt6FFhzO8ByBH_XV5Y4jg@mail.gmail.com>
 <CALbNGRTw-HJ9KapN0q4ezGn35TPcOtUv_RGRG=di2bL1XrSegQ@mail.gmail.com>
 <CAMKF1sqFbJkuca_Mw0VbEpjvepKXpVu0uQ3Ym_N-NP2dO9J_Rw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqFbJkuca_Mw0VbEpjvepKXpVu0uQ3Ym_N-NP2dO9J_Rw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Mar 2022 19:10:15 +0200
Message-ID: 
 <CALbNGRRhc7+5UDtO+4YEmZ8st0et+7N3hthwQhTHYrcDkuRSTw@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/6] gnome-text-editor: initial add 42.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 17:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96302

On Thu, Mar 31, 2022 at 7:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 31, 2022 at 10:00 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > On Thu, Mar 31, 2022 at 6:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > getting this error
> > >
> > > Build started at 2022-03-31T15:52:29.098624
> > > Main binary: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gno=
me-text-editor/42.0-r0/recipe-sysroot-native/usr/bin/nativepython3
> > > Build Options: -Dprefix=3D/usr -Dbindir=3Dbin -Ddatadir=3Dshare
> > > -Dincludedir=3Dinclude -Dinfodir=3Dshare/info -Dlibdir=3Dlib
> > > -Dlibexecdir=3Dlibexec -Dlocalstatedir=3D/var -Dmandir=3Dshare/man
> > > -Dsbindir=3Dsbin -Dsharedstatedir=3D/com -Dsysconfdir=3D/etc
> > > -Dbuildtype=3Dplain -Dwrap_mode=3Dnodownload '--cross-file
> > > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-edito=
r/42.0-r0/meson.cross'
> > > '--native-file /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/g=
nome-text-editor/42.0-r0/meson.native'
> > > Python system: Linux
> > > The Meson build system
> > > Version: 0.61.3
> > > Source dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnom=
e-text-editor/42.0-r0/gnome-text-editor-42.0
> > > Build dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome=
-text-editor/42.0-r0/build
> > > Build type: cross build
> > > Project name: gnome-text-editor
> > > Project version: 42.0
> > >
> > > ../gnome-text-editor-42.0/meson.build:1:0: ERROR: Value "gnu17" (of
> > > type "string") for combo option "C language standard to use" is not
> > > one of the choices. Possible choices are (as string): "none", "c89",
> > > "c99", "c11", "gnu89", "gnu99", "gnu11".
> > Which compiler do you use?
> >
>
> this is with clang.

Have started a build with clang for both gnome-commander /
gnome-text-editor to reproduce. Hope to send a fix soon

Andreas

