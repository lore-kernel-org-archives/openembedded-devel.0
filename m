Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.34189.1609084244525943169
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 07:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PNDcZKS8;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c7so7734267edv.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 07:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLOy4NKs+0uZYLw9+IX4AI1W0dBRqhQfw6iicDU4468=;
        b=PNDcZKS8WyphMNMqvVfXYY26NSwfxgup1JgJoZXg4lp2MGel50n+jd8cKE8IqLQ49U
         A2TZkjEWqy95jozj3hBdFX1qk/hRxJeIwyzYdhCSXEPl6DNs8pBBCxYvhwdwr5U680hP
         fXyYji3DKpgQ0zppz7mjtFGXxeVCQ47NJ9A7vgpQuvl6htzYZQ4mp3eYWCBg6kxkRndM
         QXNcCVCQsRxl8VycYXf48PyqilQLU1r8ClhgPf5XBXLEAJa3vycqgxDEEjVrl8PfzLwa
         6qEFyFOI6rYBTbTFFy2Qhnxuz15CUwL4iJOg90nkWe1f+JKRueR7gR7IrDglqBSaLTgl
         K12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLOy4NKs+0uZYLw9+IX4AI1W0dBRqhQfw6iicDU4468=;
        b=FcBDpp4LNjpsz6K58kMyCSXxDhu0uxG6sh4Vfo4ZeH9fCuHQgTyNiKMACcDmJQXZ92
         HO145z5dEfM4BjWOdzQZM8ReBsvuDoxygNZILnGp0DMHW+SJpYZINWlqYa/BOemYpqoc
         gwHZfTV81JkDXbbS6t7aqasCSQC5fQK8y2zbGIOfrs6BR6JoTnbR/LXYRwSMdiyo57To
         baiMiB0f67mgwZIVznX8ompuOTy+cWgRGu9+AyHnoAf/0Kr/yYY0eiz+J7V32bw8V+zb
         kRi8f9dQrPq7sJ3J8mXNP9hu/K2VQXVxxEfBWkw8L9HaKzPphdXcttYGX16YBmDOehAg
         H9dw==
X-Gm-Message-State: AOAM532fXLyHRY4TeXxb2C93TXGD3vTPs9QdcwzuWhUqubinw5M0kAii
	WCaT5gA98rfG+RsLwCa7lqaFUgqGt8o=
X-Google-Smtp-Source: ABdhPJyhGVmOKhCgO16Pt9EccLU+KUzyIhZuZvN/rI/z244JpX/j2V8HnVgmAtIFGWUEjNqFesu77Q==
X-Received: by 2002:a05:6402:b4d:: with SMTP id bx13mr39237895edb.93.1609084242963;
        Sun, 27 Dec 2020 07:50:42 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m7sm35897783eds.73.2020.12.27.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 07:50:42 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] linuxconsole: move jscal to separate package, add to packagegroup
Date: Sun, 27 Dec 2020 16:50:40 +0100
Message-Id: <20201227155040.2397149-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* migrate the changes from 'joystick' recipe in meta-ros:
  https://github.com/ros/meta-ros/commit/ee3a3f6051594bdf39322d43ec08cce0df8f172c
* add 'joystick' in PROVIDES
* provide separate joystick-jscal package
* add PACKAGECONFIG for sdl use only to build ffmvforce
* respect nonarch_base_libdir to fix QA issue with usrmerge:
  ERROR: QA Issue: joystick package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
  and
  ERROR: linuxconsole-1.7.0-r0 do_package: QA Issue: linuxconsole: Files/directories were installed but not shipped in any package:
  /lib
  /lib/udev
  /lib/udev/js-set-enum-leds
  /lib/udev/rules.d
  /lib/udev/rules.d/80-stelladaptor-joystick.rules
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  linuxconsole: 5 installed and not shipped files. [installed-vs-shipped]
  as in:
  https://github.com/ros/meta-ros/commit/9fbfe41ac55a423afd57d9e24173a5655448acd5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../linuxconsole/linuxconsole_1.7.0.bb        | 37 +++++++++++++------
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5023e49510..38e7130075 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -367,6 +367,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      canutils \
      libsocketcan \
      libconfig \
+     linuxconsole \
      uml-utilities \
      libidn \
      libqb \
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
index c4cd1d609b..fb161b6583 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "https://sourceforge.net/projects/linuxconsole"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libsdl2"
-DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+DEPENDS = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/linuxconsole/linuxconsoletools-${PV}.tar.bz2 \
@@ -32,21 +31,32 @@ SYSTEMD_PACKAGES += "inputattach"
 SYSTEMD_SERVICE_inputattach = "inputattach.service"
 SYSTEMD_AUTO_ENABLE_inputattach = "enable"
 
+PROVIDES += "joystick"
+
+PACKAGECONFIG ??= "sdl"
+PACKAGECONFIG[sdl] = ",,libsdl2"
+
 do_compile() {
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'true', 'false', d)}; then
+        # drop ffmvforce so that we don't need libsdl2
+        sed '/^PROGRAMS/s/ffmvforce *//g' -i ${S}/utils/Makefile
+    fi
+    # respect nonarch_base_libdir path to keep QA check happy
+    sed 's#DESTDIR)/lib/udev#DESTDIR)/${nonarch_base_libdir}/udev#g' -i ${S}/utils/Makefile
     oe_runmake
 }
 
 do_install() {
     oe_runmake install
 
-    install -Dm 0644 ${WORKDIR}/51-these-are-not-joysticks-rm.rules ${D}${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules
-    install -Dm 0644 ${WORKDIR}/60-joystick.rules ${D}${base_libdir}/udev/rules.d/60-joystick.rules
+    install -Dm 0644 ${WORKDIR}/51-these-are-not-joysticks-rm.rules ${D}${nonarch_base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules
+    install -Dm 0644 ${WORKDIR}/60-joystick.rules ${D}${nonarch_base_libdir}/udev/rules.d/60-joystick.rules
 
     install -Dm 0644 ${WORKDIR}/inputattach.service ${D}${systemd_system_unitdir}/inputattach.service
     install -Dm 0755 ${WORKDIR}/inputattachctl ${D}${bindir}/inputattachctl
 }
 
-PACKAGES += "inputattach joystick"
+PACKAGES += "inputattach joystick-jscal joystick"
 
 # We won't package any file here as we are following the same packaging schema
 # Debian does and we are splitting it in 'inputattach' and 'joystick' packages.
@@ -64,20 +74,23 @@ FILES_joystick += "\
     ${bindir}/ffmvforce \
     ${bindir}/ffset \
     ${bindir}/fftest \
+    ${bindir}/jstest \
+    ${nonarch_base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules \
+    ${nonarch_base_libdir}/udev/js-set-enum-leds \
+    ${nonarch_base_libdir}/udev/rules.d/60-joystick.rules \
+    ${nonarch_base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \
+"
+
+FILES_joystick-jscal = " \
+    ${datadir}/joystick \
     ${bindir}/jscal \
     ${bindir}/jscal-restore \
     ${bindir}/jscal-store \
-    ${bindir}/jstest \
-    ${datadir}/joystick \
-    ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules \
-    ${base_libdir}/udev/js-set-enum-leds \
-    ${base_libdir}/udev/rules.d/60-joystick.rules \
-    ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \
 "
 
 RDEPENDS_inputattach += "inputattach-config"
 
-RDEPENDS_joystick += "\
+RDEPENDS_joystick-jscal += "\
     bash \
     gawk \
 "
-- 
2.27.0

