Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B841FCCF9F8
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 02:54:29 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9599.1762224868376097922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 18:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRAVBaX4;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7866aca9ff4so21377857b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 18:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762224867; x=1762829667; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzn0Gh+k1zlbq8SacUVDnBSDCdVgdmrcQFEgEyu75XA=;
        b=SRAVBaX4eV09elpa5uHIScWqdp2HL+XI+/uVPVVfwkpfdPBGniHhEW1NzUMvxtMngD
         bCl02fHXzXGug8pXw6oghBpub3m7iuCYCjtdZ0BOmY887LNWp8vreR1uncPxbErlXRze
         P3Xdlv+Hj7Ok1xleejNYewwVV0ZvU90+Wwq+JoeVCaaXF/XyTgUI22rMw4B1RuWxc2R7
         e4KdoxISprJ37nP0AG3BKsauYo8ow/n0tt4KmfibLYASPsGFlk6/JMhBGzzG2lIA5dpy
         elkSdyT8Y86TW1F7g6VyLtvVfFPLi1tRzu6R2ZqMTVi/RjnosTtAAd0jqisHjF0QywCK
         fLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762224867; x=1762829667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzn0Gh+k1zlbq8SacUVDnBSDCdVgdmrcQFEgEyu75XA=;
        b=RPatz81m4SMOPZ2Ik4JFw9dsOGDHmkTFfRNw6Myc4bs61MNsMMGl+zcYxktJ+MOn4O
         rYIN/mqUY92A7E820uRBSLFxQef9vuoInLI7bqttsmY4GzwdD0HJmoJVF4ORkT/LkFhu
         6ph77zkMy6o8ADli4SqgYePE7Si1rmvFTtGDQ7lFVTO8rS78CfL9xVb+TqYkrdfX8pDZ
         1NwOMzsQ1BbSSl6AVCWMu97L+c2NNZG8D7a/bYbOy1n8t+DqDyIUE6i4/kXY/RcCRnkQ
         HdoRCEZMbv5easLoXmIDL0oOthKzdz4F3hA43ha85ZsSCk2QW5kExNAMLoRzqad+boN+
         dVbA==
X-Gm-Message-State: AOJu0Yxc6w4MSZLwAKOXrdJv6DthwqrfCz8g2EDhX8PZXGaMmz728HkC
	UCXWKx0dQFqOVqC5cgAXJ6aVaZBcpqqb/T8TqQa++Dr6a6CGvKpqyNlJJFOwJVD4Zi/29+hxAIn
	OqlnC3ExdFQB/N/5RF3Hljjcu+Fjj/XE=
X-Gm-Gg: ASbGnctVKkWCUv+f3lAujA8afUhAHow2mmzKt9S2pRhuVfJlZ8HBgRsTyhJHB3finbi
	3rXzJt/Hwq7a0dwQ54Rf/XfWEBqtf4ehLcVksgT4cMc5b2KSuxwIAZyc/kNIRQqZxEc9NELJ6tU
	V4xMIszm3RMJLQ0G7Y+61YjopXQQQIdmuEgR92MnC6vL7QUG9h7o6+2j9O40lqr+VzU+KgI+hB6
	YI6Q2RK90GDXP5seIH31u7vT23Avpyme1kJE2Mp3hXDsZNCxqkTybbYgpxygi8auFasTJY8i7Zn
	rLPT7+vJznVK9WzA3o3UvTYRPXshp08H+B8LBaQ997SzM/eMCDoiZy/ghzPcRl5oN6klTOCO+8x
	sjg==
X-Google-Smtp-Source: AGHT+IEi0czERyvX3LdKBGmDWgK15xFJPE34B9AKc6CdClAOpISgjgk3drN03Ve3n6Xj4XnBTYjHWE1Pbb9UshiKkvQ=
X-Received: by 2002:a05:690e:244d:b0:63f:9dba:355e with SMTP id
 956f58d0204a3-63f9dba3c05mr8040671d50.29.1762224867369; Mon, 03 Nov 2025
 18:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20251102183627.4052101-1-skandigraun@gmail.com>
In-Reply-To: <20251102183627.4052101-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Nov 2025 18:54:00 -0800
X-Gm-Features: AWmQ_bnW7EkykyGhlFhypuV76Zup7V6wycR_ww1FZrtBkdT0UDbWKhOT7d47EtU
Message-ID: <CAMKF1sr7++AT_8zErfsTe2E2X+VsU0ER+n5D1zf4pgAUgFQr-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: move from PTESTS_PROBLEMS list to PTESTS_SLOW
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 02:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121286

I see one failure on musl,

{'mariadb': ['my_tzinfo']}

On Sun, Nov 2, 2025 at 10:36=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> The tests are executing and passing fine.
> It takes a bit more than 5 minutes to run them.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index 580c79d6d9..78ba1e228c 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -63,6 +63,7 @@ PTESTS_SLOW_META_OE =3D "\
>      c-ares \
>      fftw \
>      libusb-compat \
> +    mariadb \
>      rocksdb \
>      re2 \
>  "
> @@ -72,7 +73,6 @@ PTESTS_SLOW_META_OE:remove:libc-musl =3D "kernel-selfte=
st"
>
>  PTESTS_PROBLEMS_META_OE =3D "\
>      keyutils \
> -    mariadb \
>      ostree \
>      poco \
>      psqlodbc \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121260): https://lists.openembedded.org/g/openembedde=
d-devel/message/121260
> Mute This Topic: https://lists.openembedded.org/mt/116084470/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

