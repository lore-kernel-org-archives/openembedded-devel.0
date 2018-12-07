Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3446C511
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 22:51:09 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q70so3400553qkh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 14:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FXHENlpQXoHWnqLLztZqaVFWWZtxQ1kgTjFN7cK9cr4=;
	b=ohyk591qmu7Nb1G92dVzkjS77a1Zxaqu6/zyig8yYqPW/q28kAzO8v7M99z6+jtyl0
	Us27/g7lpVI6GaWOrjusmQeOCpYdbWElpitcZDYyQlGoKE1T28LNZrLrS4kN3L9ILnmM
	+X6q2MwJxHSk/RfUhmpw6jfWHaxHcUFfxdFT7CzpthRIJ2UF5qHa89vqAzwW/tZ0lEnm
	mUeTHRXpfN6nOLjfye4JIO7TSc0fAaZC5H0ef+WKEygwV2cETwvPr+cTox823N6Aq1Fg
	YYougN29eB+y+h0uXkZ/0D/1+c2m0/6BJ6H7UlPlhTyx12QMAG0cw6viWq+UUXa9ssly
	Gp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FXHENlpQXoHWnqLLztZqaVFWWZtxQ1kgTjFN7cK9cr4=;
	b=bOSbws1929lq5KYN0DsSr/cVbzADhaFu5aSUIlQV4e/Z8LuFjCTQ+XJp15l9ZKpCNQ
	L9P8zoQ4oVwqvI7MPn2HxqjVcMLgy8z6NIDPmnRLxIDi7BIcgLGWcIlzgMAQhqGS34t3
	115lVJN6l4hk/vQ7WCoPmti6iFELwDsWWXgQu+Cd2WNkTae8m4AIkd4fruJX2PnN+3D3
	mNv3aJFCF6BpsYcVKH2nKxwIgfKhWhF6oSI+efnnsmk3ePfNYSvMryMaFwRbYqleid4d
	vskzKoTP6YaFfRvHdb95zxelxHKmku7t1gCPrvs+SHXzJR1TdO/xVfaCIy6jrsZ5urJU
	IPgA==
X-Gm-Message-State: AA+aEWYNJgXL2PU1tQjmMLgvjCcfpd/NgDNgBPMYl1ckUl1t2d1RG7DQ
	2Bb8coL4TUclJ3SlYNZ2UpPDxg5pqu8px+GlGJg=
X-Google-Smtp-Source: AFSGD/UVfaEkT/4KBmX+5uQhEFE0weJ4n+uy6jFckCSVjfcD4GZLgYQKXsjYMDOVCrxFqM6WGI8MxLZjte+rhJZ7sNo=
X-Received: by 2002:a37:d408:: with SMTP id l8mr3496189qki.315.1544223069888; 
	Fri, 07 Dec 2018 14:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
	<CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
	<CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
	<CALbNGRS2L1knaB0OuTizL5+YGGjik1nKVZGAgPdes9HGL1GQEQ@mail.gmail.com>
	<CAMRc=McBw2yvOHzWnc7-fhrO=6K-gzZFb6R7dOhUDYh6uGQbcA@mail.gmail.com>
	<CALbNGRRmfvTJMzQprAUZy4g3KawtZ3=ufgwiyprxrxgjfBX-QA@mail.gmail.com>
In-Reply-To: <CALbNGRRmfvTJMzQprAUZy4g3KawtZ3=ufgwiyprxrxgjfBX-QA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Dec 2018 14:50:43 -0800
Message-ID: <CAMKF1spvAEpkkCod4NvURV-A63N-5xM6D6R=73RbgwEpCANfKQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Fri, 07 Dec 2018 22:51:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 7, 2018 at 2:30 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Fri, Dec 7, 2018 at 11:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > pon., 26 lis 2018 o 23:49 Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 napisa=C5=82(a):
> > >
> > > On Mon, Nov 26, 2018 at 5:26 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > > > This[1] recipe is enough to build pulseview, but I'm not sure how t=
o
> > > > go about requiring libsigrok to have cxx set in PACKAGECONFIG. Shou=
ld
> > > > I add a bbappend for libsigrok that would do PACKAGECONFIG_append =
=3D "
> > > > cxx"?
> > > Have no background but why not enable it by default? Both dependencie=
s
> > > are in meta-oe so layer trouble is not to be expected.
> > >
> > > Since your patch is already in master-next: I am fine with an append
> > > in meta-qt5-extra.
> > >
> > > I suggest once this series is in master please send me a pull request
> > > - will test and create thud for meta-qt5-extra (don't expect this
> > > series to land in meta-oe thud..)
> > >
> >
> > PR sent.
> >
> > Bart
> LOL - am testing build currently. Off topic: doxgen ftp download fails
> - try http...

yes I have fixed it locally see
https://github.com/YoeDistro/meta-openembedded/commit/ff6bead1624a1e2614085=
16b3d064a04aab5f592

>
> Andreas

