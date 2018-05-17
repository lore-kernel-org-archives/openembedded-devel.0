Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA4570057
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 16:09:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a8-v6so9394775wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8CCJwgxZzGBH7TSsrPC/YgGP60L3o+sOsnCIeLD6YCQ=;
	b=tMz6Ypu3O2jr/TXq4aY1CGiabUMokz2VGeAxwBN+2gBWEE+ZXFtvLPlyrWanoOUFKr
	xlN0n0okdVgtzr24vmexRJhh2Gdqu4KVFzjNWhCyC4lzNW04UVRxOzElWkMd4q8i5goH
	9T3qjapsi2PyrlJvR+N+PvNtyN0SloeniavFvUc4LqBabqkSNPaKcLwz8uSNBuZkJHhE
	hYpXLH6SvsdGBX6cKYv5sHiHKulxG+kfxTgxvyUK3v/fWdJO2m9Pww1FZNzwzEqhjzl0
	v6kyyM3+EJ/XrDm/L+fjOYYoSR7D/9wbJ+D7NTibH5JV0dxYk2U7wQCOorX8mPmwMjUJ
	FfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8CCJwgxZzGBH7TSsrPC/YgGP60L3o+sOsnCIeLD6YCQ=;
	b=UCxPQux1y7TTPJkLopn+vgTlXwwZtmHPeLK7EE6L18TUWhK6RiS4GIbxjbRMiz3Ioj
	cZR01706cmw8ifz+lhoHRxhgle8rIZ8EzHYaGJbc4CanHQSDr2X0HM770wlmXUys0cV1
	pwSh3DpUaQ/Ysd6Bv6srAnav/c5p8PnzWFLv/71AYwhcJCQywYxKjy66mSh7uBWMTbcv
	WZzbJ1yZ2Oh5ZIF10rX0cF2xQdCv36oZJQN3n8uq2RHHDT4o5YbYPu2/d1/iI47B8eLt
	LcJwJNsaz9IDw5Lo+jv6fbmTg8zeILj4ADX24DUcI27QcZbb9XkI4yzmna1+FcXdzA7l
	5aaw==
X-Gm-Message-State: ALKqPwcuptq0Iu3WZ9EiuOvDzLeHJS1EezBVaGAl0gI05cFUEBfMu92V
	2+Ih+H95kCynwQKEHvt8lmmBAuZYK+rQgNs+Xig=
X-Google-Smtp-Source: AB8JxZrIfEw8K4sbF9Bku/HPpcvsjFLCW6NXf044omjIqDCxmTCxpX215P9Zlx6Ru2aeDwGnDwG62OLQkmNCxLtlGT8=
X-Received: by 2002:a50:e681:: with SMTP id
	z1-v6mr7699581edm.275.1526573385611; 
	Thu, 17 May 2018 09:09:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Thu, 17 May 2018 09:09:45 -0700 (PDT)
In-Reply-To: <CAAQYJAvAyuatyYg6xn3Xw5-uLdY5NcCM8qCTz0D+KTRUAY745w@mail.gmail.com>
References: <1526249791-5375-1-git-send-email-andrea.adami@gmail.com>
	<0bb5eeb2-a597-38bd-bfd6-99dbf8c786e9@gmail.com>
	<CAAQYJAvAyuatyYg6xn3Xw5-uLdY5NcCM8qCTz0D+KTRUAY745w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 17 May 2018 18:09:45 +0200
Message-ID: <CAAQYJAvrQ9G0=+-4oDGsLX_HVFv_jPDAOiuPy+g9gSZvL5E9JQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 17 May 2018 16:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 5:31 PM, Andrea Adami <andrea.adami@gmail.com>
wrote:
> On Thu, May 17, 2018 at 4:15 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 05/13/2018 03:16 PM, Andrea Adami wrote:
>>> Update to new version and drop accepted patches.
>>>
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>>  .../0001-Makefile-build-ubi-utils-only.patch       |  87 ------
>>>  .../0002-common.mk-for-klibc-CC-is-klcc.patch      |  27 --
>>>  ...bubi.c-add-klibc-specific-fixes-for-ioctl.patch |  76 -----
>>>  ...patibility-to-dietlibc-klibc-musl-libc-af.patch |  88 ------
>>>  ...-more-workarounds-for-klibc-compatibility.patch |  52 ----
>>>  ...rser-remove-unused-function-needing-float.patch |  85 ------
>>>  ...ls-common.c-convert-to-integer-arithmetic.patch |  64 ----
>>>  ...ubiformat.c-convert-to-integer-arithmetic.patch |  44 ---
>>>  ...arnings-about-implicit-non-const-casting-.patch |  48 ---
>>>  ...mple-getline-implementation-to-libmissing.patch | 187 ++++++++++++
>>>  ...doing-preprocessor-magic-just-output-off_.patch | 326
+++++++++++++++++++++
>>>  .../0003-Makefile.am-only-build-ubi-utils.patch    |  34 +++
>>>  ...s-common.h-no-features.h-for-klibc-builds.patch |  38 +++
>>>  ...ils-klibc_1.5.2.bb =3D> ubi-utils-klibc_2.0.2.bb} |  26 +-
>>
>> This fails on qemuarm with the following error.
>>
>> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
>> file or directory
>> |  #include <execinfo.h>
>> |           ^~~~~~~~~~~~
>> | compilation terminated.
>> | Makefile:2452: recipe for target 'ubi-utils/ubimkvol.o' failed
>> | make: *** [ubi-utils/ubimkvol.o] Error 1
>> | Makefile:2452: recipe for target 'ubi-utils/ubicrc32.o' failed
>> | make: *** [ubi-utils/ubicrc32.o] Error 1
>> | In file included from ../git/include/common.h:38:0,
>> |                  from ../git/ubi-utils/ubiupdatevol.c:40:
>> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
>> file or directory
>> |  #include <execinfo.h>
>> |           ^~~~~~~~~~~~
>> | compilation terminated.
>> | Makefile:2452: recipe for target 'ubi-utils/ubiupdatevol.o' failed
>> | make: *** [ubi-utils/ubiupdatevol.o] Error 1
>> | ERROR: oe_runmake failed
>>
>> http://errors.yoctoproject.org/Errors/Build/60410/
>>
>> - Armin
>
>
> Hi Armin,
> thanks for testing.
>
> Strange, I did cross-build for all archs, maybe some oe-core change.
> I'll compare with my log (attached the quemuarm).
>
> Cheers
> Andrea
>

I see the issue is with execinfo.h.
As of last week ...musl did not have backtrace/execinfo so I think musl has
been updated and now the HAVE_EXECINFO_H check fails.
I'll try to fix this in the recipe.


Cheers
Andrea

>>
>>>  14 files changed, 598 insertions(+), 584 deletions(-)
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-bui=
ld-ubi-utils-only.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-fo=
r-klibc-CC-is-klcc.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add=
-klibc-specific-fixes-for-ioctl.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-comp=
atibility-to-dietlibc-klibc-musl-libc-af.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-mor=
e-workarounds-for-klibc-compatibility.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser=
-remove-unused-function-needing-float.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-co=
mmon.c-convert-to-integer-arithmetic.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ub=
iformat.c-convert-to-integer-arithmetic.patch
>>>  delete mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-wa=
rnings-about-implicit-non-const-casting-.patch
>>>  create mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add-simple-g=
etline-implementation-to-libmissing.patch
>>>  create mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-d=
oing-preprocessor-magic-just-output-off_.patch
>>>  create mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-=
only-build-ubi-utils.patch
>>>  create mode 100644
meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-co=
mmon.h-no-features.h-for-klibc-builds.patch
>>>  rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_1.5.2.bb
=3D> ubi-utils-klibc_2.0.2.bb} (64%)
>>>
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-b=
uild-ubi-utils-only.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-b=
uild-ubi-utils-only.patch
>>> deleted file mode 100644
>>> index 6ac2cca..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-b=
uild-ubi-utils-only.patch
>>> +++ /dev/null
>>> @@ -1,87 +0,0 @@
>>> -From 1c989e4c36d0bf76ab444f984bc73b98eeacd03f Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 29 Jun 2014 00:32:29 +0200
>>> -Subject: [PATCH 1/9] Makefile: build ubi-utils only
>>> -
>>> -We build all the static ubi-utils but actually only ubiattach is
needed in
>>> -a minimalistic initramfs for the mount of ubi volumes.
>>> -
>>> -More fixes are needed in order to build the full mtd-utils.
>>> -The first issue is:
>>> -
>>> -| mkfs.jffs2.c:64:20: fatal error: libgen.h: No such file or directory
>>> -|  #include <libgen.h>
>>> -
>>> -Removing the include then the second error is:
>>> -
>>> -| mkfs.jffs2.c:1570:22: error: '_SC_PAGESIZE' undeclared
>>> -| (first use in this function)
>>> -|   page_size =3D sysconf(_SC_PAGESIZE);
>>> -
>>> -Upstream-Status: Inappropriate [embedded specific]
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - Makefile | 26 ++------------------------
>>> - 1 file changed, 2 insertions(+), 24 deletions(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index 3ce8587..8b79f71 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -16,28 +16,11 @@ endif
>>> -
>>> - TESTS =3D tests
>>> -
>>> --MTD_BINS =3D \
>>> --    ftl_format flash_erase nanddump doc_loadbios \
>>> --    ftl_check mkfs.jffs2 flash_lock flash_unlock \
>>> --    flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
>>> --    mtd_debug flashcp nandwrite nandtest mtdpart \
>>> --    jffs2dump \
>>> --    nftldump nftl_format docfdisk \
>>> --    rfddump rfdformat \
>>> --    serve_image recv_image \
>>> --    sumtool jffs2reader
>>> - UBI_BINS =3D \
>>> -     ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
>>> -     ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
>>> -
>>> --BINS =3D $(MTD_BINS)
>>> --BINS +=3D mkfs.ubifs/mkfs.ubifs
>>> --BINS +=3D $(addprefix ubi-utils/,$(UBI_BINS))
>>> --SCRIPTS =3D flash_eraseall
>>> --
>>> --TARGETS =3D $(BINS)
>>> --TARGETS +=3D lib/libmtd.a
>>> --TARGETS +=3D ubi-utils/libubi.a
>>> -+BINS =3D $(addprefix ubi-utils/,$(UBI_BINS))
>>> -
>>> - OBJDEPS =3D $(BUILDDIR)/include/version.h
>>> -
>>> -@@ -61,12 +44,9 @@ endif
>>> -     rm -f $(BUILDDIR)/include/version.h
>>> -     $(MAKE) -C $(TESTS) clean
>>> -
>>> --install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
>>> -+install:: $(addprefix $(BUILDDIR)/,${BINS})
>>> -     mkdir -p ${DESTDIR}/${SBINDIR}
>>> -     install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
>>> --    mkdir -p ${DESTDIR}/${MANDIR}/man1
>>> --    install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
>>> --    -gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
>>> -
>>> - tests::
>>> -     $(MAKE) -C $(TESTS)
>>> -@@ -91,8 +71,6 @@ LDLIBS_mkfs.jffs2  =3D -lz $(LZOLDLIBS)
>>> - LDFLAGS_jffs2reader =3D $(ZLIBLDFLAGS) $(LZOLDFLAGS)
>>> - LDLIBS_jffs2reader  =3D -lz $(LZOLDLIBS)
>>> -
>>> --$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
>>> --
>>> - #
>>> - # Common libmtd
>>> - #
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-=
for-klibc-CC-is-klcc.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-=
for-klibc-CC-is-klcc.patch
>>> deleted file mode 100644
>>> index c23d11f..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-=
for-klibc-CC-is-klcc.patch
>>> +++ /dev/null
>>> @@ -1,27 +0,0 @@
>>> -From 89c76bbe82a2029a25b0654eb0a1d0b22d6e6877 Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 29 Jun 2014 00:37:28 +0200
>>> -Subject: [PATCH 2/9] common.mk: for klibc $(CC) is klcc
>>> -
>>> -Do not hardcode: assign the value to the variable if it is not already
defined.
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - common.mk | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/common.mk b/common.mk
>>> -index ba87377..126d11a 100644
>>> ---- a/common.mk
>>> -+++ b/common.mk
>>> -@@ -1,4 +1,4 @@
>>> --CC :=3D $(CROSS)gcc
>>> -+CC ?=3D $(CROSS)gcc
>>> - AR :=3D $(CROSS)ar
>>> - RANLIB :=3D $(CROSS)ranlib
>>> -
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-a=
dd-klibc-specific-fixes-for-ioctl.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-a=
dd-klibc-specific-fixes-for-ioctl.patch
>>> deleted file mode 100644
>>> index 9ad4a5b..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-a=
dd-klibc-specific-fixes-for-ioctl.patch
>>> +++ /dev/null
>>> @@ -1,76 +0,0 @@
>>> -From fecbb7056d621a30f7106e67f5fe209763571b70 Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 29 Jun 2014 00:40:15 +0200
>>> -Subject: [PATCH 3/9] libubi.c: add klibc specific fixes for ioctl
>>> -
>>> -First issue is that ioctl() in klibc doesn't expect a constant as arg3=
.
>>> -Second issue is that arg3 in klibc ioctl() implementation is not
optional.
>>> -
>>> -Fixes:
>>> -
>>> -| ubi-utils/libubi.c: In function 'do_attach':
>>> -| ubi-utils/libubi.c:698:8: warning: passing argument 3 of 'ioctl'
discards
>>> -| 'const' qualifier from pointer target type
>>> -|   ret =3D ioctl(fd, UBI_IOCATT, r);
>>> -|         ^
>>> -| In file included from ubi-utils/libubi.c:32:0:
>>> -| .../lib/klibc/include/sys/ioctl.h:15:14: note: expected 'void *' but
argument
>>> -| is of type 'const struct ubi_attach_req *'
>>> -|  __extern int ioctl(int, int, void *);
>>> -|               ^
>>> -
>>> -| ubi-utils/libubi.c: In function 'ubi_vol_block_create':
>>> -| ubi-utils/libubi.c:1118:9: error: too few arguments to function
'ioctl'
>>> -|   return ioctl(fd, UBI_IOCVOLCRBLK);
>>> -|          ^
>>> -| In file included from ubi-utils/libubi.c:32:0:
>>> -| .../lib/klibc/include/sys/ioctl.h:15:14: note: declared here
>>> -|  __extern int ioctl(int, int, void *);
>>> -|               ^
>>> -| ubi-utils/libubi.c: In function 'ubi_vol_block_remove':
>>> -| ubi-utils/libubi.c:1123:9: error: too few arguments to function
'ioctl'
>>> -|   return ioctl(fd, UBI_IOCVOLRMBLK);
>>> -|          ^
>>> -| In file included from ubi-utils/libubi.c:32:0:
>>> -| .../usr/lib/klibc/include/sys/ioctl.h:15:14: note: declared here
>>> -|  __extern int ioctl(int, int, void *);
>>> -|               ^
>>> -
>>> -Upstream-Status: Accepted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - ubi-utils/libubi.c | 6 +++---
>>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
>>> -index 97c0434..2b49833 100644
>>> ---- a/ubi-utils/libubi.c
>>> -+++ b/ubi-utils/libubi.c
>>> -@@ -687,7 +687,7 @@ void libubi_close(libubi_t desc)
>>> -  * success and %-1 in case of failure. @r->ubi_num contains newly
created UBI
>>> -  * device number.
>>> -  */
>>> --static int do_attach(const char *node, const struct ubi_attach_req *r=
)
>>> -+static int do_attach(const char *node, struct ubi_attach_req *r)
>>> - {
>>> -     int fd, ret;
>>> -
>>> -@@ -1115,12 +1115,12 @@ int ubi_rsvol(libubi_t desc, const char *node,
int vol_id, long long bytes)
>>> -
>>> - int ubi_vol_block_create(int fd)
>>> - {
>>> --    return ioctl(fd, UBI_IOCVOLCRBLK);
>>> -+    return ioctl(fd, UBI_IOCVOLCRBLK, NULL);
>>> - }
>>> -
>>> - int ubi_vol_block_remove(int fd)
>>> - {
>>> --    return ioctl(fd, UBI_IOCVOLRMBLK);
>>> -+    return ioctl(fd, UBI_IOCVOLRMBLK, NULL);
>>> - }
>>> -
>>> - int ubi_update_start(libubi_t desc, int fd, long long bytes)
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-co=
mpatibility-to-dietlibc-klibc-musl-libc-af.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-co=
mpatibility-to-dietlibc-klibc-musl-libc-af.patch
>>> deleted file mode 100644
>>> index 2f31fb4..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-co=
mpatibility-to-dietlibc-klibc-musl-libc-af.patch
>>> +++ /dev/null
>>> @@ -1,88 +0,0 @@
>>> -From b668cb75cb7e72ff92055209130d4cd4b3cacbdb Mon Sep 17 00:00:00 2001
>>> -From: Thorsten Glaser <tg@mirbsd.org>
>>> -Date: Fri, 20 Jun 2014 10:56:27 +0000
>>> -Subject: [PATCH 4/9] Restore compatibility to dietlibc, klibc, musl
libc after
>>> - commit 4f1b108
>>> -MIME-Version: 1.0
>>> -Content-Type: text/plain; charset=3DUTF-8
>>> -Content-Transfer-Encoding: 8bit
>>> -
>>> -Each C library has their own way to define off_t, and the <features.h>
>>> -header is nonstandard and specific to the GNU libc and those that clon=
e
>>> -it (uClibc). Fefe=E2=80=99s dietlibc uses different flags, and klibc a=
lways
uses
>>> -a 64-bit off_t (like the BSDs); musl libc cannot be recognised using
cpp
>>> -instructions, so we assume 64 bit there (and on unknown C libraries)
and
>>> -leave it to the user to submit a follow-up fix if we guess wrong. I
also
>>> -added a static assertion to verify the 64 bit guess is correct.
>>> -
>>> -It would be really better using a configure script for this instead.
>>> -
>>> -Fixes:
>>> -|   CC      lib/libmtd.o
>>> -| In file included from ubi-utils/ubiutils-common.c:35:0:
>>> -| ./include/common.h:29:22: fatal error: features.h: No such file or
directory
>>> -|  #include <features.h>
>>> -|                       ^
>>> -| compilation terminated.
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - include/common.h | 24 ++++++++++++++++++++++++
>>> - 1 file changed, 24 insertions(+)
>>> -
>>> -diff --git a/include/common.h b/include/common.h
>>> -index fb0ca83..5a20964 100644
>>> ---- a/include/common.h
>>> -+++ b/include/common.h
>>> -@@ -26,7 +26,9 @@
>>> - #include <string.h>
>>> - #include <fcntl.h>
>>> - #include <errno.h>
>>> -+#if defined(__GLIBC__) || defined(__UCLIBC__)
>>> - #include <features.h>
>>> -+#endif
>>> - #include <inttypes.h>
>>> - #include "version.h"
>>> -
>>> -@@ -67,6 +69,21 @@ extern "C" {
>>> - #endif
>>> -
>>> - /* define a print format specifier for off_t */
>>> -+#if defined(__KLIBC__)
>>> -+/* always 64 bit on klibc */
>>> -+#define PRIxoff_t PRIx64
>>> -+#define PRIdoff_t PRId64
>>> -+#elif defined(__dietlibc__)
>>> -+/* depends on compiler flags on dietlibc */
>>> -+#if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS =3D=3D 64)
>>> -+#define PRIxoff_t PRIx64
>>> -+#define PRIdoff_t PRId64
>>> -+#else
>>> -+#define PRIxoff_t "l"PRIx32
>>> -+#define PRIdoff_t "l"PRId32
>>> -+#endif
>>> -+#elif defined(__GLIBC__) || defined(__UCLIBC__)
>>> -+/* depends on compiler flags on glibc and uClibc */
>>> - #ifdef __USE_FILE_OFFSET64
>>> - #define PRIxoff_t PRIx64
>>> - #define PRIdoff_t PRId64
>>> -@@ -74,6 +91,13 @@ extern "C" {
>>> - #define PRIxoff_t "l"PRIx32
>>> - #define PRIdoff_t "l"PRId32
>>> - #endif
>>> -+#else
>>> -+/* unknown libc or musl */
>>> -+#define PRIxoff_t PRIx64
>>> -+#define PRIdoff_t PRId64
>>> -+/* verify our guess of 64 bit is correct */
>>> -+static char __PRIxoff_t_static_assert[sizeof(off_t) =3D=3D 8 ? 1 : -1=
];
>>> -+#endif
>>> -
>>> - /* Verbose messages */
>>> - #define bareverbose(verbose, fmt, ...) do {                        \
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-m=
ore-workarounds-for-klibc-compatibility.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-m=
ore-workarounds-for-klibc-compatibility.patch
>>> deleted file mode 100644
>>> index 8309a72..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-m=
ore-workarounds-for-klibc-compatibility.patch
>>> +++ /dev/null
>>> @@ -1,52 +0,0 @@
>>> -From 5d4a66b502003ef385dab31a17012246407e7364 Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 29 Jun 2014 00:44:03 +0200
>>> -Subject: [PATCH 5/9] common.h: more workarounds for klibc compatibilit=
y
>>> -
>>> -Patch is addressing two issues:
>>> -* First,  Klibc doesn't have rpmatch().
>>> -* Second, Klibc lacks getline()
>>> -
>>> -Fixes:
>>> -|   LD      ubi-utils/ubiformat
>>> -| .../git/ubi-utils/ubiformat.o: In function `prompt':
>>> -| .../git/./include/common.h:157: undefined reference to `getline'
>>> -| .../git/./include/common.h:164: undefined reference to `rpmatch'
>>> -| .../git/./include/common.h:157: undefined reference to `getline'
>>> -| .../git/./include/common.h:164: undefined reference to `rpmatch'
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - include/common.h | 8 +++++---
>>> - 1 file changed, 5 insertions(+), 3 deletions(-)
>>> -
>>> -diff --git a/include/common.h b/include/common.h
>>> -index 5a20964..2f51e1c 100644
>>> ---- a/include/common.h
>>> -+++ b/include/common.h
>>> -@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *resp)
>>> -  */
>>> - static inline bool prompt(const char *msg, bool def)
>>> - {
>>> --    char *line =3D NULL;
>>> --    size_t len;
>>> -+    char *line;
>>> -     bool ret =3D def;
>>> -
>>> -+    const int sizeof_line =3D 2;
>>> -+    line =3D malloc(sizeof_line);
>>> -+
>>> -     do {
>>> -             normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ?
'n' : 'N');
>>> -             fflush(stdout);
>>> -
>>> --            while (getline(&line, &len, stdin) =3D=3D -1) {
>>> -+            while (fgets(line, sizeof_line, stdin) =3D=3D NULL) {
>>> -                     printf("failed to read prompt; assuming '%s'\n",
>>> -                             def ? "yes" : "no");
>>> -                     break;
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libinipars=
er-remove-unused-function-needing-float.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libinipars=
er-remove-unused-function-needing-float.patch
>>> deleted file mode 100644
>>> index d046f95..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libinipars=
er-remove-unused-function-needing-float.patch
>>> +++ /dev/null
>>> @@ -1,85 +0,0 @@
>>> -From 2af30e9b2988111e45ed6ea6af55e49ec7cb1cb1 Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 29 Jun 2014 00:44:57 +0200
>>> -Subject: [PATCH 6/9] libiniparser: remove unused function needing floa=
t
>>> -
>>> -Fixes:
>>> -|   LD      ubi-utils/ubiformat
>>> -| .../git/ubi-utils/libiniparser.a(libiniparser.o): In function
>>> -| `  LD      ubi-utils/ubirename
>>> -| iniparser_getdouble':
>>> -| .../git/ubi-utils/libiniparser.c:336: undefined reference to `atof'
>>> -
>>> -Grep doesn't reveal any occurrence of iniparser_getdouble(), using
atof() so
>>> -remove it: floating-point is not supported in klibc
>>> -
>>> -Upstream-Status: Accepted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - ubi-utils/include/libiniparser.h | 15 ---------------
>>> - ubi-utils/libiniparser.c         | 22 ----------------------
>>> - 2 files changed, 37 deletions(-)
>>> -
>>> -diff --git a/ubi-utils/include/libiniparser.h
b/ubi-utils/include/libiniparser.h
>>> -index be3c667..abd77aa 100644
>>> ---- a/ubi-utils/include/libiniparser.h
>>> -+++ b/ubi-utils/include/libiniparser.h
>>> -@@ -158,21 +158,6 @@ int iniparser_getint(dictionary * d, const char *
key, int notfound);
>>> -
>>> -
/*-------------------------------------------------------------------------=
*/
>>> - /**
>>> --  @brief    Get the string associated to a key, convert to a double
>>> --  @param    d Dictionary to search
>>> --  @param    key Key string to look for
>>> --  @param    notfound Value to return in case of error
>>> --  @return   double
>>> --
>>> --  This function queries a dictionary for a key. A key as read from an
>>> --  ini file is given as "section:key". If the key cannot be found,
>>> --  the notfound value is returned.
>>> -- */
>>>
--/*-----------------------------------------------------------------------=
---*/
>>> --double iniparser_getdouble(dictionary * d, char * key, double
notfound);
>>> --
>>>
--/*-----------------------------------------------------------------------=
--*/
>>> --/**
>>> -   @brief    Get the string associated to a key, convert to a boolean
>>> -   @param    d Dictionary to search
>>> -   @param    key Key string to look for
>>> -diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
>>> -index 898f57f..ba70c08 100644
>>> ---- a/ubi-utils/libiniparser.c
>>> -+++ b/ubi-utils/libiniparser.c
>>> -@@ -316,28 +316,6 @@ int iniparser_getint(dictionary * d, const char *
key, int notfound)
>>> -
>>> -
/*-------------------------------------------------------------------------=
*/
>>> - /**
>>> --  @brief    Get the string associated to a key, convert to a double
>>> --  @param    d Dictionary to search
>>> --  @param    key Key string to look for
>>> --  @param    notfound Value to return in case of error
>>> --  @return   double
>>> --
>>> --  This function queries a dictionary for a key. A key as read from an
>>> --  ini file is given as "section:key". If the key cannot be found,
>>> --  the notfound value is returned.
>>> -- */
>>>
--/*-----------------------------------------------------------------------=
---*/
>>> --double iniparser_getdouble(dictionary * d, char * key, double
notfound)
>>> --{
>>> --    char    *   str ;
>>> --
>>> --    str =3D iniparser_getstring(d, key, INI_INVALID_KEY);
>>> --    if (str=3D=3DINI_INVALID_KEY) return notfound ;
>>> --    return atof(str);
>>> --}
>>> --
>>>
--/*-----------------------------------------------------------------------=
--*/
>>> --/**
>>> -   @brief    Get the string associated to a key, convert to a boolean
>>> -   @param    d Dictionary to search
>>> -   @param    key Key string to look for
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-=
common.c-convert-to-integer-arithmetic.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-=
common.c-convert-to-integer-arithmetic.patch
>>> deleted file mode 100644
>>> index 36b012f..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-=
common.c-convert-to-integer-arithmetic.patch
>>> +++ /dev/null
>>> @@ -1,64 +0,0 @@
>>> -From 41e7c76b0853bf5241b38b8167dfd57c27fef1eb Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sun, 28 Jan 2018 21:47:59 +0100
>>> -Subject: [PATCH 7/9] mtd-utils: common.c: convert to integer arithmeti=
c
>>> -
>>> -We use floating point just to print out KiB, MiB, GiB.
>>> -Avoid that to be klibc friendly.
>>> -
>>> -Fixes compilation for aarch64 against klibc:
>>> -
>>> -error: '-mgeneral-regs-only' is incompatible with floating-point
argument
>>> -|    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
>>> -etc.
>>> -
>>> -Note:
>>> -* In the KiB case, we could apparently multiply by 100 before dividing
>>> -  without risking overflow. This code simply avoids multiplications.
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - ubi-utils/ubiutils-common.c | 18 ++++++++++++------
>>> - 1 file changed, 12 insertions(+), 6 deletions(-)
>>> -
>>> -diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
>>> -index 6609a6b..0ded2a4 100644
>>> ---- a/ubi-utils/ubiutils-common.c
>>> -+++ b/ubi-utils/ubiutils-common.c
>>> -@@ -107,6 +107,9 @@ long long ubiutils_get_bytes(const char *str)
>>> - void ubiutils_print_bytes(long long bytes, int bracket)
>>> - {
>>> -     const char *p;
>>> -+    int GiB =3D 1024 * 1024 * 1024;
>>> -+    int MiB =3D 1024 * 1024;
>>> -+    int KiB =3D 1024;
>>> -
>>> -     if (bracket)
>>> -             p =3D " (";
>>> -@@ -115,12 +118,15 @@ void ubiutils_print_bytes(long long bytes, int
bracket)
>>> -
>>> -     printf("%lld bytes", bytes);
>>> -
>>> --    if (bytes > 1024 * 1024 * 1024)
>>> --            printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 *
1024));
>>> --    else if (bytes > 1024 * 1024)
>>> --            printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
>>> --    else if (bytes > 1024 && bytes !=3D 0)
>>> --            printf("%s%.1f KiB", p, (double)bytes / 1024);
>>> -+    if (bytes > GiB)
>>> -+            printf("%s%lld.%lld GiB", p,
>>> -+                   bytes / GiB, bytes % GiB / (GiB / 10));
>>> -+    else if (bytes > MiB)
>>> -+            printf("%s%lld.%lld MiB", p,
>>> -+                   bytes / MiB, bytes % MiB / (MiB / 10));
>>> -+    else if (bytes > KiB && bytes !=3D 0)
>>> -+            printf("%s%lld.%lld KiB", p,
>>> -+                   bytes / KiB, bytes % KiB / (KiB / 10));
>>> -     else
>>> -             return;
>>> -
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-=
ubiformat.c-convert-to-integer-arithmetic.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-=
ubiformat.c-convert-to-integer-arithmetic.patch
>>> deleted file mode 100644
>>> index 5bd0574..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-=
ubiformat.c-convert-to-integer-arithmetic.patch
>>> +++ /dev/null
>>> @@ -1,44 +0,0 @@
>>> -From e6f1a85c0a3df24fe3ca9a520dc697105e75a80c Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sat, 27 Jan 2018 09:39:26 +0100
>>> -Subject: [PATCH 8/9] ubi-utils: ubiformat.c: convert to integer
arithmetic
>>> -
>>> -Do not cast percent to double, it is just used as upper limit.
>>> -Avoid floating point to fix compilation for aarch64 against klibc:
>>> -
>>> -error: '-mgeneral-regs-only' is incompatible with floating-point code
>>> -|    int percent =3D ((double)si->ok_cnt)/si->good_cnt * 100;
>>> -|        ^~~~~~~
>>> -
>>> -Notes:
>>> -* The checks in the code above this line ensure that si->good_cnt is
not 0.
>>> -
>>> -* The code assumes  si->good_cnt * 100  will not overflow, then we can
use
>>> -  (si->ok_cnt * 100) safely because the former is bigger.
>>> -
>>> -* The truncated result does not affect the logic:
>>> -  i.e. a value of 49.9 is truncated to 49 and is still <50.
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - ubi-utils/ubiformat.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
>>> -index 21409ca..d93164a 100644
>>> ---- a/ubi-utils/ubiformat.c
>>> -+++ b/ubi-utils/ubiformat.c
>>> -@@ -843,7 +843,7 @@ int main(int argc, char * const argv[])
>>> -     }
>>> -
>>> -     if (!args.override_ec && si->empty_cnt < si->good_cnt) {
>>> --            int percent =3D ((double)si->ok_cnt)/si->good_cnt * 100;
>>> -+            int percent =3D (si->ok_cnt * 100) / si->good_cnt;
>>> -
>>> -             /*
>>> -              * Make sure the majority of eraseblocks have valid
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-=
warnings-about-implicit-non-const-casting-.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-=
warnings-about-implicit-non-const-casting-.patch
>>> deleted file mode 100644
>>> index 658246a..0000000
>>> ---
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-=
warnings-about-implicit-non-const-casting-.patch
>>> +++ /dev/null
>>> @@ -1,48 +0,0 @@
>>> -From 2229f3b9fd4bad47794c28e558ad273173cea73d Mon Sep 17 00:00:00 2001
>>> -From: Andrea Adami <andrea.adami@gmail.com>
>>> -Date: Sat, 27 Jan 2018 09:52:46 +0100
>>> -Subject: [PATCH 9/9] Eliminate warnings about implicit non-const
casting in
>>> - libmtd
>>> -
>>> -The mtd_get_dev_info1 function reads (among other things) name and typ=
e
>>> -string into coresponding struct mtd_dev_info fields.
>>> -
>>> -The struct mtd_dev_info has the string fields marked const, requiring
>>> -them to be cast to non-const version during initialization.
>>> -
>>> -This cast was previously omitted from the dev_read_data calls,
>>> -triggering warnings during compilation.
>>> -
>>> -Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>> -Signed-off-by: Richard Weinberger <richard@nod.at>
>>> -
>>> -Upstream-Status: Backport
>>> -
>>> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ----
>>> - lib/libmtd.c | 4 ++--
>>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/lib/libmtd.c b/lib/libmtd.c
>>> -index 60b4782..5f0bcbc 100644
>>> ---- a/lib/libmtd.c
>>> -+++ b/lib/libmtd.c
>>> -@@ -746,13 +746,13 @@ int mtd_get_dev_info1(libmtd_t desc, int
mtd_num, struct mtd_dev_info *mtd)
>>> -     if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
>>> -             return -1;
>>> -
>>> --    ret =3D dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
>>> -+    ret =3D dev_read_data(lib->mtd_name, mtd_num, (char *)&mtd->name,
>>> -                         MTD_NAME_MAX + 1);
>>> -     if (ret < 0)
>>> -             return -1;
>>> -     ((char *)mtd->name)[ret - 1] =3D '\0';
>>> -
>>> --    ret =3D dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
>>> -+    ret =3D dev_read_data(lib->mtd_type, mtd_num, (char
*)&mtd->type_str,
>>> -                         MTD_TYPE_MAX + 1);
>>> -     if (ret < 0)
>>> -             return -1;
>>> ---
>>> -2.7.4
>>> -
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add-simple=
-getline-implementation-to-libmissing.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add-simple=
-getline-implementation-to-libmissing.patch
>>> new file mode 100644
>>> index 0000000..d4c6d87
>>> --- /dev/null
>>> +++
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-Add-simple=
-getline-implementation-to-libmissing.patch
>>> @@ -0,0 +1,187 @@
>>> +From 10c289454dad34632d767694aecb508dae5073bf Mon Sep 17 00:00:00 2001
>>> +From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>> +Date: Thu, 1 Feb 2018 12:16:18 +0100
>>> +Subject: [PATCH 1/4] Add simple getline() implementation to libmissing
>>> +
>>> +Some C libraries, like klibc don't implement getline(). This patch
>>> +adds a simple stub implementation to libmissing that does an fgets
>>> +into a stack allocated buffer and returns the result.
>>> +
>>> +Upstream-Status: Backport
>>> +
>>> +Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>> +---
>>> + configure.ac              |  1 +
>>> + include/common.h          |  1 +
>>> + include/libmissing.h      |  7 +++++++
>>> + jffsX-utils/Makemodule.am |  2 +-
>>> + lib/Makemodule.am         |  3 ++-
>>> + lib/getline.c             | 36 ++++++++++++++++++++++++++++++++++++
>>> + misc-utils/Makemodule.am  |  2 ++
>>> + ubi-utils/Makemodule.am   |  2 +-
>>> + ubifs-utils/Makemodule.am |  1 +
>>> + 9 files changed, 52 insertions(+), 3 deletions(-)
>>> + create mode 100644 lib/getline.c
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 83d754f..5af0115 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -191,6 +191,7 @@ if test "x$need_cmocka" =3D "xyes"; then
>>> + fi
>>> +
>>> + AC_CHECK_HEADERS([execinfo.h])
>>> ++AC_CHECK_FUNCS([getline])
>>> +
>>> + ##### produce summary on dependencies #####
>>> +
>>> +diff --git a/include/common.h b/include/common.h
>>> +index 2ce5d22..f8f72ea 100644
>>> +--- a/include/common.h
>>> ++++ b/include/common.h
>>> +@@ -32,6 +32,7 @@
>>> + #include <sys/sysmacros.h>
>>> +
>>> + #include "config.h"
>>> ++#include "libmissing.h"
>>> +
>>> + #ifndef PROGRAM_NAME
>>> + # error "You must define PROGRAM_NAME before including this header"
>>> +diff --git a/include/libmissing.h b/include/libmissing.h
>>> +index 0196033..09dbce1 100644
>>> +--- a/include/libmissing.h
>>> ++++ b/include/libmissing.h
>>> +@@ -7,11 +7,18 @@
>>> + #include <execinfo.h>
>>> + #endif
>>> +
>>> ++#include <sys/types.h>
>>> ++#include <stdio.h>
>>> ++
>>> + #ifndef HAVE_EXECINFO_H
>>> + int backtrace(void **buffer, int size);
>>> + char **backtrace_symbols(void *const *buffer, int size);
>>> + void backtrace_symbols_fd(void *const *buffer, int size, int fd);
>>> + #endif
>>> +
>>> ++#ifndef HAVE_GETLINE
>>> ++ssize_t getline(char **lineptr, size_t *n, FILE *stream);
>>> ++#endif
>>> ++
>>> + #endif /* LIBMISSING_H */
>>> +
>>> +diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
>>> +index fb181de..9d7a5d9 100644
>>> +--- a/jffsX-utils/Makemodule.am
>>> ++++ b/jffsX-utils/Makemodule.am
>>> +@@ -17,7 +17,7 @@ jffs2dump_SOURCES =3D jffsX-utils/jffs2dump.c
>>> + jffs2dump_LDADD =3D libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
>>> +
>>> + sumtool_SOURCES =3D jffsX-utils/sumtool.c
>>> +-sumtool_LDADD =3D libmtd.a
>>> ++sumtool_LDADD =3D libmtd.a libmissing.a
>>> +
>>> + JFFSX_BINS =3D \
>>> +     mkfs.jffs2 jffs2dump jffs2reader sumtool
>>> +diff --git a/lib/Makemodule.am b/lib/Makemodule.am
>>> +index 5bee5b6..645632a 100644
>>> +--- a/lib/Makemodule.am
>>> ++++ b/lib/Makemodule.am
>>> +@@ -7,7 +7,8 @@ libmtd_a_SOURCES =3D \
>>> +     lib/libmtd_int.h
>>> +
>>> + libmissing_a_SOURCES =3D \
>>> +-    lib/execinfo.c
>>> ++    lib/execinfo.c \
>>> ++    lib/getline.c
>>> +
>>> + libubi_a_SOURCES =3D \
>>> +     lib/libubi.c \
>>> +diff --git a/lib/getline.c b/lib/getline.c
>>> +new file mode 100644
>>> +index 0000000..c575bf7
>>> +--- /dev/null
>>> ++++ b/lib/getline.c
>>> +@@ -0,0 +1,36 @@
>>> ++#include <stdlib.h>
>>> ++#include <string.h>
>>> ++
>>> ++#include "libmissing.h"
>>> ++
>>> ++#ifndef HAVE_GETLINE
>>> ++ssize_t getline(char **lineptr, size_t *n, FILE *stream)
>>> ++{
>>> ++    char buffer[256], *new;
>>> ++    size_t count;
>>> ++
>>> ++    if (!(*lineptr))
>>> ++            *n =3D 0;
>>> ++
>>> ++    if (!fgets(buffer, sizeof(buffer), stream)) {
>>> ++            if (!feof(stream))
>>> ++                    return -1;
>>> ++
>>> ++            buffer[0] =3D '\0';
>>> ++    }
>>> ++
>>> ++    count =3D strlen(buffer) + 1;
>>> ++
>>> ++    if (*n < count) {
>>> ++            new =3D realloc(*lineptr, count);
>>> ++            if (!new)
>>> ++                    return -1;
>>> ++            *lineptr =3D new;
>>> ++            *n =3D count;
>>> ++    }
>>> ++
>>> ++    memcpy(*lineptr, buffer, count);
>>> ++    return count;
>>> ++}
>>> ++#endif
>>> ++
>>> +diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
>>> +index ce1c385..bfc5342 100644
>>> +--- a/misc-utils/Makemodule.am
>>> ++++ b/misc-utils/Makemodule.am
>>> +@@ -1,4 +1,5 @@
>>> + ftl_format_SOURCES =3D misc-utils/ftl_format.c
>>> ++ftl_format_LDADD =3D libmissing.a
>>> +
>>> + doc_loadbios_SOURCES =3D misc-utils/doc_loadbios.c
>>> +
>>> +@@ -25,6 +26,7 @@ flash_otp_info_SOURCES =3D misc-utils/flash_otp_info=
.c
>>> + flash_otp_dump_SOURCES =3D misc-utils/flash_otp_dump.c
>>> +
>>> + flash_otp_lock_SOURCES =3D misc-utils/flash_otp_lock.c
>>> ++flash_otp_lock_LDADD =3D libmissing.a
>>> +
>>> + flash_otp_write_SOURCES =3D misc-utils/flash_otp_write.c
>>> +
>>> +diff --git a/ubi-utils/Makemodule.am b/ubi-utils/Makemodule.am
>>> +index 215eac2..7b447c7 100644
>>> +--- a/ubi-utils/Makemodule.am
>>> ++++ b/ubi-utils/Makemodule.am
>>> +@@ -23,7 +23,7 @@ ubinize_SOURCES =3D ubi-utils/ubinize.c
>>> + ubinize_LDADD =3D libubi.a libubigen.a libmtd.a libiniparser.a
>>> +
>>> + ubiformat_SOURCES =3D ubi-utils/ubiformat.c
>>> +-ubiformat_LDADD =3D libubi.a libubigen.a libmtd.a libscan.a
>>> ++ubiformat_LDADD =3D libubi.a libubigen.a libmtd.a libscan.a libmissin=
g.a
>>> +
>>> + ubirename_SOURCES =3D ubi-utils/ubirename.c
>>> + ubirename_LDADD =3D libmtd.a libubi.a
>>> +diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
>>> +index 5862afb..787beb9 100644
>>> +--- a/ubifs-utils/Makemodule.am
>>> ++++ b/ubifs-utils/Makemodule.am
>>> +@@ -17,6 +17,7 @@ mkfs_ubifs_SOURCES =3D \
>>> +     ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
>>> +     ubifs-utils/mkfs.ubifs/devtable.c
>>> + mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS)
$(UUID_LIBS) -lm
>>> ++mkfs_ubifs_LDADD +=3D libmissing.a
>>> + mkfs_ubifs_CPPFLAGS =3D $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
$(UUID_CFLAGS) \
>>> +     -I$(top_srcdir)/ubi-utils/include
-I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
>>> +
>>> +--
>>> +2.7.4
>>> +
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of=
-doing-preprocessor-magic-just-output-off_.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of=
-doing-preprocessor-magic-just-output-off_.patch
>>> new file mode 100644
>>> index 0000000..bb675a7
>>> --- /dev/null
>>> +++
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of=
-doing-preprocessor-magic-just-output-off_.patch
>>> @@ -0,0 +1,326 @@
>>> +From 01c98d5d5d044d9a125abcdbb2f3d771966365b0 Mon Sep 17 00:00:00 2001
>>> +From: mirabilos <m@mirbsd.org>
>>> +Date: Thu, 1 Feb 2018 15:34:07 +0100
>>> +Subject: [PATCH 2/4] Instead of doing preprocessor magic, just output
off_t as
>>> + long long
>>> +
>>> +Fix warnings abot PRIdoff_t in libmtd.c, in mtd_read (and mtd_write):
>>> +
>>> +In file included from ../git/lib/libmtd.c:40:0:
>>> +../git/lib/libmtd.c: In function 'mtd_read':
>>> +../git/include/common.h:110:18: warning: format '%ld' expects argument
of
>>> + type 'long int', but argument 5 has type 'off_t {aka long long int}'
>>> + [-Wformat=3D]
>>> +
>>> +../git/include/common.h:120:2: note: in expansion of macro 'errmsg'
>>> +  errmsg(fmt, ##__VA_ARGS__);                                         =
\
>>> +  ^~~~~~
>>> +../git/lib/libmtd.c:1082:10: note: in expansion of macro 'sys_errmsg'
>>> +   return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
>>> +          ^~~~~~~~~~
>>> +
>>> +/usr/lib/klibc/include/inttypes.h:28:17: note: format string is
defined here
>>> + #define PRId32 "d"
>>> +
>>> +Upstream-Status: Submitted
>>> +
>>> +Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
>>> +---
>>> + include/common.h                    | 18 ------------------
>>> + jffsX-utils/mkfs.jffs2.c            | 20 ++++++++++----------
>>> + lib/libmtd.c                        |  8 ++++----
>>> + misc-utils/flash_erase.c            |  6 +++---
>>> + misc-utils/flash_otp_write.c        |  2 +-
>>> + misc-utils/ftl_check.c              |  2 +-
>>> + misc-utils/mtd_debug.c              |  4 ++--
>>> + misc-utils/serve_image.c            |  4 ++--
>>> + tests/fs-tests/integrity/integck.c  |  4 ++--
>>> + tests/mtd-tests/nandpagetest.c      |  4 ++--
>>> + tests/ubi-tests/integ.c             |  6 +++---
>>> + ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  6 +++---
>>> + 12 files changed, 33 insertions(+), 51 deletions(-)
>>> +
>>> +diff --git a/include/common.h b/include/common.h
>>> +index f8f72ea..642c212 100644
>>> +--- a/include/common.h
>>> ++++ b/include/common.h
>>> +@@ -70,24 +70,6 @@ extern "C" {
>>> + #define O_CLOEXEC 0
>>> + #endif
>>> +
>>> +-/* define a print format specifier for off_t */
>>> +-#if (SIZEOF_OFF_T >=3D 8)
>>> +-#define PRIxoff_t PRIx64
>>> +-#define PRIdoff_t PRId64
>>> +-#else
>>> +-#define PRIxoff_t "l"PRIx32
>>> +-#define PRIdoff_t "l"PRId32
>>> +-#endif
>>> +-
>>> +-/* define a print format specifier for loff_t */
>>> +-#if (SIZEOF_LOFF_T >=3D 8)
>>> +-#define PRIxloff_t PRIx64
>>> +-#define PRIdloff_t PRId64
>>> +-#else
>>> +-#define PRIxloff_t "l"PRIx32
>>> +-#define PRIdloff_t "l"PRId32
>>> +-#endif
>>> +-
>>> + /* Verbose messages */
>>> + #define bareverbose(verbose, fmt, ...) do {                        \
>>> +     if (verbose)                                               \
>>> +diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
>>> +index 9aa6c39..0661786 100644
>>> +--- a/jffsX-utils/mkfs.jffs2.c
>>> ++++ b/jffsX-utils/mkfs.jffs2.c
>>> +@@ -1237,8 +1237,8 @@ static void recursive_populate_directory(struct
filesystem_entry *dir)
>>> +             } else switch (e->sb.st_mode & S_IFMT) {
>>> +                     case S_IFDIR:
>>> +                             if (verbose) {
>>> +-                                    printf("\td %04o %9" PRIdoff_t "
            %5d:%-3d %s\n",
>>> +-                                                    e->sb.st_mode &
~S_IFMT, e->sb.st_size,
>>> ++                                    printf("\td %04o %9lld
  %5d:%-3d %s\n",
>>> ++                                                    e->sb.st_mode &
~S_IFMT, (long long)e->sb.st_size,
>>> +                                                     (int)
(e->sb.st_uid), (int) (e->sb.st_gid),
>>> +                                                     e->name);
>>> +                             }
>>> +@@ -1247,8 +1247,8 @@ static void recursive_populate_directory(struct
filesystem_entry *dir)
>>> +                             break;
>>> +                     case S_IFSOCK:
>>> +                             if (verbose) {
>>> +-                                    printf("\ts %04o %9" PRIdoff_t "
            %5d:%-3d %s\n",
>>> +-                                                    e->sb.st_mode &
~S_IFMT, e->sb.st_size,
>>> ++                                    printf("\ts %04o %9lld
  %5d:%-3d %s\n",
>>> ++                                                    e->sb.st_mode &
~S_IFMT, (long long)e->sb.st_size,
>>> +                                                     (int)
e->sb.st_uid, (int) e->sb.st_gid, e->name);
>>> +                             }
>>> +                             write_pipe(e);
>>> +@@ -1256,8 +1256,8 @@ static void recursive_populate_directory(struct
filesystem_entry *dir)
>>> +                             break;
>>> +                     case S_IFIFO:
>>> +                             if (verbose) {
>>> +-                                    printf("\tp %04o %9" PRIdoff_t "
            %5d:%-3d %s\n",
>>> +-                                                    e->sb.st_mode &
~S_IFMT, e->sb.st_size,
>>> ++                                    printf("\tp %04o %9lld
  %5d:%-3d %s\n",
>>> ++                                                    e->sb.st_mode &
~S_IFMT, (long long)e->sb.st_size,
>>> +                                                     (int)
e->sb.st_uid, (int) e->sb.st_gid, e->name);
>>> +                             }
>>> +                             write_pipe(e);
>>> +@@ -1285,8 +1285,8 @@ static void recursive_populate_directory(struct
filesystem_entry *dir)
>>> +                             break;
>>> +                     case S_IFLNK:
>>> +                             if (verbose) {
>>> +-                                    printf("\tl %04o %9" PRIdoff_t "
            %5d:%-3d %s -> %s\n",
>>> +-                                                    e->sb.st_mode &
~S_IFMT, e->sb.st_size,
>>> ++                                    printf("\tl %04o %9lld
  %5d:%-3d %s -> %s\n",
>>> ++                                                    e->sb.st_mode &
~S_IFMT, (long long)e->sb.st_size,
>>> +                                                     (int)
e->sb.st_uid, (int) e->sb.st_gid, e->name,
>>> +                                                     e->link);
>>> +                             }
>>> +@@ -1297,8 +1297,8 @@ static void recursive_populate_directory(struct
filesystem_entry *dir)
>>> +                             wrote =3D write_regular_file(e);
>>> +                             write_xattr_entry(e);
>>> +                             if (verbose) {
>>> +-                                    printf("\tf %04o %9" PRIdoff_t "
(%9u) %5d:%-3d %s\n",
>>> +-                                                    e->sb.st_mode &
~S_IFMT, e->sb.st_size, wrote,
>>> ++                                    printf("\tf %04o %9lld (%9u)
%5d:%-3d %s\n",
>>> ++                                                    e->sb.st_mode &
~S_IFMT, (long long)e->sb.st_size, wrote,
>>> +                                                     (int)
e->sb.st_uid, (int) e->sb.st_gid, e->name);
>>> +                             }
>>> +                             break;
>>> +diff --git a/lib/libmtd.c b/lib/libmtd.c
>>> +index 86c89ae..f375381 100644
>>> +--- a/lib/libmtd.c
>>> ++++ b/lib/libmtd.c
>>> +@@ -1079,8 +1079,8 @@ int mtd_read(const struct mtd_dev_info *mtd, int
fd, int eb, int offs,
>>> +     /* Seek to the beginning of the eraseblock */
>>> +     seek =3D (off_t)eb * mtd->eb_size + offs;
>>> +     if (lseek(fd, seek, SEEK_SET) !=3D seek)
>>> +-            return sys_errmsg("cannot seek mtd%d to offset
%"PRIdoff_t,
>>> +-                              mtd->mtd_num, seek);
>>> ++            return sys_errmsg("cannot seek mtd%d to offset %lld",
>>> ++                              mtd->mtd_num, (long long)seek);
>>> +
>>> +     while (rd < len) {
>>> +             ret =3D read(fd, buf + rd, len - rd);
>>> +@@ -1188,8 +1188,8 @@ int mtd_write(libmtd_t desc, const struct
mtd_dev_info *mtd, int fd, int eb,
>>> +     if (data) {
>>> +             /* Seek to the beginning of the eraseblock */
>>> +             if (lseek(fd, seek, SEEK_SET) !=3D seek)
>>> +-                    return sys_errmsg("cannot seek mtd%d to offset
%"PRIdoff_t,
>>> +-                                    mtd->mtd_num, seek);
>>> ++                    return sys_errmsg("cannot seek mtd%d to offset
%lld",
>>> ++                                    mtd->mtd_num, (long long)seek);
>>> +             ret =3D write(fd, data, len);
>>> +             if (ret !=3D len)
>>> +                     return sys_errmsg("cannot write %d bytes to mtd%d
"
>>> +diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
>>> +index 0c9449f..ec4b2e1 100644
>>> +--- a/misc-utils/flash_erase.c
>>> ++++ b/misc-utils/flash_erase.c
>>> +@@ -53,8 +53,8 @@ int target_endian =3D __BYTE_ORDER;
>>> + static void show_progress(struct mtd_dev_info *mtd, off_t start, int
eb,
>>> +                       int eb_start, int eb_cnt)
>>> + {
>>> +-    bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %%
complete ",
>>> +-            mtd->eb_size / 1024, start, ((eb - eb_start) * 100) /
eb_cnt);
>>> ++    bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %%
complete ",
>>> ++            mtd->eb_size / 1024, (unsigned long long)start, ((eb -
eb_start) * 100) / eb_cnt);
>>> +     fflush(stdout);
>>> + }
>>> +
>>> +@@ -210,7 +210,7 @@ int main(int argc, char *argv[])
>>> +             if (!noskipbad) {
>>> +                     int ret =3D mtd_is_bad(&mtd, fd, eb);
>>> +                     if (ret > 0) {
>>> +-                            verbose(!quiet, "Skipping bad block at
%08"PRIxoff_t, offset);
>>> ++                            verbose(!quiet, "Skipping bad block at
%08llx", (unsigned long long)offset);
>>> +                             continue;
>>> +                     } else if (ret < 0) {
>>> +                             if (errno =3D=3D EOPNOTSUPP) {
>>> +diff --git a/misc-utils/flash_otp_write.c
b/misc-utils/flash_otp_write.c
>>> +index b02d0b0..04c96c6 100644
>>> +--- a/misc-utils/flash_otp_write.c
>>> ++++ b/misc-utils/flash_otp_write.c
>>> +@@ -76,7 +76,7 @@ int main(int argc,char *argv[])
>>> +             return errno;
>>> +     }
>>> +
>>> +-    printf("Writing OTP user data on %s at offset 0x%"PRIxoff_t"\n",
argv[2], offset);
>>> ++    printf("Writing OTP user data on %s at offset 0x%llx\n", argv[2],
(unsigned long long)offset);
>>> +
>>> +     if (mtd_type_is_nand_user(&mtdInfo))
>>> +             len =3D mtdInfo.writesize;
>>> +diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
>>> +index a853cf4..e854922 100644
>>> +--- a/misc-utils/ftl_check.c
>>> ++++ b/misc-utils/ftl_check.c
>>> +@@ -131,7 +131,7 @@ static void check_partition(int fd)
>>> +                     perror("read failed");
>>> +                     break;
>>> +             }
>>> +-            printf("\nErase unit %"PRIdoff_t":\n", i);
>>> ++            printf("\nErase unit %lld:\n", (long long)i);
>>> +             if ((hdr2.FormattedSize !=3D hdr.FormattedSize) ||
>>> +                             (hdr2.NumEraseUnits !=3D hdr.NumEraseUnit=
s)
||
>>> +                             (hdr2.SerialNumber !=3D hdr.SerialNumber)=
)
>>> +diff --git a/misc-utils/mtd_debug.c b/misc-utils/mtd_debug.c
>>> +index ac37e23..d65ad36 100644
>>> +--- a/misc-utils/mtd_debug.c
>>> ++++ b/misc-utils/mtd_debug.c
>>> +@@ -160,7 +160,7 @@ retry:
>>> +     if (buf !=3D NULL)
>>> +             free(buf);
>>> +     close(outfd);
>>> +-    printf("Copied %zu bytes from address 0x%.8"PRIxoff_t" in flash
to %s\n", len, offset, filename);
>>> ++    printf("Copied %zu bytes from address 0x%.8llx in flash to %s\n",
len, (unsigned long long)offset, filename);
>>> +     return 0;
>>> +
>>> + err2:
>>> +@@ -225,7 +225,7 @@ retry:
>>> +     if (buf !=3D NULL)
>>> +             free(buf);
>>> +     fclose(fp);
>>> +-    printf("Copied %d bytes from %s to address 0x%.8"PRIxoff_t" in
flash\n", len, filename, offset);
>>> ++    printf("Copied %d bytes from %s to address 0x%.8llx in flash\n",
len, filename, (unsigned long long)offset);
>>> +     return 0;
>>> + }
>>> +
>>> +diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
>>> +index f2475d6..6c8c8fb 100644
>>> +--- a/misc-utils/serve_image.c
>>> ++++ b/misc-utils/serve_image.c
>>> +@@ -129,8 +129,8 @@ int main(int argc, char **argv)
>>> +     }
>>> +
>>> +     if (st.st_size % erasesize) {
>>> +-            fprintf(stderr, "Image size %" PRIdoff_t " bytes is not a
multiple of erasesize %d bytes\n",
>>> +-                            st.st_size, erasesize);
>>> ++            fprintf(stderr, "Image size %lld bytes is not a multiple
of erasesize %d bytes\n",
>>> ++                            (long long)st.st_size, erasesize);
>>> +             exit(1);
>>> +     }
>>> +     image =3D mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
>>> +diff --git a/tests/fs-tests/integrity/integck.c
b/tests/fs-tests/integrity/integck.c
>>> +index 84753d6..0a7f142 100644
>>> +--- a/tests/fs-tests/integrity/integck.c
>>> ++++ b/tests/fs-tests/integrity/integck.c
>>> +@@ -897,8 +897,8 @@ static ssize_t file_write_data(struct file_info
*file, int fd, off_t offset,
>>> +     remains =3D size;
>>> +     actual =3D 0;
>>> +     written =3D IO_BUFFER_SIZE;
>>> +-    v("write %zd bytes, offset %"PRIdoff_t", file %s",
>>> +-      size, offset, get_file_name(file));
>>> ++    v("write %zd bytes, offset %lld, file %s",
>>> ++      size, (long long)offset, get_file_name(file));
>>> +     while (remains) {
>>> +             /* Fill up buffer with random data */
>>> +             if (written < IO_BUFFER_SIZE) {
>>> +diff --git a/tests/mtd-tests/nandpagetest.c
b/tests/mtd-tests/nandpagetest.c
>>> +index c6812df..465e548 100644
>>> +--- a/tests/mtd-tests/nandpagetest.c
>>> ++++ b/tests/mtd-tests/nandpagetest.c
>>> +@@ -232,8 +232,8 @@ static int verify_eraseblock(int ebnum)
>>> +                     return err;
>>> +
>>> +             if (lseek(fd, addr, SEEK_SET) !=3D addr) {
>>> +-                    fprintf(stderr, "cannot seek mtd%d to offset
%"PRIdloff_t,
>>> +-                                    mtd.mtd_num, addr);
>>> ++                    fprintf(stderr, "cannot seek mtd%d to offset
%lld",
>>> ++                                    mtd.mtd_num, (long long)addr);
>>> +                     return -1;
>>> +             }
>>> +
>>> +diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
>>> +index 26c2ce5..1cd0649 100644
>>> +--- a/tests/ubi-tests/integ.c
>>> ++++ b/tests/ubi-tests/integ.c
>>> +@@ -243,7 +243,7 @@ static void check_erase_block(struct
erase_block_info *erase_block, int fd)
>>> +                     while (size)
>>> +                             if (read_buffer[--size] !=3D 0xff) {
>>> +                                     fprintf(stderr, "block no. =3D
%d\n" , erase_block->block_number);
>>> +-                                    fprintf(stderr, "offset =3D
%"PRIdoff_t"\n" , gap_start);
>>> ++                                    fprintf(stderr, "offset =3D %lld\=
n"
, (long long)gap_start);
>>> +                                     fprintf(stderr, "size =3D %ld\n" =
,
(long) bytes_read);
>>> +                                     error_exit("verify 0xff failed");
>>> +                             }
>>> +@@ -254,7 +254,7 @@ static void check_erase_block(struct
erase_block_info *erase_block, int fd)
>>> +             errno =3D 0;
>>> +             bytes_read =3D read(fd, read_buffer, w->size);
>>> +             if (bytes_read !=3D w->size) {
>>> +-                    fprintf(stderr, "offset =3D %"PRIdoff_t"\n" ,
w->offset);
>>> ++                    fprintf(stderr, "offset =3D %lld\n" , (long
long)w->offset);
>>> +                     fprintf(stderr, "size =3D %ld\n" , (long) w->size=
);
>>> +                     fprintf(stderr, "bytes_read =3D %ld\n" , (long)
bytes_read);
>>> +                     error_exit("read failed");
>>> +@@ -279,7 +279,7 @@ static void check_erase_block(struct
erase_block_info *erase_block, int fd)
>>> +             while (size)
>>> +                     if (read_buffer[--size] !=3D 0xff) {
>>> +                             fprintf(stderr, "block no. =3D %d\n" ,
erase_block->block_number);
>>> +-                            fprintf(stderr, "offset =3D %"PRIdoff_t"\=
n"
, gap_start);
>>> ++                            fprintf(stderr, "offset =3D %lld\n" , (lo=
ng
long)gap_start);
>>> +                             fprintf(stderr, "size =3D %ld\n" , (long)
bytes_read);
>>> +                             error_exit("verify 0xff failed!");
>>> +                     }
>>> +diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
>>> +index c916f48..f0237ab 100644
>>> +--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
>>> ++++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
>>> +@@ -772,11 +772,11 @@ int write_leb(int lnum, int len, void *buf)
>>> +                     return sys_err_msg("ubi_leb_change_start failed")=
;
>>> +
>>> +     if (lseek(out_fd, pos, SEEK_SET) !=3D pos)
>>> +-            return sys_err_msg("lseek failed seeking %"PRIdoff_t,
pos);
>>> ++            return sys_err_msg("lseek failed seeking %lld", (long
long)pos);
>>> +
>>> +     if (write(out_fd, buf, c->leb_size) !=3D c->leb_size)
>>> +-            return sys_err_msg("write failed writing %d bytes at pos
%"PRIdoff_t,
>>> +-                               c->leb_size, pos);
>>> ++            return sys_err_msg("write failed writing %d bytes at pos
%lld",
>>> ++                               c->leb_size, (long long)pos);
>>> +
>>> +     return 0;
>>> + }
>>> +--
>>> +2.7.4
>>> +
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.a=
m-only-build-ubi-utils.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.a=
m-only-build-ubi-utils.patch
>>> new file mode 100644
>>> index 0000000..08c53d1
>>> --- /dev/null
>>> +++
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.a=
m-only-build-ubi-utils.patch
>>> @@ -0,0 +1,34 @@
>>> +From 139d93bc405272a3261d57be26da842e737fe4d0 Mon Sep 17 00:00:00 2001
>>> +From: Andrea Adami <andrea.adami@gmail.com>
>>> +Date: Sun, 28 Jan 2018 23:10:34 +0100
>>> +Subject: [PATCH 3/4] Makefile.am: only build ubi-utils
>>> +
>>> +We only target the ubi-utils, static, small.
>>> +
>>> +Upstream-Status: Inappropriate [embedded specific]
>>> +
>>> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> +---
>>> + Makefile.am | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/Makefile.am b/Makefile.am
>>> +index 5a6e77c..98715dd 100644
>>> +--- a/Makefile.am
>>> ++++ b/Makefile.am
>>> +@@ -34,9 +34,9 @@ EXTRA_DIST +=3D $(GLOBAL_HEADER) $(GLOBAL_EXTRA)
>>> +
>>> + include lib/Makemodule.am
>>> + include ubi-utils/Makemodule.am
>>> +-include misc-utils/Makemodule.am
>>> +-include nand-utils/Makemodule.am
>>> +-include nor-utils/Makemodule.am
>>> ++#include misc-utils/Makemodule.am
>>> ++#include nand-utils/Makemodule.am
>>> ++#include nor-utils/Makemodule.am
>>> +
>>> + if BUILD_UBIFS
>>> + include ubifs-utils/Makemodule.am
>>> +--
>>> +2.7.4
>>> +
>>> diff --git
a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-=
common.h-no-features.h-for-klibc-builds.patch
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-=
common.h-no-features.h-for-klibc-builds.patch
>>> new file mode 100644
>>> index 0000000..5da05fa
>>> --- /dev/null
>>> +++
b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-=
common.h-no-features.h-for-klibc-builds.patch
>>> @@ -0,0 +1,38 @@
>>> +From ae1cf6d0eb1833e46549328a4473222c259723d7 Mon Sep 17 00:00:00 2001
>>> +From: Andrea Adami <andrea.adami@gmail.com>
>>> +Date: Thu, 1 Feb 2018 00:25:00 +0100
>>> +Subject: [PATCH 4/4] mtd-utils: common.h: no features.h for klibc
builds
>>> +
>>> +Add guard around features.h to fix missing include (here first error):
>>> +
>>> + ../git/include/common.h:29:10:
>>> + fatal error: features.h: No such file or directory
>>> +  #include <features.h>
>>> +           ^~~~~~~~~~~~
>>> + compilation terminated
>>> +
>>> +Upstream-Status: Submitted
>>> +
>>> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> +---
>>> + include/common.h | 3 +++
>>> + 1 file changed, 3 insertions(+)
>>> +
>>> +diff --git a/include/common.h b/include/common.h
>>> +index 642c212..f7c71fe 100644
>>> +--- a/include/common.h
>>> ++++ b/include/common.h
>>> +@@ -26,7 +26,10 @@
>>> + #include <string.h>
>>> + #include <fcntl.h>
>>> + #include <errno.h>
>>> ++#if defined(__KLIBC__)
>>> ++#else
>>> + #include <features.h>
>>> ++#endif
>>> + #include <inttypes.h>
>>> + #include <unistd.h>
>>> + #include <sys/sysmacros.h>
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta-initramfs/recipes-devtools/mtd/
ubi-utils-klibc_1.5.2.bb b/meta-initramfs/recipes-devtools/mtd/
ubi-utils-klibc_2.0.2.bb
>>> similarity index 64%
>>> rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.b=
b
>>> rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
>>> index abb0d4b..85bc372 100644
>>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
>>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
>>> @@ -7,30 +7,30 @@ LICENSE =3D "GPLv2+"
>>>  LIC_FILES_CHKSUM =3D
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>>>
 file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07912a44ea2b=
f81ce409380049c"
>>>
>>> -inherit klibc
>>> +inherit autotools pkgconfig klibc
>>>
>>> -SRCREV =3D "aea36417067dade75192bafa03af70b6eb2677b1"
>>> +SRCREV =3D "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
>>>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
>>> -             file://0001-Makefile-build-ubi-utils-only.patch \
>>> -             file://0002-common.mk-for-klibc-CC-is-klcc.patch \
>>> -
file://0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch \
>>> -
file://0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch \
>>> -
file://0005-common.h-more-workarounds-for-klibc-compatibility.patch \
>>> -
file://0006-libiniparser-remove-unused-function-needing-float.patch \
>>> -
file://0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch \
>>> -
file://0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch \
>>> -
file://0009-Eliminate-warnings-about-implicit-non-const-casting-.patch \
>>> +
file://0001-Add-simple-getline-implementation-to-libmissing.patch \
>>> +
file://0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch \
>>> +             file://0003-Makefile.am-only-build-ubi-utils.patch \
>>> +
file://0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch \
>>>               "
>>>
>>>  S =3D "${WORKDIR}/git/"
>>>
>>> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}'
'CFLAGS=3D${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
>>> +EXTRA_OECONF +=3D "--disable-tests --without-jffs --without-ubifs"
>>> +
>>> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}=
"
>>> +PACKAGECONFIG[xattr] =3D ",,acl,"
>>> +
>>> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}'
'CFLAGS=3D${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '',
'-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=3D${S}'"
>>>
>>>  do_install () {
>>>       oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir}
MANDIR=3D${mandir} INCLUDEDIR=3D${includedir}
>>>  }
>>>
>>> -PACKAGES =3D "ubi-utils-klibc-dbg"
>>> +PACKAGES =3D "ubi-utils-klibc-dbg ubi-utils-klibc-doc"
>>>
>>>  PACKAGES =3D+ "mtdinfo-klibc ubiattach-klibc ubiblock-klibc
ubicrc32-klibc ubidetach-klibc \
>>>               ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc
ubirename-klibc \
>>

