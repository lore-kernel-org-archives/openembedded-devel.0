Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7235965C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 20:59:17 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so134386109wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OchIO7WOj8H9HivsTsae5NfmJhqN4OVRhDI288HQJcw=;
	b=EgoONvC+VFRK5dGrIrW7B5oaP3DNt7jmzOnq2TaXUZ8/SSBU8lh+NIddPcmbql70Yz
	QG66JxSIRp2GbekXChnsNy4aIImwo3UcOfFxjgSCFe89CRmBbFuRzk3LSzZhNfE+JKo2
	Bn1fiQr0JOI2SMtn8TvFVbnzgiwvudvrjbMOvankJurvZON4RzU8PUbLMwOG5gaUrxpG
	BSMA7InnvQBlsx0xdTsMWXzTDpIOLw1QOIq3PgUWXMu2ux12J6uRylNBrPnZYgH7f6sR
	sMnDTQEVJDLI67p2RX7M9GvFkGxqqaOh96s/tb8T1Zuto3KwSeebC/Dcn++tSLpbcuFk
	yQ1A==
X-Received: by 10.180.84.102 with SMTP id x6mr30319336wiy.75.1441745957318;
	Tue, 08 Sep 2015 13:59:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v6sm6723215wjf.13.2015.09.08.13.59.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 13:59:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 23:00:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150908210004.GF2381@jama>
References: <1441740521-11801-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441740521-11801-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH][V2] netmap: fix multiple build issues.
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
X-List-Received-Date: Tue, 08 Sep 2015 20:59:19 -0000
X-Groupsio-MsgNum: 57269
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline

--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 12:28:41PM -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> V2: Fix "Upstream-Status" typos

Again, this belongs under ---

> updated to latest version to get kernel 4.1 support
>=20
> update makefile patch
> fixed printf type issue
> Fixed manual config options
> Readme checksum changed, don't know why. must got it wrong to begin with.
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  ...1-testmmap-fix-compile-issue-with-gcc-5.x.patch | 33 ++++++++++++++++=
+++++
>  .../netmap/files/makefile_fixup.patch              | 34 ++++++++++++++++=
+-----
>  .../recipes-kernel/netmap/netmap-modules_git.bb    |  8 ++++-
>  meta-networking/recipes-kernel/netmap/netmap.inc   |  4 +--
>  .../recipes-kernel/netmap/netmap_git.bb            |  1 +
>  5 files changed, 69 insertions(+), 11 deletions(-)
>  create mode 100644 meta-networking/recipes-kernel/netmap/files/0001-test=
mmap-fix-compile-issue-with-gcc-5.x.patch
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fi=
x-compile-issue-with-gcc-5.x.patch b/meta-networking/recipes-kernel/netmap/=
files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
> new file mode 100644
> index 0000000..ea36b1c
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compi=
le-issue-with-gcc-5.x.patch
> @@ -0,0 +1,33 @@
> +Upstream-Status: Pending
> +
> +From c81bf54d6eb870286662a11d3b4a994717c47696 Mon Sep 17 00:00:00 2001
> +From: Armin Kuster <akuster808@gmail.com>
> +Date: Tue, 8 Sep 2015 05:36:27 -0700
> +Subject: [PATCH] testmmap: fix compile issue with gcc 5.x
> +
> +this fixes:
> +examples/testmmap.c:540:10: error: format '%ld' expects argument of type=
 'long int', but argument 3 has type 'ssize_t {aka const int}' [-Werror=3Df=
ormat=3D]
> +|    printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
> +|           ^
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +---
> + examples/testmmap.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/examples/testmmap.c b/examples/testmmap.c
> +index d7f6acc..934489a 100644
> +--- a/examples/testmmap.c
> ++++ b/examples/testmmap.c
> +@@ -537,7 +537,7 @@ do_if()
> + 	for (i =3D 0; i < 5; i++)
> + 		printf("spare1[%d]  %u\n", i, nifp->ni_spare1[i]);
> + 	for (i =3D 0; i < (nifp->ni_tx_rings + nifp->ni_rx_rings + 2); i++)
> +-		printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
> ++		printf("ring_ofs[%d] %zd\n", i, nifp->ring_ofs[i]);
> + }
> +=20
> + struct netmap_ring *
> +--=20
> +2.3.5
> +
> diff --git a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.p=
atch b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> index e838653..b050bf0 100644
> --- a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> +++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> @@ -10,24 +10,24 @@ Index: LINUX/netmap.mak.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- a/LINUX/netmap.mak.in
>  +++ b/LINUX/netmap.mak.in
> -@@ -12,10 +12,8 @@ SRCDIR:=3D@SRCDIR@
> +@@ -12,10 +12,9 @@ SRCDIR:=3D@SRCDIR@
>   # The following commands are needed to build the modules as out-of-tree,
>   # in fact the kernel sources path must be specified.
>  =20
>  -PWD ?=3D $(CURDIR)
> --
> +=20
>   # Additional compile flags (e.g. header location)
>  -EXTRA_CFLAGS :=3D -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/.=
=2E/sys/dev -DCONFIG_NETMAP
>  +EXTRA_CFLAGS :=3D -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev=
 -DCONFIG_NETMAP
>   EXTRA_CFLAGS +=3D -Wno-unused-but-set-variable
> - EXTRA_CFLAGS +=3D $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s=
|tr a-z A-Z))
> + EXTRA_CFLAGS +=3D $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s=
|tr a-z- A-Z_))
>  =20
>  Index: LINUX/configure
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- a/LINUX/configure
>  +++ b/LINUX/configure
> -@@ -311,34 +311,6 @@ reset_tests() {
> - 	NEXTTEST=3D1
> +@@ -349,52 +349,6 @@ reset_tests() {
> + 	EOF
>   }
>  =20
>  -# run_tests: run all accumulated tests and exec the pertinent
> @@ -48,28 +48,46 @@ Index: LINUX/configure
>  -		cat >> $TMPDIR/Makefile <<-EOF
>  -			get-$d:
>  -			$t	[ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if \$($d-dst),\$($d-d=
st),.)
> +-			$t	touch get-$d
>  -		EOF
>  -	done
>  -	echo endif >> $TMPDIR/Makefile
> +-	{
> +-		cat <<-EOF
> +-#######################################################################=
#######
> +-## BEGIN RUNNING TESTS: $(date)
> +-#######################################################################=
#######
> +-## Makefile:
> +-		EOF
> +-		cat $TMPDIR/Makefile
> +-		cat <<-EOF
> +-#######################################################################=
#######
> +-		EOF
> +-	} >> config.log
>  -	(
>  -		cd $TMPDIR
>  -		make -k -j $(grep -c processor /proc/cpuinfo)
>  -	) >> config.log
>  -	eval "$TESTPOSTPROC"
> +-	cat >> config.log <<-EOF
> +-#######################################################################=
#######
> +-## END RUNNING TESTS: $(date)
> +-#######################################################################=
#######
> +-	EOF
>  -}
>  -
>   configh=3Dnetmap_linux_config.h
>   # succes/failure actions are expected to write some macros
>   # in netma_linux_config.h. The following functions can be
> -@@ -555,7 +527,6 @@ configuration. Please check 'config.log'
> -=20
> +@@ -619,7 +573,6 @@ configuration. Please check 'config.log'
>   reset_tests
> + rm -f drivers.mak
>   add_test true broken_buildsystem < /dev/null
>  -run_tests
>  =20
>   drvname2config() {
>   	local name=3D$1
> -@@ -1087,7 +1058,6 @@ cat > $configh <<-EOF
> +@@ -1280,7 +1233,6 @@ cat > $configh <<-EOF
>   EOF
>  =20
>   # the TESTPOSTPROC script will add macros to $configh
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 00d334f..bb0db9d 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -36,7 +36,13 @@ do_configure_append () {
>  #define NETMAP_LINUX_HAVE_TX_SKB_SHARING
>  #define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
>  #define NETMAP_LINUX_HAVE_PERNET_OPS_ID
> -#define NETMAP_LINUX_TIMER_RTYPE static enum hrtimer_restart
> +#define NETMAP_LINUX_VIRTIO_FUNCTIONS
> +#define NETMAP_LINUX_VIRTIO_FREE_PAGES
> +#define NETMAP_LINUX_VIRTIO_GET_VRSIZE
> +#define NETMAP_LINUX_TIMER_RTYPE enum hrtimer_restart
> +#define NETMAP_LINUX_VIRTIO_MULTI_QUEUE
> +#define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
> +#define NETMAP_LINUX_HAVE_E1000E_DOWN2
>  EOF
>  }
> =20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-netw=
orking/recipes-kernel/netmap/netmap.inc
> index 9083c69..ab33e76 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap.inc
> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
> @@ -4,9 +4,9 @@ SECTION =3D "networking"
>  HOMEPAGE =3D "http://code.google.com/p/netmap/"
>  LICENSE =3D "GPLv2+"
> =20
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=3Df6=
4f2b172fe6903ff7b6272c6edde588"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=3D56=
ae0b9c7ba0476ab9098de94c2714d6"
> =20
> -SRCREV =3D "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
> +SRCREV =3D "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
>  PV =3D "master+git${SRCPV}"
> =20
>  SRC_URI =3D "git://github.com/luigirizzo/netmap.git"
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-n=
etworking/recipes-kernel/netmap/netmap_git.bb
> index 0ee19d4..f15a626 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -11,6 +11,7 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --cc=3D'${CC}' \
>                  --ld=3D'${LD}' \
>                  "
> +SRC_URI +=3D "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
> =20
>  do_fetch[depends] +=3D "netmap-modules:do_fetch"
> =20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXvTFMACgkQN1Ujt2V2gBz6XwCfaLsyLGfI4bZprQVp/9h1R+qE
IJAAn2BwPuVLclqmB6eDnMB54WCj8R0z
=fVBz
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
