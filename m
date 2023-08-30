Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C07C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:02:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.16456.1693407746612377531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qmW1dcKo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31de47996c8so229323f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693407744; x=1694012544; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0YI7qpX+yVTEngST/jfu87v7s+RH1tkNNIuQVJHsMzQ=;
        b=qmW1dcKoCaeuNFDUPPh5xDhkPePEvrg5/civrL8aWAZ6LM9YuXXkK2XH7NKZAScRiF
         P3e3YK9pCCYcVgIPPpNrXkb/SOcm47GH//o82gs0ieKitFapnanrveotT1ev4byw7vmq
         y1COeYhZ+SkiWZizsFbj9Aub18D+CsScieU/ECC9JIXK91UPD8Kmc1CIIezKjEPZXsFb
         ROxwGe5r0kAIoRS5GDojS/1yNyUngPFVV1mWYcDE9n9H5mHufFEQMHaeG6KHsKNq8f9h
         EaQhlmoBa5h8KUVLwEzxc/3S0wM/AwnMSzIr7OiPxj7t26fGWVIQ9lW+/fXtcJgj1Hkl
         ad4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693407744; x=1694012544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YI7qpX+yVTEngST/jfu87v7s+RH1tkNNIuQVJHsMzQ=;
        b=g39GdOldH6gZCwMq2fCj8IJV8DNMtjMElVRowqJgglTYtpMr9mlRpV3KvBR9HcpRFV
         y5cDADHxRzt81UrfWWGABdBdhK8hUncscRHDDJUCsc2CBpO+CMRHuexq8mL7EOxgRwj/
         ON+OXgvYwo9te64JZsCb3EMphGt7xGqQ28iimcpdFm3RbR9qHOZvdIQtDQkNl9sWN55D
         MoqQrCvuioOkKxgHxs4Aj5+i2Tded+gDYjhCeIoQpKKJ3b9ECEH6KTsmbhU+GWRX+rXq
         xKeClYw2tHVlFpSMqegu97+PD8cetJ2Rg48+quc+VOy8Wksm5U9i8DCMI8uz9pemqY8b
         WWyA==
X-Gm-Message-State: AOJu0Yz17gBT15i6tC/zO42OeADC9uMzRj1N2GX4Vu05t/XvQVI3Jpv/
	YRYMC4foUz+tJln8ZGVt6CIXuAv4zuog/G7buWY=
X-Google-Smtp-Source: AGHT+IEoJx85lBgOoacSvckFIQ7igsl09oTLC1SJzV5LuMvzosn5o5FuQFaEjYR4VOgtHHkjeY+kYJEaKYU4dlJvaPk=
X-Received: by 2002:a5d:6309:0:b0:319:854a:9ea1 with SMTP id
 i9-20020a5d6309000000b00319854a9ea1mr1755260wru.15.1693407744312; Wed, 30 Aug
 2023 08:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230825054449.2315061-1-f_l_k@t-online.de> <20230825054449.2315061-2-f_l_k@t-online.de>
 <CA+chaQfBkvt2hPuRaoYNVOc8O2iY=mZUzp=e8s3vDYkgMc6QWw@mail.gmail.com> <PN270S.7RY9ZI8V292C2@t-online.de>
In-Reply-To: <PN270S.7RY9ZI8V292C2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 17:02:00 +0200
Message-ID: <CA+chaQcirkkrsQ=or+yEA1nu4SQbviwz-2h0dmSSbdXi27VeHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/5] phodav: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000f506b0604253753"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 15:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104668

--0000000000000f506b0604253753
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for quick fixes for 1/3 and 2/3 (already tested in my environment,
LGTM), but was there some 3/3 (possibly with fix for libosinfo? - I've just
disabled vala temporarily in .bbappend before triggering next world build
here)

https://patchwork.yoctoproject.org/project/oe/list/?series=3D16108 shows on=
ly
the first 2.

On Wed, Aug 30, 2023 at 10:09=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:

> On Wed, Aug 30 2023 at 09:29:58 AM +02:00:00, Martin Jansa <
> martin.jansa@gmail.com> wrote:
>
> will send a fix for this one.
>
>
> Thanks a lot, also for pointing out the other issues. I'll send patches
> for them
>

--0000000000000f506b0604253753
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for quick fixes for 1/3 and 2/3 (already tested in =
my environment, LGTM), but was there some 3/3 (possibly with fix for libosi=
nfo? - I&#39;ve just disabled vala temporarily in .bbappend before triggeri=
ng next world build here)<div><br></div><div><a href=3D"https://patchwork.y=
octoproject.org/project/oe/list/?series=3D16108">https://patchwork.yoctopro=
ject.org/project/oe/list/?series=3D16108</a> shows only the first 2.<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Aug 30, 2023 at 10:09=E2=80=AFAM Markus Volk &lt;<a href=3D"mail=
to:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div id=3D"m_-4653469935623903726gea=
ry-body" dir=3D"auto">On Wed, Aug 30 2023 at 09:29:58 AM +02:00:00, Martin =
Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite">will send a f=
ix for this one.</blockquote><div><br></div><div>Thanks a lot, also for poi=
nting out the other issues. I&#39;ll send patches for them</div></div></blo=
ckquote></div>

--0000000000000f506b0604253753--

