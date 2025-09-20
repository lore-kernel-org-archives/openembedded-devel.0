Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D690CAC592
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 00:06:59 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.210.1758326810367977472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 17:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvyIoU8N;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d60504788so19945507b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758326809; x=1758931609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmGidWGtcp7a9OS/g3KtM8obH4RMVwAfTvFbmcRooiw=;
        b=HvyIoU8Nl3rvAaWU+BzZm7ymMvcBAlimnvvOzyHEwykb8DvxqijiMP/zGmKlbx+dcF
         vSrkOjGhJPpovxZKKwsp228myM/mI1eevi6sj3uM3CexvXRXKVG3eB+bhAj3wWvExfVO
         PrI04cmhIwqO2GmhRSqnSB5+pgBLjLI4ETd/YxRbwB7c6VJynivclGTpsEwOjZCEyGEu
         SeFzEWiqov3SOnbKebUw6GaMgMbJcvUeyw+DwZhNOWrwCKLTC4EtGCCVFi07rpBK8ztB
         LYmFfP4Uv8gApFhA+vlb+nD9wMgbkR5mQsQtlzgJ7HU/mh3jOSAHV3Be4YrfVMPHHVsG
         iBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758326809; x=1758931609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmGidWGtcp7a9OS/g3KtM8obH4RMVwAfTvFbmcRooiw=;
        b=Wy8mo8OmnvBBRpT6tfBduU/JqzzCjNib2atOJsGI0WC2Ydektt0eX3XZrmovV61b1G
         2NhqILwLxdHW1OxT+5vpHRT4tT3ML3/OnAgj9+WvoVQem5qIhVp3nPrXSMpjRl6mDTsm
         72OnTXjZ34b1bbQJZYl5kHO51AhMKYmH8QpS3Tah7VWGAmAkni7T8a2vp77eEhw/qLUJ
         rpgxyq09uULBrKEMMIHKhmtJeuJ8n/g9ePJ9qulFKpmFBCWq4lqvJq7PzNlPY2fdwBs7
         yn1Po43xvfIm6xNvrX2IYNAPG8TrwXLUr040Vr2pSUC3FJvEjDvxx/cWnLtta3xNRJ0m
         KQBg==
X-Gm-Message-State: AOJu0YwWfUsxpB76kdCgJQNKze4SMTIj4HIzCkIdjY/0AFkjD/rnck4G
	WUmZ4raVRjTJOKuf6zmw24V9PFEl1DATwcK892w9PGlTgCz4B9w7TYZQvJy4VTLI5oyeN+kEcWE
	3XoLWXT2ndw8608TRdnV1+kCzcGKsAuxuPs6T
X-Gm-Gg: ASbGncu10L4ctnqnSylXa2upGeHiL2kVrPIUpWrySUU9ASXITwVLFSC/LD63Li/IU0S
	toZgNN40wObPdSJeewRDgZ8dfoOH6pN+7H+ni09hasqAua9422yj/AMZ+o4q0PsQ2qt25T7F+EF
	mOXAvr5obN6H2NEV+Nxk4wdvRtCHckaMHV35vSG+bf1H2PWZKRxSqu9mpKnaYVvnEpTl7+ef7yU
	uOiJGGsjdqhi1b1rkAxd4f96koPV2buMFZf5vgTtFFlWGoIy2GAVdYJIDwDV7gkwsyKB6rzb/bv
	jXo0Z53jdVELkxxIfQmR9JSYoPCqnyb0UiB8OTcjE+BWsgPDe5g7PZJJgg==
X-Google-Smtp-Source: AGHT+IEUlSTYmQAVvYS9KM5wKj8lT7Jpn55RqMHrFBkFlJ2sV4Ob9ZwCTyXq1y76bS9ArsYi8UiTcn/K7y3SnQTR52Q=
X-Received: by 2002:a05:690c:338f:b0:726:d4ee:398f with SMTP id
 00721157ae682-73d2507bca7mr49684737b3.12.1758326809423; Fri, 19 Sep 2025
 17:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqJm2aZsrinVihyfHnZ74D1JznhzhGYqanZkwobLJBZpA@mail.gmail.com>
 <19647.1758326463539423995@lists.openembedded.org>
In-Reply-To: <19647.1758326463539423995@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Sep 2025 17:06:23 -0700
X-Gm-Features: AS18NWB9OVACCm43IzY3HI9FLaegLrRJ72_oEJjCySU5ecJGGkU02GUdJCyvETI
Message-ID: <CAMKF1sooDdp6V4HgO5hvfQ2eMA=z205Hr7WH5pQW4Z2kzDRtaQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-propcache: support reproducible
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 00:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119616

Thanks, but there is a problem with the original patch so resend the
series when done.

On Fri, Sep 19, 2025 at 5:01=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> On Fri, Sep 19, 2025 at 12:25 PM, Khem Raj wrote:
>
> +SRC_URI +=3D " \
> + file://0001-build-wheel-in-place.patch \
> +"
>
> This patch file is missing
>
> The patch locates in meta-python/recipes-devtools/python/files/0001-build=
-wheel-in-place.patch
>
> which shared with [meta-python][PATCH 2/4] python3-frozenlist: support re=
producible [1]
>
> [1] https://lists.openembedded.org/g/openembedded-devel/message/119531?p=
=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Csupport+reproducible%2C20%2C2%=
2C0%2C115306109
>
> //Hongxu
>
> +
> DEPENDS +=3D " \
> python3-expandvars-native \
> "
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119613): https://lists.openembedded.org/g/openembedde=
d-devel/message/119613
> Mute This Topic: https://lists.openembedded.org/mt/115306111/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

