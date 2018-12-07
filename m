Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0AA79C7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 22:00:27 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id a6so9374448itl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EJTM3+0qJlQgMw4vhBWq4tcevKmFFI7I4iLh17sjzqI=;
	b=PGmn3P3pKhVrZJ6J7C36MHuqyHoCQLVLj4n/Co5O6kFJEWakwOzqi6Dk4CLyT624q4
	QRgQRAYMutiETsMedSiVaipEPErwyRSqCftmC1SaqStHQESWxx6qwf8ZlaEvyiZIjmUq
	cCG0N2Q8oply9NfUMnlnNCwcAHAVRUMC+ado7nlM9E99eSQqjzzk1XwUu2VjRAJvRR65
	CvHotkxtjWm7y9CFPUgDRRlCeq+B0YBqjNp0UFfe2tey3S1p+SMQ1NIVmcPytpC8GPDT
	NyZPFYWlu04kF95xABIDkO+DDUtBNtl04Dc+M3O//Wn1qxZ9kCj3T5z8o92QNoq7cg1K
	5r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EJTM3+0qJlQgMw4vhBWq4tcevKmFFI7I4iLh17sjzqI=;
	b=FDw83wSZ8USLajdAUITwVLhBVAJ1CvjrwVuQPaQ5xDSeyhIq3ku3ztZBADNeanKfoN
	07ITY1XURG80h9EUf1+KWFIc18+66QVGN0MecLCF0SMcKnWI4cFMDspAv2OQnhO3Rz5i
	7fjkEeOCUNSlQAk21r6gmCmS1KlDv1pASH5kevksAK1u43zZ7WRYjZaNmIPg9+FTg73f
	bIIVciDz0zTxZBCDCq9ncnxek9+GOSRNnKm6Jc2XHS6pJGzSGODsDPWrZ3sTUo8CfVVU
	ZpX/w119s3J7pwxkUYEjOVu/DlNcmS/20kjRqaK9Usi6Yr/cyofqu/j8csqJXmJYfIkk
	LyCA==
X-Gm-Message-State: AA+aEWYDr8ohq2HYoyGb+gVhQtO/8iAOZYG32/PbFaEdC1Zs4XEtGS5M
	Pw+FvMa2hNbHlJVDmjBhceGM/LSO45ulaGLkai/Vuw==
X-Google-Smtp-Source: AFSGD/XnVJzz3FdETCjjiuluItHiGMLGxzIgI5DMy10nWqmDeA+BmapQUfWHzX5WTgQiMJhs9H3nyXEto5fFcB9x0f0=
X-Received: by 2002:a02:3d42:: with SMTP id n63mr3555927jan.136.1544220028888; 
	Fri, 07 Dec 2018 14:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
	<CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
	<CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
	<CALbNGRS2L1knaB0OuTizL5+YGGjik1nKVZGAgPdes9HGL1GQEQ@mail.gmail.com>
In-Reply-To: <CALbNGRS2L1knaB0OuTizL5+YGGjik1nKVZGAgPdes9HGL1GQEQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Dec 2018 23:00:17 +0100
Message-ID: <CAMRc=McBw2yvOHzWnc7-fhrO=6K-gzZFb6R7dOhUDYh6uGQbcA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Dec 2018 22:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 26 lis 2018 o 23:49 Andreas M=C3=BCller <schnitzeltony@gmail.com> nap=
isa=C5=82(a):
>
> On Mon, Nov 26, 2018 at 5:26 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > This[1] recipe is enough to build pulseview, but I'm not sure how to
> > go about requiring libsigrok to have cxx set in PACKAGECONFIG. Should
> > I add a bbappend for libsigrok that would do PACKAGECONFIG_append =3D "
> > cxx"?
> Have no background but why not enable it by default? Both dependencies
> are in meta-oe so layer trouble is not to be expected.
>
> Since your patch is already in master-next: I am fine with an append
> in meta-qt5-extra.
>
> I suggest once this series is in master please send me a pull request
> - will test and create thud for meta-qt5-extra (don't expect this
> series to land in meta-oe thud..)
>

PR sent.

Bart

