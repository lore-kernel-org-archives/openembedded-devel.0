Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3A56C154
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:57:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44TB466dDJz24;
	Tue, 26 Mar 2019 13:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553605047;
	bh=ZkPt/PzCyKPy5UE1WgmTA3xWalygzN06FhMxWSsiCeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvVq3WYk9IFiuGhWpIGMS/wgGuS/pd5qYt85FhwzWNopl0GBwZPzGlBMIdM04Jzb/
	eJuYzQmFxvs0JH5fXeu8ggcNasImCPtbV9Pq1/9uu944b2y/xnTODxgSFUYEkMElV4
	G2I0iL+8DavSfPDSvUVialEZ44mBDP6Ta5t62tHa/CFA/Hkx0fQxCMNeHiNuJMs0sw
	Q1RuiTBNne/if4UpTYPzWgvdG5z4SnAe9CW4zMBgMYE0X+r3HwbbvburVK6B9lGEal
	ZlekZYYCcMQhokjcowwK/Umw+bYb0CYbGgiCUfOWep57/CiPjdRKBbJRm2kKjWeqEJ
	euC7VytzzqDhM0CPM0X2o6v5yEPj/Sdag0Q3B8qHTq1YzKShjAKHoqNEYbLD0voFk3
	kUY09dp/o/VF4DxszhCqnQXNWwE/2LGv+sPHcYJzk9fp5eFlynlEkyAg0hqY7MG9kg
	aOn6Qn3JpucA4Jn/BnGdSqZNqggmk1ynkDgU4zsUi2R/UPYCSZP7kgd9+A2AiCiOgI
	SeryvOY2zLhEoBTM4Y2obSOG72LHLS7yV4PVbLJZFu1Pu3yYV5fNL/FqA0KD6oBAz9
	4zKaVP0QhdyC/0G9lcEzCFDpG+j13+QEVCgcKmVjPWNF84GWKidbyM8Axo1a3w68Yi
	yjWid0B+zyTa/4sXFsUjY9SE=
Date: Tue, 26 Mar 2019 14:57:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190326125724.GA2428@localhost>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
	<20190322102129.5067-9-schnitzeltony@gmail.com>
	<CAMKF1sqtdp5Fqw+wjUfz33VBeaJUwuT430r+AYdQhn0=Cd9FYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqtdp5Fqw+wjUfz33VBeaJUwuT430r+AYdQhn0=Cd9FYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/11] networkmanager: upgrade 1.14.4 -> 1.16.0
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
X-List-Received-Date: Tue, 26 Mar 2019 12:57:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 24, 2019 at 09:28:14AM -0700, Khem Raj wrote:
> On Fri, Mar 22, 2019 at 3:23 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > * license.html was checked: it is still GPLv2. Could not find what changed the
> >   checksum. Maybe it was generated with a different version of gtk-doc.
> > * Build tested with just gnutls in PACKAGECONFIG to test nss alternative (and
> >   setting no crypto won't work)
> > * Build tested with all entries except gnutls/qt4-x11-free (yes they still
> >   support it!) in PACKAGECONFIG
> > * By far the most time was spent on musl patch adjustment. They apply cleanly
> >   but musl build was not tested due to limited resources.
> > * Fix build for non systemd by making SYSTEMD_SERVICE conditional
> 
> 
> https://errors.yoctoproject.org/Errors/Details/234221/
> 
> ../NetworkManager-1.16.0/shared/systemd/src/basic/util.h:75:18: error:
> unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
>...

NM seems to now ship systemd sources for using them as a library.

OE carries 21 (sic) patches to systemd that are
  Upstream-Status: Inappropriate [musl specific]

This specific error seems to be fixed by one of them.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


