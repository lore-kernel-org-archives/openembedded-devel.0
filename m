Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 13E2E71637;
	Thu,  5 Mar 2015 14:29:07 +0000 (UTC)
Received: by wghk14 with SMTP id k14so9948150wgh.7;
	Thu, 05 Mar 2015 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/CiEpQRsi0/PCZ8DXwvvzn+t4pCo5S8mF4dCe0KvDTs=;
	b=W5iswE/dovvlKthVjRZwk5IDQKdusQDq8fwl7vrkdjULPmBaB1gdf6PDdszDtX2CKR
	Pbxz5dxmr6mYYeVQukZS7Cx2Lc63g+e9zc/0QpZAtI8jMp6BhQlrRwMOZ3lhFBeXzqjo
	T5gv29wtdJZMR/YZHXYKBSWzDfOq/keTShKQYknFsQxoz7c3HL2UGM5B06m4bOrTuCBT
	1SNSRj8hlK7JVfYG8IbG9HVAGz2++HTvMk5P435kLjvguEWaRpaKni54VKvKNFEtVVdH
	t45tqxa8tT0FOWDhMlEuTCaPg2VA2YLJVUI43DpGYuZsHsV8IKg40vjdyOz1FxRh4TxD
	iTOw==
X-Received: by 10.180.105.40 with SMTP id gj8mr67646439wib.67.1425565748742;
	Thu, 05 Mar 2015 06:29:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a13sm10754294wjx.30.2015.03.05.06.29.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:29:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 15:29:13 +0100
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20150305142913.GU2337@jama>
References: <20150304135132.54A3D5017B@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150304135132.54A3D5017B@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 Mar 2015 14:29:08 -0000
X-Groupsio-MsgNum: 54649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TPGKQYD3WP7vMswh"
Content-Disposition: inline

--TPGKQYD3WP7vMswh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 01:51:32PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: e00832bc4dbeacb5eb09864674b6ba7a04fc8622
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3De00832bc4dbeacb5eb09864674b6ba7a04fc8622
>=20
> Author: Joe MacDonald <joe_macdonald@mentor.com>
> Date:   Mon Mar  2 00:23:43 2015 -0500
>=20
> nis: integrate latest stable yp-tools and ypbind
>=20
> Update to the latest stable NIS tools.  The yp-tools libraries and headers
> conflict with the RPC headers provided by glibc, so install them to a
> different location.  Systems that intend to build using the NIS-provided
> versions will need to specify the alternate location, but that is covered
> by pkg-config, so it should only be necessary to point pkg-config at the
> alternate .pc file.
>=20
> The older stable versions are suitable for IPv4-only setups, so keep them
> around in case those are required for some systems.

This seems to break yp-tools build for qemuarm:
yp-tools/3.3-r0/yp-tools-3.3/lib/do_ypcall.c:461:27: error: cast
increases required alignment of target type [-Werror=3Dcast-align]

http://errors.yoctoproject.org/Errors/Details/9221/

>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  ...rovide-an-in-place-version-of-mapv4v6addr.patch | 110 +++++++++++++++=
++++++
>  .../recipes-support/nis/yp-tools_3.3.bb            |  46 +++++++++
>  .../recipes-support/nis/ypbind-mt_2.2.bb           |  51 ++++++++++
>  3 files changed, 207 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-i=
pv6-Provide-an-in-place-version-of-mapv4v6addr.patch b/meta-networking/reci=
pes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-=
mapv4v6addr.patch
> new file mode 100644
> index 0000000..9ef569f
> --- /dev/null
> +++ b/meta-networking/recipes-support/nis/yp-tools/yp-tools-ipv4-ipv6-Pro=
vide-an-in-place-version-of-mapv4v6addr.patch
> @@ -0,0 +1,110 @@
> +From a1ef10d63b0ea34c788d5432e94c72b00ae55e04 Mon Sep 17 00:00:00 2001
> +From: Joe MacDonald <joe_macdonald@mentor.com>
> +Date: Fri, 27 Feb 2015 12:04:10 -0500
> +Subject: [PATCH] ipv4/ipv6: Provide an in-place version of mapv4v6addr.h
> +
> +mapv4v6addr.h isn't always available, depending on your build, but
> +nis-hosts.c only needs it for a single, inline function.  So drop a copy
> +here rather than playing games with the include path that would
> +potentially lead to cross-compilation issues.
> +
> +Upstream-status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +---
> + nss_nis6/mapv4v6addr.h | 69 +++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + nss_nis6/nis-hosts.c   |  2 +-
> + 2 files changed, 70 insertions(+), 1 deletion(-)
> + create mode 100644 nss_nis6/mapv4v6addr.h
> +
> +diff --git a/nss_nis6/mapv4v6addr.h b/nss_nis6/mapv4v6addr.h
> +new file mode 100644
> +index 0000000..7f85f7d
> +--- /dev/null
> ++++ b/nss_nis6/mapv4v6addr.h
> +@@ -0,0 +1,69 @@
> ++/*
> ++ * ++Copyright++ 1985, 1988, 1993
> ++ * -
> ++ * Copyright (c) 1985, 1988, 1993
> ++ *    The Regents of the University of California.  All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions
> ++ * are met:
> ++ * 1. Redistributions of source code must retain the above copyright
> ++ *    notice, this list of conditions and the following disclaimer.
> ++ * 2. Redistributions in binary form must reproduce the above copyright
> ++ *    notice, this list of conditions and the following disclaimer in t=
he
> ++ *    documentation and/or other materials provided with the distributi=
on.
> ++ * 4. Neither the name of the University nor the names of its contribut=
ors
> ++ *    may be used to endorse or promote products derived from this soft=
ware
> ++ *    without specific prior written permission.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' =
AND
> ++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> ++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR P=
URPOSE
> ++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LI=
ABLE
> ++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQU=
ENTIAL
> ++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GO=
ODS
> ++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> ++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, =
STRICT
> ++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN AN=
Y WAY
> ++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY =
OF
> ++ * SUCH DAMAGE.
> ++ * -
> ++ * Portions Copyright (c) 1993 by Digital Equipment Corporation.
> ++ *
> ++ * Permission to use, copy, modify, and distribute this software for any
> ++ * purpose with or without fee is hereby granted, provided that the abo=
ve
> ++ * copyright notice and this permission notice appear in all copies, an=
d that
> ++ * the name of Digital Equipment Corporation not be used in advertising=
 or
> ++ * publicity pertaining to distribution of the document or software wit=
hout
> ++ * specific, written prior permission.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAI=
MS ALL
> ++ * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRA=
NTIES
> ++ * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
> ++ * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUE=
NTIAL
> ++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
> ++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTI=
OUS
> ++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE =
OF THIS
> ++ * SOFTWARE.
> ++ * -
> ++ * --Copyright--
> ++ */
> ++
> ++#include <string.h>
> ++#include <arpa/nameser.h>
> ++
> ++static void
> ++map_v4v6_address (const char *src, char *dst)
> ++{
> ++  u_char *p =3D (u_char *) dst;
> ++  int i;
> ++
> ++  /* Move the IPv4 part to the right position.  */
> ++  memcpy (dst + 12, src, INADDRSZ);
> ++
> ++  /* Mark this ipv6 addr as a mapped ipv4. */
> ++  for (i =3D 0; i < 10; i++)
> ++    *p++ =3D 0x00;
> ++  *p++ =3D 0xff;
> ++  *p =3D 0xff;
> ++}
> +diff --git a/nss_nis6/nis-hosts.c b/nss_nis6/nis-hosts.c
> +index af99c74..96d8fa1 100644
> +--- a/nss_nis6/nis-hosts.c
> ++++ b/nss_nis6/nis-hosts.c
> +@@ -36,7 +36,7 @@
> + #include "nss-nis6.h"
> +=20
> + /* Get implementation for some internal functions. */
> +-#include <resolv/mapv4v6addr.h>
> ++#include "mapv4v6addr.h"
> +=20
> + #define ENTNAME         hostent
> + #define DATABASE        "hosts"
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-n=
etworking/recipes-support/nis/yp-tools_3.3.bb
> new file mode 100644
> index 0000000..75ad989
> --- /dev/null
> +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> @@ -0,0 +1,46 @@
> +# This package builds tools to manage NIS
> +# The source package is utils/net/NIS/yp-tools
> +#
> +require nis.inc
> +
> +SUMMARY =3D "NIS client programs"
> +DESCRIPTION =3D " \
> +Network Information Service tools.  \
> +This package contains ypcat, ypmatch, ypset, \
> +ypwhich, yppasswd, domainname, nisdomainname \
> +and ypdomainname. \
> +"
> +
> +SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
> +           file://domainname.service \
> +           file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv=
4v6addr.patch \
> +"
> +SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
> +SRC_URI[sha256sum] =3D "812be817df3d4c25813552be336c6c6ad5aedaf65611b81a=
f3ad9f98fb3c2e50"
> +
> +DEPENDS =3D "libtirpc"
> +
> +inherit autotools systemd
> +SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +
> +CACHED_CONFIGUREVARS +=3D "ac_cv_prog_STRIP=3D/bin/true"
> +
> +EXTRA_OECONF =3D " \
> +                --disable-rpath \
> +                --libdir=3D${libdir}/yp-nis/ \
> +                --includedir=3D${includedir}/yp-nis/ \
> +               "
> +
> +FILES_${PN} +=3D " ${libdir}/yp-nis/*.so.*.* ${libdir}/yp-nis/pkgconfig/"
> +FILES_${PN}-dbg +=3D " ${libdir}/yp-nis/.debug"
> +FILES_${PN}-dev +=3D " ${libdir}/yp-nis/*.so ${libdir}/yp-nis/*.so.[12] =
${libdir}/yp-nis/*.la"
> +FILES_${PN}-staticdev +=3D " ${libdir}/yp-nis/*.a"
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}=
/system
> +}
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-=
networking/recipes-support/nis/ypbind-mt_2.2.bb
> new file mode 100644
> index 0000000..b960757
> --- /dev/null
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> @@ -0,0 +1,51 @@
> +# This package builds the NIS ypbind daemon
> +# The source package is utils/net/NIS/ypbind-mt
> +#
> +require nis.inc
> +
> +DESCRIPTION =3D " \
> +Multithreaded NIS bind service (ypbind-mt).  \
> +ypbind-mt is a complete new implementation of a NIS \
> +binding daemon for Linux. It has the following \
> +features.  Supports ypbind protocol V1 and V2.  \
> +Uses threads for better response.  Supports multiple \
> +domain bindings.  Supports /var/yp/binding/* file \
> +for Linux libc 4/5 and glibc 2.x.  Supports a list \
> +of known secure NIS server (/etc/yp.conf) Binds to \
> +the server which answered as first. \
> +"
> +HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> +DEPENDS =3D "yp-tools"
> +PROVIDES +=3D "ypbind"
> +
> +SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
> +           file://ypbind-yocto.init \
> +           file://ypbind.service \
> +"
> +SRC_URI[md5sum] =3D "54e2040d8266ae7d302d081ca310c8a8"
> +SRC_URI[sha256sum] =3D "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0fe68=
404ae7465f517cd3"
> +
> +inherit systemd update-rc.d
> +
> +SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
> +INITSCRIPT_NAME =3D "ypbind"
> +INITSCRIPT_PARAMS =3D "start 44 3 5 . stop 70 0 1 2 6 ."
> +
> +CACHED_CONFIGUREVARS =3D "ac_cv_prog_STRIP=3D/bin/true"
> +
> +EXTRA_OECONF =3D "PKG_CONFIG_PATH=3D'${STAGING_LIBDIR}/yp-nis/pkgconfig/=
'"
> +
> +do_install_append () {
> +    install -d ${D}${sysconfdir}/init.d
> +    install -d ${D}${sysconfdir}/rcS.d
> +
> +    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.=
d/ypbind
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/sys=
tem
> +}
> +
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TPGKQYD3WP7vMswh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4aDkACgkQN1Ujt2V2gByhiwCgpn70FEKvgYBGXACsYkE5xOSb
QUwAn2aIZ6ZyRbExAJApJ3edYCID0PGO
=KhCi
-----END PGP SIGNATURE-----

--TPGKQYD3WP7vMswh--
