Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6A4A77A8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:45 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n11so16781940pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m2CJ4H6F8olsK1nOsOYVbRbITnMgvqwNDUGF3CZSprk=;
	b=Q6I4J+TIM2c/QYAvIFBVVyCD9oDbwarr9F3LFChHR0SlUGRKwLlj6u6dhfFcaBPydZ
	kfwqWWYDhO42XeV/mmhSFa7rUhlnoj+KrZAw9jydYp5TVERLYjuZlzZCuJnqeRaxiJQZ
	FBV0Gds94IVFrG/1uyFB8xsPZ6Lq5DyUqhAPuneurE49v/F4AqS/Df8FrNJd3uKBGH/W
	lKuQnFo9ofKTN3Xq7aM374OGD/1OOzT7zPcy+aXW1sj/Gt6RxOLvLaRla/0CEkgGFsOU
	DOvE6rNQpIa4r09kcDE5lXGzkh4IjORhvJU7pdz4m7EnGWO8Hca3etVJ5jBT2FM6or/V
	NGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m2CJ4H6F8olsK1nOsOYVbRbITnMgvqwNDUGF3CZSprk=;
	b=YAyVNnwHaiPSSxTYcWCqdQ2z/yvg+F75piaNrWw2gly68pljdQuJD3LR0IHrlGnK51
	H70S5LJPZjiBpqsEA5XILg6WFS8PU7F28tDQnNQmPhnMkJsZSboKLDAjR/Yo3dl87clM
	9vLx9XJAZNIdNdj18NUwKBr5+At/ThTix6xNshxr6csG9hAD4J7VfqvZ0N2cDgoYZtyT
	q/RHxLiTJg17rZFoz4l6AgADCd8VkNT3CB06at8aieC3g34JhYDfG8CVIT3KG8QfZQmf
	PA2ZzT+pZEb5b2vkwxmwg7uXUT3RmVBWWKTM/bzVJLHxsUUGd7e5HcPwRi7OblQUmOz0
	MyvQ==
X-Gm-Message-State: AFeK/H0T1Zb6l+JCFLUDF2EtZe5mR9dC44ZtPDA3m9qiWRGOZnHZUUxQ9SjaRv0rhpywzA==
X-Received: by 10.84.194.1 with SMTP id g1mr57355701pld.98.1490208346167;
	Wed, 22 Mar 2017 11:45:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:26 -0700
Message-Id: <20170322184533.6501-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 03/10] xfce4-mount-plugin: Fix build with musl
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-check-for-fstab.h-during-configure.patch  | 85 ++++++++++++++++++++++
 .../mount/xfce4-mount-plugin_0.6.4.bb              |  2 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
new file mode 100644
index 000000000..dcc2a3719
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
@@ -0,0 +1,85 @@
+From 09e325f8296eb9e63dc57ed137f4a9940f164563 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Mar 2017 17:11:46 -0700
+Subject: [PATCH] check for fstab.h during configure
+
+fstab.h is not universally available, checking it during
+configure creates a knob to disable fstab reads in the
+plugin
+
+Makes it compile/build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac           |  1 +
+ panel-plugin/devices.c | 22 ++++++++++++++++++----
+ 2 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 34d6f7f..52ecc4a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,6 +67,7 @@ AC_CHECK_HEADERS([sys/socket.h])
+ AC_CHECK_HEADERS([sys/time.h])
+ AC_CHECK_HEADERS([unistd.h])
+ AC_CHECK_HEADERS([sys/sockio.h])
++AC_CHECK_HEADERS([fstab.h])
+ AC_HEADER_SYS_WAIT
+ AC_PROG_GCC_TRADITIONAL
+ AC_TYPE_SIZE_T
+diff --git a/panel-plugin/devices.c b/panel-plugin/devices.c
+index afa954e..345b603 100644
+--- a/panel-plugin/devices.c
++++ b/panel-plugin/devices.c
+@@ -24,8 +24,9 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#if HAVE_FSTAB_H
+ #include <fstab.h>
++#endif
+ #include <glib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -370,14 +371,15 @@ out:
+ GPtrArray *
+ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+ {
+-    GPtrArray * pdisks; /* to be returned */
++    GtkWidget *dialog;
+     t_disk * pdisk;
+-    struct fstab *pfstab;
++    GPtrArray * pdisks; /* to be returned */
+     gboolean has_valid_mount_device;
+-    GtkWidget *dialog;
+ 
+     pdisks = g_ptr_array_new();
++#if HAVE_FSTAB_H
+ 
++    struct fstab *pfstab;
+     /* open fstab */
+     if (setfsent()!=1)
+     {
+@@ -422,6 +424,18 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+ 
+     endfsent(); /* close file */
+ 
++#else
++        if (! (*showed_fstab_dialog) ) {
++            dialog = gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT,
++                                                GTK_MESSAGE_INFO, GTK_BUTTONS_OK,
++    "Your /etc/fstab could not be read because fstab is not supported. This will severely degrade the plugin's abilities.");
++            /* gtk_dialog_run (GTK_DIALOG (dialog)); */
++            g_signal_connect (dialog, "response",
++                    G_CALLBACK (gtk_widget_destroy), dialog);
++             gtk_widget_show (dialog);
++             *showed_fstab_dialog = TRUE;
++         }
++#endif
+     return pdisks;
+ }
+ 
+-- 
+2.12.0
+
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
index 6dc2c1721..2a646eb86 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
@@ -6,5 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
+SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch \
+           "
 SRC_URI[md5sum] = "f5917e9aa2a06bc6a872cc10d2ee4f6f"
 SRC_URI[sha256sum] = "541d7af84d7d0b00ae547aa1f438e2fac51ee4195c4d0a17173c4f72accb227d"
-- 
2.12.0


