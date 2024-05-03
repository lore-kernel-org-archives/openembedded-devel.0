Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF927C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 09:52:17 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8915.1714729929473898048
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 02:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NbetqOfk;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so106837621fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714729927; x=1715334727; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+4jJOXAMaaeoFJnHcYCA61XBRDenl+BIQgX/KILV08=;
        b=NbetqOfkam/97rUHy/tkFdHXDfp+wtBTu7vQmeZc2Edi8IxmDlObqUNxzbhacE5tCe
         x+zHQYddxciTUA8g/N/++9r1NwojAEHL2IJ3yOLn73r4u2yKtD2zt7kT7zJMQDNOoDxC
         /LFf/Vib4EXYLzZi5AFvXC9uuxvTFf3VQU4+WNEXGy3JBcOTqR36mzSI6zdJuvWF/yvh
         hF/DkICI5FlOmdh7+h0sBXlUi7KeQV1jNOjCPACJEP/5gCWhSbXZaLcyTE5XEuLw/kiS
         e0fSFWkiGAYqzpT1ZS0QcJ5Y6yaRAwWGYhFxwYW7zobWrLQnVKvlL0UEcuHiPWyG33Tt
         rVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714729927; x=1715334727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+4jJOXAMaaeoFJnHcYCA61XBRDenl+BIQgX/KILV08=;
        b=bIluT80aeMYoytBfKOSZOxGp9Ks+tNChZuQZ+n59HR+dcIUpCPRKPw0q1OpO3hB0xj
         uaT9IqAOrEOuf/xZD6LqnZodAouxVZh6kovNj1OEvkjVjBufCltIsTgkGbVlTcKmRXgZ
         UPLFwpWllTsnaQP9zlafB+mxmGHhnqzVHF8Si/L6sCo3vv6rksZ8lvFmaX1SQw/pYc76
         uY8ITRZ01VhV6AS0dzKq1isWd1zdzxfVCWj3JwC6dY88Ub5yULkr0WURJub6UIxkqxsv
         unauOqJERoedHenVh2BRTaLcq5ZaVq2PR4fQ4QIAoJRAPp7LKd0w+c0AKu/qqxUDO8qE
         r07w==
X-Gm-Message-State: AOJu0YzhwtEump1zjgNRaB5w4NXJOC6hNOu0T6K8ke9dC4upWUu4eD/u
	FY/wiZHksp5GpNQ2JQmHmHhKXaea5httoyAY0Khhd+zKnmtS6h8JlJQ8Krb7rBl38jL+G2n8Ctk
	5Ykgf4W1kzcCTL58yfVfczpnbm5a1Zw==
X-Google-Smtp-Source: AGHT+IEauaGZ4GJe0IgebiqPSwLEJaQ61nyKPBJIjAtVpmEdhHBrp2svd7fu6qE3cgiwJLCAZBdhZsZxbRQAgehSAPs=
X-Received: by 2002:a2e:9ccd:0:b0:2e2:466b:1a68 with SMTP id
 g13-20020a2e9ccd000000b002e2466b1a68mr819511ljj.41.1714729927422; Fri, 03 May
 2024 02:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240503094232.2114574-1-martin@geanix.com>
In-Reply-To: <20240503094232.2114574-1-martin@geanix.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 May 2024 11:51:55 +0200
Message-ID: <CA+chaQcPpjj4uqa2U2OtQt8pAHshAVj--2u0r2kKczSbKUWDKg@mail.gmail.com>
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: martin@geanix.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 09:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110247

Thanks, perfect timing, I've just sent e-mail reply to nodejs upgrade
that npm-10.5.0 upgrade broke this. Will test your change now. Thanks!

On Fri, May 3, 2024 at 11:42=E2=80=AFAM Martin Hundeb?ll via
lists.openembedded.org <martin=3Dgeanix.com@lists.openembedded.org>
wrote:
>
> Apparently, npm has changed its request accept header, so that cache
> lookup misses. This causes an ENOTCACHED error when doing the offline
> install in do_compile() from npm.bbclass.
>
> Fix it by updating the fake cache entry to match the newest behaviour
> from npm.
>
> Note that npm doesn't agree with itself, as it still uses the previous
> header value when doing `npm cache add <pkg>`, but the new value when
> doing `npm install <pkg>`.
>
> Bug submitted upstream:
> https://github.com/npm/cli/issues/7465
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  .../recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
> index f59620764..eb0f143ea 100755
> --- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
> @@ -30,7 +30,7 @@ const xlate =3D {
>                 time: Date.now(),
>                 url:  key,
>                 reqHeaders: {
> -                   'accept': 'application/vnd.npm.install-v1+json; q=3D1=
.0, application/json; q=3D0.8, */*',
> +                   'accept': 'application/json',
>                 },
>                 resHeaders: {
>                     "content-type": "application/json",
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110244): https://lists.openembedded.org/g/openembedde=
d-devel/message/110244
> Mute This Topic: https://lists.openembedded.org/mt/105884883/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

