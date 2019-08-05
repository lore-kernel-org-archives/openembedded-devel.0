Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 997727F343
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 05:06:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4625N71x7fz4s;
	Mon,  5 Aug 2019 07:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564981607;
	bh=t3GaHG7NPhMXjid+36YMo8k1kQeTXLVRvNKVTP42F9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqw7YBr7hek6TmPdHpD/z/iYR/HaFkD5s7I6Ff/FP9icE2aXBMdyEHcHyqYOfJEmV
	oYd/i/bLxDMBYPxZ4/G5p92Jc0hFvdjon9T4OmAiRj8pKCAvmPpjoP1g5UQgmzkXfQ
	b1Pk7h+XBh8CNuL71yMR7DMB6SmmFhBGL4rD4sfJfPnuBtSSMvAC5eMG4W52M9Gstl
	riWT1ydnJsX4TRgkLgX/a0XjXTltmRQI4/mKTqv4rCUf/Pvq6ikBh/vSFgIMLoqETL
	FYSAz00DqiUoc5lVm7FqvosmX/f2FQo8s3H3NRtVN8pbzRyCd9Kh/WUV+gjGsFghYx
	Kl3zOJ9rGOI+OfYDXi5EaCKy/AXK0krPERRA2K16kj1Fp/GA2KMxAL+wM5EdGPBI1h
	o2wfJrbmfLjVBS546+sv3WBvAUwArw5telYc2eXkS80IHe+9Qel3yuwxXKPiD5q+Hz
	r2/xJkLAAiTj7Xt3dvn22tM8IP/EKDlt3hLumoSl+QFM9Syvv7olkur4MDfJsohgFT
	7BgEkQ7GFB1YjhpXiLylHcuJ9lNzHmU7DNecCNjbRSZNAcI/b5CXckncLKlu1Ppi6f
	wkSdqPBolFk+ksTYgj0PMxh+//uOCGyvba0LatP/XUBAJS1ZC/Y/D5yOQM+YbpDFS+
	jtgYyUDKNUw3kPHAMhCjQ5aA=
Date: Mon, 5 Aug 2019 08:06:44 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190805050644.GB4799@localhost>
References: <1564975877-276033-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1564975877-276033-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fio: fix typo
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
X-List-Received-Date: Mon, 05 Aug 2019 05:06:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 05, 2019 at 11:31:17AM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix typo "rev for v3.8" in fio_3.15.bb
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-benchmark/fio/fio_3.15.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.15.bb b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
> index c44075c..f8fa434 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.15.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
> @@ -21,7 +21,7 @@ PACKAGECONFIG_NUMA_armeb = ""
>  PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
>  PACKAGECONFIG[numa] = ",--disable-numa,numactl"
>  
> -# rev for v3.8
> +# rev for v3.15
>  SRCREV = "01bf5128d0581e267383f280c6a1dcd26517240f"
>...

It might be better to just delete the comment.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


