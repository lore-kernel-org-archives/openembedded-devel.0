Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 105A671A62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 09:58:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G9wRkR006702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 01:58:27 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 01:58:26 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1487238934-215853-1-git-send-email-wenzong.fan@windriver.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <86c1d190-9f60-28f0-b1c8-63f2c4a95251@windriver.com>
Date: Thu, 16 Feb 2017 17:58:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487238934-215853-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [meta-python][PATCH v2] python-networkx: add package
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
X-List-Received-Date: Thu, 16 Feb 2017 09:58:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

V2 changes:

* update License field: s/BSD/BSD-3-Clause/g

Thanks
Wenzong

On 02/16/2017 05:55 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Python package for creating and manipulating graphs and networks.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-networkx_1.11.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-networkx_1.11.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
> new file mode 100644
> index 0000000..28a7baa
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
> +
> +SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
> +SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
> +
> +inherit pypi setuptools
>

