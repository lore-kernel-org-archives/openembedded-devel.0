Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F476C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 06:16:41 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.66471.1701324996651398209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 22:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxjxmfCB;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1f5d34235dbso281432fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 22:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701324996; x=1701929796; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKZF/hWMdY033PwLj22FALUYlxQStdbuCxb4vcUo8K8=;
        b=QxjxmfCB2t+P1ZrpBCpION5uNtF3lcST04Z/BTKo1qcbnKZzoHJBhyLOycuFJCUkYs
         gKUd9TAc8Oi4cH4I5Acix03vxoscjRe7x1EoB8IXXbb8BOIHa2VA/Dkm1LRWWxKt0Tqz
         HjjDioVMWc1qa0AY8aExamD+5HsAQ20tMfvjNLL4eXWpXhOyOAx5W4Yo7lxW4zwIB/P6
         zkUomZXHlOSA7HtAjeKUAO6Ulrzs4fgqpcp5e2Hx9bQpkd3JxamxjTN9ztCiwJgWT6C9
         qEP8vQtYsuuN82CdX4cPvsvlAqrlwM7QL3FUCAXpWSaHhLYvJ2cR8pVSCVnl01UtapA3
         qY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701324996; x=1701929796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKZF/hWMdY033PwLj22FALUYlxQStdbuCxb4vcUo8K8=;
        b=ma5Koz4Bcyz/FcmVlAdFyZTEWqggR4yBYref1ApAJxgRnAMB2QYitlU44Fnt+xD5R7
         gUbAbfvvlf3fhoAn/VkRovWWmepxWW8mVNso049FEl8I8MkZoGbkDuQc7bNf1zHH8bGl
         TlisTjBpEHI+YvgHhntyoVgkUUFss37M5cNUROi2JXO0PxlUD6IrQmUDyQWILe4SxkID
         X8P2g/EDvJMqw8jLNg6k4mpGDhtlaYf0k/mlntxSp+9JHZzVQ4+Y/unuUl82MrMm/gGS
         HqLebNfrqDcU11ZZTcFcxXJkt4A0kDtRLuERtjV7c3INsdq6x/MCOM0/dMkeKJufGmh/
         v4tg==
X-Gm-Message-State: AOJu0YzrjBmvfT8QaljhPDKxc7jjQD7EjAoFr4a724cl8FyU3YMweXhZ
	e6nx/X/nJ6HN+6JNovzHXVKp7fQfQTPWW5N0CuI=
X-Google-Smtp-Source: AGHT+IGEqEGg6oVW7znax31y/ejOk07DeNwkux5zzLQNkyiq2IyFK+XI+mr+Sl1HGLBxfj7ws1gGg++UorLSXtOYQMA=
X-Received: by 2002:a05:6870:d3cd:b0:1e9:7912:3bd9 with SMTP id
 l13-20020a056870d3cd00b001e979123bd9mr11435150oag.9.1701324995825; Wed, 29
 Nov 2023 22:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20231121132937.933820-1-ppjadhav456@gmail.com>
In-Reply-To: <20231121132937.933820-1-ppjadhav456@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Nov 2023 22:16:09 -0800
Message-ID: <CAMKF1srCfrFBP7qupDvK2zJpbSBRVphRCUukEgyOquKHxvcC5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] sdbus-c++: Update ptest path
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 06:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107165

why do we need this change ? I am seeing it copying tests to ptest
folder but the real test is already installed under tests folder and
run-ptest script runs that test not the one copied by this patch.

On Tue, Nov 21, 2023 at 5:29=E2=80=AFAM Poonam Jadhav <ppjadhav456@gmail.co=
m> wrote:
>
> From: Poonam Jadhav <poonam.jadhav@kpit.com>
>
> Update ptest path to run sdbus-c++ ptest
>
> Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> ---
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
> index faf281485..869bfa951 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
> @@ -39,7 +39,12 @@ do_install:append() {
>      fi
>  }
>
> -PTEST_PATH =3D "${libdir}/${BPN}/tests"
> +PTEST_PATH =3D "${libdir}/${BPN}/ptest"
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    cp -r ${B}/tests/sdbus-c++-unit-tests  ${D}${PTEST_PATH}
> +}
> +
>  FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
>  FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106980): https://lists.openembedded.org/g/openembedde=
d-devel/message/106980
> Mute This Topic: https://lists.openembedded.org/mt/102728032/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

