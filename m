Return-Path: <joe@deserted.net>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2538160EA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 12:49:15 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id u18so726050qcx.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 05:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VsUDcku4bu+dGJxWRJfAU7M4MqTuHtUSOwFUooWNsbs=;
	b=Z1xVfwC8ARNYxLVV1PCLiOl1AO5bX0grSupBkudgWnwoCVXw9yCrSbSn/mNrGgoA/A
	5V507KRbZsc57LA8qrFBr2prQdXNv3hj1l8GVMfN1OvnAJT+v3Qw7TZOPeWMPA0C//k8
	Lv3Aooq/ADpMPJw6hm7RC4LNYM60d4Vu8pjA9AdPYbsWLi2+iuj9o8Dm+oZ2jvLMOG08
	oJsO5XP/aO6a+knQp8cOf2jy8IdXtrrExy6pOYSdSb4VT6lCzrL6XAKrxGuitID76SDQ
	UFcIGBiiia9YpCdxWWqYa2q0lOQs5fWTq0cyAQoqit49zhM3H2BlNzHYkDsLg/UmCfe9
	SVYw==
X-Gm-Message-State: ALoCoQnkMs62E8h0anq5IOQYcnyd7ccw61mLBtDi6WDR+XoYq3F2SlR05aMGvaoWPMk0tr7EziTH
X-Received: by 10.49.71.239 with SMTP id y15mr6481082qeu.14.1383137356990;
	Wed, 30 Oct 2013 05:49:16 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id u3sm64365890qej.8.2013.10.30.05.49.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Oct 2013 05:49:15 -0700 (PDT)
Date: Wed, 30 Oct 2013 08:49:13 -0400
From: Joe MacDonald <joe@deserted.net>
To: Guo Chunrong-B40290 <B40290@freescale.com>
Message-ID: <20131030124911.GA3716@deserted.net>
References: <1382084537-10877-1-git-send-email-b40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E10491537@039-SN2MPN1-022.039d.mgd.msft.net>
	<20131029192008.GB9931@deserted.net>
	<B21730BB6DA1D24B83348D9301EA417E104921E2@039-SN2MPN1-022.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E104921E2@039-SN2MPN1-022.039d.mgd.msft.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 30 Oct 2013 12:49:15 -0000
X-Groupsio-MsgNum: 46932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [meta-networking][PATCH v2 1/3] snort : add recipe] On 13.10.30 (=
Wed 01:40) Guo Chunrong-B40290 wrote:

> Hi, Joe MacDonald
>=20
> Thank you for your comments.
>=20
> The current snort simply do not need sysvinit config.

I apologize, I don't mean to belabor the point, but can you point me at
that information?  http://www.snort.org/docs/ contains a lot of
documentation around getting snort started on various systems and there
are a number of startup scripts there that indicate they belong in
/etc/init.d of their respective distributions.  Perhaps things have
changed in the most recent version of snort, but the "Snort Startup
Scripts" section seem to apply to the versions of snort you're proposing
we include in meta-networking.

Also, please don't forget about the include path and barnyard questions.

Thanks.

-J.

>=20
>=20
> Thanks,
> Chunrong
>=20
> -----Original Message-----
> From: Joe MacDonald [mailto:joe@deserted.net]=20
> Sent: Wednesday, October 30, 2013 3:20 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Guo Chunrong-B40290
> Subject: Re: [oe] [meta-networking][PATCH v2 1/3] snort : add recipe
>=20
> Hi Chunrong,
>=20
> Sorry about the confusion here, there were still at least a couple of out=
standing questions / requests, I thought.
>=20
> I had a quick look back at the latest barnyard recipe and it appears to b=
e removing the include path as opposed to using -I=3D/usr/include/pcap that=
 Khem suggested, I was hoping to hear back on the question I had as well WR=
T barnyard versus barnyard2 (I could make the license tweak myself since I'=
m confident that won't invalidate any of your work) and the Gentoo mirror a=
s the primary source for this version of Barnyard.
>=20
> I also noticed that in the most recent version of the snort recipe the sy=
svinit components have been dropped entirely.  Was that due to problems inh=
eriting update-rc.d as Koen suggested?  (Or perhaps the current snort simpl=
y doesn't have a functional sysvinit config?  I hope that's not the case.) =
 I'm probably not the only one still making use of sysvinit stuff in some s=
cenarios.  :-)
>=20
> -J.
>=20
> [Re: [oe] [meta-networking][PATCH v2 1/3] snort : add recipe] On 13.10.28=
 (Mon 02:23) Guo Chunrong-B40290 wrote:
>=20
> > pings
> >=20
> > -----Original Message-----
> > From: Guo Chunrong-B40290
> > Sent: Friday, October 18, 2013 4:22 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
> > Subject: [meta-networking][PATCH v2 1/3] snort : add recipe
> >=20
> > From: Chunrong Guo <B40290@freescale.com>
> >=20
> >    *snort - a free lightweight network intrusion detection
> >                 system for UNIX and Windows
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  .../snort/files/disable-dap-address-space-id.patch |   52 ++++++++++++=
++
> >  .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++=
++++++++
> >  .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   64 ++++++++++++=
+++++
> >  3 files changed, 191 insertions(+), 0 deletions(-)  create mode=20
> > 100644=20
> > meta-networking/recipes-connectivity/snort/files/disable-dap-address-s
> > pace-id.patch  create mode 100644=20
> > meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.p
> > atch  create mode 100644=20
> > meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> >=20
> > diff --git=20
> > a/meta-networking/recipes-connectivity/snort/files/disable-dap-address
> > -space-id.patch=20
> > b/meta-networking/recipes-connectivity/snort/files/disable-dap-address
> > -space-id.patch
> > new file mode 100644
> > index 0000000..39e5c9c
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-add
> > +++ re
> > +++ ss-space-id.patch
> > @@ -0,0 +1,52 @@
> > +Upstream-Status:Inappropriate [embedded specific]
> > +
> > +fix the below error:
> > +checking for dap address space id... configure:=20
> > +configure: error: cannot run test program while cross compiling
> > +
> > +
> > +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > +
> > +--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
> > ++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
> > +@@ -679,23 +679,23 @@
> > +=20
> > + AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
> > +=20
> > +-AC_MSG_CHECKING([for daq address space ID]) -AC_RUN_IFELSE(=20
> > +-[AC_LANG_PROGRAM( -[[ -#include <daq.h> -]], -[[
> > +-   DAQ_PktHdr_t hdr;
> > +-   hdr.address_space_id =3D 0;
> > +-]])],
> > +-[have_daq_address_space_id=3D"yes"],
> > +-[have_daq_address_space_id=3D"no"])
> > +-AC_MSG_RESULT($have_daq_address_space_id)
> > +-if test "x$have_daq_address_space_id" =3D "xyes"; then
> > +-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> > +-        [DAQ version supports address space ID in header.])
> > +-fi
> > ++#AC_MSG_CHECKING([for daq address space ID]) #AC_RUN_IFELSE(=20
> > ++#[AC_LANG_PROGRAM( #[[ ##include <daq.h> #]], #[[
> > ++#   DAQ_PktHdr_t hdr;
> > ++#   hdr.address_space_id =3D 0;
> > ++#]])],
> > ++have_daq_address_space_id=3D"yes"
> > ++#[have_daq_address_space_id=3D"no"])
> > ++#AC_MSG_RESULT($have_daq_address_space_id)
> > ++#if test "x$have_daq_address_space_id" =3D "xyes"; then
> > ++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> > ++#        [DAQ version supports address space ID in header.])
> > ++#fi
> > +=20
> > + # any sparc platform has to have this one defined.
> > + AC_MSG_CHECKING(for sparc)
> > diff --git=20
> > a/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none
> > .patch=20
> > b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none
> > .patch
> > new file mode 100644
> > index 0000000..9dafe63
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-
> > +++ no
> > +++ ne.patch
> > @@ -0,0 +1,75 @@
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +fix the below error:
> > +checking for INADDR_NONE... configure:
> > +configure: error: cannot run test program while cross compiling
> > +
> > +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > +
> > +
> > +--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
> > ++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
> > +@@ -281,25 +281,7 @@
> > + AC_CHECK_TYPES([boolean])
> > +=20
> > + # In case INADDR_NONE is not defined (like on Solaris)=20
> > +-have_inaddr_none=3D"no"
> > +-AC_MSG_CHECKING([for INADDR_NONE])
> > +-AC_RUN_IFELSE(
> > +-[AC_LANG_PROGRAM(
> > +-[[
> > +-#include <sys/types.h>
> > +-#include <netinet/in.h>
> > +-#include <arpa/inet.h>
> > +-]],
> > +-[[
> > +-	if (inet_addr("10,5,2") =3D=3D INADDR_NONE);
> > +-    return 0;
> > +-]])],
> > +-[have_inaddr_none=3D"yes"],
> > +-[have_inaddr_none=3D"no"])
> > +-AC_MSG_RESULT($have_inaddr_none)
> > +-if test "x$have_inaddr_none" =3D "xno"; then
> > +-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
> > +-fi
> > ++have_inaddr_none=3D"yes"
> > +=20
> > + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> > + #include <stdio.h>
> > +@@ -397,21 +379,21 @@
> > +   fi
> > + fi
> > +=20
> > +-AC_MSG_CHECKING([for pcap_lex_destroy]) -AC_RUN_IFELSE(=20
> > +-[AC_LANG_PROGRAM( -[[ -#include <pcap.h> -]], -[[
> > +-   pcap_lex_destroy();
> > +-]])],
> > +-[have_pcap_lex_destroy=3D"yes"],
> > +-[have_pcap_lex_destroy=3D"no"])
> > +-AC_MSG_RESULT($have_pcap_lex_destroy)
> > +-if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> > +-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer sta=
ck created by pcap bpf filter])
> > +-fi
> > ++#AC_MSG_CHECKING([for pcap_lex_destroy]) #AC_RUN_IFELSE(=20
> > ++#[AC_LANG_PROGRAM( #[[ ##include <pcap.h> #]], #[[
> > ++#   pcap_lex_destroy();
> > ++#]])],
> > ++have_pcap_lex_destroy=3D"yes"
> > ++#[have_pcap_lex_destroy=3D"no"])
> > ++#AC_MSG_RESULT($have_pcap_lex_destroy)
> > ++#if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> > ++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer st=
ack created by pcap bpf filter])
> > ++#fi
> > +=20
> > + AC_MSG_CHECKING([for pcap_lib_version]) AC_LINK_IFELSE(
> > diff --git=20
> > a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb=20
> > b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> > new file mode 100644
> > index 0000000..8639639
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> > @@ -0,0 +1,64 @@
> > +DESCRIPTION =3D "snort - a free lightweight network intrusion detectio=
n system for UNIX and Windows."
> > +HOMEPAGE =3D "http://www.snort.org/"
> > +LICENSE =3D "GPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc92=
377c5"
> > +
> > +DEPENDS =3D "libpcap libpcre daq libdnet"
> > +
> > +
> > +SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
> > +            file://disable-inaddr-none.patch \
> > +            file://disable-dap-address-space-id.patch "
> > +
> > +SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
> > +SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916=
e6186a014baa451d43cdb0b3bc"
> > +
> > +inherit autotools  gettext
> > +
> > +EXTRA_OECONF =3D " \
> > +	--enable-gre \   =20
> > +	--enable-linux-smp-stats \
> > +	--enable-reload \
> > +	--enable-reload-error-restart \
> > +	--enable-targetbased \
> > +	--disable-static-daq \
> > +	"
> > +
> > +do_install_append() {
> > +	install -d ${D}/${sysconfdir}/snort/rules
> > +	install -d ${D}/${sysconfdir}/snort/preproc_rules
> > +	for i in map config conf dtd; do
> > +		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
> > +	done
> > +	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
> > +	mkdir -p ${D}/${localstatedir}/log/snort }
> > +
> > +FILES_${PN} +=3D " \
> > +	${libdir}/snort_dynamicengine/*.so.* \
> > +	${libdir}/snort_dynamicpreprocessor/*.so.* \
> > +	${libdir}/snort_dynamicrules/*.so.* \
> > +	"
> > +FILES_${PN}-dbg +=3D " \
> > +	${libdir}/snort_dynamicengine/.debug \
> > +	${libdir}/snort_dynamicpreprocessor/.debug \
> > +	${libdir}/snort_dynamicrules/.debug \
> > +	"
> > +FILES_${PN}-staticdev +=3D " \
> > +	${libdir}/snort_dynamicengine/*.a \
> > +	${libdir}/snort_dynamicpreprocessor/*.a \
> > +	${libdir}/snort_dynamicrules/*.a \
> > +	${libdir}/snort/dynamic_preproc/*.a \
> > +	${libdir}/snort/dynamic_output/*.a \
> > +	"
> > +FILES_${PN}-dev +=3D " \
> > +	${libdir}/snort_dynamicengine/*.la \
> > +	${libdir}/snort_dynamicpreprocessor/*.la \
> > +	${libdir}/snort_dynamicrules/*.la \
> > +	${libdir}/snort_dynamicengine/*.so \
> > +	${libdir}/snort_dynamicpreprocessor/*.so \
> > +	${libdir}/snort_dynamicrules/*.so \
> > +	${prefix}/src/snort_dynamicsrc \
> > +	"
> > +
> > +RRECOMMENDS_${PN} +=3D "barnyard"
> > --
> > 1.7.5.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> -Joe MacDonald.
> :wq
>=20

--=20
-Joe MacDonald.
:wq

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJxAD4ACgkQwFvcllog0XwyYACgrlfeQh8dXoA2O7ol6NBSXo3A
uhgAnRABxzRLd+pP/uGoZ637prEp67MQ
=Keyx
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
