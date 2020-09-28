Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.34611.1601292795098024781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 04:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=shabn2ho;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.66, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f66.google.com with SMTP id h1so230148qvo.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Uk2c/csJ2Uy/Qi53bzbeVs0Yxa/AUmHDmuweSx21+g=;
        b=shabn2ho1PqVhecyr2rWW/9AtODrmqUoOcxA6dG0LPdLwWwO9HJcQ/HeqTkCh4xr8W
         +QkCymv556ipeUc/XDgDnj4BiyPvClDlBS12/WIv1loFDpLkOnrzsPJzXTG08oQZHeCr
         LwF/xaszdU/pi2/l09igkVXkYuUzmwBvhD5lKoQB0UmLXtzCqLELXUe2Hk4cz9/GfI2w
         yyA2Nh445nbSUNsoD3vnebhxk34Gp1BIvywXXjwPBvpmt+y/IFPio2a4AoqbB0yvokNa
         Ejc5edDktw2b8z83x+DRIu5e86JDNL1pbsci1fYANlekK96Bj/z83qJnlugh5QAq0jSo
         e/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Uk2c/csJ2Uy/Qi53bzbeVs0Yxa/AUmHDmuweSx21+g=;
        b=DBLzko6pb7oxhR+cjzqRjReYD3Nm3pXn64d+RC8B9GwthgqxN4K5dGMMJe/IDg3Qu6
         sy1osiGKYW4H6/Ph0u+zoOWCc64u/731bw1bzpEq/7PhTWZ/TIQbG5mT+A4ucPGisF5m
         s9aq0GISSYYXyvsq/mNsolMW2oWT0ot2kxjhh9qsaP6+6s+XyHrRDhqOlN61mCYBq41Y
         JMOOsUBmkL+ktcO8PkJxBy/RpcXSgT5eqgsJDc3iwWGq/J6BFZV1JqFv6ZwbCGEH/zMq
         d3g+yxSOT69Q++FE2D1qiAgHmKfoGR2n+WK50FBAIewhaF222VBohweSZNwl5phO5M+f
         woyg==
X-Gm-Message-State: AOAM5315Hx7BzpoKhZphP6VJfrqXJT7nS3cy6H/L8N1/acz487tjwQYm
	XqGulZEzU03rDuBCmkUSMDXX34OXPELAqNEX
X-Google-Smtp-Source: ABdhPJz+xLLlTFmXLk3E2MuTWJ0CPXTzdl5pJCa6/o3DQgtYQj6NBFD7JmKnsoWzSljYs8j+ASfgWg==
X-Received: by 2002:a0c:8645:: with SMTP id p63mr11051192qva.21.1601292793887;
        Mon, 28 Sep 2020 04:33:13 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 18sm603513qkd.120.2020.09.28.04.33.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 04:33:13 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id s131so587571qke.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 04:33:12 -0700 (PDT)
X-Received: by 2002:a37:ad09:: with SMTP id f9mr255000qkm.383.1601292792389;
 Mon, 28 Sep 2020 04:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200925114441.13905-1-brgl@bgdev.pl> <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
 <CAMRc=Mdar_OD-KfeTcU1wEQA4owYChLH1KG9L5Q4R_zgqYtgPw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdar_OD-KfeTcU1wEQA4owYChLH1KG9L5Q4R_zgqYtgPw@mail.gmail.com>
Date: Mon, 28 Sep 2020 08:33:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqG7PH5B9KAGEYQz+=_Pt_mxW83ipLYgA8JZTmOdZ3_HA@mail.gmail.com>
Message-ID: <CAP9ODKqG7PH5B9KAGEYQz+=_Pt_mxW83ipLYgA8JZTmOdZ3_HA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: refactor the recipe
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 28 de set. de 2020 =C3=A0s 05:38, Bartosz Golaszewski
<brgl@bgdev.pl> escreveu:
> On Sat, Sep 26, 2020 at 4:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Usually, the recipes are moving otherway. include files are useful
> > only when there should be multiple recipes sharing common stuff. For a
> > single recipe it would be an overkill IMO
> >
>
> I considered pulling everything into libgpiod_1.4.4.bb but we're
> currently in the process of developing v2 of the GPIO user API in the
> kernel and libgpiod will get a new major, non compatible release after
> that's upstream. That means: even if we pull everything into .bb now,
> we'll revert back to having an .inc later.
>
> What do you think is the best way to go about this?

If in future it makes sense to split it we can do. It is hard to
predict what the v2 will be as for example the build options might end
being different and then the .inc makes no sense.

I'd say let's consolidate it and whenever the v2 is out, we consider
the best option depending on how it ends being done.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
