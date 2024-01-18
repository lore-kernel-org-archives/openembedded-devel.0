Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468D2C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:01:06 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.18230.1705597258455755121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 09:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZkiLaaiJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-210cc863229so234563fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 09:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705597258; x=1706202058; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogHuNzLuaCrRqYr+Xk+f36dMZgOIaFiMuqpTAcokWEc=;
        b=ZkiLaaiJrkMVUIHhRhO3fM4UfQ6Z9ZPmD+GUx/M2j7PkY647IyfQMpQhSUSGL9JaFA
         o2xdmFGzRMW/XGNVwNyRrFtMuvZy9ko5AcrAfOZByHHyzidayj7lAL39gr+97SyjXbpX
         A9UOTk5INTsIBS68iPchxQUaYhs/f2uG8K1UV4FphEpHvWM7jDpuszCZVxi3wD+ZAIAF
         xzrKWvSCGlC9gEY9L8UDs6czxwU8J6KrsmIeQuMNFYmmnTqYKIIGWkfdNc2//iMLtSbM
         AF0rqbfYB+r/M3TNeNG5ZfI2+U0rIBga7gWVGHNY7K8YLNP7/DxtIIsk7iRaiHgRyzn1
         lM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705597258; x=1706202058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogHuNzLuaCrRqYr+Xk+f36dMZgOIaFiMuqpTAcokWEc=;
        b=i1VQ3FH6C719oPVctSyYP2Kw203OmoPGkT/0rEgS8wvLVWuddNeiT1uH5qYRNr8kt1
         yTmu8yfx9nRy23TeSs4tlz2oXbXw5ayQIdrJ23m77rJWurPEbD5mHk79C/Y6AqL4jd7b
         sH/Tye86R2K6yicry/96v7R/Da+k/ukcqdCV5AMaUvQH3gR9SCRLKI7/3HfJo5UbI8uL
         CF5qV1ivZDF7j2Vi7QJ1Nx1CFzyKtxsGkpiqMXlf3xM+lgels6KMWbDqf7CbsaA3bxaD
         BGyBBoAZgJQqG7eg9MHbB/iIdnQB6R4jyOlH9NsCDCMhNlVnXTzvN1FYhkhWFyT7SlbH
         fsGQ==
X-Gm-Message-State: AOJu0YzGnDpw6VJujGTWOGsSO3dUhahlaM8eTdjioaNb0PcD4Pjc/B+Q
	rH2lZbt/4FNB2gM0TAUjBuePCz909F53WZdDCrZA1vklvjdVIqaPMQHilCPeTeSpHW2AF3PKnr0
	URlw1B2+ePxxKYdqVDSz+nGG+hP8=
X-Google-Smtp-Source: AGHT+IGvlvCkw013LFFidNv1M9ORUiRfSiKu4FxxvPPOB8uOjYA3buAj4nb0BemFmPoavhy73aJ9hmE2LETkgwPYUtU=
X-Received: by 2002:a05:6871:48d:b0:204:4736:a5d3 with SMTP id
 f13-20020a056871048d00b002044736a5d3mr1085058oaj.100.1705597257637; Thu, 18
 Jan 2024 09:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr>
 <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
 <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com>
 <CAMKF1sog9N5XQyZoD3eEaDLyK8F20DbQkrBP82Eks3XtdZo55w@mail.gmail.com>
 <CAMSfU+7RASoD=buv3O1W0QseMKxXu2CSXZCWoPw-WyERW124NQ@mail.gmail.com> <CAMSfU+4VxG4Da4Wdc0xL=puWZGTJ4mVptO-BNLR6hfeA0mwbgA@mail.gmail.com>
In-Reply-To: <CAMSfU+4VxG4Da4Wdc0xL=puWZGTJ4mVptO-BNLR6hfeA0mwbgA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jan 2024 09:00:31 -0800
Message-ID: <CAMKF1spFDh_rwS6FfdE_GLNb0r5KAx3CmfXPM9=OsONsjbexyw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Yoann CONGAL <yoann.congal@smile.fr>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 17:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108350

On Thu, Jan 18, 2024 at 8:59=E2=80=AFAM Yoann CONGAL <yoann.congal@smile.fr=
> wrote:
>
>
>
> Le mer. 17 janv. 2024 =C3=A0 17:44, Yoann CONGAL <yoann.congal@smile.fr> =
a =C3=A9crit :
>>
>> Le mer. 17 janv. 2024 =C3=A0 17:31, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>>
>>> On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL <yoann.congal@smil=
e.fr> wrote:
>>>>
>>>> Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :
>>>>>
>>>>> how about we add
>>>>>
>>>>> BBCLASSEXTEND =3D "native nativesdk"
>>>>>
>>>>> to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
>>>>
>>>>
>>>> Sure! ... But I have no idea how to test it.
>>>> Do we really care about pytest-cov in native environments? If yes, I'l=
l look into it.
>>>
>>>
>>> Since the native extends existed before it gained the extra dependency =
on coverage package it=E2=80=99s possible that there is a use of it already=
 in place
>>
>>
>> Good point. I'll try test it before sending a patch.
>
>
> Patches sent here:
> [meta-python][PATCH 1/2] python3-coverage: add native and nativesdk BBCLA=
SSEXTEND
> https://lists.openembedded.org/g/openembedded-devel/message/108346
> [meta-python][PATCH 2/2] python3-pytest-cov: Add missing python3-pytest R=
DEPENDS
> https://lists.openembedded.org/g/openembedded-devel/message/108347
>

Looks good, thanks.

> --
> Yoann Congal
> Smile ECS - Tech expert

