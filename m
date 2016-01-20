Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA2E60767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:25:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K9PfbZ018107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 01:25:41 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 01:25:40 -0800
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <569F5292.5010506@windriver.com>
Date: Wed, 20 Jan 2016 17:25:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Wed, 20 Jan 2016 09:25:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年12月28日 20:14, Martin Jansa wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Hi Martin:

Could you cherry-pick this patch to master?
or merge it from master-next to master, it stay in master-next
two month.

thanks

-Roy

> ---
>   meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> index 0ffe589..150e55f 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> @@ -23,6 +23,7 @@ PACKAGECONFIG ??= "openssl ipv6"
>   PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>   PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
> +PACKAGECONFIG[libcap-ng] = "--with-cap-ng=yes,--with-cap-ng=no,libcap-ng"
>
>   EXTRA_AUTORECONF += " -I m4"
>
>

-- 
Best Reagrds,
Roy | RongQing Li

