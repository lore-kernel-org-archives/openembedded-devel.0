Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 56DD976EA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:11:00 +0000 (UTC)
Received: by oigm66 with SMTP id m66so64835714oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=amjFw/VDxNPw7SsRwoi9jqLxEhyM90RVy/aM1VSXc1U=;
	b=qUiAvlANpC7rWUsQtFRDiuOcayCGM/xWZrmZFJlPDGyRLrJyCSvgE1Z0THQsihpeQy
	hQBdKmIDhJtKOc53B+yg+pb4Oh++k/lPatiP/nHl97GS7CVsYMcRrVOGuQar04qJJcxX
	yBZH27flvMSFJKPXJlrSq4BcnY/9PT97wqNIbXD5IunH2KYLYm+hyO+RRS2gbsJ7Vc5c
	YRCX7/w88hQn2hfffhFaYkql/lJPzRDz2m+7NSmIytTwj9owmsesr7/+RuD6v8p37vsz
	LaU4I40Rt+4fUrV+qxSUMjyJ89HFTdh9fyEgXXTYGuO2F+pdSUUdLIkPDqJuy3HJ/j6f
	Y9Lw==
MIME-Version: 1.0
X-Received: by 10.202.241.6 with SMTP id p6mr13846128oih.1.1441048261089; Mon,
	31 Aug 2015 12:11:01 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Mon, 31 Aug 2015 12:11:01 -0700 (PDT)
In-Reply-To: <20150831175844.GD2465@jama>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
Date: Mon, 31 Aug 2015 12:11:01 -0700
Message-ID: <CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Aug 2015 19:11:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jul 06, 2015 at 09:51:34AM +0800, Lei Maohui wrote:
>> In oe-core,the parted is GPLv3,so add parted-1.8.6 which is not GPLv3.
>>
>> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>> ---
>>  .../parted-1.8.6/1000parted-1.8.6-warnings1.patch  | 11 ++++
>>  .../1001parted-1.8.6-notransname1.patch            | 39 ++++++++++++++
>>  .../1002parted-1.8.6-off-by-one1.patch             | 25 +++++++++
>>  .../1003parted-1.8.6-primary-boundary1.patch       | 12 +++++
>>  .../parted-1.8.6/1004parted-1.8.6-xvd1.patch       | 50 +++++++++++++++++
>>  .../1005parted-1.8.6-devmapper-header1.patch       | 13 +++++
>>  .../parted/parted-1.8.6/7000no_effect_macro1.patch | 11 ++++
>>  .../parted/parted-1.8.6/ui.c-fix-build-error.patch | 26 +++++++++
>>  meta-oe/recipes-extended/parted/parted_1.8.6.bb    | 62 ++++++++++++++++++++++
>>  9 files changed, 249 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch
>>  create mode 100644 meta-oe/recipes-extended/parted/parted_1.8.6.bb
>
> I cannot take this to meta-oe, because as soon as it's added there it
> will be used by all DISTROs even those who don't mind having GPLv3
> version.
>
> Everybody would need to define PREFERRED_VERSION, because
> DEFAULT_PREFERENCE is useless across different layers :/
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2964
>
> So this either has to be introduced in oe-core or in completely separate
> layer which would be included only by those who cannot use GPLv3.

Third option would be to reduce the priority of meta-oe to be lower
than oe-core.

That seems logical regardless of any GPLv3 discussion - since meta-oe
"fills in the gaps" in oe-core, if something _is_ present in oe-core
then it probably should be the default version.

>
>>
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch
>> new file mode 100644
>> index 0000000..c8b2e7d
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warnings1.patch
>> @@ -0,0 +1,11 @@
>> +--- parted-1.8.6/libparted/fs/linux_swap/linux_swap.c.warnings       2007-03-20 13:22:36.000000000 -0400
>> ++++ parted-1.8.6/libparted/fs/linux_swap/linux_swap.c        2007-03-20 13:59:11.000000000 -0400
>> +@@ -123,7 +123,7 @@
>> +
>> + error_close_fs:
>> +     swap_close (fs);
>> +-error:
>> ++
>> +     return 0;
>> + }
>> + #endif /* !DISCOVER_ONLY */
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch
>> new file mode 100644
>> index 0000000..5fdf10b
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notransname1.patch
>> @@ -0,0 +1,39 @@
>> +--- parted-1.8.6/parted/parted.c.notransname 2007-03-13 13:01:09.000000000 -0400
>> ++++ parted-1.8.6/parted/parted.c     2007-03-21 10:50:35.000000000 -0400
>> +@@ -1429,7 +1429,7 @@
>> +                                              part->fs_type->name : "");
>> +
>> +                             if (has_name) {
>> +-                                    name = _(ped_partition_get_name (part));
>> ++                                    name = ped_partition_get_name (part);
>> +                                     str_list_append (row, name);
>> +                             }
>> +
>> +--- parted-1.8.6/parted/table.c.notransname  2007-03-13 13:01:09.000000000 -0400
>> ++++ parted-1.8.6/parted/table.c      2007-03-21 10:51:31.000000000 -0400
>> +@@ -191,7 +191,8 @@
>> +         len += wcslen(COLSUFFIX);
>> +
>> +         newsize = (wcslen(*s) + len + 1) * sizeof(wchar_t);
>> +-        *s = realloc (*s, newsize);
>> ++        *s = (wchar_t *) realloc (*s, newsize);
>> ++        assert(*s != NULL);
>> +
>> +         for (i = 0; i < ncols; ++i)
>> +         {
>> +@@ -199,6 +200,7 @@
>> +                 int nspaces = max(t->widths[i] - wcswidth(row[i], MAX_WIDTH),
>> +                                   0);
>> +                 wchar_t* pad = malloc ( (nspaces + 1) * sizeof(wchar_t) );
>> ++                assert(pad != NULL);
>> +
>> +                 for (j = 0; j < nspaces; ++j)
>> +                        pad[j] = L' ';
>> +@@ -211,6 +213,7 @@
>> +                         wcscat (*s, DELIMITER);
>> +
>> +                 free (pad);
>> ++                pad = NULL;
>> +         }
>> +
>> +         wcscat (*s, COLSUFFIX);
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch
>> new file mode 100644
>> index 0000000..9652a98
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-by-one1.patch
>> @@ -0,0 +1,25 @@
>> +--- parted-1.8.6/parted/parted.c.offbyone    2007-04-11 12:13:06.000000000 -0400
>> ++++ parted-1.8.6/parted/parted.c     2007-04-11 12:13:21.000000000 -0400
>> +@@ -1217,6 +1217,7 @@
>> + static int
>> + do_print (PedDevice** dev)
>> + {
>> ++        PedUnit         default_unit;
>> +         PedDisk*        disk;
>> +         Table*          table;
>> +         StrList*        row;
>> +@@ -1303,11 +1304,12 @@
>> +         }
>> +
>> +         start = ped_unit_format (*dev, 0);
>> ++        default_unit = ped_unit_get_default ();
>> +         end = ped_unit_format_byte (*dev, (*dev)->length * (*dev)->sector_size
>> +-                                          - 1 );
>> ++         - (default_unit == PED_UNIT_CHS || default_unit == PED_UNIT_CYLINDER));
>> +
>> +         if (opt_machine_mode) {
>> +-            switch (ped_unit_get_default ()) {
>> ++            switch (default_unit) {
>> +                 case PED_UNIT_CHS:      puts ("CHS;");
>> +                                         break;
>> +                 case PED_UNIT_CYLINDER: puts ("CYL;");
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch
>> new file mode 100644
>> index 0000000..0366977
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-primary-boundary1.patch
>> @@ -0,0 +1,12 @@
>> +--- parted-1.8.6/libparted/labels/dos.c.boundary     2007-03-13 13:01:09.000000000 -0400
>> ++++ parted-1.8.6/libparted/labels/dos.c      2007-04-11 14:56:54.000000000 -0400
>> +@@ -1696,8 +1696,7 @@
>> +                                      _primary_start_constraint (disk, part,
>> +                                              bios_geom, min_geom)));
>> +
>> +-    if (!solution)
>> +-            solution = _best_solution (part, bios_geom, solution,
>> ++    solution = _best_solution (part, bios_geom, solution,
>> +                     _try_constraint (part, constraint,
>> +                             _primary_constraint (disk, bios_geom,
>> +                             min_geom)));
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch
>> new file mode 100644
>> index 0000000..17ec29a
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.patch
>> @@ -0,0 +1,50 @@
>> +diff -up parted-1.8.6/libparted/arch/linux.c.xvd parted-1.8.6/libparted/arch/linux.c
>> +--- parted-1.8.6/libparted/arch/linux.c.xvd  2007-08-07 14:05:59.000000000 -0400
>> ++++ parted-1.8.6/libparted/arch/linux.c      2007-08-07 14:07:13.000000000 -0400
>> +@@ -248,6 +248,7 @@ struct blkdev_ioctl_param {
>> + #define VIODASD_MAJOR           112
>> + #define SX8_MAJOR1              160
>> + #define SX8_MAJOR2              161
>> ++#define XVD_MAJOR               202
>> +
>> + #define SCSI_BLK_MAJOR(M) (                                             \
>> +                 (M) == SCSI_DISK0_MAJOR                                 \
>> +@@ -450,6 +451,8 @@ _device_probe_type (PedDevice* dev)
>> +         } else if (_is_dm_major(dev_major)) {
>> +                 dev->type = PED_DEVICE_DM;
>> + #endif
>> ++        } else if (dev_major == XVD_MAJOR && (dev_minor % 0x10 == 0)) {
>> ++                dev->type = PED_DEVICE_XVD;
>> +         } else {
>> +                 dev->type = PED_DEVICE_UNKNOWN;
>> +         }
>> +@@ -1152,6 +1155,11 @@ linux_new (const char* path)
>> +                 break;
>> + #endif
>> +
>> ++        case PED_DEVICE_XVD:
>> ++                if (!init_generic (dev, _("Xen Virtual Block Device")))
>> ++                        goto error_free_arch_specific;
>> ++                break;
>> ++
>> +         case PED_DEVICE_UNKNOWN:
>> +                 if (!init_generic (dev, _("Unknown")))
>> +                         goto error_free_arch_specific;
>> +diff -up parted-1.8.6/include/parted/device.h.xvd parted-1.8.6/include/parted/device.h
>> +--- parted-1.8.6/include/parted/device.h.xvd 2007-01-12 10:15:10.000000000 -0500
>> ++++ parted-1.8.6/include/parted/device.h     2007-08-07 14:07:13.000000000 -0400
>> +@@ -45,11 +45,11 @@ typedef enum {
>> +         PED_DEVICE_UBD          = 8,
>> +         PED_DEVICE_DASD         = 9,
>> +         PED_DEVICE_VIODASD      = 10,
>> +-        PED_DEVICE_SX8          = 11
>> ++        PED_DEVICE_SX8          = 11,
>> + #ifdef ENABLE_DEVICE_MAPPER
>> +-                                    ,
>> +-        PED_DEVICE_DM           = 12
>> ++        PED_DEVICE_DM           = 12,
>> + #endif
>> ++        PED_DEVICE_XVD          = 13
>> + } PedDeviceType;
>> +
>> + typedef struct _PedDevice PedDevice;
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch
>> new file mode 100644
>> index 0000000..536a20d
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devmapper-header1.patch
>> @@ -0,0 +1,13 @@
>> +diff -up parted-1.8.6/include/parted/device.h.devmapper parted-1.8.6/include/parted/device.h
>> +--- parted-1.8.6/include/parted/device.h.devmapper   2007-10-04 15:39:27.000000000 -0400
>> ++++ parted-1.8.6/include/parted/device.h     2007-10-04 15:40:11.000000000 -0400
>> +@@ -46,9 +46,7 @@ typedef enum {
>> +         PED_DEVICE_DASD         = 9,
>> +         PED_DEVICE_VIODASD      = 10,
>> +         PED_DEVICE_SX8          = 11,
>> +-#ifdef ENABLE_DEVICE_MAPPER
>> +         PED_DEVICE_DM           = 12,
>> +-#endif
>> +         PED_DEVICE_XVD          = 13
>> + } PedDeviceType;
>> +
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch
>> new file mode 100644
>> index 0000000..033f3f5
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.patch
>> @@ -0,0 +1,11 @@
>> +--- parted-1.8.6/parted/table.c      2010-11-02 13:37:16.256204798 +0900
>> ++++ parted-1.8.6/parted/table.c      2010-11-02 13:45:16.231266752 +0900
>> +@@ -43,7 +43,7 @@
>> + #       define wcslen strlen
>> + #       define wcswidth strnlen
>> + #       define wcscat strcat
>> +-#       define wcsdup strdup
>> ++/* #       define wcsdup strdup */
>> +         size_t strnlen (const char *, size_t);
>> + #endif
>> +
>> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch
>> new file mode 100644
>> index 0000000..777fe6a
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.patch
>> @@ -0,0 +1,26 @@
>> +From 4f4dfd5aabdaadd8f495e193ca8daed5a3a1782a Mon Sep 17 00:00:00 2001
>> +From: Li xin <lixin.fnst@cn.fujitsu.com>
>> +Date: Fri, 28 Nov 2014 02:49:19 +0900
>> +Subject: [PATCH] parted/ui.c : fix build error
>> +
>> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>> +---
>> + parted/ui.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/parted/ui.c b/parted/ui.c
>> +index 59cb98b..b583693 100644
>> +--- a/parted/ui.c
>> ++++ b/parted/ui.c
>> +@@ -1376,7 +1376,7 @@ init_ui ()
>> +
>> + #ifdef HAVE_LIBREADLINE
>> +         rl_initialize ();
>> +-        rl_attempted_completion_function = (CPPFunction*) complete_function;
>> ++        rl_attempted_completion_function = (rl_completion_func_t*) complete_function;
>> +         readline_state.in_readline = 0;
>> + #endif
>> +
>> +--
>> +1.8.4.2
>> +
>> diff --git a/meta-oe/recipes-extended/parted/parted_1.8.6.bb b/meta-oe/recipes-extended/parted/parted_1.8.6.bb
>> new file mode 100644
>> index 0000000..537978f
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/parted/parted_1.8.6.bb
>> @@ -0,0 +1,62 @@
>> +SUMMARY = "The GNU disk partition manipulation program"
>> +DESCRIPTION = "The GNU Parted program allows you to create, destroy, resize, move, \
>> +and copy hard disk partitions. Parted can be used for creating space \
>> +for new operating systems, reorganizing disk usage, and copying data \
>> +to new hard disks."
>> +HOMEPAGE = "http://www.gnu.org/software/parted"
>> +SECTION = "Applications/System"
>> +
>> +SRC_URI = "http://ftp.gnu.org/gnu/parted/parted-1.8.6.tar.bz2 \
>> +        file://1000parted-1.8.6-warnings1.patch \
>> +        file://1001parted-1.8.6-notransname1.patch \
>> +        file://1002parted-1.8.6-off-by-one1.patch \
>> +        file://1003parted-1.8.6-primary-boundary1.patch \
>> +        file://1004parted-1.8.6-xvd1.patch \
>> +        file://1005parted-1.8.6-devmapper-header1.patch \
>> +        file://7000no_effect_macro1.patch \
>> +           file://ui.c-fix-build-error.patch \
>> +        "
>> +
>> +SRC_URI[md5sum] = "03c967ae0e915e08da90605d68ba93d7"
>> +SRC_URI[sha256sum] = "82d94c9bb58cccd1eacfc5ff3a9331d179cc26d8fbe00c451e2c84feb6d23408"
>> +
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>> +
>> +inherit autotools gettext pkgconfig
>> +
>> +DEPENDS = "lvm2 readline"
>> +
>> +EXTRA_OECONF = "--enable-device-mapper \
>> +             --disable-selinux \
>> +             --disable-static \
>> +             --sbindir=${sbindir} \
>> +             --disable-Werror \
>> +             --disable-rpath \
>> +             "
>> +EXTRA_OEMAKE = "DESTDIR=${D}"
>> +
>> +do_configure_prepend() {
>> +     # ltmain.sh will set rpath to path on host.
>> +     for l in `find ${S} -name "ltmain\.sh"` ; do
>> +             sed -i -e 's/\$compile_rpath//g' \
>> +                    -e 's/\$finalize_rpath//g' ${l}
>> +     done
>> +
>> +     # FIXME: Some option may be needed by EXTRA_OECONF.
>> +     sed -i 's/ac_cv_func_malloc_0_nonnull=no/ac_cv_func_malloc_0_nonnull=yes/g' ${S}/configure
>> +     sed -i 's/ac_cv_func_calloc_0_nonnull=no/ac_cv_func_calloc_0_nonnull=yes/g' ${S}/configure
>> +     sed -i 's/ac_cv_func_memcmp_working=no/ac_cv_func_memcmp_working=yes/g' ${S}/configure
>> +     sed -i 's/ac_cv_func_realloc_0_nonnull=no/ac_cv_func_realloc_0_nonnull=yes/g' ${S}/configure
>> +}
>> +
>> +do_configure() {
>> +     oe_runconf
>> +}
>> +
>> +do_install_append() {
>> +     /bin/rm -rf ${D}/${libdir}/*.la
>> +     /bin/rm -rf ${D}/usr/share/info/dir
>> +     /bin/rm -fr ${D}/usr/bin
>> +}
>> +
>> --
>> 1.8.4.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

