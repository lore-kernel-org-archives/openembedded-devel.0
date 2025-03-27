Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20797C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:57:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.294.1743116241140062010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lZvUEXAK;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so8452545e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 15:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743116239; x=1743721039; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQQzYdIHxR41uTu3HnU5CdmJWjyPJjejb+fNGhiCKpE=;
        b=lZvUEXAKtZ86jv4NNlqH5pg6kDTrefRx5jcH4NFI6Av5DdQMjCq7fpzQFA0pQHhkFk
         QXVcJEaPU+BseCn1Ah+iibLn571xEKHGVWKuSwKoKgIUfpADGq8O0DNqpmyGXATgEH3F
         pJCTbXSokfIsQhfGTw/LANiXv/VlTSTVb8WSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743116239; x=1743721039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQQzYdIHxR41uTu3HnU5CdmJWjyPJjejb+fNGhiCKpE=;
        b=tkbBjLaHEUHlq0FaaRg7bt+r/rSt+zzfQBXRLW83aS8JNI4DLeNVZFTvepYA38v794
         no44cHtNq3FNbk7Erde5zyzX0L9kU7o6ze5dHxFKN5JklbOsMCCczjXW/zxLNQsX9sb7
         ILlAqxr8Ydjh3ycS8LLkuDWSuy1CUBmljOFvt8CjEoYEDaCw8+A7Ww+Vz/OyXVoI/pQw
         Z2iCkk7OzrSDfk82QFkHsG6m/EqhuZ9LSqWIYVTnAzeziP+Po1Ag+GyWebLDTpFlYuZZ
         y6EMFZEPzpq/s+z9LdBcPIYEiZ/v0Y/si/ycAO7ioN5ARhZycy2sMy6kP6E1kubAzLrK
         mKHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZIJHomIodtxDFik1e0crN5PdQ9A7xHiIEwx+Gdndi3P6L10r/GuMIgfBv2OrhMcCPPcp3L/+iwWasbTrSGST5abI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVZXgzvZwnXkv3rybeq59yz7u0bUwULMyyr2HHIohc6qbqTYIM
	yQsgYFVegUBo+Dk4cNXgIwHGxdgz9ORH9qAweCUaPk41LRtAUxJ3JtrgCCw8spuqQcYJXbA0s/L
	24mQI+h4SGXNDH5I9sVNQfiWi9VHaaGZRQ9XKwQ==
X-Gm-Gg: ASbGncsS7DTI1uGxUSCo0XAvdGoN8ZBZZnq732fp2esRiy77IM4iWgA0SMRlPIALnO9
	RD9Ev6+H6Ha1pQTfldJdMGoBh+BZcmIasEksB9fGtIWYoE37B6Um5qVf+Wdm0UssHxs2NECackK
	rtCvs2HHt6C9rpkffpKhtsZsKcbX1NoOVp3qfl2cyw4DTWb6orObnMKfEhcXVG2/tKw5uIow==
X-Google-Smtp-Source: AGHT+IHPCcX897N87LH2vO8vXVetXTysgt1kY/QZ1k23z9lq7B7trBUSJbDK573EopYA2/sbFO0ApSOssGur32udsNo=
X-Received: by 2002:a05:600c:1e08:b0:43d:16a0:d82c with SMTP id
 5b1f17b1804b1-43d8d5b0111mr31060285e9.2.1743116239180; Thu, 27 Mar 2025
 15:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <952235ba-b7ee-4ba7-831f-3a679c900cf3@gmail.com> <CAMKF1spz4vz10bCmMjfdXmVexFahFCC_2yhrR+O5-FRv8pAHdQ@mail.gmail.com>
In-Reply-To: <CAMKF1spz4vz10bCmMjfdXmVexFahFCC_2yhrR+O5-FRv8pAHdQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 27 Mar 2025 23:56:52 +0100
X-Gm-Features: AQ5f1JoNflGQN70bKIdui6MW0alq25zqv6T3c-zZmzdwr75HSFerqi6D2rgu05U
Message-ID: <CAMSfU+7vHy-t3cFUPMw__SWEacku0uOkmF0JGb0CvLifJVNoDQ@mail.gmail.com>
Subject: Re: [oe] scarthgap merge request: March 23rd
To: raj.khem@gmail.com
Cc: akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 22:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116332

Hello Armin,

I feel like you lost those 2 patches for wolfssl on scarthgap:
[meta-networking][scarthgap][PATCH 1/2] Wolfssl: add ptest
https://lists.openembedded.org/g/openembedded-devel/message/115831
[meta-networking][scarthgap][PATCH 2/2] wolfssl: Upgrade 5.7.0 -&gt; 5.7.2
https://lists.openembedded.org/g/openembedded-devel/message/115832

Alternatively, we could backport
https://git.openembedded.org/meta-openembedded/commit/?id=3De23eaf27d83963e=
8d82411d96f6817fc970fd89f
only (just the upgrade)

That would fix the CVE-2024-5991 from
https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/

Thanks!

Le dim. 23 mars 2025 =C3=A0 20:14, Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> merged thanks Armin
>
> On Sun, Mar 23, 2025 at 12:06=E2=80=AFPM akuster808 <akuster808@gmail.com=
> wrote:
> >
> > The following changes since commit 6c9f1f8d4538119803bf793747b65e4d23c3=
3544:
> >
> >    nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/meta-openembedded scarthgap-next
> >
> > for you to fetch changes up to edd1a1e284fdcb80cd48d411f235d47f23bc27ae=
:
> >
> >    mongodb: fix build with python 3.12 (2025-03-07 19:40:51 -0500)
> >
> > ----------------------------------------------------------------
> > Awais Belal (1):
> >        mongodb: fix build with python 3.12
> >
> > Peter Marko (1):
> >        libmodbus: patch CVE-2024-10918
> >
> > Virendra Thakur (1):
> >        unbound: Fix CVE-2024-8508
> >
> >   .../recipes-support/unbound/unbound/CVE-2024-8508.patch         | 247
> > ++++++++++++++++++++++++++++
> >   meta-networking/recipes-support/unbound/unbound_1.19.3.bb       | 4 +=
-
> >   .../0001-moduleconfig.py-python-3.12-compatibility.patch        | 57
> > +++++++
> >   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 3 +=
-
> >   .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 177
> > ++++++++++++++++++++
> >   .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 121
> > ++++++++++++++
> >   .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 84
> > ++++++++++
> >   .../libmodbus/libmodbus/CVE-2024-10918-04.patch                 | 239
> > +++++++++++++++++++++++++++
> >   meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 8 +=
-
> >   9 files changed, 936 insertions(+), 4 deletions(-)
> >   create mode 100644
> > meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
> >   create mode 100644
> > meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-mod=
uleconfig.py-python-3.12-compatibility.patch
> >   create mode 100644
> > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
> >   create mode 100644
> > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
> >   create mode 100644
> > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
> >   create mode 100644
> > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116204): https://lists.openembedded.org/g/openembedde=
d-devel/message/116204
> Mute This Topic: https://lists.openembedded.org/mt/111864517/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

