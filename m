Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B43C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:44:20 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.1779.1716572659822961525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ed4e21pU;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso19327911fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572658; x=1717177458; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBmN6P4GrLBjcdGJdbU2B98w/BxY+Nww++luptJ11f8=;
        b=ed4e21pUGCJiFWD1orQyBMeJj1ScQYxTpssizL8diyLkAhffmLqHA2Tpfl3DUsbfec
         xeXImur43TtJg/bZ5vBJSz9SPB1xCynsh6AINBoGiBWV2mwuPuaY06IdJ8mItLVFVclO
         i14WkFCgbOvsIYr1tkDAxFkO8uJFaMJwWVE+HAqtixeB4Q0c7AGA7EhPpfpyOKTtFCGV
         mYZ6fYB2x4tYbnOwObXVeFE7lcNV5JqxUBl6bYEHwvYWw9Rqy09GCdyKynT+8EJox33r
         Q1gZ/AilppJzd3YayQgXsMFROurbIiinXNB2KBauMOpYWj6crftqp8gBjLhExwX9ppfL
         yjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572658; x=1717177458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBmN6P4GrLBjcdGJdbU2B98w/BxY+Nww++luptJ11f8=;
        b=a3XnTNZUw+DysAn9+r6kNmLgZoxYaw9PAoZXlmHWbgWV2PKBPfrJ3v/7NeUTiTEy5K
         4EM6mUNwKWAQ/bjk6ufp+W+qeRWcNWxwJhIHev+pqw14oJOUWVy0k+p1LQ+jGKimo796
         am8SgWIgi1JO+CuOGSxrK9zLqG+f0y0iv1dDgt0x6aGvVXr5utAu26QZ5jyoqFmhHEj2
         BpjX0+b7H3Cg1XeGQ40zjLkhHoFC/BClb6qNBa5cljpd9igs1qjMRwroOfual9f4ZCpG
         uwGvUhEaa3Edy2a2d0WPG3Rl43c+VlObywIjnmE58rCB5kkwnZVbDOMWVWzEdic74WJ+
         OW9Q==
X-Gm-Message-State: AOJu0YwnNKXFgy63FLkDdMvwsCtr+9UwICKitOJmBez345kIvIKNMU4o
	+9wcuaf5v/kN/5TIS3V59nFKA9yCDiqmeJh90e3U4fY9aOOCqUQM8TA/g9Qv/nXAdE6ISTG/+Ng
	redDiSlR5S/eksfusTGzghF2Enjs=
X-Google-Smtp-Source: AGHT+IEAH9O8QUgHnLNPATzAr4Eh91RBSWvjhollw2wNEq3BeVhpZzLzg7ZIp/XYrnjd0a9ZP2/LV/3DlQpoM31hW3E=
X-Received: by 2002:a05:6512:4010:b0:51d:4c8a:bbdb with SMTP id
 2adb3069b0e04-529652905b0mr3116612e87.3.1716572657500; Fri, 24 May 2024
 10:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115920.2502043-1-dmitry.baryshkov@linaro.org> <CAMKF1spKLdVFz-XS4NCOfhC14OVOrnhPb261jKy6DKXaTCZxxQ@mail.gmail.com>
In-Reply-To: <CAMKF1spKLdVFz-XS4NCOfhC14OVOrnhPb261jKy6DKXaTCZxxQ@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 24 May 2024 20:44:06 +0300
Message-ID: <CALT56yPgWn-korfO4MV5JN2+BWJJPE0_Dq2SSj4ZL7=cCzsdYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libcamera: update to 0.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110519

On Fri, 24 May 2024 at 20:40, Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to patch, I have to evict the whole CI pipeline,
> https://errors.yoctoproject.org/Errors/Details/772780/

Hmm, true. It makes me wonder how I tested it...

>
> On Fri, May 24, 2024 at 4:59=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Upgrade libcamera to version 0.3.0, gaining support for SoftISP.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../libcamera/{libcamera_0.2.0.bb =3D> libcamera_0.3.0.bb}        | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.b=
b =3D> libcamera_0.3.0.bb} (97%)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2=
.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
> > similarity index 97%
> > rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.=
0.bb
> > rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.=
bb
> > index 45d6be31ec95..11dd2ba56910 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D " \
> >          file://0001-ipu3-Use-posix-basename.patch \
> >  "
> >
> > -SRCREV =3D "89227a428a82e724548399d35c98ea89566f9045"
> > +SRCREV =3D "aee16c06913422a0ac84ee3217f87a9795e3c2d9"
> >
> >  PE =3D "1"
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110513): https://lists.openembedded.org/g/openembed=
ded-devel/message/110513
> > Mute This Topic: https://lists.openembedded.org/mt/106279998/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
With best wishes
Dmitry

