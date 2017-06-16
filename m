Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1254E78479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:34:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s33so11819425qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mVg/r4INx+DofVA3EUrs2SDZvQ7X9XUFye0pdWA6WXQ=;
	b=LoEzliRXQ/fCn67Waw/AWwkB1ZP0srP0dS6xwaMWkPi+tQ3F6vz1PVuZES8mRGpLVC
	d/y8IFEcD4Hyqz8wtOc+FuVXpAFXDK/RNYlMRaTyQEWA6V/TNI2miycMcQWOgBg9tBOA
	xZfhp7yzzjusIhL+dWdtjl0VS4fmCdyUWtXMSjXcKMWMxIlRzhOjN4V5WRIDJqiJsUm0
	5p9BYYXYBRWHjDRgrgxfFqnmoWM0R9O9ip8Lp4jiyaawaj+VIkJba8Oo4Eeq76Kun8zH
	xourdF2dgcojZ1BlKmzgLhJFKobKaRZQ9xh9yICZsbf9Bnc9mODow5/vU92Gwdq6lXE/
	XvFA==
X-Gm-Message-State: AKS2vOxEYicv2D636yKdd1QymyTMbcZ7khjtMVB4bWesIuLecmHWvoCZ
	KFYsfp/0N7W6rgk6xxE=
X-Received: by 10.237.32.177 with SMTP id 46mr14241763qtb.56.1497634450732;
	Fri, 16 Jun 2017 10:34:10 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	p64sm1983666qkl.27.2017.06.16.10.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:34:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:34:03 -0400
Message-Id: <1497634443-5345-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-unidiff: update to version 0.5.4
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
X-List-Received-Date: Fri, 16 Jun 2017 17:34:10 -0000

Remove do_install_append that no longer applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-unidiff_0.5.3.bb       | 15 ---------------
 .../recipes-devtools/python/python-unidiff_0.5.4.bb       |  9 +++++++++
 2 files changed, 9 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
deleted file mode 100644
index 6d40cca..0000000
--- a/meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Unified diff parsing/metadata extraction library"
-HOMEPAGE = "http://github.com/matiasb/python-unidiff"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
-
-SRC_URI[md5sum] = "31a61729e64ee409135a2ccec80c7104"
-SRC_URI[sha256sum] = "79b4be3e5479dfc6d77747d23ec98200559ca6a842fad1f92c2a7eb56b99195b"
-
-inherit  pypi setuptools
-
-U = "${D}${LIBDIR}${PYTHON_SITEPACKAGES_DIR}"
-
-do_install_append (){
-    mv ${U}/tests ${U}/unidiff/
-}
diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
new file mode 100644
index 0000000..ceb80bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Unified diff parsing/metadata extraction library"
+HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
+
+SRC_URI[md5sum] = "c8099edf89d2e3bac16123766625a38b"
+SRC_URI[sha256sum] = "a7baf71846a68c5305a7d6005dfb5eca8798f13861176355a285cbda3206824d"
+
+inherit  pypi setuptools
-- 
2.7.4


