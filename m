Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A67ACE8E66
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:36:07 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.12465.1729769761200058209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHMx6+xw;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5e5b5715607so448823eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769760; x=1730374560; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TM2aCbDkSYo4kJZTMuqSYT5mZqrGUREmDQHIcJWoukM=;
        b=WHMx6+xw9a4lVGgiph4PzUPVIW8Gp1jyMZuYnrZkTBXlmfLvhLR71WAnUVmpprrWqf
         Od0doO/fFbU7XfLOd4AtD+Hr/yT/F2QTHGiLvW9dlA982f3p/JWIG5gzwwp/ptceyYSd
         44L2rZbaEvmDZWYtxG+qf/kgCkTAgh1k40yKoArPK2AsWJitcIO8/k8kB1hXPl6BCq+8
         1Hx5M0eENUGnkV97DA+J8wfksDzIFNcPEowxb7Kpoe+Km+8A8UGfDyCebldreMJB5lW5
         JYnTKpDrjQDJOKFovMKXAb43kneu9x3PsiRMgd0At3Vrbj48BzxCWGhubLA/C0hIunL8
         4d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769760; x=1730374560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM2aCbDkSYo4kJZTMuqSYT5mZqrGUREmDQHIcJWoukM=;
        b=L+/2EXl82DkuJxrcfDcqTmC9jnRMPhRJDSpJzDsfqqJ23+R15aLYBZrSzkFcbLQPXz
         yrUFUH+zRpt7suL97UZkGbqsWY8hC1AnslD2l728U7XUu3RorYMKfVUBvhnDyuVnpL5o
         T5WaQxthFZTQpcP25hrFv7r2Rw2nz9t5tf/bABQA8TyPLVbO/knYQ/yQVI4TI/WoGxOI
         RFwPM/gHwTcyEfPnkzmo5irP6rojjN/MfNvmfbMl+ehKB3Vbg67tqwpixYNv2+xLuFWF
         uz815lAYGaxxHyD8qqByYrTiSLlnzgBRJXDDjWUI6TgO3yucic6Ma/xNaCl/b2cMx1xv
         GcUw==
X-Forwarded-Encrypted: i=1; AJvYcCUeFDZGTB37t9oZGh0zBm0SS1Q0RJAuFnuAYT6hw0MkKUaWaeBo3y2ftv6PWkYOsP4dObckZrDS50gwlFSjGpndezI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOjDCK0d4lLSuiibqsX7q6rjL/6h3tJIIBG1YdtFhsnAkJEPFY
	aRM7e4B/MPlwbDU1B+J5q4+9eV1oYxfJmpWhseQElpHDhhJS+omMTUyvPceU2tBrj4Fi4382Ylf
	tXcVSOSStFRA5tWx+Bpka6C98iCk=
X-Google-Smtp-Source: AGHT+IGhEkjwhk/Pxa6hR5n3Mr16O7aqJGwRwMblMxeIlJtxRr89UWdi7CpDLW1GCDnr4RQA+w4N2EqhYhQdztwBdS8=
X-Received: by 2002:a05:6820:61e:b0:5dc:99d3:d3bc with SMTP id
 006d021491bc7-5ec05a84a28mr871410eaf.3.1729769760245; Thu, 24 Oct 2024
 04:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
 <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com>
 <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
 <CAMKF1soiY46pbuUF0tKYBdVh=NzP2BG0wp3+TssTwZ1LYa-jKA@mail.gmail.com> <3c4cb581f42351870fb443e10899909f657c00ba.camel@codeconstruct.com.au>
In-Reply-To: <3c4cb581f42351870fb443e10899909f657c00ba.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 04:35:33 -0700
Message-ID: <CAMKF1so=d_bRbB6wyfgzpPMYFH4pBJSjKY5-8Zf2YQSuAfq9Lg@mail.gmail.com>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, 
	Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 11:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113165

On Wed, Oct 23, 2024 at 8:29=E2=80=AFPM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Khem,
> > There is a new build failure seen with musl+clang
> >
> > https://gist.github.com/kraj/cf85e1d301b557c791ecb410f58298ec
>
> Ah neat, thanks. I've added a couple of fixes, but currently untested
> for the musl build:
>
>    https://github.com/CodeConstruct/mctp/compare/main...dev/cross-fixes
>
> Chanh / Khem: if these look okay, I can merge to main.
>

these changes look good to me

> Cheers,
>
>
> Jeremy
>

