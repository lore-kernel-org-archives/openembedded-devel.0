Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 835C66B23E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:01:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6HK1lJv008871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 13:01:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 13:01:45 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E3AE17FE4	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 16:01:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id E50BD410DF; Wed,
	17 Jul 2013 15:55:01 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:55:01 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130717195501.GD31259@windriver.com>
References: <1374031242-27577-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1374031242-27577-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] inetutils: several improvement
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
X-List-Received-Date: Wed, 17 Jul 2013 20:01:47 -0000
X-Groupsio-MsgNum: 45397
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] inetutils: several improvement] On 13.07.17 =
(Wed 11:20) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. integrate rexec, rlogin, rsh, telnet, tftpd xinetd startup scripts
> 2. inherit update-alternatives bbclass, not call update-alternatives dire=
ctly.
> 3. package all commands into subpackages
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../inetutils-1.9.1/rexec.xinetd.inetutils         |   20 +++
>  .../inetutils-1.9.1/rlogin.xinetd.inetutils        |   23 +++
>  .../inetutils/inetutils-1.9.1/rsh.xinetd.inetutils |   21 +++
>  .../inetutils-1.9.1/telnet.xinetd.inetutils        |   13 ++
>  .../inetutils-1.9.1/tftpd.xinetd.inetutils         |   19 +++
>  .../inetutils/inetutils_1.9.1.bb                   |  148 ++++++++++++++=
++----
>  6 files changed, 215 insertions(+), 29 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/rexec.xinetd.inetutils
>  create mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/rlogin.xinetd.inetutils
>  create mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/rsh.xinetd.inetutils
>  create mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/telnet.xinetd.inetutils
>  create mode 100644 meta-networking/recipes-connectivity/inetutils/inetut=
ils-1.9.1/tftpd.xinetd.inetutils
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.1/rexec.xinetd.inetutils
> new file mode 100644
> index 0000000..80aed36
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexe=
c.xinetd.inetutils
> @@ -0,0 +1,20 @@
> +# default: off
> +# description:
> +# Rexecd is the server for the rexec program. The server provides remote=
=20
> +# execution facilities with authentication based on user names and=20
> +# passwords.
> +#
> +service exec
> +{
> +	socket_type	=3D stream
> +	protocol	=3D tcp
> +	flags		=3D NAMEINARGS
> +	wait		=3D no
> +	user		=3D root
> +	group		=3D root
> +	log_on_success	+=3D USERID
> +	log_on_failure	+=3D USERID
> +	server		=3D /usr/bin/tcpd
> +	server_args	=3D /usr/sbin/in.rexecd
> +	disable		=3D yes
> +}
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils-1.9.1/rlogin.xinetd.inetutils
> new file mode 100644
> index 0000000..00dbf93
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlog=
in.xinetd.inetutils
> @@ -0,0 +1,23 @@
> +# default: off
> +# description:
> +# Rlogind is a server for the rlogin program. The server provides remote=
=20
> +# execution with authentication based on privileged port numbers from tr=
usted
> +# host
> +#
> +service login
> +{
> +	socket_type	=3D stream
> +	protocol	=3D tcp
> +	flags		=3D NAMEINARGS
> +	wait		=3D no
> +	user		=3D root
> +	group		=3D root
> +	log_on_success	+=3D USERID
> +	log_on_failure	+=3D USERID
> +	server		=3D /usr/bin/tcpd
> +	server_args	=3D /usr/sbin/in.rlogind -a
> +	disable		=3D yes
> +}
> +						=09
> +						=09
> +						=09
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/=
inetutils-1.9.1/rsh.xinetd.inetutils
> new file mode 100644
> index 0000000..ad59b62
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.=
xinetd.inetutils
> @@ -0,0 +1,21 @@
> +# default: off
> +# description:
> +# The rshd server is a server for the rcmd(3) routine and,=20
> +# consequently, for the rsh(1) program. The server provides=20
> +# remote execution facilities with authentication based on=20
> +# privileged port numbers from trusted hosts.
> +#
> +service shell
> +{
> +	socket_type	=3D stream
> +	protocol	=3D tcp
> +	flags		=3D NAMEINARGS
> +	wait		=3D no
> +	user		=3D root
> +	group		=3D root
> +	log_on_success	+=3D USERID
> +	log_on_failure	+=3D USERID
> +	server		=3D /usr/bin/tcpd
> +	server_args	=3D /usr/sbin/in.rshd -aL
> +	disable		=3D yes
> +}
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils-1.9.1/telnet.xinetd.inetutils
> new file mode 100644
> index 0000000..2a2a12e
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/teln=
et.xinetd.inetutils
> @@ -0,0 +1,13 @@
> +# default: on
> +# description: The telnet server serves telnet sessions; it uses \
> +#       unencrypted username/password pairs for authentication.
> +service telnet
> +{
> +	disable		=3D no
> +	flags		=3D REUSE
> +	socket_type	=3D stream
> +	wait		=3D no
> +	user		=3D root
> +	server		=3D /usr/sbin/in.telnetd
> +	log_on_failure	+=3D USERID
> +}
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E1/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.1/tftpd.xinetd.inetutils
> new file mode 100644
> index 0000000..f549163
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftp=
d.xinetd.inetutils
> @@ -0,0 +1,19 @@
> +# default: off
> +# description:
> +# Tftpd is a server which supports the Internet Trivial File Transfer
> +# Pro-tocol (RFC 783). The TFTP server operates at the port indicated
> +# in the tftp service description; see services(5).
> +#
> +service tftp
> +{
> +        disable         =3D yes
> +        socket_type     =3D dgram
> +        protocol        =3D udp
> +        flags           =3D IPv6
> +        wait            =3D yes
> +        user            =3D root
> +        group           =3D root
> +        server          =3D /usr/sbin/in.tftpd
> +        server_args     =3D /tftpboot
> +}
> +
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index 603bf01..c55851f 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -3,30 +3,36 @@ networking utilities and servers including ftp, ftpd, r=
cp, \
>  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
>  SECTION =3D "libs"
> -DEPENDS =3D "ncurses"
> +DEPENDS =3D "ncurses netbase readline"
>  LICENSE =3D "GPLv3"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c7051aef9219dc7237f206c5c417=
9a7"
> =20
>  PR =3D "r1"
> -
>  SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>             file://disable-pre-ANSI-compilers.patch \
>             file://version.patch \
>             file://remove-gets.patch \
>             file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for=
-__GLIBC__.patch \
>             file://inetutils-1.8-0003-wchar.patch \
> -           file://fix-disable-ipv6.patch \
> -"=20
> +           file://rexec.xinetd.inetutils  \
> +           file://rlogin.xinetd.inetutils \
> +           file://rsh.xinetd.inetutils \
> +           file://telnet.xinetd.inetutils \
> +           file://tftpd.xinetd.inetutils \
> +"
> +
>  SRC_URI[md5sum] =3D "944f7196a2b3dba2d400e9088576000c"
>  SRC_URI[sha256sum] =3D "02a9ebde8a198cb85f87545b9d88fb103a183958139864a8=
5fe9e027ad79ff2b"
> =20
> -inherit autotools gettext
> +inherit autotools gettext update-alternatives
> =20
> +SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fi=
x-disable-ipv6.patch', d)}"
>  noipv6=3D"${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv=
6 gl_cv_socket_ipv6=3Dno', d)}"
>  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
>          --with-path-procnet-dev=3D/proc/net/dev \
>          ${noipv6} \
> +        --with-path-login=3D/bin/login \
>  "
> =20
>  do_configure_prepend () {
> @@ -35,30 +41,114 @@ do_configure_prepend () {
>      rm -f ${S}/glob/configure*
>  }
> =20
> -do_install () {
> -    autotools_do_install
> -    install -d ${D}${base_sbindir} ${D}${base_bindir}
> -    mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN}
> -    mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN}
> -    mv ${D}${bindir}/logger ${D}${bindir}/logger.${BPN}
> -    mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN}
> -    mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN}
> -    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN}
> +do_install_append () {
> +    install -m 0755 -d ${D}${base_bindir}
> +    install -m 0755 -d ${D}${base_sbindir}
> +    install -m 0755 -d ${D}${sbindir}
> +    install -m 0755 -d ${D}${sysconfdir}/xinetd.d
> +    mv ${D}${bindir}/ping ${D}${base_bindir}/
> +    mv ${D}${bindir}/ping6 ${D}${base_bindir}/
> +    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
> +    mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
> +    mv ${D}${bindir}/hostname ${D}${base_bindir}/
> +    mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
> +    mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
> +    mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
> +    mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
> +    mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
> +    mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
> +    mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
> +    mv ${D}${libexecdir}/* ${D}${bindir}/
> +    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/re=
xec
> +    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/r=
login
> +    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
> +    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/t=
elnet
> +    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tf=
tpd
> +    rm -rf ${D}${libexecdir}/
>  }
> =20
> -pkg_postinst_${PN} () {
> -    update-alternatives --install ${bindir}/tftp tftp tftp.${BPN} 100
> -    update-alternatives --install ${bindir}/telnet telnet telnet.${BPN} =
100
> -    update-alternatives --install ${bindir}/logger logger logger.${BPN} =
100
> -    update-alternatives --install ${bindir}/traceroute traceroute tracer=
oute.${BPN} 100
> -    update-alternatives --install ${base_bindir}/hostname hostname hostn=
ame.${BPN} 100
> -    update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifco=
nfig.${BPN} 100
> -}
> +PACKAGES =3D+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
> +${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd \
> +${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
> +${PN}-rsh ${PN}-rshd"
> =20
> -pkg_prerm_${PN} () {
> -    update-alternatives --remove tftp tftp.${BPN}
> -    update-alternatives --remove telnet telnet.${BPN}
> -    update-alternatives --remove logger logger.${BPN}
> -    update-alternatives --remove traceroute traceroute.${BPN}
> -    update-alternatives --remove ifconfig ifconfig.${BPN}
> -}
> +ALTERNATIVE_PRIORITY =3D "80"
> +ALTERNATIVE_${PN} =3D "talk whois"
> +ALTERNATIVE_LINK_NAME[talkd]  =3D "${sbindir}/in.talkd"
> +ALTERNATIVE_LINK_NAME[uucpd]  =3D "${sbindir}/in.uucpd"
> +
> +ALTERNATIVE_${PN}-logger =3D "logger"
> +ALTERNATIVE_${PN}-syslogd =3D "syslogd"
> +ALTERNATIVE_LINK_NAME[syslogd]  =3D "${base_sbindir}/syslogd"
> +
> +ALTERNATIVE_${PN}-ftp =3D "ftp"
> +ALTERNATIVE_${PN}-ftpd =3D "ftpd"
> +ALTERNATIVE_${PN}-tftp =3D "tftp"
> +ALTERNATIVE_${PN}-tftpd =3D "tftpd"
> +ALTERNATIVE_LINK_NAME_${PN}-tftpd =3D "${bindir}/tftpd"
> +ALTERNATIVE_TARGET_${PN}-tftpd  =3D "${sbindir}/in.tftpd"
> +
> +ALTERNATIVE_${PN}-telnet =3D "telnet"
> +ALTERNATIVE_${PN}-telnetd =3D "telnetd"
> +ALTERNATIVE_LINK_NAME_${PN}-telnetd =3D "${bindir}/telnetd"
> +ALTERNATIVE_TARGET_${PN}-telnetd =3D "${sbindir}/in.telnetd"
> +
> +ALTERNATIVE_${PN}-rsh =3D "rcp rexec rlogin rsh"
> +ALTERNATIVE_${PN}-rshd =3D "rshd rexecd rlogind"
> +ALTERNATIVE_LINK_NAME_${PN}-rshd =3D "${bindir}/rshd"
> +ALTERNATIVE_TARGET_${PN}-rshd =3D "${sbindir}/in.rshd"
> +ALTERNATIVE_LINK_NAME_${PN}-rexecd =3D "${bindir}/rexecd"
> +ALTERNATIVE_TARGET_${PN}-rexecd =3D "${sbindir}/in.rexecd"
> +ALTERNATIVE_LINK_NAME_${PN}-rlogind =3D "${bindir}/rlogind"
> +ALTERNATIVE_TARGET_${PN}-rlogind =3D "${sbindir}/in.rlogind"
> +
> +ALTERNATIVE_${PN}-inetd=3D "inetd"
> +ALTERNATIVE_${PN}-traceroute =3D "traceroute"
> +
> +ALTERNATIVE_${PN}-hostname =3D "hostname"
> +ALTERNATIVE_LINK_NAME[hostname]  =3D "${base_bindir}/hostname"
> +
> +ALTERNATIVE_${PN}-ifconfig =3D "ifconfig"
> +ALTERNATIVE_LINK_NAME[ifconfig]  =3D "${base_sbindir}/ifconfig"
> +
> +ALTERNATIVE_${PN}-ping =3D "ping"
> +ALTERNATIVE_LINK_NAME[ping]   =3D "${base_bindir}/ping"
> +
> +ALTERNATIVE_${PN}-ping6 =3D "ping6"
> +ALTERNATIVE_LINK_NAME[ping6]  =3D "${base_bindir}/ping6"
> +
> +
> +FILES_${PN}-ping =3D "${base_bindir}/ping.${BPN}"
> +FILES_${PN}-ping6 =3D "${base_bindir}/ping6.${BPN}"
> +FILES_${PN}-hostname =3D "${base_bindir}/hostname.${BPN}"
> +FILES_${PN}-ifconfig =3D "${base_sbindir}/ifconfig.${BPN}"
> +FILES_${PN}-traceroute =3D "${bindir}/traceroute.${BPN}"
> +FILES_${PN}-logger =3D "${bindir}/logger.${BPN}"
> +FILES_${PN}-syslogd =3D "${base_sbindir}/syslogd.${BPN}"
> +FILES_${PN}-ftp =3D "${bindir}/ftp.${BPN}"
> +
> +FILES_${PN}-tftp =3D "${bindir}/tftp.${BPN}"
> +FILES_${PN}-telnet =3D "${bindir}/telnet.${BPN}"
> +FILES_${PN}-rsh =3D "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bind=
ir}/rexec.${BPN} ${bindir}/rcp.${BPN}"
> +
> +FILES_${PN}-rshd =3D "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir=
}/in.rexecd \
> +                    ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rl=
ogin ${sysconfdir}/xinetd.d/rexec"
> +RDEPENDS_${PN}-rshd +=3D "xinetd tcp-wrappers"
> +RCONFLICTS_${PN}-rshd +=3D "netkit-rshd"
> +RPROVIDES_${PN}-rshd =3D "rshd"
> +
> +FILES_${PN}-ftpd =3D "${bindir}/ftpd.${BPN}"
> +RDEPENDS_${PN}-ftpd +=3D "xinetd"
> +
> +FILES_${PN}-tftpd =3D "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
> +RCONFLICTS_${PN}-tftpd +=3D "netkit-tftpd"
> +RDEPENDS_${PN}-tftpd +=3D "xinetd"
> +
> +FILES_${PN}-telnetd =3D "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/te=
lnet"
> +RCONFLICTS_${PN}-telnetd +=3D "netkit-telnetd"
> +RPROVIDES_${PN}-telnetd =3D "telnetd"
> +RDEPENDS_${PN}-telnetd +=3D "xinetd"
> +
> +FILES_${PN}-inetd =3D "${bindir}/inetd.${BPN}"
> +
> +RDEPENDS_${PN} =3D "xinetd"
--=20
-Joe MacDonald.
:wq

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm9pUACgkQPN8S4W6ZZndL3wCfZ5BFMudfXoRtGCRMGXYkm+V4
gvcAnAv/sL35FAbSMt0iMesEeVwHAV2a
=szHO
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
