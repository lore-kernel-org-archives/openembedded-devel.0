Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04894D3B7E0
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 18:32:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12566.1765045918024535308
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Dec 2025 10:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLJh5avX;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a637712so24048795e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 10:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765045916; x=1765650716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1i8Osjp9ri06Eay7QBWQ8HNecrzNQ3hqGZFjbP+rWk=;
        b=gLJh5avXCn260dECibcB/1UtpMQOb9Y47HidXdvN+eLhSK/ilSLMws/aZxL+uuX6ig
         dsAeZW86YucsZk1l4uH1OXbDnhQJQE9olYON94VbRoSBMFCTvL2drUyFsNR6KO31tIFN
         mi3np8q3CIspy6H9qN2fUi6jNlFwOsweOlPXtdfVD9LJYRAze3JUK/M/QkWhTqz91YP+
         XTtzfWmrQ32cG9cI0kVa7C1dTXBvqc4wuIekqMFKJJ9RIEoDHi/q1O/VeFzUe6g1PXk1
         ocLzrcAzSmeyCE7QrTdETrjLadYMOeIaIPTtzwTACHIL8fFaA5cWQDD9svJmrW7b8noM
         mILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765045916; x=1765650716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1i8Osjp9ri06Eay7QBWQ8HNecrzNQ3hqGZFjbP+rWk=;
        b=P7U8cRo8w47k4t5LPcnlhWNP8YNwo8TEbSnucfDdiFOtgNh87yZKUZLLs6xvcAkkCy
         mFLXHkqXGC+NSHrEwBrVQuLo2gEVJfxOuB/JL+xJVRby5xu/wpcXXT/31VC7dCnTalss
         jB9+Jrzs/yDMiy2qDSL0iiIjPYY5OJumlXy21LYZweHTw0YzoZtf25W6TPf9Llcdqym+
         LdiWRCzvT75G9fHQ2Ttq+aXhTY1OLrWZrRbXjmHOzTAm2rpNkSwmaplb0MpYGmjjD4r/
         QtoCZY4veo9nIC/27lGrxrfkjdlaCTBM+Cr9b3LzCFgjX0vM5NUIhRccyo1YOQEEuH+N
         Qu0Q==
X-Gm-Message-State: AOJu0YwoGLVoERpiQblkjw1BDa8UOldk6bb+KSB0rVgbMZm24tTEm77m
	NR8BPSKlXgp56N8p9k7sf1sWANLu2HKNfgLFegObjT6MlEUlFkHBEVj0KiDWFA==
X-Gm-Gg: ASbGncunCwlpWPVYlfiDPUJnGf+cJ5bIybtw1NSdbCwUbQTY5wD6xJiwBglae0Nhyu1
	0JG9dmbUHXOLazM/udsNZE0KWdWXjKqn2WxfhZH8oF7+oRNhcaUQUYFCrEdEXGJ1lQy9+b1owem
	/kiha5kyyLTC1sV/PZ3cnOj51Zi9Sv7II329V05V9uOYJQxx82t8nOyW526wnz8CoNGNSDKom/P
	ZTgq7R/5GPSgFqSxHrHnt1X/Te/mPqUIBY6EkwQBHDgSpzhLKJWyR91NAXRJVQRo9kulTNQbs32
	p7uWi+azvfnAx8Yde1O64KSDXMso6B2wuNIiCNOslD088cUGU7N5KID5eL1vJwh3chPjL5w+GBZ
	/4KQpM0gcFxwKQiB3UXXilBy/FDfoughGGmnsDP33sFRb4FfY5EEOZ02twjL6RjLETw4igb6W9H
	eBHWNsGT8A
X-Google-Smtp-Source: AGHT+IGVGRdyjggXTx+vWnASEGtESwuYIwSMjLoKFxvEtPRpcej73Iz8HBxBPh+10mZS0FsIkSBy3w==
X-Received: by 2002:a05:6000:186a:b0:42b:47da:c318 with SMTP id ffacd0b85a97d-42f89f5668dmr3491757f8f.52.1765045915934;
        Sat, 06 Dec 2025 10:31:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8a7bsm16101901f8f.4.2025.12.06.10.31.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 10:31:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 1/4] gssdp: add ptest support
Date: Sat,  6 Dec 2025 19:31:51 +0100
Message-ID: <20251206183154.3656603-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 18:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122363

It is quick, it finished under 20 seconds on my machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27865a96d576160a0e3a0fda6b7e604f19edbc6c)

Adapted to Kirkstone
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/gupnp/gssdp/run-ptest       | 12 ++++++++++++
 .../recipes-connectivity/gupnp/gssdp_1.4.0.1.bb      |  9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
new file mode 100644
index 0000000000..71693c56b2
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+RET=0
+cd tests
+for t in *; do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
index ad99bbffa3..3c51d3cdf4 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -7,6 +7,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
+SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
@@ -16,7 +17,7 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-inherit meson pkgconfig gobject-introspection vala gtk-doc features_check
+inherit meson pkgconfig gobject-introspection vala gtk-doc features_check ptest
 
 SNIFFER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "gnome-layer", "sniffer", "", d)}"
 
@@ -28,4 +29,10 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'sniffer', 'op
 
 PACKAGES =+ "gssdp-tools"
 
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests \;
+}
+
 FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
+

