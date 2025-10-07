Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C643ACCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 18:56:56 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.27029.1759863411890825993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 11:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWSs5rIK;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b593def09e3so4888768a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863411; x=1760468211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2WDGduBaRzMQb0lHgQe08NOYElZVo5lMS6cHivvJwk=;
        b=DWSs5rIK/EfVIhoOD7rSNrerJfOwjwNQUcuxu+j4T3l+Ou3yKS3w3aWUsl+DwALpjZ
         t7ezcQG2dokkMm+V2mdfka9kpLRqY6ktykj+7KegR122ZLN8NGIVAm1gjnsRfqdIsD/G
         YlKrhxFhoo1vLzRecL0JqR9hDePJqViSz+Uchat9jgu1PY1kAvXQpK8mC4hYilbpXEyC
         FEi9G3toQfLhuy/kG3rYUumcahJ5rUJro4dL47K9+XkYGdq1n14RlTr5UIDyyhFmCu8L
         +VYRSKCFC4jiK26RLYwLUlfq/QLJX3AH05xoFa151iAp/EDcwUmWzfLGBz2lPI36IVf9
         kZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863411; x=1760468211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2WDGduBaRzMQb0lHgQe08NOYElZVo5lMS6cHivvJwk=;
        b=BIAwpqanLBIKN+GU+KqmCsx03a208OglcGYPXJkZp5A/vXMXFtzrBjoDqKOTToS5nS
         99ql2ZsWcsmXTuUPc6I4CX9FrE1hK1kITIGe7JYztZi6WsJrbpPiaJoauvyHDloaJyZp
         hyX/U9KgX58FTAQT829NMDY7pR4B7QZTZzwLcOUm6aexnMNDK/fm6eOq9WXHddzKFCAU
         NtVbYU9/01xbibqZFcyjIMWOp80JD5Sdf/KRt/6g9hV0Yz5X4zlFhQEcSEHXw8NS09q1
         auI6rad+ljZYXHfB+T26MVKx0dsYiDnezGXyFfzV85duJ9DoRtslcSA8ycl78p0gMPEs
         3nOw==
X-Gm-Message-State: AOJu0YwYqVR4aicrKkAaHPpOba5ODHfmd0gWtXn4ltmsMdITg+luQe6s
	MOzhfHpCQ9/JCYlR4Y+QitHu1PwUaSjt/8zgBCeExjal1FdglGaFmBz2UsISDVlb
X-Gm-Gg: ASbGncukgkCgU5E2fyKMgoXovapW7NBc5DsKKrLR3DtEroQRX+96zZvaOl73MmByU9O
	vYjGVJ1FSsc9Rh2bUJXDjvT2agUy08LeXSy33jZYhFWTkotmrqA2q5EEXd9KEJpRKQAU74aFmDW
	l5heJGLHezRDYkt1R6Cho1vns+9RJybcarE6ZMXOAxUyR9PfcAU595uDi/ozmmrIRKRfRcbE+hY
	M7RxS5xohiy6CthMe2h14fllljPyB9PhYkndZDA7YgwyqCMLI2mpjtVWguHp2/HwUJTIZloNlzU
	NyLVq+yAi0kdqT9psSpXFJZvG6im3tkkXADWx6N/D7xDpsXGfFUiC8E9SBWDv2MpCdGSuFfQ1+C
	eiI/NXmw0pQOdwUaNaPXPS+gtTEXkdyT+GLWRAX8ZR2z26hOHGCT6VM3KOQIUd35BthRoBdcXKo
	E34wEja3glFIwA+ingBXtZybH4xV0wiIIxd7TGgd0t+JYJH97P50e/resGD2Yl9N8=
X-Google-Smtp-Source: AGHT+IEQ7VwcBIatTqaQo89NYXoZXW7mQyj6JcxtjCJ5faOH6KYWXNb8c1O3AE/rqkXHA63eiUIlWw==
X-Received: by 2002:a17:902:cf08:b0:27e:da7d:32f5 with SMTP id d9443c01a7336-290272ca19fmr9739315ad.24.1759863410726;
        Tue, 07 Oct 2025 11:56:50 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1269b8sm172779695ad.50.2025.10.07.11.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] touchpademulator: Add recipe
Date: Tue,  7 Oct 2025 11:56:48 -0700
Message-ID: <20251007185648.874969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 18:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120345

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-CC-instead-of-hardcoding-gcc-calls.patch | 29 ++++++++++++++++
 ...mulator.sh-Demand-sh-instead-of-bash.patch | 25 ++++++++++++++
 .../touchpademulator/touchpademulator_git.bb  | 34 +++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/touchpademulator/touchpademulator/0001-makefile-Use-CC-instead-of-hardcoding-gcc-calls.patch
 create mode 100644 meta-oe/recipes-support/touchpademulator/touchpademulator/0002-LaunchTouchpadEmulator.sh-Demand-sh-instead-of-bash.patch
 create mode 100644 meta-oe/recipes-support/touchpademulator/touchpademulator_git.bb

diff --git a/meta-oe/recipes-support/touchpademulator/touchpademulator/0001-makefile-Use-CC-instead-of-hardcoding-gcc-calls.patch b/meta-oe/recipes-support/touchpademulator/touchpademulator/0001-makefile-Use-CC-instead-of-hardcoding-gcc-calls.patch
new file mode 100644
index 0000000000..062adc9665
--- /dev/null
+++ b/meta-oe/recipes-support/touchpademulator/touchpademulator/0001-makefile-Use-CC-instead-of-hardcoding-gcc-calls.patch
@@ -0,0 +1,29 @@
+From 37284f7208e43da34cac64b419219c5d4e20b36e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Oct 2025 15:25:50 -0700
+Subject: [PATCH] makefile: Use CC instead of hardcoding gcc calls
+
+This helps to cross-compile it using infrastructure like yocto
+
+Upstream-Status: Submitted [https://gitlab.com/CalcProgrammer1/TouchpadEmulator/-/merge_requests/4]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index adf39a6..4cebaa6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,9 @@
++CC ?= gcc
++
+ default:			TouchpadEmulator
+ 
+ TouchpadEmulator:	TouchpadEmulator.c
+-					gcc -Wall $(shell pkg-config --cflags dbus-1 dbus-glib-1) TouchpadEmulator.c -ldbus-1 -ldbus-glib-1 -lpthread -o TouchpadEmulator
++					$(CC) -Wall $(shell pkg-config --cflags dbus-1 dbus-glib-1) TouchpadEmulator.c -ldbus-1 -ldbus-glib-1 -lpthread -o TouchpadEmulator
+ 
+ clean:
+ 					git clean -dfx
diff --git a/meta-oe/recipes-support/touchpademulator/touchpademulator/0002-LaunchTouchpadEmulator.sh-Demand-sh-instead-of-bash.patch b/meta-oe/recipes-support/touchpademulator/touchpademulator/0002-LaunchTouchpadEmulator.sh-Demand-sh-instead-of-bash.patch
new file mode 100644
index 0000000000..999c557d54
--- /dev/null
+++ b/meta-oe/recipes-support/touchpademulator/touchpademulator/0002-LaunchTouchpadEmulator.sh-Demand-sh-instead-of-bash.patch
@@ -0,0 +1,25 @@
+From 5b715a6741a7a2fcd0dc04e31c682a0183a49fa6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Oct 2025 15:27:09 -0700
+Subject: [PATCH] LaunchTouchpadEmulator.sh: Demand sh instead of bash
+
+This script does not really use any bash specific extentions
+so asking for simple /bin/sh should be good and makes it more
+portable
+
+Upstream-Status: Submitted [https://gitlab.com/CalcProgrammer1/TouchpadEmulator/-/merge_requests/4]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ LaunchTouchpadEmulator.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/LaunchTouchpadEmulator.sh b/LaunchTouchpadEmulator.sh
+index d12fc27..63134cd 100755
+--- a/LaunchTouchpadEmulator.sh
++++ b/LaunchTouchpadEmulator.sh
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ if [ "$1" = "--autostart" ] ; then
+     mkdir -p ~/.config/autostart
diff --git a/meta-oe/recipes-support/touchpademulator/touchpademulator_git.bb b/meta-oe/recipes-support/touchpademulator/touchpademulator_git.bb
new file mode 100644
index 0000000000..e7b0387f7e
--- /dev/null
+++ b/meta-oe/recipes-support/touchpademulator/touchpademulator_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Emulate a touchpad mouse device using a touchscreen on Linux"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f744a106227710d355bcc787e464ba2d \
+                    file://debian/copyright;md5=7bed05b78c0e4abec501cf82c4b85d9c"
+
+SRC_URI = "git://gitlab.com/CalcProgrammer1/TouchpadEmulator;protocol=https;branch=master \
+           file://0001-makefile-Use-CC-instead-of-hardcoding-gcc-calls.patch \
+           file://0002-LaunchTouchpadEmulator.sh-Demand-sh-instead-of-bash.patch \
+           "
+
+PV = "0.3+git"
+SRCREV = "7800f4c3af4defaf1be1083c93983ed4ff0e3b32"
+
+inherit pkgconfig
+
+DEPENDS += "dbus dbus-glib"
+
+# Fixes:
+# File /usr/bin/TouchpadEmulator in package touchpademulator doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install 'DESTDIR=${D}'
+}
+
+FILES:${PN} += "${datadir}/icons"

