Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0615877D82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so8686365wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SPGqSEpcOXgHcyouJlQG/iQEYcjyjCiURhIGDDWs59U=;
	b=W7xs60u7f9WD9EpRLxiHr9d4Gx4tdq24kPNmFoF88FJxx7oDfxGPmoSfefffep1C0v
	hDjVXF0QPzaNWbqyn6mPiErBA+ApTDyykG1fKm4TQ7KVHS59zufQoyq8ebvhEZFukIlb
	jcmJ4px9lDaLQ7zC2uTIs9hcz3dn8YI+yWDLZS0rGNE+14XIDNp5dP4YFLHbOHK800or
	uP2PB+Cl8We5ZM2KHrSlX6vYOZCoYDWvAk2Cd/8UQf2FIHKOpJwEuwZAwSnI87o/5jEo
	b6p1XtbP0zzMVSgCbxaB9hjd+CqVp1FWxGyY4ks7uj5VLDZ+6qq2tqD6e8m8k6d2NmUp
	HIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SPGqSEpcOXgHcyouJlQG/iQEYcjyjCiURhIGDDWs59U=;
	b=gyBfZTsylxgB+JBvObugBIN+GdhbRUgGgSIoPgqPypZK+YVnt1tm8+sFFLlzH1B+Nm
	PwKNbH0hpixIRPA6RylBSV7F/AOoYhvcgC8/rXiuq5Nu6p1yYaVsW7sqH58bokrLZLmp
	8tP52fX6lJZAUmnjFVuQAZ7D4gnmdSZJxxds1EoD6IfdbLKP+rO2GjVHubx0Frg9ViZU
	+WGIhZ1AekioQwUlYjnaI90jfeou1L/VsoQXreLxnJNGscrwleJjg2jO/1tUiZFx0qKa
	mvePvgHLsx/8bHOOWtSKl9APlxUwMbnxjozoQ2kqYj5jV4VUT4YjUTcOKOD68OUnnukv
	6sWA==
X-Gm-Message-State: AN3rC/5q9eXefEEVwIWnvwmBZmD5emJ598zfa7SL3VplH9nZMiCNdIcjqTTKo1CyAG//jw==
X-Received: by 10.28.209.204 with SMTP id i195mr4424638wmg.113.1492027031892; 
	Wed, 12 Apr 2017 12:57:11 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:31 +0200
Message-Id: <20170412195638.3243-23-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 22/29] xfce4-mount-plugin: update 0.6.4 -> 1.1.2
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've given my best to port musl-patch but did not test build with musl.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-check-for-fstab.h-during-configure.patch  | 50 +++++++++++-----------
 ...plugin_0.6.4.bb => xfce4-mount-plugin_1.1.2.bb} |  7 ++-
 2 files changed, 29 insertions(+), 28 deletions(-)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_0.6.4.bb => xfce4-mount-plugin_1.1.2.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
index dcc2a37..e2165c2 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
@@ -10,16 +10,19 @@ plugin
 Makes it compile/build with musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Patch Reworked for xfce4-mount-plugin 0.6.4->1.1.2
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  configure.ac           |  1 +
- panel-plugin/devices.c | 22 ++++++++++++++++++----
- 2 files changed, 19 insertions(+), 4 deletions(-)
+ panel-plugin/devices.c | 22 +++++++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 34d6f7f..52ecc4a 100644
+index b131117..c633fef 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -67,6 +67,7 @@ AC_CHECK_HEADERS([sys/socket.h])
+@@ -69,6 +69,7 @@ AC_CHECK_HEADERS([sys/socket.h])
  AC_CHECK_HEADERS([sys/time.h])
  AC_CHECK_HEADERS([unistd.h])
  AC_CHECK_HEADERS([sys/sockio.h])
@@ -28,10 +31,10 @@ index 34d6f7f..52ecc4a 100644
  AC_PROG_GCC_TRADITIONAL
  AC_TYPE_SIZE_T
 diff --git a/panel-plugin/devices.c b/panel-plugin/devices.c
-index afa954e..345b603 100644
+index 797b079..d29df56 100644
 --- a/panel-plugin/devices.c
 +++ b/panel-plugin/devices.c
-@@ -24,8 +24,9 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+@@ -24,8 +24,10 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  #ifdef HAVE_CONFIG_H
  #include <config.h>
  #endif
@@ -39,41 +42,40 @@ index afa954e..345b603 100644
 +#if HAVE_FSTAB_H
  #include <fstab.h>
 +#endif
++
  #include <glib.h>
  #include <stdio.h>
  #include <string.h>
-@@ -370,14 +371,15 @@ out:
- GPtrArray *
- disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+@@ -468,11 +470,12 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
  {
--    GPtrArray * pdisks; /* to be returned */
-+    GtkWidget *dialog;
+     GPtrArray * pdisks; /* to be returned */
      t_disk * pdisk;
 -    struct fstab *pfstab;
-+    GPtrArray * pdisks; /* to be returned */
      gboolean has_valid_mount_device;
--    GtkWidget *dialog;
  
      pdisks = g_ptr_array_new();
-+#if HAVE_FSTAB_H
  
++#if HAVE_FSTAB_H
 +    struct fstab *pfstab;
      /* open fstab */
      if (setfsent()!=1)
      {
-@@ -422,6 +424,18 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+@@ -526,7 +529,20 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+     } /* end for */
  
      endfsent(); /* close file */
- 
+-
 +#else
++        /* popup notification dialog */
 +        if (! (*showed_fstab_dialog) ) {
-+            dialog = gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT,
-+                                                GTK_MESSAGE_INFO, GTK_BUTTONS_OK,
-+    "Your /etc/fstab could not be read because fstab is not supported. This will severely degrade the plugin's abilities.");
-+            /* gtk_dialog_run (GTK_DIALOG (dialog)); */
-+            g_signal_connect (dialog, "response",
-+                    G_CALLBACK (gtk_widget_destroy), dialog);
-+             gtk_widget_show (dialog);
++            xfce_message_dialog (NULL,
++                               _("Xfce 4 Mount Plugin"),
++                               "dialog-info",
++                               _("Your /etc/fstab could not be read because fstab is not supported. This will severely degrade the plugin's abilities."),
++                               NULL,
++                               "gtk-ok",
++                               GTK_RESPONSE_OK,
++                               NULL);
 +             *showed_fstab_dialog = TRUE;
 +         }
 +#endif
@@ -81,5 +83,5 @@ index afa954e..345b603 100644
  }
  
 -- 
-2.12.0
+2.9.3
 
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
rename to meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb
index 2a646eb..6700937 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch \
-           "
-SRC_URI[md5sum] = "f5917e9aa2a06bc6a872cc10d2ee4f6f"
-SRC_URI[sha256sum] = "541d7af84d7d0b00ae547aa1f438e2fac51ee4195c4d0a17173c4f72accb227d"
+SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch"
+SRC_URI[md5sum] = "7eba9696d82433a5577741214d34b588"
+SRC_URI[sha256sum] = "54578447abaf9da630a750d64acdc37d4fd20dda6460208d6d1ffaa9e43ee1a6"
-- 
2.9.3


