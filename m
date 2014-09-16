Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 877C371449
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 17:32:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2014 10:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,535,1406617200"; d="scan'208";a="603709359"
Received: from ryanpete-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.169])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2014 10:32:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: YangHaibo <b40869@freescale.com>
Date: Tue, 16 Sep 2014 18:32:05 +0100
Message-ID: <2081672.Qnn2s3x9XX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1410835738-27343-1-git-send-email-b40869@freescale.com>
References: <1410835738-27343-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Sep 2014 17:32:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there,

On Tuesday 16 September 2014 10:48:58 YangHaibo wrote:
> Signed-off-by: YangHaibo <b40869@freescale.com>
> ---
>  meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> 
> diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb new file mode 100644
> index 0000000..4d1137f
> --- /dev/null
> +++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "pimd is a lightweight stand-alone PIM-SM v2 multicast
> routing daemon." 

Please set SUMMARY for one-line descriptions like this.

> +HOMEPAGE = "http://troglobit.com/pimd.html"
> +LICENSE = "BSD"

Please be specific and say "BSD-3-Clause" (since that appears to be the variant 
upstream is using).

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
> +
> +SRC_URI = "ftp://troglobit.com/pimd/pimd-2.1.8.tar.bz2"

Please use ${PV} instead of hardcoding 2.1.8 .

> +SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"

Please also add a sha256sum.

> +CFLAGS_prepend = "-I ${S}/include "

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

