Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6F87284B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:17:31 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so2540790wiw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nDu8qTudfDRgLVdK8q64orqEgCzlptTt5W2CqCtuGEo=;
	b=PhSvM+8zipI6u/cf7dbNh0W5iMOi8N6oUogRBA2+I4nIWF0grKLdAZM7dAHoPIHuPd
	j/Bz8CQX6ZWZ39I/RfFpS6iGwoAXnXdcYcuviqhVzsv0iaCDCIS9gmG3fVTszGc/k0XL
	lb1XCymXwdtjlLAbd6F3GZ1rfIxbfopP6AlLeVpB27mnSZf1STSGsNssFoiL5l3WQT0c
	ZQ5aCgBnE8pSvLo3wzk3TuhIhl0xMdnWLtva8e6oMy4iYmG7VR3f7bR8wYpVCShKNaj7
	aV1E3TenH2PNJUYafkaDt6NBXDldy7vsrcNq1eDgR9f/uCY/jIfHCDymFDys9PNFWj6d
	bpqw==
X-Received: by 10.181.8.98 with SMTP id dj2mr58280966wid.81.1420715851635;
	Thu, 08 Jan 2015 03:17:31 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl11sm5698430wjc.40.2015.01.08.03.17.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:17:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 12:17:35 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150108111735.GD3972@jama>
References: <20150107115322.GL29986@jama>
	<1420709147-9784-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420709147-9784-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libutempter: Fix compile error on arm
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
X-List-Received-Date: Thu, 08 Jan 2015 11:17:34 -0000
X-Groupsio-MsgNum: 53763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 05:25:47PM +0800, Qian Lei wrote:
> | iface.c: In function 'utempter_add_record':
> | <command-line>:0:12: error: expected expression before '/' token
> | iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
> |  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"

The issue exists on all architectures so drop "on arm"

> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../libutempter/0001-Modify-macro.patch            | 28 ++++++++++++++++=
++++++
>  .../libutempter/libutempter-pierelro.patch         | 23 ++++++++++++++++=
++
>  .../libutempter/libutempter_1.1.6.bb               | 11 ++++-----
>  3 files changed, 56 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libutempter/libutempter/0001-=
Modify-macro.patch
>  create mode 100644 meta-oe/recipes-support/libutempter/libutempter/libut=
empter-pierelro.patch
>=20
> diff --git a/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-=
macro.patch b/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-m=
acro.patch
> new file mode 100644
> index 0000000..b5c518f
> --- /dev/null
> +++ b/meta-oe/recipes-support/libutempter/libutempter/0001-Modify-macro.p=
atch
> @@ -0,0 +1,28 @@
> +From fe0721e3f533b54ed2f916365c0458aa2069c924 Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Thu, 8 Jan 2015 16:34:09 +0900
> +Subject: [PATCH] Remove macro and use hardcode.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +---
> + iface.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/iface.c b/iface.c
> +index 5951d81..928ebfd 100644
> +--- a/iface.c
> ++++ b/iface.c
> +@@ -43,7 +43,7 @@
> +        __result; }))
> + #endif
> +=20
> +-#define	UTEMPTER_DEFAULT_PATHNAME	LIBEXECDIR "/utempter/utempter"
> ++#define	UTEMPTER_DEFAULT_PATHNAME	"/usr/lib/libutempter/utempter/utempt=
er"

This hardcodes /usr/lib which won't work for people with different
layout.

> + static const char *utempter_pathname;
> + static int saved_fd =3D -1;
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/libutempter/libutempter/libutempter-=
pierelro.patch b/meta-oe/recipes-support/libutempter/libutempter/libutempte=
r-pierelro.patch
> new file mode 100644
> index 0000000..c30a92d
> --- /dev/null
> +++ b/meta-oe/recipes-support/libutempter/libutempter/libutempter-pierelr=
o.patch
> @@ -0,0 +1,23 @@
> +Port from fedora20
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +diff -up libutempter-1.1.6/Makefile.pierelro libutempter-1.1.6/Makefile
> +--- libutempter-1.1.6/Makefile.pierelro	2010-11-04 18:14:53.000000000 +0=
100
> ++++ libutempter-1.1.6/Makefile	2013-01-24 15:58:06.241865564 +0100
> +@@ -52,11 +52,12 @@ all: $(TARGETS)
> + 	$(COMPILE.c) -fPIC $< $(OUTPUT_OPTION)
> +=20
> + $(PROJECT): utempter.c
> +-	$(LINK.c) -Wl,-z,now,-stats $(LDLIBS) $< $(OUTPUT_OPTION)
> ++	$(LINK.c) -pie -fPIE -Wl,-z,relro,-z,now,-stats $(LDLIBS) \
> ++		$< $(OUTPUT_OPTION)
> +=20
> + $(SHAREDLIB): iface.os $(MAP)
> + 	$(LINK.o) -shared \
> +-		-Wl,-soname,$(SONAME),--version-script=3D$(MAP),-z,defs,-stats \
> ++		-Wl,-soname,$(SONAME),--version-script=3D$(MAP),-z,relro,-z,defs,-sta=
ts \
> + 		-lc $< $(OUTPUT_OPTION)
> +=20
> + $(STATICLIB): iface.o
> diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/m=
eta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
> index e1dccd6..6df0f19 100644
> --- a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
> +++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
> @@ -4,15 +4,15 @@ This library provides interface for terminal emulators =
such as \
>  screen and xterm to record user sessions to utmp and wtmp files."
>  HOMEPAGE =3D "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
>  SECTION =3D "System Environment/Libraries"
> -LICENSE =3D "GPLv2 GPLv2+ LGPLv2 MIT"
> +LICENSE =3D "GPLv2 & GPLv2+ & LGPLv2 & MIT"

This was already applied in master a while ago with:

commit ba3105e6055cce009e6f54c01885768ef72d81c5
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Fri Dec 26 17:21:34 2014 -0200

    libutempter: Fix license format QA error


>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> =20
> -SRC_URI =3D "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz=
2"
> +SRC_URI =3D "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz=
2 \
> +           file://0001-Modify-macro.patch \
> +           file://libutempter-pierelro.patch"
>  SRC_URI[md5sum] =3D "b43827806923903aba2bc7cd3a2d45b7"
>  SRC_URI[sha256sum] =3D "b898565f31ced7e5c1fa0a2eaa0f6ff0ed862b5fe375d263=
75b64bfbdfeac397"
> =20
> -CFLAGS +=3D "-DLIBEXECDIR=3D$(libexecdir)"
> -
>  do_compile() {
>      oe_runmake                      \
>          libdir=3D${libdir}            \
> @@ -27,10 +27,9 @@ do_install() {
>          includedir=3D${includedir}    \
>          mandir=3D${mandir}
> =20
> -        rm -f ${D}${libdir}/*.a
> +    rm -f ${D}${libdir}/*.a
>  }
> =20
>  FILES_${PN} =3D "${libdir}/*.so.*"
>  FILES_${PN} +=3D "${libexecdir}/utempter/utempter"
> -
>  FILES_${PN}-dbg +=3D "${libexecdir}/utempter/.debug/utempter"
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

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSuZ08ACgkQN1Ujt2V2gBwBZACfRYxW8XrCc/8ABRZsnpgd4LTT
AYQAoJV/pdwwxJVgOhf+nB2vZyY+sVu6
=2RTp
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
