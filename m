Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDA9C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 06:33:10 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.15071.1707287580111849026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 22:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gnItVlD0;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0aabed735so3152431fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 22:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707287578; x=1707892378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wWEC3AvNplOZKauyPHwEN4wqM+7X550OM+yc/BSI1U=;
        b=gnItVlD0tQ9heVVP+tCJs2zZ52eaqYgPfakEa5zi+HaxUPUZK40IGvgQy1jm6L5OEu
         g8LJGSmIhvZs6J9Yd5dWpkhO7bbgoZlK6yUpsHToZHdd16r93t2M4of7kC+0mPSjrqPr
         CiEQxyYcpKdnNW/z6RYpvgLXFArQxzKEaJLEYkR+xT+DaQE/5TDb+oolO7r47KUvHs1A
         ZwFHkLxkD8guEWQam/DItojXHlq5v+OEb2Z2GLhrvP9a2OUdHo31AT3aL3Es2sAjQtWD
         oKSG7a9OyML9+9SZTsWP6HvQzlHIaey5gysO6+imwL6O4m+pR5qARDbvS/2MI4tdr+7E
         9UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707287578; x=1707892378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wWEC3AvNplOZKauyPHwEN4wqM+7X550OM+yc/BSI1U=;
        b=BRhqvUvu3sT78NSBWyk/5Nyj8GEiDZSpw0mr/k+eth2wN0Evt4hMBoLcT78SkcrNYw
         XG3MTJXMagPksHD1a8vtysG1L1vUlOiT6g2O8JjMPUIhvUhdN9K5z9lpH768a/tvm5PN
         RO+u5/obpYOObLfychtd0p2TQuz1Oo0OiJgF8kjfdt7ngVT2O0DU7iAUw1IoETI0o79M
         QCGTQbeXkQsOEENJktbWP2o1lXuxcezGwU49CKzr2XGobL6FPV0IlYBbgmkuPCyztmiM
         iFM+2YchRpWnP7cwKdU6C6+8Et0tPyLiRJFf/JoynWInt+WYP2/oeHMdcjWAdRNKDrrw
         0+1w==
X-Gm-Message-State: AOJu0YzQFi/0UdwHW5SVI91giNIEdXkyuMb/p2cvirZ7SQaZpp1tPFgs
	PQDkF7Ldw/ZAnOXpsA2ELYV8lHoWzXs0otDNzleQCKTXi+94uDDdCrwpebgUU7k=
X-Google-Smtp-Source: AGHT+IHt2uKbUp62KAJI/cgImNhx485ZkyhqYGu5x7OzRz1Nz6tdpzkfEkdCB5s8/GyQfwHy65yaCw==
X-Received: by 2002:a2e:240f:0:b0:2d0:41d1:8124 with SMTP id k15-20020a2e240f000000b002d041d18124mr3519965ljk.1.1707287577326;
        Tue, 06 Feb 2024 22:32:57 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bf17-20020a0564021a5100b0055f0b3ec5d8sm328054edb.36.2024.02.06.22.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 22:32:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-web3: upgrade 6.15.0 -> 6.15.1
Date: Wed,  7 Feb 2024 09:32:44 +0300
Message-Id: <20240207063244.42414-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 06:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108648

Changelog:

Bugfixes

    Handle new geth errors related to waiting for a transaction receipt while transactions are still being indexed

Improved Documentation

    Remove annual user survey prompt from docs

Internal Changes

    Create test fixture for latest geth version. Run tests with geth in --dev mode

    Formatting updates for black==24.1.0

    Add eth-tester version that supports eth_feeHistory

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-web3_6.15.0.bb             | 21 ---------------
 .../python/python3-web3_6.15.1.bb             | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-web3_6.15.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.15.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
deleted file mode 100644
index e216857de..000000000
--- a/meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A Python library for interacting with Ethereum."
-HOMEPAGE = "https://github.com/ethereum/web3.py"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
-
-SRC_URI[sha256sum] = "a646d1fe5eba00625b5459d23910e472f0d0aa063788422bff2648ca4e1ebc7e"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-aiohttp \
-    python3-eth-account \
-    python3-idna \
-    python3-jsonschema \
-    python3-google-api-core \
-    python3-lru-dict \
-    python3-requests \
-    python3-setuptools \
-    python3-websockets \
-"
diff --git a/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb b/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
new file mode 100644
index 000000000..00b19bb24
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "A Python library for interacting with Ethereum."
+HOMEPAGE = "https://github.com/ethereum/web3.py"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
+
+SRC_URI[sha256sum] = "f9e7eefc1b3c3d194868a4ef9583b625c18ea3f31a48ebe143183db74898f381"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-aiohttp \
+    ${PYTHON_PN}-eth-abi \
+    ${PYTHON_PN}-eth-account \
+    ${PYTHON_PN}-eth-hash \
+    ${PYTHON_PN}-eth-typing \
+    ${PYTHON_PN}-eth-utils \
+    ${PYTHON_PN}-hexbytes \
+    ${PYTHON_PN}-jsonschema \
+    ${PYTHON_PN}-protobuf \
+    ${PYTHON_PN}-pydantic \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-typing-extensions \
+    ${PYTHON_PN}-websockets \
+    ${PYTHON_PN}-pyunormalize \
+"
-- 
2.25.1


