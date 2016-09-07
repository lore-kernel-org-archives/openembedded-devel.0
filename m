Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF9977042
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 20:51:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2016 13:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="1036737956"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2016 13:51:36 -0700
To: openembedded-devel@lists.openembedded.org
References: <1473280657-4467-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <37c1c8b1-5dcd-0991-e8a6-c7d0a9c8bb33@linux.intel.com>
Date: Wed, 7 Sep 2016 15:54:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473280657-4467-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [meta-python][PATCH] python-pylint: python source code analyzer
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
X-List-Received-Date: Wed, 07 Sep 2016 20:51:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

At least one dependency is missing at runtime: 
backports.functools_lru_cache. Sending a V2..

Leo


El 09/07/2016 a las 03:37 PM, leonardo.sandoval.gonzalez@linux.intel.com 
escribió:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> New recipe which defines the pylint python module: the static code
> analyzer for python files.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   .../recipes-devtools/python/python-pylint_1.6.4.bb | 27 ++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
> new file mode 100644
> index 0000000..b9219dd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
> @@ -0,0 +1,27 @@
> +SUMMARY="Pylint is a Python source code analyzer"
> +HOMEPAGE= "http://www.pylint.org/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> +
> +SRC_URI[md5sum] = "66ba9c27e067568bdabcdd7c21303903"
> +SRC_URI[sha256sum] = "ef901a34b62ed7a734370ba5b162d890231ba8822abe88c6dda1268e2575f5f1"
> +
> +RDEPENDS_${PN} += "python-codecs \
> +                   python-contextlib \
> +                   python-core \
> +                   python-distutils \
> +                   python-io \
> +                   python-lang \
> +                   python-multiprocessing \
> +                   python-netserver \
> +                   python-numbers \
> +                   python-pickle \
> +                   python-re \
> +                   python-shell \
> +                   python-six \
> +                   python-stringold \
> +                   python-subprocess \
> +                   python-textutils \
> +                   python-unittest"
> +
> +inherit pypi setuptools


