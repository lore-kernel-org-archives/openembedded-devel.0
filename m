Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E137971637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:16:26 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id y19so2287346wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P0PpnIT+gwLbrZGt0uJCAFar0QEvplB9tMEqzI4co04=;
	b=h4lSGXTWsHXPz8L2UDgFsyAkxz6Klm4Bti8YVcF9iuF8StUTftlOEdZGcCMQIkK1Ga
	88JNWU4YvqCKSn/ViGd2v142bhM83MCD7ooMeG6HQpR8k57xevDqd/5KbvP9p1M/9Efj
	VPl/VKZU6JBZ8dti71blhrPGRmPymOrIebtUmFKhuGgP9iDepZ00psZekh/gIuHi0UqC
	r7DmzFZc6mPnoTjDs9iLBbmxglk3Lrva6d7qQmYimzwSRtFiy3YFRyk4d5rjOgHrgmIf
	Ln/57VuWXiN6Dpr59AO7fS/PQcdujDiR0D+DC7ytaEn9R2n5cg7HvaigCbDsuQXA84No
	uCeA==
X-Received: by 10.180.80.163 with SMTP id s3mr67012481wix.59.1421939787209;
	Thu, 22 Jan 2015 07:16:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hn2sm4380125wjc.5.2015.01.22.07.16.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 07:16:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 16:16:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150122151631.GB2456@jama>
References: <20141121140300.GF2163@jama>
	<1421810463-4921-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1421810463-4921-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] sgpio: add new recipe
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
X-List-Received-Date: Thu, 22 Jan 2015 15:16:29 -0000
X-Groupsio-MsgNum: 53928
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 11:21:03AM +0800, Li xin wrote:
> Intel SGPIO enclosure management utility.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../sgpio/sgpio/0001-Makefile-error-fix.patch      | 129 +++++++++++++++=
++++++
>  meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  26 +++++
>  2 files changed, 155 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-er=
ror-fix.patch
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
>=20
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix=
=2Epatch b/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.pat=
ch
> new file mode 100644
> index 0000000..c6b888e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio/0001-Makefile-error-fix.patch
> @@ -0,0 +1,129 @@
> +From 9ad360c663bbd2886fda7b18283694ff53d77a42 Mon Sep 17 00:00:00 2001
> +From: Li Xin <lix.fnst@cn.fujitsu.com>
> +Date: Wed, 21 Jan 2015 09:50:11 +0800
> +Subject: [PATCH] Makefile: error fix
> +
> +the error is: install: cannot remove '/sbin/sgpio': Permission denied

It looks like you're changing line ends or something in whole file,
that's not related to "install: cannot remove '/sbin/sgpio': Permission
denied" and shouldn't be changed in the same patch.

> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile | 107 ++++++++++++++++++++++++++++++++------------------------=
-------
> + 1 file changed, 55 insertions(+), 52 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 278d966..c2b0bc7 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,52 +1,55 @@
> +-########################################################################
> +-# Copyright (C) 2007-2008, Intel Corp. All rights reserved.
> +-#
> +-#
> +-# This program is free software; you can redistribute it and/or modify =
it under
> +-# the terms of the GNU General Public License as published by the Free =
Software
> +-# Foundation; either version 2 of the License, or (at your option) any =
later version.
> +-#
> +-# This program is distributed in the hope that it will be useful, but
> +-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY or
> +-# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License=
=20
> +-# for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License alo=
ng
> +-# with this program; if not, write to the Free Software Foundation, Inc=
=2E,
> +-# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +-########################################################################
> +-
> +-
> +-# Intel SGPIO enclosure management utility
> +-#
> +-# Author: Eric R Hall <Eric.R.Hall@intel.com>
> +-
> +-
> +-MANDIR ?=3D /usr/local/man
> +-ALL =3D sgpio
> +-
> +-all: $(ALL)
> +-
> +-sgpio.o: sgpio.c
> +-	gcc -g -Wall -c sgpio.c
> +-
> +-sgpio: sgpio.o
> +-	gcc -g sgpio.o -o sgpio
> +-
> +-clean:
> +-	rm -f sgpio.o sgpio
> +-
> +-install: $(ALL)
> +-	for i in $(ALL); do \
> +-		install $$i /sbin/$$i; \
> +-	done
> +-	install -d $(MANDIR)/man1
> +-	install -m 0644 *.1 $(MANDIR)/man1
> +-
> +-uninstall:
> +-	for i in $(ALL); do \
> +-		rm -f /sbin/$$i; \
> +-	done
> +-	for i in $(ALL:=3D.1); do \
> +-		rm -f $(MANDIR)/man1/$$i; \
> +-	done
> ++########################################################################
> ++# Copyright (C) 2007-2008, Intel Corp. All rights reserved.
> ++#
> ++#
> ++# This program is free software; you can redistribute it and/or modify =
it under
> ++# the terms of the GNU General Public License as published by the Free =
Software
> ++# Foundation; either version 2 of the License, or (at your option) any =
later version.
> ++#
> ++# This program is distributed in the hope that it will be useful, but
> ++# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY or
> ++# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License=
=20
> ++# for more details.
> ++#
> ++# You should have received a copy of the GNU General Public License alo=
ng
> ++# with this program; if not, write to the Free Software Foundation, Inc=
=2E,
> ++# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> ++########################################################################
> ++
> ++
> ++# Intel SGPIO enclosure management utility
> ++#
> ++# Author: Eric R Hall <Eric.R.Hall@intel.com>
> ++
> ++
> ++MANDIR ?=3D /usr/local/man
> ++SBIN_DIR =3D /sbin
> ++INSTALL =3D/usr/bin/install -c
> ++ALL =3D sgpio
> ++CFLAGS =3D -g -Wall
> ++
> ++all: $(ALL)
> ++
> ++sgpio.o: sgpio.c
> ++	${CC} $(CFLAGS) -c sgpio.c
> ++
> ++sgpio: sgpio.o
> ++	${CC} -g sgpio.o -o sgpio
> ++
> ++clean:
> ++	rm -f sgpio.o sgpio
> ++
> ++install: $(ALL)
> ++	for i in $(ALL); do \
> ++		$(INSTALL) -D $$i $(SBIN_DIR)/$$i; \
> ++	done
> ++	$(INSTALL) -d $(MANDIR)/man1
> ++	$(INSTALL) -m 0644 *.1 $(MANDIR)/man1
> ++
> ++uninstall:
> ++	for i in $(ALL); do \
> ++		rm -f /sbin/$$i; \
> ++	done
> ++	for i in $(ALL:=3D.1); do \
> ++		rm -f $(MANDIR)/man1/$$i; \
> ++	done
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/r=
ecipes-extended/sgpio/sgpio_1.2.0.10.bb
> new file mode 100644
> index 0000000..722ba33
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "SGPIO captive backplane tool"
> +DESCRIPTION =3D "Intel SGPIO enclosure management utility"
> +
> +SRC_URI =3D " \
> +    http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.t=
ar.gz/a417bf68da4e9bd79a4664c11d7debd1/${BPN}-1.2-0.10-src.tar.gz \
> +    file://0001-Makefile-error-fix.patch \
> +"
> +SRC_URI[md5sum] =3D "a417bf68da4e9bd79a4664c11d7debd1"
> +SRC_URI[sha256sum] =3D "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4=
a7363d990fc0270b"
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://LICENSE_GPL;md5=3D393a5ca445f6965873eca0259=
a17f833"
> +
> +do_compile_prepend() {
> +    oe_runmake clean
> +}
> +
> +do_install() {
> +    oe_runmake install \
> +        INSTALL=3D"/usr/bin/install -p" \
> +        DESTDIR=3D${D} \
> +        SBIN_DIR=3D${D}/${sbindir} \
> +        MANDIR=3D${D}/${mandir}
> +}
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBFE8ACgkQN1Ujt2V2gBwXGgCfRLq1UE5Nl2BK0T+MyTQRMzg9
WjYAn0g+5FQp1feEHE6snEd1zAnNrqy0
=O1f6
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
