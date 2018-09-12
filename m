Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E92F479652
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:28:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C8SIn3018537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 01:28:18 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 01:28:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
References: <20180912082642.35624-1-hongxu.jia@windriver.com>
Message-ID: <8a566f88-4b87-b0a4-228f-dbc2bbb8981b@windriver.com>
Date: Wed, 12 Sep 2018 16:28:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912082642.35624-1-hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH] cyrus-sasl: use autotools-brokensep to build in sources
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
X-List-Received-Date: Wed, 12 Sep 2018 08:28:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for missing prefix `meta-networking' in subject

//Hongxu

On 2018年09月12日 16:26, Hongxu Jia wrote:
> The makefile of cyrus-sasl does not support build out of tree very well,
> while using `--enable-ldapdb', there is a compile failure
> [snip]
> | powerpc-wrs-linux-gcc [snip] -I../common
> |../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
> No such file or directory
> [snip]
>
> The crypto-compat.h locates in git/common/, it should be
> `-I../../git/common'
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> index a03712c..4c26989 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
>   
>   S = "${WORKDIR}/git"
>   
> -inherit autotools pkgconfig useradd systemd
> +inherit autotools-brokensep pkgconfig useradd systemd
>   
>   EXTRA_OECONF += "--with-dblib=berkeley \
>                    --with-plugindir='${libdir}/sasl2' \



