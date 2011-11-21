Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSOyl-0000xc-VP for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 09:11:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSOsV-0008TQ-IK for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 09:05:23 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 09:05:23 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 09:05:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 Nov 2011 09:05:08 +0100
Message-ID: <jad0nk$faj$1@dough.gmane.org>
References: <1321822001-3647-1-git-send-email-schnitzeltony@gmx.de>
	<1321822001-3647-2-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321822001-3647-2-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe 2/3] libnl: add 3.23
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
X-List-Received-Date: Mon, 21 Nov 2011 08:11:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-11-11 21:46, Andreas Müller schreef:
> * fixes networkmanager default route issue

If so, you'll need an extra patch to bump PR for networkmanager.

regards,

Koen

> * to make wpa-supplicant build, links to include files and shared libs 
> were added since wpa-supplicant expects old libnl-2 locations. Should 
> libnl-3 move to oe-core, this woraround should be fixed at 
> wpa-supplicant. * the command line interface (cli) applications were 
> added at libnl-cli packet. This seems correct because EXTRA_OECONF += 
> "--disable-cli" creates empty package libnl-cli without affecting other 
> packages. * build tested from scratch & run tested on overo with iw 3.2 /
> wpa-supplicant 0.7.3 / networkmanager 0.9.2.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- 
> meta-oe/recipes-support/libnl/libnl_3.2.3.bb |   46 
> ++++++++++++++++++++++++++ 1 files changed, 46 insertions(+), 0 
> deletions(-) create mode 100644 
> meta-oe/recipes-support/libnl/libnl_3.2.3.bb
> 
> diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb 
> b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb new file mode 100644
> index 0000000..190ea4c --- /dev/null +++ 
> b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb @@ -0,0 +1,46 @@ 
> +DESCRIPTION = "libnl is a library for applications dealing with netlink 
> sockets." +HOMEPAGE = "http://www.infradead.org/~tgr/libnl/" +SECTION = 
> "libs/network" + +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc" + +DEPENDS = 
> "flex-native bison-native" + +SRC_URI = 
> "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz" + 
> +SRC_URI[md5sum] = "dbbb44801e833cf9ca4fdc943f2a58ee"
> +SRC_URI[sha256sum] =
> "69f4a360350ea61f2c988f947c251995c04093c74743eae9eeffba85846ef007" + 
> +inherit autotools pkgconfig + +do_install_append() { +    # make 
> wpa-supplicant happy +    # TODO: when moving to oe-core fix at 
> wpa-supplicant +    # (e.g src/drivers/drivers.mak) +    cd 
> ${D}${includedir} +    ln -sf libnl3/netlink netlink +    cd 
> ${D}${libdir} +    ln -sf libnl-3.so.200 libnl.so +    ln -sf 
> libnl-3.so.200 libnl.so.3 +    ln -sf libnl-genl-3.so.200 libnl-genl.so
> + ln -sf libnl-genl-3.so.200 libnl-genl.so.3 +} + +FILES_${PN} = 
> "${libdir}/libnl-3.so.* \ +               ${libdir}/libnl.so.* \ + 
> ${sysconfdir}" +FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug" 
> +FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \ + 
> ${libdir}/libnl/cli/*/*.la" +FILES_${PN}-staticdev += 
> "${libdir}/libnl/cli/*/*.a" + +PACKAGES += "${PN}-cli ${PN}-route 
> ${PN}-nf ${PN}-genl" +FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
> + ${libdir}/libnl/cli/*/*.so.* \ +                     ${sbindir}/nl-*" 
> +FILES_${PN}-route = "${libdir}/libnl-route-3.so.*" +FILES_${PN}-nf    = 
> "${libdir}/libnl-nf-3.so.*" +FILES_${PN}-genl  = 
> "${libdir}/libnl-genl-3.so.* \ + ${libdir}/libnl-genl.so.*" +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7KBjQACgkQMkyGM64RGpFf1ACgiOaSB2YjkcTglGeUD57fx3SA
ZL0AnRvCYLiJDS8n19prYLVlhAnXCPox
=hjyd
-----END PGP SIGNATURE-----



