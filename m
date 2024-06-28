Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC7DC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 04:54:03 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.10150.1719550442696229361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 21:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVw19rTP;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso282836e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 21:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719550441; x=1720155241; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeO9AMKIB1YH3Zdi7bKKXRAjRXbgtbuNyCrTyA7b5nM=;
        b=UVw19rTPd0VtR9CRCWFcDXABq9v+nXorkLdJZbUHsFks0BvREK112/AW5Hq2ucEI/n
         BDpD28iuZRAyXukj5I03slYjbWlCBg1d08vTXnfJ8EPJ/Z5RpRbKrPA3WzXX8zT3Z3wH
         Az7reDC1NYtd+WxmqbYUOSKdJJjC0B7VzG5AZGFJaTFcUcj+/nDy7lbCIsbiuqNXPaMs
         4KtC8M0tt+heRUYf7qXRctYED6e4zm4uT3Vrh7uenkhu8sPHXeYdXu6KN7L9XFYRR/5v
         iNmgvF5Ucn1VUXByZnj1ZXM7ywUD3Q2vhctFGUxSKJ5SXPjutNwCiMqxj9bp2tM9Y/pF
         JyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719550441; x=1720155241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeO9AMKIB1YH3Zdi7bKKXRAjRXbgtbuNyCrTyA7b5nM=;
        b=iHxDdrzwddQg8sS5vLtt1/q/iK5NdvDPqhCW0IibX0Fw6uJeAHUmyjPtCphPXn8203
         JWqcQ4VqcastXc1IFeWfvp51md5BvZsCgoLu7FG4MwyPa6f9pko+8CUEXfEl9elkEpTJ
         emv6V7REMu4r6i8NfBbuDts4ot5Grch5DGGCHfTsEJc4VVdqOXRkxlPdd/H5RbhioNCv
         98ystGvIQ2otzExW+6esm4fv+V1Kq6R5t6BqPqZRjxFUMPhAeEK0eNfzLTdijFLdATGn
         dHcsU4cKrEk1lNzNQxdlfzKMZl9ND/0SIF2TNM+H6BaOXkW2zc4Q+XsQjN1NqO6NHqtg
         6kGA==
X-Gm-Message-State: AOJu0YytdvcHPrc937bqNFSsdM5EnnV6LD7CteohG6TiNQ4/vi1k15rC
	T4Iwz3qOp6K10w5jKRVzZK0lIfr/n2lt8G9enwlx6VnHfrY3DI4q9/1w92XvPJnwXBxf8/QFq8L
	GC30P8fiCe2LWCJs4TlpgCijyBhc=
X-Google-Smtp-Source: AGHT+IG3mUTDq0JGmdrBiCnnnZewpI05hANu90HeGSYH6qN3M4pogMdnUT/PSHROFjOYBxNMe0nMuXGQPY/riktuDe0=
X-Received: by 2002:a05:6512:3a8b:b0:52c:e1d4:8ecd with SMTP id
 2adb3069b0e04-52ce1d49146mr12468101e87.8.1719550440685; Thu, 27 Jun 2024
 21:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com> <1719544767-17994-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1719544767-17994-3-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2024 06:53:49 +0200
Message-ID: <CA+chaQe5YyP7VgbZH7Ektetphj46TAz3UgBs0=JUY9YAaG3WOw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 3/4] mcpp: fix build failure with gcc-14
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 04:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111141

see https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-dev=
tools/mcpp/mcpp_2.7.2.bb?h=3Dmaster-next&id=3Dd196c0c1af16eba55f8f0277eea76=
129ed2f677d
which has the log as well.

On Fri, Jun 28, 2024 at 5:19=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipe=
s-devtools/mcpp/mcpp_2.7.2.bb
> index 944585673..f34115c3f 100644
> --- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
> +++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
> @@ -10,6 +10,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.=
tar.gz \
>  SRC_URI[md5sum] =3D "512de48c87ab023a69250edc7a0c7b05"
>  SRC_URI[sha256sum] =3D "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdb=
bc2055099fcb8864"
>
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +
>  inherit autotools
>
>  EXTRA_OECONF =3D " --enable-mcpplib "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111136): https://lists.openembedded.org/g/openembedde=
d-devel/message/111136
> Mute This Topic: https://lists.openembedded.org/mt/106922378/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

