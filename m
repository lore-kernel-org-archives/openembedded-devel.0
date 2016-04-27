Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B614373259
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:34:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e201so10585025wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4KNJgHoucPGZxFrFYcDBRRWIHLw/X249c13/Fa1oO1A=;
	b=mvKvdNY3RyBwuv3zvDANkmscrqm+sERl8zxUWMvSDlFCIEc4A1spD5QwjGciwIUWAN
	1Hxk4S9mAv4Cw8TyNEGkUDDssz9BvWvzzGwhOBRLCd+IWfcdM7j6TmmiQquT5Em9i4/1
	7fN+0+xfYaDDX/RaxsvFDrou+vnSgJOXtuHOXYMaEpvIro+oZDH3//lo+XmcW5zKWZ3T
	h0A7nSxoG04S6ix07nbkToMOppjASGRIbXms0epjWx345/2INoV1wXmDRuBfgjRHcVoF
	2TgppjdGo74Y8sjBLq/+dGUplzFtKrmwUqvM7uU+ht55zXdely+Tg3vu/hYHfMDJf7Gr
	Fo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4KNJgHoucPGZxFrFYcDBRRWIHLw/X249c13/Fa1oO1A=;
	b=UD0k228OA9q+Zuhh9P0tqVboCMeJlWpWIjzdrgb2FW4AW2qHzTVm9IaBL2aAyBZNxW
	57W728mwzV+2ytRhQLgEQIt81IwRTekoWSB8eiUJj8SAB1LkU5SDNS5WovHsloL8eUuK
	IoDWO4ITbIjEIMB4jYJpKly+kmua+d321yuDh1ZRGmDecgEK9lN8iZC0nP6s8f0v2YMq
	ILWTrYyI5U2PHhCanG+ixPOMDG9MFuPQC5jMHJ8naqHFHSSnZxXYAMS2Hd3OpXeFTuq6
	LGYP/FTd3v5riUdipFKCLQW9oq3rQrshdtiR84p5q0doWoCzZrqZQuQCA1QNTC2NGB81
	HqsQ==
X-Gm-Message-State: AOPr4FU5VDFpTQRNqgvV7rMmE4JLkv0XFz4ldvFvTDz+yYMdG0bu7M2M8os74ZQEcWQauA==
X-Received: by 10.194.61.134 with SMTP id p6mr7375471wjr.67.1461746097212;
	Wed, 27 Apr 2016 01:34:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm4649695wmf.6.2016.04.27.01.34.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 01:34:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 10:35:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427083526.GF2559@jama>
References: <1460682409-1786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1460682409-1786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe][PATCH] ltrace: Error Fix for ARM
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
X-List-Received-Date: Wed, 27 Apr 2016 08:34:58 -0000
X-Groupsio-MsgNum: 61201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline

--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 04:06:49AM +0300, Li Xin wrote:
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

Now I'm seeing this failure:

| ../../../../git/sysdeps/linux-gnu/arm/fetch.c: In function 'arch_elf_init=
':
| ../../../../git/sysdeps/linux-gnu/arm/fetch.c:101:8: error: 'data' may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
|     if (elf_read_next_uleb128(data, &offset, &tag) < 0
|         ^
| cc1: all warnings being treated as errors
| make[4]: *** [fetch.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: Leaving directory `.../ltrace/1_7.3+gitAUTOINC+01b10e191e-r0/bui=
ld/sysdeps/linux-gnu/arm'

Possibly caused by using -Os, can you retest with -Os?

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
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
> index d8d037e..850e8e3 100644
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
> 1.8.4.2
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgec4ACgkQN1Ujt2V2gBzWPwCgl+VOidf+HuAxrL0quV1e5SCO
uuUAoIv/5ni2ColpdPR5l7waoBmxmDxm
=aV+N
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
