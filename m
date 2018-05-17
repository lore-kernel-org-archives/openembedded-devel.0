Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5A774889
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 15:31:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f6-v6so9189263wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=umK/7dQS+hWPVw7iAr7MZTuzMG1hvmFBRl000gfzdcg=;
	b=fuO44bS+oEGOspgA4IWIAuGJC1+Orr7uQiuvfJ6zIRq+mSEZnfHn2+C5MSs9vNSEkU
	kbIQPxz/uIproRfVHY/6rK0y9HNqoQdYaX0AE8Y8bUM0BuTmTkARYGVs8WweQ2WOCdTz
	Dpiuy7qGbDnZmyIOC+fqlgn5eOkaOxuKSPjPUkdZxNZ6/BpI+D5dO+2jfReGrai50uNK
	N4gXr5AxR14+7o8TWMBcDAguEXmvp2Wzal9BhKTpZSzb1laj/uymXZi6VYZhKAZ8X0wh
	rFaEieyuxf3F9qbDVHTGSM9M/02++84uzz/Teyuhk98pcAnA1G9xYCdC2a+cHWt9xCxl
	Mw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=umK/7dQS+hWPVw7iAr7MZTuzMG1hvmFBRl000gfzdcg=;
	b=HulfevIiWyy0PKC9hn84/70n6vJdPp6BfMjF17RGM5M8bUaq9K20VhrgHGfXbLvICQ
	WBwhWmjaPDVK8jS73ssKm/Lj6Rs1j/L3KUuFVXlmTqCs456gGer/bK9fAOC8bi6k/xH4
	QZ8auuVCQPEquxh1chdrjbB3AZTb92XH/KytCH9LsSmPJi/Qve94+ehkXGzyMUUhd6Oj
	gCm/uktvLpA8Q/0S8oGjmqEE/xOvTOMV0rIaI7GO55BZk/Z+/JjiympUj++S2VpgUNsl
	IXSLpeUcpsloOjIg+9LkSToty6jh/i3RGcYCarS49VKKAWMFNBwMvCYtyaZB/eu6smMM
	SBZg==
X-Gm-Message-State: ALKqPwdP6v11MvcsVxSUJ/EbNHUPBREPX6ZGRGHgj1k0FdP0GcJhpbFV
	DQJqsyNTCnHJacaI7cyC7LFabWZdGdMbZBlLGiI=
X-Google-Smtp-Source: AB8JxZrgDGcihRKh8tUOufGeHi7WjPu4WRzS7UFVg1mWi8vbAnYXl0oTCHzVClb3rwxQk8Xh39VSJ6ItERT1dQc1TCg=
X-Received: by 2002:a50:e681:: with SMTP id
	z1-v6mr7511004edm.275.1526571070151; 
	Thu, 17 May 2018 08:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Thu, 17 May 2018 08:31:09 -0700 (PDT)
In-Reply-To: <0bb5eeb2-a597-38bd-bfd6-99dbf8c786e9@gmail.com>
References: <1526249791-5375-1-git-send-email-andrea.adami@gmail.com>
	<0bb5eeb2-a597-38bd-bfd6-99dbf8c786e9@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 17 May 2018 17:31:09 +0200
Message-ID: <CAAQYJAvAyuatyYg6xn3Xw5-uLdY5NcCM8qCTz0D+KTRUAY745w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] ubi-utils-klibc: update from v. 1.5.2 to 2.0.2
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
X-List-Received-Date: Thu, 17 May 2018 15:31:10 -0000
X-Groupsio-MsgNum: 72214
Content-Type: multipart/mixed; boundary="0000000000005cb319056c688695"

--0000000000005cb319056c688695
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 4:15 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/13/2018 03:16 PM, Andrea Adami wrote:
>> Update to new version and drop accepted patches.
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  .../0001-Makefile-build-ubi-utils-only.patch       |  87 ------
>>  .../0002-common.mk-for-klibc-CC-is-klcc.patch      |  27 --
>>  ...bubi.c-add-klibc-specific-fixes-for-ioctl.patch |  76 -----
>>  ...patibility-to-dietlibc-klibc-musl-libc-af.patch |  88 ------
>>  ...-more-workarounds-for-klibc-compatibility.patch |  52 ----
>>  ...rser-remove-unused-function-needing-float.patch |  85 ------
>>  ...ls-common.c-convert-to-integer-arithmetic.patch |  64 ----
>>  ...ubiformat.c-convert-to-integer-arithmetic.patch |  44 ---
>>  ...arnings-about-implicit-non-const-casting-.patch |  48 ---
>>  ...mple-getline-implementation-to-libmissing.patch | 187 ++++++++++++
>>  ...doing-preprocessor-magic-just-output-off_.patch | 326 ++++++++++++++=
+++++++
>>  .../0003-Makefile.am-only-build-ubi-utils.patch    |  34 +++
>>  ...s-common.h-no-features.h-for-klibc-builds.patch |  38 +++
>>  ...ils-klibc_1.5.2.bb =3D> ubi-utils-klibc_2.0.2.bb} |  26 +-
>
> This fails on qemuarm with the following error.
>
> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
> file or directory
> |  #include <execinfo.h>
> |           ^~~~~~~~~~~~
> | compilation terminated.
> | Makefile:2452: recipe for target 'ubi-utils/ubimkvol.o' failed
> | make: *** [ubi-utils/ubimkvol.o] Error 1
> | Makefile:2452: recipe for target 'ubi-utils/ubicrc32.o' failed
> | make: *** [ubi-utils/ubicrc32.o] Error 1
> | In file included from ../git/include/common.h:38:0,
> |                  from ../git/ubi-utils/ubiupdatevol.c:40:
> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
> file or directory
> |  #include <execinfo.h>
> |           ^~~~~~~~~~~~
> | compilation terminated.
> | Makefile:2452: recipe for target 'ubi-utils/ubiupdatevol.o' failed
> | make: *** [ubi-utils/ubiupdatevol.o] Error 1
> | ERROR: oe_runmake failed
>
> http://errors.yoctoproject.org/Errors/Build/60410/
>
> - Armin


Hi Armin,
thanks for testing.

Strange, I did cross-build for all archs, maybe some oe-core change.
I'll compare with my log (attached the quemuarm).

Cheers
Andrea

>
>>  14 files changed, 598 insertions(+), 584 deletions(-)
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0001-Makefile-build-ubi-utils-only.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0005-common.h-more-workarounds-for-klibc-compatibility.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0006-libiniparser-remove-unused-function-needing-float.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch
>>  delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
1.5.2/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
>>  create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
2.0.2/0001-Add-simple-getline-implementation-to-libmissing.patch
>>  create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
>>  create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
>>  create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-=
2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
>>  rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_1.5.2.bb =
=3D> ubi-utils-klibc_2.0.2.bb} (64%)
>>
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
001-Makefile-build-ubi-utils-only.patch b/meta-initramfs/recipes-devtools/m=
td/ubi-utils-klibc-1.5.2/0001-Makefile-build-ubi-utils-only.patch
>> deleted file mode 100644
>> index 6ac2cca..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Mak=
efile-build-ubi-utils-only.patch
>> +++ /dev/null
>> @@ -1,87 +0,0 @@
>> -From 1c989e4c36d0bf76ab444f984bc73b98eeacd03f Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 29 Jun 2014 00:32:29 +0200
>> -Subject: [PATCH 1/9] Makefile: build ubi-utils only
>> -
>> -We build all the static ubi-utils but actually only ubiattach is needed=
 in
>> -a minimalistic initramfs for the mount of ubi volumes.
>> -
>> -More fixes are needed in order to build the full mtd-utils.
>> -The first issue is:
>> -
>> -| mkfs.jffs2.c:64:20: fatal error: libgen.h: No such file or directory
>> -|  #include <libgen.h>
>> -
>> -Removing the include then the second error is:
>> -
>> -| mkfs.jffs2.c:1570:22: error: '_SC_PAGESIZE' undeclared
>> -| (first use in this function)
>> -|   page_size =3D sysconf(_SC_PAGESIZE);
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - Makefile | 26 ++------------------------
>> - 1 file changed, 2 insertions(+), 24 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index 3ce8587..8b79f71 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -16,28 +16,11 @@ endif
>> -
>> - TESTS =3D tests
>> -
>> --MTD_BINS =3D \
>> --    ftl_format flash_erase nanddump doc_loadbios \
>> --    ftl_check mkfs.jffs2 flash_lock flash_unlock \
>> --    flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
>> --    mtd_debug flashcp nandwrite nandtest mtdpart \
>> --    jffs2dump \
>> --    nftldump nftl_format docfdisk \
>> --    rfddump rfdformat \
>> --    serve_image recv_image \
>> --    sumtool jffs2reader
>> - UBI_BINS =3D \
>> -     ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
>> -     ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
>> -
>> --BINS =3D $(MTD_BINS)
>> --BINS +=3D mkfs.ubifs/mkfs.ubifs
>> --BINS +=3D $(addprefix ubi-utils/,$(UBI_BINS))
>> --SCRIPTS =3D flash_eraseall
>> --
>> --TARGETS =3D $(BINS)
>> --TARGETS +=3D lib/libmtd.a
>> --TARGETS +=3D ubi-utils/libubi.a
>> -+BINS =3D $(addprefix ubi-utils/,$(UBI_BINS))
>> -
>> - OBJDEPS =3D $(BUILDDIR)/include/version.h
>> -
>> -@@ -61,12 +44,9 @@ endif
>> -     rm -f $(BUILDDIR)/include/version.h
>> -     $(MAKE) -C $(TESTS) clean
>> -
>> --install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
>> -+install:: $(addprefix $(BUILDDIR)/,${BINS})
>> -     mkdir -p ${DESTDIR}/${SBINDIR}
>> -     install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
>> --    mkdir -p ${DESTDIR}/${MANDIR}/man1
>> --    install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
>> --    -gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
>> -
>> - tests::
>> -     $(MAKE) -C $(TESTS)
>> -@@ -91,8 +71,6 @@ LDLIBS_mkfs.jffs2  =3D -lz $(LZOLDLIBS)
>> - LDFLAGS_jffs2reader =3D $(ZLIBLDFLAGS) $(LZOLDFLAGS)
>> - LDLIBS_jffs2reader  =3D -lz $(LZOLDLIBS)
>> -
>> --$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
>> --
>> - #
>> - # Common libmtd
>> - #
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
002-common.mk-for-klibc-CC-is-klcc.patch b/meta-initramfs/recipes-devtools/=
mtd/ubi-utils-klibc-1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch
>> deleted file mode 100644
>> index c23d11f..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-com=
mon.mk-for-klibc-CC-is-klcc.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -From 89c76bbe82a2029a25b0654eb0a1d0b22d6e6877 Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 29 Jun 2014 00:37:28 +0200
>> -Subject: [PATCH 2/9] common.mk: for klibc $(CC) is klcc
>> -
>> -Do not hardcode: assign the value to the variable if it is not already =
defined.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - common.mk | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/common.mk b/common.mk
>> -index ba87377..126d11a 100644
>> ---- a/common.mk
>> -+++ b/common.mk
>> -@@ -1,4 +1,4 @@
>> --CC :=3D $(CROSS)gcc
>> -+CC ?=3D $(CROSS)gcc
>> - AR :=3D $(CROSS)ar
>> - RANLIB :=3D $(CROSS)ranlib
>> -
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch b/meta-initramfs/reci=
pes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add-klibc-specific-fix=
es-for-ioctl.patch
>> deleted file mode 100644
>> index 9ad4a5b..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-lib=
ubi.c-add-klibc-specific-fixes-for-ioctl.patch
>> +++ /dev/null
>> @@ -1,76 +0,0 @@
>> -From fecbb7056d621a30f7106e67f5fe209763571b70 Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 29 Jun 2014 00:40:15 +0200
>> -Subject: [PATCH 3/9] libubi.c: add klibc specific fixes for ioctl
>> -
>> -First issue is that ioctl() in klibc doesn't expect a constant as arg3.
>> -Second issue is that arg3 in klibc ioctl() implementation is not option=
al.
>> -
>> -Fixes:
>> -
>> -| ubi-utils/libubi.c: In function 'do_attach':
>> -| ubi-utils/libubi.c:698:8: warning: passing argument 3 of 'ioctl' disc=
ards
>> -| 'const' qualifier from pointer target type
>> -|   ret =3D ioctl(fd, UBI_IOCATT, r);
>> -|         ^
>> -| In file included from ubi-utils/libubi.c:32:0:
>> -| .../lib/klibc/include/sys/ioctl.h:15:14: note: expected 'void *' but =
argument
>> -| is of type 'const struct ubi_attach_req *'
>> -|  __extern int ioctl(int, int, void *);
>> -|               ^
>> -
>> -| ubi-utils/libubi.c: In function 'ubi_vol_block_create':
>> -| ubi-utils/libubi.c:1118:9: error: too few arguments to function 'ioct=
l'
>> -|   return ioctl(fd, UBI_IOCVOLCRBLK);
>> -|          ^
>> -| In file included from ubi-utils/libubi.c:32:0:
>> -| .../lib/klibc/include/sys/ioctl.h:15:14: note: declared here
>> -|  __extern int ioctl(int, int, void *);
>> -|               ^
>> -| ubi-utils/libubi.c: In function 'ubi_vol_block_remove':
>> -| ubi-utils/libubi.c:1123:9: error: too few arguments to function 'ioct=
l'
>> -|   return ioctl(fd, UBI_IOCVOLRMBLK);
>> -|          ^
>> -| In file included from ubi-utils/libubi.c:32:0:
>> -| .../usr/lib/klibc/include/sys/ioctl.h:15:14: note: declared here
>> -|  __extern int ioctl(int, int, void *);
>> -|               ^
>> -
>> -Upstream-Status: Accepted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - ubi-utils/libubi.c | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
>> -index 97c0434..2b49833 100644
>> ---- a/ubi-utils/libubi.c
>> -+++ b/ubi-utils/libubi.c
>> -@@ -687,7 +687,7 @@ void libubi_close(libubi_t desc)
>> -  * success and %-1 in case of failure. @r->ubi_num contains newly crea=
ted UBI
>> -  * device number.
>> -  */
>> --static int do_attach(const char *node, const struct ubi_attach_req *r)
>> -+static int do_attach(const char *node, struct ubi_attach_req *r)
>> - {
>> -     int fd, ret;
>> -
>> -@@ -1115,12 +1115,12 @@ int ubi_rsvol(libubi_t desc, const char *node, =
int vol_id, long long bytes)
>> -
>> - int ubi_vol_block_create(int fd)
>> - {
>> --    return ioctl(fd, UBI_IOCVOLCRBLK);
>> -+    return ioctl(fd, UBI_IOCVOLCRBLK, NULL);
>> - }
>> -
>> - int ubi_vol_block_remove(int fd)
>> - {
>> --    return ioctl(fd, UBI_IOCVOLRMBLK);
>> -+    return ioctl(fd, UBI_IOCVOLRMBLK, NULL);
>> - }
>> -
>> - int ubi_update_start(libubi_t desc, int fd, long long bytes)
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch b/meta-initr=
amfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-compatibility-=
to-dietlibc-klibc-musl-libc-af.patch
>> deleted file mode 100644
>> index 2f31fb4..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Res=
tore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
>> +++ /dev/null
>> @@ -1,88 +0,0 @@
>> -From b668cb75cb7e72ff92055209130d4cd4b3cacbdb Mon Sep 17 00:00:00 2001
>> -From: Thorsten Glaser <tg@mirbsd.org>
>> -Date: Fri, 20 Jun 2014 10:56:27 +0000
>> -Subject: [PATCH 4/9] Restore compatibility to dietlibc, klibc, musl lib=
c after
>> - commit 4f1b108
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Each C library has their own way to define off_t, and the <features.h>
>> -header is nonstandard and specific to the GNU libc and those that clone
>> -it (uClibc). Fefe=E2=80=99s dietlibc uses different flags, and klibc al=
ways uses
>> -a 64-bit off_t (like the BSDs); musl libc cannot be recognised using cp=
p
>> -instructions, so we assume 64 bit there (and on unknown C libraries) an=
d
>> -leave it to the user to submit a follow-up fix if we guess wrong. I als=
o
>> -added a static assertion to verify the 64 bit guess is correct.
>> -
>> -It would be really better using a configure script for this instead.
>> -
>> -Fixes:
>> -|   CC      lib/libmtd.o
>> -| In file included from ubi-utils/ubiutils-common.c:35:0:
>> -| ./include/common.h:29:22: fatal error: features.h: No such file or di=
rectory
>> -|  #include <features.h>
>> -|                       ^
>> -| compilation terminated.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - include/common.h | 24 ++++++++++++++++++++++++
>> - 1 file changed, 24 insertions(+)
>> -
>> -diff --git a/include/common.h b/include/common.h
>> -index fb0ca83..5a20964 100644
>> ---- a/include/common.h
>> -+++ b/include/common.h
>> -@@ -26,7 +26,9 @@
>> - #include <string.h>
>> - #include <fcntl.h>
>> - #include <errno.h>
>> -+#if defined(__GLIBC__) || defined(__UCLIBC__)
>> - #include <features.h>
>> -+#endif
>> - #include <inttypes.h>
>> - #include "version.h"
>> -
>> -@@ -67,6 +69,21 @@ extern "C" {
>> - #endif
>> -
>> - /* define a print format specifier for off_t */
>> -+#if defined(__KLIBC__)
>> -+/* always 64 bit on klibc */
>> -+#define PRIxoff_t PRIx64
>> -+#define PRIdoff_t PRId64
>> -+#elif defined(__dietlibc__)
>> -+/* depends on compiler flags on dietlibc */
>> -+#if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS =3D=3D 64)
>> -+#define PRIxoff_t PRIx64
>> -+#define PRIdoff_t PRId64
>> -+#else
>> -+#define PRIxoff_t "l"PRIx32
>> -+#define PRIdoff_t "l"PRId32
>> -+#endif
>> -+#elif defined(__GLIBC__) || defined(__UCLIBC__)
>> -+/* depends on compiler flags on glibc and uClibc */
>> - #ifdef __USE_FILE_OFFSET64
>> - #define PRIxoff_t PRIx64
>> - #define PRIdoff_t PRId64
>> -@@ -74,6 +91,13 @@ extern "C" {
>> - #define PRIxoff_t "l"PRIx32
>> - #define PRIdoff_t "l"PRId32
>> - #endif
>> -+#else
>> -+/* unknown libc or musl */
>> -+#define PRIxoff_t PRIx64
>> -+#define PRIdoff_t PRId64
>> -+/* verify our guess of 64 bit is correct */
>> -+static char __PRIxoff_t_static_assert[sizeof(off_t) =3D=3D 8 ? 1 : -1]=
;
>> -+#endif
>> -
>> - /* Verbose messages */
>> - #define bareverbose(verbose, fmt, ...) do {                        \
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
005-common.h-more-workarounds-for-klibc-compatibility.patch b/meta-initramf=
s/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-more-workarounds=
-for-klibc-compatibility.patch
>> deleted file mode 100644
>> index 8309a72..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-com=
mon.h-more-workarounds-for-klibc-compatibility.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From 5d4a66b502003ef385dab31a17012246407e7364 Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 29 Jun 2014 00:44:03 +0200
>> -Subject: [PATCH 5/9] common.h: more workarounds for klibc compatibility
>> -
>> -Patch is addressing two issues:
>> -* First,  Klibc doesn't have rpmatch().
>> -* Second, Klibc lacks getline()
>> -
>> -Fixes:
>> -|   LD      ubi-utils/ubiformat
>> -| .../git/ubi-utils/ubiformat.o: In function `prompt':
>> -| .../git/./include/common.h:157: undefined reference to `getline'
>> -| .../git/./include/common.h:164: undefined reference to `rpmatch'
>> -| .../git/./include/common.h:157: undefined reference to `getline'
>> -| .../git/./include/common.h:164: undefined reference to `rpmatch'
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - include/common.h | 8 +++++---
>> - 1 file changed, 5 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/include/common.h b/include/common.h
>> -index 5a20964..2f51e1c 100644
>> ---- a/include/common.h
>> -+++ b/include/common.h
>> -@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *resp)
>> -  */
>> - static inline bool prompt(const char *msg, bool def)
>> - {
>> --    char *line =3D NULL;
>> --    size_t len;
>> -+    char *line;
>> -     bool ret =3D def;
>> -
>> -+    const int sizeof_line =3D 2;
>> -+    line =3D malloc(sizeof_line);
>> -+
>> -     do {
>> -             normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n'=
 : 'N');
>> -             fflush(stdout);
>> -
>> --            while (getline(&line, &len, stdin) =3D=3D -1) {
>> -+            while (fgets(line, sizeof_line, stdin) =3D=3D NULL) {
>> -                     printf("failed to read prompt; assuming '%s'\n",
>> -                             def ? "yes" : "no");
>> -                     break;
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
006-libiniparser-remove-unused-function-needing-float.patch b/meta-initramf=
s/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser-remove-unuse=
d-function-needing-float.patch
>> deleted file mode 100644
>> index d046f95..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-lib=
iniparser-remove-unused-function-needing-float.patch
>> +++ /dev/null
>> @@ -1,85 +0,0 @@
>> -From 2af30e9b2988111e45ed6ea6af55e49ec7cb1cb1 Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 29 Jun 2014 00:44:57 +0200
>> -Subject: [PATCH 6/9] libiniparser: remove unused function needing float
>> -
>> -Fixes:
>> -|   LD      ubi-utils/ubiformat
>> -| .../git/ubi-utils/libiniparser.a(libiniparser.o): In function
>> -| `  LD      ubi-utils/ubirename
>> -| iniparser_getdouble':
>> -| .../git/ubi-utils/libiniparser.c:336: undefined reference to `atof'
>> -
>> -Grep doesn't reveal any occurrence of iniparser_getdouble(), using atof=
() so
>> -remove it: floating-point is not supported in klibc
>> -
>> -Upstream-Status: Accepted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - ubi-utils/include/libiniparser.h | 15 ---------------
>> - ubi-utils/libiniparser.c         | 22 ----------------------
>> - 2 files changed, 37 deletions(-)
>> -
>> -diff --git a/ubi-utils/include/libiniparser.h b/ubi-utils/include/libin=
iparser.h
>> -index be3c667..abd77aa 100644
>> ---- a/ubi-utils/include/libiniparser.h
>> -+++ b/ubi-utils/include/libiniparser.h
>> -@@ -158,21 +158,6 @@ int iniparser_getint(dictionary * d, const char * =
key, int notfound);
>> -
>> - /*--------------------------------------------------------------------=
-----*/
>> - /**
>> --  @brief    Get the string associated to a key, convert to a double
>> --  @param    d Dictionary to search
>> --  @param    key Key string to look for
>> --  @param    notfound Value to return in case of error
>> --  @return   double
>> --
>> --  This function queries a dictionary for a key. A key as read from an
>> --  ini file is given as "section:key". If the key cannot be found,
>> --  the notfound value is returned.
>> -- */
>> --/*--------------------------------------------------------------------=
------*/
>> --double iniparser_getdouble(dictionary * d, char * key, double notfound=
);
>> --
>> --/*--------------------------------------------------------------------=
-----*/
>> --/**
>> -   @brief    Get the string associated to a key, convert to a boolean
>> -   @param    d Dictionary to search
>> -   @param    key Key string to look for
>> -diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
>> -index 898f57f..ba70c08 100644
>> ---- a/ubi-utils/libiniparser.c
>> -+++ b/ubi-utils/libiniparser.c
>> -@@ -316,28 +316,6 @@ int iniparser_getint(dictionary * d, const char * =
key, int notfound)
>> -
>> - /*--------------------------------------------------------------------=
-----*/
>> - /**
>> --  @brief    Get the string associated to a key, convert to a double
>> --  @param    d Dictionary to search
>> --  @param    key Key string to look for
>> --  @param    notfound Value to return in case of error
>> --  @return   double
>> --
>> --  This function queries a dictionary for a key. A key as read from an
>> --  ini file is given as "section:key". If the key cannot be found,
>> --  the notfound value is returned.
>> -- */
>> --/*--------------------------------------------------------------------=
------*/
>> --double iniparser_getdouble(dictionary * d, char * key, double notfound=
)
>> --{
>> --    char    *   str ;
>> --
>> --    str =3D iniparser_getstring(d, key, INI_INVALID_KEY);
>> --    if (str=3D=3DINI_INVALID_KEY) return notfound ;
>> --    return atof(str);
>> --}
>> --
>> --/*--------------------------------------------------------------------=
-----*/
>> --/**
>> -   @brief    Get the string associated to a key, convert to a boolean
>> -   @param    d Dictionary to search
>> -   @param    key Key string to look for
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
007-mtd-utils-common.c-convert-to-integer-arithmetic.patch b/meta-initramfs=
/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-common.c-convert=
-to-integer-arithmetic.patch
>> deleted file mode 100644
>> index 36b012f..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd=
-utils-common.c-convert-to-integer-arithmetic.patch
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -From 41e7c76b0853bf5241b38b8167dfd57c27fef1eb Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sun, 28 Jan 2018 21:47:59 +0100
>> -Subject: [PATCH 7/9] mtd-utils: common.c: convert to integer arithmetic
>> -
>> -We use floating point just to print out KiB, MiB, GiB.
>> -Avoid that to be klibc friendly.
>> -
>> -Fixes compilation for aarch64 against klibc:
>> -
>> -error: '-mgeneral-regs-only' is incompatible with floating-point argume=
nt
>> -|    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
>> -etc.
>> -
>> -Note:
>> -* In the KiB case, we could apparently multiply by 100 before dividing
>> -  without risking overflow. This code simply avoids multiplications.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - ubi-utils/ubiutils-common.c | 18 ++++++++++++------
>> - 1 file changed, 12 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
>> -index 6609a6b..0ded2a4 100644
>> ---- a/ubi-utils/ubiutils-common.c
>> -+++ b/ubi-utils/ubiutils-common.c
>> -@@ -107,6 +107,9 @@ long long ubiutils_get_bytes(const char *str)
>> - void ubiutils_print_bytes(long long bytes, int bracket)
>> - {
>> -     const char *p;
>> -+    int GiB =3D 1024 * 1024 * 1024;
>> -+    int MiB =3D 1024 * 1024;
>> -+    int KiB =3D 1024;
>> -
>> -     if (bracket)
>> -             p =3D " (";
>> -@@ -115,12 +118,15 @@ void ubiutils_print_bytes(long long bytes, int br=
acket)
>> -
>> -     printf("%lld bytes", bytes);
>> -
>> --    if (bytes > 1024 * 1024 * 1024)
>> --            printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 102=
4));
>> --    else if (bytes > 1024 * 1024)
>> --            printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
>> --    else if (bytes > 1024 && bytes !=3D 0)
>> --            printf("%s%.1f KiB", p, (double)bytes / 1024);
>> -+    if (bytes > GiB)
>> -+            printf("%s%lld.%lld GiB", p,
>> -+                   bytes / GiB, bytes % GiB / (GiB / 10));
>> -+    else if (bytes > MiB)
>> -+            printf("%s%lld.%lld MiB", p,
>> -+                   bytes / MiB, bytes % MiB / (MiB / 10));
>> -+    else if (bytes > KiB && bytes !=3D 0)
>> -+            printf("%s%lld.%lld KiB", p,
>> -+                   bytes / KiB, bytes % KiB / (KiB / 10));
>> -     else
>> -             return;
>> -
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch b/meta-initra=
mfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ubiformat.c-c=
onvert-to-integer-arithmetic.patch
>> deleted file mode 100644
>> index 5bd0574..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi=
-utils-ubiformat.c-convert-to-integer-arithmetic.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From e6f1a85c0a3df24fe3ca9a520dc697105e75a80c Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sat, 27 Jan 2018 09:39:26 +0100
>> -Subject: [PATCH 8/9] ubi-utils: ubiformat.c: convert to integer arithme=
tic
>> -
>> -Do not cast percent to double, it is just used as upper limit.
>> -Avoid floating point to fix compilation for aarch64 against klibc:
>> -
>> -error: '-mgeneral-regs-only' is incompatible with floating-point code
>> -|    int percent =3D ((double)si->ok_cnt)/si->good_cnt * 100;
>> -|        ^~~~~~~
>> -
>> -Notes:
>> -* The checks in the code above this line ensure that si->good_cnt is no=
t 0.
>> -
>> -* The code assumes  si->good_cnt * 100  will not overflow, then we can =
use
>> -  (si->ok_cnt * 100) safely because the former is bigger.
>> -
>> -* The truncated result does not affect the logic:
>> -  i.e. a value of 49.9 is truncated to 49 and is still <50.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - ubi-utils/ubiformat.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
>> -index 21409ca..d93164a 100644
>> ---- a/ubi-utils/ubiformat.c
>> -+++ b/ubi-utils/ubiformat.c
>> -@@ -843,7 +843,7 @@ int main(int argc, char * const argv[])
>> -     }
>> -
>> -     if (!args.override_ec && si->empty_cnt < si->good_cnt) {
>> --            int percent =3D ((double)si->ok_cnt)/si->good_cnt * 100;
>> -+            int percent =3D (si->ok_cnt * 100) / si->good_cnt;
>> -
>> -             /*
>> -              * Make sure the majority of eraseblocks have valid
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0=
009-Eliminate-warnings-about-implicit-non-const-casting-.patch b/meta-initr=
amfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-warnings-abo=
ut-implicit-non-const-casting-.patch
>> deleted file mode 100644
>> index 658246a..0000000
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eli=
minate-warnings-about-implicit-non-const-casting-.patch
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -From 2229f3b9fd4bad47794c28e558ad273173cea73d Mon Sep 17 00:00:00 2001
>> -From: Andrea Adami <andrea.adami@gmail.com>
>> -Date: Sat, 27 Jan 2018 09:52:46 +0100
>> -Subject: [PATCH 9/9] Eliminate warnings about implicit non-const castin=
g in
>> - libmtd
>> -
>> -The mtd_get_dev_info1 function reads (among other things) name and type
>> -string into coresponding struct mtd_dev_info fields.
>> -
>> -The struct mtd_dev_info has the string fields marked const, requiring
>> -them to be cast to non-const version during initialization.
>> -
>> -This cast was previously omitted from the dev_read_data calls,
>> -triggering warnings during compilation.
>> -
>> -Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> -Signed-off-by: Richard Weinberger <richard@nod.at>
>> -
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ----
>> - lib/libmtd.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/lib/libmtd.c b/lib/libmtd.c
>> -index 60b4782..5f0bcbc 100644
>> ---- a/lib/libmtd.c
>> -+++ b/lib/libmtd.c
>> -@@ -746,13 +746,13 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num,=
 struct mtd_dev_info *mtd)
>> -     if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
>> -             return -1;
>> -
>> --    ret =3D dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
>> -+    ret =3D dev_read_data(lib->mtd_name, mtd_num, (char *)&mtd->name,
>> -                         MTD_NAME_MAX + 1);
>> -     if (ret < 0)
>> -             return -1;
>> -     ((char *)mtd->name)[ret - 1] =3D '\0';
>> -
>> --    ret =3D dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
>> -+    ret =3D dev_read_data(lib->mtd_type, mtd_num, (char *)&mtd->type_s=
tr,
>> -                         MTD_TYPE_MAX + 1);
>> -     if (ret < 0)
>> -             return -1;
>> ---
>> -2.7.4
>> -
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0=
001-Add-simple-getline-implementation-to-libmissing.patch b/meta-initramfs/=
recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add-simple-getline-implemen=
tation-to-libmissing.patch
>> new file mode 100644
>> index 0000000..d4c6d87
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add=
-simple-getline-implementation-to-libmissing.patch
>> @@ -0,0 +1,187 @@
>> +From 10c289454dad34632d767694aecb508dae5073bf Mon Sep 17 00:00:00 2001
>> +From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> +Date: Thu, 1 Feb 2018 12:16:18 +0100
>> +Subject: [PATCH 1/4] Add simple getline() implementation to libmissing
>> +
>> +Some C libraries, like klibc don't implement getline(). This patch
>> +adds a simple stub implementation to libmissing that does an fgets
>> +into a stack allocated buffer and returns the result.
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> +---
>> + configure.ac              |  1 +
>> + include/common.h          |  1 +
>> + include/libmissing.h      |  7 +++++++
>> + jffsX-utils/Makemodule.am |  2 +-
>> + lib/Makemodule.am         |  3 ++-
>> + lib/getline.c             | 36 ++++++++++++++++++++++++++++++++++++
>> + misc-utils/Makemodule.am  |  2 ++
>> + ubi-utils/Makemodule.am   |  2 +-
>> + ubifs-utils/Makemodule.am |  1 +
>> + 9 files changed, 52 insertions(+), 3 deletions(-)
>> + create mode 100644 lib/getline.c
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 83d754f..5af0115 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -191,6 +191,7 @@ if test "x$need_cmocka" =3D "xyes"; then
>> + fi
>> +
>> + AC_CHECK_HEADERS([execinfo.h])
>> ++AC_CHECK_FUNCS([getline])
>> +
>> + ##### produce summary on dependencies #####
>> +
>> +diff --git a/include/common.h b/include/common.h
>> +index 2ce5d22..f8f72ea 100644
>> +--- a/include/common.h
>> ++++ b/include/common.h
>> +@@ -32,6 +32,7 @@
>> + #include <sys/sysmacros.h>
>> +
>> + #include "config.h"
>> ++#include "libmissing.h"
>> +
>> + #ifndef PROGRAM_NAME
>> + # error "You must define PROGRAM_NAME before including this header"
>> +diff --git a/include/libmissing.h b/include/libmissing.h
>> +index 0196033..09dbce1 100644
>> +--- a/include/libmissing.h
>> ++++ b/include/libmissing.h
>> +@@ -7,11 +7,18 @@
>> + #include <execinfo.h>
>> + #endif
>> +
>> ++#include <sys/types.h>
>> ++#include <stdio.h>
>> ++
>> + #ifndef HAVE_EXECINFO_H
>> + int backtrace(void **buffer, int size);
>> + char **backtrace_symbols(void *const *buffer, int size);
>> + void backtrace_symbols_fd(void *const *buffer, int size, int fd);
>> + #endif
>> +
>> ++#ifndef HAVE_GETLINE
>> ++ssize_t getline(char **lineptr, size_t *n, FILE *stream);
>> ++#endif
>> ++
>> + #endif /* LIBMISSING_H */
>> +
>> +diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
>> +index fb181de..9d7a5d9 100644
>> +--- a/jffsX-utils/Makemodule.am
>> ++++ b/jffsX-utils/Makemodule.am
>> +@@ -17,7 +17,7 @@ jffs2dump_SOURCES =3D jffsX-utils/jffs2dump.c
>> + jffs2dump_LDADD =3D libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
>> +
>> + sumtool_SOURCES =3D jffsX-utils/sumtool.c
>> +-sumtool_LDADD =3D libmtd.a
>> ++sumtool_LDADD =3D libmtd.a libmissing.a
>> +
>> + JFFSX_BINS =3D \
>> +     mkfs.jffs2 jffs2dump jffs2reader sumtool
>> +diff --git a/lib/Makemodule.am b/lib/Makemodule.am
>> +index 5bee5b6..645632a 100644
>> +--- a/lib/Makemodule.am
>> ++++ b/lib/Makemodule.am
>> +@@ -7,7 +7,8 @@ libmtd_a_SOURCES =3D \
>> +     lib/libmtd_int.h
>> +
>> + libmissing_a_SOURCES =3D \
>> +-    lib/execinfo.c
>> ++    lib/execinfo.c \
>> ++    lib/getline.c
>> +
>> + libubi_a_SOURCES =3D \
>> +     lib/libubi.c \
>> +diff --git a/lib/getline.c b/lib/getline.c
>> +new file mode 100644
>> +index 0000000..c575bf7
>> +--- /dev/null
>> ++++ b/lib/getline.c
>> +@@ -0,0 +1,36 @@
>> ++#include <stdlib.h>
>> ++#include <string.h>
>> ++
>> ++#include "libmissing.h"
>> ++
>> ++#ifndef HAVE_GETLINE
>> ++ssize_t getline(char **lineptr, size_t *n, FILE *stream)
>> ++{
>> ++    char buffer[256], *new;
>> ++    size_t count;
>> ++
>> ++    if (!(*lineptr))
>> ++            *n =3D 0;
>> ++
>> ++    if (!fgets(buffer, sizeof(buffer), stream)) {
>> ++            if (!feof(stream))
>> ++                    return -1;
>> ++
>> ++            buffer[0] =3D '\0';
>> ++    }
>> ++
>> ++    count =3D strlen(buffer) + 1;
>> ++
>> ++    if (*n < count) {
>> ++            new =3D realloc(*lineptr, count);
>> ++            if (!new)
>> ++                    return -1;
>> ++            *lineptr =3D new;
>> ++            *n =3D count;
>> ++    }
>> ++
>> ++    memcpy(*lineptr, buffer, count);
>> ++    return count;
>> ++}
>> ++#endif
>> ++
>> +diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
>> +index ce1c385..bfc5342 100644
>> +--- a/misc-utils/Makemodule.am
>> ++++ b/misc-utils/Makemodule.am
>> +@@ -1,4 +1,5 @@
>> + ftl_format_SOURCES =3D misc-utils/ftl_format.c
>> ++ftl_format_LDADD =3D libmissing.a
>> +
>> + doc_loadbios_SOURCES =3D misc-utils/doc_loadbios.c
>> +
>> +@@ -25,6 +26,7 @@ flash_otp_info_SOURCES =3D misc-utils/flash_otp_info.=
c
>> + flash_otp_dump_SOURCES =3D misc-utils/flash_otp_dump.c
>> +
>> + flash_otp_lock_SOURCES =3D misc-utils/flash_otp_lock.c
>> ++flash_otp_lock_LDADD =3D libmissing.a
>> +
>> + flash_otp_write_SOURCES =3D misc-utils/flash_otp_write.c
>> +
>> +diff --git a/ubi-utils/Makemodule.am b/ubi-utils/Makemodule.am
>> +index 215eac2..7b447c7 100644
>> +--- a/ubi-utils/Makemodule.am
>> ++++ b/ubi-utils/Makemodule.am
>> +@@ -23,7 +23,7 @@ ubinize_SOURCES =3D ubi-utils/ubinize.c
>> + ubinize_LDADD =3D libubi.a libubigen.a libmtd.a libiniparser.a
>> +
>> + ubiformat_SOURCES =3D ubi-utils/ubiformat.c
>> +-ubiformat_LDADD =3D libubi.a libubigen.a libmtd.a libscan.a
>> ++ubiformat_LDADD =3D libubi.a libubigen.a libmtd.a libscan.a libmissing=
.a
>> +
>> + ubirename_SOURCES =3D ubi-utils/ubirename.c
>> + ubirename_LDADD =3D libmtd.a libubi.a
>> +diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
>> +index 5862afb..787beb9 100644
>> +--- a/ubifs-utils/Makemodule.am
>> ++++ b/ubifs-utils/Makemodule.am
>> +@@ -17,6 +17,7 @@ mkfs_ubifs_SOURCES =3D \
>> +     ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
>> +     ubifs-utils/mkfs.ubifs/devtable.c
>> + mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID=
_LIBS) -lm
>> ++mkfs_ubifs_LDADD +=3D libmissing.a
>> + mkfs_ubifs_CPPFLAGS =3D $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(=
UUID_CFLAGS) \
>> +     -I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs=
.ubifs/
>> +
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0=
002-Instead-of-doing-preprocessor-magic-just-output-off_.patch b/meta-initr=
amfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-prepr=
ocessor-magic-just-output-off_.patch
>> new file mode 100644
>> index 0000000..bb675a7
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Ins=
tead-of-doing-preprocessor-magic-just-output-off_.patch
>> @@ -0,0 +1,326 @@
>> +From 01c98d5d5d044d9a125abcdbb2f3d771966365b0 Mon Sep 17 00:00:00 2001
>> +From: mirabilos <m@mirbsd.org>
>> +Date: Thu, 1 Feb 2018 15:34:07 +0100
>> +Subject: [PATCH 2/4] Instead of doing preprocessor magic, just output o=
ff_t as
>> + long long
>> +
>> +Fix warnings abot PRIdoff_t in libmtd.c, in mtd_read (and mtd_write):
>> +
>> +In file included from ../git/lib/libmtd.c:40:0:
>> +../git/lib/libmtd.c: In function 'mtd_read':
>> +../git/include/common.h:110:18: warning: format '%ld' expects argument =
of
>> + type 'long int', but argument 5 has type 'off_t {aka long long int}'
>> + [-Wformat=3D]
>> +
>> +../git/include/common.h:120:2: note: in expansion of macro 'errmsg'
>> +  errmsg(fmt, ##__VA_ARGS__);                                         \
>> +  ^~~~~~
>> +../git/lib/libmtd.c:1082:10: note: in expansion of macro 'sys_errmsg'
>> +   return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
>> +          ^~~~~~~~~~
>> +
>> +/usr/lib/klibc/include/inttypes.h:28:17: note: format string is defined=
 here
>> + #define PRId32 "d"
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
>> +---
>> + include/common.h                    | 18 ------------------
>> + jffsX-utils/mkfs.jffs2.c            | 20 ++++++++++----------
>> + lib/libmtd.c                        |  8 ++++----
>> + misc-utils/flash_erase.c            |  6 +++---
>> + misc-utils/flash_otp_write.c        |  2 +-
>> + misc-utils/ftl_check.c              |  2 +-
>> + misc-utils/mtd_debug.c              |  4 ++--
>> + misc-utils/serve_image.c            |  4 ++--
>> + tests/fs-tests/integrity/integck.c  |  4 ++--
>> + tests/mtd-tests/nandpagetest.c      |  4 ++--
>> + tests/ubi-tests/integ.c             |  6 +++---
>> + ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  6 +++---
>> + 12 files changed, 33 insertions(+), 51 deletions(-)
>> +
>> +diff --git a/include/common.h b/include/common.h
>> +index f8f72ea..642c212 100644
>> +--- a/include/common.h
>> ++++ b/include/common.h
>> +@@ -70,24 +70,6 @@ extern "C" {
>> + #define O_CLOEXEC 0
>> + #endif
>> +
>> +-/* define a print format specifier for off_t */
>> +-#if (SIZEOF_OFF_T >=3D 8)
>> +-#define PRIxoff_t PRIx64
>> +-#define PRIdoff_t PRId64
>> +-#else
>> +-#define PRIxoff_t "l"PRIx32
>> +-#define PRIdoff_t "l"PRId32
>> +-#endif
>> +-
>> +-/* define a print format specifier for loff_t */
>> +-#if (SIZEOF_LOFF_T >=3D 8)
>> +-#define PRIxloff_t PRIx64
>> +-#define PRIdloff_t PRId64
>> +-#else
>> +-#define PRIxloff_t "l"PRIx32
>> +-#define PRIdloff_t "l"PRId32
>> +-#endif
>> +-
>> + /* Verbose messages */
>> + #define bareverbose(verbose, fmt, ...) do {                        \
>> +     if (verbose)                                               \
>> +diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
>> +index 9aa6c39..0661786 100644
>> +--- a/jffsX-utils/mkfs.jffs2.c
>> ++++ b/jffsX-utils/mkfs.jffs2.c
>> +@@ -1237,8 +1237,8 @@ static void recursive_populate_directory(struct f=
ilesystem_entry *dir)
>> +             } else switch (e->sb.st_mode & S_IFMT) {
>> +                     case S_IFDIR:
>> +                             if (verbose) {
>> +-                                    printf("\td %04o %9" PRIdoff_t "  =
           %5d:%-3d %s\n",
>> +-                                                    e->sb.st_mode & ~S=
_IFMT, e->sb.st_size,
>> ++                                    printf("\td %04o %9lld            =
 %5d:%-3d %s\n",
>> ++                                                    e->sb.st_mode & ~S=
_IFMT, (long long)e->sb.st_size,
>> +                                                     (int) (e->sb.st_ui=
d), (int) (e->sb.st_gid),
>> +                                                     e->name);
>> +                             }
>> +@@ -1247,8 +1247,8 @@ static void recursive_populate_directory(struct f=
ilesystem_entry *dir)
>> +                             break;
>> +                     case S_IFSOCK:
>> +                             if (verbose) {
>> +-                                    printf("\ts %04o %9" PRIdoff_t "  =
           %5d:%-3d %s\n",
>> +-                                                    e->sb.st_mode & ~S=
_IFMT, e->sb.st_size,
>> ++                                    printf("\ts %04o %9lld            =
 %5d:%-3d %s\n",
>> ++                                                    e->sb.st_mode & ~S=
_IFMT, (long long)e->sb.st_size,
>> +                                                     (int) e->sb.st_uid=
, (int) e->sb.st_gid, e->name);
>> +                             }
>> +                             write_pipe(e);
>> +@@ -1256,8 +1256,8 @@ static void recursive_populate_directory(struct f=
ilesystem_entry *dir)
>> +                             break;
>> +                     case S_IFIFO:
>> +                             if (verbose) {
>> +-                                    printf("\tp %04o %9" PRIdoff_t "  =
           %5d:%-3d %s\n",
>> +-                                                    e->sb.st_mode & ~S=
_IFMT, e->sb.st_size,
>> ++                                    printf("\tp %04o %9lld            =
 %5d:%-3d %s\n",
>> ++                                                    e->sb.st_mode & ~S=
_IFMT, (long long)e->sb.st_size,
>> +                                                     (int) e->sb.st_uid=
, (int) e->sb.st_gid, e->name);
>> +                             }
>> +                             write_pipe(e);
>> +@@ -1285,8 +1285,8 @@ static void recursive_populate_directory(struct f=
ilesystem_entry *dir)
>> +                             break;
>> +                     case S_IFLNK:
>> +                             if (verbose) {
>> +-                                    printf("\tl %04o %9" PRIdoff_t "  =
           %5d:%-3d %s -> %s\n",
>> +-                                                    e->sb.st_mode & ~S=
_IFMT, e->sb.st_size,
>> ++                                    printf("\tl %04o %9lld            =
 %5d:%-3d %s -> %s\n",
>> ++                                                    e->sb.st_mode & ~S=
_IFMT, (long long)e->sb.st_size,
>> +                                                     (int) e->sb.st_uid=
, (int) e->sb.st_gid, e->name,
>> +                                                     e->link);
>> +                             }
>> +@@ -1297,8 +1297,8 @@ static void recursive_populate_directory(struct f=
ilesystem_entry *dir)
>> +                             wrote =3D write_regular_file(e);
>> +                             write_xattr_entry(e);
>> +                             if (verbose) {
>> +-                                    printf("\tf %04o %9" PRIdoff_t " (=
%9u) %5d:%-3d %s\n",
>> +-                                                    e->sb.st_mode & ~S=
_IFMT, e->sb.st_size, wrote,
>> ++                                    printf("\tf %04o %9lld (%9u) %5d:%=
-3d %s\n",
>> ++                                                    e->sb.st_mode & ~S=
_IFMT, (long long)e->sb.st_size, wrote,
>> +                                                     (int) e->sb.st_uid=
, (int) e->sb.st_gid, e->name);
>> +                             }
>> +                             break;
>> +diff --git a/lib/libmtd.c b/lib/libmtd.c
>> +index 86c89ae..f375381 100644
>> +--- a/lib/libmtd.c
>> ++++ b/lib/libmtd.c
>> +@@ -1079,8 +1079,8 @@ int mtd_read(const struct mtd_dev_info *mtd, int =
fd, int eb, int offs,
>> +     /* Seek to the beginning of the eraseblock */
>> +     seek =3D (off_t)eb * mtd->eb_size + offs;
>> +     if (lseek(fd, seek, SEEK_SET) !=3D seek)
>> +-            return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t=
,
>> +-                              mtd->mtd_num, seek);
>> ++            return sys_errmsg("cannot seek mtd%d to offset %lld",
>> ++                              mtd->mtd_num, (long long)seek);
>> +
>> +     while (rd < len) {
>> +             ret =3D read(fd, buf + rd, len - rd);
>> +@@ -1188,8 +1188,8 @@ int mtd_write(libmtd_t desc, const struct mtd_dev=
_info *mtd, int fd, int eb,
>> +     if (data) {
>> +             /* Seek to the beginning of the eraseblock */
>> +             if (lseek(fd, seek, SEEK_SET) !=3D seek)
>> +-                    return sys_errmsg("cannot seek mtd%d to offset %"P=
RIdoff_t,
>> +-                                    mtd->mtd_num, seek);
>> ++                    return sys_errmsg("cannot seek mtd%d to offset %ll=
d",
>> ++                                    mtd->mtd_num, (long long)seek);
>> +             ret =3D write(fd, data, len);
>> +             if (ret !=3D len)
>> +                     return sys_errmsg("cannot write %d bytes to mtd%d =
"
>> +diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
>> +index 0c9449f..ec4b2e1 100644
>> +--- a/misc-utils/flash_erase.c
>> ++++ b/misc-utils/flash_erase.c
>> +@@ -53,8 +53,8 @@ int target_endian =3D __BYTE_ORDER;
>> + static void show_progress(struct mtd_dev_info *mtd, off_t start, int e=
b,
>> +                       int eb_start, int eb_cnt)
>> + {
>> +-    bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %% =
complete ",
>> +-            mtd->eb_size / 1024, start, ((eb - eb_start) * 100) / eb_c=
nt);
>> ++    bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %% complete=
 ",
>> ++            mtd->eb_size / 1024, (unsigned long long)start, ((eb - eb_=
start) * 100) / eb_cnt);
>> +     fflush(stdout);
>> + }
>> +
>> +@@ -210,7 +210,7 @@ int main(int argc, char *argv[])
>> +             if (!noskipbad) {
>> +                     int ret =3D mtd_is_bad(&mtd, fd, eb);
>> +                     if (ret > 0) {
>> +-                            verbose(!quiet, "Skipping bad block at %08=
"PRIxoff_t, offset);
>> ++                            verbose(!quiet, "Skipping bad block at %08=
llx", (unsigned long long)offset);
>> +                             continue;
>> +                     } else if (ret < 0) {
>> +                             if (errno =3D=3D EOPNOTSUPP) {
>> +diff --git a/misc-utils/flash_otp_write.c b/misc-utils/flash_otp_write.=
c
>> +index b02d0b0..04c96c6 100644
>> +--- a/misc-utils/flash_otp_write.c
>> ++++ b/misc-utils/flash_otp_write.c
>> +@@ -76,7 +76,7 @@ int main(int argc,char *argv[])
>> +             return errno;
>> +     }
>> +
>> +-    printf("Writing OTP user data on %s at offset 0x%"PRIxoff_t"\n", a=
rgv[2], offset);
>> ++    printf("Writing OTP user data on %s at offset 0x%llx\n", argv[2], =
(unsigned long long)offset);
>> +
>> +     if (mtd_type_is_nand_user(&mtdInfo))
>> +             len =3D mtdInfo.writesize;
>> +diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
>> +index a853cf4..e854922 100644
>> +--- a/misc-utils/ftl_check.c
>> ++++ b/misc-utils/ftl_check.c
>> +@@ -131,7 +131,7 @@ static void check_partition(int fd)
>> +                     perror("read failed");
>> +                     break;
>> +             }
>> +-            printf("\nErase unit %"PRIdoff_t":\n", i);
>> ++            printf("\nErase unit %lld:\n", (long long)i);
>> +             if ((hdr2.FormattedSize !=3D hdr.FormattedSize) ||
>> +                             (hdr2.NumEraseUnits !=3D hdr.NumEraseUnits=
) ||
>> +                             (hdr2.SerialNumber !=3D hdr.SerialNumber))
>> +diff --git a/misc-utils/mtd_debug.c b/misc-utils/mtd_debug.c
>> +index ac37e23..d65ad36 100644
>> +--- a/misc-utils/mtd_debug.c
>> ++++ b/misc-utils/mtd_debug.c
>> +@@ -160,7 +160,7 @@ retry:
>> +     if (buf !=3D NULL)
>> +             free(buf);
>> +     close(outfd);
>> +-    printf("Copied %zu bytes from address 0x%.8"PRIxoff_t" in flash to=
 %s\n", len, offset, filename);
>> ++    printf("Copied %zu bytes from address 0x%.8llx in flash to %s\n", =
len, (unsigned long long)offset, filename);
>> +     return 0;
>> +
>> + err2:
>> +@@ -225,7 +225,7 @@ retry:
>> +     if (buf !=3D NULL)
>> +             free(buf);
>> +     fclose(fp);
>> +-    printf("Copied %d bytes from %s to address 0x%.8"PRIxoff_t" in fla=
sh\n", len, filename, offset);
>> ++    printf("Copied %d bytes from %s to address 0x%.8llx in flash\n", l=
en, filename, (unsigned long long)offset);
>> +     return 0;
>> + }
>> +
>> +diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
>> +index f2475d6..6c8c8fb 100644
>> +--- a/misc-utils/serve_image.c
>> ++++ b/misc-utils/serve_image.c
>> +@@ -129,8 +129,8 @@ int main(int argc, char **argv)
>> +     }
>> +
>> +     if (st.st_size % erasesize) {
>> +-            fprintf(stderr, "Image size %" PRIdoff_t " bytes is not a =
multiple of erasesize %d bytes\n",
>> +-                            st.st_size, erasesize);
>> ++            fprintf(stderr, "Image size %lld bytes is not a multiple o=
f erasesize %d bytes\n",
>> ++                            (long long)st.st_size, erasesize);
>> +             exit(1);
>> +     }
>> +     image =3D mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
>> +diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integr=
ity/integck.c
>> +index 84753d6..0a7f142 100644
>> +--- a/tests/fs-tests/integrity/integck.c
>> ++++ b/tests/fs-tests/integrity/integck.c
>> +@@ -897,8 +897,8 @@ static ssize_t file_write_data(struct file_info *fi=
le, int fd, off_t offset,
>> +     remains =3D size;
>> +     actual =3D 0;
>> +     written =3D IO_BUFFER_SIZE;
>> +-    v("write %zd bytes, offset %"PRIdoff_t", file %s",
>> +-      size, offset, get_file_name(file));
>> ++    v("write %zd bytes, offset %lld, file %s",
>> ++      size, (long long)offset, get_file_name(file));
>> +     while (remains) {
>> +             /* Fill up buffer with random data */
>> +             if (written < IO_BUFFER_SIZE) {
>> +diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpaget=
est.c
>> +index c6812df..465e548 100644
>> +--- a/tests/mtd-tests/nandpagetest.c
>> ++++ b/tests/mtd-tests/nandpagetest.c
>> +@@ -232,8 +232,8 @@ static int verify_eraseblock(int ebnum)
>> +                     return err;
>> +
>> +             if (lseek(fd, addr, SEEK_SET) !=3D addr) {
>> +-                    fprintf(stderr, "cannot seek mtd%d to offset %"PRI=
dloff_t,
>> +-                                    mtd.mtd_num, addr);
>> ++                    fprintf(stderr, "cannot seek mtd%d to offset %lld"=
,
>> ++                                    mtd.mtd_num, (long long)addr);
>> +                     return -1;
>> +             }
>> +
>> +diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
>> +index 26c2ce5..1cd0649 100644
>> +--- a/tests/ubi-tests/integ.c
>> ++++ b/tests/ubi-tests/integ.c
>> +@@ -243,7 +243,7 @@ static void check_erase_block(struct erase_block_in=
fo *erase_block, int fd)
>> +                     while (size)
>> +                             if (read_buffer[--size] !=3D 0xff) {
>> +                                     fprintf(stderr, "block no. =3D %d\=
n" , erase_block->block_number);
>> +-                                    fprintf(stderr, "offset =3D %"PRId=
off_t"\n" , gap_start);
>> ++                                    fprintf(stderr, "offset =3D %lld\n=
" , (long long)gap_start);
>> +                                     fprintf(stderr, "size =3D %ld\n" ,=
 (long) bytes_read);
>> +                                     error_exit("verify 0xff failed");
>> +                             }
>> +@@ -254,7 +254,7 @@ static void check_erase_block(struct erase_block_in=
fo *erase_block, int fd)
>> +             errno =3D 0;
>> +             bytes_read =3D read(fd, read_buffer, w->size);
>> +             if (bytes_read !=3D w->size) {
>> +-                    fprintf(stderr, "offset =3D %"PRIdoff_t"\n" , w->o=
ffset);
>> ++                    fprintf(stderr, "offset =3D %lld\n" , (long long)w=
->offset);
>> +                     fprintf(stderr, "size =3D %ld\n" , (long) w->size)=
;
>> +                     fprintf(stderr, "bytes_read =3D %ld\n" , (long) by=
tes_read);
>> +                     error_exit("read failed");
>> +@@ -279,7 +279,7 @@ static void check_erase_block(struct erase_block_in=
fo *erase_block, int fd)
>> +             while (size)
>> +                     if (read_buffer[--size] !=3D 0xff) {
>> +                             fprintf(stderr, "block no. =3D %d\n" , era=
se_block->block_number);
>> +-                            fprintf(stderr, "offset =3D %"PRIdoff_t"\n=
" , gap_start);
>> ++                            fprintf(stderr, "offset =3D %lld\n" , (lon=
g long)gap_start);
>> +                             fprintf(stderr, "size =3D %ld\n" , (long) =
bytes_read);
>> +                             error_exit("verify 0xff failed!");
>> +                     }
>> +diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubi=
fs/mkfs.ubifs.c
>> +index c916f48..f0237ab 100644
>> +--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
>> ++++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
>> +@@ -772,11 +772,11 @@ int write_leb(int lnum, int len, void *buf)
>> +                     return sys_err_msg("ubi_leb_change_start failed");
>> +
>> +     if (lseek(out_fd, pos, SEEK_SET) !=3D pos)
>> +-            return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos)=
;
>> ++            return sys_err_msg("lseek failed seeking %lld", (long long=
)pos);
>> +
>> +     if (write(out_fd, buf, c->leb_size) !=3D c->leb_size)
>> +-            return sys_err_msg("write failed writing %d bytes at pos %=
"PRIdoff_t,
>> +-                               c->leb_size, pos);
>> ++            return sys_err_msg("write failed writing %d bytes at pos %=
lld",
>> ++                               c->leb_size, (long long)pos);
>> +
>> +     return 0;
>> + }
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0=
003-Makefile.am-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtool=
s/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
>> new file mode 100644
>> index 0000000..08c53d1
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Mak=
efile.am-only-build-ubi-utils.patch
>> @@ -0,0 +1,34 @@
>> +From 139d93bc405272a3261d57be26da842e737fe4d0 Mon Sep 17 00:00:00 2001
>> +From: Andrea Adami <andrea.adami@gmail.com>
>> +Date: Sun, 28 Jan 2018 23:10:34 +0100
>> +Subject: [PATCH 3/4] Makefile.am: only build ubi-utils
>> +
>> +We only target the ubi-utils, static, small.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> +---
>> + Makefile.am | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 5a6e77c..98715dd 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -34,9 +34,9 @@ EXTRA_DIST +=3D $(GLOBAL_HEADER) $(GLOBAL_EXTRA)
>> +
>> + include lib/Makemodule.am
>> + include ubi-utils/Makemodule.am
>> +-include misc-utils/Makemodule.am
>> +-include nand-utils/Makemodule.am
>> +-include nor-utils/Makemodule.am
>> ++#include misc-utils/Makemodule.am
>> ++#include nand-utils/Makemodule.am
>> ++#include nor-utils/Makemodule.am
>> +
>> + if BUILD_UBIFS
>> + include ubifs-utils/Makemodule.am
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0=
004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramf=
s/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-fea=
tures.h-for-klibc-builds.patch
>> new file mode 100644
>> index 0000000..5da05fa
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd=
-utils-common.h-no-features.h-for-klibc-builds.patch
>> @@ -0,0 +1,38 @@
>> +From ae1cf6d0eb1833e46549328a4473222c259723d7 Mon Sep 17 00:00:00 2001
>> +From: Andrea Adami <andrea.adami@gmail.com>
>> +Date: Thu, 1 Feb 2018 00:25:00 +0100
>> +Subject: [PATCH 4/4] mtd-utils: common.h: no features.h for klibc build=
s
>> +
>> +Add guard around features.h to fix missing include (here first error):
>> +
>> + ../git/include/common.h:29:10:
>> + fatal error: features.h: No such file or directory
>> +  #include <features.h>
>> +           ^~~~~~~~~~~~
>> + compilation terminated
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> +---
>> + include/common.h | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/include/common.h b/include/common.h
>> +index 642c212..f7c71fe 100644
>> +--- a/include/common.h
>> ++++ b/include/common.h
>> +@@ -26,7 +26,10 @@
>> + #include <string.h>
>> + #include <fcntl.h>
>> + #include <errno.h>
>> ++#if defined(__KLIBC__)
>> ++#else
>> + #include <features.h>
>> ++#endif
>> + #include <inttypes.h>
>> + #include <unistd.h>
>> + #include <sys/sysmacros.h>
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.b=
b b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
>> similarity index 64%
>> rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
>> rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
>> index abb0d4b..85bc372 100644
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
>> @@ -7,30 +7,30 @@ LICENSE =3D "GPLv2+"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c31=
7bb3 \
>>                      file://include/common.h;beginline=3D1;endline=3D17;=
md5=3Dba05b07912a44ea2bf81ce409380049c"
>>
>> -inherit klibc
>> +inherit autotools pkgconfig klibc
>>
>> -SRCREV =3D "aea36417067dade75192bafa03af70b6eb2677b1"
>> +SRCREV =3D "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
>>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
>> -             file://0001-Makefile-build-ubi-utils-only.patch \
>> -             file://0002-common.mk-for-klibc-CC-is-klcc.patch \
>> -             file://0003-libubi.c-add-klibc-specific-fixes-for-ioctl.pa=
tch \
>> -             file://0004-Restore-compatibility-to-dietlibc-klibc-musl-l=
ibc-af.patch \
>> -             file://0005-common.h-more-workarounds-for-klibc-compatibil=
ity.patch \
>> -             file://0006-libiniparser-remove-unused-function-needing-fl=
oat.patch \
>> -             file://0007-mtd-utils-common.c-convert-to-integer-arithmet=
ic.patch \
>> -             file://0008-ubi-utils-ubiformat.c-convert-to-integer-arith=
metic.patch \
>> -             file://0009-Eliminate-warnings-about-implicit-non-const-ca=
sting-.patch \
>> +             file://0001-Add-simple-getline-implementation-to-libmissin=
g.patch \
>> +             file://0002-Instead-of-doing-preprocessor-magic-just-outpu=
t-off_.patch \
>> +             file://0003-Makefile.am-only-build-ubi-utils.patch \
>> +             file://0004-mtd-utils-common.h-no-features.h-for-klibc-bui=
lds.patch \
>>               "
>>
>>  S =3D "${WORKDIR}/git/"
>>
>> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAG=
S=3D${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
>> +EXTRA_OECONF +=3D "--disable-tests --without-jffs --without-ubifs"
>> +
>> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
>> +PACKAGECONFIG[xattr] =3D ",,acl,"
>> +
>> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAG=
S=3D${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT=
_XATTR', d)} -I${S}/include' 'BUILDDIR=3D${S}'"
>>
>>  do_install () {
>>       oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D${=
mandir} INCLUDEDIR=3D${includedir}
>>  }
>>
>> -PACKAGES =3D "ubi-utils-klibc-dbg"
>> +PACKAGES =3D "ubi-utils-klibc-dbg ubi-utils-klibc-doc"
>>
>>  PACKAGES =3D+ "mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-kl=
ibc ubidetach-klibc \
>>               ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc =
ubirename-klibc \
>

--0000000000005cb319056c688695
Content-Type: application/octet-stream; name="log.do_compile.7250"
Content-Disposition: attachment; filename="log.do_compile.7250"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jhaow3zt0

REVCVUc6IFNJVEUgZmlsZXMgWydlbmRpYW4tbGl0dGxlJywgJ2JpdC02NCcsICdhcm0tY29tbW9u
JywgJ2FybS02NCcsICdjb21tb24tbGludXgnLCAnY29tbW9uLW11c2wnLCAnYWFyY2g2NC1saW51
eCcsICdhYXJjaDY0LWxpbnV4LW11c2wnLCAnY29tbW9uJ10KREVCVUc6IEV4ZWN1dGluZyBzaGVs
bCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6IG1ha2UgLWogOCBDQz1hYXJjaDY0LW9lLWxpbnV4
LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9l
LWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IFJBTkxJ
Qj1hYXJjaDY0LW9lLWxpbnV4LW11c2wtcmFubGliIEFSPWFhcmNoNjQtb2UtbGludXgtbXVzbC1h
ciBDRkxBR1M9ICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11
c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSBCVUlMRERJUj0vdG1wL2J1
aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8y
LjAuMi1yMC9naXQvCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9i
dWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMv
Mi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4v
aW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21p
c3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1
bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBh
cmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3Vu
dXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNh
dGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1X
bm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRl
IC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dv
cmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2lu
Y2x1ZGUgLWMgLW8gbGliL2xpYm10ZC5vIC4uL2dpdC9saWIvbGlibXRkLmMKYWFyY2g2NC1vZS1s
aW51eC1tdXNsLWtsY2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2
NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAt
REhBVkVfQ09ORklHX0ggLUkuIC1JLi4vZ2l0IC1JLi9pbmNsdWRlICAtV2FsbCAtV2V4dHJhIC1X
dW51c2VkIC1XbWlzc2luZy1wcm90b3R5cGVzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVd3cml0
ZS1zdHJpbmdzIC1XanVtcC1taXNzZXMtaW5pdCAtV3VuaW5pdGlhbGl6ZWQgLVdpbml0LXNlbGYg
LVdsb2dpY2FsLW9wIC1XdW51c2VkLWJ1dC1zZXQtcGFyYW1ldGVyIC1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGUgLVd1bnVzZWQtcGFyYW1ldGVyIC1XdW51c2VkLXJlc3VsdCAtV3VudXNlZC12YXJp
YWJsZSAtV2R1cGxpY2F0ZWQtY29uZCAtV2R1cGxpY2F0ZWQtYnJhbmNoZXMgLVdyZXN0cmljdCAt
V251bGwtZGVyZWZlcmVuY2UgLVduby1zaGFkb3cgLVduby1zaWduLWNvbXBhcmUgLURfR05VX1NP
VVJDRSAtc3RkPWdudTk5IC1JLi4vZ2l0L2luY2x1ZGUgLURXSVRIT1VUX1hBVFRSIC1EV0lUSE9V
VF9MWk8gICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wv
dWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAtYyAtbyBsaWIvbGliZmVjLm8g
Li4vZ2l0L2xpYi9saWJmZWMuYwphYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290
PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxz
LWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9n
aXQgLUkuL2luY2x1ZGUgIC1XYWxsIC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlw
ZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1p
bml0IC1XdW5pbml0aWFsaXplZCAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0
LXNldC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0
ZXIgLVd1bnVzZWQtcmVzdWx0IC1XdW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1X
ZHVwbGljYXRlZC1icmFuY2hlcyAtV3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNo
YWRvdyAtV25vLXNpZ24tY29tcGFyZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQv
aW5jbHVkZSAtRFdJVEhPVVRfWEFUVFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAt
bXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAv
Z2l0Ly9pbmNsdWRlIC1jIC1vIGxpYi9jb21tb24ubyAuLi9naXQvbGliL2NvbW1vbi5jCmFhcmNo
NjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3Jr
L2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5
c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdl
eHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25z
IC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5p
dC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVz
ZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVz
dHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1E
X0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAt
RFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51
eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gbGliL2xp
YmNyYzMyLm8gLi4vZ2l0L2xpYi9saWJjcmMzMi5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNj
ICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVz
bC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19I
IC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3Np
bmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1
bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAt
V3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51
c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNh
dGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJl
bmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5
OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1w
L2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGli
Yy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gbGliL2xpYm10ZF9sZWdhY3kubyAuLi9naXQv
bGliL2xpYm10ZF9sZWdhY3kuYwphYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290
PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxz
LWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9n
aXQgLUkuL2luY2x1ZGUgIC1XYWxsIC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlw
ZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1p
bml0IC1XdW5pbml0aWFsaXplZCAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0
LXNldC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0
ZXIgLVd1bnVzZWQtcmVzdWx0IC1XdW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1X
ZHVwbGljYXRlZC1icmFuY2hlcyAtV3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNo
YWRvdyAtV25vLXNpZ24tY29tcGFyZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQv
aW5jbHVkZSAtRFdJVEhPVVRfWEFUVFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAt
bXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAv
Z2l0Ly9pbmNsdWRlIC1jIC1vIGxpYi9leGVjaW5mby5vIC4uL2dpdC9saWIvZXhlY2luZm8uYwph
YXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wv
d29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lw
ZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9naXQgLUkuL2luY2x1ZGUgIC1XYWxs
IC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0
aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1pbml0IC1XdW5pbml0aWFsaXplZCAt
V2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0ZXIgLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0ZXIgLVd1bnVzZWQtcmVzdWx0IC1X
dW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1XZHVwbGljYXRlZC1icmFuY2hlcyAt
V3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNoYWRvdyAtV25vLXNpZ24tY29tcGFy
ZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQvaW5jbHVkZSAtRFdJVEhPVVRfWEFU
VFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2Ut
bGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1jIC1vIGxp
Yi9nZXRsaW5lLm8gLi4vZ2l0L2xpYi9nZXRsaW5lLmMKYWFyY2g2NC1vZS1saW51eC1tdXNsLWts
Y2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1t
dXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAtREhBVkVfQ09ORklH
X0ggLUkuIC1JLi4vZ2l0IC1JLi9pbmNsdWRlICAtV2FsbCAtV2V4dHJhIC1XdW51c2VkIC1XbWlz
c2luZy1wcm90b3R5cGVzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVd3cml0ZS1zdHJpbmdzIC1X
anVtcC1taXNzZXMtaW5pdCAtV3VuaW5pdGlhbGl6ZWQgLVdpbml0LXNlbGYgLVdsb2dpY2FsLW9w
IC1XdW51c2VkLWJ1dC1zZXQtcGFyYW1ldGVyIC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVd1
bnVzZWQtcGFyYW1ldGVyIC1XdW51c2VkLXJlc3VsdCAtV3VudXNlZC12YXJpYWJsZSAtV2R1cGxp
Y2F0ZWQtY29uZCAtV2R1cGxpY2F0ZWQtYnJhbmNoZXMgLVdyZXN0cmljdCAtV251bGwtZGVyZWZl
cmVuY2UgLVduby1zaGFkb3cgLVduby1zaWduLWNvbXBhcmUgLURfR05VX1NPVVJDRSAtc3RkPWdu
dTk5IC1JLi4vZ2l0L2luY2x1ZGUgLURXSVRIT1VUX1hBVFRSIC1EV0lUSE9VVF9MWk8gICAtSS90
bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWts
aWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAtYyAtbyBsaWIvbGlidWJpLm8gLi4vZ2l0L2xpYi9s
aWJ1YmkuYwphYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQv
dG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4y
LXIwL3JlY2lwZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9naXQgLUkuL2luY2x1
ZGUgIC1XYWxsIC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5n
LWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1pbml0IC1XdW5pbml0
aWFsaXplZCAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0
ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0ZXIgLVd1bnVzZWQt
cmVzdWx0IC1XdW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1XZHVwbGljYXRlZC1i
cmFuY2hlcyAtV3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNoYWRvdyAtV25vLXNp
Z24tY29tcGFyZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQvaW5jbHVkZSAtRFdJ
VEhPVVRfWEFUVFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2Fh
cmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRl
IC1jIC1vIGxpYi9saWJ1YmlnZW4ubyAuLi9naXQvbGliL2xpYnViaWdlbi5jCmFhcmNoNjQtb2Ut
bGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNo
NjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3Qg
LURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAt
V3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3Jp
dGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxm
IC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFy
aWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3Qg
LVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9T
T1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhP
VVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNs
L3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gbGliL2xpYnNjYW4u
byAuLi9naXQvbGliL2xpYnNjYW4uYwphYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNy
b290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0
aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUku
Li9naXQgLUkuL2luY2x1ZGUgIC1XYWxsIC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3Rv
dHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nl
cy1pbml0IC1XdW5pbml0aWFsaXplZCAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQt
YnV0LXNldC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJh
bWV0ZXIgLVd1bnVzZWQtcmVzdWx0IC1XdW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25k
IC1XZHVwbGljYXRlZC1icmFuY2hlcyAtV3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25v
LXNoYWRvdyAtV25vLXNpZ24tY29tcGFyZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9n
aXQvaW5jbHVkZSAtRFdJVEhPVVRfWEFUVFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90
bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjIt
cjAvZ2l0Ly9pbmNsdWRlIC1jIC1vIGxpYi9saWJpbmlwYXJzZXIubyAuLi9naXQvbGliL2xpYmlu
aXBhcnNlci5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWls
ZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4w
LjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5j
bHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3Np
bmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmlu
aXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFt
ZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNl
ZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVk
LWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8t
c2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1E
V0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsv
YWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1
ZGUgLWMgLW8gbGliL2RpY3Rpb25hcnkubyAuLi9naXQvbGliL2RpY3Rpb25hcnkuYwphYXJjaDY0
LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9h
YXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNy
b290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9naXQgLUkuL2luY2x1ZGUgIC1XYWxsIC1XZXh0
cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAt
V3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1pbml0IC1XdW5pbml0aWFsaXplZCAtV2luaXQt
c2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0ZXIgLVd1bnVzZWQtcmVzdWx0IC1XdW51c2Vk
LXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1XZHVwbGljYXRlZC1icmFuY2hlcyAtV3Jlc3Ry
aWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNoYWRvdyAtV25vLXNpZ24tY29tcGFyZSAtRF9H
TlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQvaW5jbHVkZSAtRFdJVEhPVVRfWEFUVFIgLURX
SVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgt
bXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1jIC1vIHViaS11dGls
cy91Yml1cGRhdGV2b2wubyAuLi9naXQvdWJpLXV0aWxzL3ViaXVwZGF0ZXZvbC5jCmFhcmNoNjQt
b2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2Fh
cmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jv
b3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRy
YSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1X
d3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1z
ZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQt
c2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQt
dmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJp
Y3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dO
VV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJ
VEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1t
dXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxz
L3ViaW1rdm9sLm8gLi4vZ2l0L3ViaS11dGlscy91Ymlta3ZvbC5jCmFhcmNoNjQtb2UtbGludXgt
bXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2Ut
bGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZF
X0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNl
ZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3Ry
aW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9n
aWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUg
LVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxs
LWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0Ug
LXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpP
ICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11
dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxzL3ViaXJtdm9s
Lm8gLi4vZ2l0L3ViaS11dGlscy91YmlybXZvbC5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNj
ICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVz
bC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19I
IC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3Np
bmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1
bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAt
V3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51
c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNh
dGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJl
bmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5
OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1w
L2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGli
Yy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxzL3ViaWNyYzMyLm8gLi4vZ2l0
L3ViaS11dGlscy91YmljcmMzMi5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jv
b3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRp
bHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4u
L2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90
eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2Vz
LWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1i
dXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFt
ZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQg
LVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8t
c2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dp
dC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3Rt
cC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1y
MC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxzL3ViaW5mby5vIC4uL2dpdC91YmktdXRpbHMv
dWJpbmZvLmMKYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxk
L3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAu
Mi1yMC9yZWNpcGUtc3lzcm9vdCAtREhBVkVfQ09ORklHX0ggLUkuIC1JLi4vZ2l0IC1JLi9pbmNs
dWRlICAtV2FsbCAtV2V4dHJhIC1XdW51c2VkIC1XbWlzc2luZy1wcm90b3R5cGVzIC1XbWlzc2lu
Zy1kZWNsYXJhdGlvbnMgLVd3cml0ZS1zdHJpbmdzIC1XanVtcC1taXNzZXMtaW5pdCAtV3VuaW5p
dGlhbGl6ZWQgLVdpbml0LXNlbGYgLVdsb2dpY2FsLW9wIC1XdW51c2VkLWJ1dC1zZXQtcGFyYW1l
dGVyIC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVd1bnVzZWQtcGFyYW1ldGVyIC1XdW51c2Vk
LXJlc3VsdCAtV3VudXNlZC12YXJpYWJsZSAtV2R1cGxpY2F0ZWQtY29uZCAtV2R1cGxpY2F0ZWQt
YnJhbmNoZXMgLVdyZXN0cmljdCAtV251bGwtZGVyZWZlcmVuY2UgLVduby1zaGFkb3cgLVduby1z
aWduLWNvbXBhcmUgLURfR05VX1NPVVJDRSAtc3RkPWdudTk5IC1JLi4vZ2l0L2luY2x1ZGUgLURX
SVRIT1VUX1hBVFRSIC1EV0lUSE9VVF9MWk8gICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9h
YXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVk
ZSAtYyAtbyB1YmktdXRpbHMvdWJpYXR0YWNoLm8gLi4vZ2l0L3ViaS11dGlscy91YmlhdHRhY2gu
YwphYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11
c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3Jl
Y2lwZS1zeXNyb290IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLi9naXQgLUkuL2luY2x1ZGUgIC1X
YWxsIC1XZXh0cmEgLVd1bnVzZWQgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xh
cmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdqdW1wLW1pc3Nlcy1pbml0IC1XdW5pbml0aWFsaXpl
ZCAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AgLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0ZXIgLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV3VudXNlZC1wYXJhbWV0ZXIgLVd1bnVzZWQtcmVzdWx0
IC1XdW51c2VkLXZhcmlhYmxlIC1XZHVwbGljYXRlZC1jb25kIC1XZHVwbGljYXRlZC1icmFuY2hl
cyAtV3Jlc3RyaWN0IC1XbnVsbC1kZXJlZmVyZW5jZSAtV25vLXNoYWRvdyAtV25vLXNpZ24tY29t
cGFyZSAtRF9HTlVfU09VUkNFIC1zdGQ9Z251OTkgLUkuLi9naXQvaW5jbHVkZSAtRFdJVEhPVVRf
WEFUVFIgLURXSVRIT1VUX0xaTyAgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQt
b2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1jIC1v
IHViaS11dGlscy91YmlkZXRhY2gubyAuLi9naXQvdWJpLXV0aWxzL3ViaWRldGFjaC5jCmFhcmNo
NjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3Jr
L2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5
c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdl
eHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25z
IC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5p
dC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVz
ZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVz
dHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1E
X0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAt
RFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51
eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0
aWxzL3ViaW5pemUubyAuLi9naXQvdWJpLXV0aWxzL3ViaW5pemUuYwphYXJjaDY0LW9lLWxpbnV4
LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9l
LWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1ESEFW
RV9DT05GSUdfSCAtSS4gLUkuLi9naXQgLUkuL2luY2x1ZGUgIC1XYWxsIC1XZXh0cmEgLVd1bnVz
ZWQgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0
cmluZ3MgLVdqdW1wLW1pc3Nlcy1pbml0IC1XdW5pbml0aWFsaXplZCAtV2luaXQtc2VsZiAtV2xv
Z2ljYWwtb3AgLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZSAtV3VudXNlZC1wYXJhbWV0ZXIgLVd1bnVzZWQtcmVzdWx0IC1XdW51c2VkLXZhcmlhYmxl
IC1XZHVwbGljYXRlZC1jb25kIC1XZHVwbGljYXRlZC1icmFuY2hlcyAtV3Jlc3RyaWN0IC1XbnVs
bC1kZXJlZmVyZW5jZSAtV25vLXNoYWRvdyAtV25vLXNpZ24tY29tcGFyZSAtRF9HTlVfU09VUkNF
IC1zdGQ9Z251OTkgLUkuLi9naXQvaW5jbHVkZSAtRFdJVEhPVVRfWEFUVFIgLURXSVRIT1VUX0xa
TyAgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91Ymkt
dXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1jIC1vIHViaS11dGlscy91Ymlmb3Jt
YXQubyAuLi9naXQvdWJpLXV0aWxzL3ViaWZvcm1hdC5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1r
bGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgt
bXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJ
R19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21p
c3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAt
V2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1v
cCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1X
dW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBs
aWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVm
ZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1n
bnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkv
dG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1r
bGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxzL3ViaXJlbmFtZS5vIC4u
L2dpdC91YmktdXRpbHMvdWJpcmVuYW1lLmMKYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgIC0t
c3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3Vi
aS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAtREhBVkVfQ09ORklHX0ggLUku
IC1JLi4vZ2l0IC1JLi9pbmNsdWRlICAtV2FsbCAtV2V4dHJhIC1XdW51c2VkIC1XbWlzc2luZy1w
cm90b3R5cGVzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVd3cml0ZS1zdHJpbmdzIC1XanVtcC1t
aXNzZXMtaW5pdCAtV3VuaW5pdGlhbGl6ZWQgLVdpbml0LXNlbGYgLVdsb2dpY2FsLW9wIC1XdW51
c2VkLWJ1dC1zZXQtcGFyYW1ldGVyIC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVd1bnVzZWQt
cGFyYW1ldGVyIC1XdW51c2VkLXJlc3VsdCAtV3VudXNlZC12YXJpYWJsZSAtV2R1cGxpY2F0ZWQt
Y29uZCAtV2R1cGxpY2F0ZWQtYnJhbmNoZXMgLVdyZXN0cmljdCAtV251bGwtZGVyZWZlcmVuY2Ug
LVduby1zaGFkb3cgLVduby1zaWduLWNvbXBhcmUgLURfR05VX1NPVVJDRSAtc3RkPWdudTk5IC1J
Li4vZ2l0L2luY2x1ZGUgLURXSVRIT1VUX1hBVFRSIC1EV0lUSE9VVF9MWk8gICAtSS90bXAvYnVp
bGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIu
MC4yLXIwL2dpdC8vaW5jbHVkZSAtYyAtbyB1YmktdXRpbHMvbXRkaW5mby5vIC4uL2dpdC91Ymkt
dXRpbHMvbXRkaW5mby5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3Rt
cC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xp
YmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAt
SS4vaW5jbHVkZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAt
V21pc3NpbmctZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQg
LVd1bmluaXRpYWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0
LXBhcmFtZXRlciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAt
V3VudXNlZC1yZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBs
aWNhdGVkLWJyYW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93
IC1Xbm8tc2lnbi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNs
dWRlIC1EV0lUSE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNs
L3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQv
L2luY2x1ZGUgLWMgLW8gdWJpLXV0aWxzL3ViaXJzdm9sLm8gLi4vZ2l0L3ViaS11dGlscy91Ymly
c3ZvbC5jCmFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90
bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjIt
cjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uL2dpdCAtSS4vaW5jbHVk
ZSAgLVdhbGwgLVdleHRyYSAtV3VudXNlZCAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3Npbmct
ZGVjbGFyYXRpb25zIC1Xd3JpdGUtc3RyaW5ncyAtV2p1bXAtbWlzc2VzLWluaXQgLVd1bmluaXRp
YWxpemVkIC1XaW5pdC1zZWxmIC1XbG9naWNhbC1vcCAtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRl
ciAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1y
ZXN1bHQgLVd1bnVzZWQtdmFyaWFibGUgLVdkdXBsaWNhdGVkLWNvbmQgLVdkdXBsaWNhdGVkLWJy
YW5jaGVzIC1XcmVzdHJpY3QgLVdudWxsLWRlcmVmZXJlbmNlIC1Xbm8tc2hhZG93IC1Xbm8tc2ln
bi1jb21wYXJlIC1EX0dOVV9TT1VSQ0UgLXN0ZD1nbnU5OSAtSS4uL2dpdC9pbmNsdWRlIC1EV0lU
SE9VVF9YQVRUUiAtRFdJVEhPVVRfTFpPICAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFy
Y2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUg
LWMgLW8gdWJpLXV0aWxzL3ViaWJsb2NrLm8gLi4vZ2l0L3ViaS11dGlscy91YmlibG9jay5jCnJt
IC1mIGxpYm1pc3NpbmcuYQphYXJjaDY0LW9lLWxpbnV4LW11c2wtYXIgY3J1IGxpYm1pc3Npbmcu
YSBsaWIvZXhlY2luZm8ubyBsaWIvZ2V0bGluZS5vIAphYXJjaDY0LW9lLWxpbnV4LW11c2wtYXI6
IGB1JyBtb2RpZmllciBpZ25vcmVkIHNpbmNlIGBEJyBpcyB0aGUgZGVmYXVsdCAoc2VlIGBVJykK
YWFyY2g2NC1vZS1saW51eC1tdXNsLXJhbmxpYiBsaWJtaXNzaW5nLmEKcm0gLWYgbGlidWJpLmEK
cm0gLWYgbGlidWJpZ2VuLmEKYWFyY2g2NC1vZS1saW51eC1tdXNsLWFyIGNydSBsaWJ1YmkuYSBs
aWIvbGlidWJpLm8gCmFhcmNoNjQtb2UtbGludXgtbXVzbC1hciBjcnUgbGlidWJpZ2VuLmEgbGli
L2xpYnViaWdlbi5vIAphYXJjaDY0LW9lLWxpbnV4LW11c2wtYXI6IGFhcmNoNjQtb2UtbGludXgt
bXVzbC1hcjogYHUnIG1vZGlmaWVyIGlnbm9yZWQgc2luY2UgYEQnIGlzIHRoZSBkZWZhdWx0IChz
ZWUgYFUnKQpgdScgbW9kaWZpZXIgaWdub3JlZCBzaW5jZSBgRCcgaXMgdGhlIGRlZmF1bHQgKHNl
ZSBgVScpCmFhcmNoNjQtb2UtbGludXgtbXVzbC1yYW5saWIgbGlidWJpZ2VuLmEKYWFyY2g2NC1v
ZS1saW51eC1tdXNsLXJhbmxpYiBsaWJ1YmkuYQpybSAtZiBsaWJzY2FuLmEKcm0gLWYgbGliaW5p
cGFyc2VyLmEKYWFyY2g2NC1vZS1saW51eC1tdXNsLWFyIGNydSBsaWJzY2FuLmEgbGliL2xpYnNj
YW4ubyAKYWFyY2g2NC1vZS1saW51eC1tdXNsLWFyIGNydSBsaWJpbmlwYXJzZXIuYSBsaWIvbGli
aW5pcGFyc2VyLm8gbGliL2RpY3Rpb25hcnkubyAKYWFyY2g2NC1vZS1saW51eC1tdXNsLWFyOiBg
dScgbW9kaWZpZXIgaWdub3JlZCBzaW5jZSBgRCcgaXMgdGhlIGRlZmF1bHQgKHNlZSBgVScpCmFh
cmNoNjQtb2UtbGludXgtbXVzbC1hcjogYHUnIG1vZGlmaWVyIGlnbm9yZWQgc2luY2UgYEQnIGlz
IHRoZSBkZWZhdWx0IChzZWUgYFUnKQphYXJjaDY0LW9lLWxpbnV4LW11c2wtcmFubGliIGxpYnNj
YW4uYQphYXJjaDY0LW9lLWxpbnV4LW11c2wtcmFubGliIGxpYmluaXBhcnNlci5hCnJtIC1mIGxp
Ym10ZC5hCmFhcmNoNjQtb2UtbGludXgtbXVzbC1hciBjcnUgbGlibXRkLmEgbGliL2xpYm10ZC5v
IGxpYi9saWJmZWMubyBsaWIvY29tbW9uLm8gbGliL2xpYmNyYzMyLm8gbGliL2xpYm10ZF9sZWdh
Y3kubyAKYWFyY2g2NC1vZS1saW51eC1tdXNsLWFyOiBgdScgbW9kaWZpZXIgaWdub3JlZCBzaW5j
ZSBgRCcgaXMgdGhlIGRlZmF1bHQgKHNlZSBgVScpCmFhcmNoNjQtb2UtbGludXgtbXVzbC1yYW5s
aWIgbGlibXRkLmEKLi9hYXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbCAgLS10YWc9Q0MgICAt
LW1vZGU9bGluayBhYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVp
bGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIu
MC4yLXIwL3JlY2lwZS1zeXNyb290ICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0
LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAgIC1v
IHViaXVwZGF0ZXZvbCB1YmktdXRpbHMvdWJpdXBkYXRldm9sLm8gbGlibXRkLmEgbGlidWJpLmEg
Ci4vYWFyY2g2NC1vZS1saW51eC1tdXNsLWxpYnRvb2wgIC0tdGFnPUNDICAgLS1tb2RlPWxpbmsg
YWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNs
L3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNp
cGUtc3lzcm9vdCAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1t
dXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgICAtbyB1Ymlta3ZvbCB1
YmktdXRpbHMvdWJpbWt2b2wubyBsaWJtdGQuYSBsaWJ1YmkuYSAKLi9hYXJjaDY0LW9lLWxpbnV4
LW11c2wtbGlidG9vbCAgLS10YWc9Q0MgICAtLW1vZGU9bGluayBhYXJjaDY0LW9lLWxpbnV4LW11
c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxp
bnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290ICAtSS90bXAv
YnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJj
LzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAgIC1vIHViaXJtdm9sIHViaS11dGlscy91YmlybXZvbC5v
IGxpYm10ZC5hIGxpYnViaS5hIAouL2FhcmNoNjQtb2UtbGludXgtbXVzbC1saWJ0b29sICAtLXRh
Zz1DQyAgIC0tbW9kZT1saW5rIGFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9
L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMt
a2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3Jr
L2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNs
dWRlICAgLW8gdWJpY3JjMzIgdWJpLXV0aWxzL3ViaWNyYzMyLm8gbGlibXRkLmEgbGlidWJpLmEg
Ci4vYWFyY2g2NC1vZS1saW51eC1tdXNsLWxpYnRvb2wgIC0tdGFnPUNDICAgLS1tb2RlPWxpbmsg
YWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNs
L3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNp
cGUtc3lzcm9vdCAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1t
dXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgICAtbyB1YmluZm8gdWJp
LXV0aWxzL3ViaW5mby5vIGxpYm10ZC5hIGxpYnViaS5hIAphYXJjaDY0LW9lLWxpbnV4LW11c2wt
bGlidG9vbDogbGluazogYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgLS1zeXNyb290PS90bXAv
YnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJj
LzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNo
NjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1v
IHViaW1rdm9sIHViaS11dGlscy91Ymlta3ZvbC5vICBsaWJtdGQuYSBsaWJ1YmkuYQphYXJjaDY0
LW9lLWxpbnV4LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2Mg
LS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wv
dWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1JL3RtcC9idWlsZC90bXAt
bXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAv
Z2l0Ly9pbmNsdWRlIC1vIHViaXJtdm9sIHViaS11dGlscy91YmlybXZvbC5vICBsaWJtdGQuYSBs
aWJ1YmkuYQphYXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2NC1vZS1s
aW51eC1tdXNsLWtsY2MgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0
LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1J
L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMt
a2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1vIHViaXVwZGF0ZXZvbCB1YmktdXRpbHMvdWJp
dXBkYXRldm9sLm8gIGxpYm10ZC5hIGxpYnViaS5hCi4vYWFyY2g2NC1vZS1saW51eC1tdXNsLWxp
YnRvb2wgIC0tdGFnPUNDICAgLS1tb2RlPWxpbmsgYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2Mg
IC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNs
L3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAgLUkvdG1wL2J1aWxkL3Rt
cC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1y
MC9naXQvL2luY2x1ZGUgICAtbyB1YmlhdHRhY2ggdWJpLXV0aWxzL3ViaWF0dGFjaC5vIGxpYm10
ZC5hIGxpYnViaS5hIAouL2FhcmNoNjQtb2UtbGludXgtbXVzbC1saWJ0b29sICAtLXRhZz1DQyAg
IC0tbW9kZT1saW5rIGFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjICAtLXN5c3Jvb3Q9L3RtcC9i
dWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMv
Mi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgIC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNo
NjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlICAg
LW8gdWJpZGV0YWNoIHViaS11dGlscy91YmlkZXRhY2gubyBsaWJtdGQuYSBsaWJ1YmkuYSAKLi9h
YXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbCAgLS10YWc9Q0MgICAtLW1vZGU9bGluayBhYXJj
aDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29y
ay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1z
eXNyb290ICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wv
dWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAgIC1vIHViaXJlbmFtZSB1Ymkt
dXRpbHMvdWJpcmVuYW1lLm8gbGlibXRkLmEgbGlidWJpLmEgCi4vYWFyY2g2NC1vZS1saW51eC1t
dXNsLWxpYnRvb2wgIC0tdGFnPUNDICAgLS1tb2RlPWxpbmsgYWFyY2g2NC1vZS1saW51eC1tdXNs
LWtsY2MgIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51
eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAgLUkvdG1wL2J1
aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8y
LjAuMi1yMC9naXQvL2luY2x1ZGUgICAtbyBtdGRpbmZvIHViaS11dGlscy9tdGRpbmZvLm8gbGli
dWJpLmEgbGlidWJpZ2VuLmEgbGlibXRkLmEgCmFhcmNoNjQtb2UtbGludXgtbXVzbC1saWJ0b29s
OiBsaW5rOiBhYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90
bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjIt
cjAvcmVjaXBlLXN5c3Jvb3QgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1s
aW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLW8gdWJpY3Jj
MzIgdWJpLXV0aWxzL3ViaWNyYzMyLm8gIGxpYm10ZC5hIGxpYnViaS5hCmFhcmNoNjQtb2UtbGlu
dXgtbXVzbC1saWJ0b29sOiBsaW5rOiBhYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAtLXN5c3Jv
b3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRp
bHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dv
cmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2lu
Y2x1ZGUgLW8gdWJpbmZvIHViaS11dGlscy91YmluZm8ubyAgbGlibXRkLmEgbGlidWJpLmEKLi9h
YXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbCAgLS10YWc9Q0MgICAtLW1vZGU9bGluayBhYXJj
aDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29y
ay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1z
eXNyb290ICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wv
dWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAgIC1vIHViaXJzdm9sIHViaS11
dGlscy91Ymlyc3ZvbC5vIGxpYm10ZC5hIGxpYnViaS5hIAouL2FhcmNoNjQtb2UtbGludXgtbXVz
bC1saWJ0b29sICAtLXRhZz1DQyAgIC0tbW9kZT1saW5rIGFhcmNoNjQtb2UtbGludXgtbXVzbC1r
bGNjICAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgt
bXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVjaXBlLXN5c3Jvb3QgIC1JL3RtcC9idWls
ZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4w
LjItcjAvZ2l0Ly9pbmNsdWRlICAgLW8gdWJpYmxvY2sgdWJpLXV0aWxzL3ViaWJsb2NrLm8gbGli
bXRkLmEgbGlidWJpLmEgCi4vYWFyY2g2NC1vZS1saW51eC1tdXNsLWxpYnRvb2wgIC0tdGFnPUND
ICAgLS1tb2RlPWxpbmsgYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgIC0tc3lzcm9vdD0vdG1w
L2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGli
Yy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFy
Y2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUg
ICAtbyB1YmluaXplIHViaS11dGlscy91YmluaXplLm8gbGlidWJpLmEgbGlidWJpZ2VuLmEgbGli
bXRkLmEgbGliaW5pcGFyc2VyLmEgCmFhcmNoNjQtb2UtbGludXgtbXVzbC1saWJ0b29sOiBsaW5r
OiBhYXJjaDY0LW9lLWxpbnV4LW11c2wta2xjYyAtLXN5c3Jvb3Q9L3RtcC9idWlsZC90bXAtbXVz
bC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvcmVj
aXBlLXN5c3Jvb3QgLUkvdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1t
dXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9naXQvL2luY2x1ZGUgLW8gdWJpYXR0YWNoIHVi
aS11dGlscy91YmlhdHRhY2gubyAgbGlibXRkLmEgbGlidWJpLmEKYWFyY2g2NC1vZS1saW51eC1t
dXNsLWxpYnRvb2w6IGxpbms6IGFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjIC0tc3lzcm9vdD0v
dG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1r
bGliYy8yLjAuMi1yMC9yZWNpcGUtc3lzcm9vdCAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9h
YXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVk
ZSAtbyB1YmlyZW5hbWUgdWJpLXV0aWxzL3ViaXJlbmFtZS5vICBsaWJtdGQuYSBsaWJ1YmkuYQph
YXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2NC1vZS1saW51eC1tdXNs
LWtsY2MgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4
LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1JL3RtcC9idWls
ZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4w
LjItcjAvZ2l0Ly9pbmNsdWRlIC1vIG10ZGluZm8gdWJpLXV0aWxzL210ZGluZm8ubyAgbGlidWJp
LmEgbGlidWJpZ2VuLmEgbGlibXRkLmEKYWFyY2g2NC1vZS1saW51eC1tdXNsLWxpYnRvb2w6IGxp
bms6IGFhcmNoNjQtb2UtbGludXgtbXVzbC1rbGNjIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1t
dXNsL3dvcmsvYWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9y
ZWNpcGUtc3lzcm9vdCAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4
LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAtbyB1YmlkZXRhY2gg
dWJpLXV0aWxzL3ViaWRldGFjaC5vICBsaWJtdGQuYSBsaWJ1YmkuYQphYXJjaDY0LW9lLWxpbnV4
LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2NC1vZS1saW51eC1tdXNsLWtsY2MgLS1zeXNyb290
PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxz
LWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3Jr
L2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNs
dWRlIC1vIHViaXJzdm9sIHViaS11dGlscy91Ymlyc3ZvbC5vICBsaWJtdGQuYSBsaWJ1YmkuYQph
YXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2NC1vZS1saW51eC1tdXNs
LWtsY2MgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4
LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNyb290IC1JL3RtcC9idWls
ZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91YmktdXRpbHMta2xpYmMvMi4w
LjItcjAvZ2l0Ly9pbmNsdWRlIC1vIHViaWJsb2NrIHViaS11dGlscy91YmlibG9jay5vICBsaWJt
dGQuYSBsaWJ1YmkuYQphYXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbDogbGluazogYWFyY2g2
NC1vZS1saW51eC1tdXNsLWtsY2MgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9h
YXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1zeXNy
b290IC1JL3RtcC9idWlsZC90bXAtbXVzbC93b3JrL2FhcmNoNjQtb2UtbGludXgtbXVzbC91Ymkt
dXRpbHMta2xpYmMvMi4wLjItcjAvZ2l0Ly9pbmNsdWRlIC1vIHViaW5pemUgdWJpLXV0aWxzL3Vi
aW5pemUubyAgbGlidWJpLmEgbGlidWJpZ2VuLmEgbGlibXRkLmEgbGliaW5pcGFyc2VyLmEKLi9h
YXJjaDY0LW9lLWxpbnV4LW11c2wtbGlidG9vbCAgLS10YWc9Q0MgICAtLW1vZGU9bGluayBhYXJj
aDY0LW9lLWxpbnV4LW11c2wta2xjYyAgLS1zeXNyb290PS90bXAvYnVpbGQvdG1wLW11c2wvd29y
ay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL3JlY2lwZS1z
eXNyb290ICAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wv
dWJpLXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAgIC1vIHViaWZvcm1hdCB1Ymkt
dXRpbHMvdWJpZm9ybWF0Lm8gbGlidWJpLmEgbGlidWJpZ2VuLmEgbGlibXRkLmEgbGlic2Nhbi5h
IGxpYm1pc3NpbmcuYSAKYWFyY2g2NC1vZS1saW51eC1tdXNsLWxpYnRvb2w6IGxpbms6IGFhcmNo
NjQtb2UtbGludXgtbXVzbC1rbGNjIC0tc3lzcm9vdD0vdG1wL2J1aWxkL3RtcC1tdXNsL3dvcmsv
YWFyY2g2NC1vZS1saW51eC1tdXNsL3ViaS11dGlscy1rbGliYy8yLjAuMi1yMC9yZWNpcGUtc3lz
cm9vdCAtSS90bXAvYnVpbGQvdG1wLW11c2wvd29yay9hYXJjaDY0LW9lLWxpbnV4LW11c2wvdWJp
LXV0aWxzLWtsaWJjLzIuMC4yLXIwL2dpdC8vaW5jbHVkZSAtbyB1Ymlmb3JtYXQgdWJpLXV0aWxz
L3ViaWZvcm1hdC5vICBsaWJ1YmkuYSBsaWJ1YmlnZW4uYSBsaWJtdGQuYSBsaWJzY2FuLmEgbGli
bWlzc2luZy5hCkRFQlVHOiBTaGVsbCBmdW5jdGlvbiBkb19jb21waWxlIGZpbmlzaGVkCg==

--0000000000005cb319056c688695--
