Return-Path: <prvs=07136487e=Richard.Leitner@skidata.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Jun 2019 06:23:05 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1527E4F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561357386; x=1592893386;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=DB0Xh2qs9oitsPXr7tc1McO+9UfZyMk7cFvR8tq/hJo=;
	b=YbL7oFOnQLzS84NK1Evx+tId/Q1j6ROEkhUp4dYVsw2CmfKmkDsXs6e9
	zKX9SxFusv7oANIp3fmherqXigA3axm4/vS/vH0G1EkQVO7rsRLcyd1Uy
	M4+EjFOdk4V7aI7b95L6EOk242NHGU8BKiiCkzzwETHg2eJ9VRf4ikF7n
	wAMFUNLFJV9WW3f9a322Bi+bbFtPQh3QH1hqPJR5GTSVpP1/K72yqYOVg
	EQGZ1ZVZ/FT3X7nhi96nA00KY2XDS7HTE+xxFZ0BJIDmhFEXjH2ddjAd1
	Ze1Cs/OvjfQaXE393TNUXR9vukGFeoi/lg0CSiaGgd4Dh0Cye5puyu/rG w==;
IronPort-SDR: vgHly+oX/tEoHlYbSpDNeB5wQHiyDMJA33AuC80EqeNohrStl6SmRluP87thE2jiallXndwcDI
	KyIjR/Nbux0jXobkeca3u2m0wplqSQA0Df2DGp/Ne2X51AajNOqt51Mw9/l55KBkowyiB9u3vq
	DQwlBXVp0AQTFQy5fTrAqNKwH8gsGlvxBNAdPYOqXs7f+OJFxoc9PuhP3xyTXUg4UupopQb7oj
	y1GCR5YjFj+N8HNfhoVHkdUR+r7IixB860oHzIFepdXEcxetGdkYmhzb7FpakQUo1O0Cc4Xdy2
	cs4=
X-IronPort-AV: E=Sophos;i="5.63,411,1557180000"; 
   d="scan'208";a="2204184"
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190621083136.21492-1-ricardo@ribalda.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <45e7ac92-f7f5-4302-a0f3-f31ef2c32b3d@skidata.com>
Date: Mon, 24 Jun 2019 08:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621083136.21492-1-ricardo@ribalda.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] classpath: Fix build with aarch64
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
X-List-Received-Date: Mon, 24 Jun 2019 06:23:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ricardo,
thanks for the patch!

I'll add it to my tests asap and give you feedback.

Nonetheless, to me (from the commit messages) it's not clear if this 
patch fixes a problem when compiling for aarch64 or on aarch64. Could 
you please describe your change a little more in the commit message and 
send a v2?
Keeping the "Fixes:" is of course fine!

regards;Richard.L

On 21/06/2019 10:31, Ricardo Ribalda Delgado wrote:
> Fixes:
> | In file included from ../../../classpath-0.99/native/fdlibm/fdlibm.h:36,
> |                  from ../../../classpath-0.99/native/fdlibm/e_exp.c:76:
> | ../../../classpath-0.99/native/fdlibm/ieeefp.h:163:2: error: #error Endianess not declared!!
> |  #error Endianess not declared!!
> |   ^~~~~
> | In file included from ../../classpath-0.99/native/fdlibm/fdlibm.h:40,
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>   .../classpath/classpath-0.99/aarch64.patch    | 19 +++++++++++++++++++
>   recipes-core/classpath/classpath_0.99.bb      |  1 +
>   2 files changed, 20 insertions(+)
>   create mode 100644 recipes-core/classpath/classpath-0.99/aarch64.patch
> 
> diff --git a/recipes-core/classpath/classpath-0.99/aarch64.patch b/recipes-core/classpath/classpath-0.99/aarch64.patch
> new file mode 100644
> index 0000000..4de40fb
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-0.99/aarch64.patch
> @@ -0,0 +1,19 @@
> +Upstream-Status: Inappropriate [upstream is dead]
> +
> +Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> +
> +diff --git a/native/fdlibm/ieeefp.h b/native/fdlibm/ieeefp.h
> +index c230bbb..700dd3a 100644
> +--- a/native/fdlibm/ieeefp.h
> ++++ b/native/fdlibm/ieeefp.h
> +@@ -158,6 +158,10 @@
> + #define __IEEE_BIG_ENDIAN
> + #endif
> +
> ++#ifdef __aarch64__
> ++#define __IEEE_LITTLE_ENDIAN
> ++#endif
> ++
> + #ifndef __IEEE_BIG_ENDIAN
> + #ifndef __IEEE_LITTLE_ENDIAN
> + #error Endianess not declared!!
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index 6aa3baa..714503a 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -14,6 +14,7 @@ SRC_URI += " \
>               file://toolwrapper-exithook.patch \
>               file://use_libdir.patch \
>               file://freetype2.patch \
> +            file://aarch64.patch \
>              "
>   
>   SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
> 

