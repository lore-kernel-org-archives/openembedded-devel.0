Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 19B29601B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:03:08 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n186so193213377wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 11:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oiDTBAxWF+JxR92xuNB7U+4Wws8ucAFlV6iiRUgRRvA=;
	b=KcT7V8s4gKOq24GtHwjCRsWlk1DsVE+u+zknrhFQHIwXEHUKbpyPL2gIL1Ez77LEl2
	xK5VijXTgY+B3ClRur7mdoLHQTzdAgGBUhTfjn2y/X9CJ04l/8qNRaJscVDYJXWAuyuE
	AqBuc9QVhWqv5/LR2AjbhU8u11JfK1/lrxeUx+vMqb2770+vEiJqjG8NPDUTV7UXlNYS
	tKR+WVaNs9VJl/RfCIo60Ct0w67qBKEmi+R69ty9BgiJqBtwX8eTcqpW2twJlgT7b3He
	SveMQGPuKiGnE9caVfcdFOBzIDDqt3BuC0vhWv7xrmi1Dn/4t8hn9pxOlbRaV1+rNXPd
	vudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oiDTBAxWF+JxR92xuNB7U+4Wws8ucAFlV6iiRUgRRvA=;
	b=HBlf2V18TgvYIR5xK+gEf+FH4ECpGur8cwoiVFPLsShR+k8fEXolkj8DZa0VL+y6B4
	tZm7KQdYsZEg+OXSyuikghnkjlHkocQmm2CPgI3JpGndNMBaRVyqEoDL1rUEQXuHyS96
	BlALyiEwwn/KqIhjs1k87saKiTxNgAUcy/WBzlqUHLJN6eK1D33ZX0diSOIqg7p8Uicc
	2+ZWiR0p1R96Nutnp8ZOlfe0DvXZPYMNG1nG05XuGz/NTaYCvkMjNpXYADPm5I7N1Dru
	r1PPKPe0XZlbcpK3jP34RnWmUYo4IXNG/pDTmhOx45TJw091TqIyRJ/iMT+tVCgZqZl+
	YUow==
X-Gm-Message-State: AD7BkJKhTMhcS7owohe/KIOJKlCh7Gj+Q+uqA4aM4syqq9i0OmgJcOvY1ukVUDPfp/7Ffg==
X-Received: by 10.28.0.148 with SMTP id 142mr698362wma.72.1457550188684;
	Wed, 09 Mar 2016 11:03:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm9200162wjb.33.2016.03.09.11.03.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 11:03:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 20:06:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160309190600.GG2542@jama>
References: <1457509723-25302-1-git-send-email-kai.kang@windriver.com>
	<1457509723-25302-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1457509723-25302-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] crash: add native package
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
X-List-Received-Date: Wed, 09 Mar 2016 19:03:10 -0000
X-Groupsio-MsgNum: 60430
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cfJ13FhsvNR/yOpm"
Content-Disposition: inline

--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 03:48:43PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Add crash-native package.
>=20
> * append EXTRA_OEMAKE option to find ncurses library
> * pass right install DESTDIR
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/recipe=
s-kernel/crash/crash_7.1.3.bb
> index f6934f7..e085094 100644
> --- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
> +++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
> @@ -32,6 +32,8 @@ SRC_URI[gdb.sha256sum] =3D "8070389a5dcc104eb0be483d582=
729f98ed4d761ad19cedd3f17b5
> =20
>  inherit gettext
> =20
> +BBCLASSEXTEND =3D "native"
> +
>  # crash 7.1.3 and before don't support mips64
>  COMPATIBLE_HOST =3D "^(?!mips64).*"
> =20
> @@ -40,6 +42,7 @@ EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
>                  GDB_HOST=3D"${BUILD_SYS}" \
>                  GDB_MAKE_JOBS=3D"${PARALLEL_MAKE}" \
>                  '
> +EXTRA_OEMAKE_append_class-native =3D " LDFLAGS=3D'${BUILD_LDFLAGS}'"
> =20
>  do_configure() {
>      :
> @@ -65,17 +68,25 @@ do_compile() {
>      oe_runmake ${EXTRA_OEMAKE}
>  }
> =20
> -do_install () {
> +do_install_prepend () {
>      install -d ${D}${bindir}
>      install -d ${D}/${mandir}/man8
>      install -d ${D}${includedir}/crash
> =20
> -    oe_runmake DESTDIR=3D${D} install
>      install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
>      install -m 0644 ${S}/defs.h ${D}${includedir}/crash
> -}  =20
> +}
> +
> +do_install_class-target () {
> +    oe_runmake DESTDIR=3D${D} install
> +}
> +
> +do_install_class-native () {
> +    oe_runmake DESTDIR=3D${D}${STAGING_DIR_NATIVE} install
> +}
> =20
>  RDEPENDS_${PN} +=3D "liblzma"
> +RDEPENDS_${PN}_class-native +=3D "xz-native"

Why is this needed? native builds aren't creating any packages.

>  # Causes gcc to get stuck and eat all available memory in qemuarm builds
>  # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home=
/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-=
oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./c=
ommon -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readlin=
e/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libde=
cnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo =
-MP -MT eval.o -D LOCALEDIR=3D"/usr/local/share/locale" -D CRASH_MERGE -D H=
AVE_CONFIG_H -D TUI=3D1 eval.c -quiet -dumpbase eval.c -march=3Darmv5te -mt=
humb -mthumb-interwork -mtls-dialect=3Dgnu -auxbase-strip eval.o -g -O2 -Wa=
ll -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunus=
ed-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-proto=
types -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-t=
ypes -o -
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cfJ13FhsvNR/yOpm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgdBgACgkQN1Ujt2V2gBwyngCfQl4t8R6BZR94uKbEfgOAYnRg
PQcAniCh045DVZQOljeO+xmrl9RJAOkc
=9IvX
-----END PGP SIGNATURE-----

--cfJ13FhsvNR/yOpm--
