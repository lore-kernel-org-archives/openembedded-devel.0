Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.2343.1600358068100006356
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 08:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=MJS8b6+K;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.195, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f195.google.com with SMTP id u18so2709792iln.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vG+zE6jgqvFErWfD8HMIT617/FSM+HBbYZnPsDQFyXI=;
        b=MJS8b6+KyljEiMhRm3hW4HHWa+eequ+pv2OqLcjjhdC9u3a07HAsGxf40jv9H82TJJ
         I0XMvHbYX4hvUipcJSjcpNIVmYdohehVLAakoF4WgjcBWPQaJiQ9nzSLVqDk2cwsjaHa
         hoqpAQqmCWbNQQBrmTqm/s8kFHgNOwQI3hApFxNByeRt1Su6pdoRHbv1GWRCJ2EHa2d2
         ninPoihjqiy6rfBIEuwZX4Bbwti1Fhomj34BT/V441crkUOFTKnRMnlMy/lw2pUAlcmS
         mi2IFZz45Ml8E1lWOm+TH9YpR5O8rOfd07BSF6Hjm1U68sRQJsJNjxhIlUbJskUuIzb0
         N2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vG+zE6jgqvFErWfD8HMIT617/FSM+HBbYZnPsDQFyXI=;
        b=CQRUUIOckdcWV+KD1JsSWiAZSi/0PNM3obA56kVhkFvTNlxhfuh0bAwxlnt4tvt5Df
         /say37c57CnOe4Aw5/NYjAGVXKh92pTymWhdw8EV3UFYMlrXw02Snu2Oh0450IUlUQcA
         f18OmRoO4va1IdcZSQsR/yGXGicG+P0A2Sp+xRzKCcSGXl6TntCdI68pNVWcc2bQa6Nd
         BFl8l57Fp25dZRhXvfeWEyOs04ieMpG5xHbB/eiKPkPDaao+WZKh11QQTf7gTSk1zWDE
         sUnrTMPtbSliBugfv3xAMM1hw/vH/P/X6uaoEPCCxrDhdWPTEfL2i73n8cZfHUWk/ofa
         7Y5w==
X-Gm-Message-State: AOAM532gD1uboANwrS9RXdo2X9WSttDs2asAaHXdJbR+H+RXQO0cQGYO
	ksN+uI1NTqz2QoclsRRx+MMyMC2KI93PBrOLB57VTQ==
X-Google-Smtp-Source: ABdhPJxP6EYEht7Fpnw2nCQqU8+CKnrA1g9JbbsHI7BMT0l2nJLwlEuLFRy8g+zcwLBPDVURZ66lGwRxfsGxiF4iH68=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr25715803ilq.287.1600358067234;
 Thu, 17 Sep 2020 08:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200917144404.805-1-brgl@bgdev.pl> <CAMKF1sr_D-WUU6vhxxG65oHvjc8b6Eh8n=eportP+p-iKaQs1w@mail.gmail.com>
In-Reply-To: <CAMKF1sr_D-WUU6vhxxG65oHvjc8b6Eh8n=eportP+p-iKaQs1w@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 17 Sep 2020 17:54:16 +0200
Message-ID: <CAMRc=MfrkU74Ddaq92P04AgzJqGFS11CSaVfw+rv32z2xiQ2Cw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: drop support for 0.3.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 5:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> is 1.4.4 backward compatible?
>
> On Thu, Sep 17, 2020 at 7:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > I no longer support the v0.x.y series. Remove the recipe for v0.3.3.
> > While at it: the tests PACKAGECONFIG is duplicated so remove one
> > instance.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 8 --------
> >  meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb | 2 --
> >  2 files changed, 10 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > deleted file mode 100644
> > index c4d2bddf4..000000000
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -require libgpiod.inc
> > -
> > -PACKAGECONFIG ?= ""
> > -
> > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > -
> > -SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
> > -SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > index a9a462866..b5a64a554 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > @@ -9,8 +9,6 @@ SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314
> >  PACKAGECONFIG ?= "cxx"
> >
> >  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > -
> >  PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
> >
> >  inherit python3native
> > --
> > 2.26.1
> >

No, it was a major release with a new API but 0.x was never meant to
even be stable, it was largely a development series before we nailed
down a good interface and released v1.0.

Bart
