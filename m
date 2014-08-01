Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C19E65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:16:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2014 02:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,778,1400050800"; d="scan'208";a="570390509"
Received: from pwarusav-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.170])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2014 02:15:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yao Zhao <yao.zhao@windriver.com>
Date: Fri, 01 Aug 2014 10:15:48 +0100
Message-ID: <8852042.68tSm0zeb9@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1406834100-20328-1-git-send-email-yao.zhao@windriver.com>
References: <1406834100-20328-1-git-send-email-yao.zhao@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] add support for opendataplane
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
X-List-Received-Date: Fri, 01 Aug 2014 09:16:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 31 July 2014 15:15:00 Yao Zhao wrote:
> support build opendataplane from linaro.
> 
> The OpenDataPlane (ODP) project provides a data plane application
> programming environment that is easy to use, high performance,
> and portable between networking SoCs.
> 
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>  ...inux-dpdk-remove-unnecessary-include-path.patch | 29
> ++++++++++++++++++++++ .../opendataplane/opendataplane.inc                |
> 21 ++++++++++++++++ .../opendataplane/opendataplane_0.2.bb             | 25
> +++++++++++++++++++ .../opendataplane/opendataplane_git.bb             | 14
> +++++++++++ 4 files changed, 89 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-
> unnecessary-include-path.patch create mode 100644
> meta-networking/recipes-support/opendataplane/opendataplane.inc create mode
> 100644 meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
> create mode 100644
> meta-networking/recipes-support/opendataplane/opendataplane_git.bb
> 
> diff --git
> a/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remov
> e-unnecessary-include-path.patch
> b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remov
> e-unnecessary-include-path.patch new file mode 100644
> index 0000000..a0ef7ce
> --- /dev/null
> +++
> b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remov
> e-unnecessary-include-path.patch @@ -0,0 +1,29 @@
> +From 72b8eacc2985f054cadc5d0b48351a658998b8d6 Mon Sep 17 00:00:00 2001
> +From: Yao Zhao <yao.zhao@windriver.com>
> +Date: Wed, 30 Jul 2014 16:02:14 -0400
> +Subject: [PATCH] linux-dpdk: remove unnecessary include path
> +
> +for dpdk include/arch and include/exec-env is only included
> +by generic rte_xxx.h header, can't be included directly.
> +
> +Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> +---
> + platform/linux-dpdk/Makefile.am | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/platform/linux-dpdk/Makefile.am
> b/platform/linux-dpdk/Makefile.am +index 4aa568f..dfcaadb 100644
> +--- a/platform/linux-dpdk/Makefile.am
> ++++ b/platform/linux-dpdk/Makefile.am
> +@@ -12,8 +12,6 @@ PLAT_CFLAGS  = -msse4.2
> + if SDK_INSTALL_PATH_
> + PLAT_CFLAGS += -include $(SDK_INSTALL_PATH)/include/rte_config.h
> + PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include
> +-PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/arch
> +-PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/exec-env
> +
> + AM_LDFLAGS  += -L$(SDK_INSTALL_PATH)/lib
> + endif
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/opendataplane/opendataplane.inc
> b/meta-networking/recipes-support/opendataplane/opendataplane.inc new file
> mode 100644
> index 0000000..c4b184e
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "Cross platform OpenDataPlane application APIs"
> +
> +DESCRIPTION = "The OpenDataPlane project has been established to \
> +produce an open-source, cross-platform set of application \
> +programming interfaces (APIs) for the networking data plane."
> +
> +HOMEPAGE = "http://www.opendataplane.org"
> +SECTION = "networking"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ccfa994aa96974cfcd39a59faee20a2"
> +
> +SRC_URI = "git://git.linaro.org/lng/odp.git"
> +
> +COMPATIBLE_HOST = "^((?!mips).*)$"
> +
> +PACKAGECONFIG ??= "platform_linux_generic"
> +PACKAGECONFIG[netmap] = "--enable-netmap,,,"
> +PACKAGECONFIG[platform_linux_generic] = "--with-platform=linux-generic,,,"
> +
> +S = "${WORKDIR}/git"
> +
> diff --git
> a/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
> b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb new
> file mode 100644
> index 0000000..74b6c2f
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
> @@ -0,0 +1,25 @@
> +require ${BPN}.inc
> +
> +#odp-0.2 tag
> +SRCREV  = "6007d8833a6880abedf98f792586c0cfb9f10de0"
> +PV = "0.2"
> +
> +#0.2 still using pure Makefile
> +
> +#override the Makefile DESTDIR
> +export DESTDIR="${D}${exec_prefix}"
> +
> +do_install () {
> +    oe_runmake install
> +
> +    #move DESTDIR/share/odp/odp_x usr/bin
> +    install -d ${D}${bindir}
> +    for i in ${DESTDIR}/share/odp/*; do
> +        filename=`basename $i`
> +        mv ${DESTDIR}/share/odp/${filename} ${D}${bindir}/${filename}
> +    done
> +    rm -rf ${DESTDIR}/share
> +}
> +
> +#non standard doc install location
> +FILES_${PN}-doc += "/usr/doc/*"
> diff --git
> a/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
> b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb new
> file mode 100644
> index 0000000..7415993
> --- /dev/null
> +++ b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
> @@ -0,0 +1,14 @@
> +require ${BPN}.inc
> +
> +SRC_URI += "file://0001-linux-dpdk-remove-unnecessary-include-path.patch"
> +
> +SRCREV  = "${AUTOREV}"

I'm fairly sure we want to avoid having recipes with SRCREV  = "${AUTOREV}" in 
commonly-used public layers, since it's hard to know if it will continue to 
work from one day to the next.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

