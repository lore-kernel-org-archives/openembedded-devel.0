Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8C42475500
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:51 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id t20-v6so361434ply.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jxcaug58FI5oVnP6jmKmGhq0U25KhOphMNiJZCGSKBs=;
	b=TR5rfej4szf1qVP1fgDQc6Ln+gUmiRSAU86/Jdjyx+lpMsLCrunstxtWl2vm5J5/Al
	+h9gN1DybXiutiwdH+5iuTJrzl/E/WIZQHSo2U67n5DBVY1J8QCcmT3OhKySMatUaMoa
	slRm8TjDZwMPt0f8S897sbwRHOfQi/R/84GHBn/uacozHadVD7jLhSPBb9S9sT/mtubn
	EimW+V0dBGIQ7417CGequSGyjXXfMo8iQDkR7qr7IVdVuCmKk7mLtvvxqN9OKs7NZ5Dn
	oltgBkcNp82Jg3L7rxtav2IRTuOAYp7KVBTvy/2zoRNjC3zLhHC6DMIkl09rqQKnQt0C
	+Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jxcaug58FI5oVnP6jmKmGhq0U25KhOphMNiJZCGSKBs=;
	b=XaK7D2Sd6KhexmU7VMH/oQBONgd4ncc+v3D70c2HIcjEjrCpR7s+YGTXGfPrOA+u2h
	GFhR5o8xHxiXqkAwS6PGJx2gH2YgptNbFsODSCYzSYh/IpwMK3OzxMtZAAqartcNx90F
	aoUjPnE6dhLbBUfuhZJ+7uUtze243QvyA7zcU2Z+nJUGmpZRmZrsnJr/uloHmXK63sBK
	n3yPJg4ubgNY+C4plO8ldB+xRZFw4riCgeYZVGptJSdJsmFnHMqjYpIQHaJsJWuTgPE0
	/ceGQGD9kXQfgnRaGHgG/cluCeFI6sfj/GVmBPdbGpbW80r9pHbhb+8E9FLBfcxgkrfS
	Zisw==
X-Gm-Message-State: AElRT7E6bZEnOlVd2p9wfdS+hQJtqaWlKnLFeIltmkWgfZXx/UEac3nJ
	EoU41PPWkT4CGyKVpq2iv/TbyQ==
X-Google-Smtp-Source: AIpwx486uNhYwMZiCc7zOrm6hFovwwZboD7Zq2bMFDUZxzW+XzJ0d4Bg53mCf68G1DxQPGN+BQKDgw==
X-Received: by 2002:a17:902:8646:: with SMTP id
	y6-v6mr34512042plt.182.1523170732354; 
	Sat, 07 Apr 2018 23:58:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:13 -0700
Message-Id: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 01/37] udisks: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:51 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...01-Make-udev-rules-directory-configurable.patch | 10 ++-
 .../0001-fix-build-with-newer-glibc-versions.patch |  6 +-
 .../udisks/udisks/optional-depends.patch           | 72 +++++++++++++---------
 .../udisks/udisks-1.0.5-fix-service-file.patch     |  5 +-
 4 files changed, 51 insertions(+), 42 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch b/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
index 3cc0400..2823c54 100644
--- a/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
+++ b/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
@@ -1,4 +1,4 @@
-From 32278297170ffb49116b5789e4a0588b99d02bd0 Mon Sep 17 00:00:00 2001
+From a6eab413f274376cf703a608e2866118291a6185 Mon Sep 17 00:00:00 2001
 From: Amarnath Valluri <amarnath.valluri@intel.com>
 Date: Thu, 9 Feb 2017 11:02:53 +0200
 Subject: [PATCH] Make udev rules directory configurable.
@@ -9,6 +9,7 @@ libdir, sbindir for installing librares and binaries.
 Upstream-Status: Inappropriate[Embedded specific]
 
 Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+
 ---
  configure.ac            | 14 +++-----------
  data/Makefile.am        |  1 -
@@ -49,11 +50,11 @@ index 8c4e4c2..a143397 100644
  
          compiler:                   ${CC}
 diff --git a/data/Makefile.am b/data/Makefile.am
-index 411ea0f..4834960 100644
+index 08af5f4..9329186 100644
 --- a/data/Makefile.am
 +++ b/data/Makefile.am
 @@ -34,7 +34,6 @@ $(systemdservice_DATA): $(systemdservice_in_files) Makefile
- 	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
+ 	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
  endif
  
 -udevrulesdir = $(slashlibdir)/udev/rules.d
@@ -86,6 +87,3 @@ index 18325f7..0aaec11 100644
  
  umount_udisks_SOURCES = umount-udisks.c
  umount_udisks_LDADD = $(DBUS_GLIB_LIBS) $(POLKIT_DBUS_LIBS)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch b/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
index 520655a..8b4f441 100644
--- a/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
+++ b/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
@@ -1,4 +1,4 @@
-From 9829152b12a8924d2e091a00133ed1a3a7ba75c0 Mon Sep 17 00:00:00 2001
+From 054ad6a06cfac7c3d172d53cd901204079a53ec3 Mon Sep 17 00:00:00 2001
 From: Alexandre Rostovtsev <tetromino@gentoo.org>
 Date: Fri, 29 May 2015 21:09:39 -0400
 Subject: [PATCH] fix build with newer glibc versions
@@ -8,6 +8,7 @@ https://bugs.freedesktop.org/show_bug.cgi?id=90778
 Upstream-Status: Applied [1]
 
 [1] http://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=9829152b12a8924d2e091a00133ed1a3a7ba75c0
+
 ---
  src/helpers/job-drive-detach.c | 1 +
  1 file changed, 1 insertion(+)
@@ -24,6 +25,3 @@ index eeafcab..d122a1f 100644
  #include <stdio.h>
  #include <string.h>
  #include <errno.h>
--- 
-2.1.0
-
diff --git a/meta-oe/recipes-support/udisks/udisks/optional-depends.patch b/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
index 6131701..a890954 100644
--- a/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
+++ b/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
@@ -1,12 +1,29 @@
-From 1b70b7a798eeeec554ab5aa9fcfff96a22e91774 Mon Sep 17 00:00:00 2001
+From e8b3fbfa3d6a11eee25db2dc0f31f439aaf0b65a Mon Sep 17 00:00:00 2001
 From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
 Date: Thu, 26 May 2011 17:30:04 -0300
 Subject: [PATCH] Allow disabling atasmart, lvm2 and devicemapper support.
 
 https://bugs.freedesktop.org/show_bug.cgi?id=37647
 
+---
+ configure.ac            | 53 +++++++++++++++++++++++++++++++++++++++----------
+ src/adapter-private.h   |  1 -
+ src/adapter.c           |  1 -
+ src/daemon.c            |  4 ++++
+ src/device-private.c    |  2 +-
+ src/device-private.h    |  5 ++---
+ src/device.c            | 23 +++++++++++++++++----
+ src/expander-private.h  |  1 -
+ src/expander.c          |  1 -
+ src/helpers/Makefile.am | 20 +++++++++++++------
+ src/helpers/partutil.c  |  3 ++-
+ src/port-private.h      |  1 -
+ src/probers/Makefile.am |  8 ++++++--
+ tools/udisks.c          | 10 ++++++++--
+ 14 files changed, 99 insertions(+), 34 deletions(-)
+
 diff --git a/configure.ac b/configure.ac
-index 62cc35d..b664135 100644
+index 9454423..8c4e4c2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -155,13 +155,33 @@ PKG_CHECK_MODULES(POLKIT_GOBJECT_1, [polkit-gobject-1 >= 0.97])
@@ -49,8 +66,8 @@ index 62cc35d..b664135 100644
 +AM_CONDITIONAL(HAVE_DEVMAPPER, [test "$have_devmapper" = "yes"])
  
  have_lvm2=no
- AC_ARG_ENABLE(lvm2, AS_HELP_STRING([--disable-lvm2], [disable LVM2 support]))
-@@ -185,9 +205,19 @@ if test "x$enable_dmmp" != "xno"; then
+ AC_ARG_ENABLE(lvm2, AS_HELP_STRING([--enable-lvm2], [enable LVM2 support]))
+@@ -185,9 +205,19 @@ if test "x$enable_dmmp" = "xyes"; then
  fi
  AM_CONDITIONAL(HAVE_DMMP, [test "$have_dmmp" = "yes"])
  
@@ -73,7 +90,7 @@ index 62cc35d..b664135 100644
  
  PKG_CHECK_MODULES(LIBUDEV, [libudev >= 143])
  AC_SUBST(LIBUDEV_CFLAGS)
-@@ -267,9 +297,12 @@ echo "
+@@ -278,9 +308,12 @@ echo "
          cppflags:                   ${CPPFLAGS}
          xsltproc:                   ${XSLTPROC}
  
@@ -99,7 +116,7 @@ index 3409e21..ef584e3 100644
  #include "types.h"
  
 diff --git a/src/adapter.c b/src/adapter.c
-index b85a0ef..802420b 100644
+index 65e05b0..45db8c8 100644
 --- a/src/adapter.c
 +++ b/src/adapter.c
 @@ -30,7 +30,6 @@
@@ -111,10 +128,10 @@ index b85a0ef..802420b 100644
  #include "daemon.h"
  #include "adapter.h"
 diff --git a/src/daemon.c b/src/daemon.c
-index 6072502..d043cb0 100644
+index fafcf9a..14e952f 100644
 --- a/src/daemon.c
 +++ b/src/daemon.c
-@@ -1745,6 +1745,7 @@ mdstat_changed_event (GIOChannel *channel,
+@@ -1748,6 +1748,7 @@ mdstat_changed_event (GIOChannel *channel,
    return TRUE;
  }
  
@@ -122,7 +139,7 @@ index 6072502..d043cb0 100644
  static gboolean
  refresh_ata_smart_data (Daemon *daemon)
  {
-@@ -1773,6 +1774,7 @@ refresh_ata_smart_data (Daemon *daemon)
+@@ -1776,6 +1777,7 @@ refresh_ata_smart_data (Daemon *daemon)
  
    return FALSE;
  }
@@ -130,7 +147,7 @@ index 6072502..d043cb0 100644
  
  static gboolean
  register_disks_daemon (Daemon *daemon)
-@@ -1984,12 +1986,14 @@ daemon_new (void)
+@@ -1987,12 +1989,14 @@ daemon_new (void)
    mount_file_clean_stale (l);
    g_list_free (l);
  
@@ -146,10 +163,10 @@ index 6072502..d043cb0 100644
    PROFILE ("daemon_new(): end");
    return daemon;
 diff --git a/src/device-private.c b/src/device-private.c
-index 22a0d35..fb96525 100644
+index 45418ce..fb1d959 100644
 --- a/src/device-private.c
 +++ b/src/device-private.c
-@@ -1378,7 +1378,7 @@ device_set_drive_ata_smart_time_collected (Device *device,
+@@ -1390,7 +1390,7 @@ device_set_drive_ata_smart_time_collected (Device *device,
  
  void
  device_set_drive_ata_smart_status (Device *device,
@@ -159,7 +176,7 @@ index 22a0d35..fb96525 100644
    if (G_UNLIKELY (device->priv->drive_ata_smart_status != value))
      {
 diff --git a/src/device-private.h b/src/device-private.h
-index a6db7f2..71473a6 100644
+index 32a9bd0..8c57c13 100644
 --- a/src/device-private.h
 +++ b/src/device-private.h
 @@ -23,7 +23,6 @@
@@ -170,7 +187,7 @@ index a6db7f2..71473a6 100644
  
  #include "types.h"
  
-@@ -224,7 +223,7 @@ struct DevicePrivate
+@@ -228,7 +227,7 @@ struct DevicePrivate
  
    gboolean drive_ata_smart_is_available;
    guint64 drive_ata_smart_time_collected;
@@ -179,7 +196,7 @@ index a6db7f2..71473a6 100644
    void *drive_ata_smart_blob;
    gsize drive_ata_smart_blob_size;
  
-@@ -391,7 +390,7 @@ void device_set_holders_objpath (Device *device, GStrv value);
+@@ -396,7 +395,7 @@ void device_set_holders_objpath (Device *device, GStrv value);
  
  void device_set_drive_ata_smart_is_available (Device *device, gboolean value);
  void device_set_drive_ata_smart_time_collected (Device *device, guint64 value);
@@ -189,7 +206,7 @@ index a6db7f2..71473a6 100644
  
  G_END_DECLS
 diff --git a/src/device.c b/src/device.c
-index 6a34940..7a5a4a9 100644
+index 2ae7f38..d73f9d6 100644
 --- a/src/device.c
 +++ b/src/device.c
 @@ -50,7 +50,9 @@
@@ -202,7 +219,7 @@ index 6a34940..7a5a4a9 100644
  
  #include "daemon.h"
  #include "device.h"
-@@ -659,10 +661,14 @@ get_property (GObject *object,
+@@ -664,10 +666,14 @@ get_property (GObject *object,
      case PROP_DRIVE_ATA_SMART_STATUS:
        {
          const gchar *status;
@@ -218,7 +235,7 @@ index 6a34940..7a5a4a9 100644
          g_value_set_string (value, status);
        }
        break;
-@@ -5114,6 +5120,7 @@ device_new (Daemon *daemon,
+@@ -5144,6 +5150,7 @@ device_new (Daemon *daemon,
        goto out;
      }
  
@@ -226,7 +243,7 @@ index 6a34940..7a5a4a9 100644
    /* if just added, update the smart data if applicable */
    if (device->priv->drive_ata_smart_is_available)
      {
-@@ -5121,6 +5128,7 @@ device_new (Daemon *daemon,
+@@ -5151,6 +5158,7 @@ device_new (Daemon *daemon,
        gchar *ata_smart_refresh_data_options[] = { NULL };
        device_drive_ata_smart_refresh_data (device, ata_smart_refresh_data_options, NULL);
      }
@@ -234,7 +251,7 @@ index 6a34940..7a5a4a9 100644
  
    PROFILE ("device_new(native_path=%s): end", native_path);
   out:
-@@ -9794,16 +9802,18 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
+@@ -9840,16 +9848,18 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
                                             const char *stdout,
                                             gpointer user_data)
  {
@@ -256,7 +273,7 @@ index 6a34940..7a5a4a9 100644
    blob = NULL;
  
    if (job_was_cancelled || stdout == NULL)
-@@ -9907,6 +9917,11 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
+@@ -9953,6 +9963,11 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
    g_free (blob);
    if (d != NULL)
      sk_disk_free (d);
@@ -430,7 +447,7 @@ index 06bb566..01c693b 100644
  udisks_probe_sas_expander_SOURCES = udisks-probe-sas-expander.c
  udisks_probe_sas_expander_CPPFLAGS = $(AM_CPPFLAGS) $(GLIB_CFLAGS)
 diff --git a/tools/udisks.c b/tools/udisks.c
-index 6fbd6a6..e0c4fbb 100644
+index 97e80d7..d30159b 100644
 --- a/tools/udisks.c
 +++ b/tools/udisks.c
 @@ -43,7 +43,9 @@
@@ -443,7 +460,7 @@ index 6fbd6a6..e0c4fbb 100644
  
  #include "udisks-daemon-glue.h"
  #include "udisks-device-glue.h"
-@@ -979,6 +981,7 @@ end_highlight (void)
+@@ -983,6 +985,7 @@ end_highlight (void)
      g_print ("\x1B[0m");
  }
  
@@ -451,7 +468,7 @@ index 6fbd6a6..e0c4fbb 100644
  static const gchar *
  ata_smart_status_to_desc (const gchar *status,
                            gboolean *out_highlight)
-@@ -1159,6 +1162,7 @@ print_ata_smart_attr (SkDisk *d,
+@@ -1163,6 +1166,7 @@ print_ata_smart_attr (SkDisk *d,
    g_free (threshold_str);
    g_free (pretty);
  }
@@ -459,7 +476,7 @@ index 6fbd6a6..e0c4fbb 100644
  
  static void
  do_show_info (const char *object_path)
-@@ -1440,7 +1444,7 @@ do_show_info (const char *object_path)
+@@ -1445,7 +1449,7 @@ do_show_info (const char *object_path)
          g_print ("    if speed:                  %" G_GINT64_FORMAT " bits/s\n", props->drive_connection_speed);
  
        /* ------------------------------------------------------------------------------------------------- */
@@ -468,7 +485,7 @@ index 6fbd6a6..e0c4fbb 100644
        if (!props->drive_ata_smart_is_available)
          {
            g_print ("    ATA SMART:                 not available\n");
-@@ -1493,7 +1497,9 @@ do_show_info (const char *object_path)
+@@ -1498,7 +1502,9 @@ do_show_info (const char *object_path)
              }
  
          }
@@ -479,6 +496,3 @@ index 6fbd6a6..e0c4fbb 100644
        /* ------------------------------------------------------------------------------------------------- */
  
      }
--- 
-1.7.5.rc3
-
diff --git a/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch b/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
index d5e84d3..d4efa93 100644
--- a/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
+++ b/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
@@ -1,4 +1,4 @@
-From 7d61ad048856ee239870b917d6933e3ad63f0789 Mon Sep 17 00:00:00 2001
+From a4f6aa5be37ae6e2194c9ded2ea8c1da330f5694 Mon Sep 17 00:00:00 2001
 From: David King <amigadave@amigadave.com>
 Date: Thu, 2 Jul 2015 13:49:22 +0100
 Subject: [PATCH] Fix systemd service file
@@ -12,6 +12,7 @@ Taken-From: [1]
 [1] http://pkgs.fedoraproject.org/cgit/udisks.git/tree/udisks-1.0.5-fix-service-file.patch
 
 Upstream-Status: Pending
+
 ---
  data/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -29,5 +30,3 @@ index 411ea0f..08af5f4 100644
  endif
  
  udevrulesdir = $(slashlibdir)/udev/rules.d
--- 
-2.4.5
-- 
2.7.4


