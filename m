Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGmEY-0006Gw-CY for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:40:38 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGm2D-0006dv-6g for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:27:53 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:27:53 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:27:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 26 Sep 2012 09:27:39 +0200
Message-ID: <k3uap8$evl$1@ger.gmane.org>
References: <1348631669-22341-1-git-send-email-jackie.huang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
In-Reply-To: <1348631669-22341-1-git-send-email-jackie.huang@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-networking] [PATCH] ptpd: migrate from meta-oe into meta-networking and uprev to ptpd 2.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 07:40:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-09-12 05:54, jackie.huang@windriver.com schreef:
> From: Jackie Huang <jackie.huang@windriver.com>
> 

> meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |   20 +++++++ 
> meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   32 ++++++++++

First: why do we need 2 versions?

> +SUMMARY = "The PTP daemon (PTPd)" +DESCRIPTION = "The PTP daemon (PTPd)
> implements the Precision Time protocol (PTP) as \ +defined by the
> relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \ 
> +and PTP Version 2 implements IEEE-1588-2008. PTP was developed to
> provide very precise \ +time coordination of LAN connected computers." 
> +HOMEPAGE = "http://sourceforge.net/projects/ptpd" +SECTION = "network" 
> +LICENSE = "BSD" + +PR = "r0"

Remove that

> + +LIC_FILES_CHKSUM =
> "file://../COPYRIGHT;md5=3d8ac2c46c116bce2d2ad838b6cf3491"

That goes together with the LICENSE var

> + +SRC_URI =
> "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz
> \ +           file://adjust-daemon-name.patch;striplevel=2 \ +
> file://ld-as-needed.patch;striplevel=2 \ +" + +SRC_URI[md5sum] =
> "c63a3a149d30c710773ccb02df5782a3" +SRC_URI[sha256sum] =
> "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4" + +S =
> "${WORKDIR}/ptpd-${PV}/src" + +# EXTRA_OEMAKE is typically: -e
> MAKEFLAGS= +# the -e causes problems as CFLAGS is modified in the
> Makefile. +EXTRA_OEMAKE = ""

Modified how? Are the OE CFLAGS and LDFLAGS getting used or not ?

> + +do_install() { +        install -d ${D}${bindir} ${D}${mandir}/man8 +
> install -m 0755 ptpd ${D}${bindir} +        install -m 0644 ptpd2.8
> ${D}${mandir}/man8 +}

is 'make install' broken?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQYq5rMkyGM64RGpERAo2vAJ9GpL7QQJHYGSkxiYC+/ePERYqIrACfUL7Q
lekJzXFfoWZGp43GNgPTY4k=
=h/6e
-----END PGP SIGNATURE-----



