Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.4637.1585942967210707453
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=kq6TU+6a;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id CA87C60363;
	Fri,  3 Apr 2020 21:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585942965;
	bh=aq4sO95DM44S82fgKwAMD0bzAJ5YcnuSDayVFvhSe0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kq6TU+6aH7cdSICe5N6lG/GotdegUv1l0AOctdcLezMSeJ5itpsQEfcuChRZb5l05
	 j1NdRYgMiRLk5L39cRBBH+vpdFSN2QelFvjf+nXmIJ3zKDTuO/vSZQJMn4m9udmzZg
	 VRoDgf+L2oA1+H8AFTLal4nlYsFXfuXjuNgEP94kpKBp+x23eZKSq2MNx2x2DnPucm
	 Zi1lbn0Qk4y+8yGhHB9lD4bGwSLSd3s9sFr7z8t1CKiwBgQVtrMcshWSk9NBZKv7/6
	 BRleRH/MDWeii4jJO9QxLNOotdP7+jxrY4PPF1ybpbSqqi+udeA0lnwxsp4InDw8dh
	 FsfY1el8XXDig==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 3/5] python3-socketio: consolidate into a single file
Date: Fri,  3 Apr 2020 21:42:41 +0200
Message-Id: <1585942963-20703-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
References: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-devtools/python/python-socketio.inc    | 28 ----------------------
 .../python/python3-socketio_4.4.0.bb               | 27 +++++++++++++++++++--
 2 files changed, 25 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-socketio.inc

diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
deleted file mode 100644
index 117eb60..0000000
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
index e2542cf..7f9fade 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
@@ -1,5 +1,28 @@
-inherit setuptools3
+SUMMARY = "Socket.IO server"
+HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "python-socketio"
+
+SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
+SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
 
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
2.7.4

