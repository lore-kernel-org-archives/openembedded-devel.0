Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5393D7F277
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 18:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46hDGN358mz65;
	Sun, 29 Sep 2019 20:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569780908;
	bh=U+dfUO/rKMpxO+80FwvLLXDRGOvn6e09fkrEkd5r9dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeaXO7lrMzGAGyaX4qVZc2d2DYuuxGvBnkZpqmxELciqO59v6xf8P8ltAP0l9cYHw
	HHMG8CH8lFrl9gR/BVynqfkeCDno7Ggo/hB8Rj4cbTUhq7NpiHfjZQDnc5Vl7UhOoD
	8Ctl89LlY+PPs4Am6luz8h/aAV2x7VN3yJSlfnnrQ+w5JNBcCHnsrBrX6PGOCg7hvn
	PsKf07pJc2n3QOVmrPHMluXIS+AeCq0H3bdscwtgSeeuJLdZD3UMv65qg3QzMjhWKf
	nj2LUKdkTa/ZI8oUIgZBLhN74+SvZfdTm8bPjfBxrRmWJ0PPsrrWuUaOIYWy6G1HDo
	dUK2FBaNZYI9rxScGB4XoAGdn3oSBEqGXDsHCxtrmkXU9HI6b9TTFrxrJKoGx8Eq6b
	SnJTHb0WaaFkUYHIEabKDFzq/JCMaE3AfBPm/lEesCscURToLxdcJe5CW9WZVmoGm6
	71gX6LrTVt4CmvxHcjawUQYDYLHXzNzjBfVOMfmxasr8v+XFDBqoRm0L/w6a/wJwF4
	Krj8qOopwioxlfv8TjCvGIrmN2LOLtPeOHWMS196eN5QU6mGO3ogSA2L4L56K5rLmA
	9Wg47ecTOMTGGEVrvu08/kTW3RGE5rZk1E7pxXXZLaRe6kd5l89klnz4WTa7j6NNG6
	b+wQ9SvCraxQJ5An2itulRmc=
Date: Sun, 29 Sep 2019 21:14:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20190929181449.GD30130@localhost>
References: <1569632199-7446-1-git-send-email-denis@denix.org>
	<20190929124339.GC30130@localhost>
	<20190929162007.GZ30018@denix.org>
MIME-Version: 1.0
In-Reply-To: <20190929162007.GZ30018@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [thud][PATCH] mariadb: update SRC_URI, as 5.5.64 has moved to archive
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
X-List-Received-Date: Sun, 29 Sep 2019 18:15:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Sep 29, 2019 at 12:20:07PM -0400, Denys Dmytriyenko wrote:
> On Sun, Sep 29, 2019 at 03:43:39PM +0300, Adrian Bunk wrote:
> > On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > The old URL now gives 404 Not Found
> > >...
> > > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > > @@ -4,7 +4,7 @@ SECTION = "libs"
> > >  LICENSE = "GPLv2"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> > >  
> > > -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
> > > +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> > >...
> > 
> > This change should first go into master (and also warrior).
> 
> Yeah, let me just go downgrade master and warrior to this old version, 
> so I can fix the download URL...

archive.mariadb.org has all versions, including some that are even more 
recent than the version currently in master.

Not changing the URL in master now will only bring us the same problem 
in zeus later.

> Denys

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


