Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 13D62718EC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 14:35:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xuj72-00023z-6u for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2014 15:35:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:35:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:35:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 29 Nov 2014 15:27:20 +0100
Message-ID: <m5cl48$tor$2@ger.gmane.org>
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
	<1417164585-46087-4-git-send-email-biannm@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1417164585-46087-4-git-send-email-biannm@cn.fujitsu.com>
Subject: Re: [PATCH 3/3] [meta-oe] drbd: add recipe
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
X-List-Received-Date: Sat, 29 Nov 2014 14:35:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bian Naimeng schreef op 28-11-14 09:49:
> DRBD is a block device which is designed to build high availability
> clusters.
> 
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com> --- 
> meta-oe/recipes-extended/drbd/drbd_8.4.4.bb      | 57
> ++++++++++++++++++++++++ meta-oe/recipes-extended/drbd/files/drbd.service
> | 12 +++++ 2 files changed, 69 insertions(+) create mode 100644
> meta-oe/recipes-extended/drbd/drbd_8.4.4.bb create mode 100644
> meta-oe/recipes-extended/drbd/files/drbd.service
> 
> diff --git a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
> b/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb new file mode 100644 index
> 0000000..5439bac --- /dev/null +++
> b/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb @@ -0,0 +1,57 @@ +SUMMARY =
> "BD driver for Linux" +DESCRIPTION = "DRBD mirrors a block device over
> the network to another machine.\ +DRBD mirrors a block device over the
> network to another machine.\ +Think of it as networked raid 1. It is a
> building block for\ +setting up high availability (HA) clusters." + 
> +HOMEPAGE = "http://www.drbd.org/" + +SECTION = "kernel/userland" + 
> +LICENSE = "GPLv2+" + +LIC_FILES_CHKSUM =
> "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018" + +PR = "r0" +#PR =
> "r1001"

PR isn't used anumore

> + +SRC_URI = "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \ +
> file://drbd.service \ +          " + +#SRC_URI[md5sum] =
> "ef4e6db51cda1898c597a3d61fcb9e1e" +#SRC_URI[sha256sum] =
> "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49c652b5f392799d58d" +
Drop the commented lines

> +SRC_URI[md5sum] = "b51815343c1a9151e2936b3b97520388" +SRC_URI[sha256sum]
> = "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178f2ef4c15604288f0" + 
> +inherit autotools-brokensep systemd + +EXTRA_OECONF = "--with-utils
> \ +                --without-km                  \ +
> --with-initdir=/etc/init.d    \ +                --without-pacemaker
> \ +                --without-rgmanager           \ +
> --without-bashcompletion      \ +                --with-distro debian
> \ +               " + +do_configure (){ +    oe_runconf +}

Please add a comment why the stock do_configure doesn't work. And at least
add a 'gnu-configize' to make it work on new architectures.

> + +SYSTEMD_SERVICE_${PN} = "drbd.service" +SYSTEMD_AUTO_ENABLE =
> "disable"

Move that below do_install

> + +do_install_append() { +    if
> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then +
> install -d ${D}/${systemd_unitdir}/system +        install -m 644
> ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/system +        install
> -d ${D}/${libexecdir} +        install -m 755 ${D}/etc/init.d/drbd
> ${D}/${libexecdir}/drbd-helper +    fi +} + +FILES_${PN} += "run" 
> +FILES_${PN} += "${base_libdir}/drbd" +FILES_${PN}-dbg +=
> "${base_libdir}/drbd/.debug" diff --git
> a/meta-oe/recipes-extended/drbd/files/drbd.service
> b/meta-oe/recipes-extended/drbd/files/drbd.service new file mode 100644 
> index 0000000..22f853f --- /dev/null +++
> b/meta-oe/recipes-extended/drbd/files/drbd.service @@ -0,0 +1,12 @@ 
> +[Unit] +Description=DRBD Service +After=network.target + +[Service] 
> +Type=oneshot +RemainAfterExit=yes +ExecStart=/usr/lib/drbd/drbd-helper
> start +ExecStop=/usr/lib/drbd/drbd-helper stop

Hardcoded paths


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUedfIMkyGM64RGpERAnGtAJ9Js9FqtaeaPcfOd/l6nzWMwnEkCgCdFYtk
BFdk3t9Rv7jnV78/C+wNmXw=
=wZiM
-----END PGP SIGNATURE-----


