Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sr2Rb-0001dN-6h
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 09:43:43 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so24371eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=BSvBL2chYpxfZsnBNX8oBUfY7R6PVF7tG0i2F9K2Ijw=;
	b=XPKpBlMXicl9Hx2Whi1zTkz+6n721v3ubF3RZeov8wG2+tdbqM+j1Qxm3iNPii6ycF
	9kVBZvMZNiXtCPtQp2oW0KzmYu4sWhjuEFFGxqNU1/aJ7vpAozg7RPDdifZmvby05ZQp
	4ou/rRDIFE2m07n2YOPgfGEg1bfaHqB3G3tKkBU13OBmA6GiVCPfAUBQaLt3IDYIZ0S6
	V1UUbuI2Q5OjBApMBUD1h4gTLqOfBQ0RzKJWtoVIfS4zKQBGI2j++JJ/uB23D3X2ixZt
	vGr8ymi0j9QKehilVXXucdhTWsH4BylMIqOuasq+0sbgElExGQ4tziVJWq9zxDSNv4JF
	qEYg==
Received: by 10.14.200.196 with SMTP id z44mr1456072een.46.1342510346279;
	Tue, 17 Jul 2012 00:32:26 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k48sm25026635een.10.2012.07.17.00.32.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 00:32:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 09:32:13 +0200
Message-Id: <1342510333-32367-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
References: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlyGnF0VKEfFUuS+LtzeJSPQFekbiYFOi8GU1dLarB8ySGOdap/0cxmQT9YYC72M2c/bi29
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][meta-oe][meta-systemd][PATCH v2 2/2] pulseaudio: add patch to fix build with new udev API provided by systemd recipe
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
X-List-Received-Date: Tue, 17 Jul 2012 07:43:43 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../pulseaudio/pulseaudio-2.0-udev-symbols.patch   |   80 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_1.1.bbappend             |    5 ++
 2 files changed, 85 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
 create mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend

diff --git a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
new file mode 100644
index 0000000..1ad720b
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
@@ -0,0 +1,80 @@
+From 2e64edbd3e12145950ccd952bb7984a4420b8c02 Mon Sep 17 00:00:00 2001
+From: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
+Date: Thu, 17 May 2012 22:50:22 +0200
+Subject: [PATCH] udev: Don't use deprecated udev_get_*_path() functions
+
+[These symbols were removed in libudev.so.1.0.0. Replace them with
+hardcoded strings. -- heftig]
+
+Signed-off-by: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
+---
+ src/modules/module-udev-detect.c |    9 +++------
+ src/modules/udev-util.c          |    4 ++--
+ 2 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/src/modules/module-udev-detect.c b/src/modules/module-udev-detect.c
+index 1192194..31416bd 100644
+--- a/src/modules/module-udev-detect.c
++++ b/src/modules/module-udev-detect.c
+@@ -123,7 +123,7 @@ static char *card_get_sysattr(const char *card_idx, const char *name) {
+         goto finish;
+     }
+ 
+-    t = pa_sprintf_malloc("%s/class/sound/card%s", udev_get_sys_path(udev), card_idx);
++    t = pa_sprintf_malloc("/sys/class/sound/card%s", card_idx);
+     card = udev_device_new_from_syspath(udev, t);
+     pa_xfree(t);
+ 
+@@ -282,7 +282,7 @@ static void verify_access(struct userdata *u, struct device *d) {
+     pa_assert(u);
+     pa_assert(d);
+ 
+-    cd = pa_sprintf_malloc("%s/snd/controlC%s", udev_get_dev_path(u->udev), path_get_card_id(d->path));
++    cd = pa_sprintf_malloc("/dev/snd/controlC%s", path_get_card_id(d->path));
+     accessible = access(cd, R_OK|W_OK) >= 0;
+     pa_log_debug("%s is accessible: %s", cd, pa_yes_no(accessible));
+ 
+@@ -621,7 +621,6 @@ fail:
+ }
+ 
+ static int setup_inotify(struct userdata *u) {
+-    char *dev_snd;
+     int r;
+ 
+     if (u->inotify_fd >= 0)
+@@ -632,9 +631,7 @@ static int setup_inotify(struct userdata *u) {
+         return -1;
+     }
+ 
+-    dev_snd = pa_sprintf_malloc("%s/snd", udev_get_dev_path(u->udev));
+-    r = inotify_add_watch(u->inotify_fd, dev_snd, IN_ATTRIB|IN_CLOSE_WRITE|IN_DELETE_SELF|IN_MOVE_SELF);
+-    pa_xfree(dev_snd);
++    r = inotify_add_watch(u->inotify_fd, "/dev/snd", IN_ATTRIB|IN_CLOSE_WRITE|IN_DELETE_SELF|IN_MOVE_SELF);
+ 
+     if (r < 0) {
+         int saved_errno = errno;
+diff --git a/src/modules/udev-util.c b/src/modules/udev-util.c
+index 2f18bc4..b0bb17d 100644
+--- a/src/modules/udev-util.c
++++ b/src/modules/udev-util.c
+@@ -180,7 +180,7 @@ int pa_udev_get_info(int card_idx, pa_proplist *p) {
+         goto finish;
+     }
+ 
+-    t = pa_sprintf_malloc("%s/class/sound/card%i", udev_get_sys_path(udev), card_idx);
++    t = pa_sprintf_malloc("/sys/class/sound/card%i", card_idx);
+     card = udev_device_new_from_syspath(udev, t);
+     pa_xfree(t);
+ 
+@@ -277,7 +277,7 @@ char* pa_udev_get_property(int card_idx, const char *name) {
+         goto finish;
+     }
+ 
+-    t = pa_sprintf_malloc("%s/class/sound/card%i", udev_get_sys_path(udev), card_idx);
++    t = pa_sprintf_malloc("/sys/class/sound/card%i", card_idx);
+     card = udev_device_new_from_syspath(udev, t);
+     pa_xfree(t);
+ 
+-- 
+1.7.8.6
+
diff --git a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend
new file mode 100644
index 0000000..3e81365
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://pulseaudio-2.0-udev-symbols.patch"
+
+PRINC := "${@int(PRINC) + 1}"
-- 
1.7.10



