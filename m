Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2AD7C89C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 19:49:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46fQV65Fktz2Y;
	Thu, 26 Sep 2019 21:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569527343;
	bh=uixvuEPUXvGH7LQ4IyCPlSB6HFdbuuF8peRJm1lonJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSLrZk0fl1GtRjBc+UFsnfFhxKQ4YOPDXGgtYz/Hgy1kwRW9ubmrB7qJ7h8lDVgGr
	nYNh81I5gF7R40rBPjh7HjMbgJi+2WYlFGt+G6Lv30HrAQy/K48erVfFqsu1bCeCyl
	jQFFoF+WbgrFfkkA0iIXUYP6ZScRhgBheEijHOR4DTImiA+F2wMYTY3KLrBQ/iB7Ez
	EUiF5ZeY2CK2oAqUydN/Vo8RcH/4Fb8ICzeFCYr9RQDACIOmTLq6c3FUahQUwTaQ4J
	dIf65AXgO/EtHScQQwlbUj57Cv+4J5pdlw4NDDIHu3TWdJJqSw7nlu3tcldmcAGv5k
	nbX7V3kXf4+3SQC37VYt+mBkPLuXy7mWG8ZsOLrGJyqFMxt41/v4BV8KIeDIf/nCrU
	+qGuiCWM+vYNRbkTE7UCX8rAKSprDutlKClbmFmdecrjzdVBDuB5DvFSx1rmxGaZtl
	uIfN5uZiZHIRTZt+ByswW2XUc+yb60FryCLLHjcLe0O7hKQYzjWSb1YdpjZY3CXemp
	HL8cEJOuxla1+xjdnZnZJjLXRTZ+8fETMtRXI58wp49G3X5BQgnMsrLjLBgMoUVMWs
	F+JbuNYT5aXS8yPXopRDrgrWnsC81I0RjvXjttT6Waq3HR+q7gERD3bPuwk5gerYiw
	ZbNv5G5Nf2wV1E4jmS+uGkMc=
Date: Thu, 26 Sep 2019 22:48:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190926194855.GA27652@localhost>
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190926162655.375600-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Thu, 26 Sep 2019 19:49:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 26, 2019 at 04:26:54PM +0000, Martin Jansa wrote:
> * with older native gcc on host this will break spice-native with:
>   cc1: error: -Werror=address-of-packed-member: no option -Waddress-of-packed-member
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 30e939ac07..2829a59d15 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
>  export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>  export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>  
> -CFLAGS_append = " -Wno-error=address-of-packed-member"
> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
>...

Least hassle would be
  CFLAGS_append = " -Wno-error"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


