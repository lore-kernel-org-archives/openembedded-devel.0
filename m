Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.902.1615927621763739359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 13:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cctqAzOC;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 130so36728546qkh.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxnX3TQt95oK0hTuWxQepZ8lr3ELdBD9o7gfbJr7I5Q=;
        b=cctqAzOCaVjpCCqAA4iwS44TPDFfOGgHX+19k1iIAZ6/rvu3ekANzEIL5gcxm5Fbi1
         Wueo3VuBCD/FMilIE9aM3i5RSxWoioft0FMxiBm55ENiznrk3TrJB/eM08QclNaPlrsO
         pcvbwiQFrBSOfWbspJByv2Vhwt4oUkIPNBRZYJIG9PQbkrreSXQUk+cZlF1DzDTUBgAR
         6WWfSMsJrLJ8JYbflVSbRjfaQBZ9eDH9PB/as6X4QMn/UfQ5D9fOhDJsdOKrMCVh/ucl
         +L9mtPZYmj6/ZtmfUWU739990PjIXZuqM3RYyPW2EV9tWv7mwt5IODXyTmxm7OUDnSEc
         HQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxnX3TQt95oK0hTuWxQepZ8lr3ELdBD9o7gfbJr7I5Q=;
        b=meZPcXe8SCYDRAgyZlyQl1hv+tyqF0ARboFBqIYuLPJV7B0flsHPe1ibbW7bUI4nqM
         NjQvGgE0o/duHN86EJZmOKL5jEX1G3NVQ4+4Vxy8LNDsnfAuAUNOCo4l6yNFUM9UzmPH
         QfLQHYs+P1jCZqmuEMj+OYmOnokFiO5nx/DRaroKol4Ml4HNinghmnIg1QFuOB5E/gn9
         GCgFDZkRSHsdZJmcB3Oqg26UYGBsbTQnxRFKwdX/wLV8zN0JH+IBlwA+tO8KWv4FkQ9/
         EzOo8NDzfRhS2EzJsquv0NqsELEb7Kur+vYy9IgrDibavjooL0d1nVuMGffOaKqawrRg
         57NA==
X-Gm-Message-State: AOAM533e6MxbgDimnZUj3Z1xX+vijjZhqy+npS8lmkBPns9ySp8Z4Dq4
	kjNFBSl7VIPxWndWc+CNuuMFBv4QAm42sRxU7Nc=
X-Google-Smtp-Source: ABdhPJw70/1V1Vo1CJB0ZauT6GiAk/1G7EIeFvMv91AmvXM00sKr8sBYXls1LDgdzKlHIeG8ru2IX6BNm2ZHh623nEY=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr944281qkd.381.1615927620692;
 Tue, 16 Mar 2021 13:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210307152224.31148-1-brgl@bgdev.pl> <CAMRc=Mes-0FtjGgfYVNbFjmF9aiOOWJ6C6KtqVei_dJA+6FLqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mes-0FtjGgfYVNbFjmF9aiOOWJ6C6KtqVei_dJA+6FLqw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Mar 2021 13:46:34 -0700
Message-ID: <CAMKF1srj=1SkS2wW-RaFb5Ftvh4jo_447=0TJ4mW2D8nLRwBfA@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-wpa-supplicant: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 12:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Sun, Mar 7, 2021 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Add a recipe for python3-wpa-supplicant - a package allowing to talk to
> > the wpa_supplicant over dbus using a convenient python API.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
>
> Gentle ping for this one, I think it got lost on the list.
>

thanks I missed it.

> Bart
