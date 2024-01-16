Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD36C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 19:04:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.26185.1705431869805226627
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 11:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSB5NklU;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2055f5ad1f2so3428434fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 11:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431869; x=1706036669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ7jWlQWnS4SUPAvEk2s40in+USvKEm6lgIsh10B/g4=;
        b=FSB5NklUPrIe5sikDkskZ3g8h7DWQm6yO1f3NishuROBxOXBsCtGLNm+GucfBYnHtB
         P9Z4EqLt1ICxhj4OJsHJKCDIxcI05IL9EUZh09+Hoj7Hb8nwFbaQPFxqOWATjdgEcuBY
         4cGSLqvFuDdul/0/flpZ3MAMXFOK7cggEq5631CySp0UzUqW0VHSeIvhCP9S7f8MWY1A
         sgCfebZhCqWSfakfdnAzuZzpgmJbMwj5Iy29ZQD01zkvnb4XqopWQMuIaomf/gNC+nvw
         p4Hun62Zs9pJgYepInvmr97Uzm1vIO6y97A8S783a34Xgrclx78XHe6uYyW3TwDINhrC
         +DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431869; x=1706036669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQ7jWlQWnS4SUPAvEk2s40in+USvKEm6lgIsh10B/g4=;
        b=UzQoi75dqr3R3CS9PRH+DbUubESZ/s5YqFR+tfGkqh+hsFtQNDuecbjCyA9DmBHD/X
         o7lr8QtDFgFg+uXxd6Yxw17Cat6wwm5xKOgCVD6MJ7WdWg89YyyOA7Gwk5bULTYXxrHo
         5//4E0gWbXzER3u3MDmzZSP8gKQSZn52pH4ZBJ6Ao2u06vJbx5UOYXVvrcYYf+doXxwV
         XCc0O0gv2ZzjGp9aANq2j+uL6ridjYwsJF1OUukibV3OmhEhHVdua9BXQwMG0xIlyIMS
         +l4DQmhrPAjXGHi/OoUxNf7GSgh2WvEOD9poJsEZTGm8kGtGrJvc5cbBbvJNE61Yv0zE
         jl0g==
X-Gm-Message-State: AOJu0YyLJh3Gecq8PWr/Pr5CSZ5AWuSQtJWMvLxIOXGmBpshJ7PYGv5P
	aSrfjh3zeKqkFnswuGuGu+XwHvFAZUfamo8FbvE=
X-Google-Smtp-Source: AGHT+IECMw+cIpn/c0n0s8HlbBzY3nZ83An1zTk/gOE3/fnTKdIwT4nQu+S/KS0EPpJo7AWOjNctx0CwTd4qX7HoQG0=
X-Received: by 2002:a05:6871:a607:b0:205:c935:9378 with SMTP id
 we7-20020a056871a60700b00205c9359378mr5650461oab.68.1705431867630; Tue, 16
 Jan 2024 11:04:27 -0800 (PST)
MIME-Version: 1.0
References: <3c5ecef2-afbe-4dea-92a4-b79a0bb47a53@gmail.com>
In-Reply-To: <3c5ecef2-afbe-4dea-92a4-b79a0bb47a53@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jan 2024 11:04:01 -0800
Message-ID: <CAMKF1soPT0QJ+=Nx=eQ7kAQ93i815ayZEBp1KKoYom-w0innAw@mail.gmail.com>
Subject: Re: Dunfell merge request: Jan 16th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 19:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108309

merged now. thanks Armin

On Tue, Jan 16, 2024 at 4:34=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit fc632d5bb0936e91e4e0191547b9aa8ca47b4f=
fe:
>
>    wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka
> protocol) dissector infinite loops (2023-12-17 15:36:42 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to daa4619fe3fbf8c28f342c4a7163a84a330f7653:
>
>    postgresql: Update to 12.17 (2024-01-16 07:31:14 -0500)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (1):
>        proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read
>
> Robert Joslyn (1):
>        postgresql: Update to 12.17
>
> Vijay Anusuri (1):
>        strongswan: Backport fix for CVE-2023-41913
>
> virendra thakur (2):
>        opensc: Fix CVE-2023-40660
>        opensc: Fix CVE-2023-40661
>
>   .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 278
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb        | 1 +
>   .../recipes-support/strongswan/files/CVE-2023-41913.patch       | 46 ++=
+++
>   meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb  | 1 +
>   .../postgresql/{postgresql_12.16.bb =3D> postgresql_12.17.bb} |   2 +-
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch      | 55
> ++++++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch    | 47 ++=
+++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch    | 32 ++=
++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch    | 31 ++=
++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch    | 28 ++=
+
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch    | 30 ++=
+
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch    | 30 ++=
+
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch    | 40 ++=
++
>   meta-oe/recipes-support/opensc/opensc_0.20.0.bb                 | 8 +
>   14 files changed, 628 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
>   create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_12.16.bb =3D>
> postgresql_12.17.bb} (73%)
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch
>

