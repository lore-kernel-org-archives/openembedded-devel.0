Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC3E7EC56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Sep 2019 06:32:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Lk0g5C9Wz2Y;
	Sun,  1 Sep 2019 08:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567319556;
	bh=lF9X2s6L+2eun98aN+OSD+mIAcMJT7IRpOXKoYyI3ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCNnlJnlYkAZlmm7z45znOobcJh4J6jFUlbkDycmyHaT/nW+CZ1aEY/csrYU7Yl3E
	SgCJO9CkNfQuw/W7aZI3J+dSVvNR2TdlOBVEtIxbBHdGx3/4OIn0etwGjXOoVuF92g
	MhmJVJ50PSvl/Qv4doHpqABb9OFUvOZCXLRDZhAt/K4zTsS+XLncW0iC4lJcQRomM6
	VqXAZKazMTLPNRbsWPV4MvGiU1agaCENvno/m6Dwv2aT9ZQ1f3Lpad9hVst/dMhvDl
	7Sg5kxOa896wMUZ+VlAtkSWFmGvNTHRCHA/ILskitcOjdQZv5XtgIRPYda5krmmOOd
	s6n7dDtcpOk8KgUIaT3pIg3ieTULohQ05o806wFfV+j8jyE8LtTDjGLkaQgXB20FiJ
	rO6ZpAS/dLJFaOYQ5WOH8F/TdJ+dr7k9ta4UTIgzs0uUG5FsS1wp/kHcg18gx+GEwB
	HJefISQMhsbDblwj36b5f8ovDN4pC/IwZc47EIS3rIku+6NZxdtzBfrLF20JzwquNt
	9H5G/1qTNoJyzC+CxksaSLv45AJpC8c3k+WytaSvr4SiN1p5vN2qjQxR0VWWZ3r1cE
	qS21eMKUMosqPdrKgrnay+Pym6JHpG4v5RGeIBfxVzk2aocT8NgcuiU3GcEtExf/+a
	pDgAMoQ29y+JJQAmkGfFz9IU=
Date: Sun, 1 Sep 2019 09:32:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Message-ID: <20190901063232.GA22307@localhost>
References: <cover.1567286967.git.akuster808@gmail.com>
	<6404de28dbc2189edeae0045bd619b91de54198d.1567286967.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6404de28dbc2189edeae0045bd619b91de54198d.1567286967.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior 14/23] libopus: Limit forcing ARM mode ISA to v5 only
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
X-List-Received-Date: Sun, 01 Sep 2019 06:32:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Aug 31, 2019 at 02:31:35PM -0700, Armin Kuster wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> This lets newer armv7+ still use thumb2 ISA
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
> index fb9bdc7..1512a1d 100644
> --- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
> +++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
> @@ -50,6 +50,6 @@ python () {
>  #| {standard input}:761: Error: selected processor does not support Thumb mode `smull fp,r2,r3,r9'
>  #| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
>  #| make[2]: *** [celt/celt.lo] Error 1
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"
>...

This is an optimization, not something that should go into stable.

It also looks buggy, as if it would break the build for armv4t
and some armv6.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


