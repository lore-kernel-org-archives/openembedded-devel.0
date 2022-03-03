Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0E7C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 13:07:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.10284.1646312832329343670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PTqmlmrE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id c192so3098650wma.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cjvpp+kVVgsvgcHek8WVgLDaSqr7iel9jj4/xBojT18=;
        b=PTqmlmrEQfdouLsKp8ZahF5JLn28YtfzhcT7T8EazUzTlmx/Ev8qPLw2Pru9MeMELf
         ySRnjxKji+LuTC2U2O+i+cvYyn1EX7XlhJoGxFN5Pnoc/rZOTuKWsCpOD/O9FzPKBYqE
         Fkb6iG4bQeke3fY7mnJO5Igjgwb3taVIXG2dgFjv5kcG0MF2k8vppymwx7/G2zIME020
         PWIdB/KTfno4iIS4gZ4BZFirMvcQn1bojDQU265Fhq6d7NYicfwHWiU2jtm1xWh0sCl9
         vQEU8q6r8YRByWNAy/BRVN81WBoJwfEF3/EkII6znfJ2b+kaeiyfADwViaZ3/H80M0ai
         nm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cjvpp+kVVgsvgcHek8WVgLDaSqr7iel9jj4/xBojT18=;
        b=6fJ92uMiwuoY1KvGxwwT8kuu8Vs7QeKBj2SlQ79SbtMRazM7d5Kli9ye+e1u+DTQb2
         L/RVtVtAXqb+xZgGN+gjCSmAwkmFci7u2Aq1qHgSkRi+wse0RmvdZaRgKA3G2J6Yvwzn
         QDvYwBGDQ/tUiptkQT1QhybeW4W+X2UtJhe3O+7GVvxUzcpRB30V5vE37J2viVFeNqH4
         dHbf1tGHqoGGlpDnu6wUjGlqG9lhOEiVscaJMI8bPdpG8HNsx/u/mkkm22iVxLMoJ+Sb
         9Kw0sk4SzQxOZoH6kT08P3x4oa0IQAnwBQjb4Z0whBD78hjvAIH54Dk2OoKOUrQ7/kWo
         O83A==
X-Gm-Message-State: AOAM532dEPbybL8VT8U7bNLJoprzX9MTDf7TDKCW4Q1cjp2uA1hTjkqW
	LjyB/c2pD/j/sgBDGGkuuaZ5LvFCHTg=
X-Google-Smtp-Source: 
 ABdhPJzwJKUSYUyU3f16KXei9NV2sG5PNibzz8v55elTDerACTHFyAygkrcR+LyTLD6S3ldk7OldYw==
X-Received: by 2002:a05:600c:3d14:b0:381:67f9:8fd8 with SMTP id
 bh20-20020a05600c3d1400b0038167f98fd8mr3689159wmb.157.1646312830571;
        Thu, 03 Mar 2022 05:07:10 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm9612380wmr.47.2022.03.03.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:07:10 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 2/4] libqmi: switch to meson and git
Date: Thu,  3 Mar 2022 14:06:16 +0100
Message-Id: <20220303130618.1108977-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 13:07:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95741

- Switching to meson and git because of the following statement from news file:
  "The next major release will likely be a meson-only one, and will therefore
   not be based on a source release tarball any more, but on specific git tags
   instead."
- Add PACKAGECONFIG for qrtr.
- Updateing deprecated licenses acc. to
  https://gitlab.freedesktop.org/mobile-broadband/libqmi/#license

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++++++++
 .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch

diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
new file mode 100644
index 0000000000..e345d28031
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
@@ -0,0 +1,33 @@
+From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:00 2001
+From: goapunk <goapunk@riseup.net>
+Date: Mon, 13 Sep 2021 13:45:41 +0200
+Subject: [PATCH] build: use python3 everywhere
+
+---
+ build-aux/qmi-codegen/qmi-codegen                  | 2 +-
+ examples/simple-tester-python/simple-tester-python | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-codegen/qmi-codegen
+index 1fea7c1..1092c8e 100755
+--- a/build-aux/qmi-codegen/qmi-codegen
++++ b/build-aux/qmi-codegen/qmi-codegen
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
+ #
+ # This program is free software; you can redistribute it and/or modify it under
+diff --git a/examples/simple-tester-python/simple-tester-python b/examples/simple-tester-python/simple-tester-python
+index af9065a..a35e505 100755
+--- a/examples/simple-tester-python/simple-tester-python
++++ b/examples/simple-tester-python/simple-tester-python
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
+ #
+ # This program is free software; you can redistribute it and/or modify it under
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
index dee36d7b45..4807244a58 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
 DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
                devices which speak the Qualcomm MSM Interface (QMI) protocol"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
@@ -10,12 +10,23 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0 glib-2.0-native"
 
-inherit autotools pkgconfig bash-completion gobject-introspection
+inherit meson pkgconfig bash-completion gobject-introspection
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
+# patch 0001 is on main branch upstream
+SRC_URI = "\
+    git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
+    file://0001-build-use-python3-everywhere.patch \
+"
 
-SRC_URI[sha256sum] = "00d7da30a4f8d1185f37cba289cfaf1dfcd04a58f2f76d6acfdf5b85312d6ed6"
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "udev mbim"
-PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
+PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,libgudev"
+PACKAGECONFIG[mbim] = "-Dmbim_qmux=true,-Dmbim_qmux=false,libmbim"
+PACKAGECONFIG[qrtr] = "-Dqrtr=true,-Dqrtr=false,libqrtr-glib"
+
+EXTRA_OEMESON = " \
+    -Dgtk_doc=false \
+    -Dman=false \
+"
-- 
2.34.1


