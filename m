Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F99C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:32:12 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.4887.1750447926015601471
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ezdX9spS;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e3980757bso19118517b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750447925; x=1751052725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmIezV49zyuLdcRBJOdy9KaP1dUhcYLzhX/jFHzA7qM=;
        b=ezdX9spSkmw/pj1XXUdM2aAnSBnlolL1QgQReLXr/SY33ZQ0lYojGMEAOfwagvmKfB
         kxdufZcWp9VNyx5Sn5pBd4uezqVoDDX5cBgrQFSJ64L1sa8kSqmQ6jxsuZcDTCJYtv2w
         sGSFJ/cJb8tNeu37AaP6B1M5vPwm9UhpF5HI8VL0f8lsCSSijhMS8o9AM0Y28PwHhQjA
         qkhAbC8Zi2D7Ax2DS/JWhrYogugc40u6AkAA1U3ySQYz+LKJ4wEJ4yEMll2AGyvssn3p
         6VFN1MzQNi+TPIGLSe2KORf1WIF4xz1ZxYvK5ec/BOeWe3vThfgAvi6w4UPzccX+Tv9C
         YdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750447925; x=1751052725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmIezV49zyuLdcRBJOdy9KaP1dUhcYLzhX/jFHzA7qM=;
        b=rmP5UkYSAl4GVlX/3agDpdeTsE2iD3yK2l8mdSF+G/tpEQv0GOte4b2tr4ugreozec
         0UgtblO+TbGYnBSLFO/7laTlIJusmM3ui9jrp21mi9m/Vg+C4/Tva2LOHmKBP+BClZP3
         TYu6YPcLj8MoS73C5aG3VS4uu9b86KbwcXizp26xh5vJaNdnTXMeR28rsQ2sGwDP9uYU
         R6UtYNjdxmG/F7SwNO66DvS5S2PHbJgiMmXfoP1BjEZp7nOFaXYegsgTBnUeyi2MpPX1
         VuBFhOe0E1frt5PXAsmabyzeNtyy7gsfB8ocGnuBe/c5FRLzaYbtLr9PhEsjyv+netmB
         2MRg==
X-Gm-Message-State: AOJu0YwVGg3bQwnr3sbZjS9GgSJwc7iTR5i3qhkuCbSM5i6zNaSRSRfM
	6hFfVHhpeFtLKQ38EFB02iYtN6Kzjton65o4kiaIyBu9NYL+eoV4yXTAWhywtnAa+BHN5AFFdrX
	WsllVeAupN1wyuW8ySPc1EhXBI3BA7NF+ZDdi
X-Gm-Gg: ASbGncvsVFZFPP90TriUWHzoORi38h8h3YWCcovQTpDeRdkF1cPaT0wAV/jXeLyKqPU
	qzVFHy/bu+rBO+Uyf/UMABQE+JuGk/Nku1MAP17TCKrzNgxe7GyKc0fESi4WVhD0cfGpI9EpsB8
	+8jXzu5+6jXDSa7cIvsfcwDB0roF/t0dqNkWCXTSuO2Q==
X-Google-Smtp-Source: AGHT+IEynhYqlLAd1S4s/EScAnlg6G9rhuPvEaOjUT4K8sKIFArEv9RBuuXdPjsWsdLfI761WDxjm7fYV70/KAp0I9I=
X-Received: by 2002:a05:690c:7105:b0:712:ca60:c5fd with SMTP id
 00721157ae682-712ca60e3d4mr45185917b3.1.1750447925030; Fri, 20 Jun 2025
 12:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250620101405.2455812-1-richard.purdie@linuxfoundation.org>
 <CAMKF1soTE4VvLTHRcAVDkby4UnM2v18hojkie3RQY_zuwgZTPg@mail.gmail.com> <129c0dd0a015e07194ddc629f4b116fc99b68a4b.camel@linuxfoundation.org>
In-Reply-To: <129c0dd0a015e07194ddc629f4b116fc99b68a4b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jun 2025 12:31:38 -0700
X-Gm-Features: AX0GCFtroFRahJkUQQcQvObmMnA8mgZkWboJbNCm82IThvRGR1KNJL-sp6QGsiI
Message-ID: <CAMKF1srM8E291sQfU-8bCqmO47zWVwSTY9e5ziyErcuCw=sUSA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [PATCH] suitesparse: Update after
 toolchain selection changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 19:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117986

On Fri, Jun 20, 2025 at 10:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2025-06-20 at 10:38 -0700, Khem Raj wrote:
> > This one looks better than other proposals for this recipe so far,
> > but I am not able to apply it, would be good to rebase it on master-
> > next
> > and resend
>
> I've resent a version where you can drop the patch in master-next and
> then apply that one.
>

Right, it did not apply after dropping that, but thanks for v2, that works.

> Cheers,
>
> Richard

