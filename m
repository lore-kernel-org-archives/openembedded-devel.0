Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKotp-00073V-Os
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:09 +0200
Received: by fxm19 with SMTP id 19so1839288fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=rM+YNZBFN0VE8ERZRetwSQo/C1wrKXM2Qgd6RH5kkUo=;
	b=oX9CCoVZKcNxiyIccA3aFcBHQ9Cy3lk2jDtXxoipRV6EWaQY4M9JI0iQ/zKPpU7eLL
	wDZunfoZthN8gWBgJNiV9NYNxssV0S4qZOaWu2JYNXs5Q4kZTOjQK0i48dpkhxNRv91i
	dL4klUGngG9WvwIHbxuEdX6w0uwFFbWAFaiDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=h/llZYEE6+FFuQjYwC3KOqu6hsEP5AHHL7BZbA3l2AUnOuvx6TDwvZ29D0ELTQcKOu
	m5VB6US7yWhSZyxr0LKAxW2COv/lbSaCUnnuCgbxsnzstp07dxfGEe72wmrBVZM702Pz
	TbefKRyOhqaxvZ1ui5eu8/+hql71Cz3y/wmc0=
Received: by 10.223.44.86 with SMTP id z22mr1518343fae.3.1305279621362;
	Fri, 13 May 2011 02:40:21 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t15sm776465fau.0.2011.05.13.02.40.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:05 +0200
Message-Id: <1305279609-31395-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] xserver-xorg: upgrade to 1.10.1.901 and make it default for SHR
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
X-List-Received-Date: Fri, 13 May 2011 09:43:09 -0000

* bump xorg-driver-common INC_PR to rebuild drivers against new ABI from xserver-1.10

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-driver/xorg-driver-common.inc         |    2 +-
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 -------
 .../hack-fbdev-ignore-return-mode.patch            |   39 --------------------
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg_1.10.0.902.bb    |   31 ----------------
 recipes/xorg-xserver/xserver-xorg_1.10.1.901.bb    |   32 ++++++++++++++++
 7 files changed, 86 insertions(+), 85 deletions(-)
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.10.0.902.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.10.1.901.bb

diff --git a/recipes/xorg-driver/xorg-driver-common.inc b/recipes/xorg-driver/xorg-driver-common.inc
index 53b499e..f7878a9 100644
--- a/recipes/xorg-driver/xorg-driver-common.inc
+++ b/recipes/xorg-driver/xorg-driver-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "X driver"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/drivers"
 LICENSE = "MIT-X"
-INC_PR = "r15"
+INC_PR = "r16"
 
 DEPENDS = "randrproto xorg-server xproto"
 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.10.0.902/hack-fbdev-ignore-return-mode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
-(and probably other) while returning from chvt or resume on some
-hardware (e. g. zaurus).
-
-Correct fix would require debugging of fbdev mode during LeaveVT and
-EnterVT.
-
-This patch may cause staying in incorrect or corrupted display mode
-after EnterVT, but on man affected devices it does not cause any visible
-problems.
-
-Hacked code is never called on properly written drivers.
-
-Devices affected and testers involved for future patch removal:
-Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
-
-See also:
-https://bugzilla.redhat.com/show_bug.cgi?id=238451
-
-The bug (first line indicates that your device is affected):
-
-(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
-
-Fatal server error:
-EnterVT failed for screen 0
-
-Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-===================================================================
---- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
-+++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
- #if DEBUG
- 		print_fbdev_mode("returned", &set_var);
- #endif
--		return FALSE;
-+		/* return FALSE; UGLY HACK to allow return from chvt */
- 	}
- 
- 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
@@ -0,0 +1,14 @@
+diff --git a/fb/fbcopy.c b/fb/fbcopy.c
+index 07eb663..ba394b7 100644
+--- a/fb/fbcopy.c
++++ b/fb/fbcopy.c
+@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
+     while (nbox--)
+     {
+ #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
+-	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
+-	    !upsidedown)
++	if (pm == FB_ALLONES && alu == GXcopy)
+ 	{
+ 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
+ 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg_1.10.0.902.bb b/recipes/xorg-xserver/xserver-xorg_1.10.0.902.bb
deleted file mode 100644
index 9ac0c41..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.10.0.902.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PE = "2"
-PR = "${INC_PR}.0"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI += " \
-            file://hack-fbdev-ignore-return-mode.patch \
-            file://hack-assume-pixman-supports-overlapped-blt.patch \
-           "
-SRC_URI[archive.md5sum] = "65e5db9e614cd75e97840247c3754521"
-SRC_URI[archive.sha256sum] = "994ab87bb0cc9b56203e01e3294fddd502a96d074139496ea4ffc03c95b41b42"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
diff --git a/recipes/xorg-xserver/xserver-xorg_1.10.1.901.bb b/recipes/xorg-xserver/xserver-xorg_1.10.1.901.bb
new file mode 100644
index 0000000..9978153
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.10.1.901.bb
@@ -0,0 +1,32 @@
+# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
+DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
+
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
+PE = "2"
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_shr = "1"
+
+SRC_URI += " \
+            file://hack-fbdev-ignore-return-mode.patch \
+            file://hack-assume-pixman-supports-overlapped-blt.patch \
+           "
+SRC_URI[archive.md5sum] = "64585a28abb18726d950cf1005bbcce4"
+SRC_URI[archive.sha256sum] = "b7d775891e7e7fc3001763cf5727995b81bf07b72e12d9d41db282fe625298e6"
+
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+# The NVidia driver requires Xinerama support in the X server. Ion uses it.
+PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
+XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
+
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
+
+export LDFLAGS += " -ldl "
-- 
1.7.5.rc3



