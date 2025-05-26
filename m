Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7C4C54F30
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 01:10:08 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.20296.1748221799489263618
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 May 2025 18:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjtTaVmI;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-601a8b6c133so1153963eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 18:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748221798; x=1748826598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X+NlAO3EhI6cUKeuoLwRt0KYWB4Owe1HBnM2iMusNo=;
        b=jjtTaVmIvSIEUCqpnPdk4f27F/7wRXa0EDaot5CS/3k7WL0+7gzA1NczCu2C2HB4PM
         a2Uh/btBHEiTlUKQrxZc4HSzrDlyj6XFB7vwvPnop7h7pJfJSRVISOKFIBFq+abbDQCb
         uePi+MBfZbnrcGMv7kfqBo7thTLxpgoiGzNSLpUp6r9k8zhclzqjf3VZpwajVvZ360MF
         ixowwqNu7K8iEtuoN28HW2EKaCsAL1er2rGW5tif4mVzUDEazcK8rlAkxPHbUmm6SKRm
         B1FfuKbn9qr/yTAWx4TTZXld3CNKXLZlAumBnhVthhClbZ14VAYvXWnvVCEP9hiopq8f
         02eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748221798; x=1748826598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X+NlAO3EhI6cUKeuoLwRt0KYWB4Owe1HBnM2iMusNo=;
        b=k96F5C3cmAuArg74Pk3in6kIEwh2CMzNewa7ln593knRaED2/9yyddFUTpACtPeVU0
         S94k+/+71KvZka41G+A5USPg7VayR8lpQG2qXbUwDZuEM1cTYHVUpQW5GCWKayR8I1NZ
         fQ8fdtGTFafieNIiLuSc0IFJb1Y6YIGPZAAvtazwyWVIEtUAZgNLhXU+bpkLo0eCWxiu
         FC38QwgwDDAZ+R8D0ob/9W+JNfYzb0JuBsndsmbyRfBRd2KGyKYjgCY2FoCI7n96FTuX
         uOvpTwGsHDnS7vpZ5H/Cv/ogXCHkutHT1e0kaTPrHyKt5A8ZrZ7n+OM293VAsuca3xjM
         G6og==
X-Gm-Message-State: AOJu0Yxltg//KvIxFTi03pajKZssvP87WF54koNnGjaWn8xdavFxLn0g
	Sn8eRekO12tNovpWi6hYd1U6dXNVsnfBCIejO1VxhgyHacl7tnN8h7ElWdgOFM+SuWy1Hmgar05
	q1XiD1K6ixSMftSoaATFwJv+KEtyFth4=
X-Gm-Gg: ASbGncuTwk/rOKwCKpIb8ospyaupj3M8Hv2F+Qf2yrGOeImfs+tmByMgKTZPsFsq8CF
	lGTAJxNgMIwBd9t5cMWL8copc4zMcdCq5dpoPY7Mswt36eGLqZ0cxpooqMTIQrUrL7qC9+F4o88
	KpJZjJwJqt89ojA2kC/eBO2MmMgF2KOloC+/FSJPd/8UE=
X-Google-Smtp-Source: AGHT+IHSImVMRYD35ndAAoE1uOA6vLF2s1xt5ZPqIACOMvNs5VK8QXFnHEEBB10rSh/tsWI0yKHnnnj/y2CrwMvha0w=
X-Received: by 2002:a05:6870:c8b:b0:2d4:dc79:b92 with SMTP id
 586e51a60fabf-2e8608c32a9mr4297719fac.6.1748221798286; Sun, 25 May 2025
 18:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250525041423.1210095-1-raj.khem@gmail.com> <CAMSfU+6db-4MSBfQmPzM5ufFpZbtgJmE3VQxStV5dyhDKdCgnQ@mail.gmail.com>
In-Reply-To: <CAMSfU+6db-4MSBfQmPzM5ufFpZbtgJmE3VQxStV5dyhDKdCgnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 May 2025 18:09:32 -0700
X-Gm-Features: AX0GCFuZGVa11MufRfY7Lt_Kve9Sq8mEXTAnYKDmHsIAtLztmx0h4FVS3HodjiQ
Message-ID: <CAMKF1sqoxv_=NXrJcsY_1iPiMMNxgkTA_qxXcC6o_3u99YoUYQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyzstd: Bump upper version
 of setuptools to > 80
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 01:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117620

On Sun, May 25, 2025 at 2:44=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Hello Khem,
>
> Le dim. 25 mai 2025 =C3=A0 06:14, Khem Raj via lists.openembedded.org <ra=
j.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0001-Bump-setuptools-dependency-from-74-to-79.patch         | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bum=
p-setuptools-dependency-from-74-to-79.patch b/meta-python/recipes-devtools/=
python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
>> index 8fc26bd90b..cbc167157b 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setup=
tools-dependency-from-74-to-79.patch
>> +++ b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setup=
tools-dependency-from-74-to-79.patch
>
>
> The patch name does not match the content anymore.
> You may want to update the patch name.
> I'd suggest removing the specific version from it.

Indeed, thanks

>
>> @@ -22,6 +22,6 @@ index dd885e4..9f273b3 100644
>>   # setuptools 64+ support --build-option
>>   # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9=
 under Windows
>>  -requires =3D ["setuptools>=3D64,<74"]
>> -+requires =3D ["setuptools>=3D64,<79"]
>> ++requires =3D ["setuptools>=3D64,<89"]
>>   backend-path =3D ["build_script"]
>>   build-backend =3D "pyzstd_pep517"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117615): https://lists.openembedded.org/g/openembedd=
ed-devel/message/117615
>> Mute This Topic: https://lists.openembedded.org/mt/113290576/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS

