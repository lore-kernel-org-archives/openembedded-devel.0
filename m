Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D604EC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 19:12:57 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.2507.1744744374325221886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 12:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJ6YQ+Hn;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c1425fbfcso3423837a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 12:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744373; x=1745349173; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ke9Fj2rfdOrR74mSuP5TaXh/qqd2z5MSiTJGAbW2vc=;
        b=lJ6YQ+HnYsuIXK6vnqFcppVCXp+ctsf3yRccasTJIUKfO+1UHMbKw2Z6KnWIY9jgua
         7BWxY4ppICE2Kzx0OYeRLM0dWOxoRrOSUKIf0+uYLRxiEELXVoboJrHDEgLQZSnvIC2r
         nDYaXGP3kaofOeRo6lyl3ONBW7HjKpuoqJgPzreL7+kNlcGTbPl01EOLnd0wnR/l0ZKe
         dJAVAkNYB9wDMNiHHZJybyL5hFMTnVfTz2RHC/Lqp+H9cfB5bmLOMMogsHyLXlP6wkSn
         svkZ5mzYjGIYCO6guOaZfi9fgN785KnEQ08yhvw5XCeyxYS9WSE+vqafB2BuuwGaArnb
         wXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744373; x=1745349173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ke9Fj2rfdOrR74mSuP5TaXh/qqd2z5MSiTJGAbW2vc=;
        b=vHWKnNIBBeQ1YfoHTgZ8WqQXbrSeIW3EHanQIXAwCenqEjTBMM16JHXm2bv05GvyMy
         SzjEXg7JupGdaQtgV1l2/hbzWyC5Tqjj42z4D2up1hRY0s1XrqNOwXkqlLzKbbHmY1MB
         1pW8vNkjl+DwLRJqE0nXxS5VWrqpj4zYa2RyFk1dEA0ERByIZ8ZMIr84ZgJ83uiDAvul
         zX4BNIGiET6LjQEV7t5g4dMQbTxOT224EmSMpKNwjFd7Qnaj1vA2STCXPkj0uRl7/Eqk
         yhlgMr3dceJ4/sgkVLeS2X1DyAXdnYgtg4Pq+j/WrRoNhDnmp+iNFUaBoOpFByMhdzDp
         8+gw==
X-Gm-Message-State: AOJu0Yzu4Dpll8zE+1eiAxwZUH78/ZcMzpKTNMuFYe8+yFn5OO4Ou7r0
	kBuyRRkFKgEY5DvzeB87qg3v9r+xTCJlJijOv8Etj2HlKHguW3nNXgVcKfBo68z3WbTUUdVFK9k
	RNYmM3zWH55iZF96uXd/7bqD1DIk=
X-Gm-Gg: ASbGnctbeUzSd3G3kJXZ7a9mr0pSkgzlucJwJElqaovVYJQGUYKaVynrVwbQR5E1i7e
	p+HBZ8J7bVhkftvj9KDWoYSupNs4U2+YG0298sOKjFNxxeyqXHEe3laB8VqVlwmfleznBL0h/vB
	VRHR2tZv4d62Yj7tljeV8=
X-Google-Smtp-Source: AGHT+IG0pRTjBrufGRZyqpd/hjLzSOLBDL+iirkkufFPOEjGYVAB4X/Yu3xWcZxoDu21BXuMEk8Ki4Yx8kRcQ59we3Y=
X-Received: by 2002:a05:6830:6288:b0:72b:9674:93ed with SMTP id
 46e09a7af769-72ec1c4c93amr385611a34.24.1744744373014; Tue, 15 Apr 2025
 12:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250415180540.1327811-1-schonm@gmail.com> <CAMSfU+5-75-+T0XVCwSfboGggYU3qOvBXoP8VxjjCynU-_PY4Q@mail.gmail.com>
In-Reply-To: <CAMSfU+5-75-+T0XVCwSfboGggYU3qOvBXoP8VxjjCynU-_PY4Q@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Tue, 15 Apr 2025 15:12:42 -0400
X-Gm-Features: ATxdqUF6n9rJeROF4zy2HthlHJe3BUlFHUGq8CEYQjH8BmedQJvWYC5BdhRxWDM
Message-ID: <CABTo8gDXaUfLmCLtEbAj7HoNc04LOSkNaO9NqD7wdoFUnS3ucg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] monkey: Update project website
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116869

I did consider that.  But I figured that since the existing webpage
has been wrong for more than a year, the issue would eventually be
updated with whatever address the projectet decided to register.

On Tue, Apr 15, 2025 at 2:47=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Hello,
>
> Le mar. 15 avr. 2025 =C3=A0 20:05, J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta=
-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > index a11af8129a..cdb6fb605c 100644
> > --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> > -HOMEPAGE =3D "http://monkey-project.com"
> > +HOMEPAGE =3D "https://github.com/monkey/monkey/issues/414"
>
> I would put "HOMEPAGE =3D "https://github.com/monkey/monkey" (the main
> github page, not the issue) citing the issue in the commit message.
>
> Regards,
>
> >  BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> >
> >  LICENSE =3D "Apache-2.0"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116865): https://lists.openembedded.org/g/openembed=
ded-devel/message/116865
> > Mute This Topic: https://lists.openembedded.org/mt/112281725/4316185
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Yoann Congal
> Smile ECS

