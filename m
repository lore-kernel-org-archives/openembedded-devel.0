Return-Path: <joe@deserted.net>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3BB6D3B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 19:20:12 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id s19so207070qcw.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=INWPTXwcnofSqJRkRR9BiBESJzzyx6GQ/n27FK07pUY=;
	b=Wi/uzSvM/XhXqSTD2/hvQ8SnIm1yiUJ0mR4+otIHSTpqpBEqKp3lCkj5Jgpjj4T15e
	4tScCcAtS0dRhfu6rtpT8qPVCx9LNUkTPWxf71lf0LbxWHlDzJq4crFkDPrM0ve8Vhll
	BSgih7+zoFZbavdQNjPvSCtiI/sXG0vl6SRi8r5tOQxTcf8szfFU0FtWFBM2lAr7YHMF
	aRBP5e7ART1/uET6vRw12sA/i9XLPk4erohGnKeOp1uc0Ctz8OTUFLbWCwC8LwUEQ9o9
	QOXmMmeBhUqaWcV/4k8Z+PcZ+pxXhFD2GLYObYAzyQBTa41els9nmB8Fnsw7rBbq952c
	mipA==
X-Gm-Message-State: ALoCoQm8fDE9Sgb7mlk0g2nYyK+UEH1E/6I7dqJV2lZaDskgvi5HwPJ5rumHdsQs5LmHaoI84GTf
X-Received: by 10.224.172.70 with SMTP id k6mr3077064qaz.100.1383074413460;
	Tue, 29 Oct 2013 12:20:13 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	h9sm68253924qaq.9.2013.10.29.12.20.11 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 12:20:12 -0700 (PDT)
Date: Tue, 29 Oct 2013 15:20:10 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029192008.GB9931@deserted.net>
References: <1382084537-10877-1-git-send-email-b40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E10491537@039-SN2MPN1-022.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E10491537@039-SN2MPN1-022.039d.mgd.msft.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2 1/3] snort : add recipe
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
X-List-Received-Date: Tue, 29 Oct 2013 19:20:13 -0000
X-Groupsio-MsgNum: 46926
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chunrong,

Sorry about the confusion here, there were still at least a couple of
outstanding questions / requests, I thought.

I had a quick look back at the latest barnyard recipe and it appears to
be removing the include path as opposed to using -I=3D/usr/include/pcap
that Khem suggested, I was hoping to hear back on the question I had as
well WRT barnyard versus barnyard2 (I could make the license tweak
myself since I'm confident that won't invalidate any of your work) and
the Gentoo mirror as the primary source for this version of Barnyard.

I also noticed that in the most recent version of the snort recipe the
sysvinit components have been dropped entirely.  Was that due to
problems inheriting update-rc.d as Koen suggested?  (Or perhaps the
current snort simply doesn't have a functional sysvinit config?  I hope
that's not the case.)  I'm probably not the only one still making use of
sysvinit stuff in some scenarios.  :-)

-J.

[Re: [oe] [meta-networking][PATCH v2 1/3] snort : add recipe] On 13.10.28 (=
Mon 02:23) Guo Chunrong-B40290 wrote:

> pings
>=20
> -----Original Message-----
> From: Guo Chunrong-B40290=20
> Sent: Friday, October 18, 2013 4:22 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
> Subject: [meta-networking][PATCH v2 1/3] snort : add recipe
>=20
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    *snort - a free lightweight network intrusion detection
>                 system for UNIX and Windows
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../snort/files/disable-dap-address-space-id.patch |   52 ++++++++++++++
>  .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++++=
++++++
>  .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   64 ++++++++++++++=
+++
>  3 files changed, 191 insertions(+), 0 deletions(-)  create mode 100644 m=
eta-networking/recipes-connectivity/snort/files/disable-dap-address-space-i=
d.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/disa=
ble-inaddr-none.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.=
4.6.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap=
-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/=
disable-dap-address-space-id.patch
> new file mode 100644
> index 0000000..39e5c9c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-addre
> +++ ss-space-id.patch
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
> +-AC_MSG_CHECKING([for daq address space ID]) -AC_RUN_IFELSE(=20
> +-[AC_LANG_PROGRAM( -[[ -#include <daq.h> -]], -[[
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
> ++#AC_MSG_CHECKING([for daq address space ID]) #AC_RUN_IFELSE(=20
> ++#[AC_LANG_PROGRAM( #[[ ##include <daq.h> #]], #[[
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
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-no
> +++ ne.patch
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
> + # In case INADDR_NONE is not defined (like on Solaris)=20
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
> +-AC_MSG_CHECKING([for pcap_lex_destroy]) -AC_RUN_IFELSE(=20
> +-[AC_LANG_PROGRAM( -[[ -#include <pcap.h> -]], -[[
> +-   pcap_lex_destroy();
> +-]])],
> +-[have_pcap_lex_destroy=3D"yes"],
> +-[have_pcap_lex_destroy=3D"no"])
> +-AC_MSG_RESULT($have_pcap_lex_destroy)
> +-if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> +-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack=
 created by pcap bpf filter])
> +-fi
> ++#AC_MSG_CHECKING([for pcap_lex_destroy]) #AC_RUN_IFELSE(=20
> ++#[AC_LANG_PROGRAM( #[[ ##include <pcap.h> #]], #[[
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
> + AC_MSG_CHECKING([for pcap_lib_version]) AC_LINK_IFELSE(
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> new file mode 100644
> index 0000000..8639639
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> @@ -0,0 +1,64 @@
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
> +            file://disable-inaddr-none.patch \
> +            file://disable-dap-address-space-id.patch "
> +
> +SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
> +SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6=
186a014baa451d43cdb0b3bc"
> +
> +inherit autotools  gettext
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
> +	for i in map config conf dtd; do
> +		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
> +	done
> +	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
> +	mkdir -p ${D}/${localstatedir}/log/snort }
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
> +RRECOMMENDS_${PN} +=3D "barnyard"
> --
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJwCmgACgkQwFvcllog0Xy/mQCeI1U0ij4VeIB60JvBI4AVFHFc
Y0UAoKdvyyLbujNIBwfHVCKZkQj4K7Cn
=3HsK
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
