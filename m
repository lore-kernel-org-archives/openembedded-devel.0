Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5BCD47CDA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:48:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3271.1768560500724445229
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=NPsH3PpA;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8712506a3eso15528766b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768560499; x=1769165299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=NPsH3PpAa2xARYsBs0XAmA700AiBgTMHmrUl8eCd75ksaI7EjWKld09XzhCgfYEcEN
         tbmMq7/Gp8M2w8NIvd2emMCVHWIi1svGa2hjvv1jRxj+MQtEMefroSaycFPafOPBBPuA
         E/DDy+9rNpzy7DaKK3AmlG7h/AbY+DZtpzW5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560499; x=1769165299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=lJqeoP90C74HyCEDttdoS0NlwyAjN8/ALzRht+ktD32ovV07RwhEDmqqcmGr/PCWTS
         d13HPqD8q54LuHrqb5SVZ/pGr5pcb/F1xgQ5KlVwd8/NjZ6XoOWIAnOHASWEnVroOPwc
         9Ey4/9uDSt8XLUrKn+3ZLNxTYWEoeQBFMnMzDxegQudRBVXuIVS6jh3ihWpyeIlRXjd4
         qFhSeQ+PYC7PdyTk1C30m25OIRYJMMMJCYgEc5y47QpKKwvd4dWG0z1ryqNyyvVzlMld
         iHBR8XyA5caFzMI10merJX+Go0bUK3yonfcgG8jtPNIryKOFV+g6Eke61X/MMwQ2bta7
         WbqA==
X-Gm-Message-State: AOJu0Yztnekr4ZABpZwtX3yEnDCeUSpkA+o0A6pzZ+eQZ+OwvxPF9p/S
	MPcRjHZLVGrqMhcEGguEjWag6L8jDx6Y/I9TA99StXZCNfd75Kbm6FaxR5hxqbs5Gdnfc3yQjUH
	+pPhV
X-Gm-Gg: AY/fxX6NbJmGhVFCReZn1XDrCPBNVw2otg2u7s02W29vZYAlZ2auy8fNKngx6+oD30u
	1sscK3HOIYm0dZIPxT1bOdTk5hqmC0KaZAFhZxeTCYp7Cgsf2ZYta3N9sWdTb0IFM4mkuEo0gFI
	j/lSwfT90usIXemnok/+2cuZlad/dgxcxkVQ54xBCBrE74gRNKZAN5Hrytg059jxxP6VYYOEJmp
	I6mVQOBRRE3/nfen4wO9Poh7ziGYDVaDwBMr8oiiOAXRY3e3zHqz428n+OF2TUQJKEVa993RcDA
	rBOkOkjUzXjpweTouXKHEgoRXGTcEA9xKx0+Ux1zN9HNTmTo7vGXYNNrziF/Xq2144bhp9t109D
	vIPkpJAu7tafexyvEOMlC3sZGD+X0GvWTq+u2WFJ8OcXOLSR0ZEuPmfZSujuNIhyMeWzejKeCHr
	F9V9ncCbitbW+Z9BYbRs8D7MyVybtpuJOTAcKvToRgfPvCizA78U9Kf0kx5wG2LEQVX+wyKOPDc
	wXgUXi9cZ4yZiIhdOawswzquvLeoinvBHOkg73Q/Tlom40it9YTwSYfHRH1YTI=
X-Received: by 2002:a17:907:3f98:b0:b7d:3c0d:96ef with SMTP id a640c23a62f3a-b879328c823mr124716266b.7.1768560498854;
        Fri, 16 Jan 2026 02:48:18 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm198654166b.54.2026.01.16.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:48:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 1/2] [meta-oe] libtsm: add recipe for kmscon dependency
Date: Fri, 16 Jan 2026 11:48:15 +0100
Message-ID: <20260116104816.513803-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 10:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123530

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: add tag=v${PV} to the SRC_URI

 .../recipes-graphics/libtsm/libtsm_4.4.0.bb   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
new file mode 100644
index 0000000000..1764ba628a
--- /dev/null
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Terminal Emulator State Machine"
+DESCRIPTION = "\
+    TSM is a state machine for DEC VT100-VT520 compatible terminal emulators. \
+    It tries to support all common standards while keeping compatibility to \
+    existing emulators like xterm, gnome-terminal, konsole, etc. \
+    TSM itself does not provide any rendering nor window management. It is a \
+    simple plain state machine without any external dependencies. It can be \
+    used to implement terminal emulators, but also to implement other \
+    applications that need to interpret terminal escape sequences. \
+"
+HOMEPAGE = "https://github.com/kmscon/libtsm"
+BUGTRACKER = "https://github.com/kmscon/libtsm/issues"
+CVE_PRODUCT = "libtsm"
+SECTION = "libs"
+
+LICENSE = "MIT & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=69e8256cdc4e949f86fedf94b1b320b4 \
+    file://LICENSE_htable;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = "xkeyboard-config"
+
+SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON:append = " \
+    -Dextra_debug=false \
+    -Dtests=false \
+    -Dgtktsm=false \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


