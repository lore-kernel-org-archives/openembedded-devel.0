Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2056D7C934
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 17:35:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w4so24514456qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d5wK6jJYlonipCiMenxqNJydacdNhqrIx6oxm3Ub0Yo=;
	b=CX/M3C65DbtBFddZKr6k/5jx2WdzVmlYvX3Wt4ZnqrbrjyN4nBfXbadkIjhhuN9A5Z
	/VCl1VJ56EttjBdlperpI4Ch6Qq9UeY9acI0UF9oiidu7359Lz+QLp6Awow93LRGTZug
	pgarh5OJXag2xwpDQuLMm2kUdgJaGAnyYl6TH1a9TS2n5hwv0F5+ohovjpuD79fcCO6q
	1tH41qTQVp3ez3o5XGwto/1JC3IJ5bpnuYNT1ceDt14rpTuJoIrn6GBC5/xUcMSheGJN
	fDEORrqnMjDz+58I8+SrUobE6acb8vr0Z0b7NbeszmFQ/wSdfqPdRjQRKe4ejnl9wQn2
	YY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d5wK6jJYlonipCiMenxqNJydacdNhqrIx6oxm3Ub0Yo=;
	b=Ct6J3izZB7UYd5FQn6E/N1VvDgWtWlRCN+pIJGV80BLx6uOIEjyDfuZ36+VPA/V3Tm
	y7DIgXZwa7G78KZjpmt2c3U6XsHONryQtCSA7QeYRgxPKNtVE3WwU/CfKVIuMS3/vVtW
	oK37IKL4us3shx2Y0DWs8Iwd4wiZX1xiwcAM4uw1+1e3DeIuPRCzrf8R43OV+FsZzIxg
	uJpHVA6rT1A1cuJzzdVXiqty4A69crgdxl7eCZvIa9KrdoyOeXXplpZviqsO1nIc99k1
	DtbGnAgfPKdDle38gXBpZCTWQAOnaIP5Ca4afRJA8i0MYkA0WldO8e85hufXNRnT4cV2
	shjQ==
X-Gm-Message-State: APjAAAXbQuzeSc/b7IHShJ2ehqeY9rB6qtH5i5gOl+e+iYVhGwLjs8ex
	gDD3GyXLDTpmag1LaGJt1EJL6AKALtIBDF6bx68=
X-Google-Smtp-Source: APXvYqxvZu2gaRJPUT78wG/2oZp7MiDvYs71LBiM8km6y/uS7MWVnKd0NyXmwLsOGXMNhy75hOoSY6hRn6jfXB2dFII=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr355394qte.236.1551375328687; 
	Thu, 28 Feb 2019 09:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<20190222172949.3661-2-nicolas.dechesne@linaro.org>
	<CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
	<870da333acd14eaab709707238e1ac7d@XBOX04.axis.com>
	<CAMKF1sq1BGdFgMckYTjZPta5tMz7iVwBj09Re9h_tFjVd5B+5g@mail.gmail.com>
In-Reply-To: <CAMKF1sq1BGdFgMckYTjZPta5tMz7iVwBj09Re9h_tFjVd5B+5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 09:35:02 -0800
Message-ID: <CAMKF1spvfxpUidxzSv8uSfKXsF3WjjK0g-_uiFnRtkAGY1+hCw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to include meta-python
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
X-List-Received-Date: Thu, 28 Feb 2019 17:35:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 10:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 26, 2019 at 9:39 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > > devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > > Sent: den 22 februari 2019 19:19
> > > To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > > Subject: Re: [oe] [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to
> > > include meta-python
> > >
> > > On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
> > > <nicolas.dechesne@linaro.org> wrote:
> > > >
> > > > meta-oe depends on meta-python, for mongodb recipe, since
> > > > 5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)
> > > >
> > >
> > > The dependency was always there, but I wonder if there is a better
> > > place for mongodb than meta-oe
> >
> > Can we please revert this? Making meta-oe depend on meta-python
> > is not the right thing to do. Either move mongodb to another layer
> > that already depends on meta-python or where it is fine to do so,
> > or move python-cheetah to meta-oe. The latter seems like the easier
> > choice.
>
> I am fine with dropping mongodb from meta-oe and revert this patch
> and the problem I see is that now meta-oe depends on meta-python
> and meta-python depends on meta-oe, which is not good. Although
> having meta-python as a dependency for meta-oe is fine or vice-versa
> but no loops.
>

I think we have to revert it for now. Its breaking bitbake add-layers
due to circular dependency.

> >
> > //Peter
> >

