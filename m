Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A64797F38D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:46:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46tTVJ4w32z1n;
	Wed, 16 Oct 2019 12:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571222761;
	bh=TgvvJULEG+8SmDA+smVlE0RNVpov2cVwUaVK3hGb5P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1xqw5oUcBcXDjL09ux3XsMWHtF2+wFz68s8F8724/MS8sLeCcp8v9jQyyxqn4W8S
	QYiQzeVCRaiqy1YxYF/aY636oJd8z2GYzrQ/nKwWJmp1hqm9nzdi78sq0gec32SYD9
	Cs4eKiGgsq0GJ5myk3tW4EYcktdAP0HVMn2yyPlznD5JoD3neCy6ZIug7r+dmBZSYx
	rviV/GhSbxfFo0scd1bTsMIqPUeiEJBRpRV3xTHzT3MFLHLR1SLdfennxF/BXDyUBO
	CcFfMVk9x+NvQXEi4nYX8Pdzq9ufeAh/fQ8VhD0NAZGoxn4Fj437Qi7uOHhLa7VqYX
	AhfbdbUhFy2jMXS+xYT16OI2KN20sRkS5qodikeY/qcsFZeH1aM9Z02U80Q2oTJAQn
	VlyvHAQMOP5xtVj2RVGkdFUqrVUjba62ZX2w350ub0XIkgIdp0cHK3ezZCeEp4oWe9
	ymhFjcNusvUw08mUlQBiZpdwEsMtfCW/roXOt9FSkncm0VvtaFIqk/ZdhyTMv+TLwI
	53i8ndJ19GYV7sZA2YhfVf+xgMBiWtbxtDXK9cSoBhHK8iEpQevMTi1hXOnHeaiH4f
	SALv2oA+IHEI3v5heqK/XSABEGxj6AprhGcGe0OkZGtsWXhfD8htQfKQhg/J6jkTEm
	3By0iViOl1Rq4pm9X7WYnTHI=
Date: Wed, 16 Oct 2019 13:45:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: marek.bykowski@gmail.com
Message-ID: <20191016104557.GA7998@localhost>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] lmbench: fix/clean-up the build for lmbench
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
X-List-Received-Date: Wed, 16 Oct 2019 10:46:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 15, 2019 at 02:13:41PM +0200, marek.bykowski@gmail.com wrote:
>...
> +--- a/src/lib_sched.c
> ++++ b/src/lib_sched.c
> +@@ -22,6 +22,7 @@
> + #endif
> + 
> + #if defined(HAVE_SCHED_SETAFFINITY)
> ++#define __USE_GNU
> + #include <sched.h>
> + #endif
>...

1. The correct macro is _GNU_SOURCE.

2. It must be defined before including any headers, otherwise it might 
   have no effect or cause weird breakages.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


