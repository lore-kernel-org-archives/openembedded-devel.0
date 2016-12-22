Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 49CC2774E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:24:56 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c47so235870198qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nk5YP8hkcEuUpsfnQT9y5UncIANFob3MMPrfqJU1ZBA=;
	b=aFsMhmdGbhh/XuXDrHKYQzYg00lh9rpYIz8bRBhwZ7wxxWUQ6wOSS7nLT3HIzFNMyR
	2XmEsqyxvAYYv4CJvwaopDcKVzk7x/q7TQch/oriaLLKBx2o87slYsQh9RNRifD2UsJI
	/RaykB2Xxy0vISxsLTbCZbdkFi5fpyihU1Wxx21Hx7S5qwL5xD4ZXZs7TxAveZ3kAiQT
	pv36s0LSpfDsmVbz+d5Rflc+oGsoyogsOSKM4FFBqJxPYESIpfFdcFL/gDhwSIDNqkW+
	hu9LtDIWdInY06KjWw6kuqYXlwvJEadfJy1tUfMFvkqRMkl1CujaNHETE872lpP6qakM
	JPHw==
X-Gm-Message-State: AIkVDXL+x/wR8lHoMmBpg71Akxye21ff7zc/NTuVKMOUd/W8lgpwL/mpaDztgAt0KBBd9g==
X-Received: by 10.200.57.71 with SMTP id t7mr10911831qtb.59.1482416697570;
	Thu, 22 Dec 2016 06:24:57 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 33sm18097778qtq.1.2016.12.22.06.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 06:24:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 09:24:16 -0500
Message-Id: <1482416656-27059-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2016 14:24:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc               | 8 ++++++--
 .../python/{python-cffi_1.8.3.bb => python-cffi_1.9.1.bb}         | 0
 .../python/{python3-cffi_1.8.3.bb => python3-cffi_1.9.1.bb}       | 0
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.8.3.bb => python-cffi_1.9.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.8.3.bb => python3-cffi_1.9.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index d24d6ff..12da19f 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -3,7 +3,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "c8e877fe0426a99d0cf5872cf2f95b27"
-SRC_URI[sha256sum] = "c321bd46faa7847261b89c0469569530cad5a41976bb6dba8202c0159f476568"
+SRC_URI[md5sum] = "b8fa7ccb87790531db3316ab17aa8244"
+SRC_URI[sha256sum] = "563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8"
+
+RDEPENDS_${PN}_class-target = " \
+    ${PYTHON_PN}-io \
+"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.8.3.bb b/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.8.3.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.8.3.bb b/meta-python/recipes-devtools/python/python3-cffi_1.9.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.8.3.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.9.1.bb
-- 
2.7.4


