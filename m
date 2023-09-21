Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F8ECD4958
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 05:31:37 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.9526.1695274287726608617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 22:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JRjh4Tj+;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1dc5df71745so307899fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695274287; x=1695879087; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RygBjjA9dq6FRfu2kzVgXtbFkMNsr3zmC9ING553EWM=;
        b=JRjh4Tj+OCWJFHjg94kF+L65cxOe5pQPZZgdIC+BwDFIUnUKtdqtqhxO0SpIVL+fEK
         vm2dHSFifMXjgXQQh6MK+nCOhR8MZxWlcp76h8Niu3pk7bOp6rHmOXe3M50lS+TEDSaS
         zpDuHk/XSaooKU2nEOBbAoBY3q6h9rPVOCgpUC9TZM/o4kmDXdbaUQ8UrCIHEO9ABjoj
         xauzNP5fsfQHmFAKLcOe8hMdWD+3qL5Aen7Vl7XpRjCi9oMlznAJusfD4t0fJ6yA1iEl
         /EL0QNjE55dzrbAaDB/tR1ZuNbwmCptWAafsUaeJX/tENysh91wDJaDs267EYShDehOP
         lTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695274287; x=1695879087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RygBjjA9dq6FRfu2kzVgXtbFkMNsr3zmC9ING553EWM=;
        b=R4NMnX8gl10oKDAk35mXlaHhF6KE/Z4I94zf++b0yl5phF9tIf6yan6/rE/aWYyysH
         d8wq5x/45gQFA+DEz5aV8emxTm3BkSlVqrE549D1GPpdJoOeU259/NT36osGsOPUw73G
         ogKe9etYEat00kDQ9HLPInljGWh9hwTNVJkq6RrHNVICnH0nAQDAW+AESNYelDq/9UMg
         cLlWMIB3i1cOLzhnR1C1FW1savhYQutg2Qfjpf1Z66syZv0KD8y2c/upLXPWssV1ZCVS
         JniT4hvj54KdsJpOoxnPeLVWBPvV4adLmOkDZ6sU/rMBq2lTOAjVG/WLLW4fZGd7C1Je
         Fz8w==
X-Gm-Message-State: AOJu0YzrkgjWMDdHIczUmQhxMAWiPqYNzJ7lqK49krqQy9v7szznYYYv
	PkRncnn5ShALrPJzislSo0+SXgmm8AgkeLR7ZXo=
X-Google-Smtp-Source: AGHT+IHGuYk4GLYl5F2Bvdov8TupAR0/UEZKmj+1o6xPSKaXqRZZcngmfCp0cXRRqvmSlWHurs/k0wpLcxWNGr4RaKs=
X-Received: by 2002:a05:6870:ac0e:b0:1bc:3ca:f653 with SMTP id
 kw14-20020a056870ac0e00b001bc03caf653mr5080577oab.45.1695274286766; Wed, 20
 Sep 2023 22:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <xGz4.1695269308469893771.EASb@lists.openembedded.org>
In-Reply-To: <xGz4.1695269308469893771.EASb@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2023 22:31:00 -0700
Message-ID: <CAMKF1sqTqBRs61ON4ZwTxby5uHNsv=oZOK5s9fD01G5BmvA7Xg@mail.gmail.com>
Subject: Re: [oe] Rebuilding Squid 3.5.25 with the `--with-openssl` option
 generates compilation error
To: budan1953 <bud_miljkovic@trimble.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 05:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105033

you might want try adding following to bbappend

--disable-strict-error-checking as well. And also add
DEPENDS +=3D "openssl"

On Wed, Sep 20, 2023 at 9:08=E2=80=AFPM budan1953 <bud_miljkovic@trimble.co=
m> wrote:
>
> Using the Squid 3.5.25 version from the Open Embedded pyro repository, I =
enabled the `--with-openssl` build option by adding the following squid_%.b=
bappend file in my custom layer, please the attachment below.
>
> Then using docker, I tried to rebuild squid package but now I get the fol=
lowing compilation error - please see the squid_rebuild.log file attached b=
elow.
>
> Could someone provide some clues about what the problem is?
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105031): https://lists.openembedded.org/g/openembedde=
d-devel/message/105031
> Mute This Topic: https://lists.openembedded.org/mt/101494092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

