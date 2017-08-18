Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2EE78411
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:14:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7I5ERtJ008150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Aug 2017 22:14:27 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 Aug 2017 22:14:26 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <1503032354-3955-1-git-send-email-yi.zhao@windriver.com>
	<CAMKF1sp43WJ-X7z=7cLw_QvKdWOS_n4-tCBQLKG=kY89ezMStQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <8963f081-9f7d-560a-c69e-3fff783fc08a@windriver.com>
Date: Fri, 18 Aug 2017 13:15:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp43WJ-X7z=7cLw_QvKdWOS_n4-tCBQLKG=kY89ezMStQ@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] quagga: update to 1.2.1
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
X-List-Received-Date: Fri, 18 Aug 2017 05:14:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2017年08月18日 13:05, Khem Raj 写道:
>
> On Thu, Aug 17, 2017 at 9:58 PM Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     * Add c-ares as dependency
>     * Remove variable QUAGGASUBDIR as it is not needed anymore
>     * Remove the duplicated RDEPENDS_${PN} += "iproute2"
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>      .../recipes-protocols/quagga/quagga.inc            | 24
>     ++++++++--------------
>      .../recipes-protocols/quagga/quagga_1.1.0.bb
>     <http://quagga_1.1.0.bb>      |  6 ------
>      .../recipes-protocols/quagga/quagga_1.2.1.bb
>     <http://quagga_1.2.1.bb>      |  4 ++++
>      3 files changed, 12 insertions(+), 22 deletions(-)
>      delete mode 100644
>     meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
>     <http://quagga_1.1.0.bb>
>      create mode 100644
>     meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
>     <http://quagga_1.2.1.bb>
>
>     diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc
>     b/meta-networking/recipes-protocols/quagga/quagga.inc
>     index 4fb6723..dfd6aa7 100644
>     --- a/meta-networking/recipes-protocols/quagga/quagga.inc
>     +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
>     @@ -7,21 +7,20 @@ Ishiguro. The Quagga tree aims to build a more
>     involved community \
>      around Quagga than the current centralised model of GNU Zebra."
>      HOMEPAGE = "http://www.nongnu.org/quagga/"
>      SECTION = "net"
>     -LICENSE = "GPL-2.0 & LGPL-2.0"
>
>
> Perhaps this should be LGPL-2.1 can you cross check

Thanks Khem,

I checked the COPYING.LIB, it is 2.0, not 2.1.

Yi

>
>     -DEPENDS = "readline ncurses perl-native"
>     -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
>     'net-snmp', '', d)}"
>     -SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
>     '--enable-snmp', '', d)}"
>
>     +
>     +LICENSE = "GPL-2.0 & LGPL-2.0"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
>      file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
>
>     +DEPENDS = "readline ncurses perl-native c-ares"
>     +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
>     'net-snmp', '', d)}"
>     +SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
>     '--enable-snmp', '', d)}"
>     +
>      # the "ip" command from busybox is not sufficient (flush by
>     protocol flushes all routes)
>      RDEPENDS_${PN} += "iproute2"
>
>     -QUAGGASUBDIR = ""
>     -# ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
>     -# versions and leave it empty for recent versions.
>     -SRC_URI =
>     "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
>     +SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
>                 file://quagga.init \
>                 file://quagga.default \
>                 file://watchquagga.init \
>     @@ -35,7 +34,7 @@ SRC_URI =
>     "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
>                 file://ripd.service \
>                 file://ripngd.service \
>                 file://zebra.service \
>     -"
>     +          "
>
>      PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>      PACKAGECONFIG[cap] =
>     "--enable-capabilities,--disable-capabilities,libcap"
>     @@ -108,10 +107,6 @@ do_install () {
>          sed -i 's!/var/!${localstatedir}/!g'
>     ${D}${sysconfdir}/init.d/*
>     ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
>          sed -i
>     's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!'
>     ${D}${sysconfdir}/init.d/*
>
>     -    # Remove generated info dir file, it doesn't belong in the
>     generated
>     -    # package.
>     -    rm -f ${D}${infodir}/dir
>     -
>          # For PAM
>          for feature in ${DISTRO_FEATURES}; do
>              if [ "$feature" = "pam" ]; then
>     @@ -188,9 +183,6 @@ CONFFILES_${PN}-watchquagga =
>     "${sysconfdir}/default/watchquagga"
>      DEBIAN_NOAUTONAME_${PN}-ospfd = "1"
>      DEBIAN_NOAUTONAME_${PN}-ospfclient = "1"
>
>     -# the "ip" command from busybox is not sufficient (flush by
>     protocol flushes all routes)
>     -RDEPENDS_${PN}          += "iproute2"
>     -
>      # Main init script starts all deamons
>      # Seperate init script for watchquagga
>      INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
>     diff --git
>     a/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
>     <http://quagga_1.1.0.bb>
>     b/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
>     <http://quagga_1.1.0.bb>
>     deleted file mode 100644
>     index 1b5c34c..0000000
>     --- a/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
>     <http://quagga_1.1.0.bb>
>     +++ /dev/null
>     @@ -1,6 +0,0 @@
>     -require quagga.inc
>     -
>     -SRC_URI[md5sum] = "daa303871e07ea5856aae6fd79e89722"
>     -SRC_URI[sha256sum] =
>     "f7a43a9c59bfd3722002210530b2553c8d5cc05bfea5acd56d4f102b9f55dc63"
>     -
>     -QUAGGASUBDIR = ""
>     diff --git
>     a/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
>     <http://quagga_1.2.1.bb>
>     b/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
>     <http://quagga_1.2.1.bb>
>     new file mode 100644
>     index 0000000..4d43d7b
>     --- /dev/null
>     +++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
>     <http://quagga_1.2.1.bb>
>     @@ -0,0 +1,4 @@
>     +require quagga.inc
>     +
>     +SRC_URI[md5sum] = "b1546de89062f7070d56e780b30be4b1"
>     +SRC_URI[sha256sum] =
>     "aaddba5d4f41ed8e4c2f155f4584c993465d122c9096b5b52ada3fc75266fbcd"
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


