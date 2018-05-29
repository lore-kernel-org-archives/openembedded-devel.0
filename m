Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A484B7475A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:09:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T79koI001992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 00:09:46 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:09:45 -0700
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
	<1527234893-8733-3-git-send-email-yi.zhao@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <2230562d-1e75-df96-b56d-108f55bdbe6e@windriver.com>
Date: Tue, 29 May 2018 15:09:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527234893-8733-3-git-send-email-yi.zhao@windriver.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-networking][PATCH 02/12] geoip-perl: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:09:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年05月25日 15:54, Yi Zhao 写道:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   meta-networking/recipes-support/geoip/geoip-perl_1.50.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
> index a8c8bcf..0a89be5 100644
> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
> @@ -18,6 +18,9 @@ SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downlo
>   SRC_URI[md5sum] = "2d7f8b1b54e6ba6d9e3fefce52675815"
>   SRC_URI[sha256sum] = "86da0dd67f417a43dc70f15a49bd3619f668970c117b9e7f737b4ab246c240a6"
>   
> +UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoip-api-perl/tags"
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"

The UPSTREAM_CHECK_GITTAGREGEX should be removed. I had sent V2 patch.

//Yi

> +
>   S = "${WORKDIR}/geoip-api-perl-${PV}"
>   
>   DEPENDS += "geoip"


