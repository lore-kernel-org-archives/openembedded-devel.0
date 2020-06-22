Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6259.1592865145114130258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50C5640BA1;
	Mon, 22 Jun 2020 22:32:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcKzGeM6grjj; Mon, 22 Jun 2020 22:32:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21E3C407DA;
	Mon, 22 Jun 2020 22:32:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B7C4173217; Mon, 22 Jun 2020 18:32:20 -0400 (EDT)
Date: Mon, 22 Jun 2020 18:32:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Chandana kalluri <ckalluri@xilinx.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
Message-ID: <20200622223220.GJ17660@denix.org>
References: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
 <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yeah, not gonna work - many people are waiting for this to happen, but alas:

https://bugs.chromium.org/p/chromium/issues/detail?id=942720


On Tue, Jun 23, 2020 at 12:16:51AM +0200, Alexander Kanavin wrote:
> Wait, did you actually test this? Chromium is not yet ready for python3,
> and builds will fail.
> 
> Alex
> 
> On Tue, 23 Jun 2020 at 00:09, Chandana kalluri <ckalluri@xilinx.com> wrote:
> 
> > From dunfell onwards, python2 recipes and classes are not supported.
> > Inherit
> > python3native.bbclass for chromium instead of pythonnative.bbclass
> >
> > Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> > ---
> >  recipes-browser/chromium/chromium.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-browser/chromium/chromium.inc
> > b/recipes-browser/chromium/chromium.inc
> > index 14d762f..a483ec4 100644
> > --- a/recipes-browser/chromium/chromium.inc
> > +++ b/recipes-browser/chromium/chromium.inc
> > @@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
> >  # to build the native recipes (e.g. GN) with clang too.
> >  TOOLCHAIN_class-native = "clang"
> >
> > -inherit pythonnative setuptools
> > +inherit python3native setuptools
> >
> >  # Chromium itself is licensed under the 3-clause BSD license. However, it
> >  # depends upon several other projects whose copyright files are listed in
> > --
> > 2.7.4
> >
> > 
> >

> 

