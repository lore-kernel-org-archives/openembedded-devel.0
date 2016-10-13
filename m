Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9940562135
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:06:16 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z190so7220293qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XbV3+a65ex+IWuS4/PuofNW6vRnQKlWRgK/RZzpAp3k=;
	b=LVotQvcbQat0K5ansIlasq4W0cuuCiKV2fQTTIFkYaB6uysK6kn5DChanQpI8nQyST
	AQg1zY1OERZIQmm0qJwc6p6X+D/vSm8Z85BOMa8jjGf6lf3Elr5iTvXHnhMRLP5UHuag
	sgnfwfTq+N6nInlhgEJVoKCAWJdfb8H4aG7jF9KCv3ZV+2qg6BEkZjv1h+XNXY5DDatm
	jYxPDzU7mcWQJZoPKmpPbNJdHBs6Z3t3jK+EA77BDiKwhQbMjZ1eNuLsL3gxq7O+IJhn
	prETEEJ6HLoEynDPXrLFzFFKTQXGYyq/sQAGsyoLuzxqQUkoYGDI85yq/Y0eKVcV9F2F
	pGtQ==
X-Gm-Message-State: AA6/9Rn+pEcbC6bdH28YiXndvdJQG0kil18xK/3Odoqwm+NPjHku4+yJ1lcy3dBl/MFXBg==
X-Received: by 10.55.127.131 with SMTP id a125mr8697134qkd.71.1476396377607;
	Thu, 13 Oct 2016 15:06:17 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d69sm5889947qke.45.2016.10.13.15.05.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:05:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:05:33 -0400
Message-Id: <1476396333-17889-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.8.3
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
X-List-Received-Date: Thu, 13 Oct 2016 22:06:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.7.0.bb => python-cffi_1.8.3.bb}             | 0
 .../python/{python3-cffi_1.7.0.bb => python3-cffi_1.8.3.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.7.0.bb => python-cffi_1.8.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.7.0.bb => python3-cffi_1.8.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 7038d90..d24d6ff 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "34122a545060cee58bab88feab57006d"
-SRC_URI[sha256sum] = "6ed5dd6afd8361f34819c68aaebf9e8fc12b5a5893f91f50c9e50c8886bb60df"
+SRC_URI[md5sum] = "c8e877fe0426a99d0cf5872cf2f95b27"
+SRC_URI[sha256sum] = "c321bd46faa7847261b89c0469569530cad5a41976bb6dba8202c0159f476568"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.8.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.8.3.bb
-- 
2.7.4


