Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449CCCF538A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 13:41:52 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.9189.1729690906033072195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 06:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNRzMt0+;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e5d0a80db4so3501754eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729690905; x=1730295705; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pG8Rz4KAWRJkMqhzEh/inKTKu8WuM/nOtrKqwYVcvc=;
        b=nNRzMt0+2FeTJM6WPIh5df94KiLlWPFCUtLAKHoAYgs6b5QrDKuYIrx8VhabzV0TY7
         FVtKSXkx1nO+gGyGm54NSNhjxXQHOYHKBI6AxtvumS9YRVx++H9nLXto8kpkpx8hTopV
         SZe06RZwycLTDsnW0UYI3eiagxKbjV9g4Zu/PLMqgK4tlHRppj5JXNfYLePjFsuYzOvr
         zq6AEWlVLv6NeKD6R1nnO0a6fSn6vDiFa3tAD+JYCsPSQOf16OaXKtTExIh6/LrFpr5V
         J+MczPh9J7D44BbGTfBTQPZLbf/+XsoJq6+HEFaikwOtE3lDONzG2E3iBbigORgjv3SJ
         Ugug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729690905; x=1730295705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pG8Rz4KAWRJkMqhzEh/inKTKu8WuM/nOtrKqwYVcvc=;
        b=CUs1y4xAPJRFuAD0wFj2vsYYv+5EIOHsb++JS7FqHXKN4w0bVLCLAL48sZ30GBsyZT
         TfHw27KsO+PcqsJgafP/0jsuZoHwL0lyN7mt5ZUczEqcIczVygU+TyvJOndT8aPll1HC
         ff4veAjfftJ3UTGOXV0MTMgZ+cc/jVfDJVwKPyZofkWd/T15F8f7s6P2l8jtml1r/JKx
         +MkzRRUg91hqA0W/hbXPMHBkrGz6lOXOcxOWqIGrAJx5cN3VrS2SMznHpww7q1shom1i
         Os5LfJ9X3cU4MePJYREQpZYuEowrQ42rIO6pPYEEEZo0iRuKbEbNJO3Tia7fQoV3OlGt
         Yd2A==
X-Forwarded-Encrypted: i=1; AJvYcCUhBkKeDWVm6qiTGdAVTLTgbPIed0rOJxaqbdPtjjGZvWUNy0NVv+ndkdavJzpyThd4Ys7ZpFF3qmaV0+eHq6k/Vaw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywan9uqxZxHAM4Ez5Pz2xatms2yQzuFub05UDdmUw6Uv5hW50/H
	Wwx29lKmXEH/5/XZGMVzHH0qp7YOmfU3yrS2MMTHxpRDpp96upBUdGoR8ZEVCic78WNifhf2HhF
	X8xXhCQJF/E2i7VoGlCHuNcia/z4=
X-Google-Smtp-Source: AGHT+IEVUyQWZQ+cWx90OTJrmCAAeNH2VaBldl0OXTLHCLjBiKXDTgQN20c7WnouRcILRdIdKSPNg003r6RV+V/jhqc=
X-Received: by 2002:a05:6820:1625:b0:5e5:7086:ebed with SMTP id
 006d021491bc7-5ebee94c09dmr2022774eaf.7.1729690905231; Wed, 23 Oct 2024
 06:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au> <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
In-Reply-To: <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2024 06:41:18 -0700
Message-ID: <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Chanh Nguyen <chanh@os.amperecomputing.com>, 
	openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, 
	Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 13:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113151

On Wed, Oct 23, 2024 at 2:44=E2=80=AFAM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 23/10/2024 16:38, Jeremy Kerr wrote:
> > Hi Chanh,
> >> I saw my patch v3 was merged to the master branch of meta-openembedded
> >> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a9=
7467b1d7dd77b4fab537bc311e3
> >
> > Ah, neat. Khem had just mentioned that he had merged v2, not v3.
> >
> > So, all looks good here? unless there are other build failures?
>
> Yes, Khem had merged v3
> (https://patchwork.yoctoproject.org/project/oe/patch/20241018092326.21522=
23-1-chanh@os.amperecomputing.com/).
> This patch is good for me.
>
> So, I think we don't need to do anything more.

yes, I realized that the build was using an older version of patch
since some of my CI builds run over 18 hrs,
I lost track of patch versions. seems good for now.

>
> >
> > Cheers,
> >
> >
> > Jeremy
>

