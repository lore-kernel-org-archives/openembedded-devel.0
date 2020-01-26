Return-Path: <prvs=2877070d8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 040237FA47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580037709; x=1611573709;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=b3OGX3U6YhfuOTV+qWrZOeu86TCptntiw26lW/H8pPs=;
	b=hZgaSVKOj66fuOU3cXDAEQoG6kRzPR2MAxJbZDPC2TWdqIC3h2h6rPhh
	2muwuTTlN+GM4ncYdRjGXCN+kPZtgsudGcK0bfmDoTx/iAbpofc8/oVHz
	jxzbi+rATpBCWJPZEfgtlNgoUZglPX6yYMPhpz5AqzP+BOzmHDzw8SGKd
	hwipPAQGvC7oexXd/wUViF/9BblCHCg+mintW+BZmKxJ2aBoIJtDZ71Tx
	eNY+C+2WUsiKeZRsueUCa0BtLeEIjtlzKibJcNU6bdr3ieqplc35rSLwg
	LrhPu2Q4g3r6swVd/9J8OMoPvHeE6KHu1sDUabH9f6OSiWTbPezny4xUx w==;
IronPort-SDR: BfQ5Y0kkpwi+DdwoZkMWviLZ8jWwUOX1KzklqO9+RqvuF9hahtcLMeqO22lHR2/GrlkTpK9Oqx
	OQqTNQPNb2WacaOb+2eKpa2oEfy4hEaXOFarRhLC1FdwtiA1ZHY3q9j87kBIY/TrJpUBZzvON3
	Uy1w5Mr4Oe//pC24Wqq1MVtIbL5/DJ3BJoy5zqj3wJmL5SX0s686rqTAWzgC/2TmnrGoqTocwJ
	SI4HCW9opQ+F75/Jhk4hTFTMPv1gU6TujMCFszo2P03VQUzP2yC/SdAO5LcRxu5Hd3utGfLHa8
	8e4=
X-IronPort-AV: E=Sophos;i="5.70,365,1574118000"; 
   d="scan'208";a="2500516"
Date: Sun, 26 Jan 2020 12:21:46 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200126112146.GB2043417@pcleri>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200126111035.273501-1-jacob.kroon@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Sun, 26 Jan 2020 11:21:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jan 26, 2020 at 12:10:35PM +0100, Jacob Kroon wrote:
> Hi Richard,
> 
> I need something like this in order to build on my Fedora 31 host.
> I'm using master branches of bitbake, oe-core, meta-openembedded.

Ok, then please just ignore the mail I sent some minutes ago ;-)

> 
> Good thing is the crash I reported earlier seems to be fixed.

Great!

I'll do some tests on my side and give you feedback afterwards.

Is it OK for you if i rename the "fix-build.patch" to something more
meaningful?

regards;rl

> 
> Cheers,
> Jacob
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-8-release-common.inc   |  1 +
>  recipes-core/openjdk/openjre-8_242.bb               |  2 +-
>  .../openjdk/patches-openjdk-8/fix-build.patch       | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/fix-build.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
> index a8a653b..bd1b9c0 100644
> --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -9,6 +9,7 @@ PATCHES_URI = "\
>      file://0008-autoconf-fix-shark-build-common.patch \
>      file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
>      file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
> +    file://fix-build.patch \
>      ${HOTSPOT_UB_PATCH} \
>      file://2001-jdk-comparison-between-pointer-and-integer.patch \
>      file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
> diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
> index 4ed2e6b..2c8a6a5 100644
> --- a/recipes-core/openjdk/openjre-8_242.bb
> +++ b/recipes-core/openjdk/openjre-8_242.bb
> @@ -11,7 +11,7 @@ do_install() {
>      cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>      chown -R root:root ${D}${JRE_HOME}
>      install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
> -    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
> +    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
>  }
>  
>  FILES_${PN}_append = "\
> diff --git a/recipes-core/openjdk/patches-openjdk-8/fix-build.patch b/recipes-core/openjdk/patches-openjdk-8/fix-build.patch
> new file mode 100644
> index 0000000..e35d0eb
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/fix-build.patch
> @@ -0,0 +1,13 @@
> +Index: jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
> +===================================================================
> +--- jdk8u-jdk8u242-ga.orig/jdk/make/gensrc/GensrcMisc.gmk
> ++++ jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
> +@@ -76,7 +76,7 @@ $(eval $(call SetupNativeCompilation,BUI
> +     INCLUDE_FILES := $(GENSRC_SOR_SRC_FILE), \
> +     LANG := C, \
> +     CC := $(BUILD_CC), \
> +-    LDEXE := $(BUILD_LD), \
> ++    LDEXE := $(BUILD_CC), \
> +     OBJECT_DIR := $(GENSRC_SOR_BIN), \
> +     OUTPUT_DIR := $(GENSRC_SOR_BIN), \
> +     PROGRAM := genSocketOptionRegistry))
> -- 
> 2.24.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

