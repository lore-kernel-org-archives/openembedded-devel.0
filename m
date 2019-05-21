Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E5BF27E27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 18:05:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457kG30gbMz7k;
	Tue, 21 May 2019 20:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558461947;
	bh=eiYx+FKYPI/wElZ7ieAN9zvzhhxRImCfUqQcGHLogJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdqCimSjx2hNKGt/Sz5GdWbkbfhGudSSR21vlOQgAy6Xg4Pk3WBQc7cFZhJCK1ZVi
	4KFpigCNERZenLX/oxqlUMC9i2tZy7KY7/2s6C4y8D1QkjAVXoJpCaq70Pgl0HHQAr
	mbevbfJIrl7LCBVpEl3yv2iwwpw7pg1BzBbAu/32A0erLLC+eIKfdNLDwSBeVJ53Zp
	zScN6LOqNgANRG6ZcDRtF10dq86rRX1Ht8yDEvqtisMrLxudeSq+822Q1ZHEjBFKob
	50TvSma55g1fqSXE7Cup6UJRT67STvlOto+1hL0euTZhKZRc8+5SEuhXmyLo+z3OpX
	R+lbKB2OPrSdTo0Opa2deFSS5mn9051SjOhkPPy2fgIJ3zDJEEEOWn1x3OKvvQJyNQ
	b3QJRKl5whRvLdwUxwP51wmbyuj2yZ2G/uM8aXPyClKjegKGAzgnqRWrABVVirtlCL
	t2J10Mb7dFK/PiiromPQ79Mz7/Hr1VO5GaHehoagG0stXFpEQxf1zGvVxkSBF+wAjZ
	unaFj6uK8KxyFo5t+8ep5BOpcOvAKPVISWyxLEHfm7LgV9HAwvVHlXM3184/51Y7Tk
	Qf06UzzMcb2CvGopwPW4MYv9n+g6F8IFIvofcxpevm9Qi6m2+3R1DUcEIilO8ACKpO
	Y7oT4LpVE+dlFMB9UguGSzrc=
Date: Tue, 21 May 2019 21:05:44 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190521180544.GA9045@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<fd48edcd7415f4a1ca043e256585f2705b66545f.1558410874.git.akuster808@gmail.com>
	<20190521064032.GD9971@localhost>
	<13e0f089-cd2e-9084-279e-1a048911e543@gmail.com>
MIME-Version: 1.0
In-Reply-To: <13e0f089-cd2e-9084-279e-1a048911e543@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 02/34] python-pyasn1: upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Tue, 21 May 2019 18:05:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 21, 2019 at 07:52:49AM -0700, akuster808 wrote:
> 
> 
> On 5/20/19 11:40 PM, Adrian Bunk wrote:
> > On Mon, May 20, 2019 at 08:56:02PM -0700, Armin Kuster wrote:
> >> From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> >>
> >> -Upgrade from python-pyasn1_0.4.4.bb to python-pyasn1_0.4.5.bb.
> >>
> >> -Upgrade from python3-pyasn1_0.4.4.bb to python3-pyasn1_0.4.5.bb
> >>
> >> -License-Update: Copyright year updated to 2019.
> >>
> >> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ..
> > No reason is provided why this should be upgraded in a stable branch.
> 
> There is no meta-openembedded process or requirements for stable
> branches  to provide reasons in commit messages.
> 
> The precedent in the community is to provide minimal or no comments in a
> commit message. So the burned is placed on the Stable branch maintainer
> to do the leg work the community as whole should have done.
>...

For master the default action should be to upgrade to the latest
version, and no further rationale is required for this.

For stable branches the default action should be to do nothing, unless
there is a reason why something needs backporting or fixing in stable.

Stable branch maintainance can anyways not be based on just 
cherry-picking commits from master. Many important fixes, especially 
many CVE fixes, will need a different fix in a stable branch than in 
master.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


