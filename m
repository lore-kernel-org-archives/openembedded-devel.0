Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C4B95773BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:21:42 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1b8Pkz-0001Fx-A3 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2016 12:21:41 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 12:21:41 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 12:21:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 2 Jun 2016 12:21:08 +0200
Message-ID: <nip1ak$o6r$1@ger.gmane.org>
References: <20160601195713.GS7939@vctlabs.com>
	<20160601202027.GT7939@vctlabs.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
In-Reply-To: <20160601202027.GT7939@vctlabs.com>
Subject: Re: [meta-python][PATCH v2] python-tornado: add missing python2 runtime deps
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
X-List-Received-Date: Thu, 02 Jun 2016 10:21:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 01-06-16 om 22:20 schreef S. Lockwood-Childs:
> Sorry about missing character in the previous version, I think this is the
> unmangled version of patch...
> 
> ---
> 
> Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
> from bombing on import errors when running on python2 rather than python3.4
> 
>   ImportError: No module named singledispatch
> 
>   ImportError: No module named backports_abc
> 
> Fixed by creating python-singledispatch and python-backports-abc recipes
> respectively and adding them to RDEPENDS.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>

It's customary to split a patch like this into 3 patches.

regards,

Koen

> ---
>  .../python/python-backports-abc_0.4.bb                 | 18 ++++++++++++++++++
>  .../python/python-singledispatch_3.4.0.3.bb            | 13 +++++++++++++
>  .../recipes-devtools/python/python-tornado_4.3.bb      |  2 +-
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
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
> diff --git a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> new file mode 100644
> index 0000000..87f46e5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "functools.singledispatch from Python 3.4"
> +DESCRIPTION = "PEP 443 proposed to expose a mechanism in the functools standard library module \
> +in Python 3.4 that provides a simple form of generic programming known as single-dispatch \
> +generic functions.  This library is a backport of this functionality to Python 2.6 - 3.3"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
> +
> +SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
> +SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
> +
> +PYPI_PACKAGE = "singledispatch"
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-tornado_4.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
> index 55a48b8..d30f88f 100644
> --- a/meta-python/recipes-devtools/python/python-tornado_4.3.bb
> +++ b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
> @@ -1,3 +1,3 @@
>  inherit pypi setuptools
>  require python-tornado.inc
> -RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl"
> +RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl ${PYTHON_PN}-backports-abc ${PYTHON_PN}-singledispatch"
> 



