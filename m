Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6406B60797
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 07:50:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 00:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,361,1520924400"; d="scan'208";a="38365241"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.17.106])
	([10.221.17.106])
	by orsmga007.jf.intel.com with ESMTP; 04 May 2018 00:50:19 -0700
To: Andrew Jeffery <andrew@aj.id.au>, openembedded-devel@lists.openembedded.org
References: <20180504070916.11024-1-andrew@aj.id.au>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ab208a40-d4eb-4807-8f38-824738aff34b@intel.com>
Date: Fri, 4 May 2018 15:50:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504070916.11024-1-andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [RESEND][meta-python][PATCH 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Fri, 04 May 2018 07:50:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/04/2018 03:09 PM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-python/recipes-devtools/python/python-pyflame.inc      | 9 +++++++++
>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
> new file mode 100644
> index 000000000000..37ceab888533
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> @@ -0,0 +1,9 @@
> +S = "${WORKDIR}/pyflame-${PV}"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +DEPENDS = "python"
> +
> +inherit pkgconfig autotools
> +
> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> new file mode 100644
> index 000000000000..c902e121231b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> @@ -0,0 +1,5 @@
> +require python-pyflame.inc
> +
> +SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"

Archive tarball checksums are known to change. Perhaps you can consider
using the release tarball instead?

https://github.com/uber/pyflame/releases

