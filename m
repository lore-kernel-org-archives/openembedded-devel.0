Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEDF471E2E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 03:48:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ3luZi022634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Dec 2016 19:47:56 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 25 Dec 2016 19:47:55 -0800
To: <openembedded-devel@lists.openembedded.org>, <obi@opendreambox.org>
References: <20161217230622.26063-1-raj.khem@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cf62d5db-2bae-8cec-8a87-9fcf53d26a0c@windriver.com>
Date: Mon, 26 Dec 2016 11:47:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20161217230622.26063-1-raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 26 Dec 2016 03:48:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I still get errors after applied this patch, we can see that there is no -luuid
on command line:

../i586-wrs-linux-libtool --quiet --tag=CC --mode=link i586-wrs-linux-gcc  -m32 
-march=i586 
--sysroot=/buildarea/lyang1/build_rebase/test_qemux86/tmp/sysroots/qemux86 -o 
xfs_io -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-O1 -Wl,--hash-style=gnu 
-Wl,--as-needed  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed -static-libtool-libs  init.o attr.o bmap.o 
file.o freeze.o fsync.o getrusage.o imap.o link.o mmap.o open.o parent.o pread.o 
prealloc.o pwrite.o seek.o shutdown.o sync.o truncate.o reflink.o fadvise.o 
madvise.o mincore.o sendfile.o fiemap.o inject.o resblks.o copy_file_range.o 
sync_file_range.o readdir.o   ../libxcmd/libxcmd.la ../libhandle/libhandle.la 
-lreadline
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_alloc.o): 
In function `platform_uuid_compare':
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89: 
undefined reference to `uuid_compare'
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89: 
undefined reference to `uuid_compare'
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_bmap_btree.o): 
In function `platform_uuid_compare':
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89: 
undefined reference to `uuid_compare'
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_btree.o): 
In function `platform_uuid_compare':
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89: 
undefined reference to `uuid_compare'
/buildarea/lyang1/build_rebase/test_qemux86/tmp/work/i586-wrs-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/../include/xfs/linux.h:89: 
undefined reference to `uuid_compare'

// Robert

On 12/18/2016 07:06 AM, Khem Raj wrote:
> This should fix build issues due to missing dependencies
> e.g. libuuid in Makefiles.
>
> correct libhandle paths
>
> Dont do parallel install its broken
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes from
> v1 -> v2
> - Drop locking toolchain to gcc it compiles fine with clang too
>
>  .../xfsprogs/files/link_needed_libs.patch          | 76 +++++++++++++++++++++-
>  .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  6 +-
>  2 files changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
> index 18b95c1c3..a3c699ce6 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
> @@ -1,3 +1,9 @@
> +use libtool to package install.  do not use the manual file install as
> +that'll copy files directly from the .libs/ subdir which might have rpaths
> +pointing to build area.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  Index: xfsprogs-4.8.0/libxcmd/Makefile
>  ===================================================================
>  --- xfsprogs-4.8.0.orig/libxcmd/Makefile
> @@ -37,11 +43,28 @@ Index: xfsprogs-4.8.0/libxfs/Makefile
>
>   install-headers: $(addsuffix -hdrs, $(PKGHFILES))
>
> +@@ -144,6 +145,7 @@ install-headers: $(addsuffix -hdrs, $(PK
> + 	$(Q)$(LN_S) -f $(CURDIR)/$* $(TOPDIR)/include/xfs/$*
> +
> + install-dev: install
> ++	$(INSTALL_LTLIB_DEV)
> + 	$(INSTALL) -m 644 $(PKGHFILES) $(PKG_INC_DIR)
> +
> + # We need to install the headers before building the dependencies.  If we
>  Index: xfsprogs-4.8.0/libxlog/Makefile
>  ===================================================================
>  --- xfsprogs-4.8.0.orig/libxlog/Makefile
>  +++ xfsprogs-4.8.0/libxlog/Makefile
> -@@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
> +@@ -12,6 +12,8 @@ LT_AGE = 0
> +
> + CFILES = xfs_log_recover.c util.c
> +
> ++LTLIBS = $(LIBUUID) $(LIBXFS)
> ++
> + # don't want to link xfs_repair with a debug libxlog.
> + DEBUG = -DNDEBUG
> +
> +@@ -19,6 +21,10 @@ default: ltdepend $(LTLIBRARY)
>
>   include $(BUILDRULES)
>
> @@ -53,3 +76,54 @@ Index: xfsprogs-4.8.0/libxlog/Makefile
>  +	$(INSTALL_LTLIB_DEV)
>
>   -include .ltdep
> +Index: xfsprogs-4.8.0/include/buildmacros
> +===================================================================
> +--- xfsprogs-4.8.0.orig/include/buildmacros
> ++++ xfsprogs-4.8.0/include/buildmacros
> +@@ -70,18 +70,9 @@ endif
> + # /usr/lib.
> + ifeq ($(ENABLE_SHARED),yes)
> + INSTALL_LTLIB_DEV = \
> +-	cd $(TOPDIR)/$(LIBNAME)/.libs; \
> +-	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
> +-	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_LIB_DIR); \
> +-	../$(INSTALL) -m 644 $(LIBNAME).lai $(PKG_LIB_DIR)/$(LIBNAME).la ; \
> +-	../$(INSTALL) -m 755 -d $(PKG_ROOT_LIB_DIR); \
> +-	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_ROOT_LIB_DIR); \
> +-	if [ "x$(shell readlink -f $(PKG_LIB_DIR))" != \
> +-	     "x$(shell readlink -f $(PKG_ROOT_LIB_DIR))" ]; then \
> +-		../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).a $(PKG_ROOT_LIB_DIR)/$(LIBNAME).a; \
> +-		../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).la $(PKG_ROOT_LIB_DIR)/$(LIBNAME).la; \
> +-		../$(INSTALL) -S $(PKG_ROOT_LIB_DIR)/$(LIBNAME).so $(PKG_LIB_DIR)/$(LIBNAME).so; \
> +-	fi
> ++	set -e; cd $(TOPDIR)/$(LIBNAME); \
> ++	$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
> ++	env -uDIST_ROOT $(LTINSTALL) $(TOPDIR)/$(LIBNAME)/$(LIBNAME).la $(DIST_ROOT)$(PKG_LIB_DIR)/$(LIBNAME).la
> + else
> + INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
> + endif
> +Index: xfsprogs-4.8.0/Makefile
> +===================================================================
> +--- xfsprogs-4.8.0.orig/Makefile
> ++++ xfsprogs-4.8.0/Makefile
> +@@ -83,6 +83,8 @@ quota: libxcmd
> + repair: libxlog libxcmd
> + copy: libxlog
> + mkfs: libxcmd
> ++libxlog: libxfs
> ++libxlog-install-dev: libxfs-install-dev
> +
> + ifeq ($(HAVE_BUILDDEFS), yes)
> + include $(BUILDRULES)
> +Index: xfsprogs-4.8.0/libhandle/Makefile
> +===================================================================
> +--- xfsprogs-4.8.0.orig/libhandle/Makefile
> ++++ xfsprogs-4.8.0/libhandle/Makefile
> +@@ -24,7 +24,6 @@ default: ltdepend $(LTLIBRARY)
> + include $(BUILDRULES)
> +
> + install: default
> +-	$(INSTALL_LTLIB)
> +
> + install-dev: default
> + 	$(INSTALL_LTLIB_DEV)
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> index 9959f0d85..1032fb89b 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
> @@ -22,7 +22,7 @@ FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
>  FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
>  FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
>
> -FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
> +FILES_libhandle = "${libdir}/libhandle${SOLIBS}"
>
>  EXTRA_OECONF = "--enable-gettext=no \
>                  INSTALL_USER=root \
> @@ -40,7 +40,7 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
>
>  export DEBUG="-DNDEBUG"
>
> -EXTRA_OEMAKE = "DIST_ROOT='${D}'"
> +#EXTRA_OEMAKE = "DIST_ROOT='${D}'"
>
>  do_configure_prepend () {
>      export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
> @@ -54,3 +54,5 @@ do_configure_prepend () {
>  do_install_append() {
>          oe_runmake 'DESTDIR=${D}' install install-dev
>  }
> +
> +PARALLEL_MAKEINST = ""
>

