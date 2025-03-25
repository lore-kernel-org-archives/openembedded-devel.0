Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90958C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:58:12 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.8435.1742939886945617100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFNkaw4F;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3feaedb4d2cso3499060b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742939886; x=1743544686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/+RqTnEWzKrdz0u3zrq6cOG1LzCYKT0jHH7DoVw7tE=;
        b=HFNkaw4FHvJpyIUy7PZaG3xynkJK/5MAJqv7aiEurGP9zzi4LPrq0O/PQUq6kee29x
         A2d7/6naN42q33JIoPpLQYd99UiMA+F4fPLkHif++OZJVqDd++YtK005aN0Q96j4JuZe
         08kcScR+aaVFMX9e3Inwy5khOljJQLywoUo8LfzYIRJ7xmErTIgL9SeSsH1owwoiyzMe
         s7UUBJsisMX/g3GRQU2A8ah5qiFCondCfPEZv8et1rXXNzmRHiunRPQ5uxzHR5/MUkaA
         xpFS61Rk1xvcv2MahhvNKu4z6aNztnGSU6Ed3lkprdn2pimXSjGFwSsaR9Rbev1ttxKt
         ZN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939886; x=1743544686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/+RqTnEWzKrdz0u3zrq6cOG1LzCYKT0jHH7DoVw7tE=;
        b=nokOXxy+ZO3EyE2k2iu6kxA3rxVmgrgOVydVzBMtW2pdrKHWaYR7TDfZBasI5HpiJQ
         p3/DaXOnuCstAcnosThgVn6OWyaaNU8ZNA8R823heoIKM58/lXT1OY+Sk4Jxk0aiJkZP
         Ym+BGgQDWg9piIKKiTfVRiIN97a2IOUQB+nu4WY6+FmYma/RqjaxUHs8zs4+rwLCP4T0
         M2c5lGwEUHMlzZFm1Tt2ULqVPUg8za5/0wjELstIkY9lyjBT3DZirvWh5CUOxDzPhsz4
         AEkPnE90sg0lsDQJg6iOrx+Fj8uvgNZT8vcWECWVWYJ29m9een5YuqD7NkJHGojXdaG7
         MHlg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Fts8s2+fHI5v/+6bMZcv4b3/PMacWE13IEqlMp7Z60MFP8xkmWgTnp88a6+aYjHUvtj9uEgXfXstYQHlC6e5vQQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YytNCnRVhoRATzgAuoWxqylmxJtclH9ZiVDlbophB9SENxbb9jg
	TFQV0hu7LvnCGUupZ3cirLI6SgHS0Bs5AENh0As61mCgfC15IXI5kMmPFWyLMRMPqpEO8/8YTTO
	cNmOyD0iwwYAbbVct084PoGK+0JA=
X-Gm-Gg: ASbGnctkyZNudrUUR8m/FZBLyVZvYK/MTvMnsCs4pIH0qUs+2bwms12n8Dgqa8pqgFK
	9Alee6+P4m4PEWm2+6EPl1A0fpflMrUAv405tMpRZHC2+sI/RMWEplNvFZXuDGfamKzZcA6Fj8N
	emRn2qeOT6oWJJH7M0xH4CLZk9IA==
X-Google-Smtp-Source: AGHT+IE7sFYbW5IPwI+UFlC5bZPcPVgNCTWbq6kQbSFk18gBF1uyERhL7ybeyIS20xdx55WTx7DCzdBUU47z81xZhi8=
X-Received: by 2002:a05:6808:11c5:b0:3fe:aebe:a2f5 with SMTP id
 5614622812f47-3febf78c508mr11086132b6e.24.1742939886182; Tue, 25 Mar 2025
 14:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
 <1742893312-3809-33-git-send-email-wangmy@fujitsu.com> <e844376d-314b-4395-ac46-42eab3f71e12@gmail.com>
In-Reply-To: <e844376d-314b-4395-ac46-42eab3f71e12@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Mar 2025 14:57:40 -0700
X-Gm-Features: AQ5f1JoU9s8_F8s4GbjRp67ve_pBWas0ePjBWXuINQ3jRpHsmYGxwEHmg4oNioE
Message-ID: <CAMKF1sqz07vCL+pAVUrpTGCxjCNBpLOgzTe-T_gbjAHOm1iKsA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 33/45] python3-protobuf: upgrade 5.29.4
 -> 6.30.1
To: skandigraun@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 21:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116284

On Tue, Mar 25, 2025 at 3:43=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I think this supposed to stay in sync with the protobuf recipe, which is
> at 5.29.4
>

yes lets keep them in sync

> On 25.03.25 10:01, wangmy via lists.openembedded.org wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../{python3-protobuf_5.29.4.bb =3D> python3-protobuf_6.30.1.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb=
 =3D> python3-protobuf_6.30.1.bb} (95%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.=
4.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
> > similarity index 95%
> > rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4=
.bb
> > rename to meta-python/recipes-devtools/python/python3-protobuf_6.30.1.b=
b
> > index d39c5e9790..48853699ac 100644
> > --- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
> > +++ b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
> >  "
> >
> >  inherit pypi setuptools3
> > -SRC_URI[sha256sum] =3D "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102dd=
de14d076adcfc78c99"
> > +SRC_URI[sha256sum] =3D "535fb4e44d0236893d5cf1263a0f706f1160b689a7ab96=
2e9da8a9ce4050b780"
> >
> >  CVE_PRODUCT +=3D "google:protobuf protobuf:protobuf google-protobuf pr=
otobuf-python"
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116270): https://lists.openembedded.org/g/openembedde=
d-devel/message/116270
> Mute This Topic: https://lists.openembedded.org/mt/111893783/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

