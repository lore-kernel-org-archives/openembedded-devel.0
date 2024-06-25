Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC03BC3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:55:49 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.177015.1719330941989959359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkOIUD1l;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25cb3f1765bso2972629fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719330941; x=1719935741; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6PLDWWQ9WUS0drpr/+bNjjeWogT8InLWufaeeyqOPM=;
        b=gkOIUD1lBB1iAJMZezP1QzYVc+I/kgR2FXMzqUnT/75w09DiGDabIdcfP3ZA9SvbKD
         ORh+ktV+HLEAeEQF873w+wAr5nx8ucOraBi/GrWB0EWReWHAyo4vYR30G0T8rqa2xX+w
         8aEKuq1YjuMntj6khIiyfUL2/oYPc+lpDeZOFQedKmyCXPQpAzwOUpgI/zR2bMRpGqwv
         mmNzSYbmM2EHg8XzgRqqjZy5G0T9AnjlROLRhqjpkwMFqs/V/7QTElgAMdIDHWCkUOLh
         B5iMcR6MZZMf4R3ofURqHwozfg6D/q0KsChrWAwTI1BsLck4tAmckmz7W5rcOtcsEEzn
         601g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330941; x=1719935741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6PLDWWQ9WUS0drpr/+bNjjeWogT8InLWufaeeyqOPM=;
        b=f1jZoZ0NCOq0DJV8MiSMV4RT+VpTf1HcqNp+ZULmV/EQyDikK2P4CwdS2L11PV3xOC
         zCSuQt1y/llGqRNBQrtcAjQCxkzfiLPaeoudwUIFqJZycWMkFSE4JRka4VtoJeHUlPwu
         k7ANNBPtibXZQyQ5LT0V22i2P/TRM34B6t3oIo9ensObs57kXiGLOp+yHS/hUMBmMkCk
         OVPbY15J5bFw2Now399a7Lp2SeKgPqV9ofH8p+3YRZ8ZbZ6QJDfhBXAynq9ncDmdcmay
         i9yAgST3clz/ebm5Ib0fuoX9rb9Jscnv2qc+k6vqwXYFNOwIOQK5FvZb65oUAdtt7Il4
         l4Qg==
X-Gm-Message-State: AOJu0Yy4QL6efCIxNkzFcdRrtvXtDSoJJhSNos25VoTXgUxLI8H8O6to
	XvfEl0MfRqpNgE509eMu3FRrqEeTJYU6KJ+frhOmwqpkuSU7Dgtpbn8cYGYLI968MnkcxH+8pK2
	ael2yaF1JSVt0JI02Sce1DEafkEA=
X-Google-Smtp-Source: AGHT+IEGuyjMbdB0DMCivIPzA5S5rW67b1euYd7gEVU9GU/FwWvxxNtUo9YOz0UDuIFrMxI5IH4dNnp1Wo9weE0Ln3g=
X-Received: by 2002:a05:6871:2001:b0:250:7b2f:f273 with SMTP id
 586e51a60fabf-25d06ebbe42mr8300643fac.53.1719330941208; Tue, 25 Jun 2024
 08:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240625081259.1785605-1-peter.marko@siemens.com>
 <CAMKF1sqAuENdwTOSwSwCM7uCkAjAKmC5eCbPzdu9GT71UFJEMw@mail.gmail.com> <AS1PR10MB56973A2808A599A7AF0C174CFDD52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56973A2808A599A7AF0C174CFDD52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jun 2024 08:55:14 -0700
Message-ID: <CAMKF1so9TBLr8LjZBgbQp+RJf=m5sAUK7HELdcP0C9OHmxw28Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] cjson: fix buildpath warnings
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 15:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111076

On Tue, Jun 25, 2024 at 8:53=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, June 25, 2024 17:37
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] cjson: fix buildpat=
h warnings
>
> > It does not appy on master btw. I have to manually transplant it.
> > Please look into the one in master-next
>
> I have sent a new one for master.
> But the old one should be still valid for scarthgap, correct?

if you prepared it for scarthgap then yes

>
> Peter
>
> >
> > On Tue, Jun 25, 2024 at 1:14=E2=80=AFAM Peter Marko via lists.openembed=
ded.org <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> ...

