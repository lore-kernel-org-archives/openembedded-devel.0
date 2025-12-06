Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0652FD3B7E1
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 18:32:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12562.1765045918446575260
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Dec 2025 10:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/bvr9km;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632d9326so22018345e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765045917; x=1765650717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xuWKULJvxh9W+oU5IjNS0zsm7L/YGcHcoq2QRsIkZk=;
        b=S/bvr9km6foFWIr2a74AWmaCWrzgEXau2xn7BXZ3Fe5ref2OxgXO+5p2VqSdQ1zVRX
         HDGfuwGeTMUw4vGRFwUl3oMEpmy+TPMEVukrcuhTOxNJFDsuS6YtjdYwJwzJj3J2XI9P
         aE4nV+separwdpsiwS+pbSl5cx310BLCFNPDp4j7lTwNyUVeNdY0JqfpIMjSPlcwsdpU
         XyjlxrDaxz2CtC1/ft37O8+RL36oAtNBFEDBE4Z/D0i2bEJWqGsyEYSjtm1qSj4IGvUT
         b2Zazague/QVtxMMLMVH0dKt0VGEte1kIvZpsXHFZrX4lVgJQ2nIrBIMJuPvUYpCpMhy
         l/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765045917; x=1765650717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xuWKULJvxh9W+oU5IjNS0zsm7L/YGcHcoq2QRsIkZk=;
        b=iTp2+ZBzlFoEJ8wJ4vPetM8zR+yZLb5d7hEQS9PCJdkiCwmlM0dKS7N60wnsafrTAL
         YjwOk7/Rt5+fvm18E9ICSxo+Pl/y9tHwrdGY/ui9HdxCFl18srbICcUVMLt1vag5Fd+w
         e/Jzb2wMqxid6tmz1PDeaZzfgtQp63a4Nj3oVK3iddnv75LXa+Bxr6q08+lOPAdiwu7q
         EiqCXzVRk6rRu8Ql8jng6G0xDQaRxbLWWCq8J2kbTDRFJbR1lP8EPA9lBR9cifnyLcxA
         RF6+zKBrMCdIaE7eq4hB6lUN5Thjq14UfL3Hjap5TP3Ygd1IEnIKPf/zOqqj13kIddMo
         w5mw==
X-Gm-Message-State: AOJu0YyoZUeBiV1pE9+Us8MQdqDjoWQbXtUiuDYicaq7RL4uWC6K/S5u
	9dqEkYHioHQ8d8DSEeyycFddBnb3YDCiLzajzJzLenDg6wQm0oFzPHTBDMS6rg==
X-Gm-Gg: ASbGncshfNwzVvOCVuqO9vOHIo+afsVb/f/wAV4WI1rBOxS+qiyGv5z1nVyDa8cJoIs
	/QCPRYPXu+vv7AmRF2STRo8pDlvJZssv+CYEIX+46gX4WfJT+T2qNH9z8wrv4fhtuxPKXIhXQ8h
	xLZ1WaulnFeRgsdrbA98VF5+HHl3vduN2g9fsljW/G8TL2exRGqalxQDqSi8q9fHaLZgIw1qBcL
	mQIloAagQ4QdTmO4KZNhD+IrM5knhjzUVIRSmj4Z2mtlb9b0tMBDlXETJcnjMMOwBD2xPx1uH51
	ToaTYFlD3BJAnhl5Wl1srhe47hk582BUoy43lUeicmda12noVQEkMGcE178tgEH0m1/g5KkoP9S
	U9w0sNTq0lxp/nTBGHlW2eTH4c3hmBYy27HjNFSzaHIokt116Ap5x6fU7CIJ2Ex6IsZJsoXRVNM
	AOWMZFexpU
X-Google-Smtp-Source: AGHT+IFcu+hcqKpE3xH74zQ691wyk7PzF1Ms5LEiyfE8C1v+F2ExSeb8l9rshuWLYrRtvtKm2xhFfQ==
X-Received: by 2002:a05:600c:3513:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47939df0050mr30005745e9.3.1765045916584;
        Sat, 06 Dec 2025 10:31:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8a7bsm16101901f8f.4.2025.12.06.10.31.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 10:31:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 2/4] gupnp: add ptest support
Date: Sat,  6 Dec 2025 19:31:52 +0100
Message-ID: <20251206183154.3656603-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206183154.3656603-1-skandigraun@gmail.com>
References: <20251206183154.3656603-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 18:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122364

It takes almost 50 seconds on my machine to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7878d69abd4d1cfaad3f5e5ba9cf7ad00f136bd)

Adapted to Kirkstone
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/gupnp/gupnp/run-ptest     | 12 ++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.4.1.bb      | 14 +++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
new file mode 100644
index 0000000000..2efcbcb773
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+RET=0
+cd tests
+for t in $(find . -type f -executable -maxdepth 1); do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
index 708e3844ff..553809d9ed 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 
-inherit meson pkgconfig vala gobject-introspection
+inherit meson pkgconfig vala gobject-introspection ptest
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c"
+SRC_URI += "file://run-ptest"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
@@ -20,3 +21,14 @@ gupnp_sysroot_preprocess () {
 FILES:${PN}-dev += "${bindir}/gupnp-binding-tool*"
 
 RDEPENDS:${PN}-dev = "python3 python3-xml"
+
+do_configure:prepend(){
+    # change the test-datadir from source-folder to ptest-folder
+    sed -i "s!\(-DDATA_PATH=\"\).*!\1${PTEST_PATH}/tests/data\"',!" ${S}/tests/meson.build
+}
+
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+    cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
+}

