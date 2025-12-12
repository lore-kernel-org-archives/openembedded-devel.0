Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7332DD4337F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8289.1765526543949326943
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDOmhdfJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso752112b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526543; x=1766131343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90VBVi/0QyPr1s1pe6+ObwKlFw/hISl6eHFx0mp8KGQ=;
        b=DDOmhdfJeMG3zOcqzgYCKx9NoYRqPCL10cfcIX60gGY6HAT848+sGn4KAK3s7Rmsi+
         LB1CxLh8MlNEMr+kXHgOFAaKTFbLdcVgpWWgs6BwQJoT+n7KLZxw0smmAIt0bfjssCIS
         rsph456gZzub3a+yual5Q153Qaj8WG0/XMQqG0BrsnZ8hT5x6aqkQEE9DMd0Fdqit+al
         1JpWEXYqHvA51UKranguIyCEBrngYw/kY1iRGy7supnVX2ynzkPjYdi2BysDQTmdxalK
         rIueQv7jfdVHpnjeTfKzo/L9frqE8eS9k4Fa+Dr874TCMzT55qXt/3Nd1xK6SE7EFJXk
         /Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526543; x=1766131343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90VBVi/0QyPr1s1pe6+ObwKlFw/hISl6eHFx0mp8KGQ=;
        b=SP0Xo2L7QH/pnroF4w0A2Rv3UkxNpEoJ3ol3IS2dtRXlY4wpWQ4Xy7BWl3uQJRemED
         YUwOvHvhyKr9dQADcnC+p+XU1SPCE5LmRawdzOu+8stAFfawYH1eSUa1SwculPPurhQ8
         YNuLISl9RX62aXZLwViaRx/1HqcbnfJhRUTQ5Gl+YUxhSbx2Z4+ISsp+DznYDWgolKWu
         Rx8q4DLLYOsqIBebxPL5rDhqtoEBl8KzfKAh6bJuBtiWUrunWTUWtQ5rWbUA3d2VrW5u
         rPcnS42QXuGnk3e2idpcK2VStDt85wBn5mClQA8nitdInhUWgTovdKTw6gmfnw5IahX/
         80fw==
X-Gm-Message-State: AOJu0YzsI2aI5I/UpkSKBR2X1/UCjAekTnqgCVQddxtGssvgqxdzAkbw
	nORTXD/P/HhbR0b9amq4o3e1ziE1oVQuZbG2F28+3cj+8Dk4NODw55IUTa8hgg==
X-Gm-Gg: AY/fxX5NcBlV4WcRg8ZSiyij369qFtRJDL+bYHnH2Mjj9J/UgxBRVcwIXUnpELkW0Gu
	Oa+/lHqbKtrzYAjqMq4Kd+WG9E048vLRx72soXBvJO7m5Qj9aD5SVnN0oQ0Dwqzew0VUD/9ORwU
	YBbw6d8VCyIt3yQcrj04iP7ruHzerBIIgOouUJwTWHx/nbTLKPcU56cDe464gbDwbPlCJVx+6KH
	ekIEJ1SdCntNfGwRJ+wObnRwiQfDHaNqfjOcGeoHsIYY+0nLTBSSVR85PYx0LaVONxPPiqXW7OD
	vrPmVrI0js1JN+FkR/4dw8bE/BM/AMk/K3WtLBfU4jue8lTTyXH5z7wXB8Ce0FDTiHtCFPVNqV+
	JCc3i19xZgvjYvqkU6IJtq+bbdPaSgftTi9Kp+Pnfw+jfqsUXudXr78YNoUpxArWandFPp6VNIe
	vOk++x4scI16xbcmh37L5S6Dc=
X-Google-Smtp-Source: AGHT+IFSYaQASjqx5GamGcRael2bq7KOGt8unKzNGvDnaZ/amDsKOWKwLLAP2VyrgPpY/X8aeFnu1A==
X-Received: by 2002:a05:6a00:1c83:b0:7a9:d1ca:8a44 with SMTP id d2e1a72fcca58-7f667a2b9e6mr1471899b3a.24.1765526543149;
        Fri, 12 Dec 2025 00:02:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 7/8] gupnp-igd: add ptest support
Date: Fri, 12 Dec 2025 13:31:50 +0530
Message-ID: <20251212080151.3711461-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122595

From: Gyorgy Sarvari <skandigraun@gmail.com>

Execution takes around 10 seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8353697d83bc8d916c440950f9dfcf4c49ff9d42)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
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

