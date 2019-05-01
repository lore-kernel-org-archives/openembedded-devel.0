Return-Path: <parthitce@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 822C87D906
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 11:30:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so24253426wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7jjODdec0BEKxyM1JvyBk3CMefTZW1BdK5km6yJBWV8=;
	b=PfGWlC07IgKiqZHxfahJWY3N3mghyvLpiKXzOiVJqGRIanJ9v1qj3GFMVTgc4vbdv3
	vsDwE6GWrVuTPnmvX5l8IE0kJMWoKNk3Zx+EtvvNr7GEVbdNoi/8jWqUrlpsTfAYamia
	evTDc+oN+DDrCaUeuwbHZAv7p+iJSZ0FBRB7n+LPl7kiyltpONyPXRLaqVpq6UeUxbnL
	MHFSklttH2MghKYqwrzNtktOG2Pxa5yBmrW623Za7v+5TwghDo/VWAwlhMgZTeLBPkBw
	AWXBoAMWHqDiu+tRC0eiAiamKCZoiFbM0TNaOxphapJhY0jMyLJPOT9qZTbA9AexDqgZ
	muqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7jjODdec0BEKxyM1JvyBk3CMefTZW1BdK5km6yJBWV8=;
	b=Q4Ifivp+5mp+Yyit9NmeK5KhYPjTVdgnUNv7uMctdbhTg8YE7D6Qn7F53TD/vDwky/
	B0Bg6jjXHDoA0KgTl32HisziMo1AJEvUT35FScSV65GuY3t/hswfjvHAxPSlDNA+8fUm
	dpZXyUrvRZ70wWzX8BR+lvFzpCXoNS2tH4oUL2/7vLHA9Y2EW0jcjSoCSWaJxgPTb9jW
	eDWGzLk8og2okBi6NxnTQ1VNd8QUGtLa+5tVwnDsEsZ/xGbLu3VDIl93JGzsnSEzp3dS
	TJbWaG4rAQnx5Y9A68bIns/VzQpDnU/N07bgVfo4+MLtE0TVD0dlL8h/L0YDJAgtYDIU
	Q2Qg==
X-Gm-Message-State: APjAAAXA/LdhK4EbIwRb4RqCRIOMCsqzauIaemv0pOnXyHRnnuEpbrOK
	XnBCaS7i5CJApD7o2JbdgCuqG+0pig==
X-Google-Smtp-Source: APXvYqyEqoaTCqjU6PtACY2AdhTRg4gDuH7WV4nQBUHWzx+f3Mf313v5CBb3XrvDHMPTulU4xhb7jQ==
X-Received: by 2002:adf:91e6:: with SMTP id 93mr22155169wri.260.1556710225834; 
	Wed, 01 May 2019 04:30:25 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180]) by smtp.gmail.com with ESMTPSA id
	m187sm3119524wmm.37.2019.05.01.04.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 04:30:25 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 13:30:07 +0200
Message-Id: <20190501113007.2976532-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-aiohttp: add version 3.5.4
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
X-List-Received-Date: Wed, 01 May 2019 11:30:25 -0000

Added python3-aiohttp with following missing DEPENDS
- python3-async-timeout version 3.0.1
- python3-idna-ssl version 1.1.0
- python3-yarl version 1.3.0

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-aiohttp.inc | 18 ++++++++++++++++++
 .../python/python-async-timeout.inc            | 15 +++++++++++++++
 .../python/python-idna-ssl.inc                 | 10 ++++++++++
 .../recipes-devtools/python/python-yarl.inc    | 10 ++++++++++
 .../python/python3-aiohttp_3.5.4.bb            |  2 ++
 .../python/python3-async-timeout_3.0.1.bb      |  2 ++
 .../python/python3-idna-ssl_1.1.0.bb           |  2 ++
 .../python/python3-yarl_1.3.0.bb               |  2 ++
 8 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-aiohttp.inc
 create mode 100644 meta-python/recipes-devtools/python/python-async-timeout.inc
 create mode 100644 meta-python/recipes-devtools/python/python-idna-ssl.inc
 create mode 100644 meta-python/recipes-devtools/python/python-yarl.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-aiohttp.inc b/meta-python/recipes-devtools/python/python-aiohttp.inc
new file mode 100644
index 000000000..81f1809bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-aiohttp.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Async http client/server framework"
+DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
+HOMEPAGE = "https://github.com/aio-libs/aiohttp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
+
+SRC_URI[md5sum] = "85fe5c9037256c58d4678148bd91b3f3"
+SRC_URI[sha256sum] = "9c4c83f4fa1938377da32bc2d59379025ceeee8e24b89f72fcbccd8ca22dc9bf"
+
+PYPI_PACKAGE = "aiohttp"
+inherit pypi
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-async-timeout \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-multidict \
+    ${PYTHON_PN}-yarl \
+"
diff --git a/meta-python/recipes-devtools/python/python-async-timeout.inc b/meta-python/recipes-devtools/python/python-async-timeout.inc
new file mode 100644
index 000000000..7e4959ebc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-async-timeout.inc
@@ -0,0 +1,15 @@
+SUMMARY = "asyncio-compatible timeout context manager"
+DESCRIPTION = "\
+The context manager is useful in cases when you want to apply \
+timeout logic around block of code or in cases when asyncio.wait_for() \
+is not suitable. Also it's much faster than asyncio.wait_for() because \
+timeout doesn't create a new task."
+HOMEPAGE = "https://github.com/aio-libs/async-timeout"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI[md5sum] = "305c4fa529f2485c403d0dbe14390175"
+SRC_URI[sha256sum] = "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f"
+
+PYPI_PACKAGE = "async-timeout"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-idna-ssl.inc b/meta-python/recipes-devtools/python/python-idna-ssl.inc
new file mode 100644
index 000000000..e74bbd7c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-idna-ssl.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Patch ssl.match_hostname for Unicode(idna) domains support"
+HOMEPAGE = "https://github.com/aio-libs/idna-ssl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a61b9c5aec8796b64a6bf15d42605073"
+
+SRC_URI[md5sum] = "dd44ec53bac36e68446766fd8d3835bd"
+SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
+
+PYPI_PACKAGE = "idna-ssl"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-yarl.inc b/meta-python/recipes-devtools/python/python-yarl.inc
new file mode 100644
index 000000000..49b5a607b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-yarl.inc
@@ -0,0 +1,10 @@
+SUMMARY = "The module provides handy URL class for url parsing and changing"
+HOMEPAGE = "https://github.com/aio-libs/yarl/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
+
+SRC_URI[md5sum] = "92889c31fce4c8f82b7ee9c2b2ed9cd1"
+SRC_URI[sha256sum] = "024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388ba7aa9"
+
+PYPI_PACKAGE = "yarl"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
new file mode 100644
index 000000000..cd0303f05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.5.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-aiohttp.inc
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb b/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
new file mode 100644
index 000000000..7e2ffdb05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-async-timeout.inc
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
new file mode 100644
index 000000000..3643fcfd3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-idna-ssl.inc
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb
new file mode 100644
index 000000000..c5df44216
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-yarl.inc
-- 
2.17.2


