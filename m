Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.1532.1586020403129672475
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id t28so10794923ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K4FAajVmj7/kefInkpRZESoECMve5GYUdlxxV/OMM9A=;
        b=kFKRyM8scn31BNxV4AuvaSsotuHWyaYWIAYkwtl2jQY7uNJjwUHusMkpvRYjfougkN
         uUBRdCyFViAruKDQ8MqkiRrldJQ1CZ8u90c+v8T6NWWFSyun6O37X8qscKYV5nrY3LDp
         Blw2vwGvRQeOVVbrEWHQT2MNzWi1UhCtcZnLSlTrPgKEMzR9Y90pypqM8Xchw7lEqDmd
         QsQlJHLxXjMwtVjVB7/fCLrUlILyuLrt9/ygRmSg353LkZJA4iBanXT+M9yjOH54FOwE
         /2t9hUc63a2x5OLfBZb1z8jLk8uxXqucoxkRpZTw4lysHCgYdAkjZx0laHn45pdEXj6Z
         B55A==
X-Gm-Message-State: AGi0PubdHEtcwYWHPKG7aAdwr3LTX3Y+s1Op5fdBtazvEeesRbGKIsMb
	P4kGLEhc+frlaiEy1E9g1LN6V/VLbHY=
X-Google-Smtp-Source: APiQypJ563wdX0j4iw2L5Lxsy+DrWgzhiLLED18OiYytxN8dWU8kdDtf5AlqgXLP4PBKIc42dv7jbA==
X-Received: by 2002:a05:6830:19ec:: with SMTP id t12mr10562770ott.24.1586020401950;
        Sat, 04 Apr 2020 10:13:21 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:21 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 16/27] python-socketio: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:40 -0400
Message-Id: <20200404171251.19823-16-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-socketio.inc                | 28 -------------------
 .../python/python3-socketio_4.4.0.bb          | 26 +++++++++++++++--
 2 files changed, 24 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-socketio.inc

diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
deleted file mode 100644
index 117eb60784..0000000000
--- a/meta-python/recipes-devtools/python/python-socketio.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Socket.IO server"
-HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
-SECTION = "devel/python"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
-
-inherit pypi
-
-PYPI_PACKAGE = "python-socketio"
-
-SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
-SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-engineio \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-attrs \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
index e2542cf4a5..73548e368b 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
@@ -1,5 +1,27 @@
-inherit setuptools3
+SUMMARY = "Socket.IO server"
+HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
+
+SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
+SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
+
+PYPI_PACKAGE = "python-socketio"
+inherit pypi setuptools3
 
 PACKAGECONFIG ?= "asyncio_client client"
-require python-socketio.inc
+PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
+PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-engineio \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-attrs \
+    "
-- 
2.17.1

