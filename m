Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.11892.1601128263778937046
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 06:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=m55t66mp;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f196.google.com with SMTP id v54so4682940qtj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7YdauA+Pv2eP0GWPnjr+qVxO9S30vQfFjXP0G+AU7wA=;
        b=m55t66mpAO9Ngx0w8Vjxo3wMFtkcK0ngIcxCzJy9gmg/dMUMxL9aeHkTnIubM1x6s2
         UVZsqhUBXY6V34p2hu0vBmfH/+dEttexKu4XZQVzTRQ+sjvtJ07n4EkOaFj2Jrv4oBuH
         3WdugrevhMjDbQWdTU/fnvqlcGtcdX+xEzMLsQ3hvlB1pVf6oVPXmbairrhPuaIq5vqq
         EbDSKViOywcYYaWFFjlF6ITDhdnJqrWmBJKErDRwzm3Q64kuuzxghuQHdYHVibHJO8/p
         2/zw6BxHmEhSDknMgpj+8V2O5JNgkLy3xkPk1H6w1FCB3drVpZuJgILDL97QRZc0sv0p
         4ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7YdauA+Pv2eP0GWPnjr+qVxO9S30vQfFjXP0G+AU7wA=;
        b=kzCZsMFX5oduUa3YRXnWxK4XKgZ9ILsHLJBTw8ZURk3cp+zxpSeOl1wR0c01vQfcZU
         D+YoIkF6UeNoaVpgcxD2JkQKLrToLMgoKSml3ZSU0ISuMt744qqt+YsutRMImdyDVSh1
         61e58yBU4v73ifKLqqOOA0Tf7vu1nGpBho1qR2vIGwk5BRfJNoaiUJAgwIRBK5NDS8S0
         p91eeOhalH/STs1KUgGgWBp3i1iQLPzo19oYxFp0p/zvd2tZvLRKzFGb0px9akkob9qz
         lXzONAsS3ybNAkdopGTbg52w7eCEW1RxSVYXDiAHagR20NGl9WqaaGp1dykQU6Nsv/IY
         x2Pg==
X-Gm-Message-State: AOAM5315KddRh8JrQs0WotXCMvsdwkl8FpTsDw0UeuLGHCe6HdrXzmb7
	u0sY+9zenmuAkCxEWnaw/XSPWspkwic1WOlM
X-Google-Smtp-Source: ABdhPJzgOwFPhbBXiU9JaZvnPodxloHYygeRuOuWWGFxZIbBPV9lXC0c3M5q7lFInk6O7304808GCQ==
X-Received: by 2002:ac8:1301:: with SMTP id e1mr4574431qtj.136.1601128262736;
        Sat, 26 Sep 2020 06:51:02 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id r21sm4579202qtj.80.2020.09.26.06.51.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 06:51:01 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id w12so5934953qki.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 06:51:01 -0700 (PDT)
X-Received: by 2002:a37:a207:: with SMTP id l7mr4530194qke.64.1601128261471;
 Sat, 26 Sep 2020 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200925114441.13905-1-brgl@bgdev.pl> <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
Date: Sat, 26 Sep 2020 10:50:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqgH2yMod0CkRMbJnxQEK_T+4fr-E39ZpGLC0fBPjc69A@mail.gmail.com>
Message-ID: <CAP9ODKqgH2yMod0CkRMbJnxQEK_T+4fr-E39ZpGLC0fBPjc69A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: refactor the recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 25 de set. de 2020 =C3=A0s 23:04, Khem Raj <raj.khem@gmail.com> es=
creveu:
>
> Usually, the recipes are moving otherway. include files are useful
> only when there should be multiple recipes sharing common stuff. For a
> single recipe it would be an overkill IMO

Agreed; it adds an extra indirection for no good reason.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
