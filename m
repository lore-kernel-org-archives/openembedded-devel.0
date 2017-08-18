Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 59005782ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:05:52 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id u185so56600157pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 22:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=L3YY0hrPMTT81w9wy9ZZgASNKdWoMXCTEwplyalEHwU=;
	b=TPH3VDvudlHl00E3mrvi4+fD7sq5uQ6KdU/cinI085k0XvL+J9G7zxM8QU6bdHhGjX
	MA+wfJr+mw4JzkkxUekPVHMGWQKQLXOqDRs0DZ2q0sB77tL2ghudvY5PTAElR5Xo4xGH
	85kkEyQDzgjrPLRGULe/gsGkaAHNFrfPP70YRO/H478RVf3CQdKJw+Gea85ri8X/28JJ
	OFzYPghm4rkdkpvzq5NZP+QsU+P2kJ0HXdlToG1CTz4HkhLSBueW+eCnUDXPRSk46lWC
	4J6iP//Fsl7aOgTeqOZN/N79DEKNktQDhDCYHwQE0+n148TJC/rw+FXpSaCtS3/Dff1S
	oYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=L3YY0hrPMTT81w9wy9ZZgASNKdWoMXCTEwplyalEHwU=;
	b=qI6+NcaNMc8WP4mlEVaaohc8pyG2pQTctZlXcu5yEVRqc655uaWP2P4mqIABZxWXzT
	9ENt5IjsExVCgI+zo6pCDHS9Io+0FQn8WY/VvH7vIKHXm2vGE8kYxQjrPRKQbPK/PeKk
	azYhW6pPTqCSN4Lz5UIB2N3vte2IWUfbLeylHj5tuCfQL9fT8j11ZjJQ5TOtT85RxVxZ
	0LYzsO2W3fY1MeYAoZhvb1AsY/TFNcBoq7tOQRAfHUqrQ9aOsezq0xKRgCKQwxsC9IFB
	X287ddj3irwtj9qUJ1bLNVkCLqVDBoxcsDEw3+EAjIuyqTtiPJeoF+1IkXlUnZyk1L9n
	B/Sw==
X-Gm-Message-State: AHYfb5ihYQ4H0uhUg0314pPgxge6CCE4SCJoVqSYrEOdSEy43z5NM4PB
	rD9yROMevQlpni7qmsHhG2FNTMjfNA==
X-Received: by 10.98.147.19 with SMTP id b19mr7584002pfe.283.1503032754566;
	Thu, 17 Aug 2017 22:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <1503032354-3955-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1503032354-3955-1-git-send-email-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 05:05:43 +0000
Message-ID: <CAMKF1sp43WJ-X7z=7cLw_QvKdWOS_n4-tCBQLKG=kY89ezMStQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 18 Aug 2017 05:05:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 17, 2017 at 9:58 PM Yi Zhao <yi.zhao@windriver.com> wrote:

> * Add c-ares as dependency
> * Remove variable QUAGGASUBDIR as it is not needed anymore
> * Remove the duplicated RDEPENDS_${PN} += "iproute2"
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../recipes-protocols/quagga/quagga.inc            | 24
> ++++++++--------------
>  .../recipes-protocols/quagga/quagga_1.1.0.bb       |  6 ------
>  .../recipes-protocols/quagga/quagga_1.2.1.bb       |  4 ++++
>  3 files changed, 12 insertions(+), 22 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/quagga/
> quagga_1.1.0.bb
>  create mode 100644 meta-networking/recipes-protocols/quagga/
> quagga_1.2.1.bb
>
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc
> b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 4fb6723..dfd6aa7 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -7,21 +7,20 @@ Ishiguro. The Quagga tree aims to build a more involved
> community \
>  around Quagga than the current centralised model of GNU Zebra."
>  HOMEPAGE = "http://www.nongnu.org/quagga/"
>  SECTION = "net"
> -LICENSE = "GPL-2.0 & LGPL-2.0"


Perhaps this should be LGPL-2.1 can you cross check

>
> -DEPENDS = "readline ncurses perl-native"
> -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'net-snmp',
> '', d)}"
> -SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
> '--enable-snmp', '', d)}"
>
> +
> +LICENSE = "GPL-2.0 & LGPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
>
>  file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
>
> +DEPENDS = "readline ncurses perl-native c-ares"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'net-snmp',
> '', d)}"
> +SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp',
> '--enable-snmp', '', d)}"
> +
>  # the "ip" command from busybox is not sufficient (flush by protocol
> flushes all routes)
>  RDEPENDS_${PN} += "iproute2"
>
> -QUAGGASUBDIR = ""
> -# ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
> -# versions and leave it empty for recent versions.
> -SRC_URI =
> "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
> +SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
>             file://quagga.init \
>             file://quagga.default \
>             file://watchquagga.init \
> @@ -35,7 +34,7 @@ SRC_URI =
> "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
>             file://ripd.service \
>             file://ripngd.service \
>             file://zebra.service \
> -"
> +          "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
> @@ -108,10 +107,6 @@ do_install () {
>      sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/*
> ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
>      sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/*
>
> -    # Remove generated info dir file, it doesn't belong in the generated
> -    # package.
> -    rm -f ${D}${infodir}/dir
> -
>      # For PAM
>      for feature in ${DISTRO_FEATURES}; do
>          if [ "$feature" = "pam" ]; then
> @@ -188,9 +183,6 @@ CONFFILES_${PN}-watchquagga =
> "${sysconfdir}/default/watchquagga"
>  DEBIAN_NOAUTONAME_${PN}-ospfd = "1"
>  DEBIAN_NOAUTONAME_${PN}-ospfclient = "1"
>
> -# the "ip" command from busybox is not sufficient (flush by protocol
> flushes all routes)
> -RDEPENDS_${PN}          += "iproute2"
> -
>  # Main init script starts all deamons
>  # Seperate init script for watchquagga
>  INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
> diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
> b/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
> deleted file mode 100644
> index 1b5c34c..0000000
> --- a/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require quagga.inc
> -
> -SRC_URI[md5sum] = "daa303871e07ea5856aae6fd79e89722"
> -SRC_URI[sha256sum] =
> "f7a43a9c59bfd3722002210530b2553c8d5cc05bfea5acd56d4f102b9f55dc63"
> -
> -QUAGGASUBDIR = ""
> diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
> b/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
> new file mode 100644
> index 0000000..4d43d7b
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.1.bb
> @@ -0,0 +1,4 @@
> +require quagga.inc
> +
> +SRC_URI[md5sum] = "b1546de89062f7070d56e780b30be4b1"
> +SRC_URI[sha256sum] =
> "aaddba5d4f41ed8e4c2f155f4584c993465d122c9096b5b52ada3fc75266fbcd"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

