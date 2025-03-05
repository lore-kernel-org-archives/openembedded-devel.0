Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA55C282D3
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 09:16:51 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9496.1741166207274844467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 01:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqiOxWps;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5494bc4d741so5860447e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741166205; x=1741771005; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7mGtU7Ie3B2+9SgovhZEtnQIgUKZYJc4JE0aisjGFw=;
        b=iqiOxWps9DBiPik5CnvbeitEi1/ybiQD4z8GHnx8evhU4TwFpdgKX43eU0WtPABNt1
         wa6K6gvGuCLK+lTYs9AdETpGEEEQOKisC6li94cIw1yUM2QJhOK1cyrrcWG4pr5fWfyV
         UEHDqOPIZSPJrPi1cJ+ZtlvDWrL8vo2R5BkwJAVUKgtbm8Pss6OcgTiFa8/VZmHB4ADi
         I8BR3QKFlELH6tkCf0DOdzF6Y8Gr3POl15gZFjW8j7k6EMnyYKg37nR8C3d3DVkgf33W
         3FoaOlUdodORI07mUkwXc0pLmqhcb6DbxgF8tfNSNM3BfIjW51pirYPIUV+Fycj6oTa7
         VZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166205; x=1741771005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7mGtU7Ie3B2+9SgovhZEtnQIgUKZYJc4JE0aisjGFw=;
        b=i/wl3xObvHWQFe2KilkNvsQmV113xEAD11oEr5eUFDRqSWeUltCZzabWoIaucLun5j
         SBCVTpU/LxoRm9r41hInm9z7bcC3YLp3YKANrP7r7AZRtwSPpyksU7joArI9vie37X4N
         NVS5tIW4P49GTzA82TX43yickG8wk93Aoa9D7OChKarf2tyZ2iiettJ35gkW0ZS/FUqv
         Ls/TwnSr+iX7ZOmkCGboQpgF13hfTiyr/ETKwUYwHxeUWHxch5tpdRCAycMcwjwToQKS
         6wEj8xly00h8lEdmDWmNFKh4zKzghZZbCvpWLmk50xJ9EvfXQHzU/HvVSJLf1rL9xmXu
         mbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+B+kqDka9RaaSpvM5YtPyLnR1RgevIvX1Jg8EuxtV2aYsbjkaAD/M+JKG9zizuTCLCvPFGkOALVhCf+M82LAOmz8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjR0jIHEk8+0HuJQNHHjL5E6YPoancs5DZNqxupw2K7SxsPrgi
	bOXSciELLFEPWAklCV7tNx4rEhjlGdcNVgib2N+rPEgjet62EVfWXu5c0rFNG6ZlGihzO7KH63D
	xcepRQfsPxD0iBb2D//Y+TVj5HGfc3860
X-Gm-Gg: ASbGnct6qtw2zss7AUxZlG8uT6bPnzI/nwYbmrSUXDKJBhG6fuNQg5HZuw7GXAbMjWj
	D58QVh6fsnJdPAo4b2TyX+5CKUUhaOwLIJCc4XmFjRPd3GkXQaPlO8Nzsic8oUL2m9vfMPXN/2A
	I5XBcYHwW4lKGVmzp87DZGsINgk2Mz
X-Google-Smtp-Source: AGHT+IGRJqEvZrH69jq0gSU3phfkIjQKBin6Uob7RKJel/H3a3NexgDIaGFiG2ukWtfQgPIgMtjiZggR/4uzEvnRGI8=
X-Received: by 2002:a05:6512:3a8e:b0:545:e19:ba1c with SMTP id
 2adb3069b0e04-5497d3379ffmr902735e87.19.1741166205023; Wed, 05 Mar 2025
 01:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20250225034557.2148517-1-liezhi.yang@windriver.com>
 <20250225034557.2148517-2-liezhi.yang@windriver.com> <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
 <1de5ac33-7f40-4cb8-9b0f-d95c5139870f@windriver.com> <1829DA21520CC898.4104@lists.openembedded.org>
In-Reply-To: <1829DA21520CC898.4104@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Mar 2025 10:16:33 +0100
X-Gm-Features: AQ5f1JrZRVscBQDuWc0ZZ6mJWcxPFmzJIjQtsN8Za1bdTLav5SYt3JmElcT95d0
Message-ID: <CA+chaQe-645LjGQVU-kZtDJcHH892zRRZxa8Fn6uEmHcsMXKpQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 -> 1.0.14
To: martin.jansa@gmail.com
Cc: Robert Yang <liezhi.yang@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 09:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115746

Here is the lib32-thin-provisioning-tools build failure with
qemuarm64-multilib (from the oe-core:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3D13bdeecb4b54fde63444edbeaaa23bea9cc7b40b
)

http://errors.yoctoproject.org/Errors/Details/845300/

On Wed, Mar 5, 2025 at 9:16=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Mar 5, 2025 at 8:58=E2=80=AFAM Robert Yang <liezhi.yang@windriver=
.com> wrote:
> >
> > >> +
> > >> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}=
"
> > >
> > > This path won't be correct for multilib builds where target ${libdir}
> > > might be e.g. /usr/lib32 while native libdir is /usr/lib.
> > >
> > > Is there a reason why you haven't used STAGING_LIBDIR_NATIVE variable
> > > which uses correct ${libdir_native}?
> >
> > I copied it from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils=
_0.0.29.bb.
>
> Hi,
>
> ok, will send fix for uutils-coreutils as well (will check why it
> wasn't shown in my world builds yet).
>
> > How can I reproduce the multilib errors, please? I tried to build
> > lib32-thin-provisioning-tools with poky, it works well.
> >
> > local.conf:
> >
> > MACHINE =3D "qemux86-64"
> > require conf/multilib.conf
> > MULTILIBS =3D "multilib:lib32"
> > DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"
>
> What is STAGING_LIBDIR_NATIVE and libdir in
> lib32-thin-provisioning-tools for you?
>
> Try to add:
> BASELIB =3D "lib32"
>
> that's what we're using with:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3D13bdeecb4b54fde63444edbeaaa23bea9cc7b40b
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115744): https://lists.openembedded.org/g/openembedde=
d-devel/message/115744
> Mute This Topic: https://lists.openembedded.org/mt/111371873/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

