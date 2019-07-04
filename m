Return-Path: <prvs=081d0dd0c=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A7DA471BEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2019 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1562220858; x=1593756858;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=aJaFH0r1ABxI0BSpP58VGJve4c85s7JcbEGFUCdTaEw=;
	b=RsKeTiAF4S7Dg7HfsFAk2mrzY21ueyt6MSh5Iw36z9MVkE8QvK3nN80t
	A0xfQ2/m1OhZajriajP7ZDK6yIRjtC2GtqdwJ2a6xwf+xVyQtM5P0dsX7
	L65WdGgIHUs8mI64yekCknGyaM+VgpGiD9ihd7ypXwBgUJ6X01xoMk4ON
	0j73hud4unL9EMvTWnfJfIPc+mP5LJPjOEGDfWclY1l3QNpq5p3zydOLT
	sGvSaQg1gWlXz59o2sSb3zC54zfIyuMjbmrePk06eAG5jJcvHkINSpFYs
	/UtCADU5XrBNOkAB2tVXLHT8iS8/o6Pxgz1xCNDdfPjk2OcJuN2XRP0WZ w==;
IronPort-SDR: DyLdBPEDxfz99xF+GXxXBF4Jry969YmJMxcE+yZGTbZqfi1YbcgUK4gjG97Ul4VdHl4Pa0r+0Z
	8iqT9g67+9sT74QH8g6KYggCkxRw9duyCRk+shZqkHLN+fz/u7b3NsM4q31IyNRKgr6fKkvSDv
	jkcFM2+ExX8zWhoT3X5dv/nH//9iwew8NKIfNrdNHFnbfiMn5PxEKEv5FJG6eS0bD+vrVSXUfe
	527zeIvomrzavyyvpubvm1UFhd2yFHPKstkbdl6hpsovXoIouYq8WTj2biOIyCZ8HSnigmTrcl
	+Pk=
X-IronPort-AV: E=Sophos;i="5.63,449,1557180000"; d="scan'208";a="18149457"
To: Alistair Francis <alistair.francis@wdc.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190702231456.10327-1-alistair.francis@wdc.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <3c8375a6-f776-b8ad-02fc-4c412f422a02@skidata.com>
Date: Thu, 4 Jul 2019 08:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190702231456.10327-1-alistair.francis@wdc.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: maxin.john@intel.com
Subject: Re: [PATCH] Remove OETestID from runtime tests
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
X-List-Received-Date: Thu, 04 Jul 2019 06:14:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alistair,
thanks for the patch, nonetheless I've added the same change already to 
master-next some days ago in e737745a3f2a9f0aea7d2e0ac03d496143fcc7be:

	https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?h=master-next&id=e737745a3f2a9f0aea7d2e0ac03d496143fcc7be

regards;Richard.L

On 03/07/2019 01:14, Alistair Francis wrote:
> commit 8e2d0575e4e "oeqa: Drop OETestID" in OE-Core remove OETestID
> so we now get an error trying to import it. As it was unused in
> meta-jave let's remove it.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   lib/oeqa/runtime/cases/java.py  | 1 -
>   lib/oeqa/runtime/cases/javac.py | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
> index 142a49c..c1e1498 100644
> --- a/lib/oeqa/runtime/cases/java.py
> +++ b/lib/oeqa/runtime/cases/java.py
> @@ -2,7 +2,6 @@ import os
>   
>   from oeqa.runtime.case import OERuntimeTestCase
>   from oeqa.core.decorator.depends import OETestDepends
> -from oeqa.core.decorator.oeid import OETestID
>   from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
>   from oeqa.runtime.decorator.package import OEHasPackage
>   
> diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
> index ad6de25..39ae298 100644
> --- a/lib/oeqa/runtime/cases/javac.py
> +++ b/lib/oeqa/runtime/cases/javac.py
> @@ -2,7 +2,6 @@ import os
>   
>   from oeqa.runtime.case import OERuntimeTestCase
>   from oeqa.core.decorator.depends import OETestDepends
> -from oeqa.core.decorator.oeid import OETestID
>   from oeqa.runtime.decorator.package import OEHasPackage
>   
>   class JavacTest(OERuntimeTestCase):
> 

