Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D85D3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:05:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10859.1765353903671342534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K2IkZcRO;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2cf93f7dso4626669f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765353902; x=1765958702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgTpuNGPh0k2Pv1CvD5RUiTNlurfECDP7Oem+v44vdI=;
        b=K2IkZcROUg2v2VcZo9SAwklLeQoelTC8zgwn5cC06e1LtktHMcVbJptyIbpFGQItnh
         g3AwtKLXjyUyiEnwwLNUSUGJsl1S7vxAi04tH1h+40jLPSoyE7/EHtAsLmZgtltnCAQG
         pmgVbZdenLARTod2heOJt+b30asUl0eJycF+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353902; x=1765958702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UgTpuNGPh0k2Pv1CvD5RUiTNlurfECDP7Oem+v44vdI=;
        b=BcV7tBGBkY7fIPJLkGbww9Lnke9XNSfOLJZ7WgqSV7oJwQcvT5jXj4teaSGl24RnxV
         5qRvf8sGzFq0OWn5WFi9aqC9mfzhpdCXjVmb+7Ikwj8iI9qm7S1W6RbZ2RMbfyZ9fvbc
         smQfftqKJqEFeYfCXoHcKRIHE9hqN/bm0tClY1nTEXpVlOItfTVWbVQVbb7w/pKRwQOf
         jBfvsDCsafrm89Hc1A8FZRaHJZ47VDtDNbbcdB1ieyVJ7HZrzThPDBsmXy6yM+YKvVLW
         YAesO8waZ8nOxfSg8iW4yvOqGeM7e5BoD1hb+BLEewDUU/q7ltEgW6aqwHpghij2f0JN
         23eg==
X-Gm-Message-State: AOJu0Yyr5mBkkATuOkiAhylnse4ASgtITrI3jAW/yOjZ/4Tmcs1RTmyy
	LuCMIF+fIgi/8f9bZAJyWJxBD0D+RwRT/u5gIYtP9m5AMXhMAZlpkNZmPpbUwbcQ4DL2/YMuqDY
	KS4vdUzsjxhhkWkwnh7+ugwMV0NgX7komQ33chlnaTg==
X-Gm-Gg: AY/fxX4Rj4Rgk9LWsOOoxkAE/awnPs3MmQCMEOKp1LlmmgDiX26GI79WVatxhaPdqZ0
	TohLtNvWbRnIpwUSsX9IFmr+zX8qorv3TAkNjoL4IgikrW4emtPz5bG3KPLbjlHJ1fvm+DlS8WZ
	0dIwP6/oUKGQOUvGg+ISm2VMrvPSKMkr8Vz81lOsEAEU/1O0CjyzazEgQPCTkkgMtO2wBkkbEIb
	PxPQ1CpNNTkMbW0Qz/O7eJYIZKUKiVl0/9dat4vpVWczSYK+SINaNqpL+IZNftef+WxeXQNcQ==
X-Google-Smtp-Source: AGHT+IGClrpQmFjjJ2RCUFlauGS6CmUc+1+BJQnjBV29s8eLOjvsjY8YCPPTTRpCRndUmd/2toYnGbqK6lGtBN72AJQ=
X-Received: by 2002:a05:6000:2312:b0:42b:3d9d:c605 with SMTP id
 ffacd0b85a97d-42fa3b052dbmr1357004f8f.49.1765353902037; Wed, 10 Dec 2025
 00:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20251210070022.175967-1-yoann.congal@smile.fr> <adcafc6d-0e0f-4342-8cc0-06e3eb60fdcd@gmail.com>
In-Reply-To: <adcafc6d-0e0f-4342-8cc0-06e3eb60fdcd@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 10 Dec 2025 09:04:35 +0100
X-Gm-Features: AQt7F2qOJxtGFoiitdwde_a5pkbeoR0FIeMZ7l75BNVNZgfpUk2Bv-VF02RXBmI
Message-ID: <CAMSfU+47ZGFcYtOzCUY=4nk51fegCOroTursvY--djTvS3J8Nw@mail.gmail.com>
Subject: Re: [meta-networking][kirkstone][PATCH] http-parser: fix SRC_URI branch
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122487

Le mer. 10 d=C3=A9c. 2025 =C3=A0 08:25, Gyorgy Sarvari <skandigraun@gmail.c=
om> a =C3=A9crit :
>
> This is part of the currently pending PR[1] - second entry in the list
> under my name.
>
> [1]: https://lists.openembedded.org/g/openembedded-devel/message/122459

Ha! Missed it!
Thanks Gyorgy.

>
> On 12/10/25 08:00, Yoann Congal wrote:
> > From: Gyorgy Sarvari <skandigraun@gmail.com>
> >
> > master was renamed to main
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 8fb37f0f954e234d132468adba2072a70812a818)
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.=
9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> > index d4f76850d3..09e26e9f1e 100644
> > --- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> > +++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> > @@ -12,7 +12,7 @@ SECTION =3D "libs"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D9bfa835d048c194ab30487a=
f8d7b3778"
> >
> > -SRC_URI =3D "git://github.com/nodejs/http-parser.git;branch=3Dmaster;p=
rotocol=3Dhttps"
> > +SRC_URI =3D "git://github.com/nodejs/http-parser.git;branch=3Dmain;pro=
tocol=3Dhttps"
> >  SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
> >
> >  S =3D "${WORKDIR}/git"
>


--=20
Yoann Congal
Smile ECS

