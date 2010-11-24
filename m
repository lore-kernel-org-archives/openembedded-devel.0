Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PLKMt-0004QW-8n
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:47:03 +0100
Received: by gxk20 with SMTP id 20so35704gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ImvNmWxHzGWXzIJ9wQm+atkqWcX17b2SQ2jL3RxjP0I=;
	b=fsjDLxy430jFpZlUcxG244tx/SjHKh/5WkZur4oAysGkzS7DgZbDVCVV0oVLbSe4uR
	vXCroJSju7ORyr5r8zVyJeMTyEI5Cp4huHZIJshj+vqZ49PD3QwwPyQHgUFbX+CL10P8
	rf0lHP7uF5UYPJFfriaKg7B0+7eUbpkU27JBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mGvEsmhcou9FekPoZkG/vbyO/Csa3RMtsqxOx9vkmX9gmcGq+876q6gtQ8sVCqfsfc
	7Qex/ws0z6aoK6ilhMuphdYgwsb0NTpIHq4wVnfcHhcSJ4/0ttlT6W2AbCQg7zWlj8Vx
	l4bmw4NRl9Mwy9xIWgIEez4AnolMKq3/TNVaM=
Received: by 10.90.99.8 with SMTP id w8mr1303889agb.0.1290624343380; Wed, 24
	Nov 2010 10:45:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 24 Nov 2010 10:45:23 -0800 (PST)
In-Reply-To: <1290620636-21238-3-git-send-email-eric@eukrea.com>
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>
	<1290620636-21238-2-git-send-email-eric@eukrea.com>
	<1290620636-21238-3-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Nov 2010 10:45:23 -0800
Message-ID: <AANLkTim76s5VBmpDEASq-QirXVTBfkUaBavbvrfERBL9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] busybox: add 1.18.0 and its first fix
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
X-List-Received-Date: Wed, 24 Nov 2010 18:47:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2010 at 9:43 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> this is the latest unstable version so DP=3D-1
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/busybox/busybox-1.18.0/B921600.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 +
> =C2=A0.../busybox-1.18.0/busybox-1.18.0-buildsys.patch =C2=A0 | =C2=A0 21=
 +
> =C2=A0recipes/busybox/busybox-1.18.0/defconfig =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0873 ++++++++++++++++++++
> =C2=A0recipes/busybox/busybox-1.18.0/fdisk_nios2.patch =C2=A0 | =C2=A0 13=
 +
> =C2=A0.../busybox/busybox-1.18.0/get_header_tar.patch =C2=A0 =C2=A0| =C2=
=A0 13 +
> =C2=A0.../busybox-1.18.0/udhcpc-fix-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 47 ++
> =C2=A0recipes/busybox/busybox-1.18.0/udhcpscript.patch =C2=A0 | =C2=A0 13=
 +
> =C2=A0recipes/busybox/busybox_1.18.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +
> =C2=A08 files changed, 1005 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/B921600.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-bu=
ildsys.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/defconfig
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/get_header_tar.pa=
tch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroo=
t.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.0/udhcpscript.patch
> =C2=A0create mode 100644 recipes/busybox/busybox_1.18.0.bb
>
> diff --git a/recipes/busybox/busybox-1.18.0/B921600.patch b/recipes/busyb=
ox/busybox-1.18.0/B921600.patch
> new file mode 100644
> index 0000000..61cc32b
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/B921600.patch
> @@ -0,0 +1,13 @@
> +diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/=
speed_table.c
> +--- busybox-1.7.2/libbb/speed_table.c =C2=A02007-09-03 13:48:41.00000000=
0 +0200
> ++++ busybox-1.7.2-921600/libbb/speed_table.c =C2=A0 2008-10-09 16:23:26.=
269592899 +0200
> +@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =3D
> + #ifdef B460800
> + =C2=A0 =C2=A0 =C2=A0 {B460800, 460800/256 + 0x8000U},
> + #endif
> ++#ifdef B921600
> ++ =C2=A0 =C2=A0 =C2=A0{B921600, 921600/256 + 0x8000U},
> ++#endif
> + };
> +
> + enum { NUM_SPEEDS =3D ARRAY_SIZE(speeds) };
> diff --git a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch=
 b/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
> new file mode 100644
> index 0000000..c72e4d3
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
> @@ -0,0 +1,21 @@
> +diff -urpN busybox-1.18.0/scripts/gen_build_files.sh busybox-1.18.0-buil=
dsys/scripts/gen_build_files.sh
> +--- busybox-1.18.0/scripts/gen_build_files.sh =C2=A02010-11-22 21:43:22.=
000000000 +0100
> ++++ busybox-1.18.0-buildsys/scripts/gen_build_files.sh 2010-11-24 14:59:=
47.732712663 +0100
> +@@ -18,14 +18,14 @@ generate()
> + =C2=A0 =C2=A0 =C2=A0 local src=3D"$1" dst=3D"$2" header=3D"$3" insert=
=3D"$4"
> + =C2=A0 =C2=A0 =C2=A0 #chk "${dst}"
> + =C2=A0 =C2=A0 =C2=A0 (
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "${header}"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf "%s\n" "${heade=
r}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -qs '^INSERT$'=
 "${src}"; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sed -n '1,/^INSERT$/p' "${src}"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo "${insert}"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0printf "%s\n" "${insert}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sed -n '/^INSERT$/,$p' "${src}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ -n "${insert}" ]; then
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "ERROR: INSERT line missing in: ${sr=
c}" 1>&2
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf "%s\n" "ERROR: INSERT line missing=
 in: ${src}" 1>&2
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cat "${src}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> diff --git a/recipes/busybox/busybox-1.18.0/defconfig b/recipes/busybox/b=
usybox-1.18.0/defconfig
> new file mode 100644
> index 0000000..5a6870c
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/defconfig
> @@ -0,0 +1,873 @@
> +#
> +# Automatically generated make config: don't edit
> +# Busybox version: 1.13.2
> +# Sun Feb =C2=A08 17:22:39 2009
> +#
> +CONFIG_HAVE_DOT_CONFIG=3Dy
> +
> +#
> +# Busybox Settings
> +#
> +
> +#
> +# General Configuration
> +#
> +# CONFIG_DESKTOP is not set
> +# CONFIG_EXTRA_COMPAT is not set
> +CONFIG_FEATURE_ASSUME_UNICODE=3Dy
> +CONFIG_FEATURE_BUFFERS_USE_MALLOC=3Dy
> +# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
> +# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> +CONFIG_SHOW_USAGE=3Dy
> +CONFIG_FEATURE_VERBOSE_USAGE=3Dy
> +CONFIG_FEATURE_COMPRESS_USAGE=3Dy
> +# CONFIG_FEATURE_INSTALLER is not set
> +CONFIG_LOCALE_SUPPORT=3Dy
> +CONFIG_GETOPT_LONG=3Dy
> +CONFIG_FEATURE_DEVPTS=3Dy
> +# CONFIG_FEATURE_CLEAN_UP is not set
> +CONFIG_FEATURE_PIDFILE=3Dy
> +CONFIG_FEATURE_SUID=3Dy
> +CONFIG_FEATURE_SUID_CONFIG=3Dy
> +CONFIG_FEATURE_SUID_CONFIG_QUIET=3Dy
> +# CONFIG_SELINUX is not set
> +# CONFIG_FEATURE_PREFER_APPLETS is not set
> +CONFIG_BUSYBOX_EXEC_PATH=3D"/proc/self/exe"
> +CONFIG_FEATURE_SYSLOG=3Dy
> +CONFIG_FEATURE_HAVE_RPC=3Dy
> +
> +#
> +# Build Options
> +#
> +# CONFIG_STATIC is not set
> +# CONFIG_PIE is not set
> +# CONFIG_NOMMU is not set
> +# CONFIG_BUILD_LIBBUSYBOX is not set
> +# CONFIG_FEATURE_INDIVIDUAL is not set
> +# CONFIG_FEATURE_SHARED_BUSYBOX is not set
> +CONFIG_LFS=3Dy
> +CONFIG_CROSS_COMPILER_PREFIX=3D""
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +# CONFIG_DEBUG_PESSIMIZE is not set
> +# CONFIG_WERROR is not set
> +CONFIG_NO_DEBUG_LIB=3Dy
> +# CONFIG_DMALLOC is not set
> +# CONFIG_EFENCE is not set
> +# CONFIG_INCLUDE_SUSv2 is not set
> +
> +#
> +# Installation Options
> +#
> +# CONFIG_INSTALL_NO_USR is not set
> +CONFIG_INSTALL_APPLET_SYMLINKS=3Dy
> +# CONFIG_INSTALL_APPLET_HARDLINKS is not set
> +# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
> +# CONFIG_INSTALL_APPLET_DONT is not set
> +# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
> +# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
> +# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
> +CONFIG_PREFIX=3D"./_install"
> +
> +#
> +# Busybox Library Tuning
> +#
> +CONFIG_PASSWORD_MINLEN=3D6
> +CONFIG_MD5_SIZE_VS_SPEED=3D2
> +CONFIG_FEATURE_FAST_TOP=3Dy
> +# CONFIG_FEATURE_ETC_NETWORKS is not set
> +CONFIG_FEATURE_EDITING=3Dy
> +CONFIG_FEATURE_EDITING_MAX_LEN=3D1024
> +# CONFIG_FEATURE_EDITING_VI is not set
> +CONFIG_FEATURE_EDITING_HISTORY=3D64
> +CONFIG_FEATURE_EDITING_SAVEHISTORY=3Dy
> +CONFIG_FEATURE_TAB_COMPLETION=3Dy
> +CONFIG_FEATURE_USERNAME_COMPLETION=3Dy
> +CONFIG_FEATURE_EDITING_FANCY_PROMPT=3Dy
> +CONFIG_FEATURE_VERBOSE_CP_MESSAGE=3Dy
> +CONFIG_FEATURE_COPYBUF_KB=3D4
> +CONFIG_MONOTONIC_SYSCALL=3Dy
> +CONFIG_IOCTL_HEX2STR_ERROR=3Dy
> +CONFIG_FEATURE_HWIB=3Dy
> +
> +#
> +# Applets
> +#
> +
> +#
> +# Archival Utilities
> +#
> +# CONFIG_FEATURE_SEAMLESS_LZMA is not set
> +CONFIG_FEATURE_SEAMLESS_BZ2=3Dy
> +CONFIG_FEATURE_SEAMLESS_GZ=3Dy
> +CONFIG_FEATURE_SEAMLESS_Z=3Dy
> +CONFIG_AR=3Dy
> +# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
> +CONFIG_BUNZIP2=3Dy
> +# CONFIG_BZIP2 is not set
> +CONFIG_CPIO=3Dy
> +# CONFIG_FEATURE_CPIO_O is not set
> +# CONFIG_DPKG is not set
> +# CONFIG_DPKG_DEB is not set
> +# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
> +CONFIG_GUNZIP=3Dy
> +CONFIG_GZIP=3Dy
> +# CONFIG_RPM2CPIO is not set
> +# CONFIG_RPM is not set
> +CONFIG_TAR=3Dy
> +CONFIG_FEATURE_TAR_CREATE=3Dy
> +CONFIG_FEATURE_TAR_AUTODETECT=3Dy
> +CONFIG_FEATURE_TAR_FROM=3Dy
> +CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=3Dy
> +# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
> +CONFIG_FEATURE_TAR_GNU_EXTENSIONS=3Dy
> +CONFIG_FEATURE_TAR_LONG_OPTIONS=3Dy
> +CONFIG_FEATURE_TAR_UNAME_GNAME=3Dy
> +# CONFIG_UNCOMPRESS is not set
> +# CONFIG_UNLZMA is not set
> +# CONFIG_FEATURE_LZMA_FAST is not set
> +CONFIG_UNZIP=3Dy
> +
> +#
> +# Coreutils
> +#
> +CONFIG_BASENAME=3Dy
> +# CONFIG_CAL is not set
> +CONFIG_CAT=3Dy
> +# CONFIG_CATV is not set
> +CONFIG_CHGRP=3Dy
> +CONFIG_CHMOD=3Dy
> +CONFIG_CHOWN=3Dy
> +CONFIG_CHROOT=3Dy
> +# CONFIG_CKSUM is not set
> +# CONFIG_COMM is not set
> +CONFIG_CP=3Dy
> +CONFIG_CUT=3Dy
> +CONFIG_DATE=3Dy
> +CONFIG_FEATURE_DATE_ISOFMT=3Dy
> +CONFIG_DD=3Dy
> +CONFIG_FEATURE_DD_SIGNAL_HANDLING=3Dy
> +# CONFIG_FEATURE_DD_IBS_OBS is not set
> +CONFIG_DF=3Dy
> +CONFIG_FEATURE_DF_FANCY=3Dy
> +CONFIG_DIRNAME=3Dy
> +# CONFIG_DOS2UNIX is not set
> +# CONFIG_UNIX2DOS is not set
> +CONFIG_DU=3Dy
> +CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=3Dy
> +CONFIG_ECHO=3Dy
> +CONFIG_FEATURE_FANCY_ECHO=3Dy
> +CONFIG_ENV=3Dy
> +CONFIG_FEATURE_ENV_LONG_OPTIONS=3Dy
> +# CONFIG_EXPAND is not set
> +# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> +CONFIG_EXPR=3Dy
> +# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> +CONFIG_FALSE=3Dy
> +# CONFIG_FOLD is not set
> +CONFIG_HEAD=3Dy
> +CONFIG_FEATURE_FANCY_HEAD=3Dy
> +# CONFIG_HOSTID is not set
> +CONFIG_ID=3Dy
> +# CONFIG_INSTALL is not set
> +# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
> +# CONFIG_LENGTH is not set
> +CONFIG_LN=3Dy
> +CONFIG_LOGNAME=3Dy
> +CONFIG_LS=3Dy
> +CONFIG_FEATURE_LS_FILETYPES=3Dy
> +CONFIG_FEATURE_LS_FOLLOWLINKS=3Dy
> +CONFIG_FEATURE_LS_RECURSIVE=3Dy
> +CONFIG_FEATURE_LS_SORTFILES=3Dy
> +CONFIG_FEATURE_LS_TIMESTAMPS=3Dy
> +CONFIG_FEATURE_LS_USERNAME=3Dy
> +CONFIG_FEATURE_LS_COLOR=3Dy
> +# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
> +CONFIG_MD5SUM=3Dy
> +CONFIG_MKDIR=3Dy
> +CONFIG_FEATURE_MKDIR_LONG_OPTIONS=3Dy
> +CONFIG_MKFIFO=3Dy
> +CONFIG_MKNOD=3Dy
> +CONFIG_MV=3Dy
> +CONFIG_FEATURE_MV_LONG_OPTIONS=3Dy
> +CONFIG_NICE=3Dy
> +CONFIG_NOHUP=3Dy
> +CONFIG_OD=3Dy
> +# CONFIG_PRINTENV is not set
> +CONFIG_PRINTF=3Dy
> +CONFIG_PWD=3Dy
> +CONFIG_READLINK=3Dy
> +CONFIG_FEATURE_READLINK_FOLLOW=3Dy
> +CONFIG_REALPATH=3Dy
> +CONFIG_RM=3Dy
> +CONFIG_RMDIR=3Dy
> +CONFIG_FEATURE_RMDIR_LONG_OPTIONS=3Dy
> +CONFIG_SEQ=3Dy
> +# CONFIG_SHA1SUM is not set
> +CONFIG_SLEEP=3Dy
> +CONFIG_FEATURE_FANCY_SLEEP=3Dy
> +CONFIG_FEATURE_FLOAT_SLEEP=3Dy
> +CONFIG_SORT=3Dy
> +CONFIG_FEATURE_SORT_BIG=3Dy
> +# CONFIG_SPLIT is not set
> +# CONFIG_FEATURE_SPLIT_FANCY is not set
> +# CONFIG_STAT is not set
> +# CONFIG_FEATURE_STAT_FORMAT is not set
> +CONFIG_STTY=3Dy
> +# CONFIG_SUM is not set
> +CONFIG_SYNC=3Dy
> +# CONFIG_TAC is not set
> +CONFIG_TAIL=3Dy
> +CONFIG_FEATURE_FANCY_TAIL=3Dy
> +CONFIG_TEE=3Dy
> +CONFIG_FEATURE_TEE_USE_BLOCK_IO=3Dy
> +CONFIG_TEST=3Dy
> +# CONFIG_FEATURE_TEST_64 is not set
> +CONFIG_TOUCH=3Dy
> +CONFIG_TR=3Dy
> +CONFIG_FEATURE_TR_CLASSES=3Dy
> +# CONFIG_FEATURE_TR_EQUIV is not set
> +CONFIG_TRUE=3Dy
> +CONFIG_TTY=3Dy
> +CONFIG_UNAME=3Dy
> +# CONFIG_UNEXPAND is not set
> +# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
> +CONFIG_UNIQ=3Dy
> +CONFIG_USLEEP=3Dy
> +# CONFIG_UUDECODE is not set
> +# CONFIG_UUENCODE is not set
> +CONFIG_WC=3Dy
> +# CONFIG_FEATURE_WC_LARGE is not set
> +CONFIG_WHO=3Dy
> +CONFIG_WHOAMI=3Dy
> +CONFIG_YES=3Dy
> +
> +#
> +# Common options for cp and mv
> +#
> +# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
> +
> +#
> +# Common options for ls, more and telnet
> +#
> +CONFIG_FEATURE_AUTOWIDTH=3Dy
> +
> +#
> +# Common options for df, du, ls
> +#
> +CONFIG_FEATURE_HUMAN_READABLE=3Dy
> +
> +#
> +# Common options for md5sum, sha1sum
> +#
> +CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=3Dy
> +
> +#
> +# Console Utilities
> +#
> +CONFIG_CHVT=3Dy
> +CONFIG_CLEAR=3Dy
> +CONFIG_DEALLOCVT=3Dy
> +CONFIG_DUMPKMAP=3Dy
> +# CONFIG_KBD_MODE is not set
> +CONFIG_LOADFONT=3Dy
> +CONFIG_LOADKMAP=3Dy
> +CONFIG_OPENVT=3Dy
> +CONFIG_RESET=3Dy
> +# CONFIG_RESIZE is not set
> +# CONFIG_FEATURE_RESIZE_PRINT is not set
> +CONFIG_SETCONSOLE=3Dy
> +# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> +CONFIG_SETFONT=3Dy
> +CONFIG_FEATURE_SETFONT_TEXTUAL_MAP=3Dy
> +CONFIG_DEFAULT_SETFONT_DIR=3D""
> +# CONFIG_SETKEYCODES is not set
> +# CONFIG_SETLOGCONS is not set
> +CONFIG_SHOWKEY=3Dy
> +
> +#
> +# Debian Utilities
> +#
> +CONFIG_MKTEMP=3Dy
> +# CONFIG_PIPE_PROGRESS is not set
> +CONFIG_RUN_PARTS=3Dy
> +CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=3Dy
> +CONFIG_FEATURE_RUN_PARTS_FANCY=3Dy
> +CONFIG_START_STOP_DAEMON=3Dy
> +CONFIG_FEATURE_START_STOP_DAEMON_FANCY=3Dy
> +CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=3Dy
> +CONFIG_WHICH=3Dy
> +
> +#
> +# Editors
> +#
> +CONFIG_AWK=3Dy
> +CONFIG_FEATURE_AWK_LIBM=3Dy
> +CONFIG_CMP=3Dy
> +CONFIG_DIFF=3Dy
> +CONFIG_FEATURE_DIFF_BINARY=3Dy
> +CONFIG_FEATURE_DIFF_DIR=3Dy
> +CONFIG_FEATURE_DIFF_MINIMAL=3Dy
> +# CONFIG_ED is not set
> +CONFIG_PATCH=3Dy
> +CONFIG_SED=3Dy
> +CONFIG_VI=3Dy
> +CONFIG_FEATURE_VI_MAX_LEN=3D1024
> +CONFIG_FEATURE_VI_8BIT=3Dy
> +CONFIG_FEATURE_VI_COLON=3Dy
> +CONFIG_FEATURE_VI_YANKMARK=3Dy
> +CONFIG_FEATURE_VI_SEARCH=3Dy
> +CONFIG_FEATURE_VI_USE_SIGNALS=3Dy
> +CONFIG_FEATURE_VI_DOT_CMD=3Dy
> +# CONFIG_FEATURE_VI_READONLY is not set
> +# CONFIG_FEATURE_VI_SETOPTS is not set
> +CONFIG_FEATURE_VI_SET=3Dy
> +CONFIG_FEATURE_VI_WIN_RESIZE=3Dy
> +CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=3Dy
> +CONFIG_FEATURE_ALLOW_EXEC=3Dy
> +
> +#
> +# Finding Utilities
> +#
> +CONFIG_FIND=3Dy
> +CONFIG_FEATURE_FIND_PRINT0=3Dy
> +CONFIG_FEATURE_FIND_MTIME=3Dy
> +CONFIG_FEATURE_FIND_MMIN=3Dy
> +CONFIG_FEATURE_FIND_PERM=3Dy
> +CONFIG_FEATURE_FIND_TYPE=3Dy
> +CONFIG_FEATURE_FIND_XDEV=3Dy
> +CONFIG_FEATURE_FIND_MAXDEPTH=3Dy
> +CONFIG_FEATURE_FIND_NEWER=3Dy
> +CONFIG_FEATURE_FIND_INUM=3Dy
> +CONFIG_FEATURE_FIND_EXEC=3Dy
> +CONFIG_FEATURE_FIND_USER=3Dy
> +CONFIG_FEATURE_FIND_GROUP=3Dy
> +CONFIG_FEATURE_FIND_NOT=3Dy
> +CONFIG_FEATURE_FIND_DEPTH=3Dy
> +CONFIG_FEATURE_FIND_PAREN=3Dy
> +CONFIG_FEATURE_FIND_SIZE=3Dy
> +CONFIG_FEATURE_FIND_PRUNE=3Dy
> +CONFIG_FEATURE_FIND_DELETE=3Dy
> +CONFIG_FEATURE_FIND_PATH=3Dy
> +CONFIG_FEATURE_FIND_REGEX=3Dy
> +# CONFIG_FEATURE_FIND_CONTEXT is not set
> +CONFIG_GREP=3Dy
> +CONFIG_FEATURE_GREP_EGREP_ALIAS=3Dy
> +CONFIG_FEATURE_GREP_FGREP_ALIAS=3Dy
> +CONFIG_FEATURE_GREP_CONTEXT=3Dy
> +CONFIG_XARGS=3Dy
> +# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
> +CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=3Dy
> +CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=3Dy
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy
> +
> +#
> +# Init Utilities
> +#
> +CONFIG_INIT=3Dy
> +CONFIG_FEATURE_USE_INITTAB=3Dy
> +CONFIG_FEATURE_KILL_REMOVED=3Dy
> +CONFIG_FEATURE_KILL_DELAY=3D0
> +# CONFIG_FEATURE_INIT_SCTTY is not set
> +# CONFIG_FEATURE_INIT_SYSLOG is not set
> +# CONFIG_FEATURE_EXTRA_QUIET is not set
> +# CONFIG_FEATURE_INIT_COREDUMPS is not set
> +CONFIG_FEATURE_INITRD=3Dy
> +CONFIG_HALT=3Dy
> +# CONFIG_MESG is not set
> +
> +#
> +# Login/Password Management Utilities
> +#
> +CONFIG_FEATURE_SHADOWPASSWDS=3Dy
> +# CONFIG_USE_BB_PWD_GRP is not set
> +# CONFIG_USE_BB_SHADOW is not set
> +CONFIG_USE_BB_CRYPT=3Dy
> +CONFIG_ADDGROUP=3Dy
> +CONFIG_FEATURE_ADDUSER_TO_GROUP=3Dy
> +CONFIG_DELGROUP=3Dy
> +CONFIG_FEATURE_DEL_USER_FROM_GROUP=3Dy
> +CONFIG_FEATURE_CHECK_NAMES=3Dy
> +CONFIG_ADDUSER=3Dy
> +CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=3Dy
> +CONFIG_DELUSER=3Dy
> +CONFIG_GETTY=3Dy
> +CONFIG_FEATURE_UTMP=3Dy
> +CONFIG_FEATURE_WTMP=3Dy
> +CONFIG_LOGIN=3Dy
> +# CONFIG_PAM is not set
> +CONFIG_LOGIN_SCRIPTS=3Dy
> +CONFIG_FEATURE_NOLOGIN=3Dy
> +CONFIG_FEATURE_SECURETTY=3Dy
> +CONFIG_PASSWD=3Dy
> +CONFIG_FEATURE_PASSWD_WEAK_CHECK=3Dy
> +CONFIG_CRYPTPW=3Dy
> +CONFIG_CHPASSWD=3Dy
> +CONFIG_SU=3Dy
> +CONFIG_FEATURE_SU_SYSLOG=3Dy
> +CONFIG_FEATURE_SU_CHECKS_SHELLS=3Dy
> +CONFIG_SULOGIN=3Dy
> +CONFIG_VLOCK=3Dy
> +
> +#
> +# Linux Ext2 FS Progs
> +#
> +CONFIG_CHATTR=3Dy
> +CONFIG_FSCK=3Dy
> +# CONFIG_LSATTR is not set
> +
> +#
> +# Linux Module Utilities
> +#
> +CONFIG_DEFAULT_MODULES_DIR=3D"/lib/modules"
> +CONFIG_DEFAULT_DEPMOD_FILE=3D"modules.dep"
> +# CONFIG_MODPROBE_SMALL is not set
> +# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
> +# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
> +CONFIG_INSMOD=3Dy
> +CONFIG_RMMOD=3Dy
> +CONFIG_LSMOD=3Dy
> +CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=3Dy
> +CONFIG_MODPROBE=3Dy
> +CONFIG_FEATURE_MODPROBE_BLACKLIST=3Dy
> +# CONFIG_DEPMOD is not set
> +
> +#
> +# Options common to multiple modutils
> +#
> +# CONFIG_FEATURE_2_4_MODULES is not set
> +# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
> +# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
> +# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
> +CONFIG_FEATURE_CHECK_TAINTED_MODULE=3Dy
> +CONFIG_FEATURE_MODUTILS_ALIAS=3Dy
> +CONFIG_FEATURE_MODUTILS_SYMBOLS=3Dy
> +
> +#
> +# Linux System Utilities
> +#
> +CONFIG_BLKID=3Dy
> +CONFIG_DMESG=3Dy
> +CONFIG_FEATURE_DMESG_PRETTY=3Dy
> +CONFIG_FBSET=3Dy
> +CONFIG_FEATURE_FBSET_FANCY=3Dy
> +CONFIG_FEATURE_FBSET_READMODE=3Dy
> +# CONFIG_FDFLUSH is not set
> +# CONFIG_FDFORMAT is not set
> +CONFIG_FDISK=3Dy
> +CONFIG_FDISK_SUPPORT_LARGE_DISKS=3Dy
> +CONFIG_FEATURE_FDISK_WRITABLE=3Dy
> +# CONFIG_FEATURE_AIX_LABEL is not set
> +# CONFIG_FEATURE_SGI_LABEL is not set
> +# CONFIG_FEATURE_SUN_LABEL is not set
> +CONFIG_FEATURE_OSF_LABEL=3Dy
> +CONFIG_FEATURE_FDISK_ADVANCED=3Dy
> +# CONFIG_FINDFS is not set
> +CONFIG_FREERAMDISK=3Dy
> +CONFIG_FSCK_MINIX=3Dy
> +CONFIG_MKFS_MINIX=3Dy
> +
> +#
> +# Minix filesystem support
> +#
> +CONFIG_FEATURE_MINIX2=3Dy
> +CONFIG_GETOPT=3Dy
> +CONFIG_HEXDUMP=3Dy
> +# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
> +# CONFIG_HD is not set
> +CONFIG_HWCLOCK=3Dy
> +CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=3Dy
> +CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=3Dy
> +# CONFIG_IPCRM is not set
> +# CONFIG_IPCS is not set
> +CONFIG_LOSETUP=3Dy
> +CONFIG_MDEV=3Dy
> +CONFIG_FEATURE_MDEV_CONF=3Dy
> +CONFIG_FEATURE_MDEV_RENAME=3Dy
> +CONFIG_FEATURE_MDEV_RENAME_REGEXP=3Dy
> +CONFIG_FEATURE_MDEV_EXEC=3Dy
> +CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=3Dy
> +CONFIG_MKSWAP=3Dy
> +# CONFIG_FEATURE_MKSWAP_V0 is not set
> +CONFIG_MORE=3Dy
> +CONFIG_FEATURE_USE_TERMIOS=3Dy
> +CONFIG_VOLUMEID=3Dy
> +# CONFIG_FEATURE_VOLUMEID_EXT is not set
> +# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
> +# CONFIG_FEATURE_VOLUMEID_FAT is not set
> +# CONFIG_FEATURE_VOLUMEID_HFS is not set
> +# CONFIG_FEATURE_VOLUMEID_JFS is not set
> +# CONFIG_FEATURE_VOLUMEID_XFS is not set
> +# CONFIG_FEATURE_VOLUMEID_NTFS is not set
> +# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
> +# CONFIG_FEATURE_VOLUMEID_UDF is not set
> +# CONFIG_FEATURE_VOLUMEID_LUKS is not set
> +# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
> +# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
> +# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
> +# CONFIG_FEATURE_VOLUMEID_SYSV is not set
> +# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
> +# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
> +CONFIG_MOUNT=3Dy
> +# CONFIG_FEATURE_MOUNT_FAKE is not set
> +CONFIG_FEATURE_MOUNT_VERBOSE=3Dy
> +CONFIG_FEATURE_MOUNT_HELPERS=3Dy
> +CONFIG_FEATURE_MOUNT_LABEL=3Dy
> +CONFIG_FEATURE_MOUNT_NFS=3Dy
> +CONFIG_FEATURE_MOUNT_CIFS=3Dy
> +CONFIG_FEATURE_MOUNT_FLAGS=3Dy
> +CONFIG_FEATURE_MOUNT_FSTAB=3Dy
> +CONFIG_PIVOT_ROOT=3Dy
> +CONFIG_RDATE=3Dy
> +CONFIG_RDEV=3Dy
> +CONFIG_READPROFILE=3Dy
> +CONFIG_RTCWAKE=3Dy
> +# CONFIG_SCRIPT is not set
> +# CONFIG_SETARCH is not set
> +CONFIG_SWAPONOFF=3Dy
> +# CONFIG_FEATURE_SWAPON_PRI is not set
> +CONFIG_SWITCH_ROOT=3Dy
> +CONFIG_UMOUNT=3Dy
> +CONFIG_FEATURE_UMOUNT_ALL=3Dy
> +
> +#
> +# Common options for mount/umount
> +#
> +CONFIG_FEATURE_MOUNT_LOOP=3Dy
> +# CONFIG_FEATURE_MTAB_SUPPORT is not set
> +
> +#
> +# Miscellaneous Utilities
> +#
> +# CONFIG_ADJTIMEX is not set
> +# CONFIG_BBCONFIG is not set
> +# CONFIG_CHAT is not set
> +# CONFIG_FEATURE_CHAT_NOFAIL is not set
> +# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
> +# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
> +# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
> +# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
> +# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
> +# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
> +# CONFIG_CHRT is not set
> +# CONFIG_CROND is not set
> +# CONFIG_FEATURE_CROND_D is not set
> +# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
> +# CONFIG_CRONTAB is not set
> +CONFIG_DC=3Dy
> +CONFIG_FEATURE_DC_LIBM=3Dy
> +# CONFIG_DEVFSD is not set
> +# CONFIG_DEVFSD_MODLOAD is not set
> +# CONFIG_DEVFSD_FG_NP is not set
> +# CONFIG_DEVFSD_VERBOSE is not set
> +# CONFIG_FEATURE_DEVFS is not set
> +# CONFIG_DEVMEM is not set
> +# CONFIG_EJECT is not set
> +# CONFIG_FEATURE_EJECT_SCSI is not set
> +CONFIG_FBSPLASH=3Dy
> +# CONFIG_INOTIFYD is not set
> +CONFIG_LAST=3Dy
> +CONFIG_FEATURE_LAST_SMALL=3Dy
> +# CONFIG_FEATURE_LAST_FANCY is not set
> +CONFIG_LESS=3Dy
> +CONFIG_FEATURE_LESS_MAXLINES=3D9999999
> +CONFIG_FEATURE_LESS_BRACKETS=3Dy
> +CONFIG_FEATURE_LESS_FLAGS=3Dy
> +# CONFIG_FEATURE_LESS_DASHCMD is not set
> +# CONFIG_FEATURE_LESS_MARKS is not set
> +# CONFIG_FEATURE_LESS_REGEXP is not set
> +# CONFIG_FEATURE_LESS_LINENUMS is not set
> +# CONFIG_FEATURE_LESS_WINCH is not set
> +# CONFIG_HDPARM is not set
> +# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
> +# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> +CONFIG_MAKEDEVS=3Dy
> +# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
> +CONFIG_FEATURE_MAKEDEVS_TABLE=3Dy
> +# CONFIG_MAN is not set
> +CONFIG_MICROCOM=3Dy
> +# CONFIG_MOUNTPOINT is not set
> +# CONFIG_MT is not set
> +# CONFIG_RAIDAUTORUN is not set
> +CONFIG_READAHEAD=3Dy
> +# CONFIG_RUNLEVEL is not set
> +# CONFIG_RX is not set
> +# CONFIG_SETSID is not set
> +CONFIG_STRINGS=3Dy
> +# CONFIG_TASKSET is not set
> +# CONFIG_FEATURE_TASKSET_FANCY is not set
> +CONFIG_TIME=3Dy
> +# CONFIG_TTYSIZE is not set
> +# CONFIG_WATCHDOG is not set
> +
> +#
> +# Networking Utilities
> +#
> +CONFIG_FEATURE_IPV6=3Dy
> +CONFIG_FEATURE_PREFER_IPV4_ADDRESS=3Dy
> +# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> +# CONFIG_ARP is not set
> +# CONFIG_ARPING is not set
> +# CONFIG_BRCTL is not set
> +# CONFIG_FEATURE_BRCTL_FANCY is not set
> +# CONFIG_FEATURE_BRCTL_SHOW is not set
> +# CONFIG_DNSD is not set
> +# CONFIG_ETHER_WAKE is not set
> +# CONFIG_FAKEIDENTD is not set
> +# CONFIG_FTPGET is not set
> +# CONFIG_FTPPUT is not set
> +# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
> +CONFIG_HOSTNAME=3Dy
> +CONFIG_HTTPD=3Dy
> +CONFIG_FEATURE_HTTPD_RANGES=3Dy
> +CONFIG_FEATURE_HTTPD_USE_SENDFILE=3Dy
> +CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP=3Dy
> +CONFIG_FEATURE_HTTPD_SETUID=3Dy
> +CONFIG_FEATURE_HTTPD_BASIC_AUTH=3Dy
> +CONFIG_FEATURE_HTTPD_AUTH_MD5=3Dy
> +CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES=3Dy
> +CONFIG_FEATURE_HTTPD_CGI=3Dy
> +CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=3Dy
> +CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=3Dy
> +CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=3Dy
> +CONFIG_FEATURE_HTTPD_ERROR_PAGES=3Dy
> +CONFIG_FEATURE_HTTPD_PROXY=3Dy
> +CONFIG_IFCONFIG=3Dy
> +CONFIG_FEATURE_IFCONFIG_STATUS=3Dy
> +# CONFIG_FEATURE_IFCONFIG_SLIP is not set
> +# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
> +CONFIG_FEATURE_IFCONFIG_HW=3Dy
> +CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=3Dy
> +# CONFIG_IFENSLAVE is not set
> +CONFIG_IFUPDOWN=3Dy
> +CONFIG_IFUPDOWN_IFSTATE_PATH=3D"/var/run/ifstate"
> +# CONFIG_FEATURE_IFUPDOWN_IP is not set
> +# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
> +CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=3Dy
> +CONFIG_FEATURE_IFUPDOWN_IPV4=3Dy
> +CONFIG_FEATURE_IFUPDOWN_IPV6=3Dy
> +CONFIG_FEATURE_IFUPDOWN_MAPPING=3Dy
> +# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
> +# CONFIG_INETD is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
> +# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
> +# CONFIG_FEATURE_INETD_RPC is not set
> +CONFIG_IP=3Dy
> +CONFIG_FEATURE_IP_ADDRESS=3Dy
> +CONFIG_FEATURE_IP_LINK=3Dy
> +CONFIG_FEATURE_IP_ROUTE=3Dy
> +CONFIG_FEATURE_IP_TUNNEL=3Dy
> +# CONFIG_FEATURE_IP_RULE is not set
> +# CONFIG_FEATURE_IP_SHORT_FORMS is not set
> +# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
> +# CONFIG_IPADDR is not set
> +# CONFIG_IPLINK is not set
> +# CONFIG_IPROUTE is not set
> +# CONFIG_IPTUNNEL is not set
> +# CONFIG_IPRULE is not set
> +# CONFIG_IPCALC is not set
> +# CONFIG_FEATURE_IPCALC_FANCY is not set
> +# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> +# CONFIG_NAMEIF is not set
> +# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
> +CONFIG_NC=3Dy
> +CONFIG_NC_SERVER=3Dy
> +CONFIG_NC_EXTRA=3Dy
> +CONFIG_NETSTAT=3Dy
> +CONFIG_FEATURE_NETSTAT_WIDE=3Dy
> +CONFIG_FEATURE_NETSTAT_PRG=3Dy
> +CONFIG_NSLOOKUP=3Dy
> +CONFIG_PING=3Dy
> +CONFIG_PING6=3Dy
> +CONFIG_FEATURE_FANCY_PING=3Dy
> +# CONFIG_PSCAN is not set
> +CONFIG_ROUTE=3Dy
> +# CONFIG_SLATTACH is not set
> +CONFIG_TELNET=3Dy
> +# CONFIG_FEATURE_TELNET_TTYPE is not set
> +CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy
> +CONFIG_TELNETD=3Dy
> +# CONFIG_FEATURE_TELNETD_STANDALONE is not set
> +CONFIG_TFTP=3Dy
> +# CONFIG_TFTPD is not set
> +CONFIG_FEATURE_TFTP_GET=3Dy
> +CONFIG_FEATURE_TFTP_PUT=3Dy
> +# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
> +# CONFIG_TFTP_DEBUG is not set
> +CONFIG_TRACEROUTE=3Dy
> +CONFIG_FEATURE_TRACEROUTE_VERBOSE=3Dy
> +CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=3Dy
> +CONFIG_FEATURE_TRACEROUTE_USE_ICMP=3Dy
> +CONFIG_UDHCPD=3Dy
> +CONFIG_DHCPRELAY=3Dy
> +CONFIG_DUMPLEASES=3Dy
> +# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
> +CONFIG_DHCPD_LEASES_FILE=3D"/var/lib/misc/udhcpd.leases"
> +CONFIG_UDHCPC=3Dy
> +CONFIG_FEATURE_UDHCPC_ARPING=3Dy
> +# CONFIG_FEATURE_UDHCP_PORT is not set
> +# CONFIG_UDHCP_DEBUG is not set
> +# CONFIG_FEATURE_UDHCP_RFC3397 is not set
> +CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"@DATADIR@/udhcpc/default.script"
> +CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
> +# CONFIG_VCONFIG is not set
> +CONFIG_WGET=3Dy
> +CONFIG_FEATURE_WGET_STATUSBAR=3Dy
> +CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> +CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> +# CONFIG_ZCIP is not set
> +# CONFIG_TCPSVD is not set
> +# CONFIG_UDPSVD is not set
> +
> +#
> +# Print Utilities
> +#
> +# CONFIG_LPD is not set
> +# CONFIG_LPR is not set
> +# CONFIG_LPQ is not set
> +
> +#
> +# Mail Utilities
> +#
> +# CONFIG_MAKEMIME is not set
> +CONFIG_FEATURE_MIME_CHARSET=3D""
> +# CONFIG_POPMAILDIR is not set
> +# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
> +# CONFIG_REFORMIME is not set
> +# CONFIG_FEATURE_REFORMIME_COMPAT is not set
> +# CONFIG_SENDMAIL is not set
> +# CONFIG_FEATURE_SENDMAIL_MAILX is not set
> +# CONFIG_FEATURE_SENDMAIL_MAILXX is not set
> +
> +#
> +# Process Utilities
> +#
> +CONFIG_FREE=3Dy
> +CONFIG_FUSER=3Dy
> +CONFIG_KILL=3Dy
> +CONFIG_KILLALL=3Dy
> +# CONFIG_KILLALL5 is not set
> +# CONFIG_NMETER is not set
> +# CONFIG_PGREP is not set
> +CONFIG_PIDOF=3Dy
> +CONFIG_FEATURE_PIDOF_SINGLE=3Dy
> +CONFIG_FEATURE_PIDOF_OMIT=3Dy
> +# CONFIG_PKILL is not set
> +CONFIG_PS=3Dy
> +CONFIG_FEATURE_PS_WIDE=3Dy
> +# CONFIG_FEATURE_PS_TIME is not set
> +# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
> +CONFIG_RENICE=3Dy
> +CONFIG_BB_SYSCTL=3Dy
> +CONFIG_TOP=3Dy
> +CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=3Dy
> +CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=3Dy
> +# CONFIG_FEATURE_TOP_SMP_CPU is not set
> +# CONFIG_FEATURE_TOP_DECIMALS is not set
> +# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
> +# CONFIG_FEATURE_TOPMEM is not set
> +CONFIG_UPTIME=3Dy
> +CONFIG_WATCH=3Dy
> +
> +#
> +# Runit Utilities
> +#
> +# CONFIG_RUNSV is not set
> +# CONFIG_RUNSVDIR is not set
> +# CONFIG_FEATURE_RUNSVDIR_LOG is not set
> +# CONFIG_SV is not set
> +CONFIG_SV_DEFAULT_SERVICE_DIR=3D""
> +# CONFIG_SVLOGD is not set
> +# CONFIG_CHPST is not set
> +# CONFIG_SETUIDGID is not set
> +# CONFIG_ENVUIDGID is not set
> +# CONFIG_ENVDIR is not set
> +# CONFIG_SOFTLIMIT is not set
> +# CONFIG_CHCON is not set
> +# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
> +# CONFIG_GETENFORCE is not set
> +# CONFIG_GETSEBOOL is not set
> +# CONFIG_LOAD_POLICY is not set
> +# CONFIG_MATCHPATHCON is not set
> +# CONFIG_RESTORECON is not set
> +# CONFIG_RUNCON is not set
> +# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
> +# CONFIG_SELINUXENABLED is not set
> +# CONFIG_SETENFORCE is not set
> +# CONFIG_SETFILES is not set
> +# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
> +# CONFIG_SETSEBOOL is not set
> +# CONFIG_SESTATUS is not set
> +
> +#
> +# Shells
> +#
> +CONFIG_FEATURE_SH_IS_ASH=3Dy
> +# CONFIG_FEATURE_SH_IS_HUSH is not set
> +# CONFIG_FEATURE_SH_IS_MSH is not set
> +# CONFIG_FEATURE_SH_IS_NONE is not set
> +CONFIG_ASH=3Dy
> +
> +#
> +# Ash Shell Options
> +#
> +CONFIG_ASH_BASH_COMPAT=3Dy
> +CONFIG_ASH_JOB_CONTROL=3Dy
> +CONFIG_ASH_READ_NCHARS=3Dy
> +CONFIG_ASH_READ_TIMEOUT=3Dy
> +CONFIG_ASH_ALIAS=3Dy
> +CONFIG_ASH_MATH_SUPPORT=3Dy
> +# CONFIG_ASH_MATH_SUPPORT_64 is not set
> +CONFIG_ASH_GETOPTS=3Dy
> +CONFIG_ASH_BUILTIN_ECHO=3Dy
> +CONFIG_ASH_BUILTIN_PRINTF=3Dy
> +CONFIG_ASH_BUILTIN_TEST=3Dy
> +# CONFIG_ASH_CMDCMD is not set
> +# CONFIG_ASH_MAIL is not set
> +# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
> +# CONFIG_ASH_RANDOM_SUPPORT is not set
> +CONFIG_ASH_EXPAND_PRMT=3Dy
> +# CONFIG_HUSH is not set
> +# CONFIG_HUSH_HELP is not set
> +# CONFIG_HUSH_INTERACTIVE is not set
> +# CONFIG_HUSH_JOB is not set
> +# CONFIG_HUSH_TICK is not set
> +# CONFIG_HUSH_IF is not set
> +# CONFIG_HUSH_LOOPS is not set
> +# CONFIG_HUSH_CASE is not set
> +# CONFIG_LASH is not set
> +# CONFIG_MSH is not set
> +
> +#
> +# Bourne Shell Options
> +#
> +CONFIG_FEATURE_SH_EXTRA_QUIET=3Dy
> +# CONFIG_FEATURE_SH_STANDALONE is not set
> +# CONFIG_FEATURE_SH_NOFORK is not set
> +# CONFIG_CTTYHACK is not set
> +
> +#
> +# System Logging Utilities
> +#
> +CONFIG_SYSLOGD=3Dy
> +CONFIG_FEATURE_ROTATE_LOGFILE=3Dy
> +CONFIG_FEATURE_REMOTE_LOG=3Dy
> +CONFIG_FEATURE_SYSLOGD_DUP=3Dy
> +CONFIG_FEATURE_IPC_SYSLOG=3Dy
> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D16
> +CONFIG_LOGREAD=3Dy
> +CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
> +CONFIG_KLOGD=3Dy
> +CONFIG_LOGGER=3Dy
> diff --git a/recipes/busybox/busybox-1.18.0/fdisk_nios2.patch b/recipes/b=
usybox/busybox-1.18.0/fdisk_nios2.patch
> new file mode 100644
> index 0000000..648e68e
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
> @@ -0,0 +1,13 @@
> +Index: busybox-1.15.3/util-linux/fdisk_osf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.15.3.orig/util-linux/fdisk_osf.c
> ++++ busybox-1.15.3/util-linux/fdisk_osf.c
> +@@ -44,7 +44,7 @@
> + #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
> +
> + #if defined(i386) || defined(__sparc__) || defined(__arm__) \
> +- || defined(__m68k__) || defined(__mips__) || defined(__s390__) \
> ++ || defined(__m68k__) || defined(__mips__) || defined(__nios2__) \
> + =C2=A0|| defined(__s390__) || defined(__s390x__) \
> + =C2=A0|| defined(__sh__) || defined(__x86_64__) || defined(__avr32__)
> + # define BSD_LABELSECTOR =C2=A0 1
> diff --git a/recipes/busybox/busybox-1.18.0/get_header_tar.patch b/recipe=
s/busybox/busybox-1.18.0/get_header_tar.patch
> new file mode 100644
> index 0000000..62b55af
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/get_header_tar.patch
> @@ -0,0 +1,13 @@
> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/=
get_header_tar.c
> +index 78b0ae2..58b15c1 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -314,6 +314,8 @@ char FAST_FUNC get_header_tar(archive_handle_t *arch=
ive_handle)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file_header->name =3D concat_path_file(tar.prefix, tar.name);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file_header->name =3D xstrdup(tar.name);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strlen(file_header=
->name) > 100)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file_header->name[100] =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Set bits 12-15 of the files mode */
> diff --git a/recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch b/re=
cipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch
> new file mode 100644
> index 0000000..3b975b6
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch
> @@ -0,0 +1,47 @@
> +Index: busybox-1.15.1/examples/udhcp/simple.script
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.15.1.orig/examples/udhcp/simple.script =C2=A0 2009-09-16 2=
2:52:09.000000000 +0200
> ++++ busybox-1.15.1/examples/udhcp/simple.script =C2=A0 =C2=A0 =C2=A0 =C2=
=A02009-09-16 22:57:11.424608476 +0200
> +@@ -10,10 +10,17 @@ NETMASK=3D""
> + BROADCAST=3D"broadcast +"
> + [ -n "$broadcast" ] && BROADCAST=3D"broadcast $broadcast"
> +
> ++# return 0 if root is mounted on a network filesystem
> ++root_is_nfs() {
> ++ =C2=A0 =C2=A0 =C2=A0grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*=
' /proc/mounts
> ++}
> ++
> + case "$1" in
> + =C2=A0 =C2=A0 =C2=A0 deconfig)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! root_is_nfs ; the=
n
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Setting IP addre=
ss 0.0.0.0 on $interface"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifconfig $interface 0.=
0.0.0
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ifconfig $interface 0.0.0.0
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> +
> + =C2=A0 =C2=A0 =C2=A0 renew|bound)
> +@@ -21,15 +28,18 @@ case "$1" in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifconfig $interface $i=
p $NETMASK $BROADCAST
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n "$router" ] ; =
then
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo "Deleting routers"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ! root_is_nfs ; then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "Deleting routers"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while route del default gw 0.0.0.0 dev $i=
nterface 2>/dev/null ; do
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 metric=3D0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for i in $router ; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Adding router $i"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0route add default gw $i dev $interface me=
tric $((metric++))
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0route add default gw $i dev $interface me=
tric $((metric++)) 2>/dev/null
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> +
> diff --git a/recipes/busybox/busybox-1.18.0/udhcpscript.patch b/recipes/b=
usybox/busybox-1.18.0/udhcpscript.patch
> new file mode 100644
> index 0000000..2ffba95
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.0/udhcpscript.patch
> @@ -0,0 +1,13 @@
> +Index: busybox-1.15.1/examples/udhcp/simple.script
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.15.1.orig/examples/udhcp/simple.script =C2=A0 2009-09-12 1=
7:55:36.000000000 +0200
> ++++ busybox-1.15.1/examples/udhcp/simple.script =C2=A0 =C2=A0 =C2=A0 =C2=
=A02009-09-16 22:51:06.599693412 +0200
> +@@ -22,7 +22,7 @@ case "$1" in
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n "$router" ] ; =
then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "Deleting routers"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0while route del default gw 0.0.0.0 dev $interface ; do
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 done
> +
> diff --git a/recipes/busybox/busybox_1.18.0.bb b/recipes/busybox/busybox_=
1.18.0.bb
> new file mode 100644
> index 0000000..3ee2c29
> --- /dev/null
> +++ b/recipes/busybox/busybox_1.18.0.bb
> @@ -0,0 +1,12 @@
> +require busybox_1.1x.inc
> +PR =3D "${INC_PR}.1"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 file://busybox-1.18.0-buildsys.patch \
> + =C2=A0 =C2=A0 =C2=A0 "
> +
> +SRC_URI[md5sum] =3D "7a8150a10558a5292fa1f52f1c65b0f5"
> +SRC_URI[sha256sum] =3D "3a9d5e6929045440ec3d0c9987376cbbb78e98886d6c5fa5=
8fc2306d2662eb00"
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


