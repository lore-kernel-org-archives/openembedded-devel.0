Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BF0C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 10:52:53 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.12582.1752058369346827877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 03:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MLofraWZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso86526005ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752058369; x=1752663169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz6uiaXNKEdIUOSQrQYQYx3tqNTJlQZ8SynEbJmNOaY=;
        b=MLofraWZ4eJKqZlUosY9wEOO1RCp2I1Ffe/o2o2GiDlukQhfh7pfroHJyml8rQKMHa
         Q8uLKICgd2SimerJ/4VIqd23YiXaqvE6Uu5a+Y/ifyGNCcom7ioI2phGdL7F8zf09z2p
         UP1LqVT+stsNdlbriH/mHmdyVLYOXxdxNN6vzba+8HQGjpG0tzhMDyYuVzPzUlr9AyA7
         EGlNbqCeTXOVm+39GkAxwxumfBptVI2XQ/ME0Mp0PzJ/q1Zqz9c5QiR5nocKU1beAxUv
         +GzjEXoxNm74SGvwniWpzHTAlmah++WzQdQfe9+Tleb8o1OYVy6WvYpImsq5jkcG4JSw
         eOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058369; x=1752663169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz6uiaXNKEdIUOSQrQYQYx3tqNTJlQZ8SynEbJmNOaY=;
        b=RDjgA4PoABC+JS7WPYirzN4x+of6uABVV2PQUjRdGd0Ua0yyP6d1QCwMp4P5zM5xWW
         g5Oaqpa0hw7jIP82vgWmUL0/RdQIGReJNa4lEm5rT2tJHz/xCLsvYVysSJ2bsKugQMnJ
         vlttQmPmoVVwEH6bhnuamt5xJRwK3/C4hL5lZ6qxmWcGGTdtrQ94oAtNRuQl3DDkYq8n
         JXQ3mDLdh+gSv4jlCYcGsV3gDpqor+fk6w2d1EPzbrb9sbCd8R0da/R+r/O0WiOkTJqh
         Lv+jD4CfEQyhI4Y7kcLxpkcMoRi54cm263itLFwlhA66kTKak32I0wj2fdJoN29UlRur
         udCg==
X-Gm-Message-State: AOJu0Yye99xk3dSJPtzYs1G4UNsHy1nd5S3lfRo14MyBBDCxYbyNNriF
	Qc3MuWnOXPkqWCQpAkfEnhdLi0qEBGDYyGP+QtmoB8gdk8ayN7G7vDiQDo834r54E/GhZLIXLt9
	F66nUeZT/XMvsALfhPQE8HZwPmHbn1qo=
X-Gm-Gg: ASbGnctkxJoFwRbNbeDFFhyK+YdUysMfDrslpevJ4b+Z2rAMY2hSpUj8WaEuRFm0Bk5
	8pt7f7+2NiTd65dUwJib4a8DiqblJWpRXkatVsVCGuc9vYgHiH11xTut1+ztkTS9QatzQdUVMDK
	hICrP7r2b9u5yLuEIY1iv6lRlcaCkdhUnuG9JKeSk/DeR2gFNu65Ilfw==
X-Google-Smtp-Source: AGHT+IESYQshKFENJ1eXjI8ppQOss68HQKzRU3jXAx/pFmglEyzA8RH4MgFRcADM/99ZoEBiWZmIbWY+88fvhfqijCk=
X-Received: by 2002:a17:903:15c7:b0:235:88b:2d06 with SMTP id
 d9443c01a7336-23ddb199185mr35834885ad.6.1752058368717; Wed, 09 Jul 2025
 03:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-9-alperyasinak1@gmail.com> <b2bd24e4-8fb3-46bb-bab4-7cb1aa879939@gmail.com>
In-Reply-To: <b2bd24e4-8fb3-46bb-bab4-7cb1aa879939@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 9 Jul 2025 13:52:37 +0300
X-Gm-Features: Ac12FXwQv1JINuhs8GEQ-4dBkMlUgun5A7t4h0EmyPZwKi3-2NV3wQ0Z-ycN38E
Message-ID: <CAGpma=4KFF47kXbLoAxkG8ZWw1ppNw4Hz+pvb2zCbdP3fUFsvg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 09/20] yajl: Add patch for CMake
 4+ compatibility and fix build issue
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118350

> ...this other patch is in the very same PR referenced in the first
> patch, but the status is different. Shouldn't this be "Submitted" also,
> like above?

Yes, it should be as you say. It even makes more sense to do it with a
single patch. I will send a fix.


Gyorgy Sarvari <skandigraun@gmail.com>, 9 Tem 2025 =C3=87ar, 13:43
tarihinde =C5=9Funu yazd=C4=B1:
>
> On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> > +++ b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-4.=
patch
> > +Upstream-Status: Submitted [https://github.com/lloyd/yajl/pull/256]
>
> Yes, okay, but...
>
> > +
> > +++ b/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-ins=
tead-of-LOCATION-property-f.patch
> > +Upstream-Status: Pending
> > +
> ...this other patch is in the very same PR referenced in the first
> patch, but the status is different. Shouldn't this be "Submitted" also,
> like above?

