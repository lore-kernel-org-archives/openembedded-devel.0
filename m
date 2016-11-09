Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 21B24719C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 03:33:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 08 Nov 2016 19:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,612,1473145200"; 
   d="scan'208";a="1556138"
Received: from iyussuf-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.37])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2016 19:32:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ruben De Smet <ruben.de.smet@rubdos.be>
Date: Wed, 09 Nov 2016 16:32:57 +1300
Message-ID: <2404724.j6P7is19js@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161104193553.1493-1-ruben.de.smet@rubdos.be>
References: <20161104193553.1493-1-ruben.de.smet@rubdos.be>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v3] python-cassandra-driver: add recipe for version 3.7.1
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
X-List-Received-Date: Wed, 09 Nov 2016 03:33:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ruben,

On Fri, 04 Nov 2016 20:35:53 Ruben De Smet wrote:
> A Python library for Apache Cassandra
> 
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  .../python/python-cassandra-driver.inc             | 33
> ++++++++++++++++++++++ .../python/python3-cassandra-driver_3.7.1.bb       |
>  2 ++
>  2 files changed, 35 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-cassandra-driver.inc create mode
> 100644
> meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> b/meta-python/recipes-devtools/python/python-cassandra-driver.inc new file
> mode 100644
> index 0000000..bc83592
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> @@ -0,0 +1,33 @@
> +SUMMARY = "DataStax Python Driver for Apache Cassandra"
> +DESCRIPTION = "A modern, feature-rich and highly-tunable Python client \
> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) using \
> +exclusively Cassandra's binary protocol and Cassandra Query Language v3."
> +HOMEPAGE = "https://github.com/datastax/python-driver"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +SRCNAME = "cassandra-driver"
> +
> +SRC_URI[md5sum] = "e01822b1e08940f300c0013765e070be"
> +SRC_URI[sha256sum] =
> "cd76355a6bf30b9cb9f1dd12327b6db2f4b883d5521eb6cac5e6b905000d688e" +
> +DISTUTILS_BUILD_ARGS += " \
> +    --no-libev \
> +"
> +DISTUTILS_INSTALL_ARGS += " \
> +    --no-libev \
> +"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-cython \
> +    ${PYTHON_PN}-multiprocessing \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-json \
> +    libevent \
> +"
> +
> +DEPENDS_${PN} += "\
> +    ${PYTHON_PN}-cython \
> +"

What Khem meant by "don't use PN here" was that DEPENDS_${PN} is not valid. 
You only use such an override when you are dealing with a variable that is 
specific to one of the packages in PACKAGES (${PN} being the main package) - 
typically that is only variables that deal with packaging. DEPENDS (as, for 
example, SRC_URI) is recipe-wide and thus not only do you not need such an 
override, adding one will in fact prevent your additions from having any 
effect.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

