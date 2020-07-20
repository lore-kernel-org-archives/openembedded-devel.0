Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2009.1595270289463746778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 11:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06KIbSeh002258
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 20 Jul 2020 11:37:38 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Jul
 2020 11:37:17 -0700
Subject: Re: [PATCH] [oe] [meta-networking] [PATCH] wireguard-module: upgrade 1.0.20200401 -> 1.0.20200712
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
        <openembedded-devel@lists.openembedded.org>
References: <1595221935-52519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <8bc40299-aae7-58f3-5858-0fc845c67d39@windriver.com>
Date: Mon, 20 Jul 2020 14:37:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595221935-52519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-07-20 1:12 a.m., zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   ...-module_1.0.20200401.bb => wireguard-module_1.0.20200712.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20200401.bb => wireguard-module_1.0.20200712.bb} (95%)
> 
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
> similarity index 95%
> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
> index 73199592c8..bc94e29ea3 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
> @@ -1,6 +1,6 @@
>   require wireguard.inc
>   
> -SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
> +SRCREV = "d553aa7c52ac78c1963886afb74ba861b0b7b0fc"

I was wondering why we needed this update but I see that
wireguard was only merged into the kernel.org tree in 5.6
so I guess we keep this module updated until the standard
linux-yocto is >= 5.6, right?

Once that happens this recipe can be removed.

Default kernel in oe-core is 5.4 now with the -dev version being 5.8
for those who don't memorize such things.

../Randy

>   
>   SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
>   
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
