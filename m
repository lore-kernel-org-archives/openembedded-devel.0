Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1CFD12672
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3466.1764708253235925894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bP51JxVb;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43226765e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708251; x=1765313051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7IfTZY2mOY/JCNhswMgtp1Ov935R54lGlAz8eNVL2s=;
        b=bP51JxVb369RpsjhcrbNrGddmEOqk74cQXFhHvm2izwCNeV78yfwfdCvJaBSqrVDiN
         4hqoXSfSySqbGwHn0cJ9DPGevAT8ks1WJzvYVqqY17mBEh/b95afrg/iV0wHM+5rEwZR
         1YmwZ74Y94tvhPSJHZiYFCSC4JV9GXQ9HAykjicEMoAnIxoOrbBM3xW0J5R0I2D7W25S
         DQuP2O1dFciLXle3kl/dSAkAFnBi9i9R690SevysxPKb+9NkQH38V6Rj/TAsoaNgBpHq
         6iZvJLZ0IyLtRzRbsmSRjYWB13ZxpjGGKlDhWgX1ezN3unOUo8x7nZxX6QLdZneR0InY
         b43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708251; x=1765313051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7IfTZY2mOY/JCNhswMgtp1Ov935R54lGlAz8eNVL2s=;
        b=WBvQm5bqs+uJpvuPDR+UMLIo4b+QThwBY+sosH1eAcr6d5YfxfrVEmZ+J77hUgzw0B
         hUtJTKsVCZqASdjWcK4kC7s74ycgvWCeoKj9jDsNv2gUJR+yNVrsTR70iMVoXaRvR3HL
         BSnQw2UEmUVgrCBk2K/JR4BQXdyU1Vjkau+K66ODi/bG67NSyZVkHYtOpd5ANGVjIHrA
         heLmfCzEMoY1d+vfII5dEoO64va21n2nf0UEfM41bLz76YPUEmtMviMMCW+AVNR82CbW
         P8IRoMmncbBGKfX/6fm3DnkOEtMDwauAqRSeISgC238PdLEKiuLAkqCyt0BIdMaD9BA3
         FMPg==
X-Gm-Message-State: AOJu0YzahgxBpm2lAC26DmTWOCKlx7ppLky3Gta0n5pHrN6qBMppeReD
	aCMP4qDq/bjzePQcGN48HaQbde++QaZtj6WfqIJtaxl4FIdYDSaONzFQo2v3kg==
X-Gm-Gg: ASbGncusdeEoVWxhqSuV1+DbwvfFOlnqjz25FP8JfzBIyprC/Q/I21df7NHpSxRHiAY
	cPmsOwyK/kmlL+oQNq+j8jOfe6YrywOin2yrMeZzjKemObZ7wIWQSSlVV6rm/Pjahyy6XCfliUQ
	BINASdEEyhiGm97s6/03Ikvrwqy1bbrwJCTnt0CePk1xWATyklxYNKnwk+z/d/Ux0A/MhG+8Xvw
	cnvfUCOrV31BASsf3vQWqaVx3ztAFiwC9ElZiib1rQkm31uD5YtBcDHXFNYWP5mcOooW4YRDVBI
	/FnHjhso+fCsdnGcV1xg0FGz6qwBUQQxeP444YoGIII6iaPFzmlw7Gi74Xmwgx+lBZcLMNjgC+U
	qodAUltk8ms5ns2sOZmoBGI+7B1e2Cz6HCQYU5n48qJCXSHz4JkEGX0kdlZ0894mve+7KLDAfcH
	vX7ouCHItd
X-Google-Smtp-Source: AGHT+IHJS0BMNrL8gsOdy7QgTEyX87eCJCjkejZDtz0w999UjEZc5FYlvVkkAPHMQ8yztvKUh/KPtA==
X-Received: by 2002:a7b:ce02:0:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-4792a6112ccmr6147895e9.17.1764708251510;
        Tue, 02 Dec 2025 12:44:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 4/6] gupnp: add ptest support
Date: Tue,  2 Dec 2025 21:44:05 +0100
Message-ID: <20251202204407.3755450-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202204407.3755450-1-skandigraun@gmail.com>
References: <20251202204407.3755450-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122269

It takes almost 50 seconds on my machine to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc |  1 +
 .../recipes-connectivity/gupnp/gupnp/run-ptest     | 12 ++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.6.9.bb      | 14 +++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index 7eb06f98ba..081ace6d22 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_MULTIMEDIA = "\
 "
 
 PTESTS_SLOW_META_MULTIMEDIA = "\
+    gupnp \
 "
 
 PTESTS_PROBLEMS_META_MULTIMEDIA = "\
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
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
index ee980cd382..e2bfcb5ed7 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
-inherit gnomebase pkgconfig vala gobject-introspection
+inherit gnomebase pkgconfig vala gobject-introspection ptest
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
@@ -18,3 +19,14 @@ gupnp_sysroot_preprocess () {
 FILES:${PN}-dev += "${bindir}/gupnp-binding-tool*"
 
 RDEPENDS:${PN}-dev += "python3-core python3-xml"
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

