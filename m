Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oj0Wy-0003Qi-Hf
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 03:55:02 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6Y00JUTTAWUWB3@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Aug 2010 20:54:33 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A517A14AF64; Tue,
	10 Aug 2010 21:54:32 -0400 (EDT)
Date: Tue, 10 Aug 2010 21:54:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100811015432.GG7189@denix.org>
References: <4C61E523.7070405@gmail.com>
MIME-version: 1.0
In-reply-to: <4C61E523.7070405@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly	assigned.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Aug 2010 01:55:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 11, 2010 at 09:17:47AM +0930, Graham Gower wrote:
> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

NACK! Not acceptable!

In general - distro maintainers should decide whether to hard pin the version 
or not.

Specifically - below is totally wrong! There is a very delicate dependency 
between specific versions of TI components and in this case they are all based 
on CodecEngine, changing CodecEngine version will change the versions for 
all the dependencies:

>  ...gstrom-codec-engine-2.25-preferred-versions.inc |   22 +-
>  ...rom-codec-engine-2.25.01-preferred-versions.inc |   66 +-
>  ...rom-codec-engine-2.25.02-preferred-versions.inc |   66 +-
>  ...trom-codec-engine-latest-preferred-versions.inc |   66 +-
>  ...-engine-latestproduction-preferred-versions.inc |   66 +-

> diff --git a/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> index 3c3480c..67c3920 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> @@ -1,14 +1,14 @@
>  # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>  
> -PREFERRED_VERSION_ti-codec-engine = "2_25_00_05"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_00_05"
>   
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_9"
> -PREFERRED_VERSION_ti-dspbios = "5_41_02_14"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_02"
> -PREFERRED_VERSION_ti-framework-components = "2_25_00_04"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_01_06"
> -PREFERRED_VERSION_ti-lpm-module = "2_24_01"
> -PREFERRED_VERSION_ti-xdais = "6_25_00_07"
> -PREFERRED_VERSION_ti-xdctools = "3_16_01_27"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_9"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_02_14"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_02"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_00_04"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-lpm-module ?= "2_24_01"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_00_07"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_01_27"

> diff --git a/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> index 5a16f2c..2a9a8ce 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> @@ -1,41 +1,41 @@
>  # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>  # - using edma-lld 01.11.00.03 (instead of 01.11.00.02) to fix installer issue.
>  
> -PREFERRED_VERSION_ti-codec-engine = "2_25_01_06"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_01_06" 
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_01_06" 
>  
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_9"
> -PREFERRED_VERSION_ti-dspbios = "5_41_02_14"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_01_06"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_01"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_01"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_01"
> -PREFERRED_VERSION_ti-xdais = "6_25_01_08"
> -PREFERRED_VERSION_ti-xdctools = "3_16_01_27"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_9"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_02_14"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_01"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_01"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_01"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_01_08"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_01_27"
>  
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>  
>  # PREFERRED_VERSION_ti-dmai = ""
>  # PREFERRED_VERSION_ti-dmai-apps = ""

> diff --git a/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> index 920263a..e533dc7 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> @@ -1,41 +1,41 @@
>  # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>  # - using edma-lld 01.11.00.03 (instead of 01.11.00.02) to fix installer issue.
>  
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>  
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_5"
> -PREFERRED_VERSION_ti-dspbios = "5_41_00_06"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_00_18"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_5"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_00_06"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_00_18"
>  
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>  
>  # PREFERRED_VERSION_ti-dmai = ""
>  # PREFERRED_VERSION_ti-dmai-apps = ""

> diff --git a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> index 3de327b..2936abf 100644
> --- a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> @@ -1,41 +1,41 @@
>  # This is the latest set of TI components
>  #
>  
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>  
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_14"
> -PREFERRED_VERSION_ti-dspbios = "5_41_03_17"
> -PREFERRED_VERSION_ti-dsplink = "1_65_00_02"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_65_00_02"
> -PREFERRED_VERSION_ti-dsplink-module = "1_65_00_02"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_03_36"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_14"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_03_17"
> +PREFERRED_VERSION_ti-dsplink ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_03_36"
>  
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>  
>  # PREFERRED_VERSION_ti-dmai = ""
>  # PREFERRED_VERSION_ti-dmai-apps = ""

> diff --git a/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> index c736208..c42b232 100644
> --- a/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> @@ -1,41 +1,41 @@
>  # This is the latest set of 'GA'd (Production Release) TI components
>  #
>  
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>  
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_14"
> -PREFERRED_VERSION_ti-dspbios = "5_41_03_17"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_03_36"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_14"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_03_17"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_03_36"
>  
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>  
>  # PREFERRED_VERSION_ti-dmai = ""
>  # PREFERRED_VERSION_ti-dmai-apps = ""

-- 
Denys


