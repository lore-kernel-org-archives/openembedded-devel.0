Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295A5C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:39:38 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.688.1634751577224824980
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BfBPN33E;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id i22so8089249ual.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlJwYyALUTVZBDe+qyoAre+DBJRZwl8PIDBc8Y1CvLo=;
        b=BfBPN33EFKM/3T4cTY5WSG4sLQmobNaVnZVfRgjMnnhJMiaX4201LyrDYdjkhH3ymI
         QKXAgXmtMeB5B0sU4iUuoi71W8n5SCnsJyLTnYE8YM1ciHIKyzwF61uiGGY3+hUzcx2X
         27hGJEbp+3rmYw/GsaJlS3HPI3cceEdqWWLRcyi9SwcNPvIjnY4wG3mta3+eMkg/7tIr
         hNXQYWPjyCYe4BqBGGSSdltONh3WSZ4D+2vwe9UUxjtR05hdsgZn/tFFDrqZdWryd44i
         HAI/+R832xOWwbRUV4ZXgW+zMkiqWEBBDzkHqpm3gEd9GX0TYgUow9YWBBKcvUWyWQme
         1sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlJwYyALUTVZBDe+qyoAre+DBJRZwl8PIDBc8Y1CvLo=;
        b=FXdkHVg56QLJAvMlZEl7AlaSAkDY50IbjLx/ueaPwF+pkwLfd9Nku4SOMWiFmR7GVI
         mIYiktQvKlzEteqckfRVFZK6ZN+dGBom01gBrxfvqzxtCEDlLUOI72t7DFjS7AfOQHWb
         qnM8JnPxySaJfYusCRh56oaYYyHfouOsPOGrqk7QiQJCEWDkJNDuNd79sUs7gR22U8bc
         j1kjauPOCsQDtbPRhoH8IA04kmm8YQuRN9MSbacxIr6OAll4jVjb8O9fMgrwdEwgBZCr
         XEaJSf7AsmnKuQnpUxrj8jUtopdYYOZs6aS2M9gpdKpKH5oIj27H6pTXb2k8r2tYz4Wv
         HnTw==
X-Gm-Message-State: AOAM531NQzjnYVZQGAGxD08UHXlWwcZW9PUwSp5kuSH2ayz7+UUtm6bM
	Fb96wEIVpNWcVddlQRHZzHbEbMKdtmiNbLIdeoA=
X-Google-Smtp-Source: 
 ABdhPJzSWetz/FLiijUmqxOKjqk+zeblwkpxGRDrrxnZn8H/t3c3U58RO3w2hhyqau+LB7Ngdk2jFmYh51EiQRkp9ow=
X-Received: by 2002:ab0:7c4a:: with SMTP id d10mr798277uaw.100.1634751576471;
 Wed, 20 Oct 2021 10:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
 <CAMKF1sq7f72VOyRnwu1TcvBpzmQP-3RfJpwx1_decMPteEwGnQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq7f72VOyRnwu1TcvBpzmQP-3RfJpwx1_decMPteEwGnQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Oct 2021 19:39:25 +0200
Message-ID: 
 <CANNYZj8V3Ytqig9Gg50SA68DYen_MbYnb=SiyXipcJyzHAx3xw@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000002fcef05cecc43ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93501

--00000000000002fcef05cecc43ff
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Oct 2021 at 19:37, Khem Raj <raj.khem@gmail.com> wrote:

>
> it did not work as it is because it missed setting lua-version and I
> did not realize that during squashing the patches got reversed
>

Setting lua version is only used in the recipe to set FILES, and that can
be simply changed to take parent directories.

Alex

--00000000000002fcef05cecc43ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 20 Oct 2021 at 19:37, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
it did not work as it is because it missed setting lua-version and I<br>
did not realize that during squashing the patches got reversed<br></blockqu=
ote><div><br></div><div>Setting lua version is only used in the recipe to s=
et FILES, and that can be simply changed to take parent directories.</div><=
div><br></div><div>Alex<br></div></div></div>

--00000000000002fcef05cecc43ff--

