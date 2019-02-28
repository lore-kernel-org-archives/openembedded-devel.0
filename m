Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4957CD26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 17:59:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l5so22996931wrw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hKQHmxSANhpX1rLPL+ygyy3t78cqij32PgiPKlR8BTo=;
	b=USIA0VLVEKDAVTTRDhtCT7DlHMsdDUYNnzEF8pit5rEq9J7i8qG9pXChg4so1ux7j5
	VjVe0m0kfWl7Z8avzCYkZPnjbdkJR1uaalm8AaMUpbfiSX5mO0iXmGRpQ81QSeEFjB5X
	MZ+efDKRgRfExCdM+6alaK4VE+9PeFl+5mQ/tAmiRau4zAHjsDAaVE/zi/BcCu9PCl3e
	WUdRTqznwt+2S51Hfqkg9llJXBTZqSqWAUoSazHGVhITW0Ug8m1w2AVIHXUyPlTsoafe
	n0vyAKaQf4hvgoHEx2gxlZxszPlt499z55URNZFDOLhCHc20Xza/TX013E1rIpCfjvSf
	w15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hKQHmxSANhpX1rLPL+ygyy3t78cqij32PgiPKlR8BTo=;
	b=bECdLt9yS+pJqQn5MYnTxSrTANmOf+ZCRjTFT4oBk3cL0FnK5Sb2xpu2WEAfyFshk4
	7agiQnXHBBzm10abYd4FRG+hbDOogB/+Pzz0Kuqna2cYAcR6C6mynm2g2zMcT3jE68cE
	do2fapcrwY6KObxOYtKwND2FPqzwBjKhn2K3fldr5XoBIM/6iuBq2l8R4R+GgZRxf91q
	94ImTmvOGUJtHgaWnVRCGo5eR5fGtXcHY7jkYBcjkfljBnUU9sKjOAPCrZ0uFJa+pnsy
	dRNiRPf2OGTBIe3M+8qcLy4T2h2hzmM5qAkuyM579rzVplDiv/9V1wNdqoAqNb5o+jgp
	BwtQ==
X-Gm-Message-State: APjAAAXLJImyR62SZ91lEPrDaflcFlhVmBuGnkbIPFKmNYZ/kwHKuNtP
	zJ/y6GQ0rEg1W09THY/jINd9DwziLfCBut9oOqk=
X-Google-Smtp-Source: APXvYqwuMWRvTsZTkl3apLgpnCf8Q6TIX9poSfxqUfMCzi0jx5arQ7EI6kIrL5VZKiSEHJ+j78i2Vm8O4/g+Wkjn+p0=
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr433944wro.321.1551376754832; 
	Thu, 28 Feb 2019 09:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<20190222172949.3661-2-nicolas.dechesne@linaro.org>
	<CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
	<870da333acd14eaab709707238e1ac7d@XBOX04.axis.com>
	<CAMKF1sq1BGdFgMckYTjZPta5tMz7iVwBj09Re9h_tFjVd5B+5g@mail.gmail.com>
	<CAMKF1spvfxpUidxzSv8uSfKXsF3WjjK0g-_uiFnRtkAGY1+hCw@mail.gmail.com>
In-Reply-To: <CAMKF1spvfxpUidxzSv8uSfKXsF3WjjK0g-_uiFnRtkAGY1+hCw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Feb 2019 18:59:03 +0100
Message-ID: <CA+chaQdfXhcrNFdFFACR1o0SvghXQP-j70pNTkV3Co0jzRNm-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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
X-List-Received-Date: Thu, 28 Feb 2019 17:59:14 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, please revert.

Having circular dependency between meta-oe and meta-python is worse than:

cp -ra meta-python/* meta-oe/ && rmdir meta-python

that's why was such patch rejected few times already, e.g. in
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg61053.html

before it was protobuf, now mongodb

Is it just python-typing and python-cheetah meta-oe (mongodb) needs from
meta-python?

Why not move these 2 to meta-oe/recipes-devtools/python/ to make
yocto-check-layer script happy for next 3 months before someone sends
another patch like this.

Or we should gave up and copy all layers to oe-core repository and call it
oe-classic-ng :).

BTW: Yes I understand that the issue this patch was trying to fix was valid
and yocto-check-layer is useful in some cases (e.g. this issue isn't seen
by many people because almost everybody needs something from meta-python as
well, so it's almost always included and inter-layer dependency like this
can easily slip-in unnoticed. But if we start making dependencies between
layers willy-nilly, then we will just end-up with one huge pile of recipes
disadvantageously separated in multiple layers/repositories, but without
any separation.

Regards,


On Thu, Feb 28, 2019 at 6:35 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Feb 26, 2019 at 10:14 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Feb 26, 2019 at 9:39 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-
> > > > devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > > > Sent: den 22 februari 2019 19:19
> > > > To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > > > Subject: Re: [oe] [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to
> > > > include meta-python
> > > >
> > > > On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
> > > > <nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > meta-oe depends on meta-python, for mongodb recipe, since
> > > > > 5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)
> > > > >
> > > >
> > > > The dependency was always there, but I wonder if there is a better
> > > > place for mongodb than meta-oe
> > >
> > > Can we please revert this? Making meta-oe depend on meta-python
> > > is not the right thing to do. Either move mongodb to another layer
> > > that already depends on meta-python or where it is fine to do so,
> > > or move python-cheetah to meta-oe. The latter seems like the easier
> > > choice.
> >
> > I am fine with dropping mongodb from meta-oe and revert this patch
> > and the problem I see is that now meta-oe depends on meta-python
> > and meta-python depends on meta-oe, which is not good. Although
> > having meta-python as a dependency for meta-oe is fine or vice-versa
> > but no loops.
> >
>
> I think we have to revert it for now. Its breaking bitbake add-layers
> due to circular dependency.
>
> > >
> > > //Peter
> > >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

