Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE2D67F4A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 13:29:45 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p10so2173659qkg.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9OmJ/ULVgJs6VsjKeMQFV2Dgz6YkTXvvdYmdCuN+jBo=;
	b=pmP3s/JsQHa9v4F7EpC0vvQhQ83hwclPV/yU8Vsn2vHNpCS7d4yVT/C0U/X1HwgQAC
	0w8WtjIIt3c5w8tggCVYOVPk8cv7ob3Ldn6u849kCkcnt4otLJzSo6rqOdXSZvhV0tGS
	2tvjamtOGlYUeIOjseihLUjxrZHi6SvtJh26jkMsQJpdiM4f7SPE7zZXXkfBzzVj5Dd9
	Y7/HVwzzMc8E+RDMLx8E03AWKc1jQY7SByYg1hhwVmGuAyPz15L3z9ufVAv91RAwzxIC
	/M5iMlCyBvJX6DSv6Wz51h57/CMZJ+Y8WnnVoRqxMSK80UAIBiieCahjzsjmpx+N4/4m
	xVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9OmJ/ULVgJs6VsjKeMQFV2Dgz6YkTXvvdYmdCuN+jBo=;
	b=Mj3l2kUpKPKWUxf8a/lpkfXuiFo8BhTlpVh3T9NArCrxn9wrIS+CpdLlO6FhjcceXP
	AnyeVsncIC5RP66uQQrJYYbLgUw++7avu8PIcpsVdzb/02rSc5Jry98pPPMG5C2fjbo6
	VvRVLZIo6Y4+Vsk5/ukwif1yFEUov8LhEits65Yd5q9Hhb+OwHvPwuMtFJ1eIy4MFYvy
	sqTWKwZ5aMsX8q91bSSYpnLqDeGvWkPsGTJbv4fZyyQtg9YP50x99+P/XM9wJhlIYoM6
	04AW+XS84X7ey7uVYFRfkHUP04kp37tG4MU0aAVpvVTqkMUmhSHfXVjEXO1z5UX7E3V6
	p0QA==
X-Gm-Message-State: APjAAAUMpZtTBThSMeXrQGPJxd5butZ7ZS5eUrwEr6r8T902/nS5F5vr
	t3ovjTnQ0Q0C/HmVpXYkYEgZPS6+w+EEM5pfJpE=
X-Google-Smtp-Source: APXvYqxfqZfh5jsZQS2RtbFhX6YiEroCopZbgrAreth2H4tbOEeccmZE/CLV/xDuhHPaMrRiNw9QTr+59yaH1FpkwWU=
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr3419507qkg.71.1570627786386; 
	Wed, 09 Oct 2019 06:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
	<20190926223206.26850-2-schnitzeltony@gmail.com>
	<CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
	<CAMKF1sqYP5bee9=mcwLpiRU8rcbMWEdGz21y8iENkBtJm+a6nQ@mail.gmail.com>
	<CALbNGRRUSkp0scHNSewoXh2WTBcy4wNZK+nhY2AhLekMPRDHoQ@mail.gmail.com>
In-Reply-To: <CALbNGRRUSkp0scHNSewoXh2WTBcy4wNZK+nhY2AhLekMPRDHoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2019 06:29:19 -0700
Message-ID: <CAMKF1spVBBW9vEW1U5ZtDaVXdu4DDip_4Wj3vzceAmcBF5TD8w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 13:29:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2019 at 2:10 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Fri, Oct 4, 2019 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> > On Fri, Oct 4, 2019 at 1:31 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >>
> >> On Fri, Sep 27, 2019 at 12:32 AM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
> >> >
> >> > * important bugfix release: systray draws icons properly when compos=
iting is
> >> >   disabled
> >> > * while at it renumber patches
> >> >
> >> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >> If xfce-patches require review these days: Kai can you take a look?
> >> If not: Ping
> >
> > Since they have been pending for a while
> > I still wanted to give them a go for a build and see if all is okay. St=
ill waiting on Kai to review them
> >>
> >>
> Sorry to come back to this - did not find it in master(-next) anymore:
> It contains a bugfix annoying me for very very long time [1]
>

I was hoping that Kai would be able to review it but that has not happened =
yet.

> Or did I miss something
>
> [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14577
>
> Andreas

