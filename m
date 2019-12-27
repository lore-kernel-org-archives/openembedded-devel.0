Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Dec 2019 10:38:50 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 54C5F71B99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577443132; x=1608979132;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=0XE3twXx3mEoFDs6+M51l6hRkN9Lpi4QcppLhDVSU3k=;
	b=ew1RBk30VpHvoPMMmYxR+4pQ8K11iQ2vN0joopgN5YoIIxYoBNmbfC+e
	04SgH1aXUO/cO1tWYnFIfR1sa6V8rJC9KYnYMD7ZMjZ/YUaneSXIHNWVv
	X/HcbCbRXIENEvNxyO7NwSI5KFhFv9FuI/3Ij5/focYsrjUWbEWMryXQw
	AN/IalXLwYs7I2T94DU/iLAhLt2wm+aGvfnpe6BD6S1L3J60s9p5ARF5r
	epIGprc2UwNOTSn3UEvkxYjJJDxZy9n1BLyw4OneV/k4XbrtPxb4ACYgy
	F5Wp/ZBL4LiyYS/Rw1QRsalJs6XpaRnZTKwv2LgdrGgs649btXQIwg3K6 A==;
IronPort-SDR: C6wk3Oxmhn0FxQBrCl48AW58CM9JhWCTN+CA03siTvHpu0GAuKxREl8iG7I6wQFjeCe69oPizM
	IBYbsYWSouCfSF4Gi52y36Zmr9iSiqJ3NKT5gis186xwWRfwYRq12dbdSO/TNe9xD2QI6pAGQS
	P34jNx6aD3PsgcB+AkbEK3R+HRsUcXSXszMG6IfdhCX/ugS31Z63DI38uajETWX8V4YHW0fzwi
	j/GwoiBXBw+GZcA5wlYbfHP1Dccc1MkQF+C2F8i707QEVFlt9HeUrbM6SSODv5ahsi2CFRS752
	g8E=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; d="scan'208";a="21732762"
To: Alex Kiernan <alex.kiernan@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191207180738.40895-1-alex.kiernan@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <39345f6b-4849-b6d2-a990-a988d2d383df@skidata.com>
Date: Fri, 27 Dec 2019 11:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191207180738.40895-1-alex.kiernan@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java] recipes: rename distro_features_check to features_check
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
X-List-Received-Date: Fri, 27 Dec 2019 10:38:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 07/12/2019 19:07, Alex Kiernan wrote:
> Avoid warning due to the class rename in OE-Core.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>   recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
>   recipes-core/classpath/classpath_0.99.bb      | 2 +-
>   recipes-core/jamvm/jamvm.inc                  | 2 +-
>   recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> index 6783894907d7..0e50b686e107 100644
> --- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> +++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
>   SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
>   SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
>   
> -inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
> +inherit java autotools-brokensep update-alternatives pkgconfig features_check
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   REQUIRED_DISTRO_FEATURES_class-native := ""
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index 714503aab6fa..5b9d904636db 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,6 +1,6 @@
>   require classpath.inc
>   
> -inherit distro_features_check
> +inherit features_check
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index cdf087ec8afd..387d799bff03 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
>   
>   BBCLASSEXTEND = "native"
>   
> -inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
> +inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
>   
>   REQUIRED_DISTRO_FEATURES_class-target = "x11"
>   
> diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> index aa165f5075a3..87de6be12ac0 100644
> --- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> +++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>   
>   FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
>   
> -inherit distro_features_check
> +inherit features_check
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> 

