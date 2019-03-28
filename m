Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A48C7D14F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:50:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g1so12147500qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VmsiJN+DUhwnukvCTSg+rMf8tD2Q9MZdxl99jyPMqtw=;
	b=JTqP8iJL7LsEaOltv1OcJ73r61yST7mCR8+3+W/lF/r73pB0pto+EW56bfmgDtW7OO
	zlOy+x7aj1sAkw34O+W+q/uB2ISiyrppeFZ6GtF+I1Ml5rxhGJNVDZQ0wV3Nb1oPDu2Q
	p96IapKtxI6U3+Ma7lDpmJ2bXNZkE9GouWb0HWl/Vj12R/f0dBfoJkRKdrXpEFk4I1rR
	j+mfiyp49a9VCGhbGx3zH6ImHsWnebaey9ISwyh7yAtErYmb6T/vODUhBcTkJKcPNfwu
	ljJnEo9QmVf8pBcyioB0zlPGo0smDL1hJ2O0YmQz1pTZ8w7/qTPNBbcnSs13TFkTeCU/
	Cf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VmsiJN+DUhwnukvCTSg+rMf8tD2Q9MZdxl99jyPMqtw=;
	b=sqy5v6xiOtTAJaBiNZmWt5hKZGLxfXzeWLiSOweDVRsbBNxn9Uo8vDmp7MEYvDyF0N
	5d+Hl3HqbRfKI0gxu3cqLq3ZpZ1oB6o1l8b37gc8pztrtkBCCxV7ABqRGAkgxcJ6asth
	diDHv7B+8RWY1/aE7JB6eiNTRgsxGIol1ueviu2GCIVy/Q9DKIeEgs8Fe7MVLOjVJhNm
	Fj3EcVGbcY9c1IjHQ/D5j184TrPy3uoV/D5RmAxqQPCClh3s3J8WdFvu5FUj1jsLMIty
	G1gYvebp9qrxsIcXNJ2itdhK6tb+PWCZ0gnNhCRbTzfwdDCFOvqQzR1hghZuOgX0d0RX
	PhTQ==
X-Gm-Message-State: APjAAAVrUSvMOwESj3rS9fLnMuAG5/WTGEuFcImpgJVkdJp0Epzjfxtt
	To+fXuzicc8MaQmw1rjQpByrRmZ4n8aOHtv4qWE=
X-Google-Smtp-Source: APXvYqysICiSJ5ZoO1U+E/he+6+LLg2lOeGpQh+rAWIwFNYcDTXWsI7AQXWJ8Qaz/T0Io1+BE7cTy4zQ19o+1TqgB0E=
X-Received: by 2002:ae9:f44a:: with SMTP id z10mr27769815qkl.223.1553781027985;
	Thu, 28 Mar 2019 06:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190325140526.12797-1-brgl@bgdev.pl>
	<CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
	<CAMpxmJVeTvhf10yOOL2iVb+Hfv=z+-dU2p7tbAzqqs_QErY5ng@mail.gmail.com>
	<CAMKF1soqJzfVZP=fJrCyCO90KJCZANmXpEBcLG9=KH_TV5tkGQ@mail.gmail.com>
	<CAMRc=McYmHhTrGGytkZWe1n86X-vdUe7sK9A=EurWWLG-7Lj4w@mail.gmail.com>
In-Reply-To: <CAMRc=McYmHhTrGGytkZWe1n86X-vdUe7sK9A=EurWWLG-7Lj4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 06:49:16 -0700
Message-ID: <CAMKF1sqZrksYny4qiTQ7BvmUPiQBxE2Oaz17HDVYYt9R7gFJjw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 28 Mar 2019 13:50:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 3:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> pon., 25 mar 2019 o 18:30 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> >
> > On Mon, Mar 25, 2019 at 7:26 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > pon., 25 mar 2019 o 15:19 Khem Raj <raj.khem@gmail.com> napisa=C5=82(=
a):
> > > >
> > > >
> > > >
> > > > On Mon, Mar 25, 2019 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> > > >>
> > > >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >>
> > > >> There are several new features in this release. The one that impac=
ts
> > > >> the recipe is the option to install the test executable to bindir
> using
> > > >> the new options (--enable-install-tests). This requires separate
> > > >> PACKAGECONFIG entries for 0.x and 1.x series.
> > > >
> > > >
> > > > Perhaps it will be good to enable this feature automatically when
> ptest is enabled via distro features
> > > >>
> > >
> > > Sure, how about a separate patch I'll send later this week?
> >
> > okay that works too
>
> A question about that: the testing framework for libgpiod requires a
> specific kernel module to be built (the gpio-mockup testing driver).
> How should I go about depending on it? I couldn't find any example of
> that.
>

There is no given way for tethering the kernel config logic and warn or
errror about that elegantly
May be a kernel config parser in bitbake could be a nice feature

>
> Bart
>

