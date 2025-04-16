Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95D1C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:00:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.29575.1744833613432262628
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IT9SY7H7;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so3480b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744833612; x=1745438412; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iN1yg2JpnnT5qn64DeA2/4wYryOR5ywopQDOPAY0Sxw=;
        b=IT9SY7H7a5I7d3ZJkGtvpd7vmSsN3zkLzWLrg69Q7Hdr31A9NJck5hqHH0WQcTTQ99
         UMmKbKnT8kV7GfcYJ3NwtOYBY5Hgdi+GO5wXZ+dmVO5mtOFiLyUlp8Ca/l6GMDSZJhdG
         uzWjzIvghk+maZuESpcq77Fk/8VYq/IExfmztW+o29C0u6DHrOLFdnXpFlD8qsYxEAHi
         ujkGYWXvXvIfD19oXGwcBu+dhR8bE0F0i6ITKZTVktcs3JN2gybuwJNK4qjVfWBB17tS
         StIy4vwJGPPbJJsiBupD6zWeJK3tGoYg82QmIg50SqDc57u2I9inH6JXzIYT9xZiydqp
         CjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744833612; x=1745438412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN1yg2JpnnT5qn64DeA2/4wYryOR5ywopQDOPAY0Sxw=;
        b=N73b48b2XHZOGc9rhz29KwiCLXZuULKXT1tNQxmywrwWR97Yz3nzFHbbk/lxhJNGG9
         nMAVBhLYoTtuiRbsPGcVKuLx46aE5ICFI88Bxb1jFnzMedMaoibW1NHC1ULFp/qBPNh9
         SBRxaGdIuHA6vesOwA3NCDyA7/edlsjAlAcWbz9+GgQOKCxRxBvn1qk/30TlPWfxA2BB
         Hkx0Pg1Wp+oQk7+unLFHbR2qhFgZymlhbek/2Ueqvkn/KYwDe99/z91vuaLn8noF8vXS
         pAXiS1+9I66rQnX54N6sOJ7BkbgQEIe7vkgqWfQ35gyMbhA8aI9WTaCna8KL05ohjyny
         lgmA==
X-Gm-Message-State: AOJu0YzstlSkuZ81cuRiLd2r0brKfnVyyq5OkHMWYz5Pclc2U4UpC7bq
	kgY/0r+Qk/eanU+UfHXAXuJY7bpVHw1mNVCxV3PJP3Ksgf5ASUyjo8xulAkVbSm1qbBjlkM86Pj
	zHlDOVvENF/xi+gEWlIMepEgBcYk=
X-Gm-Gg: ASbGncspwd33mgYWjkSuR77fYbOt3hYz5fjyoMQmYylfMXhH2kpuzuSoZWOhjB/gPj+
	d+1b5ku2vgUfNt8gphGopEaIr4V8NphE3uUSYUHfGYDSHzn5P/PL33VCZSnZS0b0ChEZr0Eqt4e
	BOCRlA9suPmQpFEAIzboav/7Xuc7cpGrrV2SxozuX4TtFDU69DRQE=
X-Google-Smtp-Source: AGHT+IFDpJQr/boZIyw/vMLDji0GYXsF2nYJ8xSi2ZsteAKoO4mUcwnVrGEkeL3pQrmMTViwddUhVoBh0JBZxA+0Jk0=
X-Received: by 2002:a05:6808:4447:b0:3f6:abec:2b9a with SMTP id
 5614622812f47-400b01cf934mr2320467b6e.10.1744833612530; Wed, 16 Apr 2025
 13:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com> <1744794136-908-21-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744794136-908-21-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 12:59:43 -0700
X-Gm-Features: ATxdqUH54DfyhUyypZVTS6dt1_6kTDH2pTODYTkfPlQteJB_Z4S0DSG4r5uX734
Message-ID: <CAMKF1srKQVks-qr+ikNAY5Qc-L7SiL-En-yU9JTTJMia8dKe-Q@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 21/31] python3-obd: upgrade 0.7.2 -> 0.7.3
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 20:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116911

I have taken patch from Leon since that had extra information in commit msg

On Wed, Apr 16, 2025 at 2:02=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-obd_0.7.2.bb =3D> python3-obd_0.7.3.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-obd_0.7.2.bb =3D> py=
thon3-obd_0.7.3.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb b/m=
eta-python/recipes-devtools/python/python3-obd_0.7.3.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
> index cf3daae6ac..762cc36bb7 100644
> --- a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "A python module for handling realtime se=
nsor data from OBD-II veh
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://README.md;md5=3D176d0f9ad45c10895296260d426=
fa862"
>
> -SRC_URI[sha256sum] =3D "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7a=
acddc6a6d2a43d61"
> +SRC_URI[sha256sum] =3D "27b8f043376ca700edb98bf5216e2912295ecde0e735b260=
999f2d9ddf342522"
>
> -inherit setuptools3 pypi
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} +=3D "python3-pyserial python3-pint python3-setuptools py=
thon3-packaging"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116887): https://lists.openembedded.org/g/openembedde=
d-devel/message/116887
> Mute This Topic: https://lists.openembedded.org/mt/112291821/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

