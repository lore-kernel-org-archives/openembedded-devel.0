Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADD471E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:23:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id e1so10658216qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WKQnFXCtqMOb/A88DkoRdi9gAJXCn/scNHii4wEVEB4=;
	b=m4ya2wYJKBpNXLYe+DWQtMv7ALMCEsNyoLD7zQhmhjVOImgvithct1Pz2AjbCDKa5s
	ERsFQGCRrBf0tXpw/KLWZPaIzrXRWPpfiROd4ywzSD/OIvqdKvPwvsaV3kRXii/nL7S0
	i5RKaEoSwvZKzFyqyBG/AkaF7BKEKjGrCOSZH9eilnuvPByitF6BvG5ii/UBTBv8/kGs
	nbeT8ATX7mqbShc9PEw3lfr2H0+pFfZAMxn9zVZDOLslUMsDiavDWxY/NedfC15J3FXn
	WOoAddEso/XMcRE8xaNtMfeJvkq9fiR38okwWUlGpB52wfgupfa6t0THP42ykf61DDbC
	T0MA==
X-Gm-Message-State: AIkVDXLMh5vfWfzzXaDIQq29TPkMc5l2Kqu/qf977hw2rsEfoQ/D5/zyJtEGeBO/IFmQ8Q==
X-Received: by 10.55.180.129 with SMTP id d123mr33427785qkf.158.1485357815173; 
	Wed, 25 Jan 2017 07:23:35 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	y189sm517294qky.39.2017.01.25.07.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 07:23:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 10:22:55 -0500
Message-Id: <1485357777-6007-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-selectors34: add new recipe for version 1.1
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
X-List-Received-Date: Wed, 25 Jan 2017 15:23:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-selectors34_1.1.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-selectors34_1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-selectors34_1.1.bb b/meta-python/recipes-devtools/python/python-selectors34_1.1.bb
new file mode 100644
index 0000000..1982418
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-selectors34_1.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Backport of the selectors module from Python 3.4"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1cfbbf590d8d5b7fe937516217b778b3"
+
+SRC_URI[md5sum] = "403194b10f35a5258e0642712fdd3753"
+SRC_URI[sha256sum] = "84b3743b9046461aebbcd13c15e79ab91e79acfb6e030b54a0ec6360ae0bbc52"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+    "    
-- 
2.7.4


