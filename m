Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E2DD743D0
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 19:53:06 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.24340.1732132380308958449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 11:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6nhL9p4;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-856f9be0389so39815241.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 11:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732132379; x=1732737179; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9yC4IGSjLd5Im+1uJhxZTU41Pxbj+GUcANihVZL5Sqc=;
        b=b6nhL9p4XhIZddYuC03cY9DJ/v9xtI9TQElrgcqIRmOMuxuAMwNshVWqUnaVLaPWss
         kROgIh1pS2X22DZ4LMkIJ7KtjXNfXZ2JoQ7CT1TxQXSHKFjm3CiHUV/4Kr8lnFmfvm80
         FILm22Eo2QLKx0ssCFyUkh/MnstSQoDL0xAAGS0iUuymHryIHjXnNLWApnMXjt6DxgNJ
         jWLTlDMRkxc9HnuoEO0nrLKZiIqdKouIZ4I+aguSiVCGtVSEfG5Rwd0+LryZyBlbTAId
         ivKozWABppedrY7Zv2J5h/wFnn8HUvrV/rxpY1AmtVvwFeNl7C0+SInu1QW3aXH/U32e
         IF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732132379; x=1732737179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9yC4IGSjLd5Im+1uJhxZTU41Pxbj+GUcANihVZL5Sqc=;
        b=cmUP2BSZ3Z7mdLOoYEzGP9Gmvl4QUX2YwfAAfTteBDt5YYl/l677FliLgHpwxI72Mc
         7/4u/r9RKmNx3HB4gtlfAUudeOUBDtpxnaGc/OQ2q0rDY2NN1C+awzAX84skPJr/F4sT
         pTPVEY0HM3rUqAsM5W38n2d+C/5YrS5Qs4Rp21kgIw/0n9ol4cC+x1ce2UD1Ju6k13my
         0VsoO2mwGu/og/YqZ0ayyGx6hhJ4DEQ//QqGSiVvdwsekmz1snlPC+iBCGMG67GuusWP
         Yj/TwY5NIxOI9fUW1HwUjvcJYtY+4hT+2Ab6Go0HpD8/s0SCaOflKrauy8PrmZoiKdqP
         DyyQ==
X-Gm-Message-State: AOJu0YxcrDQuOp2Nj0eYcSKrnjJD71NFhlyprMLmJtg5EpvR48Bg1HuE
	AFCo8KK7AplyDYD9ZaNjtmH3Pkibav+cCHDqksngyFusvfEbUn2MJtg2FQ==
X-Gm-Gg: ASbGnctJCYBRE2UAPeSqpSKOWtUXpYKBxUXO6uex/LlMMujG+ziTrR1Tnw6E+tKL283
	Sl+psas76zVDcUtF47BM0xNMK1ND0WRsUZzb3tF60Njk4kwMXpqt9xEA74caSF8eHx5gV4GejvR
	diJ8ac+pO1XG9irOdv3rAh2YzeCm707palIByldHU42FWt/BvpxObF4VNxJXPav6bxNEFJWY7J6
	ZMIJ69QSQz1H0Jenq8N9Dy+trzULNHX6zhq8nd7C3idSuA=
X-Google-Smtp-Source: AGHT+IFbl7pxME/UfkstkulwaJvfQefmsY9MozBPNc6B3Jd19sqiI67dhtYC+U588friccHrzm8ZFw==
X-Received: by 2002:a05:6102:dc9:b0:4a4:950a:cb1f with SMTP id ada2fe7eead31-4adaf59e719mr4629802137.22.1732132379324;
        Wed, 20 Nov 2024 11:52:59 -0800 (PST)
Received: from hiago-nb ([146.70.98.136])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-856dfba4340sm1845783241.7.2024.11.20.11.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:52:59 -0800 (PST)
Date: Wed, 20 Nov 2024 16:52:55 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native variant
Message-ID: <20241120195255.d5m4strnlmxtkryk@hiago-nb>
References: <20241120160005.8473-1-hiagofranco@gmail.com>
 <CAMKF1spM=H5As9y+aS+cAAmuqjZ0qfsL7_mqEm_dtGM92U3-Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spM=H5As9y+aS+cAAmuqjZ0qfsL7_mqEm_dtGM92U3-Gw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 19:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113937

On Wed, Nov 20, 2024 at 10:47:16AM -0800, Khem Raj wrote:
> On Wed, Nov 20, 2024 at 8:01 AM Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This is a requirement for libdisplay-info version 0.2.0, which fails
> > without hwdata-native:
> 
> Thanks for the patch. I had to transplant it on top of 0.389 recipe
> since this was
> staged in master-next please check the branch and test it out if it works as e

Thanks, next time I will rebase on top of master-next.
I tested with hwdata 0.389 and libdisplay-info builds fine.

> 
> >
> > | WARNING: CMake Toolchain: Failed to determine CMake compilers state
> > | Build-time dependency hwdata found: NO (tried pkgconfig)
> > |
> > | ../git/meson.build:24:11: ERROR: File /usr/share/hwdata/pnp.ids does not exist.
> > |
> > | ERROR: meson failed
> > | WARNING: exit code 1 from a shell command.
> > ERROR: Task
> > (poky/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_configure)
> > failed with exit code '1'
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta-oe/recipes-support/hwdata/hwdata_0.388.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
> > index 63fcfb22b707..dde9647479a3 100644
> > --- a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
> > +++ b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
> > @@ -24,3 +24,5 @@ do_install() {
> >
> >  FILES:${PN} = "${libdir}/* \
> >                 ${datadir}/* "
> > +
> > +BBCLASSEXTEND += "native"
> > --
> > 2.39.5
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113929): https://lists.openembedded.org/g/openembedded-devel/message/113929
> > Mute This Topic: https://lists.openembedded.org/mt/109686459/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

