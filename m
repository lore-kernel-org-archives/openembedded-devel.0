Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9ADB47CE5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 18:51:00 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m35so17517757ede.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lTQXCRTiOUzLVJM+MGcNBmUApF6A3yYulj1O/nHwS84=;
	b=0BfaoKkiRvO2yEoiQmIXqSeEgSCsuorMLuCGCC0QEUNjb78NNb3ZV+IfhYug3CeCtd
	x/AlL7lAyqFujo0IGWL/gSco8DEsKrvGHZSTljhzmbVI6GikWbigURKx9I+gXZ523Rhr
	6oiTrrX6mhrWK6XYdLHr2t9HDIFR3Kadh0ppJCJP8grspQfSN6kyKaJLPVcfgxjdwLIV
	WGCsTEtJS6ki2+Gky/4onnPBDXmnd0MBpFj/h1hZ5mKjTe8Y0f12/dutyqgjXXIZCzuc
	uMGv6GJkznkUqqcnSWTb8FPZRcYYlDPlj1zKs30LRmcA4xVJleZpeLgngEKK7k+DxFQW
	9qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lTQXCRTiOUzLVJM+MGcNBmUApF6A3yYulj1O/nHwS84=;
	b=WK59AkdGXG1nXMszSM5xXTlw56cXXPZ4xC/EqAimhNFJ2lGlxncxMsWK488iQ8o0VM
	Ncm6/+F2+Wf5I0Wq7D4sbmm7Mo/g3lteJenIeGIiqKcRaQ/ka0YCEq33xKHdLCP2E4nb
	I57wFT0/L/HPbqkVXIKqG94T9k5FRmRJgAzxUtaOYo8N1uiptUw16bRQdeqDxB+V9z2Z
	59762C5DUwgBtTVbnl2v1PsLOIM+8odtb/0HQqCt30cxQWZJtzDyVojMKto+870hYmVp
	X0oqCLCXMGEth4Ov0Ygwo9KR+C1W/lC5kpjTs7uuJPIkmnjDvXObTAigfCebcgIghfnM
	iklg==
X-Gm-Message-State: APjAAAVpLpWOoEsMFSxlnlEI3sN/D3OlOfflQs4awLCQv6PEPnRIn2NB
	XMFyylgVh+NszyhARcWDwOYNVC9tf4A=
X-Google-Smtp-Source: APXvYqxXxxUXE0SOPZfhD01w00NF9r2rtWaWklMNML9D/Nix+MioVbEbrxOLRFUKMWJ4SK+nhuNBbw==
X-Received: by 2002:a50:ba24:: with SMTP id g33mr4030593edc.164.1553021460826; 
	Tue, 19 Mar 2019 11:51:00 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	i14sm4658447edk.20.2019.03.19.11.50.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 11:51:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2019 19:50:54 +0100
Message-Id: <20190319185054.28570-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH v2] blueman: update to 2.0.8
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
X-List-Received-Date: Tue, 19 Mar 2019 18:51:00 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../blueman/0001-Fix-building-on-musl.patch   | 56 +++++++++++++++++++
 .../{blueman_git.bb => blueman_2.0.8.bb}      |  8 +--
 2 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
 rename meta-networking/recipes-connectivity/blueman/{blueman_git.bb => blueman_2.0.8.bb} (78%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
new file mode 100644
index 000000000..beef5d7c5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
@@ -0,0 +1,56 @@
+From ff03542e1ff24646ef16754157a6eb6437172153 Mon Sep 17 00:00:00 2001
+From: Kylie McClain <somasis@exherbo.org>
+Date: Sun, 13 Dec 2015 21:32:05 -0500
+Subject: [PATCH] Fix building on musl libc
+
+The addition of sys/time.h to libblueman.c is needed for `tv`'s usage,
+which is defined by musl's time.h.
+
+In addition, XCASE must be defined since it is normally provided by
+glibc's termios.h.
+---
+ blueman/main/PPPConnection.py | 2 +-
+ module/libblueman.c           | 1 +
+ module/modem-prober.c         | 4 ++++
+ 3 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/blueman/main/PPPConnection.py b/blueman/main/PPPConnection.py
+index 0aab1d98..1a3a9925 100644
+--- a/blueman/main/PPPConnection.py
++++ b/blueman/main/PPPConnection.py
+@@ -131,7 +131,7 @@ def Connect(self):
+         attrs[0] &= ~(termios.IGNCR | termios.ICRNL | termios.IUCLC | termios.INPCK | termios.IXON | termios.IXANY |
+                       termios.IGNPAR)
+         attrs[1] &= ~(termios.OPOST | termios.OLCUC | termios.OCRNL | termios.ONLCR | termios.ONLRET)
+-        attrs[3] &= ~(termios.ICANON | termios.XCASE | termios.ECHO | termios.ECHOE | termios.ECHONL)
++        attrs[3] &= ~(termios.ICANON | getattr(termios, 'XCASE', 4) | termios.ECHO | termios.ECHOE | termios.ECHONL)
+         attrs[3] &= ~(termios.ECHO | termios.ECHOE)
+         attrs[6][termios.VMIN] = 1
+         attrs[6][termios.VTIME] = 0
+diff --git a/module/libblueman.c b/module/libblueman.c
+index 7f1626bc..a86fad59 100644
+--- a/module/libblueman.c
++++ b/module/libblueman.c
+@@ -28,6 +28,7 @@
+ #include <string.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
++#include <sys/time.h>
+ #include <unistd.h>
+ #include <linux/sockios.h>
+ #include <linux/if.h>
+diff --git a/module/modem-prober.c b/module/modem-prober.c
+index daffaa4e..972ec146 100644
+--- a/module/modem-prober.c
++++ b/module/modem-prober.c
+@@ -34,6 +34,10 @@
+ 
+ #include "modem-prober.h"
+ 
++#ifndef XCASE
++#define XCASE 0000004
++#endif
++
+ #if PY_MAJOR_VERSION >= 3
+ #define PyString_FromString PyUnicode_FromString
+ #endif
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/blueman/blueman_git.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
index 947db7836..459db2a73 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
@@ -7,12 +7,12 @@ DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-nat
 inherit autotools systemd gsettings python3native gtk-icon-cache
 
 SRC_URI = " \
-    git://github.com/blueman-project/blueman.git \
+    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
+    file://0001-Fix-building-on-musl.patch \
 "
-SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
-PV = "2.0.5+git${SRCPV}"
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "51dc07d48125ee9600e7f6168d6e67f6"
+SRC_URI[sha256sum] = "04afd07b4c900a401f39e711dedbf8b9cf12000ddeda0d8ef3c3327caf34704e"
 
 EXTRA_OECONF = " \
     --disable-runtime-deps-check \
-- 
2.17.1


