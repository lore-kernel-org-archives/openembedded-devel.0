Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA037F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 13:57:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476rpN3ZYCzCL;
	Tue,  5 Nov 2019 14:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572962268;
	bh=QUNwHTd4u0nYhhUAc95zxpV780obEPq1bDkJVbjXsM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEeFQ76rSclUFKbLRw5ecgXc/Ki6Nxy8jGwdB24zcn7i/BS22Shz6JSmwIZfk+H5e
	JBGt3HRfjAk6/Q58FikFbuNpvDf3OqmYs7Y+xR6HTVTFcjty7gjIrReHjdanFE2UDa
	K7zhJ6goj3FRHwptZJtqqH2F3vGErbYBJD0iAGvIm3yvUkWYE6S897W72ajB3hP+RQ
	4jW1qIYmSk8r1EmbPVgDcW0NpKOajmZeXdOOTS+IdzLPvKrrmeEOEFydW5n5XwulIy
	KnFOQfWDhvCTtY5flaEOMbfA8r2JwjshIKWtXt8Q7Zi3V/fRFOR0z+4dZkPGJLr/MD
	esB4S/SCceGycjHBYjqMNU7QOP0yxADUNj3GVHiNQigDwxwd9kEx0g0f7mKNQRbvUp
	LvDKkga67rIZp2Y95wdaxNLUolBtIIWp38y4aqMWbrYhTAmV5884Espr1Hjm4kYmSI
	uIXskrSO9Zmrl9v5mDnFDbUhiutdKOv3NIJ0Ag9Hp+dcI93bWYGWa34ccaoNsE7i/g
	VuYoA/VFZL95KYBJyaIolqX/DR5RDqEID6YZ+HN3TZ+gU26b4KBf+yUk+RIFUoVnnB
	egVukBOFtI2nG8im+aAzMGGXDiB0c+4RJTQjaHIeDAcg4v9WFVZAf3yGtOKLEKgNu+
	NPYCH/1RUpz+/m9O3WN12ZkE=
Date: Tue, 5 Nov 2019 15:57:46 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Siegumfeldt <mns@gomspace.com>
Message-ID: <20191105135746.GC20425@localhost>
References: <20191105120031.6579-1-mns@gomspace.com>
	<20191105135512.GB20425@localhost>
MIME-Version: 1.0
In-Reply-To: <20191105135512.GB20425@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe,thud][PATCH 0/6] libiio: backports from master
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
X-List-Received-Date: Tue, 05 Nov 2019 13:57:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 05, 2019 at 03:55:12PM +0200, Adrian Bunk wrote:
> On Tue, Nov 05, 2019 at 01:00:25PM +0100, Martin Siegumfeldt wrote:
> > Backport libiio patches from master bumping libiio to v0.18 and
> 
> Upgrading on an upstream stable branch can be OK,
> especially when this is the lowest risk way to fix CVEs.
> 
> But upgrading to new releases on the master branch is usually not worth 
> the regression risk - the default is to avoid changes in OE stable branches.
> 
> > allows building python3 bindings
> >...
> 
> No new features in OE stable branches.

And even more important:
No removal of features users might be using.

Like the Python2 bindings in this case.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


