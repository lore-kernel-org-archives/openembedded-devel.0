Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 71AB27CE92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 10:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FR2S02bZz5p;
	Thu,  7 Mar 2019 11:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551952817;
	bh=QSALd3U3tHnbCbvG+gaee58F92WWaFhUgDUyOBAE+Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+wd5DIr0dzNu3KRB0GYDQm431+AcNBewcs+WQ77NprjYyIBuMhBZkRA3FN+jFnbe
	IiXtOCMiC1EyA71BY/gUYWF1baRCvNzySsf5jjAYgxcfzZY/X/cY03UWukNcJWcdNM
	xWVYyfjmauhj6DzYqIWJtA9YoBLC0u7Gv7OeyZICizSm+5/kRZnw0FA4L6nmAbT0uP
	v8MGtRdxQGwFrgDC9b71DQXquW22qUd1OshGYNjkJgylMeVD8axf/0HJ2K9kqPlsFG
	BjifaaA79RbTiGHOQxycbgk0kAdRuky/AIxkBuxjmZLQewG7Tsu/cjKdy1hEIzwZBo
	WAjtOtVH/t0HGZYL4bPzP4CJADTZHLa2uoPIFebAgDqhCrATRFKG8OGRXi68pUewVl
	4SR7sqMX4Qqx+IYS8Iw4ckrEhSHOu4CMIDOGtic8Dn/M467xQPzdufhax4E0ZxVNv4
	qkkHdxXAtnE4VbOB4lUgEWFiTIYjMYjqkaB7dK9umy/rjU30e31osCootsVKFoJPAs
	wffisaGlh94KUt/FFA65KgxucHefwIG8wM0MIiZCsYLaaszGkW2Mxj1n1CaJJiPc/s
	a8JbY1MpKnZbPu6nqIUmM6e4ILYOd0e/3sQdGJgwccM2rze9oHCw/lhtFD8RcO+dfM
	2jijNL85evuwC50xKVaCGn4k=
Date: Thu, 7 Mar 2019 12:00:13 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20190307100013.GA759@localhost>
References: <20190307082917.18118-1-sean@geanix.com>
	<20190307085338.GA28605@localhost>
	<c15ece8b-c647-34ca-8f5b-17fac9518081@geanix.com>
MIME-Version: 1.0
In-Reply-To: <c15ece8b-c647-34ca-8f5b-17fac9518081@geanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] asio: add PACKAGECONFIG boost
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
X-List-Received-Date: Thu, 07 Mar 2019 10:00:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 07, 2019 at 10:03:08AM +0100, Sean Nyekjaer wrote:
> 
> 
> On 07/03/2019 09.53, Adrian Bunk wrote:
> > On Thu, Mar 07, 2019 at 09:29:17AM +0100, Sean Nyekjaer wrote:
> > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > ---
> > >   meta-oe/recipes-support/asio/asio_1.12.2.bb | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
> > > index ee548fd3a..ec705c275 100644
> > > --- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
> > > +++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
> > > @@ -20,3 +20,7 @@ SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
> > >   SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
> > >   SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
> > > +
> > > +PACKAGECONFIG ??= "boost"
> > > +
> > > +PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
> > 
> > Adding an RDEPENDS in the PACKAGECONFIG looks wrong.
> > boost should also be removed from the DEPENDS above when it is disabled.
> > 
> > This would be on top of your patch:
> > -DEPENDS = "boost openssl"
> > +DEPENDS = "openssl"
> > -PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost,boost"
> > +PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
> > 
> > 
> Hi Adrian,
> 
> I missed the DEPENDS, thanks :-)
> But why does the extra RDEPENDS looks wrong?

It forces all boost libraries to be installed on the target,
no matter whether or not they are used.

> I'll send a PATCHv2
> 
> /Sean

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


