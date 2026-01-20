Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7855D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:09:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4035.1768907360861912680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=R3fZWrC5;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b87266fdf56so74847166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 03:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768907359; x=1769512159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=R3fZWrC528vm/TQ+OBVQYgZkA6JWxVTQozAmwYJEaXa/NrGHNpRGsiKpeaS2bpDsoB
         u871+zau2TEjO7+051ZTVwQU2sFafaclv+G7JhAAs0NiJ/qwNA0miK5H5POlYrvwJnft
         fnpx+wSNd5zDUhcgzb7+QRy6RKluuUiG6mFT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907359; x=1769512159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=I76J3qFAFkX+5bor6uEWnET6nQeisR262xIUvhrrD00s+nLTvFQIFREl2PiDeH6HjV
         2G3/kgM6290dXM9syCq9Emtw1XR6Rnae9c69eiNVCYoFq9F8hqZ71MRUWgEICWnJAVZd
         BRFk5mW06aBHAPlILxe2VmFB/cMRc8eOCoO7SYW5JBVqSLFUlGFF3Zh0r+usE3wLh1Tb
         1t4DK6tST6qBXBnP93gVyJgcEdblCcCPouNkWqFN6tzInvXjOtFjp3B8DyCLNgjbsgaO
         WfhF1yw+ABbZmMLSgMxM/NPeFGy+UGEPa2jt2ouBRSnk5t/ZBtbbDhoaAR4XnViwzx4+
         en8Q==
X-Gm-Message-State: AOJu0YymvoTJ/e+jbDfWAUg/rEVjP4FvL7O5ihxs8HB2PiWbT/rbF/gX
	PC3dQoG5me1Sre7FMKfaT7oyAFSJw3K3ucTH/KzhoeQbhUdY4FYEnqo0rwyMXUqQdpeDZPII/FL
	gO3Fz
X-Gm-Gg: AZuq6aKXun8+AiqQm0/2XajcZT8XBmDVEMa1sine2kevDh+G1kgN1TI7E4vmLut0jQy
	zqlCisKKhAfS4Tkl4ZaJwFHQ+kO/GTEg2OG3ZqsMBcYMFqVP4YUSbRs6ldl613u9+ruiSpk7sPQ
	zGTfh9gNd+lSMjbb+dEZaghVoexrpYreMPwjo9uQIEYBrb6WspcSzVj6HzTqTcMIYiljmFZsJyP
	RlSmUoDAGawbedpoaFBeoE9CSf1E7Qvx+9nMxiVb+MO684ysbr258e4w1I57UIrfr0fyXS27TZO
	3BHg6QTJ7+GUZmI+KyhoxdE87+ZeQNGzgfQB0TaxhN05NEQBFDVicd3RNQzVOMrw2ampBRSPRw+
	RUuxyoYzjjd9G7aZJSmNVIotS3L7MfubMhwKp6zO7/13ucWy0rWQX2jeWXdsYd8+wNyJTtAaPyT
	lNuLzzOMMVJoQV7P9GzNeuyv4DMNRfGV2n4/gEGMDP/xTqOyE3Vh1/Li4uBOhTH/sbIqUtPk0BU
	D44N/SEHZ48cgeuKoj97YopjfLKhkAhTVR/mQcwTUfh5509DH/O
X-Received: by 2002:a17:907:7fac:b0:b73:99f7:8130 with SMTP id a640c23a62f3a-b87f9091dc7mr140060866b.6.1768907359033;
        Tue, 20 Jan 2026 03:09:19 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87ed991b75sm399299266b.1.2026.01.20.03.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:09:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 1/2] [meta-oe] libtsm: add recipe for kmscon dependency
Date: Tue, 20 Jan 2026 12:09:15 +0100
Message-ID: <20260120110917.1390032-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 11:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123663

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


