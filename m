Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.11449.1586446016799985801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=DXfKcpLG;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=361225990=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1586446016; x=1617982016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BrA0oD5nSfZgIlc71CnRdssisC4ynJPRjQxLgl6yalE=;
  b=DXfKcpLGzLrFrQ0FBcgiZtwMARFuf1sD6ybY0o45LlqaT+ssKWfSzIcu
   uwvdj/xOOLqLRSnFqkfgO3VwLTUX8lnbJFRu5BWnHK3HjQm1zORtwnaVc
   4L0ok1Ag7zf89pkOB8gizib/B0kOpIRU+0PyakPm8Vi13ADEUk883cZ/P
   onT/OsjziH2A/AEXDk4jZcjtXywvSDfT1Qi2UvUWJ3kcMsR4a+z6PHDa4
   m24oih3cQdG9KRwfvxx4BY0U4st9f9voMAqzwMYlTYnTpgezVe3ls5HOZ
   ZwXsDXfTRB2Lt1C7gVHnLZFVPH7A3m56uX3Y4SbEDex6ql4zghRzzAYQy
   w==;
IronPort-SDR: +L7oCZPXlofvNVfMaT9j0XfK61S9M4gK3H/OAVOodLd/8DGkuchbjq7qPHFM1mnPfrZiZ0Vsyg
 o3ATl8O1mja75pq+c7pUPO35Pr82jNnYAAChIeNYod4F3y5rbwYhCKE6xI/GDsjEMul8IZMATb
 7daLJk1D/WIdzw7uWhQlcxBUujrN2phX1nakZYlusdKB4v5cIzNM90njpVN64pq474GEIuu084
 JFgBEn48qgb/hXgkOyLLS1rtHT6w15AKfaFxe1Jr9fwL+YTYZLcDwsW+PiORRr/jzD93UWNlNZ
 VE4=
X-IronPort-AV: E=Sophos;i="5.72,363,1580770800"; 
   d="scan'208";a="23723206"
Date: Thu, 9 Apr 2020 17:26:49 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][zeus][PATCH] Revert "recipes: rename distro_features_check to features_check"
Message-ID: <20200409152649.GA77653@pcleri>
References: <20200330065100.100833-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200330065100.100833-1-jacob.kroon@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jacob,

On Mon, Mar 30, 2020 at 08:51:00AM +0200, Jacob Kroon wrote:
> The corresponding changes in oe-core has not been backported to zeus.
> 
> This reverts commit d2e962a795e8713e5443659669842298453d938f.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>

Thank you for this catch!

Pushed to zeus.

regards;rl

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
> 2.25.1
> 

> 

