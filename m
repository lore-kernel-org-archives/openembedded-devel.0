Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.6630.1591780230907242005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 02:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=jth5l9WD;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=4237cd248=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1591780231; x=1623316231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBIie/r/+5tnMHggXAhoM8Gn4plSKrFke77UpvxLHFM=;
  b=jth5l9WDW7EdMXdLpMEV+aG3gV4RN72wweHrg4OB+X8r1fXgYd0X658G
   21W33U3Co4NbaJzpiJyInGZAfM6xfTRIWA1rGbWgn8ETHiDPnaLR0l7W8
   8uXDyBVqgqJy1OBkE0+gT4gY9YNi86beaF0WXDTgiNYvicjM1IviP4eKE
   ipzNsYsD52MJq/4bpXDZupChNyhwpFlkm8pIezDdRjVHlRfeji78K7yl3
   j7zkNhNcJTAjo5IToAn9cgdCGnPzi4U3b1r5VZ6AbseGaagylQP0yZcSz
   qp3zTSSHMh/uLKaWyP3Rahf+ErBUed50ogCtyGb5k+PwDM9ngaUnxSAfL
   g==;
IronPort-SDR: kfP0KWBF+J+0YpXLlND628JVY2ZqbC6hEHjeY/RZFiNiA6bipzK84GszCsxCYRT+mmUBrK4Wvl
 Pwkh0oIKx8od4gtNU7NRXZEtpcSOzXg5MjMKEwhjvzDwSeL3NKCQdqOEjfPSFpiu1+67FvNnDR
 l8qsWMrUNzUXdBsT2N5+C26EFduoJdrx5RXwf3g16PcbNorjDruSoF/IG5iX5EiODFIjuVYNgh
 2Az6A0b9S4XRJAmi42dIWTbsSD5GJfa2cJHG6VHhDTTHkJfNNPa6TixUyCkHxtmNS2mChF1vr9
 6+c=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; 
   d="scan'208";a="24817689"
Date: Wed, 10 Jun 2020 11:10:27 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/2] openjdk-8-native: Add libxtst-native to x11 packageconfig
Message-ID: <20200610091027.GB144887@pcleri>
References: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200609145810.4058137-1-fabio.berton@ossystems.com.br>
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

On Tue, Jun 09, 2020 at 11:58:09AM -0300, Fabio Berton wrote:
> libxtst-native it's needed to build openjdk-8-native.
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  recipes-core/openjdk/openjdk-8-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> index 321a43d..f6d617a 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -8,8 +8,8 @@ DEPENDS = "\
>  "
>  
>  PACKAGECONFIG ??= "gif jpeg png zlib"
> -PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
>  PACKAGECONFIG[cups] = "--with-cups,,cups"
> +PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native libxtst-native"
>  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
>  PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
>  PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
> -- 
> 2.26.2
> 

> 

