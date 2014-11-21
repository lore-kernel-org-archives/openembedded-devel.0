Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 19ABD6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:05:46 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so6679135wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b+oVyRMoaWGRwAsph8Ng3DXmORauEKjP5jJeM7VXXM8=;
	b=wAENDm7koQo0IJ74T/uKuJeH8Y7kZ0nl1DnHFTDp5y6tzji2iAB3hEvmLjRfnn7TFO
	FNDDbJStMZIK1SjpBqi+uTq9raycOCJqbsx69knzpwR4FAa67JbymGBtprAG2RFWp0iG
	qzjRnGWUl0AmfGmzztL5ME94FtSxsYbVvQ9ib3MC34W2yOrCt6UZKZ1rZP2Ul/plDUgI
	BcKtu9D8eLkqaaRUCR4YR2wWYa/5+kPHai8FwfgH2wiuEKcXOGKEJNgsvRBFoU76Itlu
	x2F49I6VmUsVONOfa7+Obeyouo4wpc/l/vufKb+7ZGQX7rsglEBcMKQntdiK1zUfW62B
	y9Tw==
X-Received: by 10.180.82.170 with SMTP id j10mr8340108wiy.35.1416578746288;
	Fri, 21 Nov 2014 06:05:46 -0800 (PST)
Received: from localhost ([89.176.104.3]) by mx.google.com with ESMTPSA id
	fk16sm8900628wic.16.2014.11.21.06.05.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:05:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:05:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121140544.GH2163@jama>
References: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2] tiptop: Add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 14:05:50 -0000
X-Groupsio-MsgNum: 52970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbfcI4OLZ4XW0yH2"
Content-Disposition: inline

--VbfcI4OLZ4XW0yH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2014 at 04:59:01PM +0800, Qian Lei wrote:
> Tiptop is a performance monitoring tool for Linux. It provides a
> dynamic real-time view of the tasks running in the system. Tiptop
> is very similar to the top utility, but most of the information
> displayed comes from hardware counters.
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../files/tiptop-remove-path-of-libxml2.patch      | 28 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/tiptop/tiptop_2.2.bb      | 15 ++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/tiptop/files/tiptop-remove-p=
ath-of-libxml2.patch
>  create mode 100644 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
>=20
> diff --git a/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-=
libxml2.patch b/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of=
-libxml2.patch
> new file mode 100644
> index 0000000..7499828
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tiptop/files/tiptop-remove-path-of-libxml2=
=2Epatch
> @@ -0,0 +1,28 @@
> +From 2f9cb586d6675371f9db8d4b62a4b339625d73a6 Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Thu, 20 Nov 2014 16:34:47 +0800
> +Subject: [PATCH] tiptop: Remove the include path
> +
> +Remove the path and specify it in .bb file
> +
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6a71782..7408f82 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -31,7 +31,7 @@ AC_CHECK_LIB([xml2], [xmlParseFile],
> +                   [have_xml2=3Dyes;
> +                   AC_DEFINE([HAVE_LIBXML2], [1], [Define to 1 if you ha=
ve the `libxml2' library (-lxml2).])
> +                   LIBS=3D"-lxml2 $LIBS"
> +-                  CFLAGS=3D"$CFLAGS -I/usr/include/libxml2"],
> ++                  CFLAGS=3D"$CFLAGS"],
> +              [have_xml2=3Dno])
> + fi
> +=20
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb b/meta-oe/reci=
pes-extended/tiptop/tiptop_2.2.bb
> new file mode 100644
> index 0000000..d8a0de4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Hardware performance monitoring counters"
> +HOMEPAGE =3D "http://tiptop.gforge.inria.fr/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "ncurses libxml2"
> +
> +SRC_URI =3D "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz;name=3D=
tarball \
> +           file://tiptop-remove-path-of-libxml2.patch \
> +"
> +SRC_URI[tarball.md5sum] =3D "74255a29acf44569db021b080ad3e3f7"
> +SRC_URI[tarball.sha256sum] =3D "965cb99b16cb59df78363d83b62877ce8501b0aa=
c1116a86bed8a16aa96b171d"

Drop name=3Dtarball and tarball. prefix.

Fails to build for qemuarm:

| In file included from target.c:17:0:
| target-x86.c: In function 'disp_family_model':
| target-x86.c:54:3: error: unknown register name '%edx' in 'asm'
|    asm("mov $1, %%eax; " /* a into eax */
|    ^
| target-x86.c:54:3: error: unknown register name '%ecx' in 'asm'
| target-x86.c:54:3: error: unknown register name '%ebx' in 'asm'
| target-x86.c:54:3: error: unknown register name '%eax' in 'asm'
| make[1]: *** [target.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/tiptop/2.2-r0/tiptop-2.2/src'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tiptop/2.2-r0/tem=
p/log.do_compile.7484)
NOTE: recipe tiptop-2.2-r0: task do_compile: Failed


> +
> +EXTRA_OECONF =3D "CFLAGS=3D"$CFLAGS -I${STAGING_INCDIR}/libxml2""
> +
> +inherit autotools-brokensep
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VbfcI4OLZ4XW0yH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvRrgACgkQN1Ujt2V2gBy79gCfdDPM28l1UW1HAlTjKrNwER8h
Ta0AoLWcbWb3cNFBKDsDyjcktUrzzec7
=cGyt
-----END PGP SIGNATURE-----

--VbfcI4OLZ4XW0yH2--
