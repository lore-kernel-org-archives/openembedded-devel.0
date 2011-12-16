Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSfB-0003oT-3B for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 08:57:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSYR-0007Ww-Aw for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 08:50:07 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:50:07 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:50:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:48:41 +0100
Message-ID: <jcet4n$4n1$2@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-2-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-2-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 2/9] ietutils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 07:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> The GNU inetutils are a collection of common networking utilities and
> servers including ftp, ftpd, rcp, rexec, rlogin, rlogind, rsh, rshd,
> syslog, syslogd, talk, talkd, telnet, telnetd, tftp, tftpd, and uucpd.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>

> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb @@ -0,0
> +1,66 @@ +SECTION = "libs" +DEPENDS = "ncurses fakeroot-native" +LICENSE
> = "GPL"

That's not valid license, please include the version number, e.g. GPLv2 or
GPLv2+

> +DESCRIPTION = "The GNU inetutils are a collection of common \ 
> +networking utilities and servers including ftp, ftpd, rcp, \ +rexec,
> rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \ +talkd, telnet,
> telnetd, tftp, tftpd, and uucpd."

Please move that to the top

> + +LIC_FILES_CHKSUM =
> "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"

And move that next to LICENSE

> + +SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \ +
> file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> \ +
> file://inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
> \ +           file://inetutils-1.8-0003-wchar.patch \ +
> file://inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
> \ +
> file://inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
> \ +
> file://inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
> \ +           file://inetutils-1.8-1004-detect-fork-support.patch \ +
> file://inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch \ +
> file://fix-disable-ipv6.patch \ +" + +inherit autotools gettext + 
> +noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6
> gl_cv_socket_ipv6=no', d)}" +EXTRA_OECONF =
> "--with-ncurses-include-dir=${STAGING_INCDIR} \ +
> --with-path-procnet-dev=/proc/net/dev \ +		${noipv6} \ +		" + 
> +do_configure_prepend () { +	export HELP2MAN='true' +	cp
> ${STAGING_DATADIR_NATIVE}/gettext/config.rpath
> ${S}/build-aux/config.rpath +	rm -f ${S}/glob/configure* +} + +fakeroot
> do_install () {

explicit fakeroot isn't needed anymore, pseudo always runs.


> +	autotools_do_install +	install -d ${D}${base_sbindir}
> ${D}${base_bindir} +	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN} +	mv
> ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN} +	mv ${D}${bindir}/logger
> ${D}${bindir}/logger.${PN} +	mv ${D}${bindir}/traceroute
> ${D}${bindir}/traceroute.${PN} +	mv ${D}${bindir}/hostname
> ${D}${base_bindir}/hostname.${PN} +	mv ${D}${bindir}/ifconfig
> ${D}${base_sbindir}/ifconfig.${PN} +} + +pkg_postinst_${PN} () { +
> update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100 +
> update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100 +
> update-alternatives --install ${bindir}/logger logger logger.${PN} 100 +
> update-alternatives --install ${bindir}/traceroute traceroute
> traceroute.${PN} 100 +	update-alternatives --install
> ${base_bindir}/hostname hostname hostname.${PN} 100 +	update-alternatives
> --install ${base_sbindir}/ifconfig ifconfig ifconfig.${PN} 100 +} + 
> +pkg_prerm_${PN} () { +	update-alternatives --remove tftp tftp.${PN} +
> update-alternatives --remove telnet telnet.${PN} +	update-alternatives
> --remove logger logger.${PN} +	update-alternatives --remove traceroute
> traceroute.${PN} +	update-alternatives --remove ifconfig ifconfig.${PN} 
> +} + +SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd" 
> +SRC_URI[sha256sum] =
> "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"

Move those next to SRC_URI

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q99kACgkQMkyGM64RGpFtqQCfeLWLjY8SuCe3eSSd8CabPyo0
SNYAn2f32eL5hwGnPC4P9T5CtrYlBCRt
=oxmn
-----END PGP SIGNATURE-----



