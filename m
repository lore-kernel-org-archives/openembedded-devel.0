Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D6EBB7214B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:51:18 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so1129189wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hDUpoP6TwD64Q4kkVeO+gf1Qs/sMLoBwyo4odZRb24Y=;
	b=im4wS5/NpLr7RTfR0ILIBSRYLW4M6DjivjYHNX++VFymEq/FYqWpaegIseRmpio/Vg
	z1QVheF++3GLKRhT//f1TBDM+vt87Zxzw0waKPfH3JNNvFRE8CVhB6yJ0hXjq00uFA1Q
	3uRWYwYFjRwGIKKteBgwoNELvJQDBQDsygZWmaW7CDWj+4tiUIRAuPDQl0FdxK55eLUK
	Sa8+KLP2+jDst7TFjVx0yDYQUSJkg2BwKI9idVBJT+wQ+RKMLkx4JspGsuicVgikpuO4
	ya9br7YNEdbyvuJ3Oo+2HowKuHVxu6J0wj0AZ4U1rsAf2RsnbWmsnr8+IVe2Jrf/Uue2
	A2ag==
X-Received: by 10.180.126.104 with SMTP id mx8mr6914515wib.21.1416412278649;
	Wed, 19 Nov 2014 07:51:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	iz19sm2734530wic.8.2014.11.19.07.51.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:51:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:51:18 +0100
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20141119155118.GQ3315@jama>
References: <1412064513-15996-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1412064513-15996-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] acpitests: update to 20140828 release
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
X-List-Received-Date: Wed, 19 Nov 2014 15:51:22 -0000
X-Groupsio-MsgNum: 52943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NOl3kBTBh+CNLogO"
Content-Disposition: inline

--NOl3kBTBh+CNLogO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 11:08:33AM +0300, Fathi Boudra wrote:
> update md5sums and refresh patches
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  v2 changes: rebased on top of Khem changes (add0ba4)
>=20
>  .../acpica/acpitests/aapits-linux.patch            |  4 +--
>  .../acpica/acpitests/aapits-makefile.patch         | 36 +++++++++++++---=
------
>  ...acpitests_20140424.bb =3D> acpitests_20140828.bb} | 10 +++---
>  3 files changed, 29 insertions(+), 21 deletions(-)
>  rename meta-oe/recipes-extended/acpica/{acpitests_20140424.bb =3D> acpit=
ests_20140828.bb} (74%)
>=20
> diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch=
 b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
> index 116761d..7c5d6b0 100644
> --- a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
> +++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
> @@ -326,8 +326,8 @@ diff -urN acpica-unix2-20130626/tests/aapits/Makefile=
 acpica-unix2-20130626-aapi
>  --- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 12:48:29.0000=
00000 -0700
>  +++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	2013-07-25 15:17:=
09.309236422 -0600
>  @@ -194,7 +194,7 @@
> - CFLAGS+=3D -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_EXEC_APP -D_MUL=
TI_THREADED -Wstrict-prototypes -I../../source/include=20
> -=20
> + CFLAGS+=3D -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_APITS -DACPI_EX=
EC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include
> +
>  =20
>  -acpiexec : $(patsubst %.c,%.o, $(SRCS))
>  +$(PROG) : $(patsubst %.c,%.o, $(SRCS))
> diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.pa=
tch b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
> index d38501b..4d9e997 100644
> --- a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
> +++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
> @@ -8,19 +8,27 @@ Upstream-status: Unknown
>  diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140=
325/tests/aapits/Makefile
>  --- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.6836=
36794 -0600
>  +++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	2014-04-05 15:10:=
57.879184598 -0600
> -@@ -20,6 +20,7 @@
> - 	../../source/components/hardware/hwxface.c \
> +@@ -16,6 +16,7 @@
> + 	atosxfwrap.c \
> + 	osunixxf.c \
> + 	../../source/common/ahids.c \
> ++	../../source/common/ahuuids.c \
>   	../../source/common/cmfsize.c \
>   	../../source/common/getopt.c \
> -+	../../source/common/ahids.c \
> - 	../../source/components/debugger/dbcmds.c \
> - 	../../source/components/debugger/dbconvert.c \
> - 	../../source/components/debugger/dbdisply.c \
> -@@ -154,6 +155,7 @@
> - 	../../source/components/tables/tbfadt.c \
> - 	../../source/components/tables/tbfind.c \
> - 	../../source/components/tables/tbinstal.c \
> -+	../../source/components/tables/tbdata.c \
> - 	../../source/components/tables/tbprint.c \
> - 	../../source/components/tables/tbutils.c \
> - 	../../source/components/tables/tbxface.c \
> + 	../../source/components/hardware/hwtimer.c \
> +@@ -174,6 +175,7 @@
> + 	../../source/components/utilities/utexcep.c \
> + 	../../source/components/utilities/utfileio.c \
> + 	../../source/components/utilities/utglobal.c \
> ++	../../source/components/utilities/uthex.c \
> + 	../../source/components/utilities/utids.c \
> + 	../../source/components/utilities/utinit.c \
> + 	../../source/components/utilities/utlock.c \
> +@@ -189,6 +191,7 @@
> + 	../../source/components/utilities/utstate.c \
> + 	../../source/components/utilities/utstring.c \
> + 	../../source/components/utilities/uttrack.c \
> ++	../../source/components/utilities/utuuid.c \
> + 	../../source/components/utilities/utxface.c \
> + 	../../source/components/utilities/utxferror.c \
> + 	../../source/components/utilities/utxfinit.c \
> diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb b/meta=
-oe/recipes-extended/acpica/acpitests_20140828.bb
> similarity index 69%
> rename from meta-oe/recipes-extended/acpica/acpitests_20140424.bb
> rename to meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> index 7e145bb..889c00b 100644
> --- a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
> +++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> @@ -11,10 +11,10 @@ SRC_URI =3D "https://acpica.org/sites/acpica/files/ac=
pitests-unix-${PV}.tar.gz;nam
>             file://aapits-linux.patch \
>             file://aapits-makefile.patch \
>      "
> -SRC_URI[acpitests.md5sum] =3D "bfc399cecb21e9491d362d8e480b2689"
> -SRC_URI[acpitests.sha256sum] =3D "e7d7ff638872543909b38c2498e88958251ee6=
ce4d22bc13d4e3925771212c0e"
> -SRC_URI[acpica.md5sum] =3D "733532f005fba5d1c5344440651b13d1"
> -SRC_URI[acpica.sha256sum] =3D "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d=
41dcf00e19d702cdf751bbc"
> +SRC_URI[acpitests.md5sum] =3D "db9d6fdaa8e3eb101d700ee5ba4938ed"
> +SRC_URI[acpitests.sha256sum] =3D "e576c74bf1bf1c9f7348bf9419e05c8acfece7=
105abcdc052e66670c7af2cf00"
> +SRC_URI[acpica.md5sum] =3D "6f05f0d10166a1b1ff6107f3d1cdf1e5"
> +SRC_URI[acpica.sha256sum] =3D "01d8867656c5ba41dec307c4383ce676196ad4281=
ac2c9dec9f5be5fac6d888e"
> =20
>  S =3D "${WORKDIR}/acpitests-unix-${PV}"

Please check why it fails in world builds with:

ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/acpitests/20140828-=
r0/temp/log.do_compile.13998)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/acpitests/20140828-r0/temp/log.do_compile=
=2E13998
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 CC=3Darm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mt=
humb-interwork OPT_CFLAGS=3D-Wall
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atexec.o atexec.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atmain.o atmain.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atinit.o atinit.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atmemory.o atmemory.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o athardware.o athardware.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o attable.o attable.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atnamespace.o atnamespace.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  -O2 -=
pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG -D_CONSOL=
E -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../.=
=2E/source/include   -c -o atresource.o atresource.c
| In file included from ../../source/include/platform/acenv.h:172:0,
|                  from ../../source/include/acpi.h:56,
|                  from atcommon.h:119,
|                  from atmain.c:118:
| ../../source/include/platform/aclinux.h:166:20: fatal error: string.h: No=
 such file or directory
|  #include <string.h>
|                     ^
| compilation terminated.
| In file included from ../../source/include/platform/acenv.h:172:0,
|                  from ../../source/include/acpi.h:56,
|                  from atcommon.h:119,
|                  from atnamespace.c:116:
| ../../source/include/platform/aclinux.h:166:20: fatal error: string.h: No=
 such file or directory
|  #include <string.h>
|                     ^
> =20
> --=20
> 2.1.1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NOl3kBTBh+CNLogO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsvHYACgkQN1Ujt2V2gBy/UACgqCvwGeM+vMaAdIARj7BrLnMZ
DKcAn2Tjzkymy7JTLXpQutpiIDa1OOFz
=qkaN
-----END PGP SIGNATURE-----

--NOl3kBTBh+CNLogO--
