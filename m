Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id BB87B7C85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577444430; x=1608980430;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=i+FGXaIbqlzyYGXkcFcMmqQjGG6zGFL0c4IdluPuFSY=;
	b=ZgEJ2eI9sOET1t7H4Nf3LpRjf2TAqGrF+QX3xNUDtSoMriPmluXjfx6r
	Tcp5Oh320wxTn9PjyQrP8nF7jwvf9N6ibvoz+7KYfihn5FeNtPTeBUzXI
	T6txlLHqz1ptkZs/F9eNtzXxrhOa3gUnCUoBhnQ2m0KKTYd5vw2vsD/11
	5XX7JURDWXY/tEARZPaKGrAhR9EdnC4Ljh6WnPemYgHdsj6+Sdq0xcWm3
	tBlATkiUvMknOeyTUB4PdFfjjqwC4aRKAxrdsJ+9PP2SrAynwx4o/PNuz
	AsVRmVNivR6JbpX4mhy+M4jZjjb2C48DkXx85XE/27nKqdtBzeoc/GItu g==;
IronPort-SDR: XKoUgzBc/ruebQx4mvtr1eT9h8EEn5nyk1AKjpuivehOaBukTP9dj9YhVZbKU0dTFDy7nc9CGo
	wAmAHqbhCTAolovU1qp4gd7PUMxxGTJlj9TtTZHWLahleUv+cVzfETWXTCMIXXikq7gGjJOwbw
	eJ/Ll2G0uw5ts3mM2I8RLo8e18PcYQxnXDVh3fPp1SPcpGWfL9jY2Sbb4iQEecHhuZ+rQA/tPN
	jtZG+4ff61QV6ju3qZtWQRAGMZ+xOKl7kRq7vN89QxMVQV9K/uz2PAwVwOgdahRzO/TNnNaW4U
	g+U=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472761"
To: <mohamad.noor.alim.hussin@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191205024315.20529-1-mohamad.noor.alim.hussin@intel.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <21dcaf2a-8a4f-4c03-e3a9-64dcd57afe83@skidata.com>
Date: Fri, 27 Dec 2019 12:00:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191205024315.20529-1-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] icedtea7-native: Fix compilation error due to format-overflow
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
X-List-Received-Date: Fri, 27 Dec 2019 11:00:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2019 03:43, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Getting a compilaton error due to format-overflow. Workaround
> to suppress the error message by ignore the warning.

Same as for jdk 8, AFAIK these warnings should be fixed by 
recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch

Where/why do you get them?

regards;Richard.L

> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>   recipes-core/icedtea/icedtea7-native.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index b578cb2..0329d71 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -26,7 +26,7 @@ CXXFLAGS_append = " -fno-tree-dse"
>   CXX_append = " -std=gnu++98"
>   
>   # WORKAROUND: ignore errors from new compilers
> -CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
> +CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type -Wno-error=format-overflow"
>   
>   inherit native java autotools pkgconfig
>   inherit openjdk-build-helper
> 

