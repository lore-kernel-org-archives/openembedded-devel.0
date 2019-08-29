Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 794BC7E5FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:14:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KC2z3JGPz3J;
	Thu, 29 Aug 2019 21:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567106059;
	bh=EeZciMZQfS/HVhuyYDe6vz5yEN/wWipQDUSHEE+WG4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETcd7qBTubJnsLfbqsXIA3pEL+xUUgR93fJB4FNMxdDrmloGKkQ2aMngRCps2h0vW
	+xHMhe6PfZml6v1hxSVc1jLlSkabNGCfA/huM1CsJJF5GaGStCbirqrK9sKmAWDqzm
	HoyR4/yKHxqVPjnVWm6fJzvsuysfeEe4+xSRnxhYnVCwrl4i42X4OS7JrQrpytL126
	InwpeSd7jmj2SlOXtECRo68qpTHnKQ1SXRJiBmMH+Vq0NUGDTZy9Ka1RA1C/V2OUka
	oQkly7l01JwVddRz24YQE4gAs74TQoEdrpcr/vv2nrQf75YMyOgRmEcTLWK0lQypIS
	S8rSa6oUoe78vbKaFU4SmVH9E3O6w7GjyUg/0gnEX//mAYWJ45jnRS2wKcQYH/aFuR
	kiTnQCX1Kk5rnBsUsBLDHSTyOp27OTFShGjJeN6j4+ZVR//rxbfyqAK4angi9sxlKV
	eGucHLIHNpYfH+5M8p2jFW0QldMQ/+9MlGW8JzfbFV/vfkyI9uUVlCzAeTA4yASLYD
	VxLyYNcSKXIImlPcq7Q96oL20cwb4/2Btsku1nRnu6SOY7kMadBSMlduAy9HbL7Ijd
	FoRPs2lnKlYCSvIc176wdj+rSKJcOAhKns2R1Gbf7uXe5d9/+JLrnnodKfCUFIsAEe
	Getx+8ZOjtUV0HVlZQ/JLomU=
Date: Thu, 29 Aug 2019 22:14:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190829191417.GA24691@localhost>
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 19:14:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >     if (m)
> >        ^
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > index 50620d99e..fcabeb902 100644
> > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> >  PACKAGES =+ "${PN}-testapps"
> >
> >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > +
> > +CFLAGS_append = " -Wno-error"
> 
> is it possible to fix the underlying problem? since Os is not default
> it definitely could be a bug in upstream but
> by disabling warnings for all kind of builds we are  painting with broad brush

The underlying problem is that some gcc warnings are not reliable with -Os,
there are bugs open in the gcc bugzilla for that.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


