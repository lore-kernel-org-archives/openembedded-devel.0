Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7B97E543
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 19:48:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46DJ9l6Zlxz3J;
	Wed, 21 Aug 2019 21:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566416892;
	bh=5l5VCRwM7gdJtSlCbrUyLz2grtWuzisBQBPy7yeGR0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ddwp2LeX7n0H5u37tb4CNEIsKYi7aOjz84AF+uihw4qaDhKiI6K76YhW8w6vG8mHo
	3au/9Bv7F9PauBx73o1otMVj4/cUhaTYk2lEYecVaxIpJsY7+8m4adUrCB4B4c71gy
	zTjtQdWnMI830xkcCTniM5RutA2FFvSPU8VpvwCF+gW977tGSAbpwtFO1wi3SEo+y3
	G2icCjX5iA+aKZqq17OwKcgk4d7M/1o8pJAjRrQ77BipPVGgqCRPJs9Y9Myt6uCBQ/
	zhE4vOFrVRkIp++R+rx3ekRSkiEJwg8XcG7gFGF2oZ6xMSKrGJi2yBn3fYCBiF2iW+
	DIIlbKFJl8ltwlmn0YSfm5QiboBZ0MFGh+tfctR+DHRs5/KCHgxC5Ep+InbY6l3rMR
	3YBt/1hJYZzXc7eSYeQcnHbO0nDelfQlyDnBvMi3Wg4cWpD+UGr/DuSjUMWwdSuixT
	zfZdlTnblTL/v+TCkzuXbVBOlrtlojx3su52nuAajY6yy4vNI8YDurFTwWVGhH79Qv
	eoz/Q/1jukfmC37UbsNQVlH0IAsa7QCRkR21TrZ6z8iWrC+oJBYAIpu3pcyh6r0DWV
	Wd2dtWau67QSg3tbsNGD+fWMgkqYfJRdDKHYxlWhz4CaKavzRFZfCvc0YG114vstiT
	AdS/TD5cFuBFi3A07qjm1pH8=
Date: Wed, 21 Aug 2019 22:48:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Piotr Tworek <tworaz@tworaz.net>
Message-ID: <20190821194803.GA25743@localhost>
References: <20190821191214.4292-1-tworaz@tworaz.net>
MIME-Version: 1.0
In-Reply-To: <20190821191214.4292-1-tworaz@tworaz.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmxml: Use autotools bbclass and cleanup the recipe a bit.
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
X-List-Received-Date: Wed, 21 Aug 2019 19:48:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 21, 2019 at 09:12:14PM +0200, Piotr Tworek wrote:
>....
> Fortunately for us upstream also tags releases
> in git so we can use those tags to fetch correct version of the sources.
>...

There are various reasons why this is not a good idea.
For example upstream might move the tag (yes, this does happen...),
or someone might do a man-in-the-middle attack on a user building
this package.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


