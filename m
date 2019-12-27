Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 399557CBE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577447317; x=1608983317;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=xCg883hBCsd9fLy4EYoD79gbgIZK6VB5yLrInWntNyY=;
	b=M/sipWQpnI1djL2FaLJffGvAiyeoWGIlAi0GLHr8KF6mufbtbBuIEqSj
	ZuE0mNvJrJPSkXrgKac29FlfpK6wtmDpZOyWyqPVMOdyMjnepkDS6z6ZD
	nej+6FVTjclb67lZDBgWnXtT6q0UgVpcxtKf6cvQKyRdK+w9T7NWt+MXr
	uvHXG217wZdbaAg57Jlba/5U3m0+e3nlSfOcWHT6kyrv0QepO4U+aK9+D
	Ax0amrtDpSy/PWDlfTCwzWwJWuUbjU4gN0/30OMlAuXnpqPUpLyS6k+x5
	uMlK5TmMRoAQ0de3vc5iFWWlOkOkHiEu+34+xC4yfHfk54LWqCxF3ek7n w==;
IronPort-SDR: lFO3bT280gdyH4wYXLPgZodlwgML30TN4H53Znom2GMy3b9DPYwKEHQKjDk+R+WDvRld++Drpf
	NyusoxX9OBkXnjYy9ev7tZGNayQ5/v0qo7DsP+OkRCJUQDSi0v7gPqf5srScsasAoTqIkZtSKh
	KarnOftXPjSEg8YzcIkdTCgq30/mNXj/tq4e7jXrOPzdsh/tXTgcRCA0smh/VdJQQS6MsscOYE
	DpZsoV1sKCL4SzXlKi2xxnLxcjOnIoJs74ERV6RG4XWMNgAo6fTbU+5enHO96LeTVTDjdlu443
	zNI=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472811"
To: Kyle Russell <bkylerussell@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190204220137.26744-1-bkylerussell@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <008d2a22-7058-14f8-6503-ab2ea0705017@skidata.com>
Date: Fri, 27 Dec 2019 12:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20190204220137.26744-1-bkylerussell@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] icedtea7-native: set default x11 PACKAGECONFIG from DISTRO_FEATURES
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
X-List-Received-Date: Fri, 27 Dec 2019 11:48:38 -0000
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

On 04/02/2019 23:01, Kyle Russell wrote:
> If x11 is specified in DISTRO_FEATURES, then make it a default
> PACKAGECONFIG option when building icedtea7-native; otherwise, the
> libx11-native dependency won't be satisfied.
> 
> The recipe reads as though icedtea7-native can build completely without
> X11, but if the libx11-native headers are not installed on the host
> system, compile errors in multiple units because of a missing X11/Xlib.h.
> 
> In file included from ../../../src/share/native/sun/awt/../java2d/pipe/Region.h:34:0,
>                   from ../../../src/share/native/sun/awt/../java2d/loops/GraphicsPrimitiveMgr.c:31:
> ../../../src/solaris/native/sun/awt/utility/rect.h:31:22: fatal error: X11/Xlib.h: No such file or directory
> 
> In this example, it appears that GraphicsPrimitiveMgr.c is supposed to
> be compiled even in headless mode, so the dependency still seems to be
> needed.
> 
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>   recipes-core/icedtea/icedtea7-native.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 69f5d25..62dea78 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -11,7 +11,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
>   	   unzip-native make-native util-linux-native\
>             "
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>   PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
>   
>   OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
> 

