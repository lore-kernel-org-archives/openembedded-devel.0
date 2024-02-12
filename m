Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69001C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:00:38 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.4183.1707735636876931862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=CWHG1ap7;
 spf=pass (domain: google.com, ip: 209.85.218.51, mailfrom: wak@google.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28a6cef709so404567966b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707735635; x=1708340435; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEJ8YipABTnJSqtoa114UFUW1LUkkOoqpZwXzuqpYQY=;
        b=CWHG1ap7tm8iCk9+KVTl+yyKewTP9QaqR27dsyAGecrbYOAVynAF1y8z9ECO9LALro
         8p5HVHhMo+jGHbDE8DfbQFDzqQZp+lSgYCqkZL6Lza5kFV0gD4GgV0po2CnwykG1teAn
         EIXo1JinL20hwL69/FXEbIH6NRyx9nvHdQ8itacIKL5FgN/xyg77JCgTCSSHBdLUzYM6
         Ka7o7Ax1qa5smtqx/5Iw67OieCFyAsEFp1+dMs36pRyoAJyd9WIpyig4YP5UY9K6hU6L
         9bySrT032fqsnfzLqx2oapLblKQZ3Iqg2IspN70lXj/TmOD6RtlyI387uPrBikxpuG9+
         L5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707735635; x=1708340435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEJ8YipABTnJSqtoa114UFUW1LUkkOoqpZwXzuqpYQY=;
        b=VcN9Y395QEEANGld0dP5rOAIN3TfzrHRSHJhQJJI2pBtzjoWkoV4qzleltURCmNYcJ
         cHlo2z52MXqIoP3LNAQX830z72PlQAW2NLdGIgVwLa2QrCatthGKrdxmv8udL3kxpqQ7
         xjaJ9Axs2KRbu9rqnyHtMCJu4HUKNgD6Y1jJ8TDj4V+xxIeOWteb26mxWmeQu/kk1n5u
         +5b7syY721iUDIZmtZRedvbY1BXyMNZTGw7NuUaPyaJ4/IezGFS3MUVzOKcnumjOs83X
         elw8B8B+Fs4HJ5W11fmO6LFAKAkXGb8JG40hGaReN6O3T+KjSdAKONmdML4g4Ua3OSgF
         +LbQ==
X-Gm-Message-State: AOJu0YwLvtYBghnX8N1QMnaEp8oiKmjd1wfPLIkeuGcHjSt6hqtBKhgr
	TsI40GTosHN0Zveawl8n2Znbx/qpfjGl3gA8HbDEthALRScCQopD/sh42oz/UM/7vVWW/ZukLWF
	zyw6fXwL0LiMRX6xgu1nxPYZmEnmJZoF47ULc
X-Google-Smtp-Source: AGHT+IHSfI/3Z1OAMRTHnlgy+yZeOwNXwTydOiDTEE7nfmn7TR5wW3lldiIWexge6fr1PPF5zx9D88QaX4zXjNS+4cU=
X-Received: by 2002:a17:906:e291:b0:a3c:bbea:2333 with SMTP id
 gg17-20020a170906e29100b00a3cbbea2333mr1027304ejb.3.1707735635192; Mon, 12
 Feb 2024 03:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20240210005921.1909326-1-wak@google.com> <20240210005921.1909326-4-wak@google.com>
 <2723178.mvXUDI8C0e@n95hx1g2>
In-Reply-To: <2723178.mvXUDI8C0e@n95hx1g2>
From: William Kennington <wak@google.com>
Date: Mon, 12 Feb 2024 03:00:22 -0800
Message-ID: <CAPnigKnLjhfzOpXTAtE9vcn9q8AuB192mXYFxAyXWxq4ramTOw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] nanopb-runtime: Enable shared library
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 11:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108707

On Sun, Feb 11, 2024 at 10:07=E2=80=AFPM Christian Eggers <ceggers@arri.de>=
 wrote:
>
> On Saturday, 10 February 2024, 01:59:20 CET, William A. Kennington III vi=
a lists.openembedded.org wrote:
> > Some users would like to be able to share library code between multiple
> > applications without embedding a static copy.
>
> Some CMake based recipes have a PACKAGECONFIG for this:
>
> PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF"
>
> Particularly for permissive licenses I personally prefer static linking
> due to performance benefits.

You could still statically link if you want to, this just builds both
sets of libraries instead of the static library only. I don't mind
adding the option though.

>
> regards,
> Christian
>
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  .../meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb  | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb=
/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devto=
ols/nanopb/nanopb-runtime_0.4.8.bb
> > index e36abf808..e43931a4e 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb=
-runtime_0.4.8.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb=
-runtime_0.4.8.bb
> > @@ -2,6 +2,7 @@ require nanopb.inc
> >
> >  EXTRA_OECMAKE +=3D " \
> >    -Dnanopb_PROTOC_PATH=3D/bin/false \
> > +  -DBUILD_SHARED_LIBS=3DON \
> >    -Dnanopb_BUILD_RUNTIME=3DON \
> >    -Dnanopb_BUILD_GENERATOR=3DOFF \
> >    "
> >
>
>
>
>

