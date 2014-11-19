Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id AD71D6AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:33:30 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so2038856wiw.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dWoy4pEt5E+1QeZH7u8iwyccpdjdr6wAEfcIYiDWugI=;
	b=0Ib56b9h2Ux5EFz8orQbYMtNYAJsCb8U+L+v2VHcpf3fPetfkwcSTTSjpvXzuFqgFL
	pIvudFubjuxDJxu57rrcG4fSBHt1Y6DvuYiLrDhy0ThLwQmqhgJWVwkEmBP2FNN4umLs
	E8HptHJquieK6nqsMOAwUZM2UrdM08PJGIInOdltuImXukPrW1iJx4x6eun6HaM7dQt/
	mI+ndiqPGzLXxAhMdT4jN+/YaN7MdDVdeFyBQe5qhVPDkWRkgbdZfTmAojOnq7lfMgGA
	b26A+p7dMLNN6K8PCsX4wUCQNFFQibhyP82oJ8fYvHBCANM4Ch0Vuh4c5zfqkB5OGVDu
	dRYQ==
X-Received: by 10.194.246.130 with SMTP id xw2mr38603517wjc.33.1416407610324; 
	Wed, 19 Nov 2014 06:33:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wr9sm2507306wjb.42.2014.11.19.06.33.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:33:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:33:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119143330.GF3315@jama>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-6-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416222008-9218-6-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 5/5] sgpio : add new recipe
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
X-List-Received-Date: Wed, 19 Nov 2014 14:33:41 -0000
X-Groupsio-MsgNum: 52931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 07:00:08PM +0800, Li xin wrote:
> Intel SGPIO enclosure management utility
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../0001-Makefile-modify-some-parameters.patch     | 51 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   | 28 ++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Ma=
kefile-modify-some-parameters.patch
>  create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
>=20
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-=
modify-some-parameters.patch b/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.1=
0/0001-Makefile-modify-some-parameters.patch
> new file mode 100644
> index 0000000..8b23a19
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-=
some-parameters.patch
> @@ -0,0 +1,51 @@
> +From ecb100a252c691075720ff0604e2ebdb83deb994 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Mon, 17 Nov 2014 12:26:21 +0900
> +Subject: [PATCH] Makefile : modify some parameters
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 278d966..431d993 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -23,25 +23,28 @@
> +=20
> +=20
> + MANDIR ?=3D /usr/local/man
> ++SBIN_DIR =3D /sbin
> ++INSTALL =3D/usr/bin/install -c
> + ALL =3D sgpio
> ++CFLAGS =3D -g -Wall
> +=20
> + all: $(ALL)
> +=20
> + sgpio.o: sgpio.c
> +-	gcc -g -Wall -c sgpio.c
> ++	${CC} $(CFLAGS) -c sgpio.c
> +=20
> + sgpio: sgpio.o
> +-	gcc -g sgpio.o -o sgpio
> ++	${CC} -g sgpio.o -o sgpio
> +=20
> + clean:
> + 	rm -f sgpio.o sgpio
> +=20
> + install: $(ALL)
> + 	for i in $(ALL); do \
> +-		install $$i /sbin/$$i; \
> ++	    $(INSTALL) -D $$i $(SBIN_DIR)/$$i; \
> + 	done
> +-	install -d $(MANDIR)/man1
> +-	install -m 0644 *.1 $(MANDIR)/man1
> ++	$(INSTALL) -d $(MANDIR)/man1
> ++	$(INSTALL) -m 0644 *.1 $(MANDIR)/man1
> +=20
> + uninstall:
> + 	for i in $(ALL); do \
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/r=
ecipes-extended/sgpio/sgpio_1.2.0.10.bb
> new file mode 100644
> index 0000000..7867d9d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "SGPIO captive backplane tool"
> +DESCRIPTION =3D "Intel SGPIO enclosure management utility"
> +HOMEPAGE =3D "http://sources.redhat.com/lvm2/wiki/DMRAID_Eventing"
> +SECTION =3D "System Environment/Base"
> +
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-1.2-0.1=
0-src.tar.gz/a417bf68da4e9bd79a4664c11d7debd1/${PN}-1.2-0.10-src.tar.gz"
> +
> +SRC_URI +=3D "file://0001-Makefile-modify-some-parameters.patch"
> +
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
> +	oe_runmake clean
> +}
> +
> +do_install() {
> +	oe_runmake install \
> +                INSTALL=3D"/usr/bin/install -p" \
> +                DESTDIR=3D${D} \
> +	        SBIN_DIR=3D${D}/${sbindir} \
> +	        MANDIR=3D${D}/${mandir}

use 4 spaces for indentation, no tabs and definitely no mix of tabs and
spaces

I've fixed this one when cherry-picking to master-next

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

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsqjoACgkQN1Ujt2V2gBx5lACfceY/Qg0SP71UD3AYMLlaJiuv
enEAoKiUY04ZT8YCiy33HEY/HtY63B4a
=g9T+
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
