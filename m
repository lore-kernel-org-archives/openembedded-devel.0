Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.661.1588281022953868887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=lqkkHrZX;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3828d1ea9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588281023; x=1619817023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=djzZ3RsS/ltciyECxc1A7tL+PCmqmw363hQ59gr2DTE=;
  b=lqkkHrZX00GYXUeMO59mozjCRNHYkhUi9M83SFOURheatO/LM3ZO+55z
   IE2zv5exfAAqITumn0Bfp7N+yRbl43H3l24M3bcRxTOaG0xGF0IaR489H
   nQotNQgdjY5I0AO/bNYUrlh9oDvsbwIhCnxpZQCmrhlCU95s8viivrAej
   znO8zzGn1t6OpMLz80pdATc+1VEjThHvwnJzupaLQh96NHaOX20TEg63u
   yqxE0FHAs9G49VZuV+s2fRSFxCxacO8PaO55kqU6YQ8z6M37ppSoGZa45
   j017dXpwJ3xi4VY50tK+aaCQYnniNFzJXqY2DbhnNkEOhWFskNmgPPCSz
   g==;
IronPort-SDR: dnQv9mz4YZ7v/n6KFMg4DadCoip2K0WvRMNbp2vpWdxsJdh4wbBJ+EEyyCy+DJ/6JhvjR3iZQz
 2O24MPlEkKaPj9EJXl6om1SokwSZvlvE5ntldxGxUFV1NsYipPmzz77+mXAC7F6gnWoQmFiJT+
 2ltQ5U6hGC4FgdXlyQPe4BI1odL+rne+dahxiZA0qFd1pBqmbtJcTVA/L2e47H42dTyWG4Qz/Y
 /bENSrk3Kk7iNk4NNUCYLxyDkvxhjDJxezpa0X+d9vKBYHB91esiAI6gxXRnjbYqsG4CGtilIH
 c/Y=
X-IronPort-AV: E=Sophos;i="5.73,337,1583190000"; 
   d="scan'208";a="2573306"
Date: Thu, 30 Apr 2020 23:10:19 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jacob.kroon@gmail.com>
Subject: Re: [oe] [PATCH][meta-java 3/3] openjdk-8: Fix building with GCC 10
Message-ID: <20200430211019.GA410632@pcleri>
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
 <20200430131556.2150334-3-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200430131556.2150334-3-jacob.kroon@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jacob,
thanks for the patch!

On Thu, Apr 30, 2020 at 03:15:56PM +0200, Jacob Kroon wrote:
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index d8b30b8..5228338 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -176,6 +176,10 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>  FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>  FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>  FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC10 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +
> +# GCC 10 defaults to -fno-common, but OpenJDK 8 is not ready for this.
> +FLAGS_GCC10_append = " -fcommon"

Does setting "-fcommon" also work for GCC version > 5 and < 10? In
icedtea7-native you've appended it to CFLAGS it w/o GCC version.

Background of the question is that I'm currently planning to drop
support for GCC versions < 6 in the recipes. If done so, we currently
have no need for version specific flags. Just want to check if that
would be an exception. Thanks.

regards;rl
