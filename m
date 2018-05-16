Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 032B372EA8;
	Wed, 16 May 2018 10:05:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2018 03:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,390,1520924400"; d="scan'208";a="55683065"
Received: from unknown (HELO [10.255.138.168]) ([10.255.138.168])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2018 03:05:39 -0700
To: openembedded-devel-bounces@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <20180516075011.27429-1-richard.leitner@skidata.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <74e44962-1190-8aea-3ad2-a57eb89e752a@intel.com>
Date: Wed, 16 May 2018 18:05:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180516075011.27429-1-richard.leitner@skidata.com>
Subject: Re: [meta-oe][PATCH] stm32flash: add recipe
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
X-List-Received-Date: Wed, 16 May 2018 10:05:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/16/2018 03:50 PM,
openembedded-devel-bounces@lists.openembedded.org wrote:
> Add recipe for version 0.5 of stm32flash, an open source flash program for
> STM32 using the ST serial bootloader.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> 
> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> new file mode 100644
> index 000000000..d401981ff
> --- /dev/null
> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
> +HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
> +BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit autotools-brokensep
> +
> +S = "${WORKDIR}/${PN}"

It should be BPN instead of PN, otherwise this will break with multilib.

> +
> +SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"

This can be https://prdownloads.sourceforge.net/${BPN}/${BP}.tar.gz

