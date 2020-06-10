Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.6729.1591780224393190529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 02:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=eFahnIyv;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=4237cd248=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1591780224; x=1623316224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LdhLw4oq3kOyMvCxs26g7NqV8CNAcaEWdq/vEB6cD0M=;
  b=eFahnIyvoEuG/p6BZnMleISAEtwwIsuVy4529CbqpMtx/StIu+hCFz1F
   w6kjpLwRcNuTyzcnR6cA9y60Uce3CzuuA++LWRzMZiuOvrZapKAKKXtX4
   oS8/MoEMBo9A9uAB0JW56jqtuF9y9fdCPzxpO0AhakLSD5akK4WUcsglR
   O8IpT0NCgSsajXZnW0OxjpwbaLmlCvKjPqj+MpH6jEHM+NUJb0WLWxoeu
   8Sm+tDS8o//0mnWO9NhogoOpZYF9RwBCd+LmMyDNJ2RRYiS5krHw2E8fl
   O1UQxgi8nDfxhlfxCkmr92bgiX1ab5d0hAUxNC2eLG/N9E6/b3dbRoZdE
   A==;
IronPort-SDR: dtmkiQlsKTlOPIsjwf/+sWsjFbmXFQwvum03Eds+zLg2mAihdjiB0ZHIBCSKR62k2ZBMgw1UtL
 3/g0mrwEsSkOvWt9kdwvL7Qcr0eKUxfXNG3/9pr578gUqmrMUlOHkUx9cZiwX+IozTzqJHbMxL
 m2YPNHE9GsPY5kh8FSZIQuC+pN4WBhQhXafTPPxsFWDhQYKF/mmCu7YecH+uCzRNIN/c0Ca9ye
 1XOuhcXhTCC1MToOX5Pin05/p8c7YypCL63QA3Bt0w8xJxC03p7n73bv2V1VUqEegowOug+o4i
 KAk=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; 
   d="scan'208";a="2594982"
Date: Wed, 10 Jun 2020 11:10:20 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 2/2] openjdk-8-native: Build cups-native when using cups packageconfig
Message-ID: <20200610091020.GA144887@pcleri>
References: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
 <20200609145810.4058137-2-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200609145810.4058137-2-fabio.berton@ossystems.com.br>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
thank you for your patch!

This is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Tue, Jun 09, 2020 at 11:58:10AM -0300, Fabio Berton wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  recipes-core/openjdk/openjdk-8-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> index f6d617a..24b6f20 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -8,8 +8,8 @@ DEPENDS = "\
>  "
>  
>  PACKAGECONFIG ??= "gif jpeg png zlib"
> -PACKAGECONFIG[cups] = "--with-cups,,cups"
>  PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native libxtst-native"
> +PACKAGECONFIG[cups] = "--with-cups,,cups-native"
>  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
>  PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
>  PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
> -- 
> 2.26.2
> 

> 

