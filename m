Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbVIb-0004CV-Ou for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:45:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbVBr-00064I-RJ for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:38:59 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:38:59 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:38:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 11:38:47 +0100
Message-ID: <jcf73n$99u$1@dough.gmane.org>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324028520-16474-1-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe v2 1/8] bridge-utils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:45:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 10:41, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> bridge-utils provides tools for ethernet bridging.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> .../bridge-utils/bridge-utils.inc                  |   28
> ++++++++++++++++++++ .../bridge-utils/bridge-utils_1.4.bb               |
> 6 ++++ 2 files changed, 34 insertions(+), 0 deletions(-) create mode
> 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc create
> mode 100644
> meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
> 
> diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc new file
> mode 100644 index 0000000..8b3d167 --- /dev/null +++
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc @@ -0,0
> +1,28 @@ +DESCRIPTION = "Tools for ethernet bridging." +HOMEPAGE =
> "http://bridge.sourceforge.net/" +SECTION = "console/network" +LICENSE =
> "GPL v2"

No space, patch is OK otherwise

> + +SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz" + 
> +inherit autotools + +EXTRA_OECONF =
> "--with-linux-headers=${STAGING_INCDIR}" + +do_install_append () { +	mv
> ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN} +	install -d
> ${D}/${datadir}/bridge-utils +	install -d
> ${D}/${sysconfdir}/network/if-pre-up.d +	install -d
> ${D}/${sysconfdir}/network/if-post-down.d +} + +DEPENDS = "sysfsutils" 
> +RRECOMMENDS_${PN} = "kernel-module-bridge" + +pkg_postinst_${PN} () { +
> update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100 +} 
> + +pkg_prerm_${PN} () { +	update-alternatives --remove brctl brctl.${PN} 
> +} diff --git
> a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb new file
> mode 100644 index 0000000..00a5815 --- /dev/null +++
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb @@ -0,0
> +1,6 @@ +require bridge-utils.inc + +LIC_FILES_CHKSUM =
> "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37" + +SRC_URI[md5sum]
> = "0182fcac3a2b307113bbec34e5f1c673" +SRC_URI[sha256sum] =
> "876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7rH7MACgkQMkyGM64RGpEnpwCgn063zW7fagM/ZNukU3fnEp+T
RVIAnj0rvx5NriLOZYnsyBtm3K+rR5CU
=7k8w
-----END PGP SIGNATURE-----



