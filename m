Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4431.1591232760321777258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 18:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABDB040BCC;
	Thu,  4 Jun 2020 01:05:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cs7WrR9UB1-Q; Thu,  4 Jun 2020 01:05:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 57CDB40A13;
	Thu,  4 Jun 2020 01:05:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52AD7173209; Wed,  3 Jun 2020 21:05:57 -0400 (EDT)
Date: Wed, 3 Jun 2020 21:05:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCHv2] meta-python: depend on core version 12 or higher
Message-ID: <20200604010557.GA17660@denix.org>
References: <20200604004157.742720-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200604004157.742720-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2020 at 02:41:57AM +0200, Martin Jansa wrote:
> * python3-pyelftools and python3-pycryptodome(x) recipes were recently
>   moved from meta-python to oe-core in:
>   https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
>   https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> * core version was bumped now:
>   https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6
> * this dependency will make sure that people do upgrade oe-core when they do
>   upgrade meta-python past these revisions, so the recipes won't suddenly
>   disappear as a bonus they will get slightly newer versionw which are now

Typo: versionw

>   in oe-core
>   python3-pycryptodome(x) from 3.9.4 to 3.9.7:
>   https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
>   python2-pyelftools from 0.25 to 0.26:
>   https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta-python/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index 7cfeafe599..0dbc4296eb 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
>  # cause compatibility issues with other layers
>  LAYERVERSION_meta-python = "1"
>  
> -LAYERDEPENDS_meta-python = "core openembedded-layer"
> +LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
>  
>  LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
>  
> -- 
> 2.25.1
> 

> 

