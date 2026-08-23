Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C947BC5B572
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 01:51:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7709.1787449912904039184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Aug 2026 18:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NHMahBd6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2904052b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Aug 2026 18:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787449912; x=1788054712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0C3Vl7gzhTHFEoXjSovoKnoy0UxnxbJhDP9xSwwLO+U=;
        b=NHMahBd65zDbtkYklM/7xvCrTTew5/dhJhv7IGyU6Sy8dy4Cp6ND0dUOwr5yCnS0qs
         CMdrOjjbbFXh71yYR19Um2lVny1j7543hk2X5jNmeaowAc61akiLp3cxZSeAOIRD3qJI
         HyaIk3Xe1W90sdNNlZL3orLzJBuLlGC69qXqfocwo/QzlUurub4cMxbvscFRZWz4AhBN
         M1Gz6kGRTdKXhKR5uNz5TltAleSK1m+ujJRc8zAxM+Nf9Nzb0r0wQIaa0MPi+W2yompX
         kCwybZfhSBwmKS7C+CGBSpUTivY/KiFXctam67DU6SqDvYChNbkHFVpSzCKe2VK605Ew
         P6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787449912; x=1788054712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C3Vl7gzhTHFEoXjSovoKnoy0UxnxbJhDP9xSwwLO+U=;
        b=ZZ/9YMvIL9RAFj22LwAGuZwz8rjua1XG0QA394wq+1hEm/Gfb4xDjVrm6UpxMmj2Ac
         O9s/pTpVOlwvvFcNNIKNLXwKeEb0q1Pq3Nvq6q55ECbfsvpjxU91OyLc/9Mk0ZACGv/U
         mg5r7ZmcKJiExhEwRXM/ztwoLg/nH9/7sPeXEO64rbkzBjXc6i3ZXYZfLqDXHF3ZFbHj
         78dJx5pZSjmhpo4vW32F++Ive+uLcuw2Elx3kd95eFrs7oX3asFRkuWo36Cn0+ZH6o79
         YI8Bhx0f56hS+bKg//51jn52MVPcnWdqgyQBqQnb1G8yOy5lS0VhkxL3xz/+ekLTATIr
         9OsA==
X-Gm-Message-State: AFuF++l09Dz/yeo96GU1mTFe/uAxui5o/7AHHPCkab1l0bmZ1ksgp9gc
	f1ORD6LuZ3DkybiIm6Jtcai9K0AoCAv8uGTxJgyBGv+cmdhEjpR8uP9E2/l+YQYt
X-Gm-Gg: AR+sD13plKTlD49wMOdS7Y0/f8Jzra9Vls2ALlbie7xnLkWGzXejTKHQrfatkejE6JU
	OA1YxXt/k5Mln7tnElBnVKqt9TsYpKYnAjQ6mp/TzKI5E5XJIKamtjzdtXOZYeD07BaPuXVQhRd
	WgoPxlWPaN2S6zyET/ZJ02aVXRrNQWL1sD/yHjbnIk7XA3Kyul+p0sTuNsG2qlS0vTLNb7NQDWg
	9MeOBtSDM1/dCWMGqlKrEluHeUSd6/69/COQtbr4lLO4YjlA6Ji2DRNO+pKfRrzEa+9MkZNW1K9
	F1SZCA0OukDjbBhEHtkASGDXZ/WHT99xGh/GZaHmlpGKWXyRuXtQZauxuHDzoG6EC6UuabPjZ5J
	ggm+Ftic9bqsfn5BqFqzO//WYH9Ewrgi5zB86fKAYAcdZs4BD1inO4V6FOPG9asf+Brc6vJh2kS
	p8cr/1giP3xjazl34ox8Wi0OI21IKkKGlB6HkMgMt7fw247nBH8I4Im5vcwDnoblDkEeYvRgTpv
	mIRiK9ONerH/HDyOuby47qf7PFS0geXMPup1eIIqEKuYE59YsFeLj1GoUW1nfTzfipR33hMbe1y
	00bE+4QbRDgKfufsZf7+rGxBs5En9QDc7B4yiIaLwrJtdZHg1xD0AIpk20sMXZkRNQksoMnUPx1
	1qWjqKXCBIEfsxaVuzA4/pJyV76U8XnW3g+zz7GcZxOP+mA==
X-Received: by 2002:a05:6a21:7313:b0:3cc:7aa0:9356 with SMTP id adf61e73a8af0-3cd14f270bdmr29933965637.12.1787449912019;
        Sat, 22 Aug 2026 18:51:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm16518135eec.30.2026.08.22.18.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:51:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_helper_alloc_info
Date: Sat, 22 Aug 2026 18:51:48 -0700
Message-ID: <20260823015148.2185471-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 01:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129434

Now that KERN_MAJ reflects the target kernel instead of the build host's
uname -r, vboxvideo is actually built for kernels older than 7.x -- and it
does not compile against 6.18.44:

  vbox_fb.c:336:16: error: implicit declaration of function 'drm_fb_helper_alloc_info'; did you mean 'drm_fb_helper_fill_info'? [-Wimplicit-function-declaration]
  vbox_fb.c:336:14: error: assignment to 'struct fb_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Linux commit 63c971af4036 ("drm/fb-helper: Allocate and release fb_info in a
single place") moved the struct fb_info allocation out of the drivers and into
the DRM core, and made drm_fb_helper_alloc_info() static; drivers now find the
instance ready to use in fb_helper->info by the time their .fbdev_probe
callback runs. vbox_fb.c guards its call with RTLNX_VER_MIN(6,19,0), which is
where the change landed in mainline.

Bumping that version check is not a fix. The commit was pulled into stable as
a Stable-dep-of and therefore appears in the *middle* of several series --
v6.6.151, v6.12.103 and v6.18.44 have all dropped the declaration that
v6.6.150, v6.12.102 and v6.18.43 still carry. No LINUX_VERSION_CODE
comparison can express that, and guessing wrong the other way is worse than a
build failure: on a 6.18.0..6.18.43 kernel fb_helper->info is still NULL when
.fbdev_probe runs, so the driver would dereference NULL at runtime.

So add an escape hatch to vbox_fb.c and let the build system decide. do_compile
greps the kernel headers we are actually compiling against and passes
-DVBOX_NO_DRM_FB_HELPER_ALLOC_INFO through KCFLAGS when the declaration is
gone. KCFLAGS rather than EXTRA_CFLAGS/VBOXMOD_CFLAGS because a command-line
assignment of the latter two would clobber the include paths they carry, while
KCFLAGS is untouched by VirtualBox's makefiles and propagates cleanly into the
nested $(MAKE) -C $(KERN_DIR). Leaving the macro undefined keeps the previous
behaviour, so nothing changes for kernels that still export the function, and
7.x is unaffected -- VBOX_VIDEO_MODULE is empty there and the in-tree
drivers/gpu/drm/vboxvideo driver is used instead.

Verified on qemux86-64 against linux-yocto 6.18.44, from cleansstate:
vboxguest.ko, vboxsf.ko and vboxvideo.ko all build with no modpost warnings,
the -D reaches the vbox_fb.o compile line, kernel-module-vboxvideo ships the
module, and `nm -u vboxvideo.ko` no longer references
drm_fb_helper_alloc_info -- all 155 remaining undefined symbols are exported
by the kernel's Module.symvers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-build-decide-if-drm_fb_helper_alloc.patch | 54 +++++++++++++++++++
 .../vboxguestdrivers_7.2.14.bb                | 45 +++++++++++-----
 2 files changed, 87 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
new file mode 100644
index 0000000000..cf94ce49b9
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
@@ -0,0 +1,54 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Aug 2026 00:00:00 -0700
+Subject: [PATCH] vboxvideo: let the build decide if drm_fb_helper_alloc_info()
+ exists
+
+Linux commit 63c971af4036 ("drm/fb-helper: Allocate and release fb_info in
+a single place") moved the struct fb_info allocation out of the drivers and
+into the DRM core, and turned drm_fb_helper_alloc_info() into a static
+function. Drivers now find the instance ready to use in fb_helper->info by
+the time their .fbdev_probe callback runs.
+
+vbox_fb.c guards its drm_fb_helper_alloc_info() call with RTLNX_VER_MIN(6,19,0),
+which is where the change landed in mainline. That is not sufficient: the
+commit was also picked up as a Stable-dep-of and so appeared in the middle of
+several stable series - v6.6.151, v6.12.103 and v6.18.44 all dropped the
+declaration while v6.6.150, v6.12.102 and v6.18.43 still have it. Building
+vboxvideo against any of those kernels fails with
+
+  vbox_fb.c:336:16: error: implicit declaration of function 'drm_fb_helper_alloc_info'; did you mean 'drm_fb_helper_fill_info'? [-Wimplicit-function-declaration]
+  vbox_fb.c:336:14: error: assignment to 'struct fb_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
+
+Since LINUX_VERSION_CODE cannot express "somewhere inside 6.6.y/6.12.y/6.18.y",
+add an escape hatch the build system can set once it has looked at the kernel
+headers it is actually compiling against. Leaving
+VBOX_NO_DRM_FB_HELPER_ALLOC_INFO undefined keeps the previous behaviour, so
+this is a no-op for anyone building the way VirtualBox intends.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vboxvideo/vbox_fb.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/vboxvideo/vbox_fb.c b/vboxvideo/vbox_fb.c
+index 063be63..7163780 100644
+--- a/vboxvideo/vbox_fb.c
++++ b/vboxvideo/vbox_fb.c
+@@ -330,7 +330,14 @@ int vboxfb_create(struct drm_fb_helper *helper,
+ 		return ret;
+ 	}
+
+-#if RTLNX_VER_MIN(6,19,0) || RTLNX_RHEL_RANGE(9,9, 9,99)
++	/*
++	 * Since Linux 6.19 the DRM core allocates the struct fb_info instance
++	 * before it calls into this callback, and drm_fb_helper_alloc_info() is
++	 * no longer available to drivers. A version check alone cannot express
++	 * that, because the change was backported into the middle of the 6.6,
++	 * 6.12 and 6.18 stable series, so let the build system tell us as well.
++	 */
++#if RTLNX_VER_MIN(6,19,0) || RTLNX_RHEL_RANGE(9,9, 9,99) || defined(VBOX_NO_DRM_FB_HELPER_ALLOC_INFO)
+ 	info = helper->info;
+ #elif RTLNX_VER_MIN(6,2,0) || RTLNX_RHEL_RANGE(8,9, 8,99) || RTLNX_RHEL_RANGE(9,3, 9,99)
+ 	info = drm_fb_helper_alloc_info(helper);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
index 45f3f22481..952eca1a06 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
@@ -22,6 +22,7 @@ VBOX_NAME = "VirtualBox-${PV}"

 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
 SRC_URI[sha256sum] = "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"

@@ -32,7 +33,18 @@ S:task-patch = "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"

-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${@(oe.kernel.get_version_file('${STAGING_KERNEL_BUILDDIR}') or '').split('.')[0]}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+# The Makefile uses KERN_MAJ to decide whether vboxvideo is built. It defaults to
+# the *host* kernel version (uname -r), so pass the target one instead.
+KERN_MAJ = "${@(oe.kernel.get_version_file(d.getVar('STAGING_KERNEL_BUILDDIR')) or '').split('.')[0]}"
+
+# VirtualBox only ships the out-of-tree vboxvideo DRM module for kernels older
+# than 7.x - from 7.x on the in-tree drivers/gpu/drm/vboxvideo driver is used
+# instead. Mirror that decision so the compile check, the install step and the
+# packaging stay in sync with what "make all" actually produced.
+VBOX_VIDEO_MODULE = "${@'vboxvideo' if (d.getVar('KERN_MAJ') or '').isdigit() and int(d.getVar('KERN_MAJ')) < 7 else ''}"
+VBOX_MODULES = "vboxguest vboxsf ${VBOX_VIDEO_MODULE}"
+
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${KERN_MAJ}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"

 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
@@ -70,20 +82,28 @@ do_configure:prepend() {

 # compile and install mount utility
 do_compile() {
-    oe_runmake all
-    oe_runmake 'LD=${CC}' 'EXTRA_CFLAGS=-I${STAGING_KERNEL_BUILDDIR}/include/' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
-    if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
-        echo "ERROR: One of vbox*.ko modules wasn't built"
-        exit 1
+    vbox_kcflags=""
+    if [ -e "${STAGING_KERNEL_DIR}/include/drm/drm_fb_helper.h" ] &&
+       ! grep -q drm_fb_helper_alloc_info "${STAGING_KERNEL_DIR}/include/drm/drm_fb_helper.h"; then
+        vbox_kcflags="-DVBOX_NO_DRM_FB_HELPER_ALLOC_INFO"
     fi
+
+    oe_runmake all KCFLAGS="$vbox_kcflags"
+    oe_runmake 'LD=${CC}' 'EXTRA_CFLAGS=-I${STAGING_KERNEL_BUILDDIR}/include/' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
+    for m in ${VBOX_MODULES} ; do
+        if ! [ -e $m.ko ] ; then
+            echo "ERROR: kernel module $m.ko wasn't built"
+            exit 1
+        fi
+    done
 }

 module_do_install() {
     MODULE_DIR=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/misc
     install -d $MODULE_DIR
-    install -m 644 vboxguest.ko $MODULE_DIR
-    install -m 644 vboxsf.ko $MODULE_DIR
-    install -m 644 vboxvideo.ko $MODULE_DIR
+    for m in ${VBOX_MODULES} ; do
+        install -m 644 $m.ko $MODULE_DIR
+    done
 }

 do_install:append() {
@@ -91,10 +111,11 @@ do_install:append() {
     install -m 755 ${S}/utils/mount.vboxsf ${D}${base_sbindir}
 }

-PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
-RRECOMMENDS:${PN} += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+VBOX_MODULE_PACKAGES = "${@' '.join('kernel-module-' + m for m in d.getVar('VBOX_MODULES').split())}"
+PACKAGES += "${VBOX_MODULE_PACKAGES}"
+RRECOMMENDS:${PN} += "${VBOX_MODULE_PACKAGES}"

 FILES:${PN} = "${base_sbindir}"

 # autoload if installed
-KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
+KERNEL_MODULE_AUTOLOAD += "${VBOX_MODULES}"

