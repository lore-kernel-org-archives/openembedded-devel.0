Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C2C587F337
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 08:36:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FFB016Grz4q;
	Fri, 23 Aug 2019 10:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566549400;
	bh=EwEF8gaHVYJPmyDfAIuSeeZTMOlYegzo2rLTm6+Q9N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJsd7fTOazQvKjbAyCRZa6i5jiiq5PfyD5dg4GWZoy7qA2/yjvqirpAHyqHE3+q/g
	BxX7sIGpFPylSv0nxnAMCYKikOgOIAFsHxrl4t7/W2YzxuXU8a8eFYbTI4eWwez6RU
	Ebj7oBJhFxkTCNlrSbOfk0jaDWBcpKFTEHWI6GxxOfSAAcvoCWZZklizBZojeRDsV4
	dYwdgmRWfdAdlCPqn3XgjsCde6GloU1WFjgwPodvkJEUwLTZ53kZTHdN06SbrSUgKt
	23y89vzoJV4bv1llVihr+4hDqbwDVR/fDHY4Ws1/LZxE3Nx2dtkWmU8Z2aCKQlwa1c
	0I/ZSJIklr1AMijKKmsZSVot+HXJz1SGhcKWSJBTN6IFOfYQMbmeCnCprqsJwdk8/E
	AeatFXLqK7zglVW7Hi3G83TzTa3PPQcATyvncC/bkaMrtaC6IiPHwbr++YjQXPaFiN
	9JYTe0gOTy1urn7JhHlS2ZIT2arA+yOSjSI5KMotRu/Tjiv0PkqYC0r6Yt56fUxnIK
	nzeKOa+TfRim6gX5XCnk9goarTKHnjSe2x+pWNlTDSZq1YrSphWMCHfKd42uvVGCnk
	d0PtsmjqOqjK4VKAkEhbUXZMx/NGgbwwuEF0F/vd6xnPCvzu/WF612j6xYlBrbel9I
	QmCd9e2Qz1NPupa8AqtmhEdQ=
Date: Fri, 23 Aug 2019 11:36:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Message-ID: <20190823083638.GB9224@localhost>
References: <20190823052215.3208-1-yuanc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190823052215.3208-1-yuanc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] kpatch: upgrade 0.7.1 -> 0.8.0
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
X-List-Received-Date: Fri, 23 Aug 2019 08:36:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 23, 2019 at 02:22:15PM +0900, Yuan Chao wrote:
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-kernel/kpatch/kpatch_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> index dc247942f..508bddb86 100644
> --- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> @@ -2,9 +2,9 @@ require kpatch.inc
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRCREV = "d7c5810e2a6acacfa5fec1e38d2f75af8e8c818c"
> +SRCREV = "2a29bc7dea9a7da12705c7b50315eee1acdd9156"
>  
> -PV = "0.7.1+git${SRCPV}"
> +PV = "0.8.0+git${SRCPV}"
>...

This is exactly the 0.8.0 release, please set
  PV = "0.8.0"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


