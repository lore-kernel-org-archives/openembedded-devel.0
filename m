Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740D8C25B78
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 10:06:14 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.37050.1715940371526734866
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 03:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9NcVHFj;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e538a264e0so23303801fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715940370; x=1716545170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCa2qdQfLteM8FYfcWl3JlSY9KGwNboNY8R31TwDz2c=;
        b=O9NcVHFjWF2CYgavHuXOEInTfH20HAstgSm8T8LaB72IwerEvz35yWWD3QJuewfQ+Y
         l4SfJJqGna6alJI3xjZoPzXiFshr+6jhYhgkFuXWsRoUrpJEnV6o0EKlyJAMKNK9ZcHr
         toPnhEer6T6Y1qsqabfIEAxl8W03Ak3883K9Qp714nE/dyVAxcGgrquYqtjaFonlIVso
         d+gVJVvZxUbnay6PAoqIqqq4dSeVXiavM5ybU5kfK5gOHjiyLWHqPL4bxNXD9k2b4WcZ
         jLEkfwldH/gJ8yGXLdQm6U1GtGL/+Fj2z5e5MMWljv7DwESJAUxvy22Ka0XVu77cz9rZ
         LTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715940370; x=1716545170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCa2qdQfLteM8FYfcWl3JlSY9KGwNboNY8R31TwDz2c=;
        b=JGAIbL/Rx2650BvpPwTDnS4/yJ3V9bGl3v5b6ll7qaEVwinsdid3FR32nxk7wcDoep
         c6ZowebmYrMDo4JUB458RjOTMuSbl9T9psNN14hRIEEt1PZs1ylZCmbDQw1qOnVWP666
         YSF3+8SyRqlvZKIcNDEIGC3wijHa3oqzzdQFZOo+PbPyEI2W/WoNaZr3+7jHaRVDarjR
         QUBA8ek2FM0/1Nwg9werewq2eobkyoVYBUCZOIy45h8+jZ6NuKBzUNLqsdCGnl+Dp0Ug
         PRKPyvA4qKdZ5VVyxW+OtjkttnffOxrQo7TOb7lCU5zcowff5MbA52t7ebKhtP0HCqmE
         oc/A==
X-Gm-Message-State: AOJu0YyUqkCIXOduLgW7XJFdhqixNBQKy0DCIpzVZsmtms0D9KzeX3Vt
	o0uFyIOqAaPbrm1joUJiLKv23800zxKJOIdGSnmodOaC4FDX98Afkc2uNpWnntegp7cPeK0+2ro
	rFEKIIzTScVf4kkYKD91Kh61X9S8=
X-Google-Smtp-Source: AGHT+IGA72RMN9RSY5+mgABEu2FhYaRSVCh99LeVLA1mRzXqYAh7p5wjlWJjfqE36MpdokEz2xHV8rowbIpepYo9NQc=
X-Received: by 2002:a2e:3515:0:b0:2da:a3ff:5254 with SMTP id
 38308e7fff4ca-2e51fd3feccmr182673891fa.1.1715940369437; Fri, 17 May 2024
 03:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240517094702.9246-1-alexandre.truong@smile.fr> <20240517094702.9246-2-alexandre.truong@smile.fr>
In-Reply-To: <20240517094702.9246-2-alexandre.truong@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2024 12:05:52 +0200
Message-ID: <CA+chaQfdiz6AVn3VU8zQ=QKWcZKjOPEox43q05tZuPri3Jh1+w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] source-han-sans-tw-fonts: fix url
To: alexandre.truong@smile.fr
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 10:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110428

S =3D "${WORKDIR}/${BP}"

This is the default, so you can just drop this and I would squash all
4 as it's almost the same change across 4 almost identical recipes.


On Fri, May 17, 2024 at 11:48=E2=80=AFAM Alexandre Truong via
lists.openembedded.org
<alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
>
> We get fetch errors from the SRC_URI provided. svn protocol was used
> but it's deprecated. So, a http url will be passed instead.
>
> The sha256sum has also been changed since the previous one was
> for the 1.004 release's archive, while we are on 2.004.
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.00=
4.bb
> index a2b3fff07..563bd6a47 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> @@ -11,13 +11,12 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/relea=
se/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansTW.zip;subdir=3D${BP} \
>      file://44-source-han-sans-tw.conf \
>  "
> -SRC_URI[md5sum] =3D "6533b71b31c19e548768f0fc963202f3"
> -SRC_URI[sha256sum] =3D "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb=
4bd4125b5af59fd0"
> +SRC_URI[sha256sum] =3D "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c=
8638e6ba170de806"
>
> -S =3D "${WORKDIR}/SourceHanSansTW"
> +S =3D "${WORKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/fonts/conf.d/
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110423): https://lists.openembedded.org/g/openembedde=
d-devel/message/110423
> Mute This Topic: https://lists.openembedded.org/mt/106150787/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

