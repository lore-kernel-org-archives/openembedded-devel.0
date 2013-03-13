Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UFjtj-0005ww-2a; Wed, 13 Mar 2013 12:31:08 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so368532dam.7
	for <multiple recipients>; Wed, 13 Mar 2013 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9z2DG/mUfQt4phS4E67DWV5JFd9ADvtTjwTCNPAsOis=;
	b=IC0wF1if59P9XPvGwbs3/wmn4pHjZv5d64vXygGiWy6HFHuPXulCgdBlA5WZjUv52I
	C4LlyTBIEQ2r5sJGWWaAPOlWBcZGN6zFvicbTQoEA7OdYwf9K685PyNAVlYWTLMhbw+p
	UIyBNkU8I0iGaTyi1ydvX2QXybKLHcdGhZMWLRkJgyQqmmQEGxd0wRlSADum8Zhv4aAn
	09yjneC1xbMA8JQeq/UMT97q4oyF36TTPaVwzVZEdssnXyl4KrF6zYt+Sag09KG8DxMa
	OIZA2p1zZa9HS0qxy+Ig+naWKkQSb42yiySa+QDXUx/bYsRZ25s5aLRdND9efsUgvgyu
	AH2g==
X-Received: by 10.68.134.133 with SMTP id pk5mr37313824pbb.209.1363173259919; 
	Wed, 13 Mar 2013 04:14:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl4sm29142398pbc.31.2013.03.13.04.14.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:14:19 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:14:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313111410.GB3260@jama>
References: <20130305131419.393BC503AA@opal>
MIME-Version: 1.0
In-Reply-To: <20130305131419.393BC503AA@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : qemu: Upgrade to 1.4.0 release
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
X-List-Received-Date: Wed, 13 Mar 2013 11:31:10 -0000
X-Groupsio-MsgNum: 43513
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 01:14:19PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f479201fffda617e3530967a75ab350739574b4b
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df479201fffda617e3530967a75ab350739574b4b
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Thu Feb 28 23:01:51 2013 -0800
>=20
> qemu: Upgrade to 1.4.0 release
>=20
> Tested qemu on x86-64 target and qemu-native
> no obvious problems seen in testing
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Hi, when building target 1.4.0 for qemuarm it fails:

|   AR    libqemustub.a
|   AR    libqemuutil.a
|   LINK  fsdev/virtfs-proxy-helper
| /usr/bin/ld: stubs/.libs/arch-query-cpu-def.o: Relocations in generic ELF=
 (EM: 40)
| /usr/bin/ld: stubs/.libs/arch-query-cpu-def.o: Relocations in generic ELF=
 (EM: 40)
| /usr/bin/ld: stubs/.libs/arch-query-cpu-def.o: Relocations in generic ELF=
 (EM: 40)
| /usr/bin/ld: stubs/.libs/arch-query-cpu-def.o: Relocations in generic ELF=
 (EM: 40)
| /usr/bin/ld: stubs/.libs/arch-query-cpu-def.o: Relocations in generic ELF=
 (EM: 40)
| stubs/.libs/arch-query-cpu-def.o: could not read symbols: File in wrong f=
ormat
| collect2: ld returned 1 exit status
| make: *** [libcacard.la] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qemu/1.4.0-r0/temp/log.=
do_compile.5598 for further information)
NOTE: recipe qemu-1.4.0-r0: task do_compile: Failed
ERROR: Task 11376 (/home/jenkins/oe/shr-core-branches/shr-core/openembedded=
-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile) failed with exi=
t code '1'

Whole log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30312_110444.log

>=20
> ---
>=20
>  .../qemu/files/fix-configure-checks.patch          |   10 +++++-----
>  .../qemu/files/relocatable_sdk.patch               |   16 ++++++++------=
--
>  meta/recipes-devtools/qemu/qemu.inc                |    2 +-
>  .../qemu/{qemu_1.3.1.bb =3D> qemu_1.4.0.bb}          |    6 ++----
>  4 files changed, 16 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch =
b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> index ef77c92..294c220 100644
> --- a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> +++ b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> @@ -8,14 +8,14 @@ Patch from Paul Eggleton, Comments by RP 28/11/10
> =20
>  Upstream-Status: Inappropriate [embedded specific]
> =20
> -Index: qemu-1.2.0/configure
> +Index: qemu-1.4.0/configure
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qemu-1.2.0.orig/configure	2012-09-05 07:03:06.000000000 -0700
> -+++ qemu-1.2.0/configure	2012-09-06 13:55:07.007793823 -0700
> -@@ -281,6 +281,7 @@
> +--- qemu-1.4.0.orig/configure	2013-02-15 15:05:35.000000000 -0800
> ++++ qemu-1.4.0/configure	2013-02-25 13:44:17.915273181 -0800
> +@@ -286,6 +286,7 @@
>   QEMU_CFLAGS=3D"-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
>   QEMU_CFLAGS=3D"-D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOUR=
CE $QEMU_CFLAGS"
> - QEMU_INCLUDES=3D"-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/fpu"
> + QEMU_INCLUDES=3D"-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
>  +QEMU_CFLAGS=3D"$QEMU_CFLAGS $CFLAGS"
>   if test "$debug_info" =3D "yes"; then
>       CFLAGS=3D"-g $CFLAGS"
> diff --git a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch b/met=
a/recipes-devtools/qemu/files/relocatable_sdk.patch
> index 0a01a8a..774a49c 100644
> --- a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
> +++ b/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
> @@ -6,11 +6,11 @@ the new path (4096 is the maximum path length in Linux).
> =20
>  Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> =20
> -Index: qemu-1.2.0/i386.ld
> +Index: qemu-1.4.0/ldscripts/i386.ld
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qemu-1.2.0.orig/i386.ld
> -+++ qemu-1.2.0/i386.ld
> -@@ -8,7 +8,7 @@ SECTIONS
> +--- qemu-1.4.0.orig/ldscripts/i386.ld	2013-02-15 15:05:35.000000000 -0800
> ++++ qemu-1.4.0/ldscripts/i386.ld	2013-02-28 22:55:36.138816418 -0800
> +@@ -8,7 +8,7 @@
>   {
>     /* Read-only sections, merged into text segment: */
>     . =3D 0x60000000 + SIZEOF_HEADERS;
> @@ -19,11 +19,11 @@ Index: qemu-1.2.0/i386.ld
>     .hash          : { *(.hash)		}
>     .dynsym        : { *(.dynsym)		}
>     .dynstr        : { *(.dynstr)		}
> -Index: qemu-1.2.0/x86_64.ld
> +Index: qemu-1.4.0/ldscripts/x86_64.ld
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qemu-1.2.0.orig/x86_64.ld
> -+++ qemu-1.2.0/x86_64.ld
> -@@ -6,7 +6,7 @@ SECTIONS
> +--- qemu-1.4.0.orig/ldscripts/x86_64.ld	2013-02-15 15:05:35.000000000 -0=
800
> ++++ qemu-1.4.0/ldscripts/x86_64.ld	2013-02-28 22:55:36.138816418 -0800
> +@@ -6,7 +6,7 @@
>   {
>     /* Read-only sections, merged into text segment: */
>     . =3D 0x60000000 + SIZEOF_HEADERS;
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index eb60d43..5616a06 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -32,7 +32,7 @@ SRC_URI_append_class-nativesdk =3D "\
>      file://relocatable_sdk.patch \
>      "
> =20
> -EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --disable=
-werror --disable-vnc-tls --audio-drv-list=3Doss,alsa --audio-card-list=3Da=
c97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-=
system-pixman --disable-smartcard"
> +EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --disable=
-werror --disable-vnc-tls --audio-drv-list=3Doss,alsa --audio-card-list=3Da=
c97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-=
system-pixman"
> =20
>  EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${@get_qemu_target_lis=
t(d)} --disable-werror --disable-vnc-tls \
>  				--disable-curl \
> diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devt=
ools/qemu/qemu_1.4.0.bb
> similarity index 62%
> rename from meta/recipes-devtools/qemu/qemu_1.3.1.bb
> rename to meta/recipes-devtools/qemu/qemu_1.4.0.bb
> index c04b2be..009cd78 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.3.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
> @@ -4,7 +4,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e1=
5a37fa47e15a72fbac \
>                      file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
> =20
>  SRC_URI_prepend =3D "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "5dbc6c22f47efca71dfaae0dd80dcf9e"
> -SRC_URI[sha256sum] =3D "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb=
43b56bdacaca0eaf"
> -
> -PR =3D "r0"
> +SRC_URI[md5sum] =3D "78f13b774814b6b7ebcaf4f9b9204318"
> +SRC_URI[sha256sum] =3D "066297ed77408fb7588889c271a85cf3c259ad55c9393159=
88e6062d7708eda8"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAX4IACgkQN1Ujt2V2gBwAhACfd3er0YqNmt5psb4wbplQgwWZ
9/cAn1uw0VJkzefWwihqVh4KtsPQN5Wf
=2lcH
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
