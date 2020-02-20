Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 911B2615FB
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Nfjs1kt7z3Q;
	Thu, 20 Feb 2020 17:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582215121;
	bh=VAYpuJJMxouRG1BP3/qQPTHyjbOjklBZC/qNVJCzg3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=su4MceI2/PjQpVNue7ZuU07ljAWvQx7d5OfKQvhZMAgUkIIJVzoyfMuI/His2sfNU
	dUrBULNJFCnf+J9xkLS9Zxl8B2hAS2jOH5QjxlGgxzJ7yVxm0fNTWU5D+rh2rFfF/8
	YCCZ2J/Jo0ZNa3eU7Cv5JvD68E9z79boE+UaiYatdNAfhuu+jE66DMmCLesnug44rj
	6tsAY5RVaV9PjR8nX14XJhi5uExT+fGkg+LEjInOSVAbqOxdOwzM9DAlZUcez9O72S
	bWqsB51WhBBKBNWF5fYqCPTYRBD0fPaYg9TlJs0hEIEkdErgPDxTdG1nMLbcVUQjKU
	K0vLKfl+fyOYRX7c34nZ6YILjcxjV4v8mE24uwRBYxKm4SFEe1uMDoqLrucRE+7rSe
	Rr88N+ppJh3Wt+IDjmH8Im7by5UB1sH3N4JFRUCbFlxtFvGqf7ZOXwkuVbqCLw0ajT
	O8w8K7fCyShp4x4rMmYsxnHcj9MCWDrA82wBgKJeUcfhshvi+fpomR8JbLecfKxM+x
	LkRuGhynC0ndWcwoTff2T/Qzbs+fp0z3LQFow9p+9C5lTWB7c+OKJc1h6axfVk2o8n
	rFR2H/nxE70XLUqDAoUFVsLdUKKfZkwIO3ifk55igTzB5aH5+yYbOjAYyh9SBhuPh4
	G03aAu+oR7LQebMHv6AP689c=
Date: Thu, 20 Feb 2020 18:11:59 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200220161159.GB30034@localhost>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
	<20200220153758.o25tn46hhewgmasd@jama>
MIME-Version: 1.0
In-Reply-To: <20200220153758.o25tn46hhewgmasd@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 16:12:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 20, 2020 at 04:37:58PM +0100, Martin Jansa wrote:
> On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
> > On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
> > >...
> > > Any idea why these aren't shown in our build?
> > >...
> > 
> > What is your mirror configuration?
> > 
> > Default configuration downloads the tarball from [1].
> 
> Maybe I'm missing your point, but these aren't fetch issues.
>...

MIRRORS = "" (and deleting the downloaded tar) is what I needed for 
getting a build failure.

> Cheers,

cu
Adrian

