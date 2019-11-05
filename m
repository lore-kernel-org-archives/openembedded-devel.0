Return-Path: <prvs=2054d270f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7A87F8A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1572963677; x=1604499677;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=ciIPjnQA5RohyD/6wNKbWViVxwaHS9tmgSZ7LbdZ8V0=;
	b=k2HVz7ExCVNZz1VjRHMenlo/OVne+J/yCApqZ2bMY04zMG/FWiAOo+ew
	mK+mmvsesPwAiknmJuuz+IwhIIipr4QKBahrJSvVe/vXbA7sNYW0pfZ+5
	Yjx/wXtbSgKCcAgNe9T3L4tZq5a4Yyf7k5UnYi2bRsL14Lpwsgpz2rqQ2
	wqsj8JiM9n2T7WE2M6vDsFGKGtGy00OAqwO5ZP5HVginVwhUzKc7itvJK
	kIfUvw4u5t9uVMT3YlgrBwQlxfGCPTXj5AKAu5hrdxQwamBRbgAoRXB6/
	A61OsTWdSJMXowfxdDzuid0CAYAv2WT9h4ySvbWzfRKS94q1SB1+08nae w==;
IronPort-SDR: hdppQAnkGmWMC9Udw/Fvf7Kexd+XFLXJiMtyS0wmLrYrl0GjLkSVGlBJEIeJqOeVNwfu06Fawu
	Xp1A0YvMvR0pQ2B9GKPJtjBENSrcEK8hE//G8iDxae93n06rzYZ6QxpvhJMOxu2EXk8km2AQXx
	Ngoii2S0MdHjC+DA2/4oeHAueQFqGS5I49VGpC6aq3+QfdsfD46WL/8Kj/BtKMXRcCFr+ELVHy
	/t/uPkX+ynU5Z0lJ9dBXzpFSQdxOnEDo0BF4K0Eiph+Ug9nzjRvEekkiqgdD2U/r8wbwOn6xmv
	E4I=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2408028"
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20191105084045.20756-1-richard.leitner@skidata.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <7c9aea64-9b06-fcf8-7731-3dfb8d0cc8dd@skidata.com>
Date: Tue, 5 Nov 2019 15:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105084045.20756-1-richard.leitner@skidata.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] layer.conf: remove compatibility with thud and warrior
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
X-List-Received-Date: Tue, 05 Nov 2019 14:21:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L


On 05/11/2019 09:40, Richard Leitner wrote:
> As we want to start some cleanup work on meta-java stay only compatible
> with zeus.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>   conf/layer.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index cdba2cd..9be071d 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>   BBFILE_COLLECTIONS += "meta-java"
>   BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-java = "10"
> -LAYERSERIES_COMPAT_meta-java = "thud warrior zeus"
> +LAYERSERIES_COMPAT_meta-java = "zeus"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> 

