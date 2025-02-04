Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9559DC0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 08:47:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.111550.1738658870302085003
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 00:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=XFsJusZR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385dece873cso2461336f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 00:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738658868; x=1739263668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUvNDuK2KeGICqfgaStTgyWwXNRLoLy7XA9E2FucFQ4=;
        b=XFsJusZRjTrouNCT2J5aSJI4IWXHokklhn9X4i/ME8+y/POcd/Ak1vZ7MeGLaKdpRd
         PGDZNTj3+7UCaFQpkqUv28vAYOQLV8PKBSIluiGqoWO2moSrCw45vv3snZ/3Tvrwf5qR
         fwyOjirSVsGCfatrQe7Io0XmRMv+l+JIUHVw+E1DfcOWrMq4SaXWOrKFoepNK65cfxD+
         PlR+AqcJyLGQPzf0zQQ+M7RwnCLQ5a3G+HgTkg89pFuIlwrFIl38FCWj+FZTDqkw4j7L
         ZLOVkLL/MKHS0p/TiafK7a+B/adYSMFUkKBgJohO3XuBVHixynApy4gCEh+lMCtktHDB
         RTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658868; x=1739263668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUvNDuK2KeGICqfgaStTgyWwXNRLoLy7XA9E2FucFQ4=;
        b=fPivMJcy2eU2RlrE/P5txsE312zpVK32M7jKG5Bl/ofPub8iPMTum/0vqH2/6wWTnW
         xwp15Q/ba4kFZDo4dKxbDOavV/U3sbOsX00CIRgqJPX0gBbqTNv3II6TrXiOqfUW2h0i
         YxzMsggYvznLeEMun6HoWAbv9eB1GprXQaSiKW6i5sHaHyJ1ZjHLR8SMdViPI4GQDOFa
         yaBa23SnfOPMOFX4Y0of/44ea2BQ0lG6UyLU13tFGC1aqQYebvu+2masvg2O2CcPBZ9R
         eAo0iv5sdo4ytBMV+p8LUgjuOabjFxa3jPvuSlY0ecLftBCVY4RCS6+LJg3Le2zERrg4
         ExDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6UwGRXuV6sASX1vJ5kv2NxXWO8QZaKMskzHPFzdRUx4pIMtHbwL746ewxVywnwAMS6oRy+DgN3H0cHyYKB2YREEk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/kpnf1dIW5OQQNgIfLBvBdCPlUMgE5tqufiF5/2nCrRASo0K3
	5F2uXa1FaUI1dVrDGk0m+qxvBcEIWLgGq7o2qqYLqzWCDU85kluBM0lFehgsUEs=
X-Gm-Gg: ASbGnct1RpEW6LGRAHk4bttJIxWc5cglIxXtnvrzpmDo+DhPwrLrq6wQwQL5O6UWhDZ
	m/uA4/MVDhafef7nu6IUVeq6zEP1tEqoBkHVKmAYOWfgGUa/bRxayTCX0urU0TD5qHb5U4E1/XV
	Gtk/3mwslBTPEDtGsds+vdy1w3H16yX5VbbvbI68wGiKbe8viw/m2oFJAZii5dtPmLkkGHwrtuP
	LmsE6hUevPCQE7I4kSV57KCIuOMYnLV/C7urSZzSW02Ybq48radRu40JKSLeVrf8BpUmCTAVhTx
	v2oxCWsaRpnW/jg=
X-Google-Smtp-Source: AGHT+IEz8raHIO5tARHsLxl7vwwRjNinVjoT6E9EAC6WklUAB70IV/6cFzcItpMW9P41H7X0i0QamQ==
X-Received: by 2002:a05:6000:178a:b0:385:fa2e:a33e with SMTP id ffacd0b85a97d-38c5208fadfmr20131529f8f.43.1738658868462;
        Tue, 04 Feb 2025 00:47:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4fb0:17c9:a494:227f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf831sm15350283f8f.90.2025.02.04.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:47:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] libgpiod: fix ptests failure
Date: Tue,  4 Feb 2025 09:47:41 +0100
Message-ID: <20250204084742.26325-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 08:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115266

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") revealed an issue in libgpiod bindings
tests where a GPIO simulator device is not disabled before removing its
configfs entries.

Add a patch (already submitted upstream) that fixes the observed ptest
failures.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...ts-disable-GPIO-simulator-before-rel.patch | 34 +++++++++++++++++++
 .../recipes-support/libgpiod/libgpiod_2.2.bb  |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch
new file mode 100644
index 0000000000..9747613aa6
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch
@@ -0,0 +1,34 @@
+From 7df2bb4f51281166633d4acbcff5763150add3fa Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+Date: Mon, 3 Feb 2025 13:20:41 +0100
+Subject: [PATCH] bindings: cxx: tests: disable GPIO simulator before releasing it
+
+Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
+instantiated device depends on") uncovered an issue in C++ bindings
+tests where the GPIO simulator device is not disabled before removing its
+configfs entries. Add a call to gpiosim_dev_disable() to the
+gpiosim::chip's destructor.
+
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/all/20250203-fix-gpiosim-in-bindings-v1-1-d2c9e0f3a29d@linaro.org/]
+---
+ bindings/cxx/tests/gpiosim.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
+index 4bda5a2..cdecd8d 100644
+--- a/bindings/cxx/tests/gpiosim.cpp
++++ b/bindings/cxx/tests/gpiosim.cpp
+@@ -115,7 +115,7 @@ chip::chip(chip&& other)
+ 
+ chip::~chip()
+ {
+-
++	::gpiosim_dev_disable(this->_m_priv->dev.get());
+ }
+ 
+ chip& chip::operator=(chip&& other)
+-- 
+2.45.2
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index 259ee04d28..054d378451 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
-SRC_URI += "file://gpio-manager.init"
+SRC_URI += " \
+    file://gpio-manager.init \
+    file://0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch \
+"
 
 SRC_URI[sha256sum] = "ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07"
 
-- 
2.45.2


