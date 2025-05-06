Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CE8C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:18:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.73795.1746530276106654582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 04:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FutK0yOH;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6434990e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746530274; x=1747135074; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPSieWTPLUpAtIOBQCrwOeD397bfCw9GktAcDbrFnx0=;
        b=FutK0yOHZ3kgtwcKh3jxv11CAzBWDYP1oV5qCqKZMm2jwafNYv40Qy7ghHAEQN3hne
         GPZtz3zBUg6DfGNnGA/pAa2kF/WB7oz+79IqDH6qRyNDooypZbuHZE8tsPx0nfaZFFvE
         jJUliT3oqzPaPseUnPDTP95FxXkXE6jT59f6C4NNiResYjUn+v3xejhzUzYdYWFSF1U+
         0nwEPO2ydVeq6J8UumJ8ebJQym0Sd+KnbQ3nGlhXsXEOGS8YBAmz7fmyrLsoOsuYpekc
         Qx5Nghc+HrXKj/WWPTQHSjQB8n2dShRL0O3Zecfig6ZkiOL7YfV2JUhwPvUj8nwAI61m
         Y9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530274; x=1747135074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPSieWTPLUpAtIOBQCrwOeD397bfCw9GktAcDbrFnx0=;
        b=YFyEloPWfy124hvVbaso9ULC9bcFYb7o19rQx9xS5yjiM8exgncDzDaVZZfcv2mqIl
         uO6nn++SrtQMdQ29u6zuV0Xy7VjJnsEJd9yP7ihKbEWKOfek5RNM8zsE80JNYhSAZb6+
         YiKjG1vjMbgYiXzS0YBom85ol6R66e5wv/94mHcKuwdgXuT1bZNwivLE12IajSifaU3e
         snVWVnVe8PynFOEMQwo2pIS+c7kryj54tYqtb6aqUigtXusRaODq76Xn0WvIozczQIAX
         ul4V79DSy3PjuvKbkrAMyUyvXhYSnThMI14Ic6oCf9mrk8WJ6eFQhQNLQU7a1WhSyz5+
         lA3A==
X-Gm-Message-State: AOJu0YyL41sGWV1yZQ9+lLvfOE9k6/qXYrNGEtBlYkjvkQnLLZ8ILE7L
	lxsIpqgABhq65BM/ayA4V9Jv13UO68vr4vryiJOTV4tj3UgXI95wWC6xXzXN4HVfr228dGnnFK5
	Yh3G7C+tzLv+mNmvZ6a1HqKlYzYxyV81+
X-Gm-Gg: ASbGncslb3PcsxHMLRqeZUIeB9d1pV5OvjPxdeMG0hybSd5eRSFgiGemLtAm8MyTNE4
	N7IsEFearDMBZYtgt9yR5K1HI4cIv+fb+ydxg414Fni8kjxuoQOlYF+83swMZ5539iGDkDye4fT
	Xok3R5H0sGAiYazeBW3F2i/86Y
X-Google-Smtp-Source: AGHT+IG5TuK2BabAhk5TGAIpkQnFrgkejA7+JoB6Rfwi4FP5UchYQB5tIxigq2tIj5IalfuXLvpmQNB3kHhkViIx0xM=
X-Received: by 2002:a05:6512:3e0d:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54fb4aa4057mr770771e87.55.1746530273744; Tue, 06 May 2025
 04:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <AS1PR10MB569738A15FBFD3B281F3C14DFD832@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <7063.1746529801979084877@lists.openembedded.org>
In-Reply-To: <7063.1746529801979084877@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 May 2025 13:17:41 +0200
X-Gm-Features: ATxdqUGR4pkHyTH-Lk3h9jImMHyg1zHZ8E3Nmk3zCgtsdYM450vFugFt7GV8lSI
Message-ID: <CA+chaQdO1W_q4Os040eZfU012mZLWa31rBX13CU24b4i8=sFgw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
To: jasper@fancydomain.eu
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 11:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117346

On Tue, May 6, 2025 at 1:10=E2=80=AFPM Jasper Orschulko via
lists.openembedded.org <jasper=3Dfancydomain.eu@lists.openembedded.org>
wrote:
>
> > And add tag to SRC_URI.
>
> AFAIK this is not possible / bad practise, unless there were some recent =
changes to OE that I am unaware of.

See https://git.openembedded.org/bitbake/commit/?id=3Dd591d7633fe8d739ec003=
95920e44910b0b77e27
and various recent commits in oe-core and meta-oe which use both SHA
in SRCREV and tag param in SRC_URI.

> You can either specify "rev" directly in the SRC_URI or SRCREV, not both.=
 So if you set rev to a git tag in SRC_URI, you cannot set a git commit has=
h within SRCREV, thus you lose reproducibility since you are now only refer=
encing a floating rev. See also: https://stackoverflow.com/questions/781273=
09/how-to-set-srcrev-for-git-tag-in-yocto/78127354#78127354.
>
> So setting the git commit hash in SRC_URI as rev or directly in SRCREV is=
 the way to go.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117344): https://lists.openembedded.org/g/openembedde=
d-devel/message/117344
> Mute This Topic: https://lists.openembedded.org/mt/112537365/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

