Return-Path: <joe@deserted.net>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D49706D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 20:43:28 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id n9so43986qcw.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 12:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=KAaKwwVQQY548Mdt0NmhIXr2C3SOJUxFt7i/etKQas8=;
	b=fyrhm1oLj2+S1St/5QwTyauIahvUAmVwUXOguL3edTqYrRHID9DbsTGt1AzRVts99C
	ogAaq/ZkrAftVv7yANiAfGBUQq22c4hBDOSJ7G+5+CFju14ShnlRZfkLtIpKmwdeZ9L6
	ZG922SbRLtj+a7X+BLP1zl2ap44638EuovoIFRovfpmDgD13j2h9T0l6ArFEY3ZQkxxl
	KyTk45Ouv44bTqT41srYG5ddd6Gwaib51T/SjHokXrE8R9qz2Dwl6/M0OsCiBrGvCvkD
	PNSvecqvByYwAH2v8/jLPJADy4IENOHj8NxJ0xMMZW+ibOgUpi0vvJ7g9tR/ZIN6jqJk
	6ZvQ==
X-Gm-Message-State: ALoCoQnsb38h6dSOALehq61a9TTqKy1NHSgsP4wlgxWkAydSSFLzHa+2ECl6PDLq1M+FFqmLiXZZ
X-Received: by 10.224.162.211 with SMTP id w19mr8424327qax.59.1383770610578;
	Wed, 06 Nov 2013 12:43:30 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id l5sm1491961qac.12.2013.11.06.12.43.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 12:43:29 -0800 (PST)
Date: Wed, 6 Nov 2013 15:43:27 -0500
From: Joe MacDonald <joe@deserted.net>
To: b40290@freescale.com
Message-ID: <20131106204325.GF3791@deserted.net>
References: <1383532796-31088-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1383532796-31088-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3 1/3] snort: add recipe
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
X-List-Received-Date: Wed, 06 Nov 2013 20:43:29 -0000
X-Groupsio-MsgNum: 47029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline

--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just FYI.  This and the other two are in the queue, I'll look at them
later today or tomorrow at the latest.  I just didn't want you to be
concerned something was lost.

-J.

[[oe] [meta-networking][PATCH v3 1/3] snort: add recipe] On 13.11.04 (Mon 1=
0:39) b40290@freescale.com wrote:

> From: Chunrong Guo <B40290@freescale.com>
>=20
>   *snort - a free lightweight network intrusion detection
>          system for UNIX and Windows
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../snort/files/disable-dap-address-space-id.patch |   52 +++++++++
>  .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++++
>  .../recipes-connectivity/snort/files/snort.init    |  109 ++++++++++++++=
++++++
>  .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   71 +++++++++++++
>  4 files changed, 307 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/disa=
ble-dap-address-space-id.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/disa=
ble-inaddr-none.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/snor=
t.init
>  create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.=
4.6.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap=
-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/=
disable-dap-address-space-id.patch
> new file mode 100644
> index 0000000..39e5c9c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-addres=
s-space-id.patch
> @@ -0,0 +1,52 @@
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +fix the below error:
> +checking for dap address space id... configure:=20
> +configure: error: cannot run test program while cross compiling
> +
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
> ++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
> +@@ -679,23 +679,23 @@
> +=20
> + AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
> +=20
> +-AC_MSG_CHECKING([for daq address space ID])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <daq.h>
> +-]],
> +-[[
> +-   DAQ_PktHdr_t hdr;
> +-   hdr.address_space_id =3D 0;
> +-]])],
> +-[have_daq_address_space_id=3D"yes"],
> +-[have_daq_address_space_id=3D"no"])
> +-AC_MSG_RESULT($have_daq_address_space_id)
> +-if test "x$have_daq_address_space_id" =3D "xyes"; then
> +-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> +-        [DAQ version supports address space ID in header.])
> +-fi
> ++#AC_MSG_CHECKING([for daq address space ID])
> ++#AC_RUN_IFELSE(
> ++#[AC_LANG_PROGRAM(
> ++#[[
> ++##include <daq.h>
> ++#]],
> ++#[[
> ++#   DAQ_PktHdr_t hdr;
> ++#   hdr.address_space_id =3D 0;
> ++#]])],
> ++have_daq_address_space_id=3D"yes"
> ++#[have_daq_address_space_id=3D"no"])
> ++#AC_MSG_RESULT($have_daq_address_space_id)
> ++#if test "x$have_daq_address_space_id" =3D "xyes"; then
> ++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> ++#        [DAQ version supports address space ID in header.])
> ++#fi
> +=20
> + # any sparc platform has to have this one defined.
> + AC_MSG_CHECKING(for sparc)
> diff --git a/meta-networking/recipes-connectivity/snort/files/disable-ina=
ddr-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-i=
naddr-none.patch
> new file mode 100644
> index 0000000..9dafe63
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-non=
e.patch
> @@ -0,0 +1,75 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +fix the below error:
> +checking for INADDR_NONE... configure:
> +configure: error: cannot run test program while cross compiling
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +
> +--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
> ++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
> +@@ -281,25 +281,7 @@
> + AC_CHECK_TYPES([boolean])
> +=20
> + # In case INADDR_NONE is not defined (like on Solaris)
> +-have_inaddr_none=3D"no"
> +-AC_MSG_CHECKING([for INADDR_NONE])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <sys/types.h>
> +-#include <netinet/in.h>
> +-#include <arpa/inet.h>
> +-]],
> +-[[
> +-	if (inet_addr("10,5,2") =3D=3D INADDR_NONE);
> +-    return 0;
> +-]])],
> +-[have_inaddr_none=3D"yes"],
> +-[have_inaddr_none=3D"no"])
> +-AC_MSG_RESULT($have_inaddr_none)
> +-if test "x$have_inaddr_none" =3D "xno"; then
> +-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
> +-fi
> ++have_inaddr_none=3D"yes"
> +=20
> + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> + #include <stdio.h>
> +@@ -397,21 +379,21 @@
> +   fi
> + fi
> +=20
> +-AC_MSG_CHECKING([for pcap_lex_destroy])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <pcap.h>
> +-]],
> +-[[
> +-   pcap_lex_destroy();
> +-]])],
> +-[have_pcap_lex_destroy=3D"yes"],
> +-[have_pcap_lex_destroy=3D"no"])
> +-AC_MSG_RESULT($have_pcap_lex_destroy)
> +-if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> +-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack=
 created by pcap bpf filter])
> +-fi
> ++#AC_MSG_CHECKING([for pcap_lex_destroy])
> ++#AC_RUN_IFELSE(
> ++#[AC_LANG_PROGRAM(
> ++#[[
> ++##include <pcap.h>
> ++#]],
> ++#[[
> ++#   pcap_lex_destroy();
> ++#]])],
> ++have_pcap_lex_destroy=3D"yes"
> ++#[have_pcap_lex_destroy=3D"no"])
> ++#AC_MSG_RESULT($have_pcap_lex_destroy)
> ++#if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> ++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stac=
k created by pcap bpf filter])
> ++#fi
> +=20
> + AC_MSG_CHECKING([for pcap_lib_version])
> + AC_LINK_IFELSE(
> diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init =
b/meta-networking/recipes-connectivity/snort/files/snort.init
> new file mode 100644
> index 0000000..91cb343
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/snort.init
> @@ -0,0 +1,109 @@
> +#!/bin/sh
> +#
> +#   Snort Startup Script modified for OpenEmbedded
> +#
> +
> +# Script variables
> +
> +LAN_INTERFACE=3D"$2"
> +RETURN_VAL=3D0
> +BINARY=3D/usr/bin/snort
> +PATH=3D/bin:/usr/bin
> +PID=3D/var/run/snort_${LAN_INTERFACE}_ids.pid
> +DEL_PID=3D$PID
> +LOGDIR=3D"/var/log/snort"
> +DATE=3D`/bin/date +%Y%m%d`
> +CONFIG_FILE=3D/etc/snort/snort.conf
> +PROG=3Dsnort
> +USER=3Droot
> +GROUP=3Droot
> +
> +if [ ! -x "$BINARY" ]; then
> +    echo "ERROR: $BINARY not found."
> +    exit 1
> +fi
> +                                                                        =
       =20
> +if [ ! -r "$CONFIG_FILE" ]; then
> +    echo "ERROR: $CONFIG_FILE not found."
> +    exit 1
> +fi
> +
> +start()
> +{
> +    =20
> +    [ -n "$LAN_INTERFACE" ] || return 0
> +    # Check if log diratory is present. Otherwise, create it.
> +    if [ ! -d $LOGDIR/$DATE ]; then=20
> +        mkdir -d $LOGDIR/$DATE
> +        /bin/chown -R $USER:$USER $LOGDIR/$DATE
> +    /bin/chmod -R 700 $LOGDIR/$DATE
> +    fi
> +
> +    /bin/echo "Starting $PROG: "
> +    # Snort parameters
> +    # -D Run Snort in background (daemon) mode
> +    # -i <if> Listen on interface <if>=20
> +    # -u <uname> Run snort uid as <uname> user (or uid)
> +    # -g <gname> Run snort uid as <gname> group (or gid)
> +    # -c Load configuration file
> +    # -N Turn off logging (alerts still work) (removed to enable logging=
) :)
> +    # -l Log to directory
> +    # -t Chroots process to directory after initialization
> +    # -R <id> Include 'id' in snort_intf<id>.pid file name
> +   =20
> +    $BINARY -D -i $LAN_INTERFACE -u $USER -g $GROUP -c $CONFIG_FILE -l $=
LOGDIR/$DATE -t $LOGDIR/$DATE -R _ids
> +    /bin/echo "$PROG startup complete."
> +    return $RETURN_VAL
> +}
> +
> +stop()
> +{
> +    if [ -s $PID ]; then
> +        /bin/echo "Stopping $PROG with PID `cat $PID`: "
> +        kill -TERM `cat $PID` 2>/dev/null
> +        RETURN_VAL=3D$?
> +        /bin/echo "$PROG shutdown complete."
> +        [ -e $DEL_PID ] && rm -f $DEL_PID
> +    [ -e $DEL_PID.lck ] && rm -f $DEL_PID.lck
> +    else
> +        /bin/echo "ERROR: PID in $PID file not found."
> +        RETURN_VAL=3D1
> +    fi
> +    return $RETURN_VAL
> +}
> +
> +status() {
> +        if [ -s $PID ]; then
> +                echo "$PROG is running as pid `cat $PID`:"
> +        else
> +                echo "$PROG is not running."
> +        fi
> +}
> +
> +restart()
> +{
> +    stop
> +    start
> +    RETURN_VAL=3D$?
> +    return $RETURN_VAL
> +}
> +
> +case "$1" in
> + start)
> +       start
> +    ;;
> + stop)
> +       stop
> +    ;;
> + status)
> +       status
> +    ;;
> + restart|reload)
> +       restart
> +    ;;
> + *)
> +    /bin/echo "Usage: $0 {start|stop|status|restart|reload}"
> +    RETURN_VAL=3D1
> +esac
> +
> +exit $RETURN_VAL=20
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> new file mode 100644
> index 0000000..829146d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> @@ -0,0 +1,71 @@
> +DESCRIPTION =3D "snort - a free lightweight network intrusion detection =
system for UNIX and Windows."
> +HOMEPAGE =3D "http://www.snort.org/"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc9237=
7c5"
> +
> +DEPENDS =3D "libpcap libpcre daq libdnet"
> +
> +
> +SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
> +            file://snort.init \
> +            file://disable-inaddr-none.patch \
> +            file://disable-dap-address-space-id.patch "
> +
> +SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
> +SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6=
186a014baa451d43cdb0b3bc"
> +
> +inherit autotools  gettext  update-rc.d
> +
> +INITSCRIPT_NAME =3D "snort"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +EXTRA_OECONF =3D " \
> +	--enable-gre \   =20
> +	--enable-linux-smp-stats \
> +	--enable-reload \
> +	--enable-reload-error-restart \
> +	--enable-targetbased \
> +	--disable-static-daq \
> +	"
> +
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}/snort/rules
> +	install -d ${D}/${sysconfdir}/snort/preproc_rules
> +    install -d ${D}${sysconfdir}/init.d
> +	for i in map config conf dtd; do
> +		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
> +	done
> +	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
> +    install -m 755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
> +	mkdir -p ${D}/${localstatedir}/log/snort
> +    install -d ${D}/var/log/snort
> +}
> +
> +FILES_${PN} +=3D " \
> +	${libdir}/snort_dynamicengine/*.so.* \
> +	${libdir}/snort_dynamicpreprocessor/*.so.* \
> +	${libdir}/snort_dynamicrules/*.so.* \
> +	"
> +FILES_${PN}-dbg +=3D " \
> +	${libdir}/snort_dynamicengine/.debug \
> +	${libdir}/snort_dynamicpreprocessor/.debug \
> +	${libdir}/snort_dynamicrules/.debug \
> +	"
> +FILES_${PN}-staticdev +=3D " \
> +	${libdir}/snort_dynamicengine/*.a \
> +	${libdir}/snort_dynamicpreprocessor/*.a \
> +	${libdir}/snort_dynamicrules/*.a \
> +	${libdir}/snort/dynamic_preproc/*.a \
> +	${libdir}/snort/dynamic_output/*.a \
> +	"
> +FILES_${PN}-dev +=3D " \
> +	${libdir}/snort_dynamicengine/*.la \
> +	${libdir}/snort_dynamicpreprocessor/*.la \
> +	${libdir}/snort_dynamicrules/*.la \
> +	${libdir}/snort_dynamicengine/*.so \
> +	${libdir}/snort_dynamicpreprocessor/*.so \
> +	${libdir}/snort_dynamicrules/*.so \
> +	${prefix}/src/snort_dynamicsrc \
> +	"
> +
> +RRECOMMENDS_${PN} +=3D "barnyard2"
--=20
-Joe MacDonald.
:wq

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJ6qe0ACgkQwFvcllog0XwyEQCcCr9xxHk7NzMd0zsz8gztW/7R
97AAn0QwFsH7ZbkhX0fBCMgFpI41LDT5
=sw5h
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
