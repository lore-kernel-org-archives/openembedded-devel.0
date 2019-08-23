Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4558B7F359
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 08:13:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N8CfCE013051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 01:13:29 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 01:12:56 -0700
To: Adrian Bunk <bunk@stusta.de>, <openembedded-devel@lists.openembedded.org>
References: <20190821123824.17831-1-bunk@stusta.de>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
Date: Fri, 23 Aug 2019 16:12:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821123824.17831-1-bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Fri, 23 Aug 2019 08:13:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/21 下午8:38, Adrian Bunk wrote:
> Remove a generated file with always changing hash from LIC_FILES_CHKSUM.

Why not just upgrade to version 1.20.0 which is the latest major release?

Regards,
Kai

>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb}   | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
> index 9ce2d961d..b760a40c3 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
> @@ -5,7 +5,6 @@ SECTION = "net/misc"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
>                       file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
> -                    file://docs/api/html/license.html;md5=233931303ef80eded167add1f60a50c1 \
>   "
>   
>   DEPENDS = " \
> @@ -31,8 +30,8 @@ SRC_URI_append_libc-musl = " \
>       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>       file://musl/0002-Fix-build-with-musl.patch \
>   "
> -SRC_URI[md5sum] = "c8c27116a8083bab5d5fcca0d03e988a"
> -SRC_URI[sha256sum] = "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
> +SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
> +SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
>   
>   UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
>   UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"


-- 
Kai Kang


