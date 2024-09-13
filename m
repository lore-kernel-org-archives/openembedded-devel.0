Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4135AFC616C
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 18:05:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.79991.1726250698032132038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 11:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAZ3HYL1;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso1543142e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 11:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726250696; x=1726855496; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/0q/YhtZk+zgBi/HDYVUAmYWKZnaGpcn2igDeQRc20=;
        b=nAZ3HYL1CysOA6SUZ9/CPGZxHuVgq3lXnpdvORqI1/7Zen++Kje7QhC9JLe4i3CQ+2
         VjkFURA/eImklClvw8wZprAA/bejGr5CuL3wwGKolfq79qYWjN5F5Se2reyeWInqDphb
         19qIgrHMtjnS0Rgble5oS7efAvjhzN+QfIHt9/uyEwg4kck6jo6IqAgnp+Wk+kx7cpyU
         50tKP8rfAELCv0TGLsJhx2bqL5knfQNnlzzcjF3cR5HlTUTLK1+5gx2j2FYXcLdeJAKw
         ZkH5K1tONabZB+yBtLd7qT/0zzchTxgTLTZ0H2JrJOkJVfzuDxgIeAUZKKAlfatYOFfy
         gpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250696; x=1726855496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/0q/YhtZk+zgBi/HDYVUAmYWKZnaGpcn2igDeQRc20=;
        b=kxJ8DHwCEHbOkAdQ1I/m8ZfSkBDEV0IJ6rRR0oeGRALeVZhvvRFIxDPp208hyAxWED
         LQ8peKu3RL+aQq/yS8O6YXDWDGdJMIyT2FQhQFZ40BoUOYZOuJIGJf9sywsP9tB4OIZA
         gW+vq/fspC9aV4JMqwNcECKJ9NdxLCTHPBdzvaaDp/6Yi6XR4tqL1HbBP7wY6vR845hL
         S3AIAFizIwcocwiNHgC/hwCg3ueWbbyVCvw3YC3GvxDmXGk7dmWfHFpa6nK5di+6T8AK
         RiYu0DE/5oCXka+3ClcbjJ8AOyj8nIfSI4v+z3TzctgoRwr4H6DKBHg61v0E1tvlyGV1
         BsJA==
X-Gm-Message-State: AOJu0YyFIMzJV8yIOSUYFahc0zu/qo3A+NnKzUg9Eqz03eVmyWdMKE8U
	jETAuu/7GPZj3q1F7Prxpn4pwmECvSy99eXUq9QbRWvkv0nXxyTltsC974OrT7SMktQcetBB7hS
	jdfGGE+ehcG0tEWmZnlp5FOx9+FQ=
X-Google-Smtp-Source: AGHT+IGHkoAS90sXEqhymbuNh8WlItWeUkEZIKpW3NgA8ZQMU0Jlxmwo/vyaxzbxINl2NqGPoJrTJ0oJXGfpEYL2D2U=
X-Received: by 2002:a05:6512:23a8:b0:536:53f7:26f9 with SMTP id
 2adb3069b0e04-5367feb9ba7mr2987744e87.3.1726250695035; Fri, 13 Sep 2024
 11:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240910145244.1238276-1-martin.jansa@gmail.com> <CAMKF1sqVpzj6ufAsozTcE1LFry4S0bAvZohkqGBdMnPA658P7g@mail.gmail.com>
In-Reply-To: <CAMKF1sqVpzj6ufAsozTcE1LFry4S0bAvZohkqGBdMnPA658P7g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Sep 2024 20:04:42 +0200
Message-ID: <CA+chaQcTKnKirn6mZhwU9M7tY2dXy_5v2xc1c3rH-j5LExdK0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nmap: depend on libpcre2 not libpcre
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 18:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112276

Interesting, I was building it fine with lld, will check what libpcre2
it has in RSS and on cmdline.

On Fri, Sep 13, 2024 at 7:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> this exposes an issue, when linking with lld linker ends up with
>
> riscv64-yoe-linux-ld.lld: error: unable to find library -lpcre2-8
>
> On Tue, Sep 10, 2024 at 7:52=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > * switched to libpcre2 in:
> >   https://github.com/nmap/nmap/commit/828ab48764b82d0226e860c73c5dac5b1=
1f77385
> >
> > * in builds hwere libpcre2 isn't pulled by some other dependency it was=
 failing with:
> > | service_scan.h:74:10: fatal error: pcre2.h: No such file or directory=
                                                                           =
                                                                           =
                 |    74 | #include <pcre2.h>                              =
                                                                           =
                                                                           =
                              |       |          ^~~~~~~~~|
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-oe/recipes-security/nmap/nmap_7.95.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recip=
es-security/nmap/nmap_7.95.bb
> > index d3273dc4e9..79c28e71f0 100644
> > --- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
> > +++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
> > @@ -17,7 +17,7 @@ inherit autotools-brokensep pkgconfig python3native
> >  PACKAGECONFIG ?=3D "pcre ncat nping pcap"
> >
> >  PACKAGECONFIG[pcap] =3D "--with-pcap=3Dlinux, --without-pcap, libpcap,=
 libpcap"
> > -PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --with=
-libpcre=3Dincluded, libpcre"
> > +PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --with=
-libpcre=3Dincluded, libpcre2"
> >  PACKAGECONFIG[ssl] =3D "--with-openssl=3D${STAGING_LIBDIR}/.., --witho=
ut-openssl, openssl, openssl"
> >  PACKAGECONFIG[ssh2] =3D "--with-openssh2=3D${STAGING_LIBDIR}/.., --wit=
hout-openssh2, libssh2, libssh2"
> >  PACKAGECONFIG[libz] =3D "--with-libz=3D${STAGING_LIBDIR}/.., --without=
-libz, zlib, zlib"
> > --
> > 2.46.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112233): https://lists.openembedded.org/g/openembed=
ded-devel/message/112233
> > Mute This Topic: https://lists.openembedded.org/mt/108376191/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

