Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6050271637;
	Thu,  5 Mar 2015 15:14:25 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YTXTm-0003fM-91 from Joe_MacDonald@mentor.com ;
	Thu, 05 Mar 2015 07:14:26 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Thu, 5 Mar 2015
	07:14:25 -0800
Received: by burninator (Postfix, from userid 1000)	id CF4E2580FFB; Thu,  5
	Mar 2015 10:14:31 -0500 (EST)
Date: Thu, 5 Mar 2015 10:14:31 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150305151431.GC26456@mentor.com>
References: <20150304135132.54A3D5017B@opal.openembedded.org>
	<20150305142913.GU2337@jama>
MIME-Version: 1.0
In-Reply-To: <20150305142913.GU2337@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joe MacDonald : nis: integrate latest stable yp-tools and ypbind
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
X-List-Received-Date: Thu, 05 Mar 2015 15:14:25 -0000
X-Groupsio-MsgNum: 54655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe-commits] Joe MacDonald : nis: integrate latest stable yp-tools and=
 ypbind] On 15.03.05 (Thu 15:29) Martin Jansa wrote:

> On Wed, Mar 04, 2015 at 01:51:32PM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: e00832bc4dbeacb5eb09864674b6ba7a04fc8622
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3De00832bc4dbeacb5eb09864674b6ba7a04fc8622
> >=20
> > Author: Joe MacDonald <joe_macdonald@mentor.com>
> > Date:   Mon Mar  2 00:23:43 2015 -0500
> >=20
> > nis: integrate latest stable yp-tools and ypbind
> >=20
> > Update to the latest stable NIS tools.  The yp-tools libraries and head=
ers
> > conflict with the RPC headers provided by glibc, so install them to a
> > different location.  Systems that intend to build using the NIS-provided
> > versions will need to specify the alternate location, but that is cover=
ed
> > by pkg-config, so it should only be necessary to point pkg-config at the
> > alternate .pc file.
> >=20
> > The older stable versions are suitable for IPv4-only setups, so keep th=
em
> > around in case those are required for some systems.
>=20
> This seems to break yp-tools build for qemuarm:
> yp-tools/3.3-r0/yp-tools-3.3/lib/do_ypcall.c:461:27: error: cast
> increases required alignment of target type [-Werror=3Dcast-align]
>=20
> http://errors.yoctoproject.org/Errors/Details/9221/

I blacklisted the updated yp-tools and ypbind-mt.  The error makes it
obvious this is an intentional failure, so it's just a matter of
figuring out what the correct change will be.  Shouldn't be too hairy,
but this should cause the least pain for everyone.

-J.

>=20
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > ---
> >=20
> >  ...rovide-an-in-place-version-of-mapv4v6addr.patch | 110 +++++++++++++=
++++++++
> >  .../recipes-support/nis/yp-tools_3.3.bb            |  46 +++++++++
> >  .../recipes-support/nis/ypbind-mt_2.2.bb           |  51 ++++++++++
> >  3 files changed, 207 insertions(+)
> >=20
> > diff --git a/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4=
-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch b/meta-networking/re=
cipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-o=
f-mapv4v6addr.patch
> > new file mode 100644
> > index 0000000..9ef569f
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-P=
rovide-an-in-place-version-of-mapv4v6addr.patch
> > @@ -0,0 +1,110 @@
> > +From a1ef10d63b0ea34c788d5432e94c72b00ae55e04 Mon Sep 17 00:00:00 2001
> > +From: Joe MacDonald <joe_macdonald@mentor.com>
> > +Date: Fri, 27 Feb 2015 12:04:10 -0500
> > +Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr=
=2Eh
> > +
> > +mapv4v6addr.h isn't always available, depending on your build, but
> > +nis-hosts.c only needs it for a single, inline function.  So drop a co=
py
> > +here rather than playing games with the include path that would
> > +potentially lead to cross-compilation issues.
> > +
> > +Upstream-status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > +---
> > + nss_nis6/mapv4v6addr.h | 69 +++++++++++++++++++++++++++++++++++++++++=
+++++++++
> > + nss_nis6/nis-hosts.c   |  2 +-
> > + 2 files changed, 70 insertions(+), 1 deletion(-)
> > + create mode 100644 nss_nis6/mapv4v6addr.h
> > +
> > +diff --git a/nss_nis6/mapv4v6addr.h b/nss_nis6/mapv4v6addr.h
> > +new file mode 100644
> > +index 0000000..7f85f7d
> > +--- /dev/null
> > ++++ b/nss_nis6/mapv4v6addr.h
> > +@@ -0,0 +1,69 @@
> > ++/*
> > ++ * ++Copyright++ 1985, 1988, 1993
> > ++ * -
> > ++ * Copyright (c) 1985, 1988, 1993
> > ++ *    The Regents of the University of California.  All rights reserv=
ed.
> > ++ *
> > ++ * Redistribution and use in source and binary forms, with or without
> > ++ * modification, are permitted provided that the following conditions
> > ++ * are met:
> > ++ * 1. Redistributions of source code must retain the above copyright
> > ++ *    notice, this list of conditions and the following disclaimer.
> > ++ * 2. Redistributions in binary form must reproduce the above copyrig=
ht
> > ++ *    notice, this list of conditions and the following disclaimer in=
 the
> > ++ *    documentation and/or other materials provided with the distribu=
tion.
> > ++ * 4. Neither the name of the University nor the names of its contrib=
utors
> > ++ *    may be used to endorse or promote products derived from this so=
ftware
> > ++ *    without specific prior written permission.
> > ++ *
> > ++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'=
' AND
> > ++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
> > ++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR=
 PURPOSE
> > ++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE =
LIABLE
> > ++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSE=
QUENTIAL
> > ++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE =
GOODS
> > ++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTI=
ON)
> > ++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT=
, STRICT
> > ++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN =
ANY WAY
> > ++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILIT=
Y OF
> > ++ * SUCH DAMAGE.
> > ++ * -
> > ++ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
> > ++ *
> > ++ * Permission to use, copy, modify, and distribute this software for =
any
> > ++ * purpose with or without fee is hereby granted, provided that the a=
bove
> > ++ * copyright notice and this permission notice appear in all copies, =
and that
> > ++ * the name of Digital Equipment Corporation not be used in advertisi=
ng or
> > ++ * publicity pertaining to distribution of the document or software w=
ithout
> > ++ * specific, written prior permission.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCL=
AIMS ALL
> > ++ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WAR=
RANTIES
> > ++ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPM=
ENT
> > ++ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQ=
UENTIAL
> > ++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA=
 OR
> > ++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TOR=
TIOUS
> > ++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANC=
E OF THIS
> > ++ * SOFTWARE.
> > ++ * -
> > ++ * --Copyright--
> > ++ */
> > ++
> > ++#include <string.h>
> > ++#include <arpa/nameser.h>
> > ++
> > ++static void
> > ++map_v4v6_address (const char *src, char *dst)
> > ++{
> > ++  u_char *p =3D (u_char *) dst;
> > ++  int i;
> > ++
> > ++  /* Move the IPv4 part to the right position.  */
> > ++  memcpy (dst + 12, src, INADDRSZ);
> > ++
> > ++  /* Mark this ipv6 addr as a mapped ipv4. */
> > ++  for (i =3D 0; i < 10; i++)
> > ++    *p++ =3D 0x00;
> > ++  *p++ =3D 0xff;
> > ++  *p =3D 0xff;
> > ++}
> > +diff --git a/nss_nis6/nis-hosts.c b/nss_nis6/nis-hosts.c
> > +index af99c74..96d8fa1 100644
> > +--- a/nss_nis6/nis-hosts.c
> > ++++ b/nss_nis6/nis-hosts.c
> > +@@ -36,7 +36,7 @@
> > + #include "nss-nis6.h"
> > +=20
> > + /* Get implementation for some internal functions. */
> > +-#include <resolv/mapv4v6addr.h>
> > ++#include "mapv4v6addr.h"
> > +=20
> > + #define ENTNAME         hostent
> > + #define DATABASE        "hosts"
> > +--=20
> > +1.9.1
> > +
> > diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta=
-networking/recipes-support/nis/yp-tools_3.3.bb
> > new file mode 100644
> > index 0000000..75ad989
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> > @@ -0,0 +1,46 @@
> > +# This package builds tools to manage NIS
> > +# The source package is utils/net/NIS/yp-tools
> > +#
> > +require nis.inc
> > +
> > +SUMMARY =3D "NIS client programs"
> > +DESCRIPTION =3D " \
> > +Network Information Service tools.  \
> > +This package contains ypcat, ypmatch, ypset, \
> > +ypwhich, yppasswd, domainname, nisdomainname \
> > +and ypdomainname. \
> > +"
> > +
> > +SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
> > +           file://domainname.service \
> > +           file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-ma=
pv4v6addr.patch \
> > +"
> > +SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
> > +SRC_URI[sha256sum] =3D "812be817df3d4c25813552be336c6c6ad5aedaf65611b8=
1af3ad9f98fb3c2e50"
> > +
> > +DEPENDS =3D "libtirpc"
> > +
> > +inherit autotools systemd
> > +SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> > +
> > +RPROVIDES_${PN} +=3D "${PN}-systemd"
> > +RREPLACES_${PN} +=3D "${PN}-systemd"
> > +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> > +
> > +CACHED_CONFIGUREVARS +=3D "ac_cv_prog_STRIP=3D/bin/true"
> > +
> > +EXTRA_OECONF =3D " \
> > +                --disable-rpath \
> > +                --libdir=3D${libdir}/yp-nis/ \
> > +                --includedir=3D${includedir}/yp-nis/ \
> > +               "
> > +
> > +FILES_${PN} +=3D " ${libdir}/yp-nis/*.so.*.* ${libdir}/yp-nis/pkgconfi=
g/"
> > +FILES_${PN}-dbg +=3D " ${libdir}/yp-nis/.debug"
> > +FILES_${PN}-dev +=3D " ${libdir}/yp-nis/*.so ${libdir}/yp-nis/*.so.[12=
] ${libdir}/yp-nis/*.la"
> > +FILES_${PN}-staticdev +=3D " ${libdir}/yp-nis/*.a"
> > +
> > +do_install_append() {
> > +    install -d ${D}${systemd_unitdir}/system
> > +    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdi=
r}/system
> > +}
> > diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/met=
a-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > new file mode 100644
> > index 0000000..b960757
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > @@ -0,0 +1,51 @@
> > +# This package builds the NIS ypbind daemon
> > +# The source package is utils/net/NIS/ypbind-mt
> > +#
> > +require nis.inc
> > +
> > +DESCRIPTION =3D " \
> > +Multithreaded NIS bind service (ypbind-mt).  \
> > +ypbind-mt is a complete new implementation of a NIS \
> > +binding daemon for Linux. It has the following \
> > +features.  Supports ypbind protocol V1 and V2.  \
> > +Uses threads for better response.  Supports multiple \
> > +domain bindings.  Supports /var/yp/binding/* file \
> > +for Linux libc 4/5 and glibc 2.x.  Supports a list \
> > +of known secure NIS server (/etc/yp.conf) Binds to \
> > +the server which answered as first. \
> > +"
> > +HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> > +DEPENDS =3D "yp-tools"
> > +PROVIDES +=3D "ypbind"
> > +
> > +SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2=
 \
> > +           file://ypbind-yocto.init \
> > +           file://ypbind.service \
> > +"
> > +SRC_URI[md5sum] =3D "54e2040d8266ae7d302d081ca310c8a8"
> > +SRC_URI[sha256sum] =3D "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0fe=
68404ae7465f517cd3"
> > +
> > +inherit systemd update-rc.d
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
> > +INITSCRIPT_NAME =3D "ypbind"
> > +INITSCRIPT_PARAMS =3D "start 44 3 5 . stop 70 0 1 2 6 ."
> > +
> > +CACHED_CONFIGUREVARS =3D "ac_cv_prog_STRIP=3D/bin/true"
> > +
> > +EXTRA_OECONF =3D "PKG_CONFIG_PATH=3D'${STAGING_LIBDIR}/yp-nis/pkgconfi=
g/'"
> > +
> > +do_install_append () {
> > +    install -d ${D}${sysconfdir}/init.d
> > +    install -d ${D}${sysconfdir}/rcS.d
> > +
> > +    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/ini=
t.d/ypbind
> > +
> > +    install -d ${D}${systemd_unitdir}/system
> > +    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/s=
ystem
> > +}
> > +
> > +
> > +RPROVIDES_${PN} +=3D "${PN}-systemd"
> > +RREPLACES_${PN} +=3D "${PN}-systemd"
> > +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
--=20
-Joe MacDonald.
:wq

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU+HLXAAoJEEn8ffcsOfaWREQH/A5oOzqcqyXbCY6dFnxZ+aDa
lKK/MXvt5osogfS6J25pGUaboIK0s9H5UREgyM+ZsCCvS/uvIVnIkxS/b/U328td
zu4oM8IQz8sgoth3KEYZ47++CTN45uNUVX++rJwKcffiAjG2eZpAODGhNLIfBjeH
pki508wHqOCjoRXmVGYCJTjLeVbWjgdBSEwLbhzq9a4+IkVgVcPWr9Yt/cf8T7QC
ObmaOwXcToIQcFCzilbcnqieZxk44CR/GJz6evv0sFgONkBbE24UOgO6IbDf47w4
KQgIpymwzxY/xN6pjGpLP5g3dff948fH1Jpf+yqR8psfPt+VzwpD+rgHtG48czM=
=RSaq
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
