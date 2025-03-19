Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B73C35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:38:02 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.12899.1742402279898339802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGCSZByp;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3feaedb4085so420397b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742402279; x=1743007079; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbPc6YMQjxGTjc5VB7XMoSgcHRVWRv7DZ7U8A0+T9Bg=;
        b=fGCSZBypMm1dseDp72lfv/JjVBt/yr8aEJn8BdZ9WVQBZ9H/xgkmhkz6JhvIb1cmG4
         H5yLYDBIjASZbuTa37zQCwe4EtDKO4kp56d0sPfSsAMdGUlXjBy4RWkfqlsoXGF9DFXg
         Q27K4XDuy/9+NVi5dhI1BtTCVhARlflMpaLLdSCJFg4HLmbQbUN4g/Linqt6DTPf2sLi
         ghcErFuPSK9qIAq7e0Yt1yiH5wS25W5xvKhl42DgA60+6GMzKZIsphYhjHFZfsq/PA3w
         F9fF3O5z+GfhzJL2Va7SHagKZLeKEMGkrsM8YR2iuUYwa9BvN5fgoyj9zRnGWd6pvzui
         wqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402279; x=1743007079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbPc6YMQjxGTjc5VB7XMoSgcHRVWRv7DZ7U8A0+T9Bg=;
        b=mLQEvB3Bzt6P+PFcQS/+2X9nLlj3XqgpZ4sB+DdQr0wI2+3C/53hG7fB2JofMcHqrW
         rxmIFw1357XytFwr3rUAQmPv1Cz7wC842a0IFxW6LqmvxLIGa11iczlCJ5DAL3GzXGD0
         ZKxYeoQanWuaiicC5m30z4wY7Hx/MUsx19tcMBJbTCLjGFE+SxaOBF8nPAzbRxkI5nmO
         WKp14whKcW0tSr3DxzFWUg9QYUdIHJDwV5VXTQ8dHkpyL+vxPKzgjU+4RRfFGaPlxhD3
         lYmLtRvQTf+EXjUjodD4/C9+NqwywzO44JC7SXflAS9morgAldFiBbxjWRUGWztjyq5h
         9ebA==
X-Gm-Message-State: AOJu0YwTv9xprxK/Jwl99GaS2NRqfo6+x5czXRmPBp1zMKLW4FzeyNdE
	10FPP+FFsL284X5o7QZUkgztv+iF+qG6nrqxE2mp/+jiJ/6wu2oaXadavWgVoxStGCE1UUZiIyC
	BzcTRHEkphZh17MqVFVGeg8mCob8=
X-Gm-Gg: ASbGncthPHwN19FpgoJQdCS2iR5EWuSyNEuRv/7KwVl4LgNwLzhPczHh+A7xOck8TNC
	AaJhgcu+FrnVz6UUP+B86CJq75moWEpEpYYMhy0nPxMYikRnLtSL6m35F6J9Fzw54XDvkM7ggxW
	Xj1KmAJl+pCHHr4wwiB7QoBQ7o2w==
X-Google-Smtp-Source: AGHT+IGu1lp2UdwV30bonsDi8pL81k3XkriAwuboLbttp1FgcLW9kDCT74WXkUnrzrv0fbobRlqkV+/zeAZTCsg3iOI=
X-Received: by 2002:a05:6808:2104:b0:3fb:49cd:6bf5 with SMTP id
 5614622812f47-3fead60e5camr2694122b6e.32.1742402279098; Wed, 19 Mar 2025
 09:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250319120836.982987-1-ross.burton@arm.com>
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 09:37:33 -0700
X-Gm-Features: AQ5f1JqOVvOmCCsO80YTfyCg-TQFp5bfVWp79dGhjbA9IWQ93RJHEylkWP3ati0
Message-ID: <CAMKF1sruo+mPQyxkVU_=xq1QZ2_pTBU+UU9Lg-E4VpGGYb5mTw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/9] rdisk: don't inherit autotools
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116082

typo in subject, I have taken care of it.

On Wed, Mar 19, 2025 at 5:08=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This upstream does not in fact use autotools, so remove the inherit and
> implement the required do_install directly.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/=
meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
> index e6d99431be..abe23cb46e 100644
> --- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
> +++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
> @@ -36,9 +36,11 @@ UPSTREAM_CHECK_REGEX =3D "/rdist/(?P<pver>\d+(\.\d+)+)=
"
>
>  DEPENDS =3D "bison-native"
>
> -inherit autotools-brokensep
> -
>  EXTRA_OEMAKE =3D "CPPFLAGS=3D'${CFLAGS}' BIN_GROUP=3Droot MAN_GROUP=3Dro=
ot RDIST_MODE=3D755 RDISTD_MODE=3D755 MAN_MODE=3D644"
>
> +do_install() {
> +    oe_runmake 'DESTDIR=3D${D}' install
> +}
> +
>  # http://errors.yoctoproject.org/Errors/Details/186972/
>  COMPATIBLE_HOST:libc-musl =3D 'null'
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116068): https://lists.openembedded.org/g/openembedde=
d-devel/message/116068
> Mute This Topic: https://lists.openembedded.org/mt/111787461/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

