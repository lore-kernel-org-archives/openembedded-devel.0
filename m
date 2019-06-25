Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id DC8CE7DE38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561461126; x=1592997126;
	h=subject:to:references:from:cc:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=vOAL5vkGDHc2O4OZd28RZplf5uIuWcQmTPQvbIAGt78=;
	b=gclHT0dwvEQL2aTFw9JmrGBw24ihrhGYpK7U4a+RSrgAFWYdFMatj9Y2
	53y4fXDUSmTKmRV8GbYbESuuBlMStRe6pouwZw7jfOMGZMgDjjRde1ymi
	VANOmIcqct9qXkKslI7sdrxFaYJwNNfJUAM/Pe/YJv8KRouX8xe788IyT
	s3jVIF57Pu1f86jzizfSgVlLTACWIm4U3dBdeRn0wP/iONbxUupguet1u
	hbCzp2l8qB/ZxzQqLY0ttAWM5JBsWLf9nN33m/vl5PgmoACeosiBq2f2W
	UwRyvw3maN/9FSkhN2PfFTKdEE6zn8I4879tmxIvw2PtLfS7lkJFoDs7F g==;
IronPort-SDR: NTms7WjyYuF6m/XYkpE+4TJaVNNrM1QWy7BrueCnR1RDuASR8KOBgwmyWyrRKt3VLO1IXaof+A
	OdiXmHEo+eoVoCI64ahwLD2wzgVAj7hMFDnM+wqQhXAlfMIK3w69OALBvDhVkIsuc2XpIpznsj
	DRidEelp4p3+duVpTvSgolTrJ1V/oLqC8Fp9OeYf0geEdaIMzc6vorVHCo/nSN1E0oYjKyQb/V
	LkakbBv2SGsxHDSjjyIWRX0yolBdMCe1P7ezQBWbtU99kgDcc3f+wgTu1KhOpGuJ2d2W0Dh83Y
	c2Y=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; d="scan'208";a="17957686"
To: <openembedded-devel@lists.openembedded.org>
References: <20190617131436.24210-1-nick83ola@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <6d8f7ca6-c335-6266-51de-f891d4a62ca8@skidata.com>
Date: Tue, 25 Jun 2019 13:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617131436.24210-1-nick83ola@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-8: Enable HotSpot builds on 5.x Linux kernels
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
X-List-Received-Date: Tue, 25 Jun 2019 11:12:05 -0000
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

On 17/06/2019 15:14, Nicola Lunghi wrote:
> This is a backport of a patch to enable hotspot builds
> with 5.x kernels.
> 
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>   .../openjdk-8-release-172b11-common.inc       |  1 +
>   ...-HotSpot-builds-on-5.x-Linux-kernels.patch | 43 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> index ad20585..a8d3ccb 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> @@ -29,6 +29,7 @@ HOTSPOT_UB_PATCH = "\
>       file://0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
>       file://0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch \
>       file://0019-hotspot-Turn-on-the-Wreturn-type-warning.patch \
> +    file://0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch \
>   "
>   HOTSPOT_UB_PATCH_prepend_aarch64 = "\
>       file://0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch b/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
> new file mode 100644
> index 0000000..f9feca0
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
> @@ -0,0 +1,43 @@
> +From 90220d41f65910b108c901977eefe78fc1edecc5 Mon Sep 17 00:00:00 2001
> +From: Nicola Lunghi <nicola.lunghi@jci.com>
> +Date: Mon, 17 Jun 2019 13:59:26 +0100
> +Subject: [PATCH] Enable HotSpot builds on 5.x Linux kernels
> +
> +8217753: Enable HotSpot builds on 5.x Linux kernels
> +Summary: Remove Linux kernel version check as very unlikely a kernel older than 2.4 will be used.
> +Reviewed-by: erikj
> +
> +Upstream-Status: Backport (http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/5af8ec63c21c)
> +---
> + hotspot/make/linux/Makefile | 15 +--------------
> + 1 file changed, 1 insertion(+), 14 deletions(-)
> +
> +diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
> +index 17c14097..e8f20104 100644
> +--- a/hotspot/make/linux/Makefile
> ++++ b/hotspot/make/linux/Makefile
> +@@ -227,20 +227,7 @@ all:
> + 	@echo "  $(TARGETS_SHARK)"
> + 	@echo "  $(TARGETS_MINIMAL1)"
> +
> +-checks: check_os_version check_j2se_version
> +-
> +-# We do not want people accidentally building on old systems (e.g. Linux 2.2.x,
> +-# Solaris 2.5.1, 2.6).
> +-# Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
> +-
> +-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
> +-OS_VERSION := $(shell uname -r)
> +-EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
> +-
> +-check_os_version:
> +-ifeq ($(DISABLE_HOTSPOT_OS_VERSION_CHECK)$(EMPTY_IF_NOT_SUPPORTED),)
> +-	$(QUIETLY) >&2 echo "*** This OS is not supported:" `uname -a`; exit 1;
> +-endif
> ++checks: check_j2se_version
> +
> + # jvmti.make requires XSLT (J2SE 1.4.x or newer):
> + XSLT_CHECK	= $(REMOTE) $(RUN.JAVAP) javax.xml.transform.TransformerFactory
> +--
> +2.20.1
> +
> 

