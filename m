Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B06E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 18:24:01 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.1345.1736187839803818318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 10:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3Ka1XCt;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f304ac59b9so6342761eaf.0;
        Mon, 06 Jan 2025 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736187839; x=1736792639; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6jbC+1eg7DQeawFWvHD5zz89TGmWBjCF9XDgMURl2o=;
        b=R3Ka1XCtkjKS/Vik7Aeu1axjLMLmg3BuVNLZ/8lOU4nzF2pq3uAjdGVCCvqZeVgHSl
         Tm+ifKg/WV4YYjwGnPCYHBLDyuM7bJ6cayic+6ZZXnzQfdtaSjuGwCdvxNDvlqdm9sIR
         KJ9DDmlQi+raO/8904fjsv5KXDll9JK+GUezOnoaQ6qp5ytIsJX1Lreh4iv3fgxJtaw6
         yKmRcYFnkE/liRhBbBCZyqtzrQ4P2FFUSdGu5n/1/WlF8KEiOZ36jwBl3XGuw2jc1E0N
         cjFFKr+QttXjlo3d4cXGMYDY3Bs+DxGDxT3sPwV/+42/fBFLXGstJxQzkGziacaIQb+F
         LTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736187839; x=1736792639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6jbC+1eg7DQeawFWvHD5zz89TGmWBjCF9XDgMURl2o=;
        b=TWSSZLSf8+vLpMNY8XtYM5L6Ug3O+E8o+Fa5lTQui6/6E46mGHfcZTHpg5GGWwPpP2
         jXZeTDx3AGTs6YfXznDQXolr3D08LPAz+VkWWvhTm/qZ43iYQdfSk7u82t81kwRJ4IEk
         zdGtwxWAePVCFK46mRFRYLQQDZFr7WmmOO/1x2H8JPS2xDReOelfVWvGiORik/xI9Dfl
         FT9sEnFMGc7syLkkrhkf23FHr3tYkmhLYplh9EbX7oLtrxn/m9bVXHWRbGqRLPnCQQY8
         eVH3yVdQSCUy5h4gjsRtPJx3TXmLKYLjyMiDNZfZGrWQNG7wHsZFd8sxa5RSjsZeZ8kA
         RtCA==
X-Forwarded-Encrypted: i=1; AJvYcCUfZJuDRxyZe+5T3kfNE6iuACuC9Pgl9Ff+aSFNlelm5do6uq1O73DRhjmd5+nPggbPRjf3YinhvehLSufBxPE7Jo4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrUjg1zcDkIrcLg3+32TdSTAVcGipdVuDoC+o2FS+HyeXDZ8l7
	eSS7geTRMxnwKfOkvtDZNJfbPi22NX1A1IZNiQwd66GKFTjEIoVpSAkoy7YJYHk38mSK7CVRn/L
	PgTb4f2XOozTkWLhO/GRFU1x6WV2CGw==
X-Gm-Gg: ASbGncsVMFLND5cgq2ujdCUHt31TbrMfMyH4SJnEcLQoCv9R+vS0h9EmW71BzN3w7GM
	2/CHpuziX/zXHkIYwXoKofs6IaAqX8KkykZrrPPx6rQqOmhtXibVm5dg3Tjsbi5EQ/g==
X-Google-Smtp-Source: AGHT+IEmql8OOswFegojwUPw23v0IngKI1zqXJ04TCrCl7IhYu83GsW8qMxmGgxY8xt8h4LwWpEiKURgPV8qNzHZaC0=
X-Received: by 2002:a05:6871:a10f:b0:29e:362b:2148 with SMTP id
 586e51a60fabf-2a7fb162ccemr43489924fac.19.1736187839024; Mon, 06 Jan 2025
 10:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20250105181653.364883-1-f_l_k@t-online.de> <CAMKF1so=cPOWjf7GOHL2LhR0OD_3dC5Yute1gL5nWt9gyJ=C3Q@mail.gmail.com>
 <YTDOPS.20WRIKFYPCWR@t-online.de>
In-Reply-To: <YTDOPS.20WRIKFYPCWR@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jan 2025 10:23:33 -0800
Message-ID: <CAMKF1srkzyi31HcrKsu3a=FTGZz7w_-KB=zL8oAsHprV31982Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libheif: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 18:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114670

On Mon, Jan 6, 2025 at 8:29=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> On Mon, Jan 6 2025 at 07:24:30 -08:00:00, Khem Raj via lists.openembedded=
.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> it fails layer compat check see
>
>
>
> x265 is restricted to x86 systems.
> I would recommend to drop the restriction. For example it also builds for=
 qemuarm
>
>
> In addition the libheif.bb lacks an entry for LICENSE_FLAGS_ACCEPTED =3D =
"commercial"
>
>
> openh264 and libde265 are not added as RDEPENDS in:
>  https://github.com/openembedded/meta-openembedded/blob/master/meta-multi=
media/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
>
> Is there a reason, why they are not added as RDEPENDS by default? If so I=
'll move the libheif recipe to my personal layer
> If it's ok to add them, I'll send a v2 trying to fix the issues

Adding might be fine in a v2 perhaps they did not build for non x86
and non aarch64 architectures. Things might have changed with time
so enabling it for other architectures as well might be worth trying.

>

