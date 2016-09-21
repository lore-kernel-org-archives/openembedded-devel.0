Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5D196079E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:53:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8L2rNCg003098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 19:53:23 -0700
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 19:53:22 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20160912082002.41576-1-liezhi.yang@windriver.com>
	<20160913144954.GC2701@jama>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <9ff7ad15-73ee-0169-d6f5-17b4b9cde1e2@windriver.com>
Date: Wed, 21 Sep 2016 10:53:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160913144954.GC2701@jama>
Subject: Re: [meta-filesystems][PATCH 1/2] xfsprogs: 3.2.3 -> 4.7.0
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
X-List-Received-Date: Wed, 21 Sep 2016 02:53:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2016 10:49 PM, Martin Jansa wrote:
> On Mon, Sep 12, 2016 at 01:20:01AM -0700, Robert Yang wrote:
>> The 3.2.3 doesn't work with kernel 4.8 any more.
>>
>> * Update remove-install-as-user.patch and xfsprogs-generate-crctable-which-is-moved-into-runti.patch
>> * Remove drop-configure-check-for-aio.patch which was for uclibc, and
>>   uclibc is not supported by oe-core any more.
>
> Thanks for update (instead of blacklist), but there is one more issue
> when building with gold:

Hi Martin,

I also got those failures from my build which DISTRO_FEATURES doesn't 
include "ld-is-gold", my concern is why do you think this is related to 
gold?

Thanks
Wenzong

>
> | Building growfs
> |     [CC]     xfs_growfs.o
> |     [LD]     xfs_growfs
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_new_probe_from_filename'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_alignment_offset'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_get_topology'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_do_fullprobe'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_logical_sector_size'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_optimal_io_size'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_lookup_value'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_free_probe'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_physical_sector_size'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_enable_partitions'
> | ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_minimum_io_size'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [xfs_growfs] Error 1
> | make[1]: *** [growfs] Error 2
>
>>
>> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20160912
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  .../files/drop-configure-check-for-aio.patch       | 93 ----------------------
>>  .../xfsprogs/files/remove-install-as-user.patch    | 53 +++++-------
>>  ...nerate-crctable-which-is-moved-into-runti.patch | 40 ++++------
>>  .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       | 52 ------------
>>  .../recipes-utils/xfsprogs/xfsprogs_4.7.0.bb       | 51 ++++++++++++
>>  5 files changed, 90 insertions(+), 199 deletions(-)
>>  delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
>>  delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
>>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb
>>
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch b/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
>> deleted file mode 100644
>> index 7601095..0000000
>> --- a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
>> +++ /dev/null
>> @@ -1,93 +0,0 @@
>> -xfsprogs: drop configure check for aio
>> -
>> -It's unused and breaks compilation with uclibc.
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ----
>> - configure.ac         |  6 +++---
>> - m4/Makefile          |  1 -
>> - m4/package_aiodev.m4 | 36 ------------------------------------
>> - 3 files changed, 3 insertions(+), 40 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index b968977..4e2a263 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -47,6 +47,9 @@ AC_ARG_ENABLE(lib64,
>> - 	enable_lib64=yes)
>> - AC_SUBST(enable_lib64)
>> -
>> -+librt="-lrt"
>> -+AC_SUBST(librt)
>> -+
>> - #
>> - # If the user specified a libdir ending in lib64 do not append another
>> - # 64 to the library names.
>> -@@ -92,9 +95,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
>> - AC_PACKAGE_UTILITIES(xfsprogs)
>> - AC_MULTILIB($enable_lib64)
>> -
>> --AC_PACKAGE_NEED_AIO_H
>> --AC_PACKAGE_NEED_LIO_LISTIO
>> --
>> - AC_PACKAGE_NEED_UUID_H
>> - AC_PACKAGE_NEED_UUIDCOMPARE
>> -
>> -diff --git a/m4/Makefile b/m4/Makefile
>> -index 654a4fb..d282f0a 100644
>> ---- a/m4/Makefile
>> -+++ b/m4/Makefile
>> -@@ -14,7 +14,6 @@ CONFIGURE = \
>> -
>> - LSRCFILES = \
>> - 	manual_format.m4 \
>> --	package_aiodev.m4 \
>> - 	package_blkid.m4 \
>> - 	package_globals.m4 \
>> - 	package_libcdev.m4 \
>> -diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
>> -index 490d9c8..8b13789 100644
>> ---- a/m4/package_aiodev.m4
>> -+++ b/m4/package_aiodev.m4
>> -@@ -1,37 +1 @@
>> --#
>> --# Check if we have a libaio.h installed
>> --#
>> --AC_DEFUN([AC_PACKAGE_WANT_AIO],
>> --  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=true ], [ have_aio=false ])
>> --    AC_SUBST(have_aio)
>> --  ])
>> --
>> --#
>> --# Check if we have an aio.h installed
>> --#
>> --AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
>> --  [ AC_CHECK_HEADERS(aio.h)
>> --    if test $ac_cv_header_aio_h = no; then
>> --	echo
>> --	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
>> --	exit 1
>> --    fi
>> --  ])
>> --
>> --#
>> --# Check if we have the lio_listio routine in either libc/librt
>> --#
>> --AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
>> --  [ AC_CHECK_FUNCS(lio_listio)
>> --    if test $ac_cv_func_lio_listio = yes; then
>> --	librt=""
>> --    else
>> --	AC_CHECK_LIB(rt, lio_listio,, [
>> --	    echo
>> --	    echo 'FATAL ERROR: could not find a library with lio_listio.'
>> --	    exit 1],[-lpthread])
>> --	librt="-lrt"
>> --    fi
>> --    AC_SUBST(librt)
>> --  ])
>> -
>> ---
>> -1.8.1.2
>> -
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
>> index e761db3..43eacd4 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
>> @@ -5,11 +5,10 @@ Upstream-Status: Inappropriate [configuration]
>>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>  ---
>>   include/buildmacros |  2 +-
>> - include/install-sh  | 95 ++++++++---------------------------------------------
>> - 2 files changed, 14 insertions(+), 83 deletions(-)
>> + include/install-sh  | 88 +++++++++++++---------------------------------------------------------------------------
>> + 2 files changed, 14 insertions(+), 76 deletions(-)
>>
>>  diff --git a/include/buildmacros b/include/buildmacros
>> -index 7a01880..0840d55 100644
>>  --- a/include/buildmacros
>>  +++ b/include/buildmacros
>>  @@ -30,7 +30,7 @@ OBJECTS = $(ASFILES:.s=.o) \
>> @@ -22,7 +21,6 @@ index 7a01880..0840d55 100644
>>   IMAGES_DIR = $(TOPDIR)/all-images
>>   DIST_DIR = $(TOPDIR)/dist
>>  diff --git a/include/install-sh b/include/install-sh
>> -index c952a71..b9d66f7 100755
>>  --- a/include/install-sh
>>  +++ b/include/install-sh
>>  @@ -24,11 +24,11 @@
>> @@ -41,7 +39,7 @@ index c952a71..b9d66f7 100755
>>       echo ""
>>       echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables affect the"
>>       echo "behaviour of this command - see comments in the script."
>> -@@ -38,32 +38,6 @@ _usage() {
>> +@@ -38,35 +38,10 @@ _usage() {
>>       exit 1
>>   }
>>
>> @@ -63,7 +61,7 @@ index c952a71..b9d66f7 100755
>>  -		    fi
>>  -		fi
>>  -	       _st=0
>> --	    fi
>> +-	    fi
>>  -	fi
>>  -    fi
>>  -
>> @@ -72,9 +70,13 @@ index c952a71..b9d66f7 100755
>>  -
>>  -
>>   _manifest ()
>> - {
>> + {
>>       echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
>> -@@ -77,9 +51,6 @@ Sflag=false
>> ++    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
>> + }
>> +
>> + prog=`basename $0`
>> +@@ -77,9 +52,6 @@ Sflag=false
>>   Tflag=false
>>   DIRMODE=755
>>   FILEMODE=644
>> @@ -84,7 +86,7 @@ index c952a71..b9d66f7 100755
>>
>>   # default is to install and don't append manifest
>>   INSTALL=true
>> -@@ -94,24 +65,16 @@ MANIFEST=:
>> +@@ -94,24 +66,16 @@ MANIFEST=:
>>
>>   if $INSTALL
>>   then
>> @@ -112,27 +114,19 @@ index c952a71..b9d66f7 100755
>>      m)
>>   	DIRMODE=`expr $OPTARG`
>>   	FILEMODE=$DIRMODE
>> -@@ -146,18 +109,7 @@ then
>> -     # first usage
>> -     #
>> -     $MKDIR -p $dir
>> --    status=$?
>> --    if [ $status -eq 0 ]
>> --    then
>> --	$CHMOD $DIRMODE $dir
>> --	status=$?
>> --    fi
>> +@@ -152,11 +116,6 @@ then
>> + 	$CHMOD $DIRMODE $dir
>> + 	status=$?
>> +     fi
>>  -    if [ $status -eq 0 ]
>>  -    then
>>  -	$CHOWN $OWNER $GROUP $dir
>>  -	status=$?
>>  -    fi
>> --    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
>> -+    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
>> +     $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
>>   elif $Sflag
>>   then
>> -     #
>> -@@ -203,7 +155,7 @@ then
>> +@@ -203,7 +162,7 @@ then
>>   			install_name=$target/$solib
>>   			$CP $solib $install_name
>>   			status=$?
>> @@ -141,7 +135,7 @@ index c952a71..b9d66f7 100755
>>   			break
>>   		fi
>>   	done
>> -@@ -254,7 +206,7 @@ then
>> +@@ -254,7 +213,7 @@ then
>>   	install_name=$target/$old_library
>>   	$CP $old_library $install_name
>>   	status=$?
>> @@ -150,7 +144,7 @@ index c952a71..b9d66f7 100755
>>   	;;
>>       *)
>>   	echo "$prog: -T $lt_install invalid"
>> -@@ -267,7 +219,6 @@ then
>> +@@ -267,7 +226,6 @@ then
>>   	if [ $status -eq 0 ]
>>   	then
>>   		$CHMOD $FILEMODE $install_name
>> @@ -158,8 +152,8 @@ index c952a71..b9d66f7 100755
>>   	fi
>>   	;;
>>       esac
>> -@@ -292,23 +243,10 @@ else
>> - 	then
>> +@@ -292,23 +250,10 @@ else
>> + 	then
>>   	    if [ -f $dir/$f ]
>>   	    then
>>  -		$CHMOD $FILEMODE $dir/$f
>> @@ -184,7 +178,7 @@ index c952a71..b9d66f7 100755
>>   	    fi
>>   	fi
>>       else
>> -@@ -334,14 +272,7 @@ else
>> +@@ -334,14 +279,7 @@ else
>>   	    status=$?
>>   	    if [ $status -eq 0 ]
>>   	    then
>> @@ -200,6 +194,3 @@ index c952a71..b9d66f7 100755
>>   	    fi
>>   	    [ $status -ne 0 ] && break
>>   	done
>> ---
>> -1.8.1.2
>> -
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
>> index b204195..e04a21f 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
>> @@ -13,24 +13,22 @@ Upstream-Status: Pending
>>
>>  Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>>  ---
>> - libxfs/Makefile | 23 ++----------------
>> - libxfs/crc32.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>> - 2 files changed, 75 insertions(+), 23 deletions(-)
>> + libxfs/Makefile | 22 +---------------------
>> + libxfs/crc32.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>> + 2 files changed, 74 insertions(+), 23 deletions(-)
>>
>>  diff --git a/libxfs/Makefile b/libxfs/Makefile
>> -index ae15a5d..7670159 100644
>>  --- a/libxfs/Makefile
>>  +++ b/libxfs/Makefile
>> -@@ -10,7 +10,7 @@ LT_CURRENT = 0
>> - LT_REVISION = 0
>> - LT_AGE = 0
>> +@@ -43,7 +43,6 @@ HFILES = \
>> + 	libxfs_api_defs.h \
>> + 	init.h \
>> + 	crc32defs.h \
>> +-	crc32table.h \
>> + 	libxfs_priv.h \
>> + 	xfs_dir2_priv.h
>>
>> --HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h crc32table.h
>> -+HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h
>> - CFILES = cache.c \
>> - 	crc32.c \
>> - 	init.c kmem.c logitem.c radix-tree.c rdwr.c trans.c util.c \
>> -@@ -43,7 +43,6 @@ CFILES = cache.c \
>> +@@ -87,7 +86,6 @@ CFILES = cache.c \
>>   CFILES += $(PKG_PLATFORM).c
>>   PCFILES = darwin.c freebsd.c irix.c linux.c
>>   LSRCFILES = $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
>> @@ -38,7 +36,7 @@ index ae15a5d..7670159 100644
>>
>>   #
>>   # Tracing flags:
>> -@@ -61,25 +60,7 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
>> +@@ -105,25 +103,7 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
>>   # don't try linking xfs_repair with a debug libxfs.
>>   DEBUG = -DNDEBUG
>>
>> @@ -48,7 +46,7 @@ index ae15a5d..7670159 100644
>>  -
>>  -crc32table.h: gen_crc32table.c
>>  -	@echo "    [CC]     gen_crc32table"
>> --	$(Q) $(CC) $(CFLAGS) -o gen_crc32table $<
>> +-	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
>>  -	@echo "    [GENERATE] $@"
>>  -	$(Q) ./gen_crc32table > crc32table.h
>>  -
>> @@ -59,17 +57,16 @@ index ae15a5d..7670159 100644
>>  -# disk.
>>  -crc32selftest: gen_crc32table.c crc32table.h crc32.c
>>  -	@echo "    [TEST]    CRC32"
>> --	$(Q) $(CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
>> +-	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
>>  -	$(Q) ./$@
>>  +default: ltdepend $(LTLIBRARY)
>>
>> + # set up include/xfs header directory
>>   include $(BUILDRULES)
>> -
>>  diff --git a/libxfs/crc32.c b/libxfs/crc32.c
>> -index 0f847d2..be5fbc3 100644
>>  --- a/libxfs/crc32.c
>>  +++ b/libxfs/crc32.c
>> -@@ -55,8 +55,6 @@ typedef __u32	u64;
>> +@@ -57,8 +57,6 @@ typedef __u32	u64;
>>   # define tobe(x) (x)
>>   #endif
>>
>> @@ -78,7 +75,7 @@ index 0f847d2..be5fbc3 100644
>>   #if CRC_LE_BITS > 8 || CRC_BE_BITS > 8
>>
>>   /* implements slicing-by-4 or slicing-by-8 algorithm */
>> -@@ -183,13 +181,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
>> +@@ -185,13 +183,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
>>   	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
>>   }
>>   #else
>> @@ -165,6 +162,3 @@ index 0f847d2..be5fbc3 100644
>>   	return crc32_le_generic(crc, p, len,
>>   			(const u32 (*)[256])crc32ctable_le, CRC32C_POLY_LE);
>>   }
>> ---
>> -1.9.1
>> -
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
>> deleted file mode 100644
>> index f38239c..0000000
>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -SUMMARY = "XFS Filesystem Utilities"
>> -HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>> -SECTION = "base"
>> -LICENSE = "GPLv2 & LGPLv2.1"
>> -LICENSE_libhandle = "LGPLv2.1"
>> -LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
>> -DEPENDS = "util-linux"
>> -
>> -SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
>> -    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
>> -    file://remove-install-as-user.patch \
>> -    file://drop-configure-check-for-aio.patch \
>> -"
>> -
>> -SRC_URI[md5sum] = "9f383e36682709e62b12c125e5d8b895"
>> -SRC_URI[sha256sum] = "7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce3f4de30827109ac9"
>> -
>> -inherit autotools-brokensep
>> -
>> -PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
>> -
>> -RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
>> -
>> -FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
>> -FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
>> -FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
>> -
>> -EXTRA_OECONF = "--enable-gettext=no"
>> -do_configure () {
>> -    # Prevent Makefile from calling configure without arguments,
>> -    # when do_configure gets called for a second time.
>> -    rm -f include/builddefs include/platform_defs.h
>> -    # Recreate configure script.
>> -    rm -f configure
>> -    oe_runmake configure
>> -    # Configure.
>> -    export DEBUG="-DNDEBUG"
>> -    gnu-configize --force
>> -    oe_runconf
>> -}
>> -
>> -LIBTOOL = "${HOST_SYS}-libtool"
>> -EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
>> -TARGET_CC_ARCH += "${LDFLAGS}"
>> -PARALLEL_MAKE = ""
>> -
>> -do_install () {
>> -    export DIST_ROOT=${D}
>> -    oe_runmake install
>> -    # needed for xfsdump
>> -    oe_runmake install-dev
>> -}
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb
>> new file mode 100644
>> index 0000000..2fce9eb
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb
>> @@ -0,0 +1,51 @@
>> +SUMMARY = "XFS Filesystem Utilities"
>> +HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>> +SECTION = "base"
>> +LICENSE = "GPLv2 & LGPLv2.1"
>> +LICENSE_libhandle = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
>> +DEPENDS = "util-linux"
>> +
>> +SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
>> +    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
>> +    file://remove-install-as-user.patch \
>> +"
>> +
>> +SRC_URI[md5sum] = "ae82b0ab63e89cfda52fb9859855bafa"
>> +SRC_URI[sha256sum] = "88580bb3e6847c3edef436703a4fae403fc19b20739db4c31166ee4b256178d7"
>> +
>> +inherit autotools-brokensep
>> +
>> +PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
>> +
>> +RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
>> +
>> +FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
>> +FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
>> +FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
>> +
>> +EXTRA_OECONF = "--enable-gettext=no"
>> +do_configure () {
>> +    # Prevent Makefile from calling configure without arguments,
>> +    # when do_configure gets called for a second time.
>> +    rm -f include/builddefs include/platform_defs.h
>> +    # Recreate configure script.
>> +    rm -f configure
>> +    oe_runmake configure
>> +    # Configure.
>> +    export DEBUG="-DNDEBUG"
>> +    gnu-configize --force
>> +    oe_runconf
>> +}
>> +
>> +LIBTOOL = "${HOST_SYS}-libtool"
>> +EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +PARALLEL_MAKE = ""
>> +
>> +do_install () {
>> +    export DIST_ROOT=${D}
>> +    oe_runmake install
>> +    # needed for xfsdump
>> +    oe_runmake install-dev
>> +}
>> --
>> 2.9.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

