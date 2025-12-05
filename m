Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A91D37499
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 20:10:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2827.1764965424143563149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 12:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+M6NAQk;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so31191265e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764965422; x=1765570222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2KRjUXpEyhOz59UX8n89goMOSUWhnkiHBgJ3rB1i/o=;
        b=F+M6NAQkqQ9GT33PUszuCoOTuDwuA5qF+LpZDY9jk6lpJVyraXhG0wabayfkiN/cwS
         CVg014A60AqrOKY6USgOFCzfiIGGCMmoj0tYohVlGvi/ohcBknQrixcmdO3IqVoiHS+H
         yyjUgWpbs6rC/ZPk7Vh7IDofwifRobyCr/Kkx1zzUhcdkHPtGN/vsWFGVORdv6YUIgiP
         oA7X+LUoMOE76C9iR2kKT07/9fovSeavG0Yum5e1nqxfYDwNdeM//Qd6lF4zp2e3ML7n
         ePjFhHcqvccjkEnrccYT/05d1VsR97Jecr8apaJvomY2QWU5B0meJNZmTmdsZL0iBimJ
         PDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965422; x=1765570222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2KRjUXpEyhOz59UX8n89goMOSUWhnkiHBgJ3rB1i/o=;
        b=Rkvq7kSPkov0i0ux8JBP8Dp19/QbX93Oex3fU4mmnMZm0Qkry9gNjfJgiOcordtCE5
         GdSNhV+z3K+V8PPs+kfh6DK/9oixhAFoeT6N+B0kj0ck00vcLZ9TZPtKptqmhJ174nK3
         d4xyMDQL0qdS/gYq0axfPdUqQCiSrcRuZRI+6s0GPWGz2gAds3jrzvn8jU3gSafPvGcx
         fb/S5OVq1zwXxzIa4jZL98fNhLhWq6w+P4nSAjS15Kb8lMQCIMyd/wbZ1XOmElRwIPpM
         QvMZl60a+kzbJRCRF9tpJZvtTUHpWMGBbfNc8xyTOhscCftB1XdSo6ylNh6SUTTfDyZ/
         cR3Q==
X-Gm-Message-State: AOJu0Yw9Un6fv2JqRYo90op3ysV7/6Mz3e3u7j3NreT6W+eldZOFK4Hr
	qqVlLHe0C+0ieQOz5XrWtR/XElWlWJzA9hdKW/2v1/wfXIZcZ/aDlrqLyS543Q==
X-Gm-Gg: ASbGncuCDH2bOz+3EkKQECS4og4tx8rYUX3sAwhwaFkNnYiJhvDKZ0Nq0na7+iImQzx
	lJLNH3v+KDhXJc5HBn0r7uS8+b5uHAqVwE0AvEnVCOaJIUvBk7XeoXxOQ+cI2CN2wIqu8ttItz6
	npR/JLkzVGo5De3d8hH8ukRdLZpU21daWC0F0q2HDXqyqTjUoeYn9THR0q8OVy59UUmRrNflS1t
	cQD+sXRDsONkehxtreYsd2vPDITwVX8k74gZBSq0aURXxWaJxIPi51Js/fRImEDyXUSOhT11xVp
	RWfK4/xB0BJlvpjcMvjcSWML0dVmglayUBr3goJlU0fa8wcseLH8ys2hBz8t8zzXPwq/GptNYxW
	e2JkuCBUiedfpgpl57kKcCL1WJ9/xYbQmNRLSvRIC3KCatQRHhxmlXkaBxE6xWyyTy1kwO0gn7F
	q3SUcWouTx
X-Google-Smtp-Source: AGHT+IG4MA5FKkiY8yWS/rrL4YgM7qvleeJ3nZAmr1Kttno9rwFMNwUryVL09T7fYR0Zo6zFpjYINQ==
X-Received: by 2002:a05:600c:3593:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-47939df8334mr5312265e9.10.1764965422252;
        Fri, 05 Dec 2025 12:10:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b157783sm74993245e9.5.2025.12.05.12.10.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:10:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v2] gupnp-igd: add ptest support
Date: Fri,  5 Dec 2025 21:10:20 +0100
Message-ID: <20251205201020.1669530-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 20:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122361

Execution takes around 10 seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix test binary installation directory. The first verison was working, because
    run-ptest searches the test folder completely in-depth, but the binary was installed into
    a deep subfolder unnecessarily.

 .../include/ptest-packagelists-meta-multimedia.inc  |  1 +
 .../recipes-connectivity/gupnp/gupnp-igd/run-ptest  | 13 +++++++++++++
 .../recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb   | 11 ++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index ec10edfb83..eb8d4ffe89 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_MULTIMEDIA = "\
     gssdp \
     gupnp-av \
+    gupnp-igd \
     libopenmpt\
 "
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
new file mode 100644
index 0000000000..05aa2a9b3a
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+RET=0
+
+cd test
+for t in $(find . -type f -executable); do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
index d8dbc262cd..307d912483 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
@@ -5,8 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS = "glib-2.0 gssdp gupnp"
 
-inherit gnomebase pkgconfig gtk-doc gobject-introspection
+inherit gnomebase pkgconfig gtk-doc gobject-introspection ptest
 
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "4099978339ab22126d4968f2a332b6d094fc44c78797860781f1fc2f11771b74"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+
+do_install_ptest(){
+    cd ${B}/tests/gtest
+    for t in $(find . -type f -executable); do
+        install -D $t ${D}${PTEST_PATH}/test/$t
+    done
+    install -m 0644 ${S}/tests/gtest/*.xml ${D}${PTEST_PATH}/test/
+}

