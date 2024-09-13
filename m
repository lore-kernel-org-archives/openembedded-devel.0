Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AB9FC6170
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 18:18:32 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.80271.1726251506957645978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 11:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kxqe3TSJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5e1b50feb9bso1407111eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726251506; x=1726856306; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KVMPmUV6BTDZlEABEKf5GRNeJqbOy7lCoL86H9T6jQ=;
        b=Kxqe3TSJVBPyYnJO20p6BvtP+3810z916r5McAX1SuZ8h2Dgjbg2XGa2egZCb2id0O
         rYBeLSTKkFDkn2/ufPJCFeKMRgXzehCLSQJmSQXuBSPK7FaI6AK4uVDjvvcuEBUw8INi
         lOxvS6SYvgBgBbwj4Bx5ewXYLMNRl4Lw+JH4ADROHDBEmpmU+BJ8T3M3A7fmqJsTeAqH
         Gm2VSKbw7w/3ukZmKw1PemNzI2WbJqbXczIQEH+5DNwusonhCf8xmbEf0j7kOyDsCQoS
         sTzb3Yqab2zqlSauq4rnRShNcxtnkmkD4+n5Ml9Qqz27ZuRa1OD6trMHp994208WLrLm
         nTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726251506; x=1726856306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KVMPmUV6BTDZlEABEKf5GRNeJqbOy7lCoL86H9T6jQ=;
        b=HQZvnMKMzBxg+8zEJq9J+FBP+bJ6YXAEiHOEo2kVK9FAxshw9MgrOGt4enehokooqw
         qrLjakZHTapdWVo15Hm6MKPRqe7XpxwJxGOnF0tbszYGdfHZqkdrPUo/WqRZGkoiAaSo
         sEXJNL6iZ7y+HKiWPlTWsUSm1hqC5rANtg0RloUXtSMEsZJMjMD2SZ+CKLlMFyUHuBDT
         RvvSAmM1k44WlvE7O7RbNjqYpF2dJmko76p8HMdxS2tQYh05ravPW44Mdyjs/dLeCAc0
         6qhCj7UbizQ/KEd8nNdvh29SR9Ax5BCYCgi7fIh8plh2Ynzo4tzMHuCbjNpOdopnaGwD
         YYkw==
X-Gm-Message-State: AOJu0YyHjblSXgpeAp0BC3q215FgPqLdUk/UuNmlKtkOg42W0TjXZPmr
	P3WTe0frd+47iLTmWwLVUHLMXpgMeiuTzeuoFKOTibi/fg3ptZ9p0FV8wfEqNnRR3W9WkoWlt/7
	kNTD513Dj/1Yd63q1rx1SEVgOR+g=
X-Google-Smtp-Source: AGHT+IEFOjoaI2dwebJaO+CPGh399mUBijq+rTY3Pv20tnFD0xCOUNMsbwd3TxuZQkN2qSIX1VAaPcgpzf7i/xDO7CA=
X-Received: by 2002:a05:6820:1c85:b0:5e1:e65d:5146 with SMTP id
 006d021491bc7-5e2014359c7mr4278310eaf.5.1726251506254; Fri, 13 Sep 2024
 11:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240910145244.1238276-1-martin.jansa@gmail.com>
 <CAMKF1sqVpzj6ufAsozTcE1LFry4S0bAvZohkqGBdMnPA658P7g@mail.gmail.com> <CA+chaQcTKnKirn6mZhwU9M7tY2dXy_5v2xc1c3rH-j5LExdK0g@mail.gmail.com>
In-Reply-To: <CA+chaQcTKnKirn6mZhwU9M7tY2dXy_5v2xc1c3rH-j5LExdK0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2024 11:17:59 -0700
Message-ID: <CAMKF1sp7h9FAPvhK5aQiZqKPhb4JL=jhG4Bz46NW9i_ZBcTiVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nmap: depend on libpcre2 not libpcre
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 18:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112278

its on riscv64/clang19, this combo could be interesting

On Fri, Sep 13, 2024 at 11:04=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Interesting, I was building it fine with lld, will check what libpcre2
> it has in RSS and on cmdline.
>
> On Fri, Sep 13, 2024 at 7:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > this exposes an issue, when linking with lld linker ends up with
> >
> > riscv64-yoe-linux-ld.lld: error: unable to find library -lpcre2-8
> >
> > On Tue, Sep 10, 2024 at 7:52=E2=80=AFAM Martin Jansa via
> > lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > >
> > > * switched to libpcre2 in:
> > >   https://github.com/nmap/nmap/commit/828ab48764b82d0226e860c73c5dac5=
b11f77385
> > >
> > > * in builds hwere libpcre2 isn't pulled by some other dependency it w=
as failing with:
> > > | service_scan.h:74:10: fatal error: pcre2.h: No such file or directo=
ry                                                                         =
                                                                           =
                   |    74 | #include <pcre2.h>                            =
                                                                           =
                                                                           =
                                |       |          ^~~~~~~~~|
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-security/nmap/nmap_7.95.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/rec=
ipes-security/nmap/nmap_7.95.bb
> > > index d3273dc4e9..79c28e71f0 100644
> > > --- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
> > > +++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
> > > @@ -17,7 +17,7 @@ inherit autotools-brokensep pkgconfig python3native
> > >  PACKAGECONFIG ?=3D "pcre ncat nping pcap"
> > >
> > >  PACKAGECONFIG[pcap] =3D "--with-pcap=3Dlinux, --without-pcap, libpca=
p, libpcap"
> > > -PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --wi=
th-libpcre=3Dincluded, libpcre"
> > > +PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --wi=
th-libpcre=3Dincluded, libpcre2"
> > >  PACKAGECONFIG[ssl] =3D "--with-openssl=3D${STAGING_LIBDIR}/.., --wit=
hout-openssl, openssl, openssl"
> > >  PACKAGECONFIG[ssh2] =3D "--with-openssh2=3D${STAGING_LIBDIR}/.., --w=
ithout-openssh2, libssh2, libssh2"
> > >  PACKAGECONFIG[libz] =3D "--with-libz=3D${STAGING_LIBDIR}/.., --witho=
ut-libz, zlib, zlib"
> > > --
> > > 2.46.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#112233): https://lists.openembedded.org/g/openemb=
edded-devel/message/112233
> > > Mute This Topic: https://lists.openembedded.org/mt/108376191/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

