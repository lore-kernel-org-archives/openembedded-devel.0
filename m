Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NjRHq-0001RY-0Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 06:56:57 +0100
Received: by iwn9 with SMTP id 9so2110791iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2010 21:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4ODXwi2dWmCkCjrDQq+h1i5w6x/iyBHtT57OKKwqE/4=;
	b=DylFhGOWs2w9jx83fXqxN4SWdnZCz5G1G31eKwoRkn0gGBnba6ROwxKo2LwxaMysmb
	VhICO5Ey5r0Tp5bfi5ZYDm/yAnQcww0kBSYBeAhIESIIrhVKsR0LY2UAs4ZJxBUmhWS/
	K10G4xeDUjFQWtwGDjYzR8cmJphThpOPOEl5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=mMHL2Pv/mLb9ZU6YFcf92CFJ2kr/yNI752wV+8sAorCoYFNHAUbjbNteoLV/hpalrI
	C0De8RwP5cUgLpI8Wo65V2O9WDDFIWbhmXeqIk0j1s+PdxG41s/7dtrv8ebb0CSRprJ+
	L1HSMasXg+b9cqMEjkLi6KgizkOWUuybtBkbg=
MIME-Version: 1.0
Received: by 10.231.174.147 with SMTP id t19mr83700ibz.74.1266818049803; Sun, 
	21 Feb 2010 21:54:09 -0800 (PST)
In-Reply-To: <1266766306-28625-1-git-send-email-rep.dot.nop@gmail.com>
References: <1266766306-28625-1-git-send-email-rep.dot.nop@gmail.com>
Date: Sun, 21 Feb 2010 21:54:09 -0800
Message-ID: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] uClibc: rename main include
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
X-List-Received-Date: Mon, 22 Feb 2010 05:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 21, 2010 at 7:31 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> preparatory work, no code changes.

preparing for what ?

>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =A0recipes/uclibc/bfin-uclibc_svn.bb | =A0 =A02 +-
> =A0recipes/uclibc/uclibc-old.inc =A0 =A0 | =A0186 +++++++++++++++++++++++=
++++++++++++++
> =A0recipes/uclibc/uclibc.inc =A0 =A0 =A0 =A0 | =A0186 -------------------=
------------------
> =A0recipes/uclibc/uclibc_0.9.28.bb =A0 | =A0 =A02 +-
> =A0recipes/uclibc/uclibc_0.9.29.bb =A0 | =A0 =A02 +-
> =A0recipes/uclibc/uclibc_0.9.30.1.bb | =A0 =A02 +-
> =A0recipes/uclibc/uclibc_0.9.30.2.bb | =A0 =A02 +-
> =A0recipes/uclibc/uclibc_0.9.30.bb =A0 | =A0 =A02 +-
> =A0recipes/uclibc/uclibc_git.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/uclibc/uclibc_nptl.bb =A0 =A0 | =A0 =A02 +-
> =A010 files changed, 194 insertions(+), 194 deletions(-)
> =A0create mode 100644 recipes/uclibc/uclibc-old.inc
> =A0delete mode 100644 recipes/uclibc/uclibc.inc
>
> diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-ucli=
bc_svn.bb
> index 80efd26..2d5c90a 100644
> --- a/recipes/uclibc/bfin-uclibc_svn.bb
> +++ b/recipes/uclibc/bfin-uclibc_svn.bb
> @@ -9,7 +9,7 @@
> =A0UCLIBC_BASE ?=3D "0.9.29"
> =A0PV =3D "${UCLIBC_BASE}+svnr${SRCPV}"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
> =A0PROVIDES_append_bfin =3D " virtual/${TARGET_PREFIX}libc-for-gcc "
>
> diff --git a/recipes/uclibc/uclibc-old.inc b/recipes/uclibc/uclibc-old.in=
c
> new file mode 100644
> index 0000000..a2332e9
> --- /dev/null
> +++ b/recipes/uclibc/uclibc-old.inc
> @@ -0,0 +1,186 @@
> +DESCRIPTION =3D "C library for embedded systems"
> +LICENSE =3D "LGPL"
> +SECTION =3D "libs"
> +PRIORITY =3D "required"
> +INC_PR =3D "r33"
> +#
> +# For now, we will skip building of a gcc package if it is a uclibc one
> +# and our build is not a uclibc one, and we skip a glibc one if our buil=
d
> +# is a uclibc build.
> +#
> +# See the note in gcc/gcc_3.4.0.oe
> +#
> +
> +python __anonymous () {
> + =A0 =A0import bb, re
> + =A0 =A0uc_os =3D (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, =
1)) !=3D None)
> + =A0 =A0if not uc_os:
> + =A0 =A0 =A0 =A0raise bb.parse.SkipPackage("incompatible with target %s"=
 %
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.=
data.getVar('TARGET_OS', d, 1))
> +}
> +
> +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> +PROVIDES +=3D "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, =
1) !=3D 'yes']}"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> + =A0 =A0 =A0 =A0 =A0virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-=
headers ncurses-native pax-utils-native"
> +RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> +
> +# Blackfin needs a wrapper around ld
> +#DEPENDS_append_bfin =3D " elf2flt "
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +PARALLEL_MAKE =3D ""
> +
> +PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thr=
ead-db"
> +
> +LEAD_SONAME =3D "libc.so"
> +
> +# The last line (gdb and lib1) is for uclinux-uclibc builds
> +uclibc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcry=
pt-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libintl*.so.* ${base_=
libdir}/libintl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libnsl*.so.* ${base_l=
ibdir}/libnsl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libresolv*.so.* ${bas=
e_libdir}/libresolv-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/ld*.so.* ${base_libd=
ir}/ld-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libc*.so.* ${base_lib=
dir}/libuClibc-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libdl*.so.* ${base_l=
ibdir}/libdl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libm*.so.* ${base_lib=
dir}/libm-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libutil*.so.* ${base=
_libdir}/libutil-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libpthread*.so.* ${ba=
se_libdir}/libpthread-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/librt*.so.* ${base_l=
ibdir}/librt-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/libc.gdb ${libdir}/libc $=
{base_libdir}/lib1.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +FILES_${PN} =3D "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir} ${datadir}/zoneinfo ${libdir}/=
locale"
> +FILES_ldd =3D "${bindir}/ldd"
> +FILES_uclibc-dev_append =3D " ${libdir}/*.o ${libdir}/*_nonshared.a"
> +FILES_uclibc-utils =3D "${bindir} ${sbindir}"
> +FILES_uclibc-utils-dbg +=3D "${bindir}/.debug ${sbindir}/.debug"
> +FILES_uclibc-gconv =3D "${libdir}/gconv"
> +FILES_uclibc-thread-db =3D "/lib/libthread_db*"
> +RPROVIDES_uclibc-dev +=3D "libc-dev virtual-libc-dev"
> +
> +#
> +# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
> +# build, it does not need to be unpacked, but we can't inhibit the unpac=
king
> +# in the current build system.
> +#
> +UCLIBC_LOCALE_FILE =3D "uClibc-locale-030818.tgz"
> +UCLIBC_LOCALE_FILE_arm =3D "uClibc-locale-030818.arm.tgz"
> +UCLIBC_LOCALE_URI =3D "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_F=
ILE}"
> +UCLIBC_LOCALE_URI_arm =3D "http://wiki.openembedded.net/dl/uclibc-locale=
/${UCLIBC_LOCALE_FILE}"
> +
> +SRC_URI =3D "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d=
, 1) !=3D 'yes']} \
> + =A0 =A0 =A0 =A0 =A0file://uClibc.config \
> + =A0 =A0 =A0 =A0 =A0 http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz=
2;name=3DuClibc-${PV} \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_AR=
CH' in
> +# the CFLAGS (for when building the utils).
> +OEMAKE_NO_CC =3D "'STRIPTOOL=3Dtrue' 'LD=3D${LD}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 'LOCALE_DATA_FILENAME=3D${UCLIBC_LOCALE_FIL=
E}'"
> +EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} 'CC=3D${CC}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 'HOSTCFLAGS=3D-I${STAGING_INCDIR_NATIVE}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARCH=3D`grep TARGET_ARCH ${S}/.config|sed -=
e 's/TARGET_ARCH=3D//g'`"
> +EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
> +
> +KERNEL_SOURCE =3D "${STAGING_INCDIR}"
> +KERNEL_HEADERS =3D "${STAGING_INCDIR}"
> +
> +# Lets munge this via siteinfo.bbclass as well:
> +# ARCH_BIG_ENDIAN=3Dy
> +# ARCH_WANTS_BIG_ENDIAN=3Dy
> +# ARCH_WANTS_LITTLE_ENDIAN is not set
> +
> +# How to enable verbose logs:
> +#export VERBOSE=3D"1"
> +
> +configmangle =3D 's,^KERNEL_SOURCE=3D.*,KERNEL_SOURCE=3D"${KERNEL_SOURCE=
}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^KERNEL_HEADERS=3D.*,KERNEL_HEADERS=3D"${=
KERNEL_HEADERS}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^RUNTIME_PREFIX=3D.*,RUNTIME_PREFIX=3D"/"=
,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^DEVEL_PREFIX=3D.*,DEVEL_PREFIX=3D"/${pre=
fix}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PATH=3D.*,SHARED_LIB_L=
OADER_PATH=3D"/lib",; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PREFIX=3D.*,SHARED_LIB=
_LOADER_PREFIX=3D"/lib",; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=3Dy=
,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_=
LOCALE=3Dy,;"][bb.data.getVar("USE_NLS", d, 1) =3D=3D "yes"]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_=
GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mi=
ps', 'mipsel', 'avr32']]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
> +
> +CFLAGS :=3D "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> +
> +python () {
> + =A0 =A0 =A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.data.setVar('configmangle_append', ' s,^=
HAS_FPU=3Dy,# HAS_FPU is not set,;', d)
> +}
> +
> +uclibcbuild_do_patch() {
> + =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
> + =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
> +
> + =A0 =A0 =A0 ${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, =
1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.ge=
tVar('USE_NLS', d, 1) !=3D 'yes']}
> +}
> +
> +python do_patch () {
> + =A0 =A0 =A0 bb.build.exec_func('base_do_patch', d)
> + =A0 =A0 =A0 bb.build.exec_func('uclibcbuild_do_patch', d)
> +}
> +
> +do_configure() {
> + =A0 =A0 =A0 rm -f ${S}/.config
> +
> + =A0 =A0 =A0 # For uClibc 0.9.29, OpenEmbedded splits the uClibc.config =
in two parts:
> + =A0 =A0 =A0 # uClibc.machine and uClibc.distro. So, if they exist use t=
hem, otherwise
> + =A0 =A0 =A0 # use a uClibc.config
> + =A0 =A0 =A0 if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.d=
istro ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.machine ###" >${S}/merged.=
config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.machine >>${S}/merged=
.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.distro ###" >>${S}/merged.=
config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.distro >>${S}/merged.=
config
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.config ###" >${S}/merged.c=
onfig
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.config >>${S}/merged.=
config
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 cp ${S}/merged.config ${S}/.config
> +
> + =A0 =A0 =A0 # Mangle the resulting .config depending on OE variables
> + =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\n=
CROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> + =A0 =A0 =A0 sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak
> + =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
> +
> + =A0 =A0 =A0 sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
> +
> + =A0 =A0 =A0 if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ `echo ${TARGET_OS} | grep -e 'eabi$'` =
]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFI=
G_ARM_EABI=3Dy" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_ARM_EABI is =
not set" =A0 =A0 >> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> +}
> +
> +do_install() {
> + =A0 =A0 =A0 oe_runmake PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_=
PREFIX=3D/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install_dev install_runtime
> +
> + =A0 =A0 =A0 # Need to overwrite the version from -initial
> + =A0 =A0 =A0 #if [ ! -e ${D}${libdir}/libc.so ]; then
> + =A0 =A0 =A0 # =A0 =A0 =A0 ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.=
so
> + =A0 =A0 =A0 #fi
> +
> + =A0 =A0 =A0 # We don't really need this in ${includedir}
> + =A0 =A0 =A0 rm -f ${D}${prefix}/include/.cvsignore
> +
> + =A0 =A0 =A0 # This conflicts with the c++ version of this header
> + =A0 =A0 =A0 rm -f ${D}${prefix}/include/bits/atomicity.h
> +
> + =A0 =A0 =A0 =A0oe_runmake "SSP_ALL_CFLAGS=3D${TARGET_LINK_HASH_STYLE}" =
utils
> + =A0 =A0 =A0 =A0oe_runmake STRIPTOOL=3Dtrue PREFIX=3D${D} DEVEL_PREFIX=
=3D${prefix}/ RUNTIME_PREFIX=3D/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install_utils
> +
> + =A0 =A0 =A0 # oe_runstrip needs +x on files
> + =A0 =A0 =A0 chmod +x ${D}/${base_libdir}/*
> +}
> +
> +get_monotonic_srcrev () {
> + =A0 =A0 =A0 (cd ${S}; eval `git rev-list HEAD|wc -l`)
> +}
> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> deleted file mode 100644
> index a2332e9..0000000
> --- a/recipes/uclibc/uclibc.inc
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -DESCRIPTION =3D "C library for embedded systems"
> -LICENSE =3D "LGPL"
> -SECTION =3D "libs"
> -PRIORITY =3D "required"
> -INC_PR =3D "r33"
> -#
> -# For now, we will skip building of a gcc package if it is a uclibc one
> -# and our build is not a uclibc one, and we skip a glibc one if our buil=
d
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -python __anonymous () {
> - =A0 =A0import bb, re
> - =A0 =A0uc_os =3D (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, =
1)) !=3D None)
> - =A0 =A0if not uc_os:
> - =A0 =A0 =A0 =A0raise bb.parse.SkipPackage("incompatible with target %s"=
 %
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.=
data.getVar('TARGET_OS', d, 1))
> -}
> -
> -PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> -PROVIDES +=3D "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, =
1) !=3D 'yes']}"
> -DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> - =A0 =A0 =A0 =A0 =A0virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-=
headers ncurses-native pax-utils-native"
> -RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> -
> -# Blackfin needs a wrapper around ld
> -#DEPENDS_append_bfin =3D " elf2flt "
> -
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -PARALLEL_MAKE =3D ""
> -
> -PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thr=
ead-db"
> -
> -LEAD_SONAME =3D "libc.so"
> -
> -# The last line (gdb and lib1) is for uclinux-uclibc builds
> -uclibc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcry=
pt-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libintl*.so.* ${base_=
libdir}/libintl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libnsl*.so.* ${base_l=
ibdir}/libnsl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libresolv*.so.* ${bas=
e_libdir}/libresolv-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/ld*.so.* ${base_libd=
ir}/ld-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libc*.so.* ${base_lib=
dir}/libuClibc-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libdl*.so.* ${base_l=
ibdir}/libdl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libm*.so.* ${base_lib=
dir}/libm-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libutil*.so.* ${base=
_libdir}/libutil-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libpthread*.so.* ${ba=
se_libdir}/libpthread-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/librt*.so.* ${base_l=
ibdir}/librt-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/libc.gdb ${libdir}/libc $=
{base_libdir}/lib1.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -FILES_${PN} =3D "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir} ${datadir}/zoneinfo ${libdir}/=
locale"
> -FILES_ldd =3D "${bindir}/ldd"
> -FILES_uclibc-dev_append =3D " ${libdir}/*.o ${libdir}/*_nonshared.a"
> -FILES_uclibc-utils =3D "${bindir} ${sbindir}"
> -FILES_uclibc-utils-dbg +=3D "${bindir}/.debug ${sbindir}/.debug"
> -FILES_uclibc-gconv =3D "${libdir}/gconv"
> -FILES_uclibc-thread-db =3D "/lib/libthread_db*"
> -RPROVIDES_uclibc-dev +=3D "libc-dev virtual-libc-dev"
> -
> -#
> -# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
> -# build, it does not need to be unpacked, but we can't inhibit the unpac=
king
> -# in the current build system.
> -#
> -UCLIBC_LOCALE_FILE =3D "uClibc-locale-030818.tgz"
> -UCLIBC_LOCALE_FILE_arm =3D "uClibc-locale-030818.arm.tgz"
> -UCLIBC_LOCALE_URI =3D "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_F=
ILE}"
> -UCLIBC_LOCALE_URI_arm =3D "http://wiki.openembedded.net/dl/uclibc-locale=
/${UCLIBC_LOCALE_FILE}"
> -
> -SRC_URI =3D "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d=
, 1) !=3D 'yes']} \
> - =A0 =A0 =A0 =A0 =A0file://uClibc.config \
> - =A0 =A0 =A0 =A0 =A0 http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz=
2;name=3DuClibc-${PV} \
> - =A0 =A0 =A0 =A0 =A0"
> -
> -# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_AR=
CH' in
> -# the CFLAGS (for when building the utils).
> -OEMAKE_NO_CC =3D "'STRIPTOOL=3Dtrue' 'LD=3D${LD}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'LOCALE_DATA_FILENAME=3D${UCLIBC_LOCALE_FIL=
E}'"
> -EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} 'CC=3D${CC}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'HOSTCFLAGS=3D-I${STAGING_INCDIR_NATIVE}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARCH=3D`grep TARGET_ARCH ${S}/.config|sed -=
e 's/TARGET_ARCH=3D//g'`"
> -EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
> -
> -KERNEL_SOURCE =3D "${STAGING_INCDIR}"
> -KERNEL_HEADERS =3D "${STAGING_INCDIR}"
> -
> -# Lets munge this via siteinfo.bbclass as well:
> -# ARCH_BIG_ENDIAN=3Dy
> -# ARCH_WANTS_BIG_ENDIAN=3Dy
> -# ARCH_WANTS_LITTLE_ENDIAN is not set
> -
> -# How to enable verbose logs:
> -#export VERBOSE=3D"1"
> -
> -configmangle =3D 's,^KERNEL_SOURCE=3D.*,KERNEL_SOURCE=3D"${KERNEL_SOURCE=
}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^KERNEL_HEADERS=3D.*,KERNEL_HEADERS=3D"${=
KERNEL_HEADERS}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^RUNTIME_PREFIX=3D.*,RUNTIME_PREFIX=3D"/"=
,g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^DEVEL_PREFIX=3D.*,DEVEL_PREFIX=3D"/${pre=
fix}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PATH=3D.*,SHARED_LIB_L=
OADER_PATH=3D"/lib",; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PREFIX=3D.*,SHARED_LIB=
_LOADER_PREFIX=3D"/lib",; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=3Dy=
,g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_=
LOCALE=3Dy,;"][bb.data.getVar("USE_NLS", d, 1) =3D=3D "yes"]} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_=
GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mi=
ps', 'mipsel', 'avr32']]} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
> -
> -CFLAGS :=3D "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> -
> -python () {
> - =A0 =A0 =A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.data.setVar('configmangle_append', ' s,^=
HAS_FPU=3Dy,# HAS_FPU is not set,;', d)
> -}
> -
> -uclibcbuild_do_patch() {
> - =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
> - =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
> -
> - =A0 =A0 =A0 ${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, =
1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.ge=
tVar('USE_NLS', d, 1) !=3D 'yes']}
> -}
> -
> -python do_patch () {
> - =A0 =A0 =A0 bb.build.exec_func('base_do_patch', d)
> - =A0 =A0 =A0 bb.build.exec_func('uclibcbuild_do_patch', d)
> -}
> -
> -do_configure() {
> - =A0 =A0 =A0 rm -f ${S}/.config
> -
> - =A0 =A0 =A0 # For uClibc 0.9.29, OpenEmbedded splits the uClibc.config =
in two parts:
> - =A0 =A0 =A0 # uClibc.machine and uClibc.distro. So, if they exist use t=
hem, otherwise
> - =A0 =A0 =A0 # use a uClibc.config
> - =A0 =A0 =A0 if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.d=
istro ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.machine ###" >${S}/merged.=
config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.machine >>${S}/merged=
.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.distro ###" >>${S}/merged.=
config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.distro >>${S}/merged.=
config
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.config ###" >${S}/merged.c=
onfig
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.config >>${S}/merged.=
config
> - =A0 =A0 =A0 fi
> - =A0 =A0 =A0 cp ${S}/merged.config ${S}/.config
> -
> - =A0 =A0 =A0 # Mangle the resulting .config depending on OE variables
> - =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\n=
CROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> - =A0 =A0 =A0 sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak
> - =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
> -
> - =A0 =A0 =A0 sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
> -
> - =A0 =A0 =A0 if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ `echo ${TARGET_OS} | grep -e 'eabi$'` =
]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFI=
G_ARM_EABI=3Dy" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>> ${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_ARM_EABI is =
not set" =A0 =A0 >> ${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> - =A0 =A0 =A0 fi
> - =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 oe_runmake PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_=
PREFIX=3D/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install_dev install_runtime
> -
> - =A0 =A0 =A0 # Need to overwrite the version from -initial
> - =A0 =A0 =A0 #if [ ! -e ${D}${libdir}/libc.so ]; then
> - =A0 =A0 =A0 # =A0 =A0 =A0 ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.=
so
> - =A0 =A0 =A0 #fi
> -
> - =A0 =A0 =A0 # We don't really need this in ${includedir}
> - =A0 =A0 =A0 rm -f ${D}${prefix}/include/.cvsignore
> -
> - =A0 =A0 =A0 # This conflicts with the c++ version of this header
> - =A0 =A0 =A0 rm -f ${D}${prefix}/include/bits/atomicity.h
> -
> - =A0 =A0 =A0 =A0oe_runmake "SSP_ALL_CFLAGS=3D${TARGET_LINK_HASH_STYLE}" =
utils
> - =A0 =A0 =A0 =A0oe_runmake STRIPTOOL=3Dtrue PREFIX=3D${D} DEVEL_PREFIX=
=3D${prefix}/ RUNTIME_PREFIX=3D/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install_utils
> -
> - =A0 =A0 =A0 # oe_runstrip needs +x on files
> - =A0 =A0 =A0 chmod +x ${D}/${base_libdir}/*
> -}
> -
> -get_monotonic_srcrev () {
> - =A0 =A0 =A0 (cd ${S}; eval `git rev-list HEAD|wc -l`)
> -}
> diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.=
28.bb
> index 2e90939..a6cb491 100644
> --- a/recipes/uclibc/uclibc_0.9.28.bb
> +++ b/recipes/uclibc/uclibc_0.9.28.bb
> @@ -1,4 +1,4 @@
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0# This is the correct KERNEL_SOURCE location, if the uClibc
> diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.=
29.bb
> index 1679ada..c1d7ee0 100644
> --- a/recipes/uclibc/uclibc_0.9.29.bb
> +++ b/recipes/uclibc/uclibc_0.9.29.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.29"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.=
9.30.1.bb
> index 47b44cd..73346fd 100644
> --- a/recipes/uclibc/uclibc_0.9.30.1.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.1.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.30.1"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.4"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_0.9.30.2.bb b/recipes/uclibc/uclibc_0.=
9.30.2.bb
> index 703b5cd..a772e2a 100644
> --- a/recipes/uclibc/uclibc_0.9.30.2.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.2.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.30.2"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.=
30.bb
> index 9278299..15e8675 100644
> --- a/recipes/uclibc/uclibc_0.9.30.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.30"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.1"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
> index 4ac1b89..26339f5 100644
> --- a/recipes/uclibc/uclibc_git.bb
> +++ b/recipes/uclibc/uclibc_git.bb
> @@ -13,7 +13,7 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0#DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so t=
ake
> =A0# precedence.
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
>
> diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.b=
b
> index cd67c6a..c7cbd00 100644
> --- a/recipes/uclibc/uclibc_nptl.bb
> +++ b/recipes/uclibc/uclibc_nptl.bb
> @@ -13,7 +13,7 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0#DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so t=
ake
> =A0# precedence.
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> --
> 1.6.6
>
>


