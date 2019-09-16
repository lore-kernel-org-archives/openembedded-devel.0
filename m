Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3580C7EFB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 06:47:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46WxdG5MHCz4t;
	Mon, 16 Sep 2019 08:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568616467;
	bh=7xgdE9dfekT0XCcHWbMn+3dwvypEP/7aEoMfuhiABbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrmJpvIjBKA2XZD74MixQ4uO/3LejVv//pYj+5GoXJ3tgf601ZO2uZDPq13/2I+1D
	4ng0UI1vr4elX+71mXnESXzfWV4aJhH0OHQQiV6j/cbmnLV45i42aishKVWvpd0WFT
	e6ATRQtqVVNfe3d6t5YhfFiQFv43VGhFbtiLZUc9FmFFrPS4jmDKU35Da76H81NPMu
	MVxqCOojWDhpfltXwP0nBfaoB3O6M2eNtqqtrUco/oVJewlhlXZhwO8o0d9o/1DgV5
	7mQTEJgnMoMVpw7QX5AhfpFUEikQpVOJKlZLWyoBoIifD2N8ExzFyVxiVZXgS/QFek
	TOxioFrTy7+i9yyAwgafL8r5A2PigUsTWTRTbIAi0FeqBKiNPPla1/dFDbdr22ELhO
	dZfel3qVI9oyuBqR0wRYzYSPaeEsOQIQAdGNFSIRqXqEswJubxFp58q06tvKjgsXyk
	78W6GlYiZX7xf32LEsL1ta49mo/X62V5dTKppQ8AzR6SMSdMBIHiTMKihtR1YdRE3N
	iGSzkyxp6+wfO7i7g5fMCcPqcmeS+9AwqHx1vYCwqedr4ee+f1AZ653CZaZ6dgQV/Q
	ovCWHphEyv965OKlgMwyXItBcW8/mWjSKI9OWL0sLzsfnLH//x7g2VEH5gj+cwIGTA
	LX4c2FcNRfY5AH5ZldJwUOQU=
Date: Mon, 16 Sep 2019 09:47:44 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20190916064744.GA7825@localhost>
References: <1568609129-49183-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1568609129-49183-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xrdp: 0.9.4 -> 0.9.11
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
X-List-Received-Date: Mon, 16 Sep 2019 06:47:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Sep 16, 2019 at 12:45:29PM +0800, Zheng Ruoqin wrote:
>...
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
>...
> -SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
> +SRCREV = "1e4b03eb3c9aa7173de251a328c93c073dcc0fca"
>  
> -PV = "0.9.4+git${SRCPV}"
> +PV = "0.9.11+git${SRCPV}"
>...

This is exactly the release, not a +git snapshot.

Please drop PV since it is already set automatically
to the correct value.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


