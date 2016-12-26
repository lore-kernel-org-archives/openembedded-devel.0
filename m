Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B375571E01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 07:27:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so51972956wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FPWeZePokzPKWKGolCcnqr0Q5w+UYWvD7Lek1WoOXEg=;
	b=g7rY80OYKpcvgvn+tnr3w7GZQdomwY0vkvijcVNOAqsV8jJWWl8tiPmyiEKyCbxp7Q
	vDK6nkWKrf/r0wmqdCOpsy1WgcDpYoJD0PsoDp4wATZTE/ZEdeRjXjwPYtIOD5VzR/G4
	r4Dhh0oWj+eQFVtJSrx3UqlG91Bo9aB5iKDjpWZfLwz10iajuGWDkoneF215nVgqGrTK
	K+Y68KDl/8N8W4UhGJ/DOknjiQ9Agq223C3Mcg4Z1JvOMcmBL/kyq90kR4nxacAYfSWf
	PGtXKjWUdIOJcPvVXTQHDKsKJqhMKGakjau8nvBl9nffPlEk7vbn1mIV/ywtzsih+m7V
	s5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FPWeZePokzPKWKGolCcnqr0Q5w+UYWvD7Lek1WoOXEg=;
	b=MxfrKaYQe97T07Nam9UEqzlpKoFihHLNolKVmhE+LjMHdQODM4DrWAPkQeCq3SGeO/
	duhcce7LkGH7k6PGlZXHOtWu4cYFJUMxaN2xkThAfTI3qNX0xolHKd8fQQGQZyFRPdFR
	u6NAvmJMCbY8DLHih/fH3+rxUkGLf1i/UmyFZaINysngSG8KHqmbjRu1geq3dvIQitqM
	PZW864kmlGkouRBHHjjXnqgvcuaw4fcw6xDfaDf0m1cgIMwwtTRZApZlmIm9c9Tj1gfc
	nrb84qOt4IZmNW30ofc0U06JjNPxuErVuH7s+JnJGk9XH7+t+jxqIUp8A+059KtuQB4s
	YpsA==
X-Gm-Message-State: AIkVDXKnsKZkelvpgDTL80dzo6CultcdfJjku2QD9AY6ymgpCtRWr3u1R169Wa9T3HG4VU2tdGKN6NlsiBP0+g==
X-Received: by 10.28.199.143 with SMTP id x137mr5132418wmf.0.1482737272182;
	Sun, 25 Dec 2016 23:27:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 25 Dec 2016 23:27:51 -0800 (PST)
In-Reply-To: <cf62d5db-2bae-8cec-8a87-9fcf53d26a0c@windriver.com>
References: <20161217230622.26063-1-raj.khem@gmail.com>
	<cf62d5db-2bae-8cec-8a87-9fcf53d26a0c@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Dec 2016 08:27:51 +0100
Message-ID: <CA+chaQc4ECbi11pppRUS0tCCmrLDCjia2tsno8=yG8pRA7yavA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-filesystems][PATCH V2] xfsprogs: Fix parallel install and Make dependencies
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
X-List-Received-Date: Mon, 26 Dec 2016 07:27:52 -0000
Content-Type: text/plain; charset=UTF-8

Same here in bitbake world builds.

On Mon, Dec 26, 2016 at 4:47 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi,
>
> I still get errors after applied this patch, we can see that there is no
> -luuid
> on command line:
>
> ../i586-wrs-linux-libtool --quiet --tag=CC --mode=link i586-wrs-linux-gcc
> -m32 -march=i586 --sysroot=/buildarea/lyang1/bu
> ild_rebase/test_qemux86/tmp/sysroots/qemux86 -o xfs_io -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu
> -Wl,--as-needed  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -static-libtool-libs  init.o attr.o
> bmap.o file.o freeze.o fsync.o getrusage.o imap.o link.o mmap.o open.o
> parent.o pread.o prealloc.o pwrite.o seek.o shutdown.o sync.o truncate.o
> reflink.o fadvise.o madvise.o mincore.o sendfile.o fiemap.o inject.o
> resblks.o copy_file_range.o sync_file_range.o readdir.o   ../libxcmd/
> libxcmd.la ../libhandle/libhandle.la -lreadline
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_alloc.o):
> In function `platform_uuid_compare':
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89:
> undefined reference to `uuid_compare'
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89:
> undefined reference to `uuid_compare'
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_bmap_btree.o):
> In function `platform_uuid_compare':
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89:
> undefined reference to `uuid_compare'
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_btree.o):
> In function `platform_uuid_compare':
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89:
> undefined reference to `uuid_compare'
> /buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-
> wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89:
> undefined reference to `uuid_compare'
>
> // Robert
>
>
> On 12/18/2016 07:06 AM, Khem Raj wrote:
>
>> This should fix build issues due to missing dependencies
>> e.g. libuuid in Makefiles.
>>
>> correct libhandle paths
>>
>> Dont do parallel install its broken
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> Changes from
>> v1 -> v2
>> - Drop locking toolchain to gcc it compiles fine with clang too
>>
>>  .../xfsprogs/files/link_needed_libs.patch          | 76
>> +++++++++++++++++++++-
>>  .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  6 +-
>>  2 files changed, 79 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
>> b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
>> index 18b95c1c3..a3c699ce6 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_
>> libs.patch
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_
>> libs.patch
>> @@ -1,3 +1,9 @@
>> +use libtool to package install.  do not use the manual file install as
>> +that'll copy files directly from the .libs/ subdir which might have
>> rpaths
>> +pointing to build area.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>>  Index: xfsprogs-4.8.0/libxcmd/Makefile
>>  ===================================================================
>>  --- xfsprogs-4.8.0.orig/libxcmd/Makefile
>> @@ -37,11 +43,28 @@ Index: xfsprogs-4.8.0/libxfs/Makefile
>>
>>   install-headers: $(addsuffix -hdrs, $(PKGHFILES))
>>
>> +@@ -144,6 +145,7 @@ install-headers: $(addsuffix -hdrs, $(PK
>> +       $(Q)$(LN_S) -f $(CURDIR)/$* $(TOPDIR)/include/xfs/$*
>> +
>> + install-dev: install
>> ++      $(INSTALL_LTLIB_DEV)
>> +       $(INSTALL) -m 644 $(PKGHFILES) $(PKG_INC_DIR)
>> +
>> + # We need to install the headers before building the dependencies.  If
>> we
>>  Index: xfsprogs-4.8.0/libxlog/Makefile
>>  ===================================================================
>>  --- xfsprogs-4.8.0.orig/libxlog/Makefile
>>  +++ xfsprogs-4.8.0/libxlog/Makefile
>> -@@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
>> +@@ -12,6 +12,8 @@ LT_AGE = 0
>> +
>> + CFILES = xfs_log_recover.c util.c
>> +
>> ++LTLIBS = $(LIBUUID) $(LIBXFS)
>> ++
>> + # don't want to link xfs_repair with a debug libxlog.
>> + DEBUG = -DNDEBUG
>> +
>> +@@ -19,6 +21,10 @@ default: ltdepend $(LTLIBRARY)
>>
>>   include $(BUILDRULES)
>>
>> @@ -53,3 +76,54 @@ Index: xfsprogs-4.8.0/libxlog/Makefile
>>  +      $(INSTALL_LTLIB_DEV)
>>
>>   -include .ltdep
>> +Index: xfsprogs-4.8.0/include/buildmacros
>> +===================================================================
>> +--- xfsprogs-4.8.0.orig/include/buildmacros
>> ++++ xfsprogs-4.8.0/include/buildmacros
>> +@@ -70,18 +70,9 @@ endif
>> + # /usr/lib.
>> + ifeq ($(ENABLE_SHARED),yes)
>> + INSTALL_LTLIB_DEV = \
>> +-      cd $(TOPDIR)/$(LIBNAME)/.libs; \
>> +-      ../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
>> +-      ../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_LIB_DIR); \
>> +-      ../$(INSTALL) -m 644 $(LIBNAME).lai $(PKG_LIB_DIR)/$(LIBNAME).la
>> ; \
>> +-      ../$(INSTALL) -m 755 -d $(PKG_ROOT_LIB_DIR); \
>> +-      ../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_ROOT_LIB_DIR); \
>> +-      if [ "x$(shell readlink -f $(PKG_LIB_DIR))" != \
>> +-           "x$(shell readlink -f $(PKG_ROOT_LIB_DIR))" ]; then \
>> +-              ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).a
>> $(PKG_ROOT_LIB_DIR)/$(LIBNAME).a; \
>> +-              ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).la
>> $(PKG_ROOT_LIB_DIR)/$(LIBNAME).la; \
>> +-              ../$(INSTALL) -S $(PKG_ROOT_LIB_DIR)/$(LIBNAME).so
>> $(PKG_LIB_DIR)/$(LIBNAME).so; \
>> +-      fi
>> ++      set -e; cd $(TOPDIR)/$(LIBNAME); \
>> ++      $(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
>> ++      env -uDIST_ROOT $(LTINSTALL) $(TOPDIR)/$(LIBNAME)/$(LIBNAME).la
>> $(DIST_ROOT)$(PKG_LIB_DIR)/$(LIBNAME).la
>> + else
>> + INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
>> + endif
>> +Index: xfsprogs-4.8.0/Makefile
>> +===================================================================
>> +--- xfsprogs-4.8.0.orig/Makefile
>> ++++ xfsprogs-4.8.0/Makefile
>> +@@ -83,6 +83,8 @@ quota: libxcmd
>> + repair: libxlog libxcmd
>> + copy: libxlog
>> + mkfs: libxcmd
>> ++libxlog: libxfs
>> ++libxlog-install-dev: libxfs-install-dev
>> +
>> + ifeq ($(HAVE_BUILDDEFS), yes)
>> + include $(BUILDRULES)
>> +Index: xfsprogs-4.8.0/libhandle/Makefile
>> +===================================================================
>> +--- xfsprogs-4.8.0.orig/libhandle/Makefile
>> ++++ xfsprogs-4.8.0/libhandle/Makefile
>> +@@ -24,7 +24,6 @@ default: ltdepend $(LTLIBRARY)
>> + include $(BUILDRULES)
>> +
>> + install: default
>> +-      $(INSTALL_LTLIB)
>> +
>> + install-dev: default
>> +       $(INSTALL_LTLIB_DEV)
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> index 9959f0d85..1032fb89b 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> @@ -22,7 +22,7 @@ FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
>>  FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
>>  FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
>>
>> -FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
>> +FILES_libhandle = "${libdir}/libhandle${SOLIBS}"
>>
>>  EXTRA_OECONF = "--enable-gettext=no \
>>                  INSTALL_USER=root \
>> @@ -40,7 +40,7 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-b
>> lkid=no,util-linux"
>>
>>  export DEBUG="-DNDEBUG"
>>
>> -EXTRA_OEMAKE = "DIST_ROOT='${D}'"
>> +#EXTRA_OEMAKE = "DIST_ROOT='${D}'"
>>
>>  do_configure_prepend () {
>>      export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
>> @@ -54,3 +54,5 @@ do_configure_prepend () {
>>  do_install_append() {
>>          oe_runmake 'DESTDIR=${D}' install install-dev
>>  }
>> +
>> +PARALLEL_MAKEINST = ""
>>
>> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

