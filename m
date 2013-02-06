Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U3aPg-0002bH-RB; Thu, 07 Feb 2013 23:58:02 +0100
Received: by mail-ia0-f169.google.com with SMTP id j5so3558595iaf.28
	for <multiple recipients>; Thu, 07 Feb 2013 14:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=s20B6aF9yY/9cBZChDWmiWy7rfqaua6ygPhT6ABIOLI=;
	b=vI0Qr84J1uIo3dlgL+JQ2PebeRUkuNqoU1HFp7SI+eDARU1doIJ8SEVNY7BW0TiaGU
	u0nlykGdQF84S3h1k3uDENjOBFYsrXCdvxaByLYsdsSr9SgsCj9KTlumbipF2gRDqm1L
	rzLhU00sF6+0mbtyrAa5GV10o/dnrM1m+cR9o7EwknCeaUu7biSQTkgfYuGALRuCu68c
	2qj2yTCxa/YbOtN6+uQxuMlZMty1S0SDrUyJkfVvzjCF5r8Xbetev8dZ08WrmkTbzFRK
	EtMnxmqD5NMtlUB0p9d8Qp6I+PUYF4xWYzMk/Ftvzt1O4hThsnJ1ZiMYPWiMdKbE6+e2
	Cpgw==
X-Received: by 10.50.222.195 with SMTP id qo3mr9511657igc.14.1360185735898;
	Wed, 06 Feb 2013 13:22:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eg7sm5115244igc.7.2013.02.06.13.22.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 13:22:14 -0800 (PST)
Date: Wed, 6 Feb 2013 22:22:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130206212207.GD3271@jama>
References: <20130206093803.C4B3920AB@opal>
MIME-Version: 1.0
In-Reply-To: <20130206093803.C4B3920AB@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Matthew McClintock : libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
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
X-List-Received-Date: Thu, 07 Feb 2013 22:58:23 -0000
X-Groupsio-MsgNum: 43040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ul2mxMk0z4RYCW0d"
Content-Disposition: inline

--Ul2mxMk0z4RYCW0d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 09:38:03AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 52c94978992d9084d685d4999064a8cee35220d1
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D52c94978992d9084d685d4999064a8cee35220d1
>=20
> Author: Matthew McClintock <msm@freescale.com>
> Date:   Tue Feb  5 11:46:46 2013 -0600
>=20
> libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc

This is pulled to world build on arm too and fails there:

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   --s=
ysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qe=
muarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -Wextra=
 -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/includ=
e -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wextra =
-Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib/../=
include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I. -DC=
ONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_nhm.c
| pfmlib_amd64.c: In function 'pfm_amd64_detect':
| pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
| pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
| pfmlib_intel_x86.c: In function 'pfm_intel_x86_detect':
| pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
| pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
| pfmlib_intel_x86_arch.c: In function 'pfm_intel_x86_arch_init':
| pfmlib_intel_x86_arch.c:55:3: error: impossible constraint in 'asm'
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   --s=
ysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qe=
muarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -Wextra=
 -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/includ=
e -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wextra =
-Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib/../=
include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I. -DC=
ONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_wsm.c
| make[1]: *** [pfmlib_intel_x86_arch.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [pfmlib_amd64.o] Error 1
| make[1]: *** [pfmlib_intel_x86.o] Error 1

> Signed-off-by: Matthew McClintock <msm@freescale.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |   26 +++++++++++++++++++++=
+++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-k=
ernel/libpfm/libpfm4_4.3.0.bb
> new file mode 100644
> index 0000000..460029f
> --- /dev/null
> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Monitoring tools exploiting the performance monitoring even=
ts"
> +DESCRIPTION =3D "This package provides a library, called libpfm4 which i=
s used to develop \
> +monitoring tools exploiting the performance monitoring events such as th=
ose \
> +provided by the Performance Monitoring Unit (PMU) of modern processors."
> +HOMEPAGE =3D "http://perfmon2.sourceforge.net/"
> +BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D144822&atid=
=3D759953&source=3Dnavbar"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de488f3bd4424e308e2e399cb99c=
788"
> +
> +SECTION =3D "devel"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/project/perfmon2/libpfm4/l=
ibpfm-4.3.0.tar.gz"
> +
> +SRC_URI[md5sum] =3D "0ab272dbdbb759b852ba8bd06db030ef"
> +SRC_URI[sha256sum] =3D "a23eb9affbff279e13563a39317c0ad71c4de28908d4243c=
8bc109138430cc3b"
> +
> +EXTRA_OEMAKE =3D "DESTDIR=3D\"${D}\" PREFIX=3D\"${prefix}\" LIBDIR=3D\"$=
{libdir}\" LDCONFIG=3D\"true\""
> +EXTRA_OEMAKE_append_powerpc =3D " ARCH=3D\"powerpc\""
> +EXTRA_OEMAKE_append_powerpc64 =3D " ARCH=3D\"powerpc\" BITMODE=3D\"64\""
> +
> +S =3D "${WORKDIR}/libpfm-${PV}"
> +
> +do_install () {
> +	oe_runmake install
> +}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ul2mxMk0z4RYCW0d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESyX8ACgkQN1Ujt2V2gBzC7gCfR/zKwUnDOsdaK7nq9UFKdedU
680An2EshD8sseYpc5gYNpb/YUgXyzA4
=QgLb
-----END PGP SIGNATURE-----

--Ul2mxMk0z4RYCW0d--
