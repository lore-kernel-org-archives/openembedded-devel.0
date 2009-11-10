Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lgirdwood@gmail.com>) id 1N7sqJ-0000F5-HQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:41:18 +0100
Received: by ewy5 with SMTP id 5so138942ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 07:39:57 -0800 (PST)
Received: by 10.213.100.161 with SMTP id y33mr294625ebn.2.1257867597669;
	Tue, 10 Nov 2009 07:39:57 -0800 (PST)
Received: from ?10.200.221.6? (host81-136-218-57.in-addr.btopenworld.com
	[81.136.218.57])
	by mx.google.com with ESMTPS id 28sm1988771eyg.38.2009.11.10.07.39.53
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Nov 2009 07:39:56 -0800 (PST)
From: Liam Girdwood <lrg@slimlogic.co.uk>
To: Phil Blundell <pb@reciva.com>, Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1257777637.3583.271.camel@odin>
References: <1257777637.3583.271.camel@odin>
Date: Tue, 10 Nov 2009 15:39:53 +0000
Message-ID: <1257867593.3641.357.camel@odin>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: lgirdwood@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] core: add glibc-2.10.1
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
X-List-Received-Date: Tue, 10 Nov 2009 15:41:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Phil, Khem,

Do I have your Ack's so I can push for others to test ?

Thanks

Liam

On Mon, 2009-11-09 at 14:40 +0000, Liam Girdwood wrote:
> Add glibc-2.10.1. Based on glibc-2.9.bb.
> 
> Signed-off-by: Liam Girdwood <lrg@slimlogic.co.uk>
> ---
>  conf/checksums.ini                                 |   12 ++
>  .../glibc-2.9-enable-binutils-2.2.patch            |   35 +++++
>  recipes/glibc/glibc-initial_2.10.1.bb              |    6 +
>  recipes/glibc/glibc_2.10.1.bb                      |  150 ++++++++++++++++++++
>  4 files changed, 203 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
>  create mode 100644 recipes/glibc/glibc-initial_2.10.1.bb
>  create mode 100644 recipes/glibc/glibc_2.10.1.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2e5f2b1..6b8f20f 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -8766,6 +8766,10 @@ sha256=4224a522ac4ee0fd89eb337e7505e280dfb05e2fe1ad44339ba8874081c0451a
>  md5=fc62e989cf31d015f31628609fc3757a
>  sha256=098baa84c74af5b21d27ec6e8ba6f1a393de88327cefbcd9e90c9b4edda9a36c
>  
> +[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-2.10.1.tar.bz2]
> +md5=ee71dedf724dc775e4efec9b823ed3be
> +sha256=cbad3e637eab613184405a87a2bf08a41991a0e512a3ced60d120effc73de667
> +
>  [http://www.kegel.com/crosstool/crosstool-0.43/patches/glibc-2.3.6/glibc-fp-byteorder.patch]
>  md5=c89aac92d100761a767b9d5619fe582f
>  sha256=3033d84fd9a62d20a8cb0d42645d7cd5a28d2d108afcb4cc2d89db3dc1e328df
> @@ -8790,6 +8794,10 @@ sha256=07de78810a5320d696792b67131c4cf3d6654aee015a6b74820d66fb00799000
>  md5=99536b508af988e7cc6275944d12b491
>  sha256=27ac255ee701036191118f7a6a4191b24741f5909dccfc9eec4ab611a39e182f
>  
> +[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-2.10.1.tar.bz2]
> +md5=8ef88560ec608d5923ee05eb5f0e15ea
> +sha256=0fa72d1dd06a30642d3bb20a659f4ed0f4af54a205d7102896b68169b38676dc
> +
>  [ftp://ftp.gnu.org/gnu/glibc/glibc-linuxthreads-2.2.5.tar.gz]
>  md5=c766a79a51668d7fa33f175a249655b4
>  sha256=c027824ee6593a838e0883bdd4bf8bd455b3dcf4ff0aa77fe82452819d882f47
> @@ -8830,6 +8838,10 @@ sha256=3e481996259af87c3581da23481970a27de679e3c87cfa9a5a59751cd20c7b44
>  md5=7d5d86031cb15403e4d246658209ee81
>  sha256=824c97b83f1ec2894ee0e824db6d542c40b978d2f6c4364c7411777e44b15a64
>  
> +[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-2.10.1.tar.bz2]
> +md5=816b2d48a95ddc23b27fea03a1996443
> +sha256=b1f1ec9720036a3a33598b8478eef102535444a083d5b5813a6981ed74ab4071
> +
>  [ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/2.16/glibmm-2.16.2.tar.bz2]
>  md5=408054366f0acc01014f4c4af2304da5
>  sha256=f033f6f39c32fc17ecce63087e41408671a3a43d698c83de2528af3fc7276d28
> diff --git a/recipes/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch b/recipes/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
> new file mode 100644
> index 0000000..09200dd
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.patch
> @@ -0,0 +1,35 @@
> +--- glibc-2.9.orig/configure.in	2009-10-22 15:38:13.000000000 +0200
> ++++ glibc-2.9/configure.in	2009-10-22 15:37:33.000000000 +0200
> +@@ -844,10 +844,10 @@
> + # Accept binutils 2.13 or newer.
> + AC_CHECK_PROG_VER(AS, $AS, --version,
> + 		  [GNU assembler.* \([0-9]*\.[0-9.]*\)],
> +-		  [2.1[3-9]*], AS=: critic_missing="$critic_missing as")
> ++		  [2.1[3-9]* | 2.2* ], AS=: critic_missing="$critic_missing as")
> + AC_CHECK_PROG_VER(LD, $LD, --version,
> + 		  [GNU ld.* \([0-9][0-9]*\.[0-9.]*\)],
> +-		  [2.1[3-9]*], LD=: critic_missing="$critic_missing ld")
> ++		  [2.1[3-9]* | 2.2* ], LD=: critic_missing="$critic_missing ld")
> + 
> + # We need the physical current working directory.  We cannot use the
> + # "pwd -P" shell builtin since that's not portable.  Instead we try to
> +--- glibc-2.9.orig/configure	2009-02-26 22:28:17.000000000 +0100
> ++++ glibc-2.9/configure	2009-10-22 15:43:11.000000000 +0200
> +@@ -4531,7 +4531,7 @@
> +   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
> +-    2.1[3-9]*)
> ++    2.1[3-9]* | 2.2*)
> +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
> +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
> + 
> +@@ -4594,7 +4594,7 @@
> +   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
> +-    2.1[3-9]*)
> ++    2.1[3-9]* | 2.2*)
> +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
> +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
> + 
> diff --git a/recipes/glibc/glibc-initial_2.10.1.bb b/recipes/glibc/glibc-initial_2.10.1.bb
> new file mode 100644
> index 0000000..d662970
> --- /dev/null
> +++ b/recipes/glibc/glibc-initial_2.10.1.bb
> @@ -0,0 +1,6 @@
> +require glibc_${PV}.bb
> +require glibc-initial.inc
> +
> +do_configure_prepend () {
> +	unset CFLAGS
> +}
> diff --git a/recipes/glibc/glibc_2.10.1.bb b/recipes/glibc/glibc_2.10.1.bb
> new file mode 100644
> index 0000000..83613be
> --- /dev/null
> +++ b/recipes/glibc/glibc_2.10.1.bb
> @@ -0,0 +1,150 @@
> +require glibc.inc
> +
> +ARM_INSTRUCTION_SET = "arm"
> +
> +PACKAGES_DYNAMIC = "libc6*"
> +RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
> +
> +# the -isystem in bitbake.conf screws up glibc do_stage
> +BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> +TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
> +
> +
> +FILESPATHPKG =. "glibc-2.4:"
> +
> +GLIBC_ADDONS ?= "ports,nptl,libidn"
> +
> +GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN"
> +
> +#
> +# For now, we will skip building of a gcc package if it is a uclibc one
> +# and our build is not a uclibc one, and we skip a glibc one if our build
> +# is a uclibc build.
> +#
> +# See the note in gcc/gcc_3.4.0.oe
> +#
> +
> +python __anonymous () {
> +    import bb, re
> +    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
> +    if uc_os:
> +        raise bb.parse.SkipPackage("incompatible with target %s" %
> +                                   bb.data.getVar('TARGET_OS', d, 1))
> +}
> +
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +
> +SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
> +	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-${PV}.tar.bz2 \
> +	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-${PV}.tar.bz2 \
> +	   file://nscd-init.patch;patch=1;pnum=0 \
> +           file://arm-memcpy.patch;patch=1 \
> +           file://arm-longlong.patch;patch=1 \
> +           file://fhs-linux-paths.patch;patch=1 \
> +           file://dl-cache-libcmp.patch;patch=1 \
> +           file://ldsocache-varrun.patch;patch=1 \
> +           file://nptl-crosscompile.patch;patch=1 \
> +	   file://glibc-check_pf.patch;patch=1;pnum=0 \
> +           file://ldd-unbash.patch;patch=1 \
> +	   file://glibc-arm-IO-acquire-lock-fix.diff;patch=1 \
> +	   file://generic-bits_select.h \
> +	   file://generic-bits_types.h \
> +	   file://generic-bits_typesizes.h \
> +	   file://generic-bits_time.h \
> +           file://etc/ld.so.conf \
> +           file://generate-supported.mk \
> +           file://march-i686.patch;patch=1;pnum=0 \
> +           file://arm-lowlevellock-include-tls.patch;patch=1 \
> +           file://glibc-2.9-enable-binutils-2.2.patch;patch=1 \
> +           "
> +
> +# Build fails on sh3 and sh4 without additional patches
> +SRC_URI_append_sh3 = " file://no-z-defs.patch;patch=1"
> +SRC_URI_append_sh4 = " file://no-z-defs.patch;patch=1"
> +
> +#powerpc patches to add support for soft-float
> +SRC_URI_append_powerpc= " file://powerpc-sqrt-hack.diff;patch=1"
> +
> +S = "${WORKDIR}/glibc-${PV}"
> +B = "${WORKDIR}/build-${TARGET_SYS}"
> +
> +EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> +	        --without-cvs --disable-profile --disable-debug --without-gd \
> +		--enable-clocale=gnu \
> +	        --enable-add-ons=${GLIBC_ADDONS} \
> +		--with-headers=${STAGING_INCDIR} \
> +		--without-selinux \
> +		${GLIBC_EXTRA_OECONF}"
> +
> +EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
> +
> +do_munge() {
> +	# Integrate ports and libidn into tree
> +	mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
> +	mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
> +
> +	# Ports isn't really working... Fix it
> +	# Some of this is rather dirty, but it seems to be the only
> +	# quick way to get this cruft to compile
> +	rm -rf ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
> +	ln -s nptl ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
> +	cp ${S}/nptl/sysdeps/pthread/bits/sigthread.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> +	cp ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> +	cp ${S}/sysdeps/wordsize-32/bits/wordsize.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> +	cp ${WORKDIR}/generic-bits_select.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/select.h
> +	cp ${WORKDIR}/generic-bits_types.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/types.h
> +	cp ${WORKDIR}/generic-bits_typesizes.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/typesizes.h
> +	cp ${WORKDIR}/generic-bits_time.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/time.h
> +	# Copy in generic stuff for not yet implemented headers
> +	for i in ${S}/bits/*.h; do
> +		F=`basename $i`
> +		[ "$F" = "local_lim.h" ] && continue
> +		[ "$F" = "errno.h" ] && continue
> +		test -e ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/$F || test -e ${S}/ports/sysdeps/arm/bits/$F || test -e ${S}/sysdeps/unix/sysv/linux/bits/$F || test -e ${S}/sysdeps/ieee754/bits/$F || cp $i ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> +	done
> +	# This is harmful; we need to get the one from nptl/sysdeps/pthreads
> +	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/libc-lock.h
> +	# Obsoleted by sysdeps/arm/{fpu,eabi}/bits/fenv.h
> +	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/fenv.h
> +	# Obsoleted by sysdeps/gnu/bits/utmp.h
> +	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/utmp.h
> +}
> +
> +addtask munge before do_patch after do_unpack
> +
> +
> +do_configure () {
> +# /var/db was not included to FHS
> +	sed -i s:/var/db/nscd:/var/run/nscd: ${S}/nscd/nscd.h
> +# override this function to avoid the autoconf/automake/aclocal/autoheader
> +# calls for now
> +# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
> +# version check and doesn't really help with anything
> +	if [ -z "`which rpcgen`" ]; then
> +		echo "rpcgen not found.  Install glibc-devel."
> +		exit 1
> +	fi
> +	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> +	CPPFLAGS="" oe_runconf
> +}
> +
> +rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
> +	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
> +	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
> +
> +do_compile () {
> +	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
> +	unset LDFLAGS
> +	base_do_compile
> +	(
> +		cd ${S}/sunrpc/rpcsvc
> +		for r in ${rpcsvc}; do
> +			h=`echo $r|sed -e's,\.x$,.h,'`
> +			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
> +		done
> +	)
> +}
> +
> +require glibc-stage.inc
> +
> +require glibc-package.bbclass




