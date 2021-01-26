Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.10006.1611654627528006768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8CB5B40033;
	Tue, 26 Jan 2021 09:50:19 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:50:18 +0100
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Junjie Mao <junjie.mao@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH] python3-xmlschema: Yocto recipes for validating against XSD 1.1
Message-ID: <20210126095018.GY1196852@piout.net>
References: <1611558046-30976-1-git-send-email-junjie.mao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1611558046-30976-1-git-send-email-junjie.mao@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 25/01/2021 15:00:46+0800, Junjie Mao wrote:
> This patch adds recipes for xmlschema and its dependency in order to enable
> XML validation against XSD 1.1 in Python.
> 
> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
> ---
>  .../python/python3-elementpath_2.1.2.bb              | 12 ++++++++++++
>  .../python/python3-xmlschema_1.4.1.bb                | 20 ++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> new file mode 100644
> index 0000000..f47f152
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library."
> +HOMEPAGE = "https://github.com/sissaschool/elementpath"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
> +
> +SRC_URI[md5sum] = "887f60e9c4fb9b0804a38372b2798101"
> +SRC_URI[sha256sum] = "23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085"
> +
> +PYPI_PACKAGE = "elementpath"
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> new file mode 100644
> index 0000000..c609931
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
> +HOMEPAGE = "https://github.com/sissaschool/xmlschema"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
> +
> +SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
> +SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
> +
> +PYPI_PACKAGE = "xmlschema"
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-elementpath \
> +"

This failed on the autobuilders:

ERROR: python3-xmlschema-1.4.1-r0 do_compile: 'python3 setup.py build ' execution failed.
ERROR: python3-xmlschema-1.4.1-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-xmlschema/1.4.1-r0/temp/run.do_compile.316552' failed with exit code 1:
WARNING: The pip package is not available, falling back to EasyInstall for handling setup_requires/test_requires; this is deprecated and will be removed in a future version.
ERROR: Do not try to fetch `elementpath<3.0.0,>=2.0.4' for building. Please add its native recipe to DEPENDS.

Full log here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/884/steps/12/logs/stdio


> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-elementpath \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 

> 
> 
> 


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
