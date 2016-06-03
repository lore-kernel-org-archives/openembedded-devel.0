Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 50DBB7741A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 05:03:29 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4015068A019; Fri,  3 Jun 2016 06:03:28 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A67D068A019;
	Fri,  3 Jun 2016 06:03:23 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 96BC367400E5;
	Fri,  3 Jun 2016 07:03:22 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
	<20160602182641.GX7939@vctlabs.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57510F9A.8080400@mlbassoc.com>
Date: Fri, 3 Jun 2016 07:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160602182641.GX7939@vctlabs.com>
Subject: Re: [meta-python][PATCHv3 1/3] python-backports-abc: initial recipe for version 0.4 RDEPENDS
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
X-List-Received-Date: Fri, 03 Jun 2016 05:03:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2016 08:26 PM, S. Lockwood-Childs wrote:
> Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
> from bombing on import errors when running on python2 rather than python3.4
>
>    ImportError: No module named backports_abc
>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>

In my mind, this patch (and its sibling) don't really have anything to to
with Tornado, they are just new packages being added to make that package happy.
I'd prefer to see a commit message that reflects what this package is as well
as why it is being added.

> ---
>   .../python/python-backports-abc_0.4.bb                 | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb b/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
> new file mode 100644
> index 0000000..6a4d267
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "collections.abc from Python 3.4"
> +DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
> +
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
> +
> +# pypi package doesn't have valid entry for license
> +SRC_URI += "https://raw.githubusercontent.com/cython/backports_abc/master/LICENSE;name=license"
> +
> +SRC_URI[md5sum] = "0b65a216ce9dc9c1a7e20a729dd7c05b"
> +SRC_URI[sha256sum] = "8b3e4092ba3d541c7a2f9b7d0d9c0275b21c6a01c53a61c731eba6686939d0a5"
> +SRC_URI[license.md5sum] = "dd98d01d471fac8d8dbdd975229dba03"
> +SRC_URI[license.sha256sum] = "0a4f3b38055f50f047a42521568fa6ddb9a5976c2884f6ae138796d0f71150ca"
> +
> +
> +
> +PYPI_PACKAGE = "backports_abc"
> +inherit pypi setuptools
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

