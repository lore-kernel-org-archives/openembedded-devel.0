Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id A4D4B7147D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:53:42 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w62so20003350wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 02:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jK2Sha/ldkpOB7wP3DGfsnDraugK5zGvNFZAhigyM0I=;
	b=eGXK17MkC32g3zHp98/3g4+u45hxZ0ECgoD9G0JSyfbpNMwIrJWmQuKVQ8Zd9Ksq+h
	1BRdd4SrPN0lrQG7+t16kjZliVvy2rzR27OzTeVlr1LRZQnR14Lo9vs0OdTE3pfQOa3p
	y4Nu4YDwm3OwKIDqiWlaKVfDenrZlsJ8Da0jK/PJ95jyASDfBbw3gTLhz7oQ6IlyDYzX
	4fwqXHWPTKDkZXznb+FL1lSFVf6kDp9vYHfffsf1QysCDy8GELHnwTerlgUtA6FhwOZ9
	X2fAeGoTp+KNXkwKduPRPco98I0JxDmrvqG8iRdWkaxST4MiOKecfHhsJO00TIJrfkpx
	P0Qg==
X-Received: by 10.194.2.240 with SMTP id 16mr6220690wjx.108.1422442422666;
	Wed, 28 Jan 2015 02:53:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eu8sm2239314wib.21.2015.01.28.02.53.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 02:53:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 11:53:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128105343.GF2477@jama>
References: <20150122151631.GB2456@jama>
	<1421981390-3786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1421981390-3786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v3] sgpio: add new recipe
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
X-List-Received-Date: Wed, 28 Jan 2015 10:53:46 -0000
X-Groupsio-MsgNum: 54010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline

--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2015 at 10:49:50AM +0800, Li xin wrote:
> Intel SGPIO enclosure management utility.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../sgpio/sgpio/Makefile-error-fix.patch           | 127 +++++++++++++++=
++++++
>  meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  26 +++++
>  2 files changed, 153 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-f=
ix.patch
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
>=20
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patc=
h b/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch
> new file mode 100644
> index 0000000..709f831
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio/Makefile-error-fix.patch
> @@ -0,0 +1,127 @@
> +Fix Makefile:
> +
> +* change the file format from dos to unix to avoid do_patch failed.
> +* override gcc,SBIN_DIR and INSTALL for cross-compilation.

And now it fails :)

ERROR: Command Error: exit status: 1  Output:
Applying patch Makefile-error-fix.patch
patching file Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch Makefile-error-fix.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
NOTE: Running task 24080 of 31430 (ID: 15862, /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb, do=
_rm_work_all)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/sgpio/1.2.0.10-r0/temp/log.do_patch.22993
NOTE: recipe sgpio-1.2.0.10-r0: task do_patch: Failed
ERROR: Task 15924 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-extended/sgpio/sgpio_1.2.0.10.bb, do_patch) failed with exit code=
 '1'

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
> index 0000000..9807a31
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "SGPIO captive backplane tool"
> +DESCRIPTION =3D "Intel SGPIO enclosure management utility"
> +
> +SRC_URI =3D " \
> +    http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.t=
ar.gz/a417bf68da4e9bd79a4664c11d7debd1/${BPN}-1.2-0.10-src.tar.gz \
> +    file://Makefile-error-fix.patch \
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

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIv7cACgkQN1Ujt2V2gBwU0ACgqI2yxsStEC7KK7yYUM0jULuG
5ukAoIi8N15pPof9kRn7R1s91BtV/3fk
=ZijS
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--
