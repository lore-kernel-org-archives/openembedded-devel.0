Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYFSS-0000Ih-8W
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:51:32 +0200
Received: by mail-ee0-f44.google.com with SMTP id t10so732841eei.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=U6TcatmREJzJx3xufA+juxQTFt+Ujcb9drtgdGqjNTc=;
	b=YZo+Ib1aItwUCBWQaPTlzYgcbJCMZqv24D99OlyNuoVJQ2A0J+4abICqDzuYJ+PThF
	EZsK4l1Q35vL+Te9hulu7BxFGXrBFJ8clLFz4x+U9VWytIvoqBQf4taf2qi5JAos9NDY
	ikLJKkQx6TPrZdIK4mfTVl5og08QDNBJKJLDwv38CH2IVUrrIhpwN2fnCrMwCWe7Apg6
	LGd/ukNYyA8CnkU6HUY9d6JU4Ls7a2TLjEWhvIfQo7aOwbShPrT2+5m8u6cdKx4xK7AW
	EZXfBkpoCSgZElzbXbs7QxF71hUUgd7hH6EtdRPjr9P9GCsbgPRrxbuJnFa854kDnGHN
	L4Xw==
X-Received: by 10.14.205.194 with SMTP id j42mr7544216eeo.41.1367584413572;
	Fri, 03 May 2013 05:33:33 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	bk42sm15658333eeb.3.2013.05.03.05.33.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 05:33:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 14:31:05 +0200
Message-Id: <1367584267-8767-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367584267-8767-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367584267-8767-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/master, V2 2/4] gnome-disk-utility: backport property DeviceAutomountHint
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 12:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently we have gvfs 1.10.1 which was designed for gnome-disk-utility 3.x.
We have a patched gvfs so that it works with gnome-disk-utility 2.x but that
does not support the property DeviceAutomountHint because it was introduced in
3.x.

Fixes warnings as:

| (palimpsest:829): libgdu-WARNING **: unhandled property 'DeviceAutomountHint'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-Add-support-for-DeviceAutomountHint.patch |   74 ++++++++++++++++++++
 .../gnome-disk-utility_2.32.0.bb                   |    3 +-
 2 files changed, 76 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Add-support-for-DeviceAutomountHint.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Add-support-for-DeviceAutomountHint.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Add-support-for-DeviceAutomountHint.patch
new file mode 100644
index 0000000..805e937
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Add-support-for-DeviceAutomountHint.patch
@@ -0,0 +1,74 @@
+From 7dde5bc75a1d96be9510ce1e98d28f9d33520919 Mon Sep 17 00:00:00 2001
+From: David Zeuthen <davidz@redhat.com>
+Date: Fri, 8 Jul 2011 11:03:52 -0400
+Subject: [PATCH] Add support for DeviceAutomountHint
+
+Based on the patch in https://bugzilla.gnome.org/show_bug.cgi?id=653184
+
+Upstream-Status: Applied [1]
+
+[1] https://mail.gnome.org/archives/commits-list/2011-July/msg03207.html
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+ src/gdu/gdu-device.c |   10 ++++++++++
+ src/gdu/gdu-device.h |    1 +
+ 2 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/src/gdu/gdu-device.c b/src/gdu/gdu-device.c
+index 6a5afad..4be39cf 100644
+--- a/src/gdu/gdu-device.c
++++ b/src/gdu/gdu-device.c
+@@ -82,6 +82,7 @@ typedef struct
+   gboolean device_presentation_nopolicy;
+   char *device_presentation_name;
+   char *device_presentation_icon_name;
++  char *device_automount_hint;
+   guint64 device_size;
+   guint64 device_block_size;
+ 
+@@ -279,6 +280,8 @@ collect_props (const char *key,
+     props->device_presentation_name = g_strdup (g_value_get_string (value));
+   else if (strcmp (key, "DevicePresentationIconName") == 0)
+     props->device_presentation_icon_name = g_strdup (g_value_get_string (value));
++  else if (strcmp (key, "DeviceAutomountHint") == 0)
++    props->device_automount_hint = g_strdup (g_value_get_string (value));
+   else if (strcmp (key, "DeviceSize") == 0)
+     props->device_size = g_value_get_uint64 (value);
+   else if (strcmp (key, "DeviceBlockSize") == 0)
+@@ -549,6 +552,7 @@ device_properties_free (DeviceProperties *props)
+   g_strfreev (props->device_mount_paths);
+   g_free (props->device_presentation_name);
+   g_free (props->device_presentation_icon_name);
++  g_free (props->device_automount_hint);
+   g_free (props->job_id);
+   g_free (props->id_usage);
+   g_free (props->id_type);
+@@ -1294,6 +1298,12 @@ gdu_device_drive_get_media_compatibility (GduDevice *device)
+ }
+ 
+ const char *
++gdu_device_get_automount_hint (GduDevice *device)
++{
++        return device->priv->props->device_automount_hint;
++}
++
++const char *
+ gdu_device_drive_get_media (GduDevice *device)
+ {
+         return device->priv->props->drive_media;
+diff --git a/src/gdu/gdu-device.h b/src/gdu/gdu-device.h
+index 4c1302b..8cfd7a9 100644
+--- a/src/gdu/gdu-device.h
++++ b/src/gdu/gdu-device.h
+@@ -143,6 +143,7 @@ const char *gdu_device_drive_get_wwn (GduDevice *device);
+ const char *gdu_device_drive_get_connection_interface (GduDevice *device);
+ guint64 gdu_device_drive_get_connection_speed (GduDevice *device);
+ char **gdu_device_drive_get_media_compatibility (GduDevice *device);
++const gchar *gdu_device_get_automount_hint(GduDevice *device);
+ const char *gdu_device_drive_get_media (GduDevice *device);
+ gboolean gdu_device_drive_get_is_media_ejectable (GduDevice *device);
+ gboolean gdu_device_drive_get_requires_eject (GduDevice *device);
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index a0fd9bd..ac4a759 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
-PR = "r3"
+PR = "r4"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
@@ -15,6 +15,7 @@ SRC_URI += "\
     file://disable-scrollkeeper.patch \
     file://fix-dbus-interfaces.patch \
     file://sysrooted-pkg-config.patch \
+    file://0001-Add-support-for-DeviceAutomountHint.patch \
 "
 
 EXTRA_OECONF += "--disable-scrollkeeper"
-- 
1.7.6.5



