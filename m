Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.12048.1586447577867882188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=uOlFh6qF;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=361225990=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1586447577; x=1617983577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9l1xO3qXEB8gPruKwHI8xC1Q7fvQUjKi30/Fgh1O53I=;
  b=uOlFh6qF5orMizXQGmP3C/g5TjBDgCDnb07ISP061fwOHwOH7iJOsJvp
   VBJAezO4lITi/gy3mH9wFeFmj1Fjl/i2ZQzbOCf9OUyoe+hV4AV8OUDjG
   Wz8QpwS5FBK8tZwN/9TjeguY1v1CDY8HCx1ZrJ2SWYZbVkRR/V8czuBLk
   mkuyZu9N+6kS9OzpoWmRVgnvNYTQjFda81XfdpTEkFtFx35kIjvj5qqxg
   GiejV/QKQ4VohJSXloZo4tyH4SNz6aDPgw1Pz7dVvHulCChVtI8Qv/NZL
   IyO+7R3pmAbuu3rZ4xBuTx/Z8pBI0oAIm05dacrFDMPhzSgkQtpF2wujP
   g==;
IronPort-SDR: gvLajV4h3FrXtj61HCAlRx8qpZpN+Cvh82N8NO9drOMclI6KrO75JmRjdTsgqpn53g6G5qTxVs
 bK7zOKe/eaidqma71rXCnUiZFrGdkUCE9M2PQiPvo4jfdyVyyXJsHZVPnXD6ry0oTQYjxooAyt
 OU0P0+pxxt+jFHO8TGeh6qIXdiYLYO+oZtfL9oFGSHDOgWD9OA4k2ehpbj5FoDkZv1b+VUHdFA
 KFFaAtfXJvIwsgB2C3UcF0GL4WCUgG2ZRda4lzg7KG7NnGj4bkJXPXYr8mJcrGoL9mITneKYTU
 dPw=
X-IronPort-AV: E=Sophos;i="5.72,363,1580770800"; 
   d="scan'208";a="23723627"
Date: Thu, 9 Apr 2020 17:52:56 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Felix Wruck <felix.wruck@aisec.fraunhofer.de>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] features_check.bbclass: Use distro_features_check instead
Message-ID: <20200409155256.GC77653@pcleri>
References: <20200401102525.25426-1-felix.wruck@aisec.fraunhofer.de>
MIME-Version: 1.0
In-Reply-To: <20200401102525.25426-1-felix.wruck@aisec.fraunhofer.de>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Felix,

On Wed, Apr 01, 2020 at 12:25:25PM +0200, Felix Wruck wrote:
> The features_check.bbclass is not part of the zeus branch of poky.
> Instead, distro_features_check.bbclass should be used with zeus.

Thanks for the patch. Unfortunately Jacob sent already the same one
which I applied to zeus currently as commit 95d56a6.

regards;rl

> 
> Upstream-Status: Pending
> 
> Signed-off-by: Felix Wruck <felix.wruck@aisec.fraunhofer.de>
> ---
>  recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
>  recipes-core/classpath/classpath_0.99.bb      | 2 +-
>  recipes-core/jamvm/jamvm.inc                  | 2 +-
>  recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> index 0e50b68..6783894 100644
> --- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> +++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
>  SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
>  SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
>  
> -inherit java autotools-brokensep update-alternatives pkgconfig features_check
> +inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
>  
>  REQUIRED_DISTRO_FEATURES = "x11"
>  REQUIRED_DISTRO_FEATURES_class-native := ""
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index 5b9d904..714503a 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,6 +1,6 @@
>  require classpath.inc
>  
> -inherit features_check
> +inherit distro_features_check
>  
>  REQUIRED_DISTRO_FEATURES = "x11"
>  
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index b03a5b9..d47b2f1 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
>  
>  BBCLASSEXTEND = "native"
>  
> -inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
> +inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
>  
>  REQUIRED_DISTRO_FEATURES_class-target = "x11"
>  
> diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> index d774cc2..cb670cb 100644
> --- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> +++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  
>  FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
>  
> -inherit features_check
> +inherit distro_features_check
>  
>  REQUIRED_DISTRO_FEATURES = "x11"
>  
> -- 
> 2.20.1
> 

> 

