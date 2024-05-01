Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55386C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:03:35 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.45.1714579411716375245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 09:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRA9pVni;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23cd15209fdso1568792fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714579411; x=1715184211; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/pllnZPnzjt9S5QFKAYmhOMEEJf5nuqP4ATcyDg8PA=;
        b=CRA9pVniiO1rDYLKZX519ezF20/J4Ns/9xxLkClt95u9aiXXaVYEl9VwZ50F3NYYKO
         xSVC4mjhOlW3z13t/jkknwoTslflJq7I3BN9Ji5rLfrxXir+M7rkBLXlzb2A6auMYne0
         hkEbthdY5GEeNzV1EQ/TQND1P3Eu/qhZTh/Mr7EdKxy3HcmqURA/BedvxdXtPZ/QnvJe
         AW03kiMGLlAO0TgcLZPtp4NxmK4PbutU0stAM1S9Vyv9J3IqBEfZKLxuZOMltnZ8dQIC
         ED64Qb2Y0J9TOk8HvxmSguCPfvM+JAn33YMyoNoNQHXqPjYqYHRLgD9kCB8bJbfbK4Nx
         NPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714579411; x=1715184211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/pllnZPnzjt9S5QFKAYmhOMEEJf5nuqP4ATcyDg8PA=;
        b=wTqKxZpfXLLAsLUdovFPb/qokA0jhknrOgQfdls7S/VyJvPIsFQIRKXtpK7OkRRnha
         4jjCsQfi2CpBrrSgrSrDEcBcSbc1yQkkaQd0MKCAYg9fKy/V2b7zyKNhwME0m2wAfDVT
         nmdieQxoPYL4qrbGzJPuSmnHArkPtTAyX3xT13N7mLPbR/Gi1M5PXucO1xoN6zkGv92Y
         ZPQdFZDKUDc8NSYFYkENVZ+/HMtkk2icNKudz+weWOXrp5PM2nqorlWx615l6OZ6pb8C
         Y77xXQX27jDrky50h4C/CjfhqsbHSRI9jlbL3skqLHzzLRI+8sR4Lgu3Vf5OiUYUkuFi
         PXdg==
X-Gm-Message-State: AOJu0YwZ0b+u7AltcLhqFfCgTnQKQHT2kxbLhUfxHA6m7t7cOsZgAzwm
	VyPe1I2b21eauOZI2uOULhUkONUPxw6gXFlSbglkugPUhOqmazVJkZVEnKPOMlyeVvfZSfHPC7z
	B6AgpiUPSS0d3w+2aWybSlMWIaCkf21Yf
X-Google-Smtp-Source: AGHT+IGpoltAGcq/kMhmaUoGPc9bHdIrmk8dWzOS3k94my255KkK+mj/6/IAKC0eLhZAt9Ivd/7I5h15WtJSQD52GJw=
X-Received: by 2002:a05:6870:f113:b0:23c:1f34:730 with SMTP id
 k19-20020a056870f11300b0023c1f340730mr3358229oac.49.1714579410599; Wed, 01
 May 2024 09:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240501081846.6363-1-gudnimar@noxmedical.com> <26415.1714579203790695160@lists.openembedded.org>
In-Reply-To: <26415.1714579203790695160@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 May 2024 09:03:04 -0700
Message-ID: <CAMKF1sp4r=WAXFc0J=h_2dcUxkzZ-6J5W_yJM+yzvUtn-YxeVA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twisted: remove obsolete python3-twisted-flow
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 16:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110205

On Wed, May 1, 2024 at 9:00=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> Hi, I found even more files which don't exist. Please ignore this patch.
>

Thanks for heads up. I will look for v2.

> I added locally a new QA error which will produce a warning when a non-ex=
istent file in FILES is found since manually trying to find these is just t=
ime consuming and I will miss something. This is what my QA check outputs:
>
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-news contains './usr/lib/python3.12/site-package=
s/twisted/plugins/twisted_news.py*' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-news contains './usr/lib/python3.12/site-package=
s/twisted/plugins/__pycache__/twisted_news*.pyc' but was not found. [files-=
not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-news contains './usr/lib/python3.12/site-package=
s/twisted/news' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-flow contains './usr/lib/python3.12/site-package=
s/twisted/plugins/twisted_flow.py*' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-flow contains './usr/lib/python3.12/site-package=
s/twisted/plugins/__pycache__/twisted_flow*.pyc' but was not found. [files-=
not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-flow contains './usr/lib/python3.12/site-package=
s/twisted/flow' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-pair contains './usr/lib/python3.12/site-package=
s/twisted/plugins/twisted_pair.py*' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-pair contains './usr/lib/python3.12/site-package=
s/twisted/plugins/__pycache__/twisted_pair*.pyc' but was not found.
>
> I can confirm every single one of these errors are valid and will submit =
a patch to remove them later. Perhaps it would be useful to have an officia=
l check in openembedded-core? :)
>
> My check is also producing a lot of noise, I'm not sure if these are vali=
d. I might have added my check not in a optimal location in the code. Posti=
ng it below for those interested.
>
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-src contains './usr/src/debug' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dbg contains './usr/lib/debug' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dbg contains './usr/lib/debug-static' but was no=
t found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dbg contains './usr/src/debug' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-staticdev contains './usr/lib/*.a' but was not f=
ound. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-staticdev contains './lib/*.a' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-staticdev contains './usr/lib/python3-twisted/*.=
a' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-staticdev contains './usr/lib/python3.12/site-pa=
ckages/*.a' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/include' but was not found. =
[files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './lib/lib*.so' but was not found. =
[files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/lib*.so' but was not fou=
nd. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/*.la' but was not found.=
 [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/*.o' but was not found. =
[files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/pkgconfig' but was not f=
ound. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/share/pkgconfig' but was not=
 found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/share/aclocal' but was not f=
ound. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './lib/*.o' but was not found. [fil=
es-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/python3-twisted/*.la' bu=
t was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './lib/*.la' but was not found. [fi=
les-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/cmake' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/share/cmake' but was not fou=
nd. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-dev contains './usr/lib/python3.12/site-packages=
/*.la' but was not found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-doc contains './usr/share/doc' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-doc contains './usr/share/man' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-doc contains './usr/share/info' but was not foun=
d. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-doc contains './usr/share/gtk-doc' but was not f=
ound. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-doc contains './usr/share/gnome/help' but was no=
t found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted-locale contains './usr/share/locale' but was not=
 found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/sbin/*' but was not found. [file=
s-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/libexec/*' but was not found. [f=
iles-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/lib/lib*.so.*' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './etc' but was not found. [files-not-f=
ound]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './com' but was not found. [files-not-f=
ound]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './var' but was not found. [files-not-f=
ound]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './bin/*' but was not found. [files-not=
-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './sbin/*' but was not found. [files-no=
t-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './lib/*.so.*' but was not found. [file=
s-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './lib/udev' but was not found. [files-=
not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/lib/udev' but was not found. [fi=
les-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './lib/udev' but was not found. [files-=
not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/lib/udev' but was not found. [fi=
les-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/python3-twisted' but was n=
ot found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/lib/python3-twisted/*' but was n=
ot found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/pixmaps' but was not found=
. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/applications' but was not =
found. [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/idl' but was not found. [f=
iles-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/omf' but was not found. [f=
iles-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/share/sounds' but was not found.=
 [files-not-found]
> WARNING: python3-twisted-24.3.0-r0 do_package: QA Issue: FILES variable f=
or package python3-twisted contains './usr/lib/bonobo/servers' but was not =
found.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110204): https://lists.openembedded.org/g/openembedde=
d-devel/message/110204
> Mute This Topic: https://lists.openembedded.org/mt/105837546/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

