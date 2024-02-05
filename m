Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B35C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:19:18 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.68941.1707153552953730599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VVGXjZ5I;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bfdb84c0ebso670259b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153552; x=1707758352; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9322x5ycC1Z3yMD9z1ozS6hXNktUVztkImUhYHvubI=;
        b=VVGXjZ5I/owHkAaTJn0Jp3SDV+6daGvyFfO208RI4RfIiBw1cNMBqCUzZGQUdY62TC
         eGrjvI1A0nGRw2/lcJUMDPyir7yZn0Ql/F5uIygdLqcQ7zc5sEoyq5qufAV3yhZCaDPZ
         qW/+Kz0+kMg96pMc6os1lqVpIbg3uQompY6I94zTNgDiEAXjwFmruOfcKRt3xw9h76Pn
         LFa4g5Gu4f6XuKDI4aFdDTfWklqxwoEqig1vxBIE49bJ8lWF5u1Y4aTxH0+5cIHG1zOu
         Iw9UtRz72aYt9BDxb5sh8jRH5BOpiTlJkO0tDA39fDE2u+eiQi3L5rLPKldJWg7tCv/+
         bXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153552; x=1707758352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9322x5ycC1Z3yMD9z1ozS6hXNktUVztkImUhYHvubI=;
        b=RuhIjB8f/QVZgoWOMCi8/GoD+DmA6oKDE8tlX90+RCXXwdB5AWzCK7Am/baFSSWDNI
         9m3iVQj3NLy+Pm9zoOmjvSOhBin/EDX6ToldCnF+Snm/CRfszg0vwSvdtLy49BRfs4Za
         MXT2YyRwm8f4q2l+TQIvLHKoCUdZtB83270nzogQ3vvfdNTIMlGAGnSeyhjjpVg7Encs
         G9TRe3pChBtzRZbVMNYzXF6QcSAglTKoP2exenITdCO2F5wZ2154DgUUr4/CyIcd0CG8
         8+CdX/G9Z8MRkuASgWK0wMOESCaW1n7c5dgs1hZpLCFhVwZwOXTwhKmcrHBVUhwJs1Ai
         mHEg==
X-Gm-Message-State: AOJu0YzY3Yulp2h3iRG/B93qHPqfw8rE58afB9r/H6YBrVdOfhVGEEWN
	0B+F5NTn9t/9s3fRYxBxravFgOph7VpYKpHZvEt8bVI/fQWIGxU4LXSJlsqn4KLLT6jOzMY06bu
	dsTyp7/6myFMe/4KymEsQhOVTkm0=
X-Google-Smtp-Source: AGHT+IEAEFG6JudiDHEdCoG9lQ6tQP3Fq6ML3ZF5xZrUCDiroxRfDAJ0OPchLRfQiAyFMXeTiEuUbeQMLhcf+WI8PD0=
X-Received: by 2002:a05:6871:e419:b0:219:19ed:9b2b with SMTP id
 py25-20020a056871e41900b0021919ed9b2bmr350680oac.42.1707153551937; Mon, 05
 Feb 2024 09:19:11 -0800 (PST)
MIME-Version: 1.0
References: <5ac50428-8e1c-419a-9cfd-d444d3f3e85b@gmail.com>
In-Reply-To: <5ac50428-8e1c-419a-9cfd-d444d3f3e85b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Feb 2024 09:18:45 -0800
Message-ID: <CAMKF1srb7VFUHYwomGhSeNd1soX-zakT8FS=-o7hZXrPPvkr8g@mail.gmail.com>
Subject: Re: kirkstone merge request: Feb 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 17:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108575

merged into kirkstone, thanks Armin.

On Mon, Feb 5, 2024 at 6:30=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 730e44900a0a86265bad93a16b5a5ff344a072=
66:
>
>    proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read (2024-01-12
> 07:14:16 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to ce9c0d76171ce9d07e4bcb702b750416b265562a:
>
>    strongswan: upgrade 5.9.12 -> 5.9.13 (2024-02-05 07:37:06 -0500)
>
> ----------------------------------------------------------------
> Wang Mingyu (1):
>        strongswan: upgrade 5.9.12 -> 5.9.13
>
>   meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb =3D>
> strongswan_5.9.13.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename
> meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb =3D>
> strongswan_5.9.13.bb} (99%)
>

