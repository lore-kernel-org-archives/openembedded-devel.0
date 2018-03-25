Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFB3785B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:41 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t6so10735758wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oONJy9AXATe8E+gizaStIo9CTwIXTPMT4FZo7byrBjQ=;
	b=kP3PI0CpLqOV0OGxjC1809slblN5CjFVTXmdx2vbyWuEM2OA5fjr8DTOOxAblrGtW5
	WGaniJHv6z0S9RsfclwoPZIczWNckVugL5M54LvDgo/Mlc7JDS+lilK181RZHOoRYPAr
	maaUY8gBD/kffcplvV6OHR1fXg6qDtf8y7jEHo0T3reKEMWWSI7jJNH4yH5W1Wjf5fxN
	FNgygbl4pnZLKrjeGe/P2UwbhwLCkMdjsf0ZZl1mi/84OSY6E0c4toiB900vxNdXK6cZ
	rETcU0gXpygOy2gy1FFuQxXiHwi99uzdPCttTkDcyq+S94NMaQ8xIJ4b5NNOi7Xyo68w
	sFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oONJy9AXATe8E+gizaStIo9CTwIXTPMT4FZo7byrBjQ=;
	b=BqByuyKqICMeI/RsHgP68q9Yb4dMU36QqD7INCi7N4gW9oQToZJaaIfeCAwFQ2IdJd
	Cn7aXZ4cmtskAspSs0NxM4jODLIXZYnBCEYC22qhOY+Ut48n3d/DHEPNn1VViCP3b5Jp
	lCScEUbvwAvD/4DF43uQTdlujrud7+ZdepweQAmmrDjLmnmIm0UwGbZw3VzU+DrcC9Tz
	BZUlLQmhIcW4sEar7FfgTwPZRPyY5DvG3hEq8QT1jlf2f0nYWomBD10I3HYluhjIjTbc
	w+/ahkqg602kp0v9dAETyskA9E+f2TUeZ3gBVHKLvIficMoF/qOPGlVwiC5+jlU1Co0L
	Z04Q==
X-Gm-Message-State: AElRT7HthpNOFGtIcM4LB9Ampvv4zYA02tH7T4nZcK+TMDzXx8nZy5Mw
	LX2Z+E5PVddgIZfzH+6sCLZ9Fw==
X-Google-Smtp-Source: AG47ELtBY7XYkAWidUkSd60JfVXyZ7hVb1UHC5yhEUCRFzGJUEFZZykHs76NFIdPs7NNS70JAOh9pQ==
X-Received: by 10.28.236.145 with SMTP id h17mr12041632wmi.43.1521981341567;
	Sun, 25 Mar 2018 05:35:41 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:10 +0200
Message-Id: <20180325123520.16452-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/20] libblockdev: update 2.10 -> 2.16
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I gave my best to rework patches:

* 0005-fix-a-clang-compiling-issue.patch: This was a bit challenging.
  Because of I do not use clang I cannot test and confirm that no new breakers
  were introduced.
* 0004-fix-compile-failure-against-musl-C-library.patch: Just tested to apply
  properly.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-fix-configure-and-compile-failures.patch  | 14 ++---
 ...emove-dmraid-while-compiling-with-with-dm.patch | 66 ++++++++++++++--------
 ...ix-compile-failure-against-musl-C-library.patch | 12 ++--
 .../files/0005-fix-a-clang-compiling-issue.patch   | 36 ++++++------
 .../{libblockdev_2.10.bb => libblockdev_2.16.bb}   | 30 +++++-----
 5 files changed, 90 insertions(+), 68 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.10.bb => libblockdev_2.16.bb} (73%)

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
index 914ee99db..745883ebe 100644
--- a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
+++ b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
@@ -33,7 +33,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0270c99..b7c7368 100644
+index d41a307..b036e04 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -9,6 +9,8 @@ AC_DISABLE_STATIC
@@ -45,7 +45,7 @@ index 0270c99..b7c7368 100644
  AM_PATH_PYTHON
  
  AM_PROG_AR
-@@ -129,7 +131,6 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([UDEV], [libudev >= 216])
+@@ -154,7 +156,6 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])
  AS_IF([test "x$with_crypto" != "xno"],
        [LIBBLOCKDEV_PKG_CHECK_MODULES([CRYPTSETUP], [libcryptsetup >= 1.6.7])
         LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])
@@ -53,7 +53,7 @@ index 0270c99..b7c7368 100644
        ],
        [])
  
-@@ -137,10 +138,6 @@ AS_IF([test "x$with_dm" != "xno" -o "x$with_lvm" != "xno" -o "x$with_lvm_dbus" !
+@@ -162,10 +163,6 @@ AS_IF([test "x$with_dm" != "xno" -o "x$with_lvm" != "xno" -o "x$with_lvm_dbus" !
        [LIBBLOCKDEV_PKG_CHECK_MODULES([DEVMAPPER], [devmapper >= 1.02.93])],
        [])
  
@@ -61,10 +61,10 @@ index 0270c99..b7c7368 100644
 -      [LIBBLOCKDEV_CHECK_HEADER([dmraid/dmraid.h], [], [dmraid.h not available])],
 -      [])
 -
- AS_IF([test "x$with_kbd" != "xno"],
-       [LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])],
+ AS_IF([test "x$with_part" != "xno" -o "x$with_fs" != "xno"],
+       [LIBBLOCKDEV_PKG_CHECK_MODULES([PARTED], [libparted >= 3.1])]
        [])
-@@ -154,7 +151,8 @@ AS_IF([test "x$with_fs" != "xno"],
+@@ -174,7 +171,8 @@ AS_IF([test "x$with_fs" != "xno"],
        [LIBBLOCKDEV_PKG_CHECK_MODULES([MOUNT], [mount >= 2.23.0])
         # new versions of libmount has some new functions we can use
         AS_IF([$PKG_CONFIG --atleast-version=2.30.0 mount],
@@ -75,5 +75,5 @@ index 0270c99..b7c7368 100644
         LIBBLOCKDEV_PKG_CHECK_MODULES([BLKID], [blkid >= 2.23.0])
         # older versions of libblkid don't support BLKID_SUBLKS_BADCSUM so let's just
 -- 
-1.8.3.1
+2.14.3
 
diff --git a/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch b/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
index 3d9cb6d01..ac5b5e2be 100644
--- a/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
+++ b/meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
@@ -22,21 +22,22 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/lib/plugin_apis/dm.api          |  41 -----
+ src/lib/plugin_apis/dm.api          |  50 ------
  src/plugins/Makefile.am             |   2 +-
- src/plugins/dm.c                    | 318 ------------------------------------
+ src/plugins/dm.c                    | 330 ------------------------------------
  src/plugins/dm.h                    |   5 -
  src/python/gi/overrides/BlockDev.py |   6 -
- 5 files changed, 1 insertion(+), 371 deletions(-)
+ 5 files changed, 1 insertion(+), 392 deletions(-)
 
 diff --git a/src/lib/plugin_apis/dm.api b/src/lib/plugin_apis/dm.api
-index a885bba..ec86b80 100644
+index 04fd8d8..5d30b6a 100644
 --- a/src/lib/plugin_apis/dm.api
 +++ b/src/lib/plugin_apis/dm.api
-@@ -68,44 +68,3 @@ gchar* bd_dm_node_from_name (const gchar *map_name, GError **error);
+@@ -111,53 +111,3 @@ gchar* bd_dm_get_subsystem_from_name (const gchar *device_name, GError **error);
+  * Tech category: %BD_DM_TECH_MAP-%BD_DM_TECH_MODE_QUERY
   */
  gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean active_only, GError **error);
- 
+-
 -/**
 - * bd_dm_get_member_raid_sets:
 - * @name: (allow-none): name of the member
@@ -49,6 +50,8 @@ index a885bba..ec86b80 100644
 - * the member or %NULL in case of error
 - *
 - * One of @name, @uuid or @major:@minor has to be given.
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_MODE_QUERY
 - */
 -gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error);
 -
@@ -58,6 +61,8 @@ index a885bba..ec86b80 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: whether the RAID set @name was successfully activate or not
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_CREATE_ACTIVATE
 - */
 -gboolean bd_dm_activate_raid_set (const gchar *name, GError **error);
 -
@@ -67,6 +72,8 @@ index a885bba..ec86b80 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: whether the RAID set @name was successfully deactivate or not
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_REMOVE_DEACTIVATE
 - */
 -gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error);
 -
@@ -76,13 +83,15 @@ index a885bba..ec86b80 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: string representation of the @name RAID set's type
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_QUERY
 - */
 -gchar* bd_dm_get_raid_set_type (const gchar *name, GError **error);
 diff --git a/src/plugins/Makefile.am b/src/plugins/Makefile.am
-index 6c4038f..59dc5e3 100644
+index b69c8f7..7575f4a 100644
 --- a/src/plugins/Makefile.am
 +++ b/src/plugins/Makefile.am
-@@ -76,7 +76,7 @@ endif
+@@ -75,7 +75,7 @@ endif
  
  if WITH_DM
  libbd_dm_la_CFLAGS = $(GLIB_CFLAGS) $(DEVMAPPER_CFLAGS) $(UDEV_CFLAGS) -Wall -Wextra -Werror
@@ -92,10 +101,10 @@ index 6c4038f..59dc5e3 100644
  # Dear author of libdmdraid, VERSION really is not a good name for an enum member!
  libbd_dm_la_CPPFLAGS = -I${builddir}/../../include/ -UVERSION
 diff --git a/src/plugins/dm.c b/src/plugins/dm.c
-index 9cee742..fd7c7ba 100644
+index 0e5466c..31ebe96 100644
 --- a/src/plugins/dm.c
 +++ b/src/plugins/dm.c
-@@ -21,16 +21,10 @@
+@@ -21,17 +21,11 @@
  #include <unistd.h>
  #include <blockdev/utils.h>
  #include <libdevmapper.h>
@@ -103,6 +112,7 @@ index 9cee742..fd7c7ba 100644
  #include <libudev.h>
  
  #include "dm.h"
+ #include "check_deps.h"
  
 -/* macros taken from the pyblock/dmraid.h file plus one more*/
 -#define for_each_raidset(_c, _n) list_for_each_entry(_n, LC_RS(_c), list)
@@ -112,10 +122,11 @@ index 9cee742..fd7c7ba 100644
  /**
   * SECTION: dm
   * @short_description: plugin for basic operations with device mapper
-@@ -286,315 +280,3 @@ gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean a
+@@ -380,327 +374,3 @@ gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean a
+ 
      return ret;
  }
- 
+-
 -/**
 - * init_dmraid_stack: (skip)
 - *
@@ -191,6 +202,9 @@ index 9cee742..fd7c7ba 100644
 -    /* if we don't have the name, we cannot check any match */
 -    g_return_val_if_fail (dev_name, FALSE);
 -
+-    /* g_return_val_if_fail above checks value of dev_name and returns FALSE if
+-     * it is NULL so we don't need to check it here */
+-    /* coverity[var_deref_model] */
 -    if (name && strcmp (dev_name, name) != 0) {
 -        return FALSE;
 -    }
@@ -220,8 +234,8 @@ index 9cee742..fd7c7ba 100644
 - * find_raid_sets_for_dev: (skip)
 - */
 -static void find_raid_sets_for_dev (const gchar *name, const gchar *uuid, gint major, gint minor, struct lib_context *lc, struct raid_set *rs, GPtrArray *ret_sets) {
--    struct raid_set *subset;
--    struct raid_dev *dev;
+-    struct raid_set *subset = NULL;
+-    struct raid_dev *dev = NULL;
 -
 -    if (T_GROUP(rs) || !list_empty(&(rs->sets))) {
 -        for_each_subset (rs, subset)
@@ -246,6 +260,8 @@ index 9cee742..fd7c7ba 100644
 - * the member or %NULL in case of error
 - *
 - * One of @name, @uuid or @major:@minor has to be given.
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_MODE_QUERY
 - */
 -gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error) {
 -    guint64 i = 0;
@@ -312,8 +328,8 @@ index 9cee742..fd7c7ba 100644
 -
 -static gboolean change_set_by_name (const gchar *name, enum activate_type action, GError **error) {
 -    gint rc = 0;
--    struct lib_context *lc;
--    struct raid_set *iter_rs;
+-    struct lib_context *lc = NULL;
+-    struct raid_set *iter_rs = NULL;
 -    struct raid_set *match_rs = NULL;
 -
 -    lc = init_dmraid_stack (error);
@@ -352,6 +368,8 @@ index 9cee742..fd7c7ba 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: whether the RAID set @name was successfully activate or not
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_CREATE_ACTIVATE
 - */
 -gboolean bd_dm_activate_raid_set (const gchar *name, GError **error) {
 -    guint64 progress_id = 0;
@@ -372,6 +390,8 @@ index 9cee742..fd7c7ba 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: whether the RAID set @name was successfully deactivate or not
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_REMOVE_DEACTIVATE
 - */
 -gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error) {
 -    guint64 progress_id = 0;
@@ -392,10 +412,12 @@ index 9cee742..fd7c7ba 100644
 - * @error: (out): variable to store error (if any)
 - *
 - * Returns: string representation of the @name RAID set's type
+- *
+- * Tech category: %BD_DM_TECH_RAID-%BD_DM_TECH_QUERY
 - */
 -gchar* bd_dm_get_raid_set_type (const gchar *name, GError **error) {
--    struct lib_context *lc;
--    struct raid_set *iter_rs;
+-    struct lib_context *lc = NULL;
+-    struct raid_set *iter_rs = NULL;
 -    struct raid_set *match_rs = NULL;
 -    const gchar *type = NULL;
 -
@@ -429,7 +451,7 @@ index 9cee742..fd7c7ba 100644
 -    return g_strdup (type);
 -}
 diff --git a/src/plugins/dm.h b/src/plugins/dm.h
-index 859fb80..80acd49 100644
+index 0dce6ac..1ee3788 100644
 --- a/src/plugins/dm.h
 +++ b/src/plugins/dm.h
 @@ -1,5 +1,4 @@
@@ -438,10 +460,10 @@ index 859fb80..80acd49 100644
  
  #ifndef BD_DM
  #define BD_DM
-@@ -35,9 +34,5 @@ gboolean bd_dm_remove (const gchar *map_name, GError **error);
+@@ -48,9 +47,5 @@ gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean a
  gchar* bd_dm_name_from_node (const gchar *dm_node, GError **error);
  gchar* bd_dm_node_from_name (const gchar *map_name, GError **error);
- gboolean bd_dm_map_exists (const gchar *map_name, gboolean live_only, gboolean active_only, GError **error);
+ gchar* bd_dm_get_subsystem_from_name (const gchar *device_name, GError **error);
 -gchar** bd_dm_get_member_raid_sets (const gchar *name, const gchar *uuid, gint major, gint minor, GError **error);
 -gboolean bd_dm_activate_raid_set (const gchar *name, GError **error);
 -gboolean bd_dm_deactivate_raid_set (const gchar *name, GError **error);
@@ -466,5 +488,5 @@ index fb3ffb4..eed0a38 100644
  _loop_setup = BlockDev.loop_setup
  @override(BlockDev.loop_setup)
 -- 
-1.8.3.1
+2.14.3
 
diff --git a/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
index f18b56928..0b5b80912 100644
--- a/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
+++ b/meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index 8fbce4f..66e11e5 100644
+index b961471..2d3d251 100644
 --- a/src/plugins/crypto.c
 +++ b/src/plugins/crypto.c
 @@ -22,7 +22,7 @@
@@ -25,7 +25,7 @@ index 8fbce4f..66e11e5 100644
  #include <linux/random.h>
  #include <locale.h>
 diff --git a/src/plugins/part.c b/src/plugins/part.c
-index 12d2ef7..3afe297 100644
+index 6b2a690..ab490d9 100644
 --- a/src/plugins/part.c
 +++ b/src/plugins/part.c
 @@ -25,6 +25,7 @@
@@ -33,10 +33,10 @@ index 12d2ef7..3afe297 100644
  #include <unistd.h>
  #include <sys/file.h>
 +#include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
  #include <blockdev/utils.h>
- #include <part_err.h>
- 
-@@ -1224,7 +1225,7 @@ static gboolean set_gpt_flags (const gchar *device, int part_num, guint64 flags,
+@@ -1354,7 +1355,7 @@ static gboolean set_gpt_flags (const gchar *device, int part_num, guint64 flags,
          real_flags |= 0x4000000000000000; /* 1 << 62 */
      if (flags & BD_PART_FLAG_GPT_NO_AUTOMOUNT)
          real_flags |= 0x8000000000000000; /* 1 << 63 */
@@ -46,5 +46,5 @@ index 12d2ef7..3afe297 100644
      args[2] = g_strdup_printf ("%d:=:%s", part_num, mask_str);
      g_free (mask_str);
 -- 
-1.8.3.1
+2.14.3
 
diff --git a/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
index 381893608..b214f0b05 100644
--- a/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
+++ b/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
@@ -19,17 +19,17 @@ Upstream-Status: Submitted [https://github.com/storaged-project/libblockdev/pull
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/plugins/crypto.c | 6 +++---
- src/plugins/fs.c     | 4 ++--
- src/plugins/part.c   | 4 ++--
- src/utils/exec.c     | 2 +-
+ src/plugins/crypto.c  | 6 +++---
+ src/plugins/fs/vfat.c | 4 ++--
+ src/plugins/part.c    | 4 ++--
+ src/utils/exec.c      | 2 +-
  4 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index 8fbce4f..7ee7cdc 100644
+index 563093e..b961471 100644
 --- a/src/plugins/crypto.c
 +++ b/src/plugins/crypto.c
-@@ -881,7 +881,7 @@ gboolean bd_crypto_tc_open (const gchar *device, const gchar *name, const guint8
+@@ -970,7 +970,7 @@ gboolean bd_crypto_tc_open (const gchar *device, const gchar *name, const guint8
      gint ret = 0;
      guint64 progress_id = 0;
      gchar *msg = NULL;
@@ -38,7 +38,7 @@ index 8fbce4f..7ee7cdc 100644
  
      msg = g_strdup_printf ("Started opening '%s' TrueCrypt/VeraCrypt device", device);
      progress_id = bd_utils_report_started (msg);
-@@ -999,7 +999,7 @@ static gchar *replace_char (gchar *str, gchar orig, gchar new) {
+@@ -1090,7 +1090,7 @@ static gchar *replace_char (gchar *str, gchar orig, gchar new) {
      return str;
  }
  
@@ -47,7 +47,7 @@ index 8fbce4f..7ee7cdc 100644
                                          CERTCertificate *cert, GError **error) {
      gpointer packet_data = NULL;
      gsize packet_data_size = 0;
-@@ -1008,7 +1008,7 @@ static gboolean write_escrow_data_file (struct libvk_volume *volume, struct libv
+@@ -1099,7 +1099,7 @@ static gboolean write_escrow_data_file (struct libvk_volume *volume, struct libv
      gsize bytes_written = 0;
      GError *tmp_error = NULL;
  
@@ -56,11 +56,11 @@ index 8fbce4f..7ee7cdc 100644
                                                                       ui, LIBVK_PACKET_FORMAT_ASYMMETRIC_WRAP_SECRET_ONLY, error);
  
      if (!packet_data) {
-diff --git a/src/plugins/fs.c b/src/plugins/fs.c
-index c4b6ac8..647096d 100644
---- a/src/plugins/fs.c
-+++ b/src/plugins/fs.c
-@@ -2614,8 +2614,8 @@ BDFSVfatInfo* bd_fs_vfat_get_info (const gchar *device, GError **error) {
+diff --git a/src/plugins/fs/vfat.c b/src/plugins/fs/vfat.c
+index 3ed7d4a..5ff7795 100644
+--- a/src/plugins/fs/vfat.c
++++ b/src/plugins/fs/vfat.c
+@@ -376,8 +376,8 @@ BDFSVfatInfo* bd_fs_vfat_get_info (const gchar *device, GError **error) {
   */
  gboolean bd_fs_vfat_resize (const gchar *device, guint64 new_size, GError **error) {
      PedDevice *ped_dev = NULL;
@@ -72,10 +72,10 @@ index c4b6ac8..647096d 100644
      PedSector start = 0;
      PedSector length = 0;
 diff --git a/src/plugins/part.c b/src/plugins/part.c
-index 12d2ef7..d277688 100644
+index fed8300..6b2a690 100644
 --- a/src/plugins/part.c
 +++ b/src/plugins/part.c
-@@ -849,7 +849,7 @@ static PedPartition* add_part_to_disk (PedDevice *dev, PedDisk *disk, BDPartType
+@@ -926,7 +926,7 @@ static PedPartition* add_part_to_disk (PedDevice *dev, PedDisk *disk, BDPartType
          return NULL;
      }
  
@@ -84,7 +84,7 @@ index 12d2ef7..d277688 100644
      if (!part) {
          set_parted_error (error, BD_PART_ERROR_FAIL);
          g_prefix_error (error, "Failed to create new partition on device '%s'", dev->path);
-@@ -1427,7 +1427,7 @@ gboolean bd_part_set_part_flags (const gchar *disk, const gchar *part, guint64 f
+@@ -1564,7 +1564,7 @@ gboolean bd_part_set_part_flags (const gchar *disk, const gchar *part, guint64 f
      PedPartition *ped_part = NULL;
      const gchar *part_num_str = NULL;
      gint part_num = 0;
@@ -94,7 +94,7 @@ index 12d2ef7..d277688 100644
      gboolean ret = FALSE;
      guint64 progress_id = 0;
 diff --git a/src/utils/exec.c b/src/utils/exec.c
-index 7ac44fd..0a3094c 100644
+index 11c1489..dcf87e5 100644
 --- a/src/utils/exec.c
 +++ b/src/utils/exec.c
 @@ -354,7 +354,7 @@ gboolean bd_utils_exec_and_report_progress (const gchar **argv, const BDExtraArg
@@ -107,5 +107,5 @@ index 7ac44fd..0a3094c 100644
      gboolean err_done = FALSE;
      GString *stdout_data = g_string_new (NULL);
 -- 
-1.8.3.1
+2.14.3
 
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
similarity index 73%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
index 2a923548a..0c954aa39 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
@@ -8,20 +8,6 @@ SECTION = "devel/lib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
-S = "${WORKDIR}/git"
-B = "${S}"
-
-SRCREV = "c1dda45001542edd7d7f1ffc6451c5a74623f805"
-SRC_URI = "git://github.com/rhinstaller/libblockdev;branch=master \
-           file://0001-fix-configure-and-compile-failures.patch \
-           file://0002-remove-python2-support.patch \
-           file://0003-remove-dmraid-while-compiling-with-with-dm.patch \
-           file://0005-fix-a-clang-compiling-issue.patch \
-"
-SRC_URI_append_libc-musl = " \
-           file://0004-fix-compile-failure-against-musl-C-library.patch \
-"
-
 inherit autotools python3native gobject-introspection
 
 DEPENDS += " \
@@ -31,6 +17,21 @@ DEPENDS += " \
     libbytesize \
     btrfs-tools \
 "
+
+SRCREV = "e2e0899efe8dd3f111ff955fb6c1dc10b0bd2075"
+SRC_URI = " \
+    git://github.com/rhinstaller/libblockdev;branch=master \
+    file://0001-fix-configure-and-compile-failures.patch \
+    file://0002-remove-python2-support.patch \
+    file://0003-remove-dmraid-while-compiling-with-with-dm.patch \
+    file://0005-fix-a-clang-compiling-issue.patch \
+"
+SRC_URI_append_libc-musl = " \
+    file://0004-fix-compile-failure-against-musl-C-library.patch \
+"
+
+S = "${WORKDIR}/git"
+
 RDEPENDS_${PN} += " \
     lvm2 \
 "
@@ -46,6 +47,5 @@ PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 
-export STAGING_INCDIR
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
 
-- 
2.14.3


