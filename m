Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9758171D60
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:42:03 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so9919044uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Dec 2016 14:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ireQaNe8MnfjvajU046hRydQ/apxRtInsOpLOiUyfhY=;
	b=K9sCaESYWxH7BBY/JcawEyUEUdsTHZzinduqkLRc2EEwxFnSCnvS8ysSfddU0S+CYU
	CvTcJjMim460NK1aNJiDIUY/d3gPti8pH4UUQFyTRMwsDg0vbH8RTbxtataBcFcVy3te
	X86N0yBdaJpLbDTBwrsrYbk86Ys63+HXwh6GZVR2uWZvBbps/vIdKFhlkzAWKV9C4b5R
	hODMEysMpsquka1/3gy/wOfV+7czt8ln9zTK2MeDQc7nE1DsNoY1jEAnhxHi6Bz/winM
	lzlQSfHvR927w90JdhTnD4d4UMJqsSOiG7BQlRSYdxl66glN3jGpoM4OjekIv7mMeh4G
	+IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ireQaNe8MnfjvajU046hRydQ/apxRtInsOpLOiUyfhY=;
	b=e1C1Re8sRQXRbMlxUdZxgABY6G5+JCX3ymHvVcuKrRlEw55JdtYH6LF1JpSndwDOe6
	fBGS7e/FINP5ta0Vtsaqn3Q7zfXq0KHNnpOv5orLTTGNqo2/QdNj882GhqUCPOR7K+lt
	AVKVlfFzuHeILZLb4WQxOl1hIVJWDuCx6gZolEZLKLqQfh36b62Q5/zWSF0dlODBbRLJ
	O4tI0KTQZ546/1k54gzs31TtlR+6bmA+6KNlCnjQbjGsf5th6vNT630zhGNJNiwl24DD
	C/2xjVJZuDXw//cJNoN+wDUJslfWadW3g68I4pjG+vC/V7AXogdsX6vkxuz2SM90Fgve
	lRrg==
X-Gm-Message-State: AIkVDXJa0+h4priifxHy3uZrvhBUDVnN9ao5Yg4qy4sZIrn2+W8ydEZ/llWTh6XHFjgC4pxKAmhODKqXTodmRQ==
X-Received: by 10.176.71.89 with SMTP id i25mr5273734uac.31.1482100924531;
	Sun, 18 Dec 2016 14:42:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sun, 18 Dec 2016 14:41:34 -0800 (PST)
In-Reply-To: <da506bbc-1928-669c-22b8-6edcd8368268@opendreambox.org>
References: <20161217230622.26063-1-raj.khem@gmail.com>
	<da506bbc-1928-669c-22b8-6edcd8368268@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Dec 2016 14:41:34 -0800
Message-ID: <CAMKF1sqj7AtS4su0UnkB5fW-HuSe2H9Vy5ZqfOC-HKwygMq2Jg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 18 Dec 2016 22:42:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 18, 2016 at 1:47 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Hi Khem,
>
> On 18.12.2016 00:06, Khem Raj wrote:
>> This should fix build issues due to missing dependencies
>> e.g. libuuid in Makefiles.
>
> this patch doesn't resolve the issue. I'm using the default linker.
> Maybe you could apply link_needed_libs.patch only if clang is used.

its really not clang specific either  I checked. Its cross-compile specific
whats best way to reproduce it. I do not get the errors you see. I wonder
if there is some host contamination still going on. Can you check on
these lines.

>
> Regards,
> Andreas
>
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
>>  .../xfsprogs/files/link_needed_libs.patch          | 76 +++++++++++++++++++++-
>>  .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  6 +-
>>  2 files changed, 79 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
>> index 18b95c1c3..a3c699ce6 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
>> @@ -1,3 +1,9 @@
>> +use libtool to package install.  do not use the manual file install as
>> +that'll copy files directly from the .libs/ subdir which might have rpaths
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
>> +     $(Q)$(LN_S) -f $(CURDIR)/$* $(TOPDIR)/include/xfs/$*
>> +
>> + install-dev: install
>> ++    $(INSTALL_LTLIB_DEV)
>> +     $(INSTALL) -m 644 $(PKGHFILES) $(PKG_INC_DIR)
>> +
>> + # We need to install the headers before building the dependencies.  If we
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
>>  +    $(INSTALL_LTLIB_DEV)
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
>> +-    cd $(TOPDIR)/$(LIBNAME)/.libs; \
>> +-    ../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
>> +-    ../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_LIB_DIR); \
>> +-    ../$(INSTALL) -m 644 $(LIBNAME).lai $(PKG_LIB_DIR)/$(LIBNAME).la ; \
>> +-    ../$(INSTALL) -m 755 -d $(PKG_ROOT_LIB_DIR); \
>> +-    ../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_ROOT_LIB_DIR); \
>> +-    if [ "x$(shell readlink -f $(PKG_LIB_DIR))" != \
>> +-         "x$(shell readlink -f $(PKG_ROOT_LIB_DIR))" ]; then \
>> +-            ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).a $(PKG_ROOT_LIB_DIR)/$(LIBNAME).a; \
>> +-            ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).la $(PKG_ROOT_LIB_DIR)/$(LIBNAME).la; \
>> +-            ../$(INSTALL) -S $(PKG_ROOT_LIB_DIR)/$(LIBNAME).so $(PKG_LIB_DIR)/$(LIBNAME).so; \
>> +-    fi
>> ++    set -e; cd $(TOPDIR)/$(LIBNAME); \
>> ++    $(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
>> ++    env -uDIST_ROOT $(LTINSTALL) $(TOPDIR)/$(LIBNAME)/$(LIBNAME).la $(DIST_ROOT)$(PKG_LIB_DIR)/$(LIBNAME).la
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
>> +-    $(INSTALL_LTLIB)
>> +
>> + install-dev: default
>> +     $(INSTALL_LTLIB_DEV)
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
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
>> @@ -40,7 +40,7 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
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
>

