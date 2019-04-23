Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5DC7997D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 12:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44pMvR4Z5tz6l;
	Tue, 23 Apr 2019 14:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556021972;
	bh=UbzKq7E5GPRaOM+w8Uvqlg6cRBceTHJZ8nx/1dlPtxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkrVqFFrIpn7iOUZCN4RMR9WDMNW3/E76QrM3p8TxrGgPNQAufnaaM8kDCGYJOumf
	9ubml4L3z7OmwJx0UARCLpuy+b31llbGV8qGtNiLqVk4OlWgNUEOhmzmGzG8di4DXT
	0O/8lLCUUleuo4I9Ai+a25m4GZff4rfF96WfhEBAwPT/CtyiVvgMPNGPOdecgUf03O
	f3SJ+PcvZ7Ul35GWi8z31eCede8CdJEwtJdTba51lIMrGvTj9m2nXt3jX9RBN0Gbb/
	Ezz/mE/xbKleEhOrY523nn4dBI4lkcwvoW5GB5PLhCPhibcyZx5jjlIFQC1pqwdJwR
	HFfxXtzyFvt7zR9i9lPd+HANU0HJz0Hu81Eqd5xJMJU3VEHSvAPV67cRq3bUISKGdf
	7/F04apKt5oVnvOqyaClP+AryuCMAUTLqs4jEA/3JDGqlVkx5tE8rJ+RIapB4WlfHB
	GJLKR5j9UOpPq33HBxXnDJ642oLS7Ag14AHhT/jUx7y9LfPYYAn+ujaOhRUaJDXYUz
	+L+I8IR454bmzSbCvKocZ15Ye1QXleDqghNoc06m+rITrglW9HNs+L+4fmKXymy5bh
	Rctmz5621KK2vZYUbRa9gHu7lyBZX+w+rIAGOK9f5k1WM9fJeclFgnTcTUb03YNvcI
	50O/cKVoPl0p5qli0Niw76Wk=
Date: Tue, 23 Apr 2019 15:19:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190423121929.GA13362@localhost>
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
	<CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
	<20190423060805.GD18826@localhost>
	<CALbNGRQ1Va=0Yn_s17mnr6YeL1V0oNFViFZzeAf1184=WtW1gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ1Va=0Yn_s17mnr6YeL1V0oNFViFZzeAf1184=WtW1gg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Apr 2019 12:19:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 23, 2019 at 01:30:37PM +0200, Andreas Müller wrote:
> On Tue, Apr 23, 2019 at 8:08 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > Perhaps we should have qt5 as a distro feature instead?
> > > Isn't that a different naming for the same thing not working properly
> > > if you don't have meta-qt5 in layers?
> >
> > Isn't this a reason for moving vlc out of meta-openembedded?
> > Or alternatively moving qt5 to meta-openembedded.
> >
> > > Andreas
> >
> > cu
> > Adrian
> This discussion turns into the same direction as seen before on other occasions:
> 
> My priority is building images where things work out of the box and it
> seems this expectation is not common here. There are several default
> configurations around reducing things down to death to save build time
> and make yocto script happy. I disagree completely but won't discuss
> further.
>...

That's not what I was talking about.

My point is that there is no point in shipping it in meta-openembedded
if it is mostly useless without an additional layer.

This means vlc should be in the same layer as qt5.[1]
Which means one of the two recipes should be moved to a different layer.

> Andreas

cu
Adrian

[1] or vlc should be in a layer depending on meta-qt5

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


