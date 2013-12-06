Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id F3F2C617AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2013 14:24:13 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VowKC-0000qU-JX for openembedded-devel@lists.openembedded.org;
	Fri, 06 Dec 2013 15:24:12 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2013 15:24:12 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2013 15:24:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 Dec 2013 15:24:53 +0100
Message-ID: <l7smlo$t35$1@ger.gmane.org>
References: <1386324799-30305-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386324799-30305-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.6
Subject: Re: [meta-networking][PATCH] transmission: add 3.82
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
X-List-Received-Date: Fri, 06 Dec 2013 14:24:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef op 06-12-13 11:13:
> Transmission is a cross-platform BitTorrent client.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

V2 will follow soon with a config file that actually allows using the daemon :)

> --- .../transmission/transmission_2.82.bb              | 52
> ++++++++++++++++++++++ 1 file changed, 52 insertions(+) create mode
> 100644
> meta-networking/recipes-protocols/transmission/transmission_2.82.bb
> 
> diff --git
> a/meta-networking/recipes-protocols/transmission/transmission_2.82.bb
> b/meta-networking/recipes-protocols/transmission/transmission_2.82.bb new
> file mode 100644 index 0000000..3ca6c5a --- /dev/null +++
> b/meta-networking/recipes-protocols/transmission/transmission_2.82.bb @@
> -0,0 +1,52 @@ +DESCRIPTION = "Transmission is a BitTorrent client w/ a
> built-in Ajax-Powered Webif GUI." +SECTION = "network" + +HOMEPAGE =
> "www.transmissionbt.com/" + +DEPENDS = "libevent gnutls openssl libtool
> intltool-native curl" + +LICENSE = "MIT & GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=7ee657ac1dce0e7353033fc06c8087d2" + +SRC_URI =
> "http://download.transmissionbt.com/files/transmission-${PV}.tar.xz" 
> +SRC_URI[md5sum] = "a5ef870c0410b12d10449c2d36fa4661"
>  +SRC_URI[sha256sum] =
> "3996651087df67a85f1e1b4a92b1b518ddefdd84c654b8df6fbccb0b91f03522" + 
> +inherit autotools gettext useradd systemd + +PACKAGECONFIG =
> "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \ +
> ${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}" + 
> +PACKAGECONFIG[gtk] = " --with-gtk,--without-gtk,gtk+," 
> +PACKAGECONFIG[systemd] =
> "--with-systemd-daemon,--without-systemd-daemon,systemd," + +# Configure
> aborts with: +# config.status: error: po/Makefile.in.in was not created
> by intltoolize. +do_configure_prepend() { +    sed -i
> /AM_GLIB_GNU_GETTEXT/d ${S}/configure.ac +    intltoolize --copy --force
> --automake +} + +do_install_append() { +	install -d
> ${D}${nonarch_base_libdir}/systemd/system +	install -m 0644
> ${S}/daemon/transmission-daemon.service
> ${D}${nonarch_base_libdir}/systemd/system +} + +PACKAGES += "${PN}-gui
> ${PN}-client" + +FILES_${PN}-client = "${bindir}/transmission-remote
> ${bindir}/transmission-cli ${bindir}/transmission-create
> ${bindir}/transmission-show ${bindir}/transmission-edit" +FILES_${PN}-gui
> += "${bindir}/transmission-gtk ${datadir}/icons ${datadir}/applications
> ${datadir}/pixmaps" + +FILES_${PN} = "${bindir}/transmission-daemon
> ${datadir}/transmission ${sysconfdir}" + +SYSTEMD_SERVICE_${PN} =
> "transmission-daemon.service" + +USERADD_PACKAGES = "${PN}" 
> +GROUPADD_PARAM_${PN} = "--system transmission" +USERADD_PARAM_${PN} =
> "--home ${localstatedir}/lib/transmission-daemon --create-home \ +
> --gid transmission \ +                       --shell ${base_bindir}/false
> \ +                       --system \ +
> transmission" + +
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSod40MkyGM64RGpERAkKLAJ9VOiEr0dDBLidnFTBZuF8rLYc32QCfehvB
u1qPSpVzazHBmmFiHmIJd9E=
=2dZs
-----END PGP SIGNATURE-----


