Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 490EA7843F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 10:51:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l43so16538858wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 02:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1ZudTb4l2APE8BROWnjKXvq76pFzl8noHeRIelDEknQ=;
	b=vR4MSG08kSBMeOj3qYL0y1aoEw+neuAnZbqtUoSEKZGFoOTD3kcoxxyWQUlujnI3tT
	nTmUvGD+sQd+1u/6L94FnMhvDEQeTD/rgHM6ajgjqgpG8ijd26dMNf4RJq+p7nAXC8ez
	36pLpo7hO2wEKeYRnUGp76hx/KoaSz3wkGCjcYr5NjveiB7zsP0eP/PwKjF7mZAy0s8e
	AzehOr54uiNStO6hfesxDVuII5tBnGt+lgJ69t6y0+RjGBNU9PNMY0Lrkmpm+zQZOG5N
	MEtPY6Xi5rcQmRFFPaBRtl/UObemXNpFRLVOPCZ6cyIVeLWSr280NfmOUHfdDnKkWSKR
	2Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1ZudTb4l2APE8BROWnjKXvq76pFzl8noHeRIelDEknQ=;
	b=ZxSCSYERepaNx3Gc7x3OmVmeRIpNn8yxsD1oA/SRFOjAMXlyGiTIOutfcpRk72++2B
	Xeey5WX0OSiU/0qHidXoiPn/0gaE2tYkEW93HoziXGZLyUX+24JUMXwHOTWboPedNzRz
	2FDGQKusOw9QLJZAx4tgsL5WxTJWLapqsGTNzJr55BY9E5XJWS9ZQVFBHVSif6eEBdPM
	MUXMKSnLBYjd1ijLaWImTboVtwFqQLhxGysIH4EfQRBlV/SsdQ3ly26L8J+P7EHdT5vO
	l+H8/NszqjrBKqz8vXALEyYEHn0aTceLsLbe6Xo0sZx4aJgys4/n3dAbwOiM75fOvhrq
	bIgg==
X-Gm-Message-State: APf1xPCSrQ1Hv2qvekj1I8w3qjjESHhQb3oo6IDhr5k68DKrbKIQoIap
	SsyJHos1Qrlf0Eabh7usSCvXaA==
X-Google-Smtp-Source: AH8x2266op9b4XFeBiWVGkyUKAhczXlb7MQf2wbFF/ZunUGaslMnP3zsWY9WZqQll9vvWo3s1R1ffA==
X-Received: by 10.223.165.67 with SMTP id j3mr4451177wrb.111.1519469516754;
	Sat, 24 Feb 2018 02:51:56 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o82sm3075034wmo.30.2018.02.24.02.51.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 24 Feb 2018 02:51:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Feb 2018 10:51:55 +0000
Message-Id: <20180224105155.14511-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.2.6
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
X-List-Received-Date: Sat, 24 Feb 2018 10:51:56 -0000

* 5.1.26 doesn't build with 4.15 kernel

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90 ++++++++++++++++++++++
 ...drivers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} | 22 ++++--
 2 files changed, 107 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} (69%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
new file mode 100644
index 0000000000..23a9021f04
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
@@ -0,0 +1,90 @@
+Based on:
+https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
+
+Upstream-Status: Pending (hopefully new vbox will be released soon with proper 4.15 support, this patch isn't backwards compatible)
+
+--- vbox_module.orig/vboxvideo/vbox_mode.c	2018-02-18 16:42:47.000000000 +0000
++++ vbox_module/vboxvideo/vbox_mode.c	2018-02-18 16:55:14.466029313 +0000
+@@ -396,7 +396,7 @@
+ 
+ 	/* pick the encoder ids */
+ 	if (enc_id)
+-		return drm_encoder_find(connector->dev, enc_id);
++		return drm_encoder_find(connector->dev, NULL, enc_id);
+ 
+ 	return NULL;
+ }
+--- vbox_module.orig/vboxguest/VBoxGuest-linux.c	2018-02-18 16:42:28.000000000 +0000
++++ vbox_module/vboxguest/VBoxGuest-linux.c	2018-02-18 16:54:36.793049118 +0000
+@@ -1058,7 +1058,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
+ 
+ /** log and dbg_log parameter setter. */
+-static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const struct kernel_param *pParam)
+ {
+     if (g_fLoggerCreated)
+     {
+@@ -1073,7 +1073,7 @@
+ }
+ 
+ /** log and dbg_log parameter getter. */
+-static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct kernel_param *pParam)
+ {
+     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
+     *pszBuf = '\0';
+@@ -1084,7 +1084,7 @@
+ 
+ 
+ /** log and dbg_log_flags parameter setter. */
+-static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const struct kernel_param *pParam)
+ {
+     if (g_fLoggerCreated)
+     {
+@@ -1098,7 +1098,7 @@
+ }
+ 
+ /** log and dbg_log_flags parameter getter. */
+-static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct kernel_param *pParam)
+ {
+     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
+     *pszBuf = '\0';
+@@ -1109,7 +1109,7 @@
+ 
+ 
+ /** log and dbg_log_dest parameter setter. */
+-static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogDstSet(const char *pszValue, const struct kernel_param *pParam)
+ {
+     if (g_fLoggerCreated)
+     {
+@@ -1123,7 +1123,7 @@
+ }
+ 
+ /** log and dbg_log_dest parameter getter. */
+-static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param *pParam)
++static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct kernel_param *pParam)
+ {
+     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
+     *pszBuf = '\0';
+@@ -1134,7 +1134,7 @@
+ 
+ 
+ /** r3_log_to_host parameter setter. */
+-static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct kernel_param *pParam)
++static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const struct kernel_param *pParam)
+ {
+     if (    pszValue == NULL
+         || *pszValue == '\0'
+@@ -1152,7 +1152,7 @@
+ }
+ 
+ /** r3_log_to_host parameter getter. */
+-static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct kernel_param *pParam)
++static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct kernel_param *pParam)
+ {
+     strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
+     return strlen(pszBuf);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
similarity index 69%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
index fdefe03172..c018b789f2 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
@@ -12,22 +12,27 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
 VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
-           file://Makefile.utils \
+    file://Makefile.utils \
 "
-SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
-SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
+
+# For default linux-yocto 4.15
+SRC_URI += "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff"
+
+SRC_URI[md5sum] = "4490d6929dfae41cdf05e34f583318c8"
+SRC_URI[sha256sum] = "fe705288ee50efcce10ff4c80e461a1c7091e461a7b55f98842fa1c9772ca4e7"
 
 S = "${WORKDIR}/vbox_module"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH_x86-64="amd64"
-export KERN_DIR="${STAGING_KERNEL_DIR}"
+
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
 
 addtask export_sources before do_patch after do_unpack
 
 do_export_sources() {
     mkdir -p "${S}"
-    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules ${T}/vbox_modules.tar.gz
+    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh ${T}/vbox_modules.tar.gz
     tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
 
     # add a mount utility to use shared folder from VBox Addition Source Code
@@ -38,6 +43,13 @@ do_export_sources() {
 
 }
 
+do_configure_prepend() {
+    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:99: *** The variable KERN_DIR must be a kernel build folder and end with /build without a trailing slash, or KERN_VER must be set.  Stop.
+    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108: *** The kernel build folder path must end in <version>/build, or the variable KERN_VER must be set.  Stop.
+    mkdir -p ${WORKDIR}/${KERNEL_VERSION}
+    ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
+}
+
 # compile and install mount utility
 do_compile_append() {
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
-- 
2.15.1


