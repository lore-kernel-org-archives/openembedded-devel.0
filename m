Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T33C3-0001F6-4N
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Aug 2012 12:57:19 +0200
Received: by wgbds1 with SMTP id ds1so2464731wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2012 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=RlypcO1E0h/6mommKGZUVuHLhiR7ZyASpYRaRvLrZQE=;
	b=RjtDN29FAudHDwzIKHzAEbHcAqVyODEkGZPbOHYPKFS9eXQ89l01GyswzEcUzsDoTJ
	5LJ9fsaviaGqxcCJDxoLxYC4+Cw5SsPIefAaRtaKiyQUeu2QNpr9TCLaq4HeYiDLYbri
	/U5j7RWk1iPZ2FMomkEoNdug7rfhNQiDlMLMDvTSAlcDJw2bvvG/EUbLik9gMf3V1sVI
	rUlhgpdigS35YyLQltpPkW0l6JKY5eyOM69X1r9/cpyMJOssWCg0/vPiN3XiVTjCztR+
	HsIOaEiksCcFndb1x5W6pmvDFgEKHVnsdj16nZNuilHemGYVjOATqDyq+XP+QYbRl2cW
	unfg==
Received: by 10.180.86.133 with SMTP id p5mr19682788wiz.17.1345373118328;
	Sun, 19 Aug 2012 03:45:18 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2BC0.dip.t-dialin.net.
	[91.10.43.192])
	by mx.google.com with ESMTPS id fb20sm31770475wid.1.2012.08.19.03.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 03:45:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2012 12:52:13 +0200
Message-Id: <1345373533-14583-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1345373533-14583-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345373533-14583-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 2/2] pulseaudio: remove bbappend
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
X-List-Received-Date: Sun, 19 Aug 2012 10:57:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

oe-core has updated to 2.1 which includes the appended patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.7.4.4



