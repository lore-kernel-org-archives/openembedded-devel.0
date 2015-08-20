Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5D19673E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 00:41:51 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZSDvT-000253-MV from Joe_MacDonald@mentor.com ;
	Wed, 19 Aug 2015 17:41:51 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 17:41:51 -0700
Received: by burninator (Postfix, from userid 1000)	id 1A3555875C9; Wed, 19
	Aug 2015 20:41:03 -0400 (EDT)
Date: Wed, 19 Aug 2015 20:41:03 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150820004102.GJ11392@mentor.com>
References: <1439078910-14318-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1439078910-14318-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Armin Kuster <akuster@mvista.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] netmap v2: add new package
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
X-List-Received-Date: Thu, 20 Aug 2015 00:41:53 -0000
X-Groupsio-MsgNum: 56815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline

--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Armin,

[[meta-networking][PATCH] netmap v2: add new package] On 15.08.09 (Sun 05:3=
8) Armin Kuster wrote:

> From: Armin Kuster <akuster@mvista.com>
>=20
> this adds netmap, the fast packet I/O framework
> http://info.iet.unipi.it/~luigi/netmap/
>=20
> v2:
> fix config opt typo
> fix compile on non x86 targets
> exclude ppc and arm from builds do to issues with kernel headers

I was working on merging this one and ran into a number of failures, can
you take another look at it?

The first I hit was netmap-modules fails to find makefile_fixup.patch
because it is referenced in netmap.inc which is included in
netmap-modules_git.bb, but makefile_fixup.patch lives in netmap/ and
that doesn't show up in the default search path.  I tried moving netmap/
to files/ so it would always get picked up but hit another failure, so
then I moved the makefile_fixup.patch reference to netmap_git.bb only
(obviously I didn't spend any time looking at whether it makes sense to
apply the patch to both recipes).

The failure I hit is actually in Martin's world build too.  I grabbed
one of the relevant chunks and put it on Pastebin for you
(http://pastebin.com/kjYShFD6) so you don't have to search through the
whole log.

-J.

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../netmap/files/makefile_fixup.patch              | 79 ++++++++++++++++=
++++++
>  .../recipes-kernel/netmap/netmap-modules_git.bb    | 51 ++++++++++++++
>  meta-networking/recipes-kernel/netmap/netmap.inc   | 17 +++++
>  .../recipes-kernel/netmap/netmap_git.bb            | 34 ++++++++++
>  4 files changed, 181 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/netmap/files/makefile_=
fixup.patch
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_=
git.bb
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap.inc
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.p=
atch b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> new file mode 100644
> index 0000000..e838653
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> @@ -0,0 +1,79 @@
> +The makefile assumes building locally.
> +
> +Upstream Status: Inappropriate [Native]
> +
> +The configure is not auto-make based
> +
> +Signed-of-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: LINUX/netmap.mak.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/LINUX/netmap.mak.in
> ++++ b/LINUX/netmap.mak.in
> +@@ -12,10 +12,8 @@ SRCDIR:=3D@SRCDIR@
> + # The following commands are needed to build the modules as out-of-tree,
> + # in fact the kernel sources path must be specified.
> +=20
> +-PWD ?=3D $(CURDIR)
> +-
> + # Additional compile flags (e.g. header location)
> +-EXTRA_CFLAGS :=3D -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/.=
=2E/sys/dev -DCONFIG_NETMAP
> ++EXTRA_CFLAGS :=3D -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev=
 -DCONFIG_NETMAP
> + EXTRA_CFLAGS +=3D -Wno-unused-but-set-variable
> + EXTRA_CFLAGS +=3D $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s=
|tr a-z A-Z))
> +=20
> +Index: LINUX/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/LINUX/configure
> ++++ b/LINUX/configure
> +@@ -311,34 +311,6 @@ reset_tests() {
> + 	NEXTTEST=3D1
> + }
> +=20
> +-# run_tests: run all accumulated tests and exec the pertinent
> +-#   success/failure actions for each one.
> +-run_tests() {
> +-	local t=3D 	# prevent -EOF to eat the make TAB
> +-	cat > $TMPDIR/Makefile <<-EOF
> +-		ifneq (\$(KERNELRELEASE),)
> +-		obj-m :=3D $TESTOBJS
> +-		else
> +-		S_DRIVERS :=3D $(drv print)
> +-		all: \$(S_DRIVERS:%=3Dget-%)
> +-		$t	\$(MAKE) -C $ksrc M=3D\$\$PWD $kopts
> +-
> +-		-include $TOPDIR/drivers.mak
> +-	EOF
> +-	for d in $(drv print); do
> +-		cat >> $TMPDIR/Makefile <<-EOF
> +-			get-$d:
> +-			$t	[ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if \$($d-dst),\$($d-d=
st),.)
> +-		EOF
> +-	done
> +-	echo endif >> $TMPDIR/Makefile
> +-	(
> +-		cd $TMPDIR
> +-		make -k -j $(grep -c processor /proc/cpuinfo)
> +-	) >> config.log
> +-	eval "$TESTPOSTPROC"
> +-}
> +-
> + configh=3Dnetmap_linux_config.h
> + # succes/failure actions are expected to write some macros
> + # in netma_linux_config.h. The following functions can be
> +@@ -555,7 +527,6 @@ configuration. Please check 'config.log'
> +=20
> + reset_tests
> + add_test true broken_buildsystem < /dev/null
> +-run_tests
> +=20
> + drvname2config() {
> + 	local name=3D$1
> +@@ -1087,7 +1058,6 @@ cat > $configh <<-EOF
> + EOF
> +=20
> + # the TESTPOSTPROC script will add macros to $configh
> +-run_tests
> +=20
> + define DRIVER_SUFFIX \"$drvsuffix\"
> +=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> new file mode 100644
> index 0000000..00d334f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -0,0 +1,51 @@
> +require netmap.inc
> +
> +DEPENDS =3D "virtual/kernel"
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +inherit module
> +
> +CLEANBROKEN =3D "1"
> +
> +export INSTALL_MOD_DIR=3D"kernel/netmap-modules"
> +
> +EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILDDIR} \
> +                --kernel-sources=3D${STAGING_KERNEL_DIR} \
> +                --install-mod-path=3D${D} \
> +                --driver-suffix=3D"-netmap" \
> +                "
> +
> +LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
> +LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> +
> +do_configure () {
> +    cd ${S}/LINUX
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_configure_append () {
> +    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
> +#define NETMAP_LINUX_HAVE_HRTIMER_MODE_REL
> +#define NETMAP_LINUX_HAVE_HRTIMER_FORWARD_NOW
> +#define NETMAP_LINUX_HAVE_PHYS_ADDR_T
> +#define NETMAP_LINUX_HAVE_ACCESS_ONCE
> +#define NETMAP_LINUX_HAVE_NETDEV_OPS
> +#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
> +#define NETMAP_LINUX_HAVE_INIT_NET
> +#define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
> +#define NETMAP_LINUX_HAVE_TX_SKB_SHARING
> +#define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
> +#define NETMAP_LINUX_HAVE_PERNET_OPS_ID
> +#define NETMAP_LINUX_TIMER_RTYPE static enum hrtimer_restart
> +EOF
> +}
> +
> +do_compile () {
> +    cd ${S}/LINUX
> +    oe_runmake=20
> +}
> +
> +do_install () {
> +    cd ${S}/LINUX
> +    oe_runmake install
> +}
> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-netw=
orking/recipes-kernel/netmap/netmap.inc
> new file mode 100644
> index 0000000..9083c69
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "netmap and VALE - very fast packet I/O from userspace (Free=
BSD/Linux)"
> +DESCRIPTION=3D "NETMAP is a framework for very fast packet I/O from user=
space.  VALE is an equally fast in-kernel software switch using the netmap =
API.  Both are implemented as a single kernel module for FreeBSD and Linux,=
 and can deal with line rate on real or emulated 10 Gbit ports."
> +SECTION =3D "networking"
> +HOMEPAGE =3D "http://code.google.com/p/netmap/"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=3Df6=
4f2b172fe6903ff7b6272c6edde588"
> +
> +SRCREV =3D "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
> +PV =3D "master+git${SRCPV}"
> +
> +SRC_URI =3D "git://github.com/luigirizzo/netmap.git"
> +SRC_URI +=3D "file://makefile_fixup.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST =3D '(x86_64|i.86|mips|arm).*-linux'
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-n=
etworking/recipes-kernel/netmap/netmap_git.bb
> new file mode 100644
> index 0000000..0ee19d4
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -0,0 +1,34 @@
> +require netmap.inc
> +
> +DEPENDS =3D "netmap-modules"
> +
> +EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILDDIR} \
> +                --kernel-sources=3D${STAGING_KERNEL_DIR} \
> +                --no-drivers \
> +                --disable-generic \
> +                --prefix=3D${prefix} \
> +                --destdir=3D${D} \
> +                --cc=3D'${CC}' \
> +                --ld=3D'${LD}' \
> +                "
> +
> +do_fetch[depends] +=3D "netmap-modules:do_fetch"
> +
> +do_configure () {
> +    cd ${S}/LINUX
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    cd ${S}/LINUX
> +    make apps
> +}
> +
> +do_install () {
> +    cd ${S}/LINUX
> +    make install-apps DESTDIR=3D${D}
> +}
> +
> +FILES_${PN} +=3D "${bindir}"
> +RDEPENDS_${PN} =3D "kernel-module-netmap"
> +RRECOMMENDS_${PN} =3D "kernel-module-netmap"
--=20
-Joe MacDonald.
:wq

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV1SIbAAoJEEn8ffcsOfaWq7QIAKHH2O4QfbUa46rPkX6kzAyR
y6qsLlorVqUgNcTp6weGMFxGZYxNjjn7rghQLahYZUhQnu4kRWo9nkK3V3Uoj3/7
G+LdVoCuvxoPV5C+gsq1gALhx1g8oLufCzqU01tHXjwCqkRnkA7io30/brNxNQuc
sEP1dFzOjwu7LPoKTnk4hH9MjLy/8OBuqBA/anDtrS6rrRszI7/vuifukr6huINR
E+CPxOLyt+uVyUEVV+sb1itRO1kXDcGC7OYwbN1gHpwHJUPkmdvMAFW4HNtFBkcS
oUmHfDx3uMXIBR9eeYHRIK2yGqNT84Pi2IM2O5jM0k2Qs6av3i5X9j80oE7pghY=
=vrUg
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--
