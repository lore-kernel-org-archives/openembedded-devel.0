Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BFF2C771EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:32:17 +0000 (UTC)
Received: by wmww144 with SMTP id w144so194261546wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BR6rxHOZKPUQmFXgzp5SikWEkUFO6UOZAB9Ps9vNGR4=;
	b=yMPU/wTlJCKBdy81midC4+p3K/F2yYFykKvR7+VqNHjz11Wju8CggXwZl2QZQydMWY
	nScrBr7nOmtjWJ1rYKbbHW2qx2+wboBISODyNErRqaq1gWOJiVmHGcUsTmbD4JYAXbOe
	J0XWTJn2FqNmazuaxjSPBEG9X8Jhj1jNkH7pmP/RJ5eFM4ZXv2v0Z+fjwaGiXBG3q57O
	E1OFKX7FzgirIbXsE7mMACSgnGqofogNEQNYf1RROHsQyM2RPBMSb2SqndWXd3De5C3t
	ukbUYZEWkJADSixFY9iH6GmagrnxW2UYE9+LYk/Fc4eE5WC14Tj5MT4iqASM99zleFDO
	jJrg==
X-Received: by 10.194.191.229 with SMTP id hb5mr15433867wjc.123.1447324337651; 
	Thu, 12 Nov 2015 02:32:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v192sm13158254wmv.5.2015.11.12.02.32.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 02:32:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 11:32:32 +0100
Message-Id: <1447324352-27951-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe] devicekit-power: add missing dependency on libgudev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 10:32:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 +-
 meta-oe/recipes-support/devicekit/devicekit-power_014.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index c1c319d..6365fee 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -15,7 +15,7 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe"
+EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
index 0c1245f..c2b7e66 100644
--- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
+++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
@@ -2,7 +2,7 @@ SUMMARY = "Devicekit power"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=756cf97871f77233638937da21b025d3"
 
-DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intltool-native"
+DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intltool-native libgudev"
 
 SRC_URI = "http://upower.freedesktop.org/releases/DeviceKit-power-${PV}.tar.gz;name=archive"
 SRC_URI[archive.md5sum] = "935d37f1e14b3c8a1d6dabcd9a38d3ca"
-- 
2.6.3


