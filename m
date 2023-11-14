Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C16FC47DA7
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:56:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.1463.1700006212883760632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6ka7fT3;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso3928674fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 15:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700006212; x=1700611012; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQWdi9UfX/f4YpqHr6f2v1N+bkwEFWUViMMJdY5EjlU=;
        b=H6ka7fT3YuyZ0GTG62WSg4gnyu0+UWNmJcy9jcQWstkRQAjfuJqYxw+HFeu1i/pxeI
         tyHcWosBYNrLB/AWh3cmjxL78ke/GTRjajRNOPMsn+v+KGI9cyzg7qcTcxhzdoyNT3Vf
         bI2/l+FJtw5EiF5/a8jc2bF9sMVREwdF17xp2++K08qm+nLe+KgX2F1oMIQ/eFsqpcGA
         wkmsmSR0ijRgeiRIlZBJexpJAbZb1/r+ls5YfuebkpTS9l4/rPigcmsHznODtGP3iGeW
         tEov9YHMFHDMhwFmGNLlcTiaHAZ7S1dNIcADFWhLqNL6ct1P2LLKY1iyPVptoblMh6Gp
         LPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006212; x=1700611012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQWdi9UfX/f4YpqHr6f2v1N+bkwEFWUViMMJdY5EjlU=;
        b=pVbTgkXW0ttQkICrytFasEPQ4zdKCs11TW/UDlYmYAJZa/GZ3UQcp3VoL+tsP2ATZT
         HeG3JOCAh8VI6jAbP7MAdN4axz/vbfMYoOAML0RZJTQMhXi2EtuYJCzw0/aiAljS+ZjX
         Kel2dm3RwbDHJ6xm7ojTrSm7d81QimkW28Z/thHteYMaJpwhLYf8uI0KmRxegJdRKHZ9
         QTN+mvsWHPH2B+cYjgvohY2wB5Z9QbYGTWOrMP5PaC5eaGL4yOjti5zqGAHNviVhvzK6
         SLQ1/TVZzuK08cfBCU9WYNgvHAaUW6TSAsd6XJYPlQJP7s++o5LitZmnm5k/em+IVkQo
         gmYw==
X-Gm-Message-State: AOJu0YyJ9zFSvTBqfKdbDO7uSh3VM5P4c+L6u2errdipmenqyLJaHwnA
	6X0gvk5cn5o4H67W004NRrRMeKxDpsI+zFz0CaPcRKxcMp0=
X-Google-Smtp-Source: AGHT+IGGp4dcUiXZbR2oLEjVPjjdOGXeXa/tXVMV1lSuBgWPrlF/gqKR4clfWErU6wluvEQee2Zo1B+fguicvGdZnLo=
X-Received: by 2002:a05:6871:5c8:b0:1ea:746d:16f7 with SMTP id
 v8-20020a05687105c800b001ea746d16f7mr14882183oan.6.1700006212180; Tue, 14 Nov
 2023 15:56:52 -0800 (PST)
MIME-Version: 1.0
References: <5df64760-584e-4980-b07c-57fb6a330fc6@gmail.com>
In-Reply-To: <5df64760-584e-4980-b07c-57fb6a330fc6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 15:56:25 -0800
Message-ID: <CAMKF1sp7mf_danpwHeCGwkp2OBJ0xntowdcfPT-vaLTT+3Fhng@mail.gmail.com>
Subject: Re: dunfell merge request: Nov 14th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106729

merged thanks Armin.

On Tue, Nov 14, 2023 at 3:16=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 300be975359fdb3a3b2bf7c6fe15dea7acac57=
5d:
>
>    libssh2: Backport fix for CVE-2020-22218 (2023-10-21 16:31:35 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 9135c7ea7350d5d241f4afc3b28087122ebe2d19:
>
>    glmark2: fix compatibility with python-3.11 (2023-11-12 10:42:03 -0500=
)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (1):
>        wireshark: Fix CVE-2023-3649
>
> Khem Raj (1):
>        ibus: Swith to use main branch instead of master
>
> Martin Jansa (2):
>        libiio: use main branch instead of master
>        glmark2: fix compatibility with python-3.11
>
> Richard Purdie (1):
>        grubby: Update branchname to match upstream
>
>   meta-gnome/recipes-support/ibus/ibus.inc                        | 2 +-
>   meta-initramfs/recipes-devtools/grubby/grubby_git.bb            | 2 +-
>   .../recipes-support/wireshark/files/CVE-2023-3649.patch         | 231
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 1 +
>   .../files/0001-waflib-fix-compatibility-with-python-3.11.patch  | 76
> +++++++++
>   meta-oe/recipes-benchmark/glmark2/glmark2_git.bb                | 5 +-
>   meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
>   7 files changed, 314 insertions(+), 5 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch
>   create mode 100644
> meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-wit=
h-python-3.11.patch
>

