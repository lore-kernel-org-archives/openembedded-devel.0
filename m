Return-Path: <prvs=829e7dfac=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 8B56979101
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 16:50:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,425,1534802400"; 
   d="scan'208";a="1759236"
To: <openembedded-devel@lists.openembedded.org>
References: <20181023080310.1122-1-andreas.obergschwandtner@skidata.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <7632b429-608b-5c49-f995-bcd46abc635d@skidata.com>
Date: Thu, 25 Oct 2018 18:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181023080310.1122-1-andreas.obergschwandtner@skidata.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH v2] openjdk-8-native: hotspot: handle format-overflow error for gcc >= 7
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
X-List-Received-Date: Thu, 25 Oct 2018 16:50:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 10/23/18 10:03 AM, Andreas Obergschwandtner 
<andreas.obergschwandtner@skidata.com> wrote:
> fixed the format-overflow warnings by patch affected files in
> openjdk-8-hotspot
> 
> Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> ---
> Changes v2:
> 	+ add the patch reference to the openjdk-8-release-172b11-common.inc
> ---
>   .../openjdk-8-release-172b11-common.inc       |  1 +
>   .../hotspot-handle-gcc7-format-overflow.patch | 25 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> index 0cda4bb..ad20585 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> @@ -20,6 +20,7 @@ PATCHES_URI = "\
>       ${HOTSPOT_UB_PATCH} \
>       ${LIBPNG_NEON_PATCH} \
>       file://handle_extra_output.patch \
> +    file://hotspot-handle-gcc7-format-overflow.patch \
>   "
>   HOTSPOT_UB_PATCH = "\
>       file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch b/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
> new file mode 100644
> index 0000000..83626b3
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
> @@ -0,0 +1,25 @@
> +# HG changeset patch
> +# User Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> +# Date 1537519446 -7200
> +#      Fri Sep 21 10:44:06 2018 +0200
> +# Node ID 213da2c3ee54a558abd30b0230afa40d4b4e7f83
> +# Parent  80ee2541504ec08d65da9d968a18a00a69858ce0
> +Handle format error for GCC >= 7
> +
> +diff --git a/hotspot/src/share/vm/adlc/output_c.cpp b/hotspot/src/share/vm/adlc/output_c.cpp
> +--- a/hotspot/src/share/vm/adlc/output_c.cpp
> ++++ b/hotspot/src/share/vm/adlc/output_c.cpp
> +@@ -436,9 +436,11 @@
> +   for (i = maxcycleused; i > 0; i /= 10)
> +     cycledigit++;
> +
> +-  int maskdigit = 0;
> +-  for (i = rescount; i > 0; i /= 10)
> ++  int maskdigit = 1;
> ++  for (i = rescount / 10; i > 0; i /= 10)
> +     maskdigit++;
> ++  if (maskdigit > 10)
> ++    maskdigit = 10;
> +
> +   static const char* pipeline_use_cycle_mask = "Pipeline_Use_Cycle_Mask";
> +   static const char* pipeline_use_element    = "Pipeline_Use_Element";
> 

