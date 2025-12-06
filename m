Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1515ED3B7E2
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 18:32:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12565.1765045919609826481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Dec 2025 10:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcFpTo3H;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477563e28a3so23008235e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 10:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765045918; x=1765650718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qao6pCzozfKFk3BfxjN1ZGIcq9Hokn9H0ByDF5HL58I=;
        b=DcFpTo3HcmCAQb1mCv+DekW2Y+Tch1Hp9i5ZecabaG9yIvWRm+L/Ia4FOEMVPJjCI2
         kdYysm7dc4OGoRW9EtLmdh2AgWrOE8Ww5iC9NLjwvtAPyYaz4uodln12ulmOXlUB6pMy
         PQfwFwPzjaMxJSQ+uO+ZgpEQ2DzbzzPm9oAaBa0NfBGe1WfKW1+2K4y69lSA5NuSpSJh
         z9o8I8cTsP6U5r32W2Cc/vsk/A2xa6NCnHV8K2aM/BXWxluIrXENixK73JGkcc86lpme
         D2otRkZ5lQd9VsZlv9RhCuGej8JYztYVwyPnwyjJ+QgItOjpJ8RnlaLdc4UBfq8bvj3g
         QHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765045918; x=1765650718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qao6pCzozfKFk3BfxjN1ZGIcq9Hokn9H0ByDF5HL58I=;
        b=YWydSWqA2OKv/LISx+rNNpzkkpj5Cn8bC55wicYCBqfkPeU7fEpC4u2c30+bauJnSX
         5d8N8r7Cc4+jpwmhKN6kyHDmgAlzmOCWDSyYHWonbGEXAXK2owZ2hzKNtYusbEGIdrLz
         MzHZy0FRjPIgYcnXlMptpydrcAVNUI8qEb7fXsKfULgDdgQsCUinfLa/hC0PLb4tx3k7
         9ILluiBuDXDRcuBmxGcCI1E4EcNFuUj7RPQCaEAhJKDm7EAbaTrQBJVfCkZnKVk9xt4u
         8b87R4r/WapLtnr+sv9EWOiZjft5vODZ+9T6sx5ccKrTJu0KKAvcJ5qxTSfVGe45v/gs
         Oq0g==
X-Gm-Message-State: AOJu0YyBh7LzxNxB+bPA5ULMg2g2M6uuyTHUSEDbcIEO1UvxupPBQgnL
	h5pEP4DGShiGkjrPtZe+5/3xhQ3ZX54eH6jRxIEonRJ6q9zOKclZABPTDFe3cA==
X-Gm-Gg: ASbGncvAPr4dKt+w1mwUD5b1TFekaJNuwUQgn985OvKRX777F3Xlg0Z99Vvx1rUF/sE
	PWH/YqwUsnGi33MOYGKozlc/0uEsp5wTM41I/0gL2ELikGbgJP3cuW0bb4V8Z2IDQcHQSayUUf2
	Ez5/AHWRk++JAS9MPTJCNxpfsXGsbwNsx1DjVzucbjkoK1I0wEM4T5ctlQRdtOQjchRGVPQJE7b
	jvqx9x5s6jd9ZrlFG6yl1Bug2yW/7nhJgo9YArzvCJYaNKjcamWGm8UGPS9AxZ00oVmbHJ8vt+B
	7MwIqw9zZLBGjzTFGUk/1/efD0APyPoFwVkeYxO1Yc4WQmlhvX+2OMYunhwKTN6maYUZswlw273
	xyGf++IAkSTLCgkJLt9Xzy0nitJorCZro9KjBNBUq0kFS4iL2wumosqJiscCXALqKPo+nO+/W7n
	FMAS/QtDRxv+qu6oq73qc=
X-Google-Smtp-Source: AGHT+IEnffevBBfBhT1PiE/9c8Qtv9olzOh7WrvMPYxEeKyyDVT4DLZsB24D0iw+8tTYSfsaSjJT+A==
X-Received: by 2002:a05:600c:a414:b0:479:36f5:fbe8 with SMTP id 5b1f17b1804b1-47936f5fd0bmr50791235e9.17.1765045917848;
        Sat, 06 Dec 2025 10:31:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8a7bsm16101901f8f.4.2025.12.06.10.31.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 10:31:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 4/4] gupnp-igd: add ptest support
Date: Sat,  6 Dec 2025 19:31:54 +0100
Message-ID: <20251206183154.3656603-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206183154.3656603-1-skandigraun@gmail.com>
References: <20251206183154.3656603-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 18:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122366

Execution takes around 10 seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/gupnp/gupnp-igd/run-ptest  | 13 +++++++++++++
 .../recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb   | 11 ++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest

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
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
index 49cd8d8318..aa0a152f19 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
@@ -6,8 +6,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 DEPENDS = "glib-2.0 gssdp gupnp sqlite3"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/1.2/${BPN}-${PV}.tar.xz"
+SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "4b5120098aa13edd27818ba9ee4d7fe961bf540bf50d056ff703c61545e02be1"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-inherit meson pkgconfig gtk-doc gobject-introspection
+inherit meson pkgconfig gtk-doc gobject-introspection ptest
+
+do_install_ptest(){
+    cd ${B}/tests/gtest
+    for t in $(find . -type f -executable); do
+        install -D $t ${D}${PTEST_PATH}/test/$t
+    done
+    install -m 0644 ${S}/tests/gtest/*.xml ${D}${PTEST_PATH}/test/
+}

