Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7B4748F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 22:30:56 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id z2-v6so2989614ybj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 14:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DbfCotlXPF+4f766cAIrQnKmb2NnPoOzMQguRSJ5lYY=;
	b=au/3vagiKJ8RrNHw2XrV+aLK/9pxJz4wLS4GOIZ7sNPxQoY3NXYfzBssbFvPfbSfUO
	LOSNz0knHzjMsBP6Mn5uOa7geW1kOY8goFjM5n+biDzzzGFr8X/8G3k4HRdu7ClWfKSU
	ZwHqs1QJGzGpzdxN+pTaIUND54l3mxFIHIqtnDqpL/Z7bPL7fAB1WiSnP3COe6GN7wEs
	520tWEvUQFk+uIKbMErOhqW14ZR5CiLNC25TxCCTeercMju0Wscp1js9Ou3r2mjPxU4d
	NZaiCuqDrjPxrFYDMUPxEdVOL1JemR5KzjrDlntjH3/tisqdv4IS5TfJxo/qTXjAe2+N
	iBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DbfCotlXPF+4f766cAIrQnKmb2NnPoOzMQguRSJ5lYY=;
	b=E0voNQG0SPMvn66HzFNtnWngrZYoCMTNRwV9FqqScrFnj5NC7BPychb8BQ811O8qhm
	Y0TChHTGSWO6GfZdThfUjeT+3uLbehID6YCv+2PEimC/7CU/dPQJcHqe5NpgC54J+pta
	ZM56+dufEZPiryUWpZNBhQpXdhXz4qPuNZNSEDoPo/l24EGDyaezr8u/yMF5EVIjF9P9
	APf3sowBDEqRSCqfXSG2x6MonFrmKJXujGMWhLy0QDyG03Q75Af2C1FFvAEkDdk1/w52
	ze5RcGLtQghogCVW5I357A9h6ZCasT9DKxxwf4Z5nFpLr2SmTsEXehxIm6NWmwrnaBAP
	4nug==
X-Gm-Message-State: AA+aEWanAPd8RqMSQa0Wxpkp6PSQ33DwGDx5dowEKPie2hWnI+0EmrH7
	bLgLRIEFu6pwlXaf6T64TUy6XR5qhn6L5KiLPMMgVw==
X-Google-Smtp-Source: AFSGD/XNqGLqDMQWAQ/W0lULk/OolvbkurbQRutcP7NVk3ZQlOviSZeLvxOopxFH1675+HD+jqGHGdMimQz/lgsrPcY=
X-Received: by 2002:a25:4b86:: with SMTP id y128mr4024874yba.10.1544221856859; 
	Fri, 07 Dec 2018 14:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
	<CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
	<CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
	<CALbNGRS2L1knaB0OuTizL5+YGGjik1nKVZGAgPdes9HGL1GQEQ@mail.gmail.com>
	<CAMRc=McBw2yvOHzWnc7-fhrO=6K-gzZFb6R7dOhUDYh6uGQbcA@mail.gmail.com>
In-Reply-To: <CAMRc=McBw2yvOHzWnc7-fhrO=6K-gzZFb6R7dOhUDYh6uGQbcA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 7 Dec 2018 23:30:42 +0100
Message-ID: <CALbNGRRmfvTJMzQprAUZy4g3KawtZ3=ufgwiyprxrxgjfBX-QA@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Fri, 07 Dec 2018 22:30:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 7, 2018 at 11:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> pon., 26 lis 2018 o 23:49 Andreas M=C3=BCller <schnitzeltony@gmail.com> n=
apisa=C5=82(a):
> >
> > On Mon, Nov 26, 2018 at 5:26 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > This[1] recipe is enough to build pulseview, but I'm not sure how to
> > > go about requiring libsigrok to have cxx set in PACKAGECONFIG. Should
> > > I add a bbappend for libsigrok that would do PACKAGECONFIG_append =3D=
 "
> > > cxx"?
> > Have no background but why not enable it by default? Both dependencies
> > are in meta-oe so layer trouble is not to be expected.
> >
> > Since your patch is already in master-next: I am fine with an append
> > in meta-qt5-extra.
> >
> > I suggest once this series is in master please send me a pull request
> > - will test and create thud for meta-qt5-extra (don't expect this
> > series to land in meta-oe thud..)
> >
>
> PR sent.
>
> Bart
LOL - am testing build currently. Off topic: doxgen ftp download fails
- try http...

Andreas

