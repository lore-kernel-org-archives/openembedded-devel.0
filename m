Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8E665F0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:07:53 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so390364wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rr8JunZip/lmbB8C4gfhamUjLeKsWgd+ZMIJm/2pBH8=;
	b=w/uXyoYM4ublRqZpMhblBk0pjIcD7Br0mBB6ditHS30tfDM2czi0d32bxLua79+937
	5lZlpzKJ2o2ppzW+QwCehAm2RsA1/qV/GC8yOhjBOv3UI3FqQEUvHJDG0RtC3BOFnCCY
	WdgAgfw8NS3wv+/kyMQku57ID1ESrLiR2ikWf2luFxhFxIUeqy0mi6ST5ypOu+JfIj9I
	YLaNeRK3LQvKHhwmVlIo62QEXOPeaQJJUE0/ShmuBC3z+cD5QUbWdH69hPTynbpz37EE
	llhHBpKv74JSkwt1EKt1RtrNyNfmZzw66nm+2ZEZTD6ym4CasF4CgJD05wi3NwNr1LWf
	p9FA==
X-Received: by 10.180.212.12 with SMTP id ng12mr5234378wic.9.1405670872088;
	Fri, 18 Jul 2014 01:07:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l2sm12287734wjw.31.2014.07.18.01.07.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 01:07:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 10:08:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140718080802.GM2433@jama>
References: <1405669276-4940-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1405669276-4940-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] numctl: add recipe
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
X-List-Received-Date: Fri, 18 Jul 2014 08:07:57 -0000
X-Groupsio-MsgNum: 51051
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y8IEA2AKDLXNckrV"
Content-Disposition: inline

--Y8IEA2AKDLXNckrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 03:41:15PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> It consists of a numactl program to run other programs with a specific NU=
MA
> policy and a libnuma to do allocations with NUMA policy in applications.

Does it need separate .inc file? With one version per recipe we're not
using .inc very much.

Also please move files from "files" to "numactl" for faster lookup.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../numactl/files/Fix-the-test-output-format.patch |   59 ++++++++++++++=
++++++
>  meta-oe/recipes-support/numactl/files/Makefile     |    7 +++
>  .../numactl/files/fix-null-pointer.patch           |   28 ++++++++++
>  meta-oe/recipes-support/numactl/files/run-ptest    |    9 +++
>  meta-oe/recipes-support/numactl/numactl.inc        |   40 +++++++++++++
>  meta-oe/recipes-support/numactl/numactl_2.0.9.bb   |    6 ++
>  6 files changed, 149 insertions(+)
>  create mode 100644 meta-oe/recipes-support/numactl/files/Fix-the-test-ou=
tput-format.patch
>  create mode 100644 meta-oe/recipes-support/numactl/files/Makefile
>  create mode 100644 meta-oe/recipes-support/numactl/files/fix-null-pointe=
r.patch
>  create mode 100755 meta-oe/recipes-support/numactl/files/run-ptest
>  create mode 100644 meta-oe/recipes-support/numactl/numactl.inc
>  create mode 100644 meta-oe/recipes-support/numactl/numactl_2.0.9.bb
>=20
> diff --git a/meta-oe/recipes-support/numactl/files/Fix-the-test-output-fo=
rmat.patch b/meta-oe/recipes-support/numactl/files/Fix-the-test-output-form=
at.patch
> new file mode 100644
> index 0000000..8c309a4
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/files/Fix-the-test-output-format.pa=
tch
> @@ -0,0 +1,59 @@
> +[PATCH] Fix the test output format
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + test/regress  |    6 +++---
> + test/regress2 |    9 ++++-----
> + 2 files changed, 7 insertions(+), 8 deletions(-)
> +
> +diff --git a/test/regress b/test/regress
> +index 05eff5b..10d72f7 100755
> +--- a/test/regress
> ++++ b/test/regress
> +@@ -73,6 +73,7 @@ probe_hardware()
> + 	if [ $numnodes -lt 2 ] ; then
> + 	    echo "need at least two nodes with at least $NEEDPAGES each of"
> + 	    echo "free memory for mempolicy regression tests"
> ++	    echo "FAIL: numa regress"
> + 	    exit 1
> + 	fi
> + }
> +@@ -206,10 +207,9 @@ main()
> + 	rm A B
> +=20
> + 	if [ "$EXIT" =3D 0 ] ; then
> +-		echo '=3D=3D=3D=3D=3D=3D=3D=3DSUCCESS'
> ++		echo 'PASS: numactl regress'
> + 	else
> +-		echo '=3D=3D=3D=3D=3D=3D=3D=3DFAILURE'
> +-		exit 1
> ++		echo 'FAIL: numactl regress'
> + 	fi
> + }
> +=20
> +diff --git a/test/regress2 b/test/regress2
> +index 6a254fa..9c97943 100755
> +--- a/test/regress2
> ++++ b/test/regress2
> +@@ -6,12 +6,11 @@ VALGRIND=3D${VALGRIND:-}
> + export LD_LIBRARY_PATH=3D`pwd`/..
> +=20
> + T() {
> +-       echo "$@"=20
> +-       if ! $VALGRIND "$@" ;  then
> +-	  echo	$1 FAILED!!!!
> +-	  exit 1
> ++       if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
> ++	  echo	"FAIL: $1"
> ++       else
> ++	  echo "PASS: $1"
> +        fi
> +-       echo
> + }
> +=20
> + # various tests
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-support/numactl/files/Makefile b/meta-oe/rec=
ipes-support/numactl/files/Makefile
> new file mode 100644
> index 0000000..6489f83
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/files/Makefile
> @@ -0,0 +1,7 @@
> +.PHONY: regress1 regress2
> +
> +regress1:
> +	cd test ; ./regress
> +
> +regress2:
> +	cd test ; ./regress2
> diff --git a/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch=
 b/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch
> new file mode 100644
> index 0000000..6a29606
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch
> @@ -0,0 +1,28 @@
> +[PATCH] return 0 if distance_table is NULL
> +
> +Upstream-Status: Pending
> +
> +read_distance_table() maybe return 0, but distance_table is not set,
> +if distance_table is used, and will lead to SEGFAULT
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + distance.c |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/distance.c b/distance.c
> +index 4a26972..c6ca021 100755
> +--- a/distance.c
> ++++ b/distance.c
> +@@ -113,6 +113,8 @@ int numa_distance(int a, int b)
> + 		int err =3D read_distance_table();
> + 		if (err < 0)
> + 			return 0;
> ++		if (!distance_table)
> ++			return 0;
> + 	}
> + 	return distance_table[a * distance_numnodes + b];
> + }
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-support/numactl/files/run-ptest b/meta-oe/re=
cipes-support/numactl/files/run-ptest
> new file mode 100755
> index 0000000..6f67ec2
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/files/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +make regress1
> +make regress2
> +if  numademo -t -e 10M; then
> +	echo "PASS: numademo"
> +else
> +	echo "FAIL: numademo"
> +fi
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl.inc b/meta-oe/recipe=
s-support/numactl/numactl.inc
> new file mode 100644
> index 0000000..21a8123
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl.inc
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "Development package for building Applications that use numa"
> +DESCRIPTION =3D "Simple NUMA policy support. It consists of a numactl pr=
ogram \
> +to run other programs with a specific NUMA policy and a libnuma to do \
> +allocations with NUMA policy in applications."
> +LICENSE =3D "GPL-2.0 & LGPL-2.1"
> +SECTION =3D "apps"
> +RDEPENDS_${PN} =3D "perl"
> +
> +inherit autotools-brokensep ptest
> +
> +SRC_URI =3D "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV=
}.tar.gz \
> +	   file://fix-null-pointer.patch \
> +	   file://Fix-the-test-output-format.patch \
> +	   file://Makefile \
> +	   file://run-ptest \
> +          "
> +
> +# ARM does not currently support NUMA
> +COMPATIBLE_HOST =3D "^((?!arm).*)$"
> +
> +do_install() {
> +        oe_runmake DESTDIR=3D${D} prefix=3D${D}/usr libdir=3D${D}/${libd=
ir} install
> +	#remove the empty man2 directory
> +	rm -r ${D}${mandir}/man2
> +}
> +
> +do_install_ptest() {
> +	#install tests binaries
> +        local test_binaries=3D"checkaffinity checktopology distance	\
> +		ftok mbind_mig_pages migrate_pages move_pages mynode	\
> +		nodemap pagesize prefered printcpu randmap realloc_test	\
> +		regress regress2 runltp shmtest tbitmap tshared"
> +
> +	[ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
> +	for i in $test_binaries; do
> +		install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
> +	done
> +	install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
> +}
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb b/meta-oe/r=
ecipes-support/numactl/numactl_2.0.9.bb
> new file mode 100644
> index 0000000..1a103cd
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
> @@ -0,0 +1,6 @@
> +require ${PN}.inc
> +
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D19;endline=3D32;md5=3D56=
44cc3851cb2499f6c48e52fe198bd9"
> +SRC_URI[md5sum] =3D "136685c8eaf9d6569c351fe1d453b30c"
> +SRC_URI[sha256sum] =3D "9ca033e6c14c0f26c20379b0cf9299429fd5a354a79c3c78=
80fd41ef69f7751c"
> +
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y8IEA2AKDLXNckrV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPI1eIACgkQN1Ujt2V2gBxeUACfTHkIPglphbRXJFyHKnqxcZZR
sRMAnA7uB52BG4IKyJnxZxE8sEgodfPy
=/6jP
-----END PGP SIGNATURE-----

--Y8IEA2AKDLXNckrV--
