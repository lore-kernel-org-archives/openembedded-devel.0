Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.32121.1620655206573810401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOHSNOL5;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id x188so13659478pfd.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QW+TEItewzZ+4TU1R6hsrAUzVqzxdwkdqAgBkSpem9A=;
        b=fOHSNOL5rNHpvumf125csRg5FDSVwSx1ZYJR7w5yXi9AE4XBc5H1cmR+UIdhVh/bwk
         WDkr12R2+VITcQIhrT0ZuJPIkgrimBhMfUoejmHJM7Zl5BUSn8caqSZDm4loDcGKwvVz
         P5ibpjz5b0fKr0BmeJTUwmmk9pQaioi5qwgeMucliYPMS3bx5IKAZyLDVJ/b0tzNnr1B
         b1UKw4hofmTRXXwzW2z08MV5JQmOHXvnLqKZa26jCfyKFiikhLziR9YWJBouFGJU8t9V
         SRGnEEDNTf+WEMuoOt4zzqMLYAqmjsGbngnz/8bukttaU/5CstiuV0qJK+03IFNh4OBG
         B/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QW+TEItewzZ+4TU1R6hsrAUzVqzxdwkdqAgBkSpem9A=;
        b=oym9hzC+SlcD1n8WlNycRxeum8L7F8Yuc+1hDYwu4IXeYDpEqyT5IcXcK9epUUZy0r
         gydJy8prodKsUL8TbAVvar/JNwJHomnCb+ug+CMuwmpQqABhE0Cl8Is6yB745ZwjX75v
         LC2mDI7fcoEodSP61PhIHHMopGvvKvFh1grZmSDhCXNea+4Ykk12b9ZbNccPOPpM4FjJ
         Pk05VpKHwEIj+FlTfIL+tvEaMmENq3fQ/mDR3w2hFbdCK9hfHvIeuA/berHBQgCCbFjm
         JtEwBIwI0j+R68BTYbMZFgSENPzUeRK7biFcyJ7RH6HPST6B7Tzwiy51I5q8aagjDhdI
         3iLQ==
X-Gm-Message-State: AOAM531aWK8YK2KweDGUS2gIqtVOkbUbhFoU3bzQtGlwNHkZ37mTjcrI
	1XVCR3hs/qGitm8CxVGGkEwHyGOhb3rfSTIEZRF5P5cI
X-Google-Smtp-Source: ABdhPJxIo5IrKIY9p1/Rj2SqOYxftb6Mo0GpugONoCUM3X3dsJTOfPjreRIPOlpj9HLz2SafpS9Gh890yp/Pi6kM8XQ=
X-Received: by 2002:a63:4f57:: with SMTP id p23mr7926096pgl.6.1620655205937;
 Mon, 10 May 2021 07:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <59e17e43-74f3-76f4-69e1-150f152c1831@pr.hu>
In-Reply-To: <59e17e43-74f3-76f4-69e1-150f152c1831@pr.hu>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 10 May 2021 15:59:54 +0200
Message-ID: <CALbNGRS6ML4LCrU-AmeSukS1PoZeqhvOJ7hB1D-dN88Ju5ZaBQ@mail.gmail.com>
Subject: Re: [oe] mariadb-native fails to build on Fedora 34
To: zboszor@pr.hu
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 3:51 PM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> Hi,
>
> mariadb-native 10.5.9 on Hardknott fails to build on
> Fedora 34 host with a lot of "undefined reference" linker errors.
> It's likely related to GCC 11 on the host OS.
>
> BTW the same MariaDB version is shipped by Fedora 34. =C2=AF\_(=E3=83=84)=
_/=C2=AF
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
Hi Zoltan,

There are two patches around for this: Khem sent an upgrade to 10.5.10
which is in master-next (haven't tested that yet). Have missed that so
I sent a fix for 10.5.9

HTH

Andreras
