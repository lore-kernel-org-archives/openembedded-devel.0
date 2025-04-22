Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2806C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 22:01:31 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.305.1745359286915915288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 15:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fkoSEk0C;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-605ff8aa9d2so1040447eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 15:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745359286; x=1745964086; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS4bxwT7x2HzRmG+/e3O7wnahOA7uHOKGupTJR+Hvj4=;
        b=fkoSEk0C2x/2DpkWpPyAGF2v8TbJ2YyTVnilwrWq3DH3RPPfbzOYmCT5QUZH0z8xUW
         w3jD1Q4HzX6DMxfsnPcxAqBWQXKFPw/lRJfZWL52Y6glvMxxR3D7iFtVlcOD+eZqAp/S
         I/lPlqoVcQgUjJluFtt13FICGZH7a9qUTu1HLhUwZx4j8Q7BBp1IibTYagP+zkJvx5x5
         TgfBttLRpqexqDu3ko17YeQAmhQjoboYAQzI9GBl6++wgG8yoJlkE3gaGG35KSJFVKQD
         6ZT6U4SqVBb1HQyzLw8GfSItWaJq3bOv9jv+uFr0pSiAKDbpkLoiLYSSvy1RsMmVfY+z
         rSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359286; x=1745964086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS4bxwT7x2HzRmG+/e3O7wnahOA7uHOKGupTJR+Hvj4=;
        b=V4cxRFnPJF3At/IVcN5fEvpIvIdOFIxAKffmxozsYc6QJ+6s0Ero1vVy2bgqazIXsO
         kt55/bOYxx8bxHYABfBk6z3ir7bzJKaaCHQjpAxQqBAUy4zwFvV/QKWRm32JSH40oe46
         AG5jDHUVrFdSe6B7XUbU5xAUUkpWKiqsjDXVYo533na1C877a8yrW2VTKm4h90wXfgIM
         JOufVifAY+xm0SrH7fVGA37y4X1jZmksUNKVyZTg6edqE0ogg0WTvbe5H0pg85lBwXRj
         H1MQLnXqXEOn4WN4QgSyLA4ZABLyqA+HykQfASrFBbQ9hd6WK12cGUQ04jB2yHbPSRnh
         OikQ==
X-Gm-Message-State: AOJu0YzJM+QMham/dyK1IojJggyFmKGZMIlN9UgJ/tuf39VhPn2R27y0
	/RiwNv6KroqfyP2GI2lanRKZYk28HybJYxgXP8/RaNqd5suEo1mym1sbIOLlWJcKJ/ftMRDpnhC
	lcxCuuMuUu7+ZgCYCWdHxcwQHvE4=
X-Gm-Gg: ASbGncvkuduKsv/BdxlPuJEwGS3rQHFT076cNezR84R7yrem+Gz53De6L0NLOKjVU2L
	uNehWRpjWbc32S05epYQr+Cx7AJg9h1M6J5ON5mbj8Ustes0rlto9BeqgZANrKbFHomaHdtt9yp
	M+PhteJhvj8ROh+NZpzV5d
X-Google-Smtp-Source: AGHT+IGd4lBLyfQbA7INcsO3cl43tkIAhQYyhtF0IWyngRTWyPg9eggoU2Tj1mw3RtBYU+/sV2ghpRduVbbH6DX38bI=
X-Received: by 2002:a05:6820:2903:b0:604:9c9b:d096 with SMTP id
 006d021491bc7-606005b3d1fmr9273399eaf.4.1745359286106; Tue, 22 Apr 2025
 15:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spcgBP1tkm1B5bTgSRff+ePsLjYg+_75PYUOeTM-WYKNA@mail.gmail.com>
 <19865.1745357814946171957@lists.openembedded.org>
In-Reply-To: <19865.1745357814946171957@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2025 15:01:00 -0700
X-Gm-Features: ATxdqUH81iAPLhJfA3JhBNlZEZdLISpAMMVBDs5Bab48PGS5uGFcAefu171K2KQ
Message-ID: <CAMKF1sq+VgCkVX0GDP+itcL51TtV=eO4FVYtSxLvJdTL6=RpoA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 24/30] python3-posix-ipc: upgrade 1.1.1
 -> 1.2.0
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 22:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117072

On Tue, Apr 22, 2025 at 2:36=E2=80=AFPM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I can submit a follow up patch next weekend if no one does it before then=
.
>
That will be good.
Thank you
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117071): https://lists.openembedded.org/g/openembedde=
d-devel/message/117071
> Mute This Topic: https://lists.openembedded.org/mt/112391361/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

