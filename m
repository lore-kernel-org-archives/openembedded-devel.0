Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A0E367EEB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 19:33:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sFJt4TKjz28;
	Sun, 21 Jul 2019 21:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563737599;
	bh=2k1R4NR6KEbnHIACfbS0jd3xGQnjGYxQKGY9O8isTnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VionHMOLUOK+vS1Rkwlaj6GPKEeK+o/bgTwFPjQuAKkyI1m/xNtfIolwdzayIthZ/
	adRqnSHxlj3XwQsrkz4tXpVkH9jEDJC7l7GwLPXzkH0YrAsYuFETVfUEhH4/RwUw4w
	7CCAkMSMO8AqeR01XEmNUzLzsm35crUd6nUiOoJmXdi/tyUYLd4OXHTgv2W0XIQk/K
	OQFYdxGS7jAgCqmQdZvOueHKP1/zs9qfQNp9+Y1O9HQ5tGYNEA31qpU3dRl/qv0WD0
	nZ6+BlluzcYm/QotillIrrOdeidNJTtKknXPjX2jSSj0AM1VDO+bJnoWWJfd3Y5zlY
	pdiVDOWj7MQJBUzlKjrbs33tFIBALRpykD7J2vVwFNnvWRxHppgJ1jwn9w3hzuYAw4
	yRkbjrsb2sLldNYBt4j98BcVwvbxEdCwyu0DqL9B2xh2nPMaOHB10ytNgxquaS7Qwq
	t8iffjrYCrTqn0yVKxN4+BcysfywGZebk8pqcnunuDPuXmSU3xFhVK+WeYpT0tkOUY
	lQzLtObJImiDm57LgmoJBrUyb9nA9Nn9h8mgwUbsTlraInZPgiDE5TCDalEJET+B7W
	6Pt+Xzu5xAuu6NgTBLZwIJ4JqBvvrxF1bU4YuBNM2JEyvJnNWXvoREWPBu4v+iCf3G
	SKIkNMssaIqlXsADaNHbZTNc=
Date: Sun, 21 Jul 2019 22:33:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190721193315.GA13057@localhost>
References: <20190718042123.61092-1-mingli.yu@windriver.com>
	<20190718042123.61092-2-mingli.yu@windriver.com>
	<CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
	<20190721172057.GC8967@localhost>
	<CAMKF1srjusOFUv_gQv0ySx2u=rhPg+_q3r22vScSxPHYKi4YhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srjusOFUv_gQv0ySx2u=rhPg+_q3r22vScSxPHYKi4YhA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
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
X-List-Received-Date: Sun, 21 Jul 2019 19:33:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 21, 2019 at 10:37:23AM -0700, Khem Raj wrote:
> On Sun, Jul 21, 2019 at 10:21 AM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Sun, Jul 21, 2019 at 09:27:33AM -0700, Khem Raj wrote:
> > > seeing gold linker crash on arm
> > >
> > > https://errors.yoctoproject.org/Errors/Details/253440/
> > >
> > > however, this is a linker problem which is latent until this, I would
> > > like to see if we can find a solution
> > > before applying this patch
> >
> > Doesn't look like a linker problem to me, except that it also returns an
> > internal error after the diagnosis for the actual problem
> 
> Regardless of input linker should not have crashed and a crash would
> invalidate any diagnostics that it
> Might have given since it could be due to invalid state the tool got into
>...

It is often a good rule in programming to look at the first error only 
and ignore the rest.

In this case the first error shows the problem, and *after* that the 
error path after the correct diagnostics results in an internal error.

Rare error paths are often buggy since they are not usually exercised.

The internal error is surely a (minor) bug in the linker,
but it doesn't invalidate anything that happened earlier.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


