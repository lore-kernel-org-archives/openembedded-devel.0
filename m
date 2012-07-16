Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqqZr-0006gi-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 21:03:27 +0200
Received: by wgbdr1 with SMTP id dr1so1878546wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uKiu3Fjg4elMb1xyfU6gkp7MgZhz/sivDluT91yFdtc=;
	b=NV1L4yZ9wMhj206VuaRYW2wTHkzOysb0t4VLx7nyHbDwrX3HnLGadnkPxlyoR1W2zA
	KPVSx4I77UK7KSPOQrSyIeRXK3OIXLNUUbYdFtlS/5o8xyl5sSpW35sJh7/At15uiD64
	yIx7rbq70NiVm/HmFXzS1RYfn1y6SygQijsAzd2mNMb2as0JTUSZwwK8bYQ7Cv2pQ023
	7XB0mkLEJADdgc0GVVCLoHgDpVMzWrydooz9Pb2MPkA1ZRvtCn9EUhzSgVUsbzNvoJD4
	YtxAjisBcL17YPIRe8TZGXWWb3UDvsVpTd5CWYEhM13+mNKKVwN9IHEyqcky8GZvlyDm
	wmUg==
Received: by 10.180.100.35 with SMTP id ev3mr20336641wib.10.1342464729424;
	Mon, 16 Jul 2012 11:52:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm22790933wiz.0.2012.07.16.11.52.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 11:52:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 20:52:04 +0200
Message-Id: <1342464724-25386-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
References: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pulseaudio: add patch to fix build with new udev API provided by systemd recipe
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
X-List-Received-Date: Mon, 16 Jul 2012 19:03:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/pulseaudio-2.0-udev-symbols.patch   |   80 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_1.1.bbappend             |    5 +
 2 files changed, 85 insertions(+), 0 deletions(-)
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
1.7.8.6



