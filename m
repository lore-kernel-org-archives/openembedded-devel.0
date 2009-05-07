Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M29JL-0001iH-Dh
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:31:15 +0200
Received: by yx-out-1718.google.com with SMTP id 36so586710yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QeUAO3UrCWe8xhuPm3CTa8+8wa1h/p6PAQhkLymDbck=;
	b=XISHtBCsnDdhwd66Q9BuiP5gAwrN5s9FWRznT4asWuddUWGnp6R4gjJxpYUL0c778p
	obhQXllHiNVnkl6slwCTKGc5j32yXdc9J+47JZX6PYDORz/xQe2XleXzqIv9PifL6IKf
	5lcv3Iw139jzTdRwoHfp9uAKitEXcUTmj/gJI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=veKU0UIAkd7zQDNq+nOt53uz1ayZZqkjNKOSWYFERgeR2CRUx9ZR90Ts2rXxP7P4ki
	GE8b2gzxtYTSztUXIFxf2ZSToDwpazGp3NPzunZLFOXWZlIfR9Q50MyXAR3i4x7H/sDS
	sqtnUi5LHHjRebty1gjKP/gfm/Ykw6Uz1q9ps=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.58.19 with SMTP id g19mr5929062ana.150.1241724307573; Thu, 
	07 May 2009 12:25:07 -0700 (PDT)
In-Reply-To: <1241720835-17998-1-git-send-email-msmith@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
Date: Thu, 7 May 2009 16:25:07 -0300
X-Google-Sender-Auth: fb56dd0a053b42d8
Message-ID: <be7a9f3d0905071225k4f026f33w9b409c64376f01d3@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] Remove unused grub-0.93.
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
X-List-Received-Date: Thu, 07 May 2009 19:31:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, May 7, 2009 at 3:27 PM, Michael Smith <msmith@cbnco.com> wrote:
> As far as I can tell, only the wrap board and gpe-phone-image are using
> grub, and they use the default version, 0.97.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =A0recipes/grub/grub-0.93/autohell.patch | =A0166 -----------------------=
----------
> =A0recipes/grub/grub-0.93/memcpy.patch =A0 | =A0 13 ---
> =A0recipes/grub/grub-0.93/reiserfs.patch | =A0 11 --
> =A0recipes/grub/grub_0.93.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 15 ---
> =A04 files changed, 0 insertions(+), 205 deletions(-)
> =A0delete mode 100644 recipes/grub/grub-0.93/autohell.patch
> =A0delete mode 100644 recipes/grub/grub-0.93/memcpy.patch
> =A0delete mode 100644 recipes/grub/grub-0.93/reiserfs.patch
> =A0delete mode 100644 recipes/grub/grub_0.93.bb
>
> diff --git a/recipes/grub/grub-0.93/autohell.patch b/recipes/grub/grub-0.=
93/autohell.patch
> deleted file mode 100644
> index ca1f2d1..0000000
> --- a/recipes/grub/grub-0.93/autohell.patch
> +++ /dev/null
> @@ -1,166 +0,0 @@
> ---- grub-0.93/configure.in~ =A0 =A02002-11-29 20:12:08.000000000 +0000
> -+++ grub-0.93/configure.in =A0 =A0 2004-01-04 12:03:05.000000000 +0000
> -@@ -54,7 +54,7 @@
> - _AM_DEPENDENCIES(CC)
> -
> - dnl Because recent automake complains about AS, set it here.
> --AS=3D"$CC"
> -+AM_PROG_AS
> - AC_SUBST(AS)
> -
> - AC_ARG_WITH(binutils,
> ---- grub-0.93/stage1/Makefile.am~ =A0 =A0 =A02002-09-08 02:58:08.0000000=
00 +0100
> -+++ grub-0.93/stage1/Makefile.am =A0 =A0 =A0 2004-01-04 12:31:38.0000000=
00 +0000
> -@@ -4,7 +4,7 @@
> - CLEANFILES =3D $(nodist_pkgdata_DATA)
> -
> - # We can't use builtins or standard includes.
> --AM_ASFLAGS =3D $(STAGE1_CFLAGS) -fno-builtin -nostdinc
> -+AM_CCASFLAGS =3D $(STAGE1_CFLAGS) -fno-builtin -nostdinc $(DEFAULT_INCL=
UDES)
> - LDFLAGS =3D -nostdlib -Wl,-N,-Ttext,7C00
> -
> - noinst_PROGRAMS =3D stage1.exec
> ---- grub-0.93/stage2/Makefile.am~ =A0 =A0 =A02002-11-29 18:00:53.0000000=
00 +0000
> -+++ grub-0.93/stage2/Makefile.am =A0 =A0 =A0 2004-01-04 12:30:29.0000000=
00 +0000
> -@@ -12,6 +12,7 @@
> -
> - # For <stage1.h>.
> - INCLUDES =3D -I$(top_srcdir)/stage1
> -+AM_CCASFLAGS =3D $(DEFAULT_INCLUDES) $(INCLUDES)
> -
> - # The library for /sbin/grub.
> - noinst_LIBRARIES =3D libgrub.a
> -@@ -88,7 +89,7 @@
> - =A0 =A0 =A0 fsys_vstafs.c fsys_xfs.c gunzip.c hercules.c md5.c serial.c=
 \
> - =A0 =A0 =A0 smp-imps.c stage2.c terminfo.c tparm.c
> - pre_stage2_exec_CFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS)
> --pre_stage2_exec_ASFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS)
> -+pre_stage2_exec_CCASFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS) $(AM_CCA=
SFLAGS)
> - pre_stage2_exec_LDFLAGS =3D $(PRE_STAGE2_LINK)
> -
> - if NETBOOT_SUPPORT
> -@@ -109,7 +110,7 @@
> - =A0 =A0 =A0 echo "#define STAGE2_SIZE $$6" > stage2_size.h
> -
> - start_exec_SOURCES =3D start.S
> --start_exec_ASFLAGS =3D $(STAGE2_COMPILE)
> -+start_exec_CCASFLAGS =3D $(STAGE2_COMPILE) $(AM_CCASFLAGS)
> - start_exec_LDFLAGS =3D $(START_LINK)
> -
> - # XXX: automake doesn't provide a way to specify dependencies for objec=
t
> -@@ -127,8 +128,8 @@
> - =A0 =A0 =A0 stage1_5.c fsys_ext2fs.c bios.c
> - e2fs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --e2fs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+e2fs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=3D1 =
\
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - e2fs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For fat_stage1_5 target.
> -@@ -136,8 +137,8 @@
> - =A0 =A0 =A0 stage1_5.c fsys_fat.c bios.c
> - fat_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FAT=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --fat_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FAT=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+fat_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FAT=3D1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - fat_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For ffs_stage1_5 target.
> -@@ -145,8 +146,8 @@
> - =A0 =A0 =A0 stage1_5.c fsys_ffs.c bios.c
> - ffs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FFS=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --ffs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FFS=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+ffs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_FFS=3D1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - ffs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For minix_stage1_5 target.
> -@@ -154,8 +155,8 @@
> - =A0 =A0 =A0 stage1_5.c fsys_minix.c bios.c
> - minix_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_MINIX=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --minix_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_MINIX=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+minix_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_MINIX=3D1 =
\
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - minix_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For reiserfs_stage1_5 target.
> -@@ -163,8 +164,8 @@
> - =A0 =A0 =A0 disk_io.c stage1_5.c fsys_reiserfs.c bios.c
> - reiserfs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_REISERFS=
=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --reiserfs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_REISERFS=
=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+reiserfs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_REISERF=
S=3D1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - reiserfs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For vstafs_stage1_5 target.
> -@@ -172,8 +173,8 @@
> - =A0 =A0 =A0 disk_io.c stage1_5.c fsys_vstafs.c bios.c
> - vstafs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --vstafs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=3D1 =
\
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+vstafs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=3D=
1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - vstafs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For jfs_stage1_5 target.
> -@@ -181,8 +182,8 @@
> - =A0 =A0 =A0 disk_io.c stage1_5.c fsys_jfs.c bios.c
> - jfs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_JFS=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --jfs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_JFS=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+jfs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_JFS=3D1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - jfs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For xfs_stage1_5 target.
> -@@ -190,16 +191,16 @@
> - =A0 =A0 =A0 disk_io.c stage1_5.c fsys_xfs.c bios.c
> - xfs_stage1_5_exec_CFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_XFS=3D1 \
> - =A0 =A0 =A0 -DNO_BLOCK_FILES=3D1
> --xfs_stage1_5_exec_ASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_XFS=3D1 \
> -- =A0 =A0 =A0-DNO_BLOCK_FILES=3D1
> -+xfs_stage1_5_exec_CCASFLAGS =3D $(STAGE1_5_COMPILE) -DFSYS_XFS=3D1 \
> -+ =A0 =A0 =A0-DNO_BLOCK_FILES=3D1 $(AM_CCASFLAGS)
> - xfs_stage1_5_exec_LDFLAGS =3D $(STAGE1_5_LINK)
> -
> - # For diskless target.
> - diskless_exec_SOURCES =3D $(pre_stage2_exec_SOURCES)
> - diskless_exec_CFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
> - =A0 =A0 =A0 -DSUPPORT_DISKLESS=3D1
> --diskless_exec_ASFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
> -- =A0 =A0 =A0-DSUPPORT_DISKLESS=3D1
> -+diskless_exec_CCASFLAGS =3D $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
> -+ =A0 =A0 =A0-DSUPPORT_DISKLESS=3D1 $(AM_CCASFLAGS)
> - diskless_exec_LDFLAGS =3D $(PRE_STAGE2_LINK)
> - diskless_exec_LDADD =3D ../netboot/libdrivers.a
> -
> -@@ -210,7 +211,7 @@
> -
> - # For nbloader target.
> - nbloader_exec_SOURCES =3D nbloader.S
> --nbloader_exec_ASFLAGS =3D $(STAGE2_COMPILE)
> -+nbloader_exec_CCASFLAGS =3D $(STAGE2_COMPILE) $(AM_CCASFLAGS)
> - nbloader_exec_LDFLAGS =3D $(NBLOADER_LINK)
> -
> - # XXX: See the comment for start_exec-start.o.
> -@@ -223,7 +224,7 @@
> -
> - # For pxeloader target.
> - pxeloader_exec_SOURCES =3D pxeloader.S
> --pxeloader_exec_ASFLAGS =3D $(STAGE2_COMPILE)
> -+pxeloader_exec_CCASFLAGS =3D $(STAGE2_COMPILE) $(AM_CCASFLAGS)
> - pxeloader_exec_LDFLAGS =3D $(PXELOADER_LINK)
> -
> - # XXX: See the comment for start_exec-start.o.
> diff --git a/recipes/grub/grub-0.93/memcpy.patch b/recipes/grub/grub-0.93=
/memcpy.patch
> deleted file mode 100644
> index dd5da33..0000000
> --- a/recipes/grub/grub-0.93/memcpy.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> ---- grub-0.93/stage2/asm.S~ =A0 =A02002-12-02 23:18:56.000000000 +0000
> -+++ grub-0.93/stage2/asm.S =A0 =A0 2004-01-04 12:50:11.000000000 +0000
> -@@ -62,6 +62,10 @@
> - start:
> - _start:
> - #endif /* ! STAGE1_5 */
> -+
> -+#undef memcpy
> -+ENTRY(memcpy)
> -+ =A0 =A0 =A0jmp EXT_C(grub_memmove)
> -
> - ENTRY(main)
> - =A0 =A0 =A0 /*
> diff --git a/recipes/grub/grub-0.93/reiserfs.patch b/recipes/grub/grub-0.=
93/reiserfs.patch
> deleted file mode 100644
> index 5b4fb5b..0000000
> --- a/recipes/grub/grub-0.93/reiserfs.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- grub-0.93/stage2/fsys_reiserfs.c~ =A02002-11-29 17:46:01.000000000 +=
0000
> -+++ grub-0.93/stage2/fsys_reiserfs.c =A0 2004-01-04 12:16:34.000000000 +=
0000
> -@@ -112,7 +112,7 @@
> - =A0 /* offset in the log of where to start replay after a crash */
> - =A0 __u32 j_first_unflushed_offset;
> - =A0 /* mount id to detect very old transactions */
> -- =A0__u32 long j_mount_id;
> -+ =A0__u32 j_mount_id;
> - };
> -
> - /* magic string to find desc blocks in the journal */
> diff --git a/recipes/grub/grub_0.93.bb b/recipes/grub/grub_0.93.bb
> deleted file mode 100644
> index 9fc0084..0000000
> --- a/recipes/grub/grub_0.93.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "GRUB is the GRand Unified Bootloader"
> -HOMEPAGE =3D "http://www.gnu.org/software/grub"
> -SECTION =3D "bootloaders"
> -PRIORITY =3D "optional"
> -
> -SRC_URI =3D "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
> - =A0 =A0 =A0 =A0 =A0file://autohell.patch;patch=3D1 \
> - =A0 =A0 =A0 =A0 =A0file://memcpy.patch;patch=3D1 \
> - =A0 =A0 =A0 =A0 =A0file://reiserfs.patch;patch=3D1"
> -
> -inherit autotools
> -
> -COMPATIBLE_HOST =3D 'i.86.*-linux'
> -
> -FILES_${PN}-doc =3D "${datadir}"
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


