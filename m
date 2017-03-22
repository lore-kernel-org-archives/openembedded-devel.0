Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 33531606B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 08:18:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2M8I2Pd009376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Mar 2017 01:18:02 -0700 (PDT)
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 22 Mar 2017 01:18:01 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<20170313032921.8669-4-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <1a1d1994-a982-fa0a-667a-6bd3a8d50b79@windriver.com>
Date: Wed, 22 Mar 2017 16:16:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170313032921.8669-4-kai.kang@windriver.com>
Subject: Re: [PATCH 3/5] libdnet: update SRC_URI
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
X-List-Received-Date: Wed, 22 Mar 2017 08:18:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年03月13日 11:29, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The official site libdnet.googlecode.com is redirected to github. So
> update SRC_URI and its checksums. And update S as well.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> index 28b6c82..aff64c2 100644
> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> @@ -4,10 +4,12 @@ SECTION = "libs"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
>   
> -SRC_URI = "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
> +SRC_URI = "https://github.com/dugsong/${BPN}/archive/${BP}.tar.gz"

Hi Martin,

It is weird that the tag 'libdnet-1.12' is not contained in any branch. 
I am afraid it could NOT use git repo for libdnet.

Ref:
https://github.com/dugsong/libdnet/commit/12fca29a6d4e99d1b923d6820887fe7b24226904


Regards,
Kai
>   
> -SRC_URI[md5sum] = "9253ef6de1b5e28e9c9a62b882e44cc9"
> -SRC_URI[sha256sum] = "83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
> +SRC_URI[md5sum] = "d2f1b72eac2a1070959667e9e61dcf20"
> +SRC_URI[sha256sum] = "b6360659c93fa2e3cde9e0a1fc9c07bc4111f3448c5de856e095eb98315dd424"
> +
> +S = "${WORKDIR}/${BPN}-${BP}"
>   
>   inherit autotools
>   


-- 
Regards,
Neil | Kai Kang


