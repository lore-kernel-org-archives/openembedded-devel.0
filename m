Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AA05278CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:19:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id o18-v6so5124462wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aMjO8Q5QmH8o+neXPtLhUpFHKV+h52XoLYsQSOJTIo4=;
	b=K14QVKNRcV44Vhl5LVfOkCD/7x0rMdw80eNbxJffCdfBRZ/AEUiiclpurhfRWFCadY
	7alaCken3JVbrQFoyJq680kkbRC4fW1Qd2JruBpPt2g90pZtCaVpP/Ed7uhZXVupejIq
	lp5DhQN9b8rGc8zpxWdKKrrTVkdvQeJ1+wLlIxH+smh7xjZVf8mt6OtLRxAQYaMxjONZ
	2yatRKNeT9RTO1967S7Vy+PwO3dT9CVB0WM6CtxeMd7im7fnxGvhObXqFlQsQnPYqJwM
	78jxwYZ6XnCNAA2ZCMBDAEtmnc1hnoNgSoQdhyCv9QlKyMCzrXgLfKbgLby44E4rPzRi
	iQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aMjO8Q5QmH8o+neXPtLhUpFHKV+h52XoLYsQSOJTIo4=;
	b=KMa6qutlZWRaf31GPf4l+T9X9LNcTYAgsxbmAKf2uic4RQVuSNuSTu2LzQGMTCLxbX
	ev5Gc79NrMEBq4O8M7tfHSrNkkREBqegJpT26l/ZuMeV37nlz51p5IWmmM4XUkx4SeN6
	UhczKblqBD1pw+jieO4G3raruKSAp9GuUVTDFm3IohWCc4PT+qE23CGS+wRUSk5llhfm
	3w33Z8GzgwkRPi2404nFJszzs12Zzn5Da7KoNSdTPKTQT0nxJpRTvjvqit9dU2NtUf6C
	tAkzCVmYfMq6ncua+g++JFgMct6pHJw9rY3SjG2jR6K2CVsYRz+HCmxsm/ypQrlIoARA
	FeHA==
X-Gm-Message-State: AOUpUlFqsG7j9lDJlLE/zkYpjZibtxf1vEwH+4Nw6dvofcf0mAERTcbo
	g6a6L1NfQRP7NCiaJ+f+sSAQ6o6aa10=
X-Google-Smtp-Source: AAOMgpeG4j1xRuViI+11oxAjg1F1M6Ics/qrw0Z9y2t4RgM5hgqvOUcJSOmKTZTBVsWHq0RWMkBrMw==
X-Received: by 2002:a1c:2396:: with SMTP id
	j144-v6mr4016300wmj.26.1532690357868; 
	Fri, 27 Jul 2018 04:19:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	139-v6sm2340182wmp.4.2018.07.27.04.19.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 04:19:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 12:19:14 +0100
Message-Id: <20180727111914.29899-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libusb-compat: add (from oe-core)
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
X-List-Received-Date: Fri, 27 Jul 2018 11:19:18 -0000

This is being removed from oe-core, so add to meta-oe as some recipes still
claim to need it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-usb.h-Include-sys-types.h.patch           | 30 ++++++++++++++++
 .../recipes-support/libusb/libusb-compat_0.1.5.bb  | 42 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
 create mode 100644 meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb

diff --git a/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
new file mode 100644
index 0000000000..b88440dec9
--- /dev/null
+++ b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
@@ -0,0 +1,30 @@
+From 340f911f9e3f4ff6b01682c5341c959060782af2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Apr 2015 19:18:45 -0700
+Subject: [PATCH] usb.h: Include sys/types.h
+
+We need the definitions for things like u_intX_t
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libusb/usb.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libusb/usb.h b/libusb/usb.h
+index 84e730f..caffae2 100644
+--- a/libusb/usb.h
++++ b/libusb/usb.h
+@@ -31,6 +31,8 @@
+ 
+ #include <dirent.h>
+ 
++#include <sys/types.h>
++
+ /*
+  * USB spec information
+  *
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb
new file mode 100644
index 0000000000..1ddbe238fc
--- /dev/null
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -0,0 +1,42 @@
+SUMMARY = "libusb-0.1 compatibility layer for libusb1"
+DESCRIPTION = "libusb-0.1 compatible layer for libusb1, a drop-in replacement \
+that aims to look, feel and behave exactly like libusb-0.1"
+HOMEPAGE = "http://www.libusb.org/"
+BUGTRACKER = "http://www.libusb.org/report"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2ac5f3ac4835e8f91324a26a590a423"
+DEPENDS = "libusb1"
+
+# Few packages are known not to work with libusb-compat (e.g. libmtp-1.0.0),
+# so here libusb-0.1 is removed completely instead of adding virtual/libusb0.
+# Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
+# consumption.
+PROVIDES = "libusb virtual/libusb0"
+BBCLASSEXTEND = "native nativesdk"
+
+PE = "1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
+           file://0001-usb.h-Include-sys-types.h.patch \
+          "
+
+SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
+SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
+
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
+UPSTREAM_CHECK_REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
+
+BINCONFIG = "${bindir}/libusb-config"
+
+inherit autotools pkgconfig binconfig-disabled lib_package
+
+EXTRA_OECONF = "--libdir=${base_libdir}"
+
+do_install_append() {
+	install -d ${D}${libdir}
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	fi
+}
-- 
2.11.0


