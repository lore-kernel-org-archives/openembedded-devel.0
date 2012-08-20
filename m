Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDV-0006ex-GC
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:08:57 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4416325wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=RTBvN1Ng7Q9rexnAS500xR0WbQr1t7ho4S1fOKj1+Z0=;
	b=aS730CVofuOwIONFWqWzfspWkGbgpPzS2NxxcpxnNL2X6meF8dp9K2C6RYWKbnHWRh
	CTr+rgri2/hN/8C9sd4eSwLCs0eF+37UWjNXf3V3aE2Z2HYe8n9T1xBieNMhkA++jqxV
	VzLWepAxLsXmfpMcrCLxEXk1m9smyyQZ9wGBY1pB5BQZhVE4nKreMvMQYdlOnn9SLoLY
	nPCnQcGeA/RgGYTHizE5K5C+gJoa13nUfLwIsTsktgghCxpFGZ/GiiwClkT85L9wA4pa
	eKUOVQGa/K1QehAXtEWPxLjG+WrCxGk8uze97zZ2brsQtJF2Plojd+z4eFcJYGTA+PLR
	0cRg==
Received: by 10.216.123.69 with SMTP id u47mr8163570weh.89.1345496216934;
	Mon, 20 Aug 2012 13:56:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm44372332wix.5.2012.08.20.13.56.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:56:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:30 +0200
Message-Id: <f3e8eac6dfe7a04cb6aae829a4b432bcdd4b4916.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/8] pulseaudio: remove bbappend
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
X-List-Received-Date: Mon, 20 Aug 2012 21:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

oe-core has updated to 2.1 which includes the appended patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/pulseaudio-2.0-udev-symbols.patch   |   80 --------------------
 .../pulseaudio/pulseaudio_2.0.bbappend             |    5 -
 2 files changed, 0 insertions(+), 85 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
 delete mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
deleted file mode 100644
index 1ad720b..0000000
--- a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 2e64edbd3e12145950ccd952bb7984a4420b8c02 Mon Sep 17 00:00:00 2001
-From: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
-Date: Thu, 17 May 2012 22:50:22 +0200
-Subject: [PATCH] udev: Don't use deprecated udev_get_*_path() functions
-
-[These symbols were removed in libudev.so.1.0.0. Replace them with
-hardcoded strings. -- heftig]
-
-Signed-off-by: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
----
- src/modules/module-udev-detect.c |    9 +++------
- src/modules/udev-util.c          |    4 ++--
- 2 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/src/modules/module-udev-detect.c b/src/modules/module-udev-detect.c
-index 1192194..31416bd 100644
---- a/src/modules/module-udev-detect.c
-+++ b/src/modules/module-udev-detect.c
-@@ -123,7 +123,7 @@ static char *card_get_sysattr(const char *card_idx, const char *name) {
-         goto finish;
-     }
- 
--    t = pa_sprintf_malloc("%s/class/sound/card%s", udev_get_sys_path(udev), card_idx);
-+    t = pa_sprintf_malloc("/sys/class/sound/card%s", card_idx);
-     card = udev_device_new_from_syspath(udev, t);
-     pa_xfree(t);
- 
-@@ -282,7 +282,7 @@ static void verify_access(struct userdata *u, struct device *d) {
-     pa_assert(u);
-     pa_assert(d);
- 
--    cd = pa_sprintf_malloc("%s/snd/controlC%s", udev_get_dev_path(u->udev), path_get_card_id(d->path));
-+    cd = pa_sprintf_malloc("/dev/snd/controlC%s", path_get_card_id(d->path));
-     accessible = access(cd, R_OK|W_OK) >= 0;
-     pa_log_debug("%s is accessible: %s", cd, pa_yes_no(accessible));
- 
-@@ -621,7 +621,6 @@ fail:
- }
- 
- static int setup_inotify(struct userdata *u) {
--    char *dev_snd;
-     int r;
- 
-     if (u->inotify_fd >= 0)
-@@ -632,9 +631,7 @@ static int setup_inotify(struct userdata *u) {
-         return -1;
-     }
- 
--    dev_snd = pa_sprintf_malloc("%s/snd", udev_get_dev_path(u->udev));
--    r = inotify_add_watch(u->inotify_fd, dev_snd, IN_ATTRIB|IN_CLOSE_WRITE|IN_DELETE_SELF|IN_MOVE_SELF);
--    pa_xfree(dev_snd);
-+    r = inotify_add_watch(u->inotify_fd, "/dev/snd", IN_ATTRIB|IN_CLOSE_WRITE|IN_DELETE_SELF|IN_MOVE_SELF);
- 
-     if (r < 0) {
-         int saved_errno = errno;
-diff --git a/src/modules/udev-util.c b/src/modules/udev-util.c
-index 2f18bc4..b0bb17d 100644
---- a/src/modules/udev-util.c
-+++ b/src/modules/udev-util.c
-@@ -180,7 +180,7 @@ int pa_udev_get_info(int card_idx, pa_proplist *p) {
-         goto finish;
-     }
- 
--    t = pa_sprintf_malloc("%s/class/sound/card%i", udev_get_sys_path(udev), card_idx);
-+    t = pa_sprintf_malloc("/sys/class/sound/card%i", card_idx);
-     card = udev_device_new_from_syspath(udev, t);
-     pa_xfree(t);
- 
-@@ -277,7 +277,7 @@ char* pa_udev_get_property(int card_idx, const char *name) {
-         goto finish;
-     }
- 
--    t = pa_sprintf_malloc("%s/class/sound/card%i", udev_get_sys_path(udev), card_idx);
-+    t = pa_sprintf_malloc("/sys/class/sound/card%i", card_idx);
-     card = udev_device_new_from_syspath(udev, t);
-     pa_xfree(t);
- 
--- 
-1.7.8.6
-
diff --git a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend
deleted file mode 100644
index 3e81365..0000000
--- a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://pulseaudio-2.0-udev-symbols.patch"
-
-PRINC := "${@int(PRINC) + 1}"
-- 
1.7.8.6



