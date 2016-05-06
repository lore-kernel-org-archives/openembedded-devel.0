Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DCA1175D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:14:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so8994092wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8qXutEeUrfmkuRIcFyq4slxixeF7x7P3T+BfQVK4BUU=;
	b=i1g/61jGdoUbvwk7GQGW59N7CTs4e+KHzzzL2XWJZQYxVSNpZf6SOwle2ore0Bxbui
	wx6bE6YMUAA87UeI8d1zsKGWlniDiXVS6qPcDKcTyOZ4IXOprmIARXs6If8usVXpKb8+
	n7dBDkDFM+7T+yhXEl5Dxkvwkt3Yr9k96lV/bcn1lQegh4KrDrtk9/k9BewZ917MLSMM
	Jo+C42bos+yGMf6EQ6D2furbOx1poanfgMvTqUl3/4OZ6WWb9gszhBzaXfBelOVeSJ8C
	UOEFa/0rCfp/RfNo6cSCC3EzgqXMVPmgfn0F6/DeTpr7rROLWvaxsu6JUMTFxXWLyv61
	OkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8qXutEeUrfmkuRIcFyq4slxixeF7x7P3T+BfQVK4BUU=;
	b=k9cIqO8UqpMdyaLfUS9bhnFwAlietFAZ0sCMORBkDrUI0zsrGebBadrvvzaFIvEZVm
	q1KEeZUjs+9oY4Oep+Ga80V9VlEv4RWt4B3ev3wsUirfnyITeqkDs2LwtEntMLyS91xq
	fUKsgk1ukx4eG/pzYG3IxQo0vd7EUkuBEUioFndpJMajDi1G5AUV3XeEm4j3ZTtU0SXe
	SpggUutQpP4dqTXjnIfLIGX7D/V3oM1byi6g4yYY4U0Jplb8nL8a/Yz05V1vU0FvwXuM
	xKQwGdFCAI2hZfNoKaK6otCk5Aog8dkqNcZojrqv6d/w3XBSf93+AvDCYl2DiEA5VpE1
	KjFQ==
X-Gm-Message-State: AOPr4FVmu4Q8LOrGZWH/n0iWU+h6GBVtSm473rNgvncalioOaus/ArrUeW1BQl4tU2Kx/A==
X-Received: by 10.28.6.17 with SMTP id 17mr9932010wmg.26.1462544091311;
	Fri, 06 May 2016 07:14:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y1sm3839079wjy.36.2016.05.06.07.14.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:14:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 16:16:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160506141621.GD2544@jama>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
	<1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe backport krogoth PATCH 08/22] ltrace: Error Fix for ARM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 14:14:53 -0000
X-Groupsio-MsgNum: 61385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 11:00:45AM -0300, Otavio Salvador wrote:
> From: Li xin <lixin.fnst@cn.fujitsu.com>
>=20
> 1) The error is as following:
>      root # ltrace ls
>      __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4, 0xb6fd0b88PTRACE_SINGLE=
STEP: Input/output error
>      2747 couldn't continue when handling __libc_start_main (0xb6fbbde0) =
at 0xb6fbbde0
>    The master branch fix it.
>=20
> 2) remove unused patch:
>      --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
>      --ltrace-0.7.2-unused-typedef.patch

This still has issue reported here:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/10720=
7.html

I would prefer not to backport it to kergoth until it's fixed.

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
>  ...-ltrace-fix-gcc-5-logical-not-parentheses.patch | 38 -----------------
>  .../ltrace/ltrace-0.7.2-unused-typedef.patch       | 49 ----------------=
------
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  6 +--
>  3 files changed, 2 insertions(+), 91 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fi=
x-gcc-5-logical-not-parentheses.patch
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-u=
nused-typedef.patch
>=20
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5=
-logical-not-parentheses.patch b/meta-oe/recipes-devtools/ltrace/ltrace/000=
1-ltrace-fix-gcc-5-logical-not-parentheses.patch
> deleted file mode 100644
> index 681c43d..0000000
> --- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logica=
l-not-parentheses.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 876fe5680d77800426f8c4c5680a235732d722e6 Mon Sep 17 00:00:00 2001
> -From: Kai Kang <kai.kang@windriver.com>
> -Date: Mon, 24 Aug 2015 17:37:54 +0800
> -Subject: [PATCH] ltrace: fix gcc 5 logical not parentheses
> -
> -Upstream-Status: Pending
> -
> -Build ltrace with gcc 5.2, it fails with:
> -
> -error: logical not is only applied to the left hand side of comparison
> -[-Werror=3Dlogical-not-parentheses]
> -   if (!need_data(data, offset, SIZE / 8) < 0)  \
> -                                             ^
> -
> -Function need_data just return 0 on success and -1 if fail. So it is ok
> -to just test if (need_data(data, offset, SIZE / 8) < 0).
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - ltrace-elf.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ltrace-elf.c b/ltrace-elf.c
> -index c571d2a..7fe830f 100644
> ---- a/ltrace-elf.c
> -+++ b/ltrace-elf.c
> -@@ -218,7 +218,7 @@ need_data(Elf_Data *data, GElf_Xword offset, GElf_Xw=
ord size)
> - 	int								\
> - 	NAME(Elf_Data *data, GElf_Xword offset, uint##SIZE##_t *retp)	\
> - 	{								\
> --		if (!need_data(data, offset, SIZE / 8) < 0)		\
> -+		if (need_data(data, offset, SIZE / 8) < 0)		\
> - 			return -1;					\
> - 									\
> - 		if (data->d_buf =3D=3D NULL) /* NODATA section */ {		\
> ---=20
> -1.9.1
> -
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-t=
ypedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-t=
ypedef.patch
> deleted file mode 100644
> index 8f3c0ec..0000000
> --- a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.=
patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -diff --git a/value.c b/value.c
> -index d18db17..b98298e 100644
> ---- a/value.c
> -+++ b/value.c
> -@@ -1,6 +1,6 @@
> - /*
> -  * This file is part of ltrace.
> -- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
> -+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
> -  *
> -  * This program is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU General Public License as
> -@@ -282,9 +282,9 @@ value_init_deref(struct value *ret_val, struct value=
 *valp)
> - 	if (value_extract_word(valp, &l, NULL) < 0)
> - 		return -1;
> -=20
> --	/* We need "long" to be long enough to hold platform
> -+	/* We need "long" to be long enough to hold target
> - 	 * pointers.  */
> --	typedef char assert__long_enough_long[-(sizeof(l) < sizeof(void *))];
> -+	assert(sizeof(l) >=3D sizeof(arch_addr_t));
> -=20
> - 	value_common_init(ret_val, valp->inferior, valp,
> - 			  valp->type->u.ptr_info.info, 0);
> -diff --git a/lens_default.c b/lens_default.c
> -index ed3d0e1..5d00814 100644
> ---- a/lens_default.c
> -+++ b/lens_default.c
> -@@ -1,6 +1,6 @@
> - /*
> -  * This file is part of ltrace.
> -- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
> -+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
> -  * Copyright (C) 1998,2004,2007,2008,2009 Juan Cespedes
> -  * Copyright (C) 2006 Ian Wienand
> -  * Copyright (C) 2006 Steve Fink
> -@@ -342,9 +342,9 @@ format_array(FILE *stream, struct value *value, stru=
ct value_dict *arguments,
> - 	     struct expr_node *length, size_t maxlen, int before,
> - 	     const char *open, const char *close, const char *delim)
> - {
> --	/* We need "long" to be long enough to cover the whole address
> --	 * space.  */
> --	typedef char assert__long_enough_long[-(sizeof(long) < sizeof(void *))=
];
> -+	/* We need "long" to be long enough to cover the whole target
> -+	 * address space.  */
> -+	assert(sizeof(long) >=3D sizeof(arch_addr_t));
> - 	long l;
> - 	if (expr_eval_word(length, value, arguments, &l) < 0)
> - 		return -1;
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index bc4e271..19899f9 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -11,14 +11,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b6153=
9feef013de476e68b5c50a"
> =20
>  PE =3D "1"
>  PV =3D "7.3+git${SRCPV}"
> -SRCREV =3D "37ecc41b58be3dbdd79592a76e331b5b371e4f81"
> +SRCREV =3D "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
> =20
>  DEPENDS =3D "elfutils"
>  RDEPENDS_${PN} =3D "elfutils"
> -SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dl=
trace-0.7 \
> -           file://ltrace-0.7.2-unused-typedef.patch \
> +SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dm=
aster \
>             file://configure-allow-to-disable-selinux-support.patch \
> -           file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
>            "
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.8.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcspzEACgkQN1Ujt2V2gByPiACgqzbEruTexw7Ow82mIiITCbni
cXkAn3MvTel3UgG7K/5WrGeEoLOc3iMz
=hPCn
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
