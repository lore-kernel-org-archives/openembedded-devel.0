Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E7D5465C84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 09:55:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X5B4C-0006pA-HP for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2014 11:55:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:55:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Jul 2014 11:50:08 +0200
Message-ID: <lplnkg$9pf$2@ger.gmane.org>
References: <1404914108-27167-1-git-send-email-jukka.rissanen@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1404914108-27167-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Do not try to use autotools
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
X-List-Received-Date: Thu, 10 Jul 2014 09:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jukka Rissanen schreef op 09-07-14 15:55:
> There is only one Makefile in the project so no use trying to use 
> autotools.
> 
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com> --- 
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb | 6
> ++++-- 1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb index
> 92d1ac4..761617c 100644 ---
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb +++
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb @@ -2,8
> +2,6 @@ SUMMARY = "A mode switching tool for controlling 'flip flop'
> (multiple device) U LICENSE = "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> 
> -inherit autotools - DEPENDS = "libusb1"
> 
> SRC_URI =
> "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2" 
> @@ -15,3 +13,7 @@ EXTRA_OEMAKE = "TCL=${bindir}/tclsh" FILES_${PN} =
> "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir}
> ${localstatedir}/lib/usb_modeswitch" RDEPENDS_${PN} = "tcl" 
> RRECOMMENDS_${PN} = "usb-modeswitch-data" + +do_install_append() { +
> oe_runmake DESTDIR=${D} install +}
> 

Why 'append'?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTvmHQMkyGM64RGpERAjNhAJsGrPsjduh+tyXOpfdgSGDeyyMIAQCfddVb
iqFcOGhKW0utODF6oqEi0PU=
=afXu
-----END PGP SIGNATURE-----


