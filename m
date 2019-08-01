Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4B07D39C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 07:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zjF62GXfz3P;
	Thu,  1 Aug 2019 09:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564645946;
	bh=j1XvOa8leFXxzp/aBLih7J3ne4bjxcVtwqyP1Lfm778=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjRGlHA7TXbNswvD9Q9pjgLg/f15YM29LJSeBF6m3b1w7A+Fs9IlFEoS5lim+VWdW
	y4kZ/c/M2PcPSOXT056xJGGhmfWKMv5u3ym6m2pGSrc3+/2M1bJvEkXpCljWYQULo7
	//zBcxwel+D5DMSdlAQ7pHpF+Mrh8F0uIfLoNAJ2WG4dJBhBxEx2npm2ewh0/+LcrL
	6N5tcNJnMcKNzYV5NfOq4AdIFkyRBV3dkkpK1R9QNh4rR+KKTEVlfjveboTsQJQbxQ
	yqGQ4SqnQDvb8YzLtC/fncWP1PdJ0nl/3zfT8f+g+eLwDjfixs8WRJo0+DA8NEDCia
	Ht0i2dycHKtBDmRR/SbjszZe8UbCFQny4vCNqgli8icWuqINXmuzJ6mjCms5E9hG0e
	OneQ8Poj8YcION+rHfXHmtxhXhQrIn+JBhvlHqX40K6f+1ULSOeLs+uZrEQcef3bTm
	w+z01lM0H5RRXcDw91ZIjeqkYQ7WKtzNy7wdigzQrjMKoW+2QZkoSDf1HQJSONSnq5
	eACNT5lk9dK+w2ucqzbN2dhbq8MqVShJYYReUsj5WVCyuz7SWxUSLNIX4RsbNhH36j
	OF1E4o1uqkb8+IA551DVwaW1eYPWoWQPL0ScOkcoR3DUJyHp4Ahb4QXFNGcNYy4VBw
	AORA2PVH+XCE8WOuteSuDA9I=
Date: Thu, 1 Aug 2019 10:52:24 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190801075224.GB12769@localhost>
References: <20190801072323.9435-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190801072323.9435-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] libkcapi: upgrade 1.1.4 -> 1.1.5
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
X-List-Received-Date: Thu, 01 Aug 2019 07:52:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 01, 2019 at 03:23:23PM +0800, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> index 46c66a1..887dedc 100644
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14d5a68b28755c04ebdba226e888b157"
>  DEPENDS = "libtool"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "3c56934f44a8f5a1257c342942e6e034fc6f20be"
> -PV = "1.1.4+git${SRCPV}"
> +SRCREV = "5649050d201856bf06c8738b5d2aa1710c86ac2f"
> +PV = "1.1.5+git${SRCPV}"
>...

Please use PV = "1.1.5" since this is exactly the 1.1.5 release
and not a git snapshot after 1.1.5.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


