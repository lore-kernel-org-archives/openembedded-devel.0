Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62340602D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 05:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9S5EMpZ023834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Oct 2019 22:14:22 -0700 (PDT)
Received: from [128.224.158.241] (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 27 Oct 2019 22:14:22 -0700
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1572261789-121779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <9eeabeb7-0884-eab9-55a4-18a219615bd7@windriver.com>
Date: Mon, 28 Oct 2019 13:14:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572261789-121779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [128.224.158.241]
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Mon, 28 Oct 2019 05:14:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ruoqin,


Please don't update this recipe because the day 2.0.x is needed by snort 
2.x.


//Yi


On 10/28/19 7:23 PM, Zheng Ruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb}           | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb} (88%)
>
> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> similarity index 88%
> rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> index 42ffb17..29ac5c7 100644
> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> +++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> @@ -25,8 +25,8 @@ EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${include
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>   
> -SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
> -SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
> +SRC_URI[md5sum] = "c61f60674a5f951f0c50faf33a611fee"
> +SRC_URI[sha256sum] = "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
>   
>   inherit autotools
>   

