Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6aSd-0005ry-Cw
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:37:26 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so1748011dan.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Nv5qBys77guHaFVs4ShHnvvVQFG4HQndm2b+7lagLxI=;
	b=MiaLZCqimVzL/tG7Qr7oWR0SY+TXg/KdaO0BKZz97v5BwFxR/i6F1g+qlYSmtB1H/l
	PGGEgbsXWXkEwnFPObGtFnWyIrjTbORP7BOab82VGopWO75c0HmPT9Co5D6ZptwATS7G
	Tza8N3OVWvtvZOieO/VMmbs2z5rNuvm87cqMT9XzbvbCQaPxYyK7BUNcrS1kdrFAywdZ
	uo2HtAF6qEPWB4/1I/IeAKP73dkdmlN/5zsgi9OkqWwAa6mL6GQX8vzcATyA2/BNB5pD
	lLg/gxo0MlFBzyrQhByBwJe31+VRDvz8mPlK5EcmDSPcKfotTbx341QdU86Rj7rnIFQV
	z3RQ==
X-Received: by 10.68.217.202 with SMTP id pa10mr12000304pbc.11.1360992073101; 
	Fri, 15 Feb 2013 21:21:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c8sm6906277pbq.10.2013.02.15.21.21.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 21:21:12 -0800 (PST)
Date: Sat, 16 Feb 2013 06:21:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216052110.GV3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-6-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-6-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 5/8] libunwind: add 1.1 with preliminary aarch64 patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 05:37:28 -0000
X-List-Received-Date: Sat, 16 Feb 2013 05:37:28 -0000
X-Groupsio-MsgNum: 43196
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OlucDFihBVSxvK/7"
Content-Disposition: inline

--OlucDFihBVSxvK/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:51:00AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/libunwind/files/aarch64.patch | 19 +++++++++++++=
++++++
>  meta-oe/recipes-support/libunwind/libunwind.inc       | 12 ++++++++++++
>  meta-oe/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libunwind/files/aarch64.patch
>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb

Does not build for qemuarm:

=2E./src/.libs/libunwind.so -lc -lgcc /home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/sysroots/qemuarm/usr/lib/liblzma.so -pthread
| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darm=
v5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/shr-core-branches=
/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug=
-types -fexceptions -Wall -Wsign-compare -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o .libs/Gperf-simple Gperf-simple.o  ../src/.libs/libunwind-a=
rm.so /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/libunwind/1.1-r0/libunwind-1.1/src/.libs/libunwind.so ../sr=
c/.libs/libunwind.so -lc -lgcc /home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/sysroots/qemuarm/usr/lib/liblzma.so -pthread
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add'
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add1'
| collect2: error: ld returned 1 exit status
| make[1]: *** [test-coredump-unwind] Error 1
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add'
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add1'
| collect2: error: ld returned 1 exit status
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add'
| ../src/.libs/libunwind-arm.so: undefined reference to `AO_fetch_and_add1'
| collect2: error: ld returned 1 exit status
| make[1]: *** [Gperf-trace] Error 1
| make[1]: *** [Gperf-simple] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libunwind/1.1-r0/libunwind-1.1/test=
s'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libunwind/1.1-r0/temp/l=
og.do_compile.20241 for further information)
NOTE: recipe libunwind-1.1-r0: task do_compile: Failed

Complete log:

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30215_060633.log/

>=20
> diff --git a/meta-oe/recipes-support/libunwind/files/aarch64.patch b/meta=
-oe/recipes-support/libunwind/files/aarch64.patch
> new file mode 100644
> index 0000000..9ea8d83
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/files/aarch64.patch
> @@ -0,0 +1,19 @@
> +---
> + configure.ac |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- libunwind-1.1.orig/configure.ac
> ++++ libunwind-1.1/configure.ac
> +@@ -135,11 +135,11 @@ AM_CONDITIONAL(OS_HPUX, expr x$target_os
> + AM_CONDITIONAL(OS_FREEBSD, expr x$target_os : xfreebsd >/dev/null)
> +=20
> + AC_MSG_CHECKING([for ELF helper width])
> + case "${target_arch}" in
> + (arm|hppa|ppc32|x86|sh) use_elf32=3Dyes; AC_MSG_RESULT([32]);;
> +-(ia64|ppc64|x86_64)    use_elf64=3Dyes; AC_MSG_RESULT([64]);;
> ++(ia64|ppc64|x86_64|aarch64)    use_elf64=3Dyes; AC_MSG_RESULT([64]);;
> + (mips)                 use_elfxx=3Dyes; AC_MSG_RESULT([xx]);;
> + *)                     AC_MSG_ERROR([Unknown ELF target: ${target_arch}=
])
> + esac
> + AM_CONDITIONAL(USE_ELF32, [test x$use_elf32 =3D xyes])
> + AM_CONDITIONAL(USE_ELF64, [test x$use_elf64 =3D xyes])
> diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/re=
cipes-support/libunwind/libunwind.inc
> new file mode 100644
> index 0000000..f028766
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
> +HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3fced11d6df719b47505837a51c16=
ae5"
> +
> +SRC_URI =3D "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-=
${PV}.tar.gz"
> +
> +inherit autotools
> +
> +EXTRA_OECONF_arm =3D "--enable-debug-frame"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe=
/recipes-support/libunwind/libunwind_1.1.bb
> new file mode 100644
> index 0000000..dd6b63c
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> @@ -0,0 +1,6 @@
> +require libunwind.inc
> +
> +SRC_URI +=3D "file://aarch64.patch"
> +
> +SRC_URI[md5sum] =3D "fb4ea2f6fbbe45bf032cd36e586883ce"
> +SRC_URI[sha256sum] =3D "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab=
302d41a8aee8d09a"
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OlucDFihBVSxvK/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfF0YACgkQN1Ujt2V2gBxlVACgpHBFCSStdx28UxGLTxFh6+yk
JbwAnjS8ZgvjS4JiDmmTD477rLUEPAMm
=GtNJ
-----END PGP SIGNATURE-----

--OlucDFihBVSxvK/7--
