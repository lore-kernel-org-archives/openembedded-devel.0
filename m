Return-Path: <prvs=756920f33=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 52FD078F34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 20:58:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,235,1531778400"; d="scan'208";a="11815827"
To: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
References: <20180813154628.32257-1-richard.leitner@skidata.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <d6e9741b-9dec-6423-39d8-3b0384388988@skidata.com>
Date: Mon, 13 Aug 2018 22:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813154628.32257-1-richard.leitner@skidata.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH v2] icedtea: disable error format-overflow for gcc 7
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
X-List-Received-Date: Mon, 13 Aug 2018 20:58:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 08/13/2018 05:46 PM, Richard Leitner wrote:
> From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> 
> As no patch has been found in debian and hotspot repo for this issue we
> just disable this warning which was introduced with GCC 7.
> 
> Also known as: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824
> 
> Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> Changes v2:
>     + adapted by Richard Leitner to use the openjdk-build-helper class from
>       André Draszik instead of our own in the java class.
>      (Therefore it now depends on the "prepare for openjdk-8 build infra re-use"
>       series from André)
> ---
>   recipes-core/icedtea/icedtea7-native.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 30fb24a..796acb6 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -24,6 +24,12 @@ CFLAGS_append = " -fno-tree-dse"
>   CXXFLAGS_append = " -fno-tree-dse"
>   CXX_append = " -std=gnu++98"
>   
> +# Disable format-overflow error with host g++ >= 7.3.
> +# This bug is known as https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824
> +FLAGS_GCC7 = " -Wno-error=format-overflow"
> +BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
> +BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
> +
>   inherit native java autotools pkgconfig
>   inherit openjdk-build-helper
>   
> 

