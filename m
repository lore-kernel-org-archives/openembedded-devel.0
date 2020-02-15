Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id 70EAB613DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:36:06 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id q81so12818168oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pi5MvF+Ju7o4VfSPe4qwzyHTnEWpy9JYSysnXUETUmY=;
	b=YODkPVU8EPplWZwrlM2LO3CK3/AMlZpYTZOEFVVR6b3GxBGkdzRa4yDP8/tDDhoEon
	zPALLx3RU7IAeawgDr2Af1vpjk0FPbX61PpWBAEncqrOseO7fcT8Pq7EAyJebGtNQuJr
	FNof6g1KLtwrcG8rDivGkteJ0nhIDHU+wyhN4grFd+VCimeBM5Tv8X0xJjWkYH6Qw8vi
	5Fu7Lbgrq81wcsHW2c0d+QslYHRpseriZCS25x/BeNul4wXiN8TxFSID2HS7ZUW4Ov5f
	sJPYgJxB2K2MJmyAdUz2RB0f7VPGoZO7/MS5M/0pSqOgSHRch5bchsPNUK/TZwKs2oWy
	iF2w==
X-Gm-Message-State: APjAAAWB6K+zk9gCqbFQNxp19ud4h7WdSPYUD81igKVEl57LY4eE4Fsn
	/365ZGmWFF7Uyfi8d8+gSblODo6k0/A=
X-Google-Smtp-Source: APXvYqy9GApIlV1875Nxmva4I0kg3+IszSSKWT5wDYh/R1pPmE6A+MqY/ZDSMV9S7nHzTjeOXJk8IQ==
X-Received: by 2002:aca:ec15:: with SMTP id k21mr5545887oih.35.1581788167163; 
	Sat, 15 Feb 2020 09:36:07 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	x15sm3293117otq.30.2020.02.15.09.36.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:36:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:35:54 -0500
Message-Id: <20200215173554.32726-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-configargparse: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:36:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-configargparse.inc          | 22 ------------------
 .../python/python3-configargparse_0.15.1.bb   | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-configargparse.inc

diff --git a/meta-python/recipes-devtools/python/python-configargparse.inc b/meta-python/recipes-devtools/python/python-configargparse.inc
deleted file mode 100644
index 17d296ff8d..0000000000
--- a/meta-python/recipes-devtools/python/python-configargparse.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables."
-HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
-
-SRC_URI[md5sum] = "aba15b7973b7a70bea86fd69289f8fe3"
-SRC_URI[sha256sum] = "baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac"
-
-PYPI_PACKAGE = "ConfigArgParse"
-
-inherit pypi
-
-PACKAGECONFIG ?= "yaml"
-PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
index 698eccf666..0797898a9c 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
@@ -1,3 +1,22 @@
-inherit setuptools3
-require python-configargparse.inc
+SUMMARY = "A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables."
+HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
+
+SRC_URI[md5sum] = "aba15b7973b7a70bea86fd69289f8fe3"
+SRC_URI[sha256sum] = "baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac"
+
+PYPI_PACKAGE = "ConfigArgParse"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG ?= "yaml"
+PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


