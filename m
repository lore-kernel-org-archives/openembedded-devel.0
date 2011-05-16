Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QM2xm-0008QA-DR for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 20:56:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QM2uw-0004q8-AJ for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 20:53:22 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 20:53:22 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 20:53:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 May 2011 20:53:07 +0200
Message-ID: <iqrrqj$v58$1@dough.gmane.org>
References: <1305555326-32419-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305555326-32419-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH v4] pcsc-lite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 18:56:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, applied

On 16-05-11 16:15, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 ++++++++++++++++
>  .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   38 ++++++++++++++++++++
>  2 files changed, 70 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/pcsc-lite/files/pcscd.init
>  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
> 
> diff --git a/meta-oe/recipes-support/pcsc-lite/files/pcscd.init b/meta-oe/recipes-support/pcsc-lite/files/pcscd.init
> new file mode 100644
> index 0000000..92385ab
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcsc-lite/files/pcscd.init
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +DAEMON=/usr/sbin/pcscd
> +NAME=pcscd
> +DESC="PCSC Daemon"
> +PIDFILE=/var/run/pcscd/pcscd.pid
> +ARGS=""
> +
> +test -f $DAEMON || exit 0
> +
> +case "$1" in
> +    start)
> +        echo -n "Starting $DESC: $NAME"
> +        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $ARGS
> +        echo "."
> +        ;;
> +    stop)
> +        echo -n "Stopping $DESC: $NAME"
> +        start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
> +        echo "."
> +        ;;
> +    restart)
> +        $0 stop
> +        sleep 1
> +        $0 start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
> new file mode 100644
> index 0000000..7d235d6
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "PC/SC Lite smart card framework and applications"
> +HOMEPAGE = "http://pcsclite.alioth.debian.org/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c8e551349dc346258274f0007679e149"
> +DEPENDS = "udev"
> +PR = "r0"
> +
> +SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2 \
> +           file://pcscd.init "
> +
> +SRC_URI[md5sum] = "47e7055cfc14399fdaa1b7a4aa06e5aa"
> +SRC_URI[sha256sum] = "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052fd1a6ee03880b398"
> +
> +inherit autotools update-rc.d
> +
> +EXTRA_OECONF = " \
> +	--disable-libusb \
> +	--enable-libudev \
> +	--enable-usbdropdir=${libdir}/pcsc/drivers \
> +	"
> +
> +S = "${WORKDIR}/pcsc-lite-${PV}"
> +
> +do_install() {
> +	oe_runmake DESTDIR="${D}" install
> +	install -d "${D}/${sysconfdir}/init.d"
> +	install -m 755 "${WORKDIR}/pcscd.init" "${D}/${sysconfdir}/init.d/pcscd"
> +
> +	# handle vars values
> +	sed -i 's,/usr/sbin,${sbindir},g;s,/var,${localstatedir},g' "${D}/${sysconfdir}/init.d/pcscd"
> +}
> +
> +PACKAGES =+ "${PN}-lib"
> +
> +INITSCRIPT_NAME = "pcscd"
> +INITSCRIPT_PARAMS = "defaults"
> +
> +FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN0XKTMkyGM64RGpERAus0AJwPWV8fH1fAjijTxqDlQpzr7VBHCQCfbmn6
l7a6BTUPr6QDv8gDaBDmpNQ=
=pmc1
-----END PGP SIGNATURE-----



