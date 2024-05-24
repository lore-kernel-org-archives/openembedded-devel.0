Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0BFC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:38:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.1622.1716572272119391702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hU0CcoYW;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6269885572so186316866b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572270; x=1717177070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0S6pmSKtyiorck/vZf6UxFz7tEXAYhgDDMfL/JDvfo=;
        b=hU0CcoYW1qIZvzWvowsjeDbNTqVBGolSTIA9cC1kzZclENEIzyM4Tr91ot3imWph5S
         8Li3ozLZoUObPTZyGW0/ene+gOIcTVmIzsaOZuC6JOx7u5evNOId8QgP9Cs6YdrnmrsD
         hsAoGMNCz46/R7N54nV0AyBllTKrcfrJp61MfIpjho/Y9JY8wZJ2VPEcaqS55GZ77pb9
         PY4zU1PDrRl+FJIg7qUnLhnSJFfWxrYDBw8luAk0DQpOMZDSzqKB94n8g3wC31TlqoNC
         l2XcLbqc6svsmLuITSCLwv01nrcrtxd5xVgWbpK+E+c18Nyj+YmQQWEPioiNp9VLMWIT
         DHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572270; x=1717177070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0S6pmSKtyiorck/vZf6UxFz7tEXAYhgDDMfL/JDvfo=;
        b=kHs76foSWxAQFSXOFhyM5GjH5vd+4SQXH+QeFnuz/CQNhmj/ef/n4vKRQF5lhuTqGi
         LK0mOMAjxbeRpmJFfpNelEPIWtJXdtXqRRB6VrSy9HS8l3orspeg8CoP59cbxo7bpoB2
         oxPac/kstel59loLKn/KUnyonngtU3gte6yVN+PP2zEiWBIdXp+6MEbiOCAbeZHU3FV5
         Kk9t0q4Z4QCS+5D6K4E5SXhy8MeEYWoXnRIw1qgsF3y32l5woTEh1kUsE1TySiuZV5xJ
         R9oanLTtefFqrqUb+ATUrvfJ79JJUqqtb3bKVee50SmxdpX4koNKj40eOrzD/g6KSASP
         jlsA==
X-Gm-Message-State: AOJu0YxU2n2+vyTC0dFr2JnLFhk3G24lWu81Fzy5fvZWI6N+9/jhW3Qw
	9EQNfjTYP8Hk0BCirQL0O4+UI14Psa0Qa0Vx5Pq3juq6X4dZaF4BElQDwO/QIt67A4c0gnqYli/
	tqwkT5tEzWIkjYdm+CsQKDWRf/hY=
X-Google-Smtp-Source: AGHT+IHMHJ1Bo7LijZ7SK/rmL3ze+GYDnSEJzi7LV1gP3ocrdZSuxMiIuZOJvxF9VA0IjFRYX26GQ9l4L5DTCSYsl44=
X-Received: by 2002:a17:906:4716:b0:a5a:1b61:e970 with SMTP id
 a640c23a62f3a-a6261f91b52mr261612766b.15.1716572270152; Fri, 24 May 2024
 10:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org> <CAMKF1srWqFVcpqSemnOBF1yrHnV2Mr3tfGHpWH=c8YyYu-V-zQ@mail.gmail.com>
In-Reply-To: <CAMKF1srWqFVcpqSemnOBF1yrHnV2Mr3tfGHpWH=c8YyYu-V-zQ@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 24 May 2024 20:37:38 +0300
Message-ID: <CALT56yM5y0LoPiGAYnV0kwxzb2XuQB+ZnPzkf6SDwWOZjqZn7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-tools: fix building with GCC 14
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110516

On Fri, 24 May 2024 at 20:34, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, May 24, 2024 at 4:57=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > libstdc++ in GCC 14 has dropped several nested includes. Include the
> > <algorithms> header to fix build error:
> >
> > system/core/fs_mgr/liblp/utility.cpp: In function 'bool android::fs_mgr=
::UpdateMetadataForInPlaceSnapshot(LpMetadata*, uint32_t, uint32_t)':
> > system/core/fs_mgr/liblp/utility.cpp:264:28: error: no matching functio=
n for call to 'find(std::vector<LpMetadataPartitionGroup*>::iterator, std::=
vector<LpMetadataPartitionGroup*>::iterator, __gnu_cxx::__alloc_traits<std:=
:allocator<LpMetadataPartitionGroup>, LpMetadataPartitionGroup>::value_type=
*)'
> >   264 |         auto it =3D std::find(new_group_ptrs.begin(), new_group=
_ptrs.end(),
> >       |                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> >   265 |                             &metadata->groups[partition.group_i=
ndex]);
> >       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../0001-liblp-fix-building-with-GCC-14.patch | 26 +++++++++++++++++++
> >  .../android-tools/android-tools_29.0.6.r14.bb |  1 +
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
> >
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/dynami=
c-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix=
-building-with-GCC-14.patch
> > new file mode 100644
> > index 000000000000..ccd289c81ba9
> > --- /dev/null
> > +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools/0001-liblp-fix-building-with-GCC-14.patch
> > @@ -0,0 +1,26 @@
> > +From 9f4d839847666019cadf57aa34fd366801c11a44 Mon Sep 17 00:00:00 2001
> > +From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +Date: Fri, 24 May 2024 14:13:35 +0300
> > +Subject: [PATCH] liblp: fix building with GCC 14
> > +
> > +Upstream-Status: Pending
>
> This is worth upstreaming.

I'll see what can be done, but no promises with  AOSP.

>
> > +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +---



--=20
With best wishes
Dmitry

