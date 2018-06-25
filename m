Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458BE74CA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 00:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5P0EmeY024525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 24 Jun 2018 17:14:48 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 24 Jun 2018 17:14:47 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180624191845.31082-1-raj.khem@gmail.com>
	<20180624191845.31082-12-raj.khem@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <933a82bf-29f4-8102-165a-3635b224a213@windriver.com>
Date: Mon, 25 Jun 2018 08:14:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180624191845.31082-12-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-networking][PATCH 12/20] geoip-perl: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Mon, 25 Jun 2018 00:14:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

This patch can be dropped since the recipe switched to use git:// as 
SRC_URI. bitbake -c checkpkg  can work well now.


//Yi

在 2018年06月25日 03:18, Khem Raj 写道:
> From: Yi Zhao <yi.zhao@windriver.com>
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-networking/recipes-support/geoip/geoip-perl_1.51.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> index ed5c3a9799..bd37ce5005 100644
> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> @@ -9,6 +9,8 @@ SECTION = "libdevel"
>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
>   
> +UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoip-api-perl/tags"
> +
>   S = "${WORKDIR}/git"
>   SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
>   SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \


