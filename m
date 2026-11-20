Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8739.1795189706464853648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 07:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=CeTpPMxW;
 spf=pass (domain: snapchat.com, ip: 209.85.221.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so639689f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 07:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1795189704; x=1795794504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPPId0IBiXeEJEFWMtd23CnXechn1Qrhxz1HCkJ+Z88=;
        b=CeTpPMxWB8GUaD1EmrAUswRO54j3ipAmbvCLpWWxzfEh47xdVXDn6AeqUWcqsOmH/Q
         kxLUg714eI9jHlZAIJGyOAHWzD3xyJyhy/CPJIPygHY3j0oyHajVav4DVlL3YtyraBgk
         pf4uzrY+cgxk4gOXly9mgjzj/OmNZP8HY1oaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189704; x=1795794504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPPId0IBiXeEJEFWMtd23CnXechn1Qrhxz1HCkJ+Z88=;
        b=bXBIQ90de2jO8gh2E006x7Cpu5v/s+pLVHPrUwMru8fmOkxqN/MSewako5u7lfULr2
         g0MEOIjElWYIM24WREYQ+akBEOySQXCcMvqCxLERkpxE+rOj7ljtRugRI/Vw14a3djmM
         osYtf7PphTWmgqmRZ/FuzaEtcrEIzhJ95H4AJPNAS2dfbmIjSJCxYrSZOexscWG0z6GB
         s5urLBVIukrn53OyrDF0TYBJ5+3/s/hJL0gT+0JmS/PpKq5+I/5O53277thunHV/A1QN
         t+XWLBh5Yr4AUjF6awF2QI9uDnXqHJ6HYrkBjJornCyV2X7mS0ZZ9cGQtnKfJZss495q
         m5ew==
X-Gm-Message-State: APuU4Z+QLjGi1tRdebYL6DWYHUak3OBfXI/29XoxQ/x9LpnX6TUvUfzP
	0amNkUUXkvf+0YYFoO02H2m2giJZhb1T1c1p3oXkXF6xVGIo/rU1LjV+l6l3kYdTB7hoIMMPTIv
	Ug1PSfuI=
X-Gm-Gg: AZFdTZc0F2CRcXK+04pYOcPO5d5seVuChw+FgfFeUYab7ZJuE37FRd/eI9C5PtFrP4d
	DftflOwjwmQPx4QmCylHcfYMjRG3G+R/TVZ4zupaR28QUdky3VXWEB4MKWda908tZ+AkI9U1LAC
	1o70S778efU/0Ge/k/FlHcKY8I0mAI2DtS50IMjHh+Dx/uIl6a5IH6Gy3lOh1AShQKiCetTmA9E
	DEnvbVsneGX2XsZxM1XWSE2Rf5GBMoi56nlHmI8ssUALe77C4G0vV5aZrvuMSH0R01cyBKfgCro
	77rA13Xq+fGCoTF/ik0LKBNS02gangWPWouCZr/n+Cf71vJvTtumxqS7EcrJAZGork9nFzif+PE
	+dW5z+mV7fWoGVTRUHkG63Yf76OJaDbc2QoCpWlv7dChXZDtMaRqYrQL2SE/fjTPeZMPQcdlRgj
	qwt9qt2d62KVtyevOR775PK8sLOIyFAdZ2Ux9ZWGXEmMrr/cJ8LEsUCunw2DhQS2vJhcPOIi4lZ
	qTDhZ6S2Nu78DHUaO258UvGFJ9cgWUbcM0X1zTOsp29U0r711ymwTnYWoymq79PPvfseB9Bqdxa
	QrEQ/dIooUA5ciOedySuBFo6kJ0/naEzBX3LM2kZmoZ6JQ9cS4qWPQgVDyvWs2f3gOM+VlMD7iF
	SuIlGp9Cikxt+K3IvwMGwZxhsYi7kNiXDpM0GgJOcxeu3T0BsJn33y1bXnykBn0aCT9lukq3Xov
	tQHzFe68vKOUxoVMiAzwEW
X-Received: by 2002:a05:6000:22ca:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-4abacfea532mr7968253f8f.7.1795189704396;
        Fri, 20 Nov 2026 07:48:24 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm5285862f8f.27.2026.11.20.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:48:23 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] android-tools: make usbgadget optional
Date: Fri, 20 Nov 2026 16:48:18 +0100
Message-ID: <20261120154818.4037066-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 15:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132776
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

adbd can also be used over TCP, so USB gadget support is optional.
android-tools-conf only contains the configfs USB gadget setup (scripts and
a systemd drop-in), but android-tools depends on it unconditionally. On a
machine without a USB device controller, android-gadget-setup fails and adbd
does not start, even if it is only meant to be reached over TCP.

Add a "usbgadget" PACKAGECONFIG, and make the dependency on
android-tools-conf, and the recommendation for the gadget kernel modules,
conditional on it. The dependency moves from android-tools to
android-tools-adbd, the package the drop-in belongs to.

Enable usbgadget by default for every machine, as before. Machines without
a USB device controller can remove it from PACKAGECONFIG.

AI-Generated: Uses Claude Code
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../android-tools/android-tools_35.0.2.bb             | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 045642a683..38b522084d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -239,9 +239,9 @@ do_install:append:class-native() {
 }
 
 PACKAGES =+ "${PN}-adbd"
-RDEPENDS:${PN}:class-target = "android-tools-conf-configfs 7zip android-libboringssl"
-RDEPENDS:${PN}-adbd += "${PN}"
-RRECOMMENDS:${PN}-adbd += "kernel-module-libcomposite kernel-module-usb-f-fs"
+RDEPENDS:${PN}:class-target = "7zip android-libboringssl"
+RDEPENDS:${PN}-adbd += "${PN} ${@bb.utils.contains('PACKAGECONFIG', 'usbgadget', 'android-tools-conf', '', d)}"
+RRECOMMENDS:${PN}-adbd += "${@bb.utils.contains('PACKAGECONFIG', 'usbgadget', 'kernel-module-libcomposite kernel-module-usb-f-fs', '', d)}"
 PRIVATE_LIBS:${PN} = "liblog.so.0 libbase.so.0 libcutils.so.0"
 
 inherit useradd
@@ -260,9 +260,12 @@ FILES:${PN}-adbd = " \
 
 BBCLASSEXTEND = "native"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} usbgadget"
 # Apply Android's fs_config ownership/mode tables to files pushed by adbd to
 # /system, /vendor and /oem. Off by default: the tables describe Android
 # partition images and are meaningless on a generic Linux rootfs.
 PACKAGECONFIG[fs-config] = ""
 PACKAGECONFIG[systemd] = ",,systemd"
+# adbd over a USB gadget. Machines without a USB device controller (UDC) do not need them,
+# and can use adbd over TCP.
+PACKAGECONFIG[usbgadget] = ""
-- 
2.43.0

