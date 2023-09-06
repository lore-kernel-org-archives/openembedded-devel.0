Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0448FEB8FDD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 14:34:44 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.10722.1694010875279854569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 07:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WL9jX13F;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5733bcf6eb6so2025585eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694010874; x=1694615674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N9MqPtgnOPQ8czeBfP2b6dVdJfqrWQ0xEKjXoXD3+A=;
        b=WL9jX13FOZKNHToV8cA691SmZfdvumYl+97vlLX1fM3hMr4zyqCTpJ7exuH5gdiaY4
         TE12ALhh/aG1Hiv/skguET/3ASMGxxMaih8sd3pKK3QqhZJDS1S9jAvCTlM+K0t7dDIW
         LfUqAcekBANTChC/REcYqYsGlBKpMiHqpjAvsV2K1XQtwPHRxCY6HjscBndBXxmn41/+
         WWcC8PqqyJK6qE+X/sRYIpfUHVFGi0V/X20rznBgVv4nE/spc25zdcehI1a6JUdinnBL
         YdjCi2BUpe1L6t0B5bvk7a/JukRF9i/UcAQqrYKKmqJ2ncPKaB6OsXIss+7MtjfR3cmy
         2HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694010874; x=1694615674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N9MqPtgnOPQ8czeBfP2b6dVdJfqrWQ0xEKjXoXD3+A=;
        b=I//tMKCyUGeM+wcC0yOKe2W1oqKmlatmieLarzWhOrnCTD5WQdpjaOTAQ7xxWpROuP
         c+oRe+1S/rtN9azd0NFqcOAy5mjR5ruamuudAsJWitLtwNK4DFMm9/aXBSvSXJx6UM3q
         6ZoKQyzbj9OulPcfyYesDu+MCrEbQy842z2/COLpno3EFhgYpZwWb2Aa5KEQxf+9pMCa
         BJj6p2tjqMUjWBp5mOqs+ol6bmkMStB9JETAco07O+HnhUcuakiGhWemEhIqAdzr9OJO
         XO86+CMN0sNZpVBDNBbu4WcCimI5FlCLq1wzY61wGqbmr5kKmZTzZIlAsSLIGv/b8h/k
         OBjA==
X-Gm-Message-State: AOJu0YzZxXcSiPyXMH6kEXApKIg2Jbmuprrst390UuXBUn+gH7Rvk1OA
	zjTznqutvJJwbumiGk3b+wHODovfQKiWny22Vhk=
X-Google-Smtp-Source: AGHT+IHZwRB5NMYTaA9mQg1oxSJqW/aCM7xVimCLKxMwUI2Be9um+SDgSYekZijJKYoNjMWTc0XYglOZJ+zN65ZxlOU=
X-Received: by 2002:a4a:2557:0:b0:571:1fad:ebd7 with SMTP id
 v23-20020a4a2557000000b005711fadebd7mr13161530ooe.7.1694010874337; Wed, 06
 Sep 2023 07:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <0e376e4a-d827-ce01-7bab-d6dcda74ac3a@gmail.com>
In-Reply-To: <0e376e4a-d827-ce01-7bab-d6dcda74ac3a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 07:34:08 -0700
Message-ID: <CAMKF1sq9=AfOanqLfT=jE3CactugWjHcC3ggzdNf27Qb8wnY+Q@mail.gmail.com>
Subject: Re: mickledore merge request: Sept 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 14:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104780

merged. thanks Armin.

On Wed, Sep 6, 2023 at 5:02=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 41fffef6b044b2722aa13f7e7648a3f8482318=
51:
>
>    yasm: fix CVE-2023-37732 (2023-09-03 10:43:56 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 57c516973978ca2667339bf1aae7dc722b5bcac7:
>
>    tcpdump: upgrade 4.99.3 -> 4.99.4 (2023-09-05 13:40:23 -0400)
>
> ----------------------------------------------------------------
> Martin Jansa (1):
>        libiio: use main branch instead of master
>
> Soumya Sambu (1):
>        krb5: Fix CVE-2023-36054
>
> Wang Mingyu (1):
>        tcpdump: upgrade 4.99.3 -> 4.99.4
>
>   .../tcpdump/{tcpdump_4.99.3.bb =3D> tcpdump_4.99.4.bb} |  2 +-
>   meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch     | 68
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb                | 1 +
>   meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
>   4 files changed, 71 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb =3D>
> tcpdump_4.99.4.bb} (93%)
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
>

