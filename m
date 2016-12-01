Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE52471AFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 03:39:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so3183102pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=83frYdzQqiWIiDH3JKpCQnWTwljuCMcdPIO3T97vPfo=;
	b=Lytrb27OcMvab76p3t2JXYkPqEeK0hCYV71So5KBotZZ8q6Z9JeHAYgisen+4F1ti0
	Lho0bZUF3Kl3JPy3Yd7h1fDzgFGfcRHHz4wYFDM9SlKIAZAg7ZBxpP3x3QksH2f0uJnn
	cErj+8T8U+AuakBjSwESRbusqWZMAhzSxa90tayD8QpODCFeEB9pDBOYwcU2C7BxwpxG
	vyuhG59I6f5VjSlKTDz7FW5oDtiaAcrYQeTCUMMckhYtOxrCMK+mwLsZSS96o1X5kY10
	vbR7wgFe9UVdGYTYvbJr9XHjf8spljSA1tJDJxHYIBlveEX4J1KEyb3VauXN/BsRkDaf
	cMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=83frYdzQqiWIiDH3JKpCQnWTwljuCMcdPIO3T97vPfo=;
	b=BjdEyruwg9vRsctdVk+rFCHzsbp2Pf9EqYFYudpyEJFpS9f5reJB+FDTdQ3rGFP1Cu
	XiRbF+c8Icb38FSi/lW4ChbEBDwV2BHah3B6dtkf17PT3DjgkQ46oJkoraLUN27bF6Uf
	7Stu6v55dVVxufil1bC2nvwLZ1KdUlC5yizpxWxsAbDRFRdQQwQ8nkF8QA2MMW0996e3
	SGmI8T2JSAiO0Rd5kq8MkIE27Ojjv8cPF1WqWCADiJmY4c12H3ktIbat2B2hUoXDuUe9
	Bec5yBs7VjmfkKzMrPqhA8CeWM7iGtqh+CKRYHKNRuSoxfBdkBhTWHgJRuiw3FYHkyIK
	YDkg==
X-Gm-Message-State: AKaTC03EFRLCHiQbPCW/vIiNmYUsb4Mbu1L42+k4TiF6NAYb2Eor9m+Jnkeb85Y/gFjxeQ==
X-Received: by 10.99.246.83 with SMTP id u19mr65526205pgj.165.1480563595106;
	Wed, 30 Nov 2016 19:39:55 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	13sm106069284pfz.30.2016.11.30.19.39.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:39:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 30 Nov 2016 19:39:53 -0800
References: <1480507543-21520-1-git-send-email-obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1480507543-21520-1-git-send-email-obi@opendreambox.org>
Message-Id: <48579623-2318-4779-888D-531301D2EC64@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [meta-filesystems][PATCH] xfsprogs: unblacklist and update to 4.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2016 03:39:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2016, at 4:05 AM, Andreas Oberritter <obi@opendreambox.org> =
wrote:
>=20
> A patch similar to drop-configure-check-for-aio.patch was applied =
upstream.

infact we cache this variable anyway so dropping it is fine.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> .../files/drop-configure-check-for-aio.patch       | 93 =
----------------------
> ...erate-crctable-which-is-moved-into-runti.patch} | 46 +++++------
> .../0002-remove-install-as-user.patch.patch}       | 40 ++++------
> .../{xfsprogs_3.2.3.bb =3D> xfsprogs_4.8.0.bb}       | 19 ++---
> 4 files changed, 46 insertions(+), 152 deletions(-)
> delete mode 100644 =
meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio=
.patch
> rename =
meta-filesystems/recipes-utils/xfsprogs/{files/xfsprogs-generate-crctable-=
which-is-moved-into-runti.patch =3D> =
xfsprogs/0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch} =
(82%)
> rename =
meta-filesystems/recipes-utils/xfsprogs/{files/remove-install-as-user.patc=
h =3D> xfsprogs/0002-remove-install-as-user.patch.patch} (90%)
> rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_3.2.3.bb =3D> =
xfsprogs_4.8.0.bb} (64%)
>=20
> diff --git =
a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-a=
io.patch =
b/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-a=
io.patch
> deleted file mode 100644
> index 7601095..0000000
> --- =
a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-a=
io.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -xfsprogs: drop configure check for aio
> -
> -It's unused and breaks compilation with uclibc.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - configure.ac         |  6 +++---
> - m4/Makefile          |  1 -
> - m4/package_aiodev.m4 | 36 ------------------------------------
> - 3 files changed, 3 insertions(+), 40 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b968977..4e2a263 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -47,6 +47,9 @@ AC_ARG_ENABLE(lib64,
> - 	enable_lib64=3Dyes)
> - AC_SUBST(enable_lib64)
> -=20
> -+librt=3D"-lrt"
> -+AC_SUBST(librt)
> -+
> - #
> - # If the user specified a libdir ending in lib64 do not append =
another
> - # 64 to the library names.
> -@@ -92,9 +95,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
> - AC_PACKAGE_UTILITIES(xfsprogs)
> - AC_MULTILIB($enable_lib64)
> -=20
> --AC_PACKAGE_NEED_AIO_H
> --AC_PACKAGE_NEED_LIO_LISTIO
> --
> - AC_PACKAGE_NEED_UUID_H
> - AC_PACKAGE_NEED_UUIDCOMPARE
> -=20
> -diff --git a/m4/Makefile b/m4/Makefile
> -index 654a4fb..d282f0a 100644
> ---- a/m4/Makefile
> -+++ b/m4/Makefile
> -@@ -14,7 +14,6 @@ CONFIGURE =3D \
> -=20
> - LSRCFILES =3D \
> - 	manual_format.m4 \
> --	package_aiodev.m4 \
> - 	package_blkid.m4 \
> - 	package_globals.m4 \
> - 	package_libcdev.m4 \
> -diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
> -index 490d9c8..8b13789 100644
> ---- a/m4/package_aiodev.m4
> -+++ b/m4/package_aiodev.m4
> -@@ -1,37 +1 @@
> --#
> --# Check if we have a libaio.h installed
> --#
> --AC_DEFUN([AC_PACKAGE_WANT_AIO],
> --  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=3Dtrue ], [ have_aio=3Dfalse=
 ])
> --    AC_SUBST(have_aio)
> --  ])
> --
> --#
> --# Check if we have an aio.h installed
> --#
> --AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
> --  [ AC_CHECK_HEADERS(aio.h)
> --    if test $ac_cv_header_aio_h =3D no; then
> --	echo
> --	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
> --	exit 1
> --    fi
> --  ])
> --
> --#
> --# Check if we have the lio_listio routine in either libc/librt
> --#
> --AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
> --  [ AC_CHECK_FUNCS(lio_listio)
> --    if test $ac_cv_func_lio_listio =3D yes; then
> --	librt=3D""
> --    else
> --	AC_CHECK_LIB(rt, lio_listio,, [
> --	    echo
> --	    echo 'FATAL ERROR: could not find a library with =
lio_listio.'
> --	    exit 1],[-lpthread])
> --	librt=3D"-lrt"
> --    fi
> --    AC_SUBST(librt)
> --  ])
> -=20
> ---=20
> -1.8.1.2
> -
> diff --git =
a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable=
-which-is-moved-into-runti.patch =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-=
crctable-which-is-moved-into-runti.patch
> similarity index 82%
> rename from =
meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-w=
hich-is-moved-into-runti.patch
> rename to =
meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-cr=
ctable-which-is-moved-into-runti.patch
> index b204195..d1caca7 100644
> --- =
a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable=
-which-is-moved-into-runti.patch
> +++ =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-=
crctable-which-is-moved-into-runti.patch
> @@ -1,8 +1,8 @@
> -=46rom e58cb210a7c15352040a411d11a8383eac0defda Mon Sep 17 00:00:00 =
2001
> +=46rom 50cc4b1178921dfec0318b0f406618300db24063 Mon Sep 17 00:00:00 =
2001
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
> Date: Tue, 30 Sep 2014 12:16:17 +0800
> -Subject: [PATCH] xfsprogs: generate crctable which is moved into =
runtime from
> - compile
> +Subject: [PATCH 1/2] xfsprogs: generate crctable which is moved into =
runtime
> + from compile
>=20
> After upgraded, There is a compile error except x86,
> Because crc32.c need two arraies crc32table_le and crc32ctable_le from =
crc32table.h,
> @@ -12,25 +12,25 @@ For this, move the function implementation from =
gen_crc32table.c to crc.c
> Upstream-Status: Pending
>=20
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> - libxfs/Makefile | 23 ++----------------
> + libxfs/Makefile | 22 +----------------
>  libxfs/crc32.c  | 75 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> - 2 files changed, 75 insertions(+), 23 deletions(-)
> + 2 files changed, 74 insertions(+), 23 deletions(-)
>=20
> diff --git a/libxfs/Makefile b/libxfs/Makefile
> -index ae15a5d..7670159 100644
> +index 62608bd..358ba8f 100644
> --- a/libxfs/Makefile
> +++ b/libxfs/Makefile
> -@@ -10,7 +10,7 @@ LT_CURRENT =3D 0
> - LT_REVISION =3D 0
> - LT_AGE =3D 0
> +@@ -45,7 +45,6 @@ HFILES =3D \
> + 	libxfs_api_defs.h \
> + 	init.h \
> + 	crc32defs.h \
> +-	crc32table.h \
> + 	libxfs_priv.h \
> + 	xfs_dir2_priv.h
>=20
> --HFILES =3D xfs.h init.h xfs_dir2_priv.h crc32defs.h crc32table.h
> -+HFILES =3D xfs.h init.h xfs_dir2_priv.h crc32defs.h
> - CFILES =3D cache.c \
> - 	crc32.c \
> - 	init.c kmem.c logitem.c radix-tree.c rdwr.c trans.c util.c \
> -@@ -43,7 +43,6 @@ CFILES =3D cache.c \
> +@@ -94,7 +93,6 @@ CFILES =3D cache.c \
>  CFILES +=3D $(PKG_PLATFORM).c
>  PCFILES =3D darwin.c freebsd.c irix.c linux.c
>  LSRCFILES =3D $(shell echo $(PCFILES) | sed -e =
"s/$(PKG_PLATFORM).c//g")
> @@ -38,7 +38,7 @@ index ae15a5d..7670159 100644
>=20
>  #
>  # Tracing flags:
> -@@ -61,25 +60,7 @@ LTLIBS =3D $(LIBPTHREAD) $(LIBRT)
> +@@ -112,25 +110,7 @@ LTLIBS =3D $(LIBPTHREAD) $(LIBRT)
>  # don't try linking xfs_repair with a debug libxfs.
>  DEBUG =3D -DNDEBUG
>=20
> @@ -48,7 +48,7 @@ index ae15a5d..7670159 100644
> -
> -crc32table.h: gen_crc32table.c
> -	@echo "    [CC]     gen_crc32table"
> --	$(Q) $(CC) $(CFLAGS) -o gen_crc32table $<
> +-	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
> -	@echo "    [GENERATE] $@"
> -	$(Q) ./gen_crc32table > crc32table.h
> -
> @@ -59,17 +59,17 @@ index ae15a5d..7670159 100644
> -# disk.
> -crc32selftest: gen_crc32table.c crc32table.h crc32.c
> -	@echo "    [TEST]    CRC32"
> --	$(Q) $(CC) $(CFLAGS) -D CRC32_SELFTEST=3D1 crc32.c -o $@
> +-	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=3D1 crc32.c -o $@
> -	$(Q) ./$@
> +default: ltdepend $(LTLIBRARY)
>=20
> + # set up include/xfs header directory
>  include $(BUILDRULES)
> -=20
> diff --git a/libxfs/crc32.c b/libxfs/crc32.c
> -index 0f847d2..be5fbc3 100644
> +index 783d62e..c5392fa 100644
> --- a/libxfs/crc32.c
> +++ b/libxfs/crc32.c
> -@@ -55,8 +55,6 @@ typedef __u32	u64;
> +@@ -57,8 +57,6 @@ typedef __u32	u64;
>  # define tobe(x) (x)
>  #endif
>=20
> @@ -78,7 +78,7 @@ index 0f847d2..be5fbc3 100644
>  #if CRC_LE_BITS > 8 || CRC_BE_BITS > 8
>=20
>  /* implements slicing-by-4 or slicing-by-8 algorithm */
> -@@ -183,13 +181,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char =
const *p, size_t len)
> +@@ -185,13 +183,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char =
const *p, size_t len)
>  	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
>  }
>  #else
> @@ -166,5 +166,5 @@ index 0f847d2..be5fbc3 100644
>  			(const u32 (*)[256])crc32ctable_le, =
CRC32C_POLY_LE);
>  }
> --=20
> -1.9.1
> +2.7.4
>=20
> diff --git =
a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.pat=
ch =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-=
user.patch.patch
> similarity index 90%
> rename from =
meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch=

> rename to =
meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-us=
er.patch.patch
> index e761db3..2fc087a 100644
> --- =
a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.pat=
ch
> +++ =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-=
user.patch.patch
> @@ -5,11 +5,11 @@ Upstream-Status: Inappropriate [configuration]
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  include/buildmacros |  2 +-
> - include/install-sh  | 95 =
++++++++---------------------------------------------
> - 2 files changed, 14 insertions(+), 83 deletions(-)
> + include/install-sh  | 89 =
++++++++---------------------------------------------
> + 2 files changed, 14 insertions(+), 77 deletions(-)
>=20
> diff --git a/include/buildmacros b/include/buildmacros
> -index 7a01880..0840d55 100644
> +index a7c5d8a..2a89b39 100644
> --- a/include/buildmacros
> +++ b/include/buildmacros
> @@ -30,7 +30,7 @@ OBJECTS =3D $(ASFILES:.s=3D.o) \
> @@ -22,7 +22,7 @@ index 7a01880..0840d55 100644
>  IMAGES_DIR =3D $(TOPDIR)/all-images
>  DIST_DIR =3D $(TOPDIR)/dist
> diff --git a/include/install-sh b/include/install-sh
> -index c952a71..b9d66f7 100755
> +index 9fa706d..ca8920f 100755
> --- a/include/install-sh
> +++ b/include/install-sh
> @@ -24,11 +24,11 @@
> @@ -63,7 +63,7 @@ index c952a71..b9d66f7 100755
> -		    fi
> -		fi
> -	       _st=3D0
> --	    fi    =20
> +-	    fi
> -	fi
> -    fi
> -
> @@ -72,7 +72,7 @@ index c952a71..b9d66f7 100755
> -
> -
>  _manifest ()
> - {=20
> + {
>      echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
> @@ -77,9 +51,6 @@ Sflag=3Dfalse
>  Tflag=3Dfalse
> @@ -112,16 +112,10 @@ index c952a71..b9d66f7 100755
>     m)
>  	DIRMODE=3D`expr $OPTARG`
>  	FILEMODE=3D$DIRMODE
> -@@ -146,18 +109,7 @@ then
> -     # first usage
> -     #
> -     $MKDIR -p $dir=20
> --    status=3D$?
> --    if [ $status -eq 0 ]
> --    then
> --	$CHMOD $DIRMODE $dir
> --	status=3D$?
> --    fi
> +@@ -152,12 +115,7 @@ then
> + 	$CHMOD $DIRMODE $dir
> + 	status=3D$?
> +     fi
> -    if [ $status -eq 0 ]
> -    then
> -	$CHOWN $OWNER $GROUP $dir
> @@ -132,7 +126,7 @@ index c952a71..b9d66f7 100755
>  elif $Sflag
>  then
>      #
> -@@ -203,7 +155,7 @@ then
> +@@ -203,7 +161,7 @@ then
>  			install_name=3D$target/$solib
>  			$CP $solib $install_name
>  			status=3D$?
> @@ -141,7 +135,7 @@ index c952a71..b9d66f7 100755
>  			break
>  		fi
>  	done
> -@@ -254,7 +206,7 @@ then
> +@@ -254,7 +212,7 @@ then
>  	install_name=3D$target/$old_library
>  	$CP $old_library $install_name
>  	status=3D$?
> @@ -150,7 +144,7 @@ index c952a71..b9d66f7 100755
>  	;;
>      *)
>  	echo "$prog: -T $lt_install invalid"
> -@@ -267,7 +219,6 @@ then
> +@@ -267,7 +225,6 @@ then
>  	if [ $status -eq 0 ]
>  	then
>  		$CHMOD $FILEMODE $install_name
> @@ -158,8 +152,8 @@ index c952a71..b9d66f7 100755
>  	fi
>  	;;
>      esac
> -@@ -292,23 +243,10 @@ else
> - 	then=20
> +@@ -292,23 +249,10 @@ else
> + 	then
>  	    if [ -f $dir/$f ]
>  	    then
> -		$CHMOD $FILEMODE $dir/$f
> @@ -184,7 +178,7 @@ index c952a71..b9d66f7 100755
>  	    fi
>  	fi
>      else
> -@@ -334,14 +272,7 @@ else
> +@@ -334,14 +278,7 @@ else
>  	    status=3D$?
>  	    if [ $status -eq 0 ]
>  	    then
> @@ -201,5 +195,5 @@ index c952a71..b9d66f7 100755
>  	    [ $status -ne 0 ] && break
>  	done
> --=20
> -1.8.1.2
> +2.7.4
>=20
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> similarity index 64%
> rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> index 460a898..e5d5984 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> @@ -1,19 +1,15 @@
> SUMMARY =3D "XFS Filesystem Utilities"
> -HOMEPAGE =3D "http://oss.sgi.com/projects/xfs"
> -SECTION =3D "base"
> +HOMEPAGE =3D "http://xfs.org/"
> LICENSE =3D "GPLv2 & LGPLv2.1"
> LICENSE_libhandle =3D "LGPLv2.1"
> LIC_FILES_CHKSUM =3D =
"file://doc/COPYING;md5=3Ddbdb5f4329b7e7145de650e9ecd4ac2a"
> DEPENDS =3D "util-linux"
>=20
> -SRC_URI =3D "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
> -    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch =
\
> -    file://remove-install-as-user.patch \
> -    file://drop-configure-check-for-aio.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "9f383e36682709e62b12c125e5d8b895"
> -SRC_URI[sha256sum] =3D =
"7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce3f4de30827109ac9"
> +SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/fs/xfs/${BPN}/${BP}.tar.xz \
> +           =
file://0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
> +           file://0002-remove-install-as-user.patch.patch"
> +SRC_URI[md5sum] =3D "4f047bc9a28b48a95c6db0ad5ce4dbcb"
> +SRC_URI[sha256sum] =3D =
"82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9"
>=20
> inherit autotools-brokensep
>=20
> @@ -50,6 +46,3 @@ do_install () {
>     # needed for xfsdump
>     oe_runmake install-dev
> }
> -
> -# http://errors.yoctoproject.org/Errors/Details/83236/
> -PNBLACKLIST[xfsprogs] ?=3D "BROKEN: Needs upgrade to 4.5.0 version to =
be compatible with Kernel uapi changes from 4.5"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


