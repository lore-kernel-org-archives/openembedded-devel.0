Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CEEB87C5FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 18:06:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45D1y91g6vz3L;
	Tue, 28 May 2019 20:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559066817;
	bh=AS3jMrS3RKMvntJZ1lDsBF2Oai/CuiZp7rhUiKB/2LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo5JinY8Z4LLCp0ZLBOGszqLnxV1aH4GbOqUAQh0f+kzuF109PhgZwTLRTvISgvtf
	39fHuPMB91/xM/Pg/a2v+e3KjzHpF4HCjEpXWaCHSj6gKSytzhkpqdbk5qyArCHyq4
	GT/4vT12/tGpEhovSX9ySh9hw3XHXi83/WW/O3iJkVt5LkBkRepgKCeFf66Fu1y2FX
	fRVFwXk2GV2o2UdT8gwaqEs/CY835XzM5I0uY5+68RErDH36q8+g31YexMFLCkywqt
	2wBL037t8tJgSHWKXrBDX7Q5pCT8GWrQLztgNHY4de7NmNEAvSKiXEfQxx9TBhWHwf
	dMhL9UDqDNomMd8hhBghrKnt8JRHwdvpJM5FiFhmgnMG1Hsnh2fJI9lJ2BmPwiTOuX
	tmHD/XGs7lHxZV/aDodutbUzo7pU2M6tr1zeqfDGgWUw3QMZCC0SHSO+CrWTKdWsOd
	TL09Vxm86/gzZE52Ub6MpVTpBT51sA0nkiNgfgZaB4SmHY98/iT1UikyagrsbGtroU
	k0CjWvoYItS5DANFD7K/5IX1PyTz+DCtctmsWI1BgFOUMqF23WyxPssmPiUv6N0hts
	Rd6eIt8GlKdxOL46bVMrNfQT6wK3XmU6l1F/N3mo/9j9ZFcmoAjxuqM87zRiCquR4l
	dR7A9rdMwx/iRow+G+ZelnI8=
Date: Tue, 28 May 2019 21:06:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190528180655.GA14708@localhost>
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
	<CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 18:06:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 28, 2019 at 09:14:17AM -0700, Khem Raj wrote:
> On Tue, May 28, 2019 at 8:37 AM Andrei Gherzan <andrei@gherzan.ro> wrote:
> 
> > On 28/05/2019 16.13, Khem Raj wrote:
> > > Hi Andrei
> > >
> > > The musl patches need to be forward ported as well. They dont apply
> > > cleanly anymore on top of this update.
> >
> > Seems like. So all the contributions now need to go through local musl
> > and glibc testing? This sounds a little bit of an overhead and might
> > discourage people in contributing because usually everyone is working on
> > one libc variant. Just raising it as a concern. As per this specific
> > case, I'm going to fix it and push a V2.
> 
> 
> I understand that and in some cases it’s even narrower where one might just
> be working on one distribution alone for single architecture for that case
> failure on architectures they don’t care is
> also a nuisance
> 
> It’s wide and far testing we can achieve is good for end user same goes for
> multiple architectures if someone tests a given architecture and reports
> build  failures then it’s good to acknowledge that imo
> 
> It’s not a blocker I expect someone interested in a given regression of
> this kind to chime and help if possible so don’t see it as an impediment

Is anyone actually using networkmanager with musl?

There are no obvious usecases where it makes sense, and OE seems to be
adding security vulnerabilities in the musl build that are not in the 
glibc build (e.g. -Dsecure_getenv=getenv) so users should better not
use it in any case.

> If we remain cognizant of the fact that upstream might have wider usecases
> we will generally be better off cumulatively

Upstream ships a copy of systemd code for use as library.

This already implies that trying to support it for musl will be a 
long-term pain of not upstreamable patches for OE contributors.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


