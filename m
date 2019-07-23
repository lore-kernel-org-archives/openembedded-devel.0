Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE997BFD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 15:20:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tMby19gRz23;
	Tue, 23 Jul 2019 17:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563895214;
	bh=0KzQPb52VZ5SOW/0NOjGGdAik47uKkFMkz8AH32O3uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6NdN/0mMI/bYk4yWAi0SD2mg2esLWU2dIysYRBe+pyL9ilvH1cBjstdIpdlSUNqM
	rc+/NF2WDPQsZmryfKqfDA5+ZyWEDGEyAydkfP/ArrGinfdWqBP5VqOghlmCjPlVjv
	wWQpYcWjxISmBR82b2v8dg2AXx07Cr8FfYTiJ6e7c7dx4LCOly2WwAdXxAIMZTAUzW
	I2aZ/vzcBxgPNz0DutqwdxwD/13DqhdNVQDq/bOfBb6yLwUEnTWrvsgZlANRfupBfl
	qriytYLjHZZaOP5upN38i3aOOKlZbUH2md4aGtid2AfvAFy922bVoRCOvEcajrJk7j
	5elbaZGroT0ZLfxvLA7YwU20BQBJ6saVLV/vFsEQi1JuCvN1VaFimtBc+pUf2wwTeC
	K7rB3czI7FMhKvrEYBub0UnkUrdjPemdVyExTu8hiBYNCsmsoi/2ZKWI6EQx3+xjQt
	neRW352qzqwDRdlOu2ZxdZfIee31RI2KvS4EnHSq5nzjVctZfP1KjbYQ6p3e7eanUj
	63oT9E8c/+yeigeE5talQfwQck/JnBq3En/G4md0mtWO6lV+SR+mbBt1Qi/cqvYuUJ
	U/wFNKx/I52rYg3Ks46VL5CkyK7Q8ujm64ik4ev7fYgIai0oo8vcuLZOxPHhH40Qhh
	qFo3b++o6M0icJoTYF6JP+ME=
Date: Tue, 23 Jul 2019 18:20:12 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190723152012.GA25024@localhost>
References: <20190722130224.9972-1-bunk@stusta.de>
	<CAMKF1sqM6spF1vd0+=fzJz0WyzHx1u_FofPUn=uiE8w9ybc1fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqM6spF1vd0+=fzJz0WyzHx1u_FofPUn=uiE8w9ybc1fw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] meta-gnome: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Tue, 23 Jul 2019 15:20:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 22, 2019 at 09:07:20AM -0700, Khem Raj wrote:
> Adrian
> 
> Seeing this failure
> 
> https://errors.yoctoproject.org/Errors/Details/253680/

A reverse dependency lacked a direct DEPENDS, and this was exposed now.

I've updated both patches and did some more testbuilds,
please let me know if you find more build failures I missed.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


