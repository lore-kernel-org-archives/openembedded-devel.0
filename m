Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE857C85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577444357; x=1608980357;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=7JgQkGb5jg6Ko/AMlLq73Z72LMbuXT2Wx4F4/xB2P1I=;
	b=fIgOPsu8C2ax6cbsGZjwzq9LQZiob9RYgyIflGhlvTfL7Ct1cJMnaxEI
	L6jPHQa9XaJ1UjBjWVR36Lh1224rQVEXlBr7pDE1MlKQqIDhi/WocLRzJ
	qsCEaZokARjUQW3MAaxeadYZv2knswLwDYOYmLJNCA+unQqNt9FCFysWk
	3JHaTsG6c4b8EAlqgy3TNc4ttj0eQYREbAB1wQeTcOsUvN/+CGspr3zQ7
	nTo5V81HUefeRe/CY1ouMR3fBYIvNersk/LL0ZxVG8KDM4e6hK0ozNlC7
	CJMDqYqFiwALRxR4ghgN4Tzjwoi+zIXjR2mQ03rNrejwr1dkT+gRfz0Ht A==;
IronPort-SDR: Ct/dxenw0EI239chRbdHdH/+183zxFgMyDkp8MsBkqvzj0Ovhohixs4C5KfWMY5gaNzKVy6jS/
	YKURtG3r6jjKjH2uLHW2S6zAcTSpb+MWa6JL23846Nv2K89t+pDq0jIwdAtW5PX/t9J15932AW
	jedYuTyEfzXFO6GMC+Du++rgJuVjSn6pRxDPjpmvGRId9quowlwxALNY3SwdPHdQ8v2VHQ4Lwy
	jLOn3aVBgbUDbi4/hDFmP6kzXQmCb2xizJyALIY1Vm1ag9qgjGocDP8v+y4Q+J89IDPjtkMs3e
	Jy8=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; d="scan'208";a="21733075"
To: <mohamad.noor.alim.hussin@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191206013306.12326-1-mohamad.noor.alim.hussin@intel.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <bc02e873-b28a-6104-8cd6-8d87b46d1417@skidata.com>
Date: Fri, 27 Dec 2019 11:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191206013306.12326-1-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-8: Fix compilation error due to format-overflow
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
X-List-Received-Date: Fri, 27 Dec 2019 10:59:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mohamad,
thanks for your patches!

On 06/12/2019 02:33, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Getting a compilation error when compiling openjdk-8 due
> to format-overflow. Suppress the error message by ignoring
> warning messages of format-overflow.

Under what conditions are you getting a format-overflow warning?

AFAIK they should be fixed for openjdk-8 in 
recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch

regards;Richard.L

> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>   recipes-core/openjdk/openjdk-8-common.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 4d8f935..566d7e7 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -177,6 +177,9 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   
> +# WORKAROUND: ignore errors from new compilers
> +CFLAGS_append = " -Wno-error=format-overflow"
> +
>   # flags for -native, and for bits that need a host-tool during -cross
>   BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
>   BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
> 

