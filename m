Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A160860107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 10:29:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x7so16760547ioh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SO1YXW2YBSJ+LnN21fghiBn4LOBI1Ht1f87pu1GMeCw=;
	b=OXQyJx0Q4Bb2TrkHxyVWb1cSo8uZiTUT3XflE1jH+oiGNHwnGayTQ9+cmtqZjIO3QB
	Neh143/8AH4OPmTOmj7vUhl0eSrX3LWrJ3PSZSmAD7TeWTQJdgz21PAha34nVRdNRsw1
	ODZlRRRr3K7TX9cMo3LpHbL4aXtUsAlcfc9xkuIIw/S8CZMjmXEDXSItTI5uM8DvKed7
	fZXAP3BB7bJpHo0DxHOsS/DRbRYiIYEn26g1B3j3uHecAwYB3Hn1ooXJSoFUphUzOLGQ
	rdl8Fbzcs1Tl0ofQoYyDt5NdSj62tnPpez3XjeZXCqeHZEADRojz5Db6uKKcUfnEcpkk
	wFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SO1YXW2YBSJ+LnN21fghiBn4LOBI1Ht1f87pu1GMeCw=;
	b=GTjpekLAa97LUu2d6L9Zj0OMaYxoESkVHzgMtgUA+FRahOxtnlGBQzuoc/REp65odJ
	MuDDo/UL/s2p6LElQInsku4yqjQqPLJFEv1OmqFBdMFUbEPJW+rGV6d2K0vgz8Fxrw9x
	wSrg271Z8ykbxiqGjOHCLHK5NvyEb9fc4vg1PGOM89FAqdZo9QbOYzToegZhl25gwd8H
	3Tmm7PEuY6JZQLcRhTmfLOu0GPOOIDbWZ7BTC3YYOfyHOE/+jmAWi8QmQujkqbNaGKhp
	iaJ+cbwvGWw+6qKUJu+rynr3HwDgBsttRpaJbr/7tjZUDEHaHfjH0+5/UamiyletAxi0
	0i8Q==
X-Gm-Message-State: APjAAAWlOJ19m0FqvYLuw5KZ/19epzTOy+RQNlLpuKuOYQhwQOisE+cn
	RALy/EwZWJJc2DtQDKSq0PXqzoisbdqqP/lDRnAs/Q==
X-Google-Smtp-Source: APXvYqxLhZHvj+5zd83Fv/v9Q7x6hH/sMRB2KolVuK0Mu0xfuOkp/OHsKzL8LwPHxz5H+ApF5B09uDmUxe2sljbN050=
X-Received: by 2002:a6b:b515:: with SMTP id e21mr5396672iof.258.1553768954692; 
	Thu, 28 Mar 2019 03:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190325140526.12797-1-brgl@bgdev.pl>
	<CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
	<CAMpxmJVeTvhf10yOOL2iVb+Hfv=z+-dU2p7tbAzqqs_QErY5ng@mail.gmail.com>
	<CAMKF1soqJzfVZP=fJrCyCO90KJCZANmXpEBcLG9=KH_TV5tkGQ@mail.gmail.com>
In-Reply-To: <CAMKF1soqJzfVZP=fJrCyCO90KJCZANmXpEBcLG9=KH_TV5tkGQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Mar 2019 11:29:03 +0100
Message-ID: <CAMRc=McYmHhTrGGytkZWe1n86X-vdUe7sK9A=EurWWLG-7Lj4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libgpiod: bump version to v1.3
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
X-List-Received-Date: Thu, 28 Mar 2019 10:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 25 mar 2019 o 18:30 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
> On Mon, Mar 25, 2019 at 7:26 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > pon., 25 mar 2019 o 15:19 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a)=
:
> > >
> > >
> > >
> > > On Mon, Mar 25, 2019 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > >>
> > >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >>
> > >> There are several new features in this release. The one that impacts
> > >> the recipe is the option to install the test executable to bindir us=
ing
> > >> the new options (--enable-install-tests). This requires separate
> > >> PACKAGECONFIG entries for 0.x and 1.x series.
> > >
> > >
> > > Perhaps it will be good to enable this feature automatically when pte=
st is enabled via distro features
> > >>
> >
> > Sure, how about a separate patch I'll send later this week?
>
> okay that works too

A question about that: the testing framework for libgpiod requires a
specific kernel module to be built (the gpio-mockup testing driver).
How should I go about depending on it? I couldn't find any example of
that.

Bart

