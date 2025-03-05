Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5274DC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 08:16:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.8722.1741162567180065229
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 00:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQCKJcRq;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so6502721fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 00:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741162565; x=1741767365; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mKv/zSsMgRGSgh510qQrrN1j/2hg4XW75C+mq0wL5g=;
        b=QQCKJcRqk0FFfVf2aaXPOSRc4QzOb1eOD10cVJLxQUt6QTm5/pnb5I0YrnFY/7G6TD
         iD99S5tbeHL0X4sI8ArTV2o6VaXrEmQSFmWZmmwWVsHYarabjdesfyAd0rWQoLkuI33J
         RRBIN0k71XxvYWTdeH3cgSAFYOiCuDVT1LtdFaPV0nSEOVUsOIGLaC3F2wW03fUZYIpH
         qnmOtAFvw3lE9SqrOv/a4bMBnO2QdU4BltkQAx9LW5lL1KH9KcPOd9DlOa8haVOUHu61
         PA3xHKqRKRwk784T8HEk3Ypl+LN7n02VufLgxQcQf2UNEVn8G2zPzqw5n9HayrsWE4O+
         omjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162565; x=1741767365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mKv/zSsMgRGSgh510qQrrN1j/2hg4XW75C+mq0wL5g=;
        b=SaeBGdf8SSXgM5ruM+o7XiEgbmgxs6xJxi4WoqVKSz01zXtZvOYP2FyC9VE1WR45pB
         00VyR62TFUlEKyTCCdZScQHJdR6WlHT+9reWP9ehrVNYWNtFFXLl2S1w8ldJ6Owp+vuZ
         0MhJM1nYNPoiA8N9fYqcvLSmV09xqeEtptcRWKZfm6d/IGxYh4U1rDOsEbkmwkrOO77U
         sur7NAczWoglTsBjjhX59iApfLoxsxmzk9oqfTg0Bo4K+Vr/Op/ObNlDVuqw2MtJs80g
         TWkiLqx6uv8cVB/7HWWWQO3TS36eoNg6Jhb+CpzZiAJbjZpFo660giRS6ZsV02X/XdRb
         Dj/A==
X-Gm-Message-State: AOJu0Yx0RWOunxe13yGc9ZcKY3of6T5sY91qNkco0yhnRlUqYzcM+6E1
	ijVgixJpSb1GeYvFyjvdMAxgHqx//s0C+ZbHEo1ce1G5X9esQMWRNzr5D/m7mu7/5IWUR6TgxSh
	EfklND1xI3crS67LNZR1obu6h85R2yNDh
X-Gm-Gg: ASbGncv/8Xj1AxUkEyj0P+NdtsNgqJgMjO+BnjoIY7GT5RioUrV2FyEaavCoRkEPFBB
	FDPkGfw3+JjoWoHyDxbVd9BAMlim7y+85BuzMrUjUTNoEBajq8bbBo3HVWKoYibHFETqmLcq/1U
	RJ9k2N77qYYN6jFlX80obSQPDD3WsZ
X-Google-Smtp-Source: AGHT+IH++HRh3x4EDI4pJuxtiuVzb4GNaC18DvaCzOxe7m2JQtwEFmgcP3X28QlMK6L5SfnCx2ZI4cBt4808KsVkMJY=
X-Received: by 2002:a2e:b6cd:0:b0:30b:8f90:bdda with SMTP id
 38308e7fff4ca-30bd7b2798fmr7722361fa.7.1741162564793; Wed, 05 Mar 2025
 00:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20250225034557.2148517-1-liezhi.yang@windriver.com>
 <20250225034557.2148517-2-liezhi.yang@windriver.com> <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
 <1de5ac33-7f40-4cb8-9b0f-d95c5139870f@windriver.com>
In-Reply-To: <1de5ac33-7f40-4cb8-9b0f-d95c5139870f@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Mar 2025 09:15:52 +0100
X-Gm-Features: AQ5f1JrVI1XgvG901y6MRdiSe0iarNzfj27Wl4Ox59SOw1ZLPqeHyxsiT1HGwNg
Message-ID: <CA+chaQfTaun+JBhxEgvWwOPMdBtWnLPzbNwc1FaVvUG3-p+w0Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 -> 1.0.14
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 08:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115744

On Wed, Mar 5, 2025 at 8:58=E2=80=AFAM Robert Yang <liezhi.yang@windriver.c=
om> wrote:
>
> >> +
> >> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> >
> > This path won't be correct for multilib builds where target ${libdir}
> > might be e.g. /usr/lib32 while native libdir is /usr/lib.
> >
> > Is there a reason why you haven't used STAGING_LIBDIR_NATIVE variable
> > which uses correct ${libdir_native}?
>
> I copied it from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0=
.0.29.bb.

Hi,

ok, will send fix for uutils-coreutils as well (will check why it
wasn't shown in my world builds yet).

> How can I reproduce the multilib errors, please? I tried to build
> lib32-thin-provisioning-tools with poky, it works well.
>
> local.conf:
>
> MACHINE =3D "qemux86-64"
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"

What is STAGING_LIBDIR_NATIVE and libdir in
lib32-thin-provisioning-tools for you?

Try to add:
BASELIB =3D "lib32"

that's what we're using with:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3D13bdeecb4b54fde63444edbeaaa23bea9cc7b40b

