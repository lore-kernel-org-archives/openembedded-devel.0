Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.20207.1600256482105841998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 04:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=COlyf650;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id u21so9910433eja.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2020 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhNwv7IG8vFrzI7BKmvW/Yn0BIEJWN90TZGdPzDcL28=;
        b=COlyf650gSvujEU4QbDlYhr/ImX37zY7AhBPUMvO91n7sIBlnUI9dff1O2l5imuVpA
         PB++trDK+h2lTtdiAzaa7avDiMWJHbdCad84y5xhlRLo2mXYOf+KMtds4d87dLv0gu+8
         Mfb5RsaVbEAW58vAlPIqTxb4VYG41c/HL5uAZu1t/ibQEmvxCMiea7DNdxeeBhW5xsVf
         p1U653drjmzplRPlMfYV67pYXVX+GPJo1D/wZxdNvTtU8+O4pKYevYCVf2X/LgT5dsRC
         FT6QtKynQ50EF8ZcHbxUyVKdZCVPJOGhprecKEGooIfYyThDtJwiVLYpW8Bhga4Bmoer
         cv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhNwv7IG8vFrzI7BKmvW/Yn0BIEJWN90TZGdPzDcL28=;
        b=nK1jgv47hos0TqUzog/6L2Neb5P0bW20IKPbE1rM3u5EX9FuzIkOZkRTFdBVKda11D
         myhCzfStlrsI+a30RLZf8Z5J2QYdGm9rkDL2tmks7hTmBVBTDzzXaZdEg/OeViukz+fd
         +j+634ZAgc7oZA0mx7qL35kEmNrsvcvld5C26HmCWy9KqZxVq7hYI6UPKKKNlLZWBhJd
         ubol4S3pE9qmBmwAgZ6o/9TfzqsZiNSP72V37muhPe20VaX5niem6g6UqCXf9JCCSDfi
         1aOM1JbUarUayV/tZvstXkbmZJy4l+G2ESL5+qlJR1WFpJliizmcinuweE9SqUVAAkcQ
         aXhQ==
X-Gm-Message-State: AOAM5326RxUuu2Vn5EGC8njMhQoqHOqvbwVOYUbmEtNUs/ash+OYumQZ
	L82fyvRHiahLAoT/hUzbYjfxp3ZxHHMB/+DIwNs=
X-Google-Smtp-Source: ABdhPJy9Ub8jgN9IhOWkaDTlz1HsZavhkAktmOynu0nrKZh3YisNjxgzK6c3qsd2F2YcseCTNqdDetUdlRTnJiYQ9Fc=
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr21295688eju.541.1600256480275;
 Wed, 16 Sep 2020 04:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <1599830746-15250-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CA+chaQejzHcC14r5mxRMMmKR5wWnpEBmwzK0Zp=YFhRv+4eTtw@mail.gmail.com> <CAMKF1srH9Zeck79EZZ1SL-kUg2ifsZdrRfSO8NTcx-R7EWcpAg@mail.gmail.com>
In-Reply-To: <CAMKF1srH9Zeck79EZZ1SL-kUg2ifsZdrRfSO8NTcx-R7EWcpAg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 16 Sep 2020 13:41:08 +0200
Message-ID: <CA+chaQd-AqiVXYrcNPz3FGDtj1JHfxFSw_Hv066GJYmpr+urjQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libhugetlbfs: upgrade 2.22 -> 2.23
To: Khem Raj <raj.khem@gmail.com>
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000e712c05af6cbf5a"

--0000000000000e712c05af6cbf5a
Content-Type: text/plain; charset="UTF-8"

I don't see anything suspicious in the build (the same cmdline as in 2.22
version), but it uses

libhugetlbfs/1_2.22-r0-old/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
 -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
-Werror=format-security -Werror=return-type
--sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.22-r0/recipe-sysroot
-I.. -O2 -Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
libhugetlbfs/1_2.22-r0-old/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
 -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
-Werror=format-security -Werror=return-type
--sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.22-r0/recipe-sysroot
-B./obj32 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl
-lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o
obj32/testutils.o
libhugetlbfs/1_2.23-r0-new/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
 -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
-Werror=format-security -Werror=return-type
--sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.23-r0/recipe-sysroot
-I.. -O2 -Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
libhugetlbfs/1_2.23-r0-new/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
 -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
-Werror=format-security -Werror=return-type
--sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.23-r0/recipe-sysroot
-B./obj32 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
-ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl
-lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o
obj32/testutils.o

And the git log between 2.22 and 2.23 is also very short and looks
reasonable.
https://github.com/libhugetlbfs/libhugetlbfs/compare/2.22...2.23

When checking with readelf -l it also shows the error about PHDR segment:
arm-oe-linux-gnueabi-readelf -l
./1_2.22-r0-old/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw

Elf file type is DYN (Shared object file)
Entry point 0x201105
There are 10 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  PHDR           0x000034 0x00200034 0x00200034 0x00140 0x00140 R   0x4
  INTERP         0x000174 0x00200174 0x00200174 0x0001d 0x0001d R   0x1
      [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
  LOAD           0x000000 0x00200000 0x00200000 0x1222c 0x1222c R E 0x200000
  LOAD           0x1ffdf0 0x005ffdf0 0x005ffdf0 0x102e0 0x202ec RW  0x200000
  DYNAMIC        0x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x00128 RW  0x4
  NOTE           0x000194 0x00200194 0x00200194 0x00044 0x00044 R   0x4
  GNU_EH_FRAME   0x012224 0x00212224 0x00212224 0x00008 0x00008 R   0x4
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
  EXIDX          0x001c5c 0x00201c5c 0x00201c5c 0x00008 0x00008 R   0x4
  GNU_RELRO      0x1ffdf0 0x005ffdf0 0x005ffdf0 0x00210 0x00210 RW  0x4

 Section to Segment mapping:
  Segment Sections...
   00
   01     .interp
   02     .interp .note.ABI-tag .note.gnu.build-id .dynsym .dynstr
.gnu.hash .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt .text
.fini .ARM.extab .ARM.exidx .rodata .eh_frame .eh_frame_hdr
   03     .fini_array .init_array .dynamic .got .data .bss
   04     .dynamic
   05     .note.ABI-tag .note.gnu.build-id
   06     .eh_frame_hdr
   07
   08     .ARM.extab .ARM.exidx
   09     .fini_array .init_array .dynamic .got

arm-oe-linux-gnueabi-readelf -l
./1_2.23-r0-new/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw

Elf file type is DYN (Shared object file)
Entry point 0x31cd1
There are 10 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  PHDR           0x000000 0x00000000 0x00000000 0x00000 0x00000 R   0
readelf: Error: the PHDR segment is not covered by a LOAD segment
  INTERP         0x030d40 0x00030d40 0x00030d40 0x0001d 0x0001d R   0x1
      [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
  LOAD           0x030d40 0x00030d40 0x00030d40 0x120b8 0x120b8 R E 0x200000
  LOAD           0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW  0x200000
  DYNAMIC        0x1ffdf8 0x003ffdf8 0x003ffdf8 0x00128 0x00128 RW  0x4
  NOTE           0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R   0x4
  GNU_EH_FRAME   0x042df0 0x00042df0 0x00042df0 0x00008 0x00008 R   0x4
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
  EXIDX          0x032828 0x00032828 0x00032828 0x00008 0x00008 R   0x4
  GNU_RELRO      0x1ffdf0 0x003ffdf0 0x003ffdf0 0x00210 0x00210 RW  0x4

 Section to Segment mapping:
  Segment Sections...
   00
   01     .interp
   02     .interp .note.ABI-tag .note.gnu.build-id .dynsym .dynstr
.gnu.hash .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt .text
.fini .ARM.extab .ARM.exidx .rodata .eh_frame .eh_frame_hdr
   03     .fini_array .init_array .dynamic .got .data .bss
   04     .dynamic
   05     .note.ABI-tag .note.gnu.build-id
   06     .eh_frame_hdr
   07
   08     .ARM.extab .ARM.exidx
   09     .fini_array .init_array .dynamic .got

And the diff between these 2:

---
1_2.22-r0-old/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw.readelf
 2020-09-16 04:32:11.885444764 -0700
+++
1_2.23-r0-new/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw.readelf
 2020-09-16 04:31:56.621234211 -0700
@@ -1,21 +1,22 @@

 Elf file type is DYN (Shared object file)
-Entry point 0x201105
+Entry point 0x31cd1
 There are 10 program headers, starting at offset 52

 Program Headers:
   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
-  PHDR           0x000034 0x00200034 0x00200034 0x00140 0x00140 R   0x4
-  INTERP         0x000174 0x00200174 0x00200174 0x0001d 0x0001d R   0x1
+  PHDR           0x000000 0x00000000 0x00000000 0x00000 0x00000 R   0
+readelf: Error: the PHDR segment is not covered by a LOAD segment
+  INTERP         0x030d40 0x00030d40 0x00030d40 0x0001d 0x0001d R   0x1
       [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
-  LOAD           0x000000 0x00200000 0x00200000 0x1222c 0x1222c R E
0x200000
-  LOAD           0x1ffdf0 0x005ffdf0 0x005ffdf0 0x102e0 0x202ec RW
 0x200000
-  DYNAMIC        0x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x00128 RW  0x4
-  NOTE           0x000194 0x00200194 0x00200194 0x00044 0x00044 R   0x4
-  GNU_EH_FRAME   0x012224 0x00212224 0x00212224 0x00008 0x00008 R   0x4
+  LOAD           0x030d40 0x00030d40 0x00030d40 0x120b8 0x120b8 R E
0x200000
+  LOAD           0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW
 0x200000
+  DYNAMIC        0x1ffdf8 0x003ffdf8 0x003ffdf8 0x00128 0x00128 RW  0x4
+  NOTE           0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R   0x4
+  GNU_EH_FRAME   0x042df0 0x00042df0 0x00042df0 0x00008 0x00008 R   0x4
   GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
-  EXIDX          0x001c5c 0x00201c5c 0x00201c5c 0x00008 0x00008 R   0x4
-  GNU_RELRO      0x1ffdf0 0x005ffdf0 0x005ffdf0 0x00210 0x00210 RW  0x4
+  EXIDX          0x032828 0x00032828 0x00032828 0x00008 0x00008 R   0x4
+  GNU_RELRO      0x1ffdf0 0x003ffdf0 0x003ffdf0 0x00210 0x00210 RW  0x4

  Section to Segment mapping:
   Segment Sections...

Reverting
https://github.com/libhugetlbfs/libhugetlbfs/commit/852dcc963ce44861ed7c4e225aa92ff2b5b43579
fixes this build issue, but I still don't see why it fails this way.

I'll send revert to unblock my builds, but hopefully zangrc would be able
to debug it a bit more or discuss this with upstream (I don't use
libhugetlbfs at all, it just shown up in world builds..)

Cheers,


On Tue, Sep 15, 2020 at 8:31 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Sep 15, 2020 at 9:44 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > This is somehow causing strip to fail when building for arm (I'm seeing
> it e.g. in raspberrypi4 builds):
> >
> > ERROR: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occurred
> in subprocesses:
> > Command '['arm-oe-linux-gnueabi-strip', '--remove-section=.comment',
> '--remove-section=.note',
> 'libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw']'
> returned non-zero exit status 1.
> > Subprocess output:arm-oe-linux-gnueabi-strip:
> libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58:
> error: PHDR segment not covered by LOAD segment
> > arm-oe-linux-gnueabi-strip:
> libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]:
> file format not recognized
> >
>
> I wonder if this file has specific linker script used to do linking ?
>
> > It might be reproducible only with ld-is-gold in DISTRO_FEATURES.
> >
> > Can you please look into that?
> >
> >
> > On Fri, Sep 11, 2020 at 3:25 AM zangrc <zangrc.fnst@cn.fujitsu.com>
> wrote:
> >>
> >> 0001-tests-add-explicit-permissions-to-open-call.patch
> >> Removed since this is included in 2.23
> >>
> >> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> >> ---
> >>  ...dd-explicit-permissions-to-open-call.patch | 41 -------------------
> >>  .../libhugetlbfs/libhugetlbfs_git.bb          |  5 +--
> >>  2 files changed, 2 insertions(+), 44 deletions(-)
> >>  delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> >>
> >> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> >> deleted file mode 100644
> >> index 9d52b908e..000000000
> >> ---
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> >> +++ /dev/null
> >> @@ -1,41 +0,0 @@
> >> -From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Wed, 15 Jan 2020 18:45:09 -0800
> >> -Subject: [PATCH] tests: add explicit permissions to open() call
> >> -
> >> -Fixes
> >> -gethugepagesizes.c:227:35: error: open with O_CREAT in second argument
> needs 3 arguments
> >> -|         fd = open(fname, O_WRONLY|O_CREAT);
> >> -|                                          ^
> >> -
> >> -Upstream-Status: Submitted [
> https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro]
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - tests/gethugepagesizes.c | 4 ++--
> >> - 1 file changed, 2 insertions(+), 2 deletions(-)
> >> -
> >> -diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
> >> -index 9551b38..5777265 100644
> >> ---- a/tests/gethugepagesizes.c
> >> -+++ b/tests/gethugepagesizes.c
> >> -@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)
> >> -               FAIL("mkdtemp: %s", strerror(errno));
> >> -
> >> -       sprintf(fname, "%s/meminfo-none", fake_meminfo);
> >> --      fd = open(fname, O_WRONLY|O_CREAT);
> >> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
> >> -       if (fd < 0)
> >> -               FAIL("open: %s", strerror(errno));
> >> -       if (write(fd, meminfo_base,
> >> -@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)
> >> -               FAIL("close: %s", strerror(errno));
> >> -
> >> -       sprintf(fname, "%s/meminfo-hugepages", fake_meminfo);
> >> --      fd = open(fname, O_WRONLY|O_CREAT);
> >> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
> >> -       if (fd < 0)
> >> -               FAIL("open: %s", strerror(errno));
> >> -       if (write(fd, meminfo_base,
> >> ---
> >> -2.25.0
> >> -
> >> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> >> index 4768d7b63..b349096ec 100644
> >> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> >> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> >> @@ -7,10 +7,10 @@ DEPENDS = "sysfsutils"
> >>  RDEPENDS_${PN} += "bash python3-core"
> >>  RDEPENDS_${PN}-tests += "bash python3-core"
> >>
> >> -PV = "2.22"
> >> +PV = "2.23"
> >>  PE = "1"
> >>
> >> -SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
> >> +SRCREV = "6b126a4d7da9490fa40fe7e1b962edcb939feddc"
> >>  SRC_URI = " \
> >>      git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
> >>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> >> @@ -24,7 +24,6 @@ SRC_URI = " \
> >>      file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
> >>      file://0005-Include-dirent.h-for-ino_t.patch \
> >>      file://0006-include-limits.h-for-PATH_MAX.patch \
> >> -    file://0001-tests-add-explicit-permissions-to-open-call.patch \
> >>      file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
> >>  "
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> > 
>

--0000000000000e712c05af6cbf5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t see anything suspicious in the build (the=
 same cmdline as in 2.22 version), but it uses=C2=A0</div><div><br></div><d=
iv>libhugetlbfs/1_2.22-r0-old/temp/log.do_compile:arm-oe-linux-gnueabi-gcc =
=
=C2=A0-mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -fstack-prot=
ector-strong =C2=A0-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=
=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/jenkins/mjansa/build=
/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.22-r0/recipe-sysroot -I.. -O2 -=
Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c<br>libhugetlbfs/1_2.22-r0-o=
ld/temp/log.do_compile:arm-oe-linux-gnueabi-gcc =C2=A0-mthumb -mfpu=3Dneon-=
vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -Wl,-O1 -Wl,--hash-style=3Dgnu -=
Wl,--as-needed -Wl,-z,relro,-z,now -fstack-protector-strong =C2=A0-D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=
=3Dreturn-type --sysroot=3D/jenkins/mjansa/build/ros/oe-melodic-gatesgarth=
/libhugetlbfs/1_2.22-r0/recipe-sysroot -B./obj32 -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -ldl -L../obj32 -o obj32/linkhu=
ge_rw -Wl,--no-as-needed -lpthread -ldl -lhugetlbfs_privutils -Wl,--hugetlb=
fs-align obj32/linkhuge_rw.o obj32/testutils.o<br>libhugetlbfs/1_2.23-r0-ne=
w/temp/log.do_compile:arm-oe-linux-gnueabi-gcc =C2=A0-mthumb -mfpu=3Dneon-v=
fpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed -Wl,-z,relro,-z,now -fstack-protector-strong =C2=A0-D_FORTIFY=
_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3D=
return-type --sysroot=3D/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/lib=
hugetlbfs/1_2.23-r0/recipe-sysroot -I.. -O2 -Wall -g -o obj32/linkhuge_rw.o=
 -c linkhuge_rw.c<br>libhugetlbfs/1_2.23-r0-new/temp/log.do_compile:arm-oe-=
linux-gnueabi-gcc =C2=A0-mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=
=
=3Dcortex-a7 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-=
z,now -fstack-protector-strong =C2=A0-D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/jen=
kins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.23-r0/recipe-s=
ysroot -B./obj32 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relr=
o,-z,now -ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread =
-ldl -lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o obj32/=
testutils.o<br></div><div><br></div><div>And the git log between 2.22 and 2=
.23 is also very short and looks reasonable.</div><div><a href=3D"https://g=
ithub.com/libhugetlbfs/libhugetlbfs/compare/2.22...2.23">https://github.com=
/libhugetlbfs/libhugetlbfs/compare/2.22...2.23</a><br></div><div><br></div>=
<div>When checking with readelf -l it also shows the error about PHDR segme=
nt:</div><div>arm-oe-linux-gnueabi-readelf -l ./1_2.22-r0-old/sysroot-destd=
ir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw<br><br>Elf file type is DYN=
 (Shared object file)<br>Entry point 0x201105<br>There are 10 program heade=
rs, starting at offset 52<br><br>Program Headers:<br>=C2=A0 Type =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 Offset =C2=A0 VirtAddr =C2=A0 PhysAddr =C2=A0 Fil=
eSiz MemSiz =C2=A0Flg Align<br>=C2=A0 PHDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x000034 0x00200034 0x00200034 0x00140 0x00140 R =C2=A0 0x4<br>=C2=A0 =
INTERP =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000174 0x00200174 0x00200174 0x0001d 0=
x0001d R =C2=A0 0x1<br>=C2=A0 =C2=A0 =C2=A0 [Requesting program interpreter=
: /usr/lib/ld-linux-armhf.so.3]<br>=C2=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 0x000000 0x00200000 0x00200000 0x1222c 0x1222c R E 0x200000<br>=C2=
=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ffdf0 0x005ffdf0 0x005ffdf0=
 0x102e0 0x202ec RW =C2=A00x200000<br>=C2=A0 DYNAMIC =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x00128 RW =C2=A00x4<br>=C2=
=A0 NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000194 0x00200194 0x00200194=
 0x00044 0x00044 R =C2=A0 0x4<br>=C2=A0 GNU_EH_FRAME =C2=A0 0x012224 0x0021=
2224 0x00212224 0x00008 0x00008 R =C2=A0 0x4<br>=C2=A0 GNU_STACK =C2=A0 =C2=
=
=A0 =C2=A00x000000 0x00000000 0x00000000 0x00000 0x00000 RW =C2=A00x10<br>=
=
=C2=A0 EXIDX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x001c5c 0x00201c5c 0x00201=
c5c 0x00008 0x00008 R =C2=A0 0x4<br>=C2=A0 GNU_RELRO =C2=A0 =C2=A0 =C2=A00x=
1ffdf0 0x005ffdf0 0x005ffdf0 0x00210 0x00210 RW =C2=A00x4<br><br>=C2=A0Sect=
ion to Segment mapping:<br>=C2=A0 Segment Sections...<br>=C2=A0 =C2=A000<br=
>=C2=A0 =C2=A001 =C2=A0 =C2=A0 .interp<br>=C2=A0 =C2=A002 =C2=A0 =C2=A0 .in=
terp .note.ABI-tag .note.gnu.build-id .dynsym .dynstr .gnu.hash .gnu.versio=
n .gnu.version_r .rel.dyn .rel.plt .init .plt .text .fini .ARM.extab .ARM.e=
xidx .rodata .eh_frame .eh_frame_hdr<br>=C2=A0 =C2=A003 =C2=A0 =C2=A0 .fini=
_array .init_array .dynamic .got .data .bss<br>=C2=A0 =C2=A004 =C2=A0 =C2=
=A0 .dynamic<br>=C2=A0 =C2=A005 =C2=A0 =C2=A0 .note.ABI-tag .note.gnu.buil=
d-id<br>=C2=A0 =C2=A006 =C2=A0 =C2=A0 .eh_frame_hdr<br>=C2=A0 =C2=A007<br>=
=C2=A0 =C2=A008 =C2=A0 =C2=A0 .ARM.extab .ARM.exidx<br>=C2=A0 =C2=A009 =C2=
=
=A0 =C2=A0 .fini_array .init_array .dynamic .got<br></div><div><br></div><=
div>arm-oe-linux-gnueabi-readelf -l ./1_2.23-r0-new/sysroot-destdir/usr/lib=
/libhugetlbfs/tests/obj32/linkhuge_rw<br><br>Elf file type is DYN (Shared o=
bject file)<br>Entry point 0x31cd1<br>There are 10 program headers, startin=
g at offset 52<br><br>Program Headers:<br>=C2=A0 Type =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 Offset =C2=A0 VirtAddr =C2=A0 PhysAddr =C2=A0 FileSiz MemSiz=
 =C2=A0Flg Align<br>=C2=A0 PHDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000=
 0x00000000 0x00000000 0x00000 0x00000 R =C2=A0 0<br>readelf: Error: the PH=
DR segment is not covered by a LOAD segment<br>=C2=A0 INTERP =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 0x030d40 0x00030d40 0x00030d40 0x0001d 0x0001d R =C2=A0 0x1<=
br>=C2=A0 =C2=A0 =C2=A0 [Requesting program interpreter: /usr/lib/ld-linux-=
armhf.so.3]<br>=C2=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x030d40 0x00=
030d40 0x00030d40 0x120b8 0x120b8 R E 0x200000<br>=C2=A0 LOAD =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW =C2=
=
=A00x200000<br>=C2=A0 DYNAMIC =C2=A0 =C2=A0 =C2=A0 =C2=A00x1ffdf8 0x003ffd=
f8 0x003ffdf8 0x00128 0x00128 RW =C2=A00x4<br>=C2=A0 NOTE =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R =C2=A0 =
0x4<br>=C2=A0 GNU_EH_FRAME =C2=A0 0x042df0 0x00042df0 0x00042df0 0x00008 0x=
00008 R =C2=A0 0x4<br>=C2=A0 GNU_STACK =C2=A0 =C2=A0 =C2=A00x000000 0x00000=
000 0x00000000 0x00000 0x00000 RW =C2=A00x10<br>=C2=A0 EXIDX =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A00x032828 0x00032828 0x00032828 0x00008 0x00008 R =C2=
=A0 0x4<br>=C2=A0 GNU_RELRO =C2=A0 =C2=A0 =C2=A00x1ffdf0 0x003ffdf0 0x003f=
fdf0 0x00210 0x00210 RW =C2=A00x4<br><br>=C2=A0Section to Segment mapping:<=
br>=C2=A0 Segment Sections...<br>=C2=A0 =C2=A000<br>=C2=A0 =C2=A001 =C2=A0 =
=
=C2=A0 .interp<br>=C2=A0 =C2=A002 =C2=A0 =C2=A0 .interp .note.ABI-tag .not=
e.gnu.build-id .dynsym .dynstr .gnu.hash .gnu.version .gnu.version_r .rel.d=
yn .rel.plt .init .plt .text .fini .ARM.extab .ARM.exidx .rodata .eh_frame =
.eh_frame_hdr<br>=C2=A0 =C2=A003 =C2=A0 =C2=A0 .fini_array .init_array .dyn=
amic .got .data .bss<br>=C2=A0 =C2=A004 =C2=A0 =C2=A0 .dynamic<br>=C2=A0 =
=C2=A005 =C2=A0 =C2=A0 .note.ABI-tag .note.gnu.build-id<br>=C2=A0 =C2=A006=
 =C2=A0 =C2=A0 .eh_frame_hdr<br>=C2=A0 =C2=A007<br>=C2=A0 =C2=A008 =C2=A0 =
=C2=A0 .ARM.extab .ARM.exidx<br>=C2=A0 =C2=A009 =C2=A0 =C2=A0 .fini_array =
.init_array .dynamic .got<br></div><div><br></div><div>And the diff between=
 these 2:</div><div><br></div><div>--- 1_2.22-r0-old/sysroot-destdir/usr/li=
b/libhugetlbfs/tests/obj32/linkhuge_rw.readelf =C2=A02020-09-16 04:32:11.88=
5444764 -0700<br>+++ 1_2.23-r0-new/sysroot-destdir/usr/lib/libhugetlbfs/tes=
ts/obj32/linkhuge_rw.readelf =C2=A02020-09-16 04:31:56.621234211 -0700<br>@=
@ -1,21 +1,22 @@<br>=C2=A0<br>=C2=A0Elf file type is DYN (Shared object fil=
e)<br>-Entry point 0x201105<br>+Entry point 0x31cd1<br>=C2=A0There are 10 p=
rogram headers, starting at offset 52<br>=C2=A0<br>=C2=A0Program Headers:<b=
r>=C2=A0 =C2=A0Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Offset =C2=A0 VirtAd=
dr =C2=A0 PhysAddr =C2=A0 FileSiz MemSiz =C2=A0Flg Align<br>- =C2=A0PHDR =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000034 0x00200034 0x00200034 0x00140 =
0x00140 R =C2=A0 0x4<br>- =C2=A0INTERP =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000174=
 0x00200174 0x00200174 0x0001d 0x0001d R =C2=A0 0x1<br>+ =C2=A0PHDR =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000 0x00000000 0x00000000 0x00000 0x00000=
 R =C2=A0 0<br>+readelf: Error: the PHDR segment is not covered by a LOAD s=
egment<br>+ =C2=A0INTERP =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x030d40 0x00030d40 0x=
00030d40 0x0001d 0x0001d R =C2=A0 0x1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0[Reques=
ting program interpreter: /usr/lib/ld-linux-armhf.so.3]<br>- =C2=A0LOAD =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000 0x00200000 0x00200000 0x1222c 0x1=
222c R E 0x200000<br>- =C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ffd=
f0 0x005ffdf0 0x005ffdf0 0x102e0 0x202ec RW =C2=A00x200000<br>- =C2=A0DYNAM=
IC =C2=A0 =C2=A0 =C2=A0 =C2=A00x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x0012=
8 RW =C2=A00x4<br>- =C2=A0NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000194 =
0x00200194 0x00200194 0x00044 0x00044 R =C2=A0 0x4<br>- =C2=A0GNU_EH_FRAME =
=
=C2=A0 0x012224 0x00212224 0x00212224 0x00008 0x00008 R =C2=A0 0x4<br>+ =
=C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x030d40 0x00030d40 0x00030d=
40 0x120b8 0x120b8 R E 0x200000<br>+ =C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW =C2=A00x200000<br=
>+ =C2=A0DYNAMIC =C2=A0 =C2=A0 =C2=A0 =C2=A00x1ffdf8 0x003ffdf8 0x003ffdf8 =
0x00128 0x00128 RW =C2=A00x4<br>+ =C2=A0NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R =C2=A0 0x4<br>+ =
=C2=A0GNU_EH_FRAME =C2=A0 0x042df0 0x00042df0 0x00042df0 0x00008 0x00008 R=
 =C2=A0 0x4<br>=C2=A0 =C2=A0GNU_STACK =C2=A0 =C2=A0 =C2=A00x000000 0x000000=
00 0x00000000 0x00000 0x00000 RW =C2=A00x10<br>- =C2=A0EXIDX =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A00x001c5c 0x00201c5c 0x00201c5c 0x00008 0x00008 R =C2=
=A0 0x4<br>- =C2=A0GNU_RELRO =C2=A0 =C2=A0 =C2=A00x1ffdf0 0x005ffdf0 0x005=
ffdf0 0x00210 0x00210 RW =C2=A00x4<br>+ =C2=A0EXIDX =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x032828 0x00032828 0x00032828 0x00008 0x00008 R =C2=A0 0x4<b=
r>+ =C2=A0GNU_RELRO =C2=A0 =C2=A0 =C2=A00x1ffdf0 0x003ffdf0 0x003ffdf0 0x00=
210 0x00210 RW =C2=A00x4<br>=C2=A0<br>=C2=A0 Section to Segment mapping:<br=
>=C2=A0 =C2=A0Segment Sections...<br></div><div><br></div><div>Reverting=C2=
=
=A0<a href=3D"https://github.com/libhugetlbfs/libhugetlbfs/commit/852dcc96=
3ce44861ed7c4e225aa92ff2b5b43579">https://github.com/libhugetlbfs/libhugetl=
bfs/commit/852dcc963ce44861ed7c4e225aa92ff2b5b43579</a> fixes this build is=
sue, but I still don&#39;t see why it fails this way.</div><div><br></div><=
div>I&#39;ll send revert to unblock my builds, but hopefully zangrc would b=
e able to debug it a bit more or discuss this with upstream (I don&#39;t us=
e libhugetlbfs at all, it just shown up in world builds..)</div><div><br></=
div><div>Cheers,</div><div><br></div><div><br></div><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2020 at 8:31 PM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 Sep 15, 2020 at 9:44 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is somehow causing strip to fail when building for arm (I&#39;m =
seeing it e.g. in raspberrypi4 builds):<br>
&gt;<br>
&gt; ERROR: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occur=
red in subprocesses:<br>
&gt; Command &#39;[&#39;arm-oe-linux-gnueabi-strip&#39;, &#39;--remove-sec=
tion=3D.comment&#39;, &#39;--remove-section=3D.note&#39;, &#39;libhugetlbfs=
/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw&#39=
;]&#39; returned non-zero exit status 1.<br>
&gt; Subprocess output:arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/=
sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58: error: PHDR segm=
ent not covered by LOAD segment<br>
&gt; arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/us=
r/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]: file format not recognize=
d<br>
&gt;<br>
<br>
I wonder if this file has specific linker script used to do linking ?<br>
<br>
&gt; It might be reproducible only with ld-is-gold in DISTRO_FEATURES.<br>
&gt;<br>
&gt; Can you please look into that?<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 11, 2020 at 3:25 AM zangrc &lt;<a href=3D"mailto:zangrc.f=
nst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; 0001-tests-add-explicit-permissions-to-open-call.patch<br>
&gt;&gt; Removed since this is included in 2.23<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.=
fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...dd-explicit-permissions-to-open-call.patch | 41 --------=
-----------<br>
&gt;&gt;=C2=A0 .../libhugetlbfs/<a href=3D"http://libhugetlbfs_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 +--<br>
&gt;&gt;=C2=A0 2 files changed, 2 insertions(+), 44 deletions(-)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/f=
iles/0001-tests-add-explicit-permissions-to-open-call.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-te=
sts-add-explicit-permissions-to-open-call.patch b/meta-oe/recipes-benchmark=
/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch<=
br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 9d52b908e..000000000<br>
&gt;&gt; --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add=
-explicit-permissions-to-open-call.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,41 +0,0 @@<br>
&gt;&gt; -From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:0=
0 2001<br>
&gt;&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; -Date: Wed, 15 Jan 2020 18:45:09 -0800<br>
&gt;&gt; -Subject: [PATCH] tests: add explicit permissions to open() call<=
br>
&gt;&gt; -<br>
&gt;&gt; -Fixes<br>
&gt;&gt; -gethugepagesizes.c:227:35: error: open with O_CREAT in second ar=
gument needs 3 arguments<br>
&gt;&gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D open(fname, O_WRONLY|O=
_CREAT);<br>
&gt;&gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Submitted [<a href=3D"https://groups.google.com=
/forum/#!topic/libhugetlbfs/anNtDXbQKro" rel=3D"noreferrer" target=3D"_blan=
k">https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro</a>]<br=
>
&gt;&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ----<br>
&gt;&gt; - tests/gethugepagesizes.c | 4 ++--<br>
&gt;&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; -<br>
&gt;&gt; -diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c=
<br>
&gt;&gt; -index 9551b38..5777265 100644<br>
&gt;&gt; ---- a/tests/gethugepagesizes.c<br>
&gt;&gt; -+++ b/tests/gethugepagesizes.c<br>
&gt;&gt; -@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_ele=
m)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quo=
t;mkdtemp: %s&quot;, strerror(errno));<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fname, &quot;%s/meminfo-none&=
quot;, fake_meminfo);<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT);<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT, 0600)=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quo=
t;open: %s&quot;, strerror(errno));<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write(fd, meminfo_base,<br>
&gt;&gt; -@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_ele=
m)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quo=
t;close: %s&quot;, strerror(errno));<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fname, &quot;%s/meminfo-hugep=
ages&quot;, fake_meminfo);<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT);<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT, 0600)=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quo=
t;open: %s&quot;, strerror(errno));<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write(fd, meminfo_base,<br>
&gt;&gt; ---<br>
&gt;&gt; -2.25.0<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"ht=
tp://libhugetlbfs_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs=
_git.bb</a> b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libh=
ugetlbfs_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</=
a><br>
&gt;&gt; index 4768d7b63..b349096ec 100644<br>
&gt;&gt; --- a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://li=
bhugetlbfs_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb=
</a><br>
&gt;&gt; +++ b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://li=
bhugetlbfs_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb=
</a><br>
&gt;&gt; @@ -7,10 +7,10 @@ DEPENDS =3D &quot;sysfsutils&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;bash python3-core&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS_${PN}-tests +=3D &quot;bash python3-core&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;2.22&quot;<br>
&gt;&gt; +PV =3D &quot;2.23&quot;<br>
&gt;&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV =3D &quot;e6499ff92b4a7dcffbd131d1f5d24933e48c3f20&quot;<=
br>
&gt;&gt; +SRCREV =3D &quot;6b126a4d7da9490fa40fe7e1b962edcb939feddc&quot;<=
br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/libhugetlb=
fs/libhugetlbfs.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">=
github.com/libhugetlbfs/libhugetlbfs.git;protocol=3Dhttps</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://skip-checking-LIB32-and-LIB64-if-they-=
point-to-the-s.patch \<br>
&gt;&gt; @@ -24,7 +24,6 @@ SRC_URI =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://0004-shm.c-Mark-glibc-specific-changes=
-so.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://0005-Include-dirent.h-for-ino_t.patch =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://0006-include-limits.h-for-PATH_MAX.pat=
ch \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://0001-tests-add-explicit-permissions-to-open=
-call.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-huge_page_setup_helper-use-python=
3-interpreter.patch \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
</blockquote></div></div>

--0000000000000e712c05af6cbf5a--
