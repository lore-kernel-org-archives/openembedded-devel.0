Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40022C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 23:23:57 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.31388.1749079431097812616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 16:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQQc1F6W;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso414540276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749079430; x=1749684230; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg9SNZPBNMd/hLRy62u3faRC2ARP0L3tbGkUb60BzP4=;
        b=KQQc1F6WPF0QtBOpTnxrE4JMGZpqLQfJkYSsFkRFX5foFqCdKlo7yJdhODm122sERe
         0iGhQkxP5N+wpZMSr96cgPZNR0Be9PxPHpOOSChj4Y0ucXC/AuLZeftoHf4eTZEfZ4nO
         KYhaoPFl2gQ3nfwSVR7wBbHmjUJpIF82YRVhQgHUwX19Z3bHRpb3O+e2zYsUwTNrt3by
         wgORYXoPHeUmGOxlWwYSPkgR/Lw2+kD9z6PgQDXCCW+EAlBrgS74OKSEQmBtMIWtj2DU
         zWS87GN34JrF+8yqXrU17Gcy36vuqrvRLajUsUa5Zn0WIlp4APNUyhZQHpMNvmpDB+/P
         9kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749079430; x=1749684230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg9SNZPBNMd/hLRy62u3faRC2ARP0L3tbGkUb60BzP4=;
        b=eNFWq1uYLkcr02Q51sK0Olv5GNT0NNMwwstuuax0581/J4Xf900cw4iYx8GojtF48T
         +uAVDdyS2Rvpr6WARj7Egv2Px1bSGeP95m0KXk+iuo5Hag2s7jv0eBCY6j/7PZzOLoC/
         JRrKu6N8kuyU/FpncqzW34k45NYA277LxppBrFjg4jGU+dv15S3KU8AGc8WSxhD8hPEm
         TDE/G58WBtJDVQKYaheNuSDAjy5RQJIbQBSt5+feQMKF6+kysnVbj9olgV9KcSObF2nf
         coevZ8jLGgw3VeaiX39FX2vS5UJEefFqkDdgKxW2C1RcFBze002yxzV0AhIOvig8p1vM
         LQjA==
X-Forwarded-Encrypted: i=1; AJvYcCWis6pPrPQMLqEftqDHH5eyZDywNWoGW1Lqi65e5davZDNjVNrzf1fY/OgDxJOm+eLwwKlSXS+bhPIj5lKLZmyasUQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwA8hvekV8T18zfI/DQbEVQFkzBtrhxVMY5FPhcxx3Q6fQ2TrYI
	N/GSQWToskGLXFL3ozlkYM7pZzHNDVDiWuDD/AOV9OPRLr2j5pGN8xC8SWu6efHwJT0yeqN87X6
	crKBVGhTV4QCCBIBocm47Tse6MIhotp9DwlKM
X-Gm-Gg: ASbGncvitRdQ+qVcwjbNpv8qsl51+N4+0cAs0kHbJXw+wc5TaqJO5ICz5F+NS1sa6/j
	qr0LjGLjiJanZiNnEtHR3CaaJ1Yv9lQv9smqvSwYp2fOVkJWMcO/o62jaceBKHbW6h8xTNNerJQ
	NKej7EVkJREa/Pzvh7vLo375N1toFlvM8oOotDVttMi+X3tUo=
X-Google-Smtp-Source: AGHT+IHpAYV4dXBRa2WRcKWZjL40DT2H7Xtok4Pgn0K603XkNdTe50IO/Xsh382Klz8sNIJ2X6UgDKD9TKceFIdeOEE=
X-Received: by 2002:a05:6902:10cf:b0:e81:8972:f1c0 with SMTP id
 3f1490d57ef6-e818972f3edmr1288901276.32.1749079430214; Wed, 04 Jun 2025
 16:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-add-cryptopp-v4-1-9e9400a9e877@bootlin.com>
 <2cf31147-fa1a-4277-892d-a6b89648ed5e@gmail.com> <DADS05TNTW47.2RJD9AAHCUP7I@bootlin.com>
In-Reply-To: <DADS05TNTW47.2RJD9AAHCUP7I@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jun 2025 16:23:23 -0700
X-Gm-Features: AX0GCFu8WOSVDzxB4twXJdW-0WgVBLhQX_Nz_6G7_tR1lkWLfRb7LaqpYaeXtqE
Message-ID: <CAMKF1sooQtUfzibCmhrmceqfmSei4VBYCrH4HWwTH_=PuqLYdg@mail.gmail.com>
Subject: Re: [oe] [meta-oe PATCH v4] cryptopp: add a recipe for version 8.9.0
To: antonin.godard@bootlin.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 23:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117743

it also fails to compile with clang

https://termbin.com/b66s

On Wed, Jun 4, 2025 at 6:17=E2=80=AFAM Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Wed Jun 4, 2025 at 12:33 PM CEST, Gyorgy Sarvari wrote:
> > On 6/4/25 10:54, Antonin Godard via lists.openembedded.org wrote:
> >> Cryptopp is a library of cryptographic schemes written in C++.
> >>
> >> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> >> ---
> >> Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =
=3D
> >> "musl", as reported here:
> >> https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3W=
aZ9=3D94g@mail.gmail.com
> >> Any extra steps to reproduce the issue would be appreciated.
> > Looking at the linked logs, Khem was using clang - and indeed,
> > 'TOOLCHAIN =3D "clang"' reproduces the error on my end.
>
> Thanks for the hint, I'll try that.
>
> > If there will be a v5, could you also add "tag" to the SRC_URI?
>
> And thanks for the reminder!
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117739): https://lists.openembedded.org/g/openembedde=
d-devel/message/117739
> Mute This Topic: https://lists.openembedded.org/mt/113462853/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

