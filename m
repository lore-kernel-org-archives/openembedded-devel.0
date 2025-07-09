Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7983AC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 21:18:47 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.8367.1752095917647033262
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 14:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hwx3FMXe;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso548825a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095917; x=1752700717; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrLlA2BexJPjawi40HfjFysv7YRkl/S7xPtsyXGIctk=;
        b=Hwx3FMXeZhKjUEIocL6TSl3KpXtIqr3+y6Jj0KZBeIbt+LxCCOxr+S8s4y9qvrumIw
         vWGMt4jEJHF5lvplzRGFLp7ThdNe1w7TBtm81UGuzC9uDhFY/KN6/jmZWP28Jabxf1Kp
         x0px4RAcDx7skenmANxy+Z/PGrFxjW2A7/BFWwc29teCHQ+p32bSHqoKKZbwrsyB+ID6
         ZlaYniIzgp6l+ZiXSRgzTau2bru1b4ffa6Vn28L8Af0QFUrkGw86zkAAk72PFqM8QYYn
         nYFbHPGmW9nn0xC9n2kF2zF6yNS8efXMq80NH54kReA0ygxer+welEOfR9qiAxQ0k5Nr
         GSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095917; x=1752700717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrLlA2BexJPjawi40HfjFysv7YRkl/S7xPtsyXGIctk=;
        b=X8mP7QO7aoGlNoY10z6PzrPBsx1KOpURxwHzD5cKBgW175W/0YO6KyAfA2TLM8fJ8w
         P63L18z+T1abO+2LarPNcAxkA73faQMOQDoLTZtgVz9/c9p3KCTteFVZdVhMwTRmWix/
         GjMjtXaV700X7FASyFxFzADqWvTZhk1lcUMvnUgMZssB2dJ0L25AcZcf5mmejhM1iK4e
         HqxTYlIvXYMVcBMAuqyBCimik5uWglMyngPXLwO3oJo61X4TUft6RkrtCHCBRkXzv+25
         myiTRx6QjNwKOnuOuUE5x9gf7PCnIj2bjIwQtn7m4FxJndNdf+3F65IBEOfM/Osk+Nl5
         IlPQ==
X-Gm-Message-State: AOJu0Yx0hlWa7qPk4q3X3Z388PYwUGjCXhxHv2KLPBlNkKuiaJxi29Ht
	Emf1GCV82LFf0l854J/lGJQlVPZfqF1LuMN0+JOnp/xeUMzus6pxG/YYp25cMe+ZGjEaYn7CELZ
	A8260Fw7MEJt5fAWlUAhcnwJWMCNktt+TNN7s
X-Gm-Gg: ASbGncuqIm5E8TzS2JqHX9rxxhMS/K6tlzsPZIwPQR0PfVw/7svhNZ0ZrdUU/vyXeOE
	Ht+wNIHXrGRCMDJYmD7mu5CihFtM19JRhmggg7yMkcMzGQDWbvAPtU0dk8TC2upb3o9pj0s9z31
	UkPWVZzHyEo9Np0O33Wyh3v5kyWmrGpxTs/MLlJ+lMDn4=
X-Google-Smtp-Source: AGHT+IEh+1qo3Rdw+l22PeMniaN3eEcp4qYZqA2cQmT24BTft0mcvCjQ+NqZMgx9kpn+U6kwXUll+9LsUvQcDgiROl0=
X-Received: by 2002:a17:90b:3dc7:b0:312:db8:dbdc with SMTP id
 98e67ed59e1d1-31c2fdb9bbcmr5823810a91.20.1752095917107; Wed, 09 Jul 2025
 14:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-13-alperyasinak1@gmail.com> <1e048d60-2558-47dc-ac26-e027926c32ac@gmail.com>
 <CAGpma=5EOMDjhRe9Qs_t=O7ROqLFg5-7M9EdwE2LP38+bsStMw@mail.gmail.com>
In-Reply-To: <CAGpma=5EOMDjhRe9Qs_t=O7ROqLFg5-7M9EdwE2LP38+bsStMw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 10 Jul 2025 00:18:25 +0300
X-Gm-Features: Ac12FXz_Fl5pCOR3tQlvOsEiAJRkyhWCUV6wpjDPu-JLghyVSqSjk_YbgPyCvec
Message-ID: <CAGpma=5OZbZUugwkinkfSsK96Qr+WE0sb4d7JFVnG9rOZdMYzg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 13/20] uchardet: Add patch for
 CMake 4+ compatibility
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 21:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118389

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118388

Alper Ak <alperyasinak1@gmail.com>, 9 Tem 2025 =C3=87ar, 13:30 tarihinde =
=C5=9Funu yazd=C4=B1:
>
> > Minor note: this change is actually present in the master branch of the
> > project, so technically it's a backport.
> > https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c1=
3a6d3ff64a1e3dd4ba81d2d9e09
>
> Thanks for the heads up, I will fix it.
>
>
> Gyorgy Sarvari <skandigraun@gmail.com>, 9 Tem 2025 =C3=87ar, 13:26
> tarihinde =C5=9Funu yazd=C4=B1:
> >
> > On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> > > +
> > > +Upstream-Status: Pending
> > > +
> > >
> >
> > Minor note: this change is actually present in the master branch of the
> > project, so technically it's a backport.
> >
> > https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c1=
3a6d3ff64a1e3dd4ba81d2d9e09
> >

