Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2CEF77BF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 00:52:08 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t201so19816131wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 17:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wyfiZj1q1ovNbTHnWZ7F5NT70y3S8FIPUFfUyGXpSoY=;
	b=B+4PnovoGg56DeIiCpSl0e25YGqrY/mzAGO64/6wm4sOmT64va00aYC0/C4gy1mbW5
	Yq+nEXk15qCWtNzqSlOSyP4p+gyWLdOyKUZd8T51BzOzVh55Vy23tjxoKOc6ayGCvtvp
	0wrcIhIn/hI6vLn/mCLgi1pgvaqdf3eBrILMoq+jUuoHzD8WcQM7vRQteqDC3Y/V1G8L
	um2g7yvSDBrPa7qw1//yTadjLD09nuWgZcCxFGaMqxU94hx8cZSoA/uvnrK0aR/u+QLb
	oLqGSnm0jaRShEqWJo5kuy0DhPtp1svPwADMnNv5NYekBINL/rsPoZQ2aqIZdX95HQmz
	Fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wyfiZj1q1ovNbTHnWZ7F5NT70y3S8FIPUFfUyGXpSoY=;
	b=tu/KwCoLeoqwSUKbkruS+f4+nfI3KTDpxXk8Yui9CBwtnEq801OB9wLH+ZvzcasXKv
	+XXSlxFbBgIropua8v128hZxK2Lkov2x6hHMewo4L+VR0TdZYpSjHF7KXcqo8ZWCtE7M
	LKubB2lLCQv4NNS5/axvo903LzZ+PXptS6l4CXn2MpA3pb75dL8DGrbaZ2iXb0TUOQ8j
	nfWg681ZlPdT2xoDrxJmEr1Krl0euNuKewV4somzhvUIhLBpF/btwP+5US8roufIVyrE
	NxQgZwnjuD79uQXP/gPBs2oL8sCsopKL5R2OkZ5jjVFmwyAiIvVe7c0AgP3K/J8jYPsR
	P7bA==
X-Gm-Message-State: AHYfb5hf7o5N8JqXIrgXbf0vmSqGubbHUHQ4Hz0OhSkG7x6Vn2PWq3ie
	1tRL9u27NXKQ1wOCoO8sFnqoxYKuXg==
X-Received: by 10.80.218.3 with SMTP id z3mr6233689edj.228.1502239929282; Tue,
	08 Aug 2017 17:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 17:51:38 -0700 (PDT)
In-Reply-To: <a2ac19a34f5765b1ff7c3366d472af130a62f49e.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
	<a2ac19a34f5765b1ff7c3366d472af130a62f49e.1501142861.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 17:51:38 -0700
Message-ID: <CAMKF1spPfc=wk9Q==sTHnNq9x0D0tCYrQyDgbVsx+J5PfYp+Sw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/6] libblockdev: add recipe 2.10
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
X-List-Received-Date: Wed, 09 Aug 2017 00:52:09 -0000
Content-Type: text/plain; charset="UTF-8"

This fails to compile with clang

| ../../../git/src/utils/exec.c:357:25: error: missing field 'events'
initializer [-Werror,-Wmissing-field-initializers]
|     GPollFD fds[2] = {{0}, {0}};
|                         ^
| ../../../git/src/utils/exec.c:357:30: error: missing field 'events'
initializer [-Werror,-Wmissing-field-initializers]
|     GPollFD fds[2] = {{0}, {0}};
|                              ^
| 2 errors generated.


it does not like the old c90 like initializer

On Thu, Jul 27, 2017 at 1:44 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-fix-configure-and-compile-failures.patch  |  79 ++++
>  .../files/0002-remove-python2-support.patch        |  30 ++
>  ...emove-dmraid-while-compiling-with-with-dm.patch | 470 +++++++++++++++++++++
>  ...ix-compile-failure-against-musl-C-library.patch |  50 +++
>  .../libblockdev/libblockdev_2.10.bb                |  50 +++
>  5 files changed, 679 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
>
> diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
> new file mode 100644
> index 0000000..914ee99
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
> @@ -0,0 +1,79 @@
> +From 86686ccbf43c5d9e8c8dc97c66ba09e522050e5e Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 27 Jul 2017 10:06:24 +0800
> +Subject: [PATCH 1/3] fix configure and compile failures
> +
> +1. Fix do_configure failure
> +---------------------------
> +|Checking header volume_key/libvolume_key.h existence and usability.
> +../tmp/6tvtK.c:1:38: fatal error: volume_key/libvolume_key.h:
> +No such file or directory
> +| #include <volume_key/libvolume_key.h>
> +|Checking header dmraid/dmraid.h existence and usability.../tmp/
> +ktVJ6.c:1:27: fatal error: dmraid/dmraid.h: No such file or directory
> +| #include <dmraid/dmraid.h>
> +---------------------------
> +We explictly add volume_key and dmraid to DEPENDS, do not need
> +configure to test.
> +
> +2. Fix config.h not found
> +Add it to configure.ac
> +
> +3. Correct AC_DEFINE
> +...
> +autoheader: warning: missing template: LIBMOUNT_NEW_ERR_API
> +autoheader: Use AC_DEFINE([LIBMOUNT_NEW_ERR_API], [], [Description])
> +...
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac | 10 ++++------
> + 1 file changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0270c99..b7c7368 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -9,6 +9,8 @@ AC_DISABLE_STATIC
> + AM_INIT_AUTOMAKE([foreign -Wall -Werror -Wno-syntax -Wno-portability])
> + AC_CONFIG_MACRO_DIR([m4])
> +
> ++AC_CONFIG_HEADERS([config.h])
> ++
> + AM_PATH_PYTHON
> +
> + AM_PROG_AR
> +@@ -129,7 +131,6 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([UDEV], [libudev >= 216])
> + AS_IF([test "x$with_crypto" != "xno"],
> +       [LIBBLOCKDEV_PKG_CHECK_MODULES([CRYPTSETUP], [libcryptsetup >= 1.6.7])
> +        LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])
> +-       LIBBLOCKDEV_CHECK_HEADER([volume_key/libvolume_key.h], [$GLIB_CFLAGS $NSS_CFLAGS], [libvolume_key.h not available])
> +       ],
> +       [])
> +
> +@@ -137,10 +138,6 @@ AS_IF([test "x$with_dm" != "xno" -o "x$with_lvm" != "xno" -o "x$with_lvm_dbus" !
> +       [LIBBLOCKDEV_PKG_CHECK_MODULES([DEVMAPPER], [devmapper >= 1.02.93])],
> +       [])
> +
> +-AS_IF([test "x$with_dm" != "xno"],
> +-      [LIBBLOCKDEV_CHECK_HEADER([dmraid/dmraid.h], [], [dmraid.h not available])],
> +-      [])
> +-
> + AS_IF([test "x$with_kbd" != "xno"],
> +       [LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])],
> +       [])
> +@@ -154,7 +151,8 @@ AS_IF([test "x$with_fs" != "xno"],
> +       [LIBBLOCKDEV_PKG_CHECK_MODULES([MOUNT], [mount >= 2.23.0])
> +        # new versions of libmount has some new functions we can use
> +        AS_IF([$PKG_CONFIG --atleast-version=2.30.0 mount],
> +-             [AC_DEFINE([LIBMOUNT_NEW_ERR_API])], [])
> ++             [AC_DEFINE([LIBMOUNT_NEW_ERR_API], [1], [new versions of libmount has some new functions we can use])],
> ++             [])
> +
> +        LIBBLOCKDEV_PKG_CHECK_MODULES([BLKID], [blkid >= 2.23.0])
> +        # older versions of libblkid don't support BLKID_SUBLKS_BADCSUM so let's just
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch b/meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch
> new file mode 100644
> index 0000000..0719759
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch
> @@ -0,0 +1,30 @@
> +From 40dae7ea6450cb30f066da8443eabf063b5b0ad7 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 02:05:40 -0400
> +Subject: [PATCH 2/3] remove python2 support
> +
> +Only python3 is required.
> +
> +Upstream-Status: Inappropriate [wr-installer specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/python/gi/overrides/Makefile.am | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/src/python/gi/overrides/Makefile.am b/src/python/gi/overrides/Makefile.am
> +index a2927ac..6385502 100644
> +--- a/src/python/gi/overrides/Makefile.am
> ++++ b/src/python/gi/overrides/Makefile.am
> +@@ -1,8 +1,3 @@
> +-pylibdir = $(shell python -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
> +-
> +-overridesdir = $(pylibdir)/gi/overrides
> +-dist_overrides_DATA = BlockDev.py
> +-
> + if WITH_PYTHON3
> + py3libdir = $(shell python3 -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
> + py3overridesdir = $(py3libdir)/gi/overrides
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch b/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
> new file mode 100644
> index 0000000..3d9cb6d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
> @@ -0,0 +1,470 @@
> +From bda7c937ba544182a5cae2a9cf0c173e0ba268c9 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 27 Jul 2017 09:47:23 +0800
> +Subject: [PATCH 3/3] remove dmraid while compiling with --with-dm
> +
> +Fix the following failure:
> +
> +...
> +Perhaps you should add the directory containing `dmraid.pc'
> +to the PKG_CONFIG_PATH environment variable
> +No package 'dmraid' found
> +...
> +
> +...
> +../../../git/src/plugins/dm.c:24:10: fatal error: dmraid/dmraid.h: No
> +such file or directory
> + #include <dmraid/dmraid.h>
> +          ^~~~~~~~~~~~~~~~~
> +...
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/lib/plugin_apis/dm.api          |  41 -----
> + src/plugins/Makefile.am             |   2 +-
> + src/plugins/dm.c                    | 318 ------------------------------------
> + src/plugins/dm.h                    |   5 -
> + src/python/gi/overrides/BlockDev.py |   6 -
> + 5 files changed, 1 insertion(+), 371 deletions(-)
> +
> +diff --git a/src/lib/plugin_apis/dm.api b/src/lib/plugin_apis/dm.api
> +index a885bba..ec86b80 100644
> +--- a/src/lib/plugin_apis/dm.api
> ++++ b/src/lib/plugin_apis/dm.api
> +@@ -68,44 +68,3 @@ gchar* bd_dm_node_from_name (const gchar *map_name, GError **error);
> +  */
> + gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean active_only, GError **error);
> +
> +-/**
> +- * bd_dm_get_member_raid_sets:
> +- * @name: (allow-none): name of the member
> +- * @uuid: (allow-none): uuid of the member
> +- * @major: major number of the device or -1 if not specified
> +- * @minor: minor number of the device or -1 if not specified
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: (transfer full) (array zero-terminated=1): list of names of the RAID sets related to
> +- * the member or %NULL in case of error
> +- *
> +- * One of @name, @uuid or @major:@minor has to be given.
> +- */
> +-gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error);
> +-
> +-/**
> +- * bd_dm_activate_raid_set:
> +- * @name: name of the DM RAID set to activate
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: whether the RAID set @name was successfully activate or not
> +- */
> +-gboolean bd_dm_activate_raid_set (const gchar *name, GError **error);
> +-
> +-/**
> +- * bd_dm_deactivate_raid_set:
> +- * @name: name of the DM RAID set to deactivate
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: whether the RAID set @name was successfully deactivate or not
> +- */
> +-gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error);
> +-
> +-/**
> +- * bd_dm_get_raid_set_type:
> +- * @name: name of the DM RAID set to get the type of
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: string representation of the @name RAID set's type
> +- */
> +-gchar* bd_dm_get_raid_set_type (const gchar *name, GError **error);
> +diff --git a/src/plugins/Makefile.am b/src/plugins/Makefile.am
> +index 6c4038f..59dc5e3 100644
> +--- a/src/plugins/Makefile.am
> ++++ b/src/plugins/Makefile.am
> +@@ -76,7 +76,7 @@ endif
> +
> + if WITH_DM
> + libbd_dm_la_CFLAGS = $(GLIB_CFLAGS) $(DEVMAPPER_CFLAGS) $(UDEV_CFLAGS) -Wall -Wextra -Werror
> +-libbd_dm_la_LIBADD = $(GLIB_LIBS) $(DEVMAPPER_LIBS) $(UDEV_LIBS) -ldmraid ${builddir}/../utils/libbd_utils.la
> ++libbd_dm_la_LIBADD = $(GLIB_LIBS) $(DEVMAPPER_LIBS) $(UDEV_LIBS) ${builddir}/../utils/libbd_utils.la
> + libbd_dm_la_LDFLAGS = -L${srcdir}/../utils/ -version-info 2:0:0 -Wl,--no-undefined
> + # Dear author of libdmdraid, VERSION really is not a good name for an enum member!
> + libbd_dm_la_CPPFLAGS = -I${builddir}/../../include/ -UVERSION
> +diff --git a/src/plugins/dm.c b/src/plugins/dm.c
> +index 9cee742..fd7c7ba 100644
> +--- a/src/plugins/dm.c
> ++++ b/src/plugins/dm.c
> +@@ -21,16 +21,10 @@
> + #include <unistd.h>
> + #include <blockdev/utils.h>
> + #include <libdevmapper.h>
> +-#include <dmraid/dmraid.h>
> + #include <libudev.h>
> +
> + #include "dm.h"
> +
> +-/* macros taken from the pyblock/dmraid.h file plus one more*/
> +-#define for_each_raidset(_c, _n) list_for_each_entry(_n, LC_RS(_c), list)
> +-#define for_each_subset(_rs, _n) list_for_each_entry(_n, &(_rs)->sets, list)
> +-#define for_each_device(_rs, _d) list_for_each_entry(_d, &(_rs)->devs, devs)
> +-
> + /**
> +  * SECTION: dm
> +  * @short_description: plugin for basic operations with device mapper
> +@@ -286,315 +280,3 @@ gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean a
> +     return ret;
> + }
> +
> +-/**
> +- * init_dmraid_stack: (skip)
> +- *
> +- * Initializes the dmraid stack by creating the library context, discovering
> +- * devices, raid sets, etc.
> +- */
> +-static struct lib_context* init_dmraid_stack (GError **error) {
> +-    gint rc = 0;
> +-    gchar *argv[] = {"blockdev.dmraid", NULL};
> +-    struct lib_context *lc;
> +-
> +-    /* the code for this function was cherry-picked from the pyblock code */
> +-    /* XXX: do this all just once, store global lc and provide a reinit
> +-     *      function? */
> +-
> +-    /* initialize dmraid library context */
> +-    lc = libdmraid_init (1, (gchar **)argv);
> +-
> +-    rc = discover_devices (lc, NULL);
> +-    if (!rc) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_FAIL,
> +-                     "Failed to discover devices");
> +-        libdmraid_exit (lc);
> +-        return NULL;
> +-    }
> +-    discover_raid_devices (lc, NULL);
> +-
> +-    if (!count_devices (lc, RAID)) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_NO_DEVS,
> +-                     "No RAIDs discovered");
> +-        libdmraid_exit (lc);
> +-        return NULL;
> +-    }
> +-
> +-    argv[0] = NULL;
> +-    if (!group_set (lc, argv)) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_FAIL,
> +-                     "Failed to group_set");
> +-        libdmraid_exit (lc);
> +-        return NULL;
> +-    }
> +-
> +-    return lc;
> +-}
> +-
> +-/**
> +- * raid_dev_matches_spec: (skip)
> +- *
> +- * Returns: whether the device specified by @sysname matches the spec given by @name,
> +- *          @uuid, @major and @minor
> +- */
> +-static gboolean raid_dev_matches_spec (struct raid_dev *raid_dev, const gchar *name, const gchar *uuid, gint major, gint minor) {
> +-    gchar const *dev_name = NULL;
> +-    gchar const *dev_uuid;
> +-    gchar const *major_str;
> +-    gchar const *minor_str;
> +-    struct udev *context;
> +-    struct udev_device *device;
> +-    gboolean ret = TRUE;
> +-
> +-    /* find the second '/' to get name (the rest of the string) */
> +-    dev_name = strchr (raid_dev->di->path, '/');
> +-    if (dev_name && strlen (dev_name) > 1) {
> +-        dev_name++;
> +-        dev_name = strchr (dev_name, '/');
> +-    }
> +-    if (dev_name && strlen (dev_name) > 1) {
> +-        dev_name++;
> +-    }
> +-    else
> +-        dev_name = NULL;
> +-
> +-    /* if we don't have the name, we cannot check any match */
> +-    g_return_val_if_fail (dev_name, FALSE);
> +-
> +-    if (name && strcmp (dev_name, name) != 0) {
> +-        return FALSE;
> +-    }
> +-
> +-    context = udev_new ();
> +-    device = udev_device_new_from_subsystem_sysname (context, "block", dev_name);
> +-    dev_uuid = udev_device_get_property_value (device, "UUID");
> +-    major_str = udev_device_get_property_value (device, "MAJOR");
> +-    minor_str = udev_device_get_property_value (device, "MINOR");
> +-
> +-    if (uuid && (g_strcmp0 (uuid, "") != 0) && (g_strcmp0 (uuid, dev_uuid) != 0))
> +-        ret = FALSE;
> +-
> +-    if (major >= 0 && (atoi (major_str) != major))
> +-        ret = FALSE;
> +-
> +-    if (minor >= 0 && (atoi (minor_str) != minor))
> +-        ret = FALSE;
> +-
> +-    udev_device_unref (device);
> +-    udev_unref (context);
> +-
> +-    return ret;
> +-}
> +-
> +-/**
> +- * find_raid_sets_for_dev: (skip)
> +- */
> +-static void find_raid_sets_for_dev (const gchar *name, const gchar *uuid, gint major, gint minor, struct lib_context *lc, struct raid_set *rs, GPtrArray *ret_sets) {
> +-    struct raid_set *subset;
> +-    struct raid_dev *dev;
> +-
> +-    if (T_GROUP(rs) || !list_empty(&(rs->sets))) {
> +-        for_each_subset (rs, subset)
> +-            find_raid_sets_for_dev (name, uuid, major, minor, lc, subset, ret_sets);
> +-    } else {
> +-        for_each_device (rs, dev) {
> +-            if (raid_dev_matches_spec (dev, name, uuid, major, minor))
> +-                g_ptr_array_add (ret_sets, g_strdup (rs->name));
> +-        }
> +-    }
> +-}
> +-
> +-/**
> +- * bd_dm_get_member_raid_sets:
> +- * @name: (allow-none): name of the member
> +- * @uuid: (allow-none): uuid of the member
> +- * @major: major number of the device or -1 if not specified
> +- * @minor: minor number of the device or -1 if not specified
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: (transfer full) (array zero-terminated=1): list of names of the RAID sets related to
> +- * the member or %NULL in case of error
> +- *
> +- * One of @name, @uuid or @major:@minor has to be given.
> +- */
> +-gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error) {
> +-    guint64 i = 0;
> +-    struct lib_context *lc = NULL;
> +-    struct raid_set *rs = NULL;
> +-    GPtrArray *ret_sets = g_ptr_array_new ();
> +-    gchar **ret = NULL;
> +-
> +-    lc = init_dmraid_stack (error);
> +-    if (!lc)
> +-        /* error is already populated */
> +-        return NULL;
> +-
> +-    for_each_raidset (lc, rs) {
> +-        find_raid_sets_for_dev (name, uuid, major, minor, lc, rs, ret_sets);
> +-    }
> +-
> +-    /* now create the return value -- NULL-terminated array of strings */
> +-    ret = g_new0 (gchar*, ret_sets->len + 1);
> +-    for (i=0; i < ret_sets->len; i++)
> +-        ret[i] = (gchar*) g_ptr_array_index (ret_sets, i);
> +-    ret[i] = NULL;
> +-
> +-    g_ptr_array_free (ret_sets, FALSE);
> +-
> +-    libdmraid_exit (lc);
> +-    return ret;
> +-}
> +-
> +-/**
> +- * find_in_raid_sets: (skip)
> +- *
> +- * Runs @eval_fn with @data on each set (traversing recursively) and returns the
> +- * first RAID set that @eval_fn returns. Thus the @eval_fn should return %NULL
> +- * on all RAID sets that don't fulfill the search criteria.
> +- */
> +-static struct raid_set* find_in_raid_sets (struct raid_set *rs, RSEvalFunc eval_fn, gpointer data) {
> +-    struct raid_set *subset = NULL;
> +-    struct raid_set *ret = NULL;
> +-
> +-    ret = eval_fn (rs, data);
> +-    if (ret)
> +-        return ret;
> +-
> +-    if (T_GROUP(rs) || !list_empty(&(rs->sets))) {
> +-        for_each_subset (rs, subset) {
> +-            ret = find_in_raid_sets (subset, eval_fn, data);
> +-            if (ret)
> +-                return ret;
> +-        }
> +-    }
> +-
> +-    return ret;
> +-}
> +-
> +-static struct raid_set* rs_matches_name (struct raid_set *rs, gpointer *name_data) {
> +-    gchar *name = (gchar*) name_data;
> +-
> +-    if (g_strcmp0 (rs->name, name) == 0)
> +-        return rs;
> +-    else
> +-        return NULL;
> +-}
> +-
> +-static gboolean change_set_by_name (const gchar *name, enum activate_type action, GError **error) {
> +-    gint rc = 0;
> +-    struct lib_context *lc;
> +-    struct raid_set *iter_rs;
> +-    struct raid_set *match_rs = NULL;
> +-
> +-    lc = init_dmraid_stack (error);
> +-    if (!lc)
> +-        /* error is already populated */
> +-        return FALSE;
> +-
> +-    for_each_raidset (lc, iter_rs) {
> +-        match_rs = find_in_raid_sets (iter_rs, (RSEvalFunc)rs_matches_name, (gchar *)name);
> +-        if (match_rs)
> +-            break;
> +-    }
> +-
> +-    if (!match_rs) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_NO_EXIST,
> +-                     "RAID set %s doesn't exist", name);
> +-        libdmraid_exit (lc);
> +-        return FALSE;
> +-    }
> +-
> +-    rc = change_set (lc, action, match_rs);
> +-    if (!rc) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_FAIL,
> +-                     "Failed to activate the RAID set '%s'", name);
> +-        libdmraid_exit (lc);
> +-        return FALSE;
> +-    }
> +-
> +-    libdmraid_exit (lc);
> +-    return TRUE;
> +-}
> +-
> +-/**
> +- * bd_dm_activate_raid_set:
> +- * @name: name of the DM RAID set to activate
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: whether the RAID set @name was successfully activate or not
> +- */
> +-gboolean bd_dm_activate_raid_set (const gchar *name, GError **error) {
> +-    guint64 progress_id = 0;
> +-    gchar *msg = NULL;
> +-    gboolean ret = FALSE;
> +-
> +-    msg = g_strdup_printf ("Activating DM RAID set '%s'", name);
> +-    progress_id = bd_utils_report_started (msg);
> +-    g_free (msg);
> +-    ret = change_set_by_name (name, A_ACTIVATE, error);
> +-    bd_utils_report_finished (progress_id, "Completed");
> +-    return ret;
> +-}
> +-
> +-/**
> +- * bd_dm_deactivate_raid_set:
> +- * @name: name of the DM RAID set to deactivate
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: whether the RAID set @name was successfully deactivate or not
> +- */
> +-gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error) {
> +-    guint64 progress_id = 0;
> +-    gchar *msg = NULL;
> +-    gboolean ret = FALSE;
> +-
> +-    msg = g_strdup_printf ("Deactivating DM RAID set '%s'", name);
> +-    progress_id = bd_utils_report_started (msg);
> +-    g_free (msg);
> +-    ret = change_set_by_name (name, A_DEACTIVATE, error);
> +-    bd_utils_report_finished (progress_id, "Completed");
> +-    return ret;
> +-}
> +-
> +-/**
> +- * bd_dm_get_raid_set_type:
> +- * @name: name of the DM RAID set to get the type of
> +- * @error: (out): variable to store error (if any)
> +- *
> +- * Returns: string representation of the @name RAID set's type
> +- */
> +-gchar* bd_dm_get_raid_set_type (const gchar *name, GError **error) {
> +-    struct lib_context *lc;
> +-    struct raid_set *iter_rs;
> +-    struct raid_set *match_rs = NULL;
> +-    const gchar *type = NULL;
> +-
> +-    lc = init_dmraid_stack (error);
> +-    if (!lc)
> +-        /* error is already populated */
> +-        return NULL;
> +-
> +-    for_each_raidset (lc, iter_rs) {
> +-        match_rs = find_in_raid_sets (iter_rs, (RSEvalFunc)rs_matches_name, (gchar *)name);
> +-        if (match_rs)
> +-            break;
> +-    }
> +-
> +-    if (!match_rs) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_NO_EXIST,
> +-                     "RAID set %s doesn't exist", name);
> +-        libdmraid_exit (lc);
> +-        return NULL;
> +-    }
> +-
> +-    type = get_set_type (lc, match_rs);
> +-    if (!type) {
> +-        g_set_error (error, BD_DM_ERROR, BD_DM_ERROR_RAID_FAIL,
> +-                     "Failed to get RAID set's type");
> +-        libdmraid_exit (lc);
> +-        return NULL;
> +-    }
> +-
> +-    libdmraid_exit (lc);
> +-    return g_strdup (type);
> +-}
> +diff --git a/src/plugins/dm.h b/src/plugins/dm.h
> +index 859fb80..80acd49 100644
> +--- a/src/plugins/dm.h
> ++++ b/src/plugins/dm.h
> +@@ -1,5 +1,4 @@
> + #include <glib.h>
> +-#include <dmraid/dmraid.h>
> +
> + #ifndef BD_DM
> + #define BD_DM
> +@@ -35,9 +34,5 @@ gboolean bd_dm_remove (const gchar *map_name, GError **error);
> + gchar* bd_dm_name_from_node (const gchar *dm_node, GError **error);
> + gchar* bd_dm_node_from_name (const gchar *map_name, GError **error);
> + gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean active_only, GError **error);
> +-gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error);
> +-gboolean bd_dm_activate_raid_set (const gchar *name, GError **error);
> +-gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error);
> +-gchar* bd_dm_get_raid_set_type (const gchar *name, GError **error);
> +
> + #endif  /* BD_DM */
> +diff --git a/src/python/gi/overrides/BlockDev.py b/src/python/gi/overrides/BlockDev.py
> +index fb3ffb4..eed0a38 100644
> +--- a/src/python/gi/overrides/BlockDev.py
> ++++ b/src/python/gi/overrides/BlockDev.py
> +@@ -233,12 +233,6 @@ def dm_create_linear(map_name, device, length, uuid=None):
> +     return _dm_create_linear(map_name, device, length, uuid)
> + __all__.append("dm_create_linear")
> +
> +-_dm_get_member_raid_sets = BlockDev.dm_get_member_raid_sets
> +-@override(BlockDev.dm_get_member_raid_sets)
> +-def dm_get_member_raid_sets(name=None, uuid=None, major=-1, minor=-1):
> +-    return _dm_get_member_raid_sets(name, uuid, major, minor)
> +-__all__.append("dm_get_member_raid_sets")
> +-
> +
> + _loop_setup = BlockDev.loop_setup
> + @override(BlockDev.loop_setup)
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
> new file mode 100644
> index 0000000..f18b569
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
> @@ -0,0 +1,50 @@
> +From 59fbd57acd1df25b1972a131dc6a77a4fe147729 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 27 Jul 2017 10:45:02 +0800
> +Subject: [PATCH] fix compile failure against musl C library
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/plugins/crypto.c | 2 +-
> + src/plugins/part.c   | 3 ++-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
> +index 8fbce4f..66e11e5 100644
> +--- a/src/plugins/crypto.c
> ++++ b/src/plugins/crypto.c
> +@@ -22,7 +22,7 @@
> + #include <libcryptsetup.h>
> + #include <nss.h>
> + #include <volume_key/libvolume_key.h>
> +-#include <sys/fcntl.h>
> ++#include <fcntl.h>
> + #include <sys/ioctl.h>
> + #include <linux/random.h>
> + #include <locale.h>
> +diff --git a/src/plugins/part.c b/src/plugins/part.c
> +index 12d2ef7..3afe297 100644
> +--- a/src/plugins/part.c
> ++++ b/src/plugins/part.c
> +@@ -25,6 +25,7 @@
> + #include <inttypes.h>
> + #include <unistd.h>
> + #include <sys/file.h>
> ++#include <fcntl.h>
> + #include <blockdev/utils.h>
> + #include <part_err.h>
> +
> +@@ -1224,7 +1225,7 @@ static gboolean set_gpt_flags (const gchar *device, int part_num, guint64 flags,
> +         real_flags |= 0x4000000000000000; /* 1 << 62 */
> +     if (flags & BD_PART_FLAG_GPT_NO_AUTOMOUNT)
> +         real_flags |= 0x8000000000000000; /* 1 << 63 */
> +-    mask_str = g_strdup_printf ("%.16"__PRI64_PREFIX"x", real_flags);
> ++    mask_str = g_strdup_printf ("%.16"__PRI64"x", real_flags);
> +
> +     args[2] = g_strdup_printf ("%d:=:%s", part_num, mask_str);
> +     g_free (mask_str);
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
> new file mode 100644
> index 0000000..4806dcd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION = "libblockdev is a C library supporting GObject introspection for manipulation of \
> +block devices. It has a plugin-based architecture where each technology (like \
> +LVM, Btrfs, MD RAID, Swap,...) is implemented in a separate plugin, possibly \
> +with multiple implementations (e.g. using LVM CLI or the new LVM DBus API)."
> +HOMEPAGE = "http://rhinstaller.github.io/libblockdev/"
> +LICENSE = "LGPLv2+"
> +SECTION = "devel/lib"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
> +
> +SRCREV = "c1dda45001542edd7d7f1ffc6451c5a74623f805"
> +SRC_URI = "git://github.com/rhinstaller/libblockdev;branch=master \
> +           file://0001-fix-configure-and-compile-failures.patch \
> +           file://0002-remove-python2-support.patch \
> +           file://0003-remove-dmraid-while-compiling-with-with-dm.patch \
> +"
> +SRC_URI_append_libc-musl = " \
> +           file://0004-fix-compile-failure-against-musl-C-library.patch \
> +"
> +
> +inherit autotools python3native gobject-introspection
> +
> +DEPENDS += " \
> +    cryptsetup \
> +    nss \
> +    volume-key \
> +    libbytesize \
> +    btrfs-tools \
> +"
> +RDEPENDS_${PN} += " \
> +    lvm2 \
> +"
> +
> +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
> +
> +PACKAGECONFIG ??= "python3 lvm dm kmod parted fs"
> +PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
> +PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools"
> +PACKAGECONFIG[dm] = "--with-dm, --without-dm"
> +PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
> +PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
> +PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
> +PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
> +
> +export STAGING_INCDIR
> +export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

