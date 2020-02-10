Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2403760B0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:31:13 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id z2so7633214oih.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0qeFduSsLPE8WM0yWRB2DXVLurefhdKHrIbOdvnL59s=;
	b=VXbqEdPe6x7kaWnX1zz5A+CIJBfHH+EUOc4yWGzmm9sIyoW1fwL0FfZiDFvkmiUROw
	kv0ypks0DXWnEl1PcScj2VfrJyLzG+Ir2eC3bM6lQhkxOWmMBCtzGzfbP0hkH9OdU6fv
	Ckm1gvM+XhCvGFad6DogQDv72xSXr99epyIM1JB9lVwBlQk6ggoUpL2hBTP36yv8TlXy
	LlSWjtk+LBY1wVGSgLqmP3RImfr8mhlqAwyxDRREpcju1g87cRsm02Ht6hlzkO4qub4l
	KZILOmlL7cUlfiU9o1vKko9SRSmzicuOhMP6jcEuHLncy6Z3BmIEOrAk4w8em++wyMbb
	miAg==
X-Gm-Message-State: APjAAAXuV6UFRYxPybDBdpSzf6d/BNo/Tj5OhqI05MAIsArnWt5AdRNz
	oBalEduwQxFxzP3OM6GG7V89vRirRHI=
X-Google-Smtp-Source: APXvYqxXG4wndSdMwXc2pZOrhYs7Fpbeb84JO2JIcVYY7/yY1KK7L5rPoD9IJ84lHH9vwCdhHYpKNQ==
X-Received: by 2002:aca:db41:: with SMTP id s62mr8899185oig.87.1581294674716; 
	Sun, 09 Feb 2020 16:31:14 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	f22sm3904290otf.50.2020.02.09.16.31.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:31:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:31:01 -0500
Message-Id: <20200210003101.11087-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-async-timeout: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:31:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-async-timeout.inc           | 19 -----------------
 .../python/python3-async-timeout_3.0.1.bb     | 21 +++++++++++++++++--
 2 files changed, 19 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-async-timeout.inc

diff --git a/meta-python/recipes-devtools/python/python-async-timeout.inc b/meta-python/recipes-devtools/python/python-async-timeout.inc
deleted file mode 100644
index e71a00262b..0000000000
--- a/meta-python/recipes-devtools/python/python-async-timeout.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "asyncio-compatible timeout context manager"
-DESCRIPTION = "\
-The context manager is useful in cases when you want to apply \
-timeout logic around block of code or in cases when asyncio.wait_for() \
-is not suitable. Also it's much faster than asyncio.wait_for() because \
-timeout doesn't create a new task."
-HOMEPAGE = "https://github.com/aio-libs/async-timeout"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
-SRC_URI[md5sum] = "305c4fa529f2485c403d0dbe14390175"
-SRC_URI[sha256sum] = "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f"
-
-PYPI_PACKAGE = "async-timeout"
-inherit pypi
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-asyncio \
-"
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb b/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
index 7e2ffdb05b..22dffe6462 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
@@ -1,2 +1,19 @@
-inherit setuptools3
-require python-async-timeout.inc
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
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
-- 
2.17.1


