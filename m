Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B14717316D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:43:57 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r144so46685104wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/i4AfErCXBIrG6wS3JfwPCN++HiWqqPUNrjLOvL6wPg=;
	b=nF6gQgxq3hmm7RGAYTs4PK5ZcDk29l0RH0k2+WgLRHPnPfl5ziM0OKdR5nn5X+5thV
	5kr6zxDQpvRRJNaCdgOimkJJJuq/YqiSX14PlC5kGiZFXQMSTI/afghtDxE/ypb4J84n
	oEiVWCL/vcg9jmdJPRbYpewr1sR9VxLRRBorLu1HZVEWy/lqhKS1lu+jeiZQP4K/QSEp
	szkNo+uyS+myubUUAg18aDtxPU+7z4cmAEjD8la4z8Kwdnk1XfBsUf0Ml6ZGt089sSjF
	+49XHaRJ8G4iOv4d1wOCh7mrXsqaOrvw0566GXBRrYUtXbDWO3+4ALloqbS6b+2XgKDw
	QrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/i4AfErCXBIrG6wS3JfwPCN++HiWqqPUNrjLOvL6wPg=;
	b=PRpj8fPy7SNlz/tZnkL9Q+FPWj1QihQUkUIDyA+TmCoyFK1J6d60UngBzj05HwKXR/
	e0i8xxJOXj+5yiAPEBymdq49/6qeMi2sZmdE1W3Y1xdBXyFYvqMomTfq1cfqyvBNlhuF
	YAoLOHSpZZxLm3841SOAp5LkUZj42h/54y9GSqs5Fb+z8lYgYMIHFAF4t4o4RqnabHFO
	ALquWjQoMQ8vBeyvJfLbRUjtwwiBWZ7d9opaAXrYIu1hMQSQfHpyJm+qarYeOW/ETH3p
	d0FUN8lxos46Yz4LQ6nkuPd/5XE9zk5PJiZivCkYdYhv7LVMFsqC0EOhhCig8eKmkYvD
	uIKw==
X-Gm-Message-State: AIkVDXKMfPn5p8vboCvbnG+BRYGUgbnucrhr/91W9I0OmVwSl5xD5cpMnK4ceHa/YBJKnXaG
X-Received: by 10.28.228.87 with SMTP id b84mr3612479wmh.0.1484923437216;
	Fri, 20 Jan 2017 06:43:57 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d29sm70220wrc.42.2017.01.20.06.43.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:43:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:43:50 +0000
Message-Id: <1484923430-3222-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
References: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 2/2] libxcalibrate: add, from oe-core
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
X-List-Received-Date: Fri, 20 Jan 2017 14:43:57 -0000

---
 .../xorg-lib/libxcalibrate/fix-xcb.patch           | 29 ++++++++++++++++++++++
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb | 22 ++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
new file mode 100644
index 0000000..d614883
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+There is no extra reply data and if we say not to disgard it, xcb
+throws fatal asserts.
+
+RP - 26/11/09
+
+Index: git/xcalibrate.c
+===================================================================
+--- git.orig/xcalibrate.c	2009-11-26 08:11:48.000000000 +0000
++++ git/xcalibrate.c	2009-11-26 08:09:55.000000000 +0000
+@@ -216,7 +216,7 @@
+   req->reqType = info->codes->major_opcode;
+   req->xCalibrateReqType = X_XCalibrateRawMode;
+   req->on = enable;
+-  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse)) 
++  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue)) 
+     {
+       UnlockDisplay (dpy);
+       SyncHandle ();
+@@ -240,7 +240,7 @@
+   req->xCalibrateReqType = X_XCalibrateScreenToCoord;
+   req->x = *x;
+   req->y = *y;
+-  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse)) 
++  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue)) 
+     {
+       UnlockDisplay (dpy);
+       SyncHandle ();
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb
new file mode 100644
index 0000000..455e869
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "XCalibrate: Touchscreen calibration library"
+
+DESCRIPTION = "libXCalibrate is a library for performing touchscreen \
+calibration with the kdrive tslib touchscreen driver."
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT-style"
+LIC_FILES_CHKSUM = "file://xcalibrate.h;endline=21;md5=fa572df6439f0f235f2612f370f153d7 \
+                    file://xcalibrate.c;endline=21;md5=fa572df6439f0f235f2612f370f153d7"
+
+DEPENDS = "virtual/libx11 calibrateproto libxext"
+
+SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
+PV = "0.0+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
+           file://fix-xcb.patch"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-locale += "${datadir}/X11/locale"
-- 
2.8.1


