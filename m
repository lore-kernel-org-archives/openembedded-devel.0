Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 08ABB7F7E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:36:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f129so7977603wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ngPhRiMzJOdVYWJeUW/0/MhUHkS8ey0dN2gOrXrj1io=;
	b=rH1ncZcaz7jsOGvHE530LVJsT2pRBsFyk5/aY70aL8kzNIeYnqj2IcWIpXTjYHNHxS
	CRgemiIQ8LYBhVxVnVSJ1sppON69Uv304v9Q3V4FBOfTGxsOVVxwj//MT7Nn4pNJgDcW
	OFFS2ALCdf1wYK6/gsV0p/jQIiuIB7r2IlgEgczSrHB8HZmyKGGuAdtySIT9pxMPGpnO
	pnoEIuJpNqXP2FPhvJEusn48PX3r5MyYR1HyK+xUJ0HqcgrEDKpbzStTad7L2rVX+/8q
	uQZbK7LvkBgtPHr1Z8LdfReNtf7iSNs1SmIFy2KNm8+T6aiPbbVNQKQquJuB3Ic02nPt
	IaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ngPhRiMzJOdVYWJeUW/0/MhUHkS8ey0dN2gOrXrj1io=;
	b=R9fUiAtpUAm4ilaWkMBk94byJdhYsLxbV3tiaqEiQDmbWK3OLy0HN7GTjDkdLG862I
	pEp3jc3u7FR008T8ZIv65Np44ATS0fUU2sJs294JVzdxLdihaRjP8Five6EiLUQCb4S9
	A1J+3RwKZ9XdTIZvs0f5gkuwNL5QyoWgaloBeFx9RUnObSb/rg4r8ZWwDB1PyGHj4iIQ
	XU7YzzHyNtTdJB5xl5mYqFpujNpV9zTDfgYHM02rLPy2Re/JUdAVimmuhaFWQcSPNRUi
	BB0WLtdPpdst6V++Xdkknl3igmpwiKgyPRttFAAiE8NzFpAh2PrjYr3b2AtKLZXtEGYn
	M9qg==
X-Gm-Message-State: APjAAAVi/+y29D8UeVUA9aDG2qymzAH3JpOA9D96bJamws/kxTiRThRl
	W+PWek9Y35ifDkv4ve27nHH7hU1pQf4=
X-Google-Smtp-Source: APXvYqzeVCpjImBbgnvQmeq4TBBNLYrdKBU6/0lAYdM+SdYZisb3r0YfHSHUsK85t1rdHjSS0yW5Uw==
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr146503wmb.162.1580146579624; 
	Mon, 27 Jan 2020 09:36:19 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	s10sm21916939wrw.12.2020.01.27.09.36.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 09:36:19 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:36:06 +0000
Message-Id: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 17:36:19 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

Update pcsc-lite recipe to target python3 since python2 is EOL and has
been dropped from OE-Core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
 .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
new file mode 100644
index 000000000..3e7b0adda
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
@@ -0,0 +1,43 @@
+From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 13:27:12 +0000
+Subject: [PATCH] pcsc-spy: use python3 only
+
+Python2 has been EOL and most distributions would not provide any
+support for it anymore. Since Python3 is available in all distributions
+now, switch pcsc-spy to use it exclusively.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ src/spy/pcsc-spy | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
+index 85222c6..965138e 100755
+--- a/src/spy/pcsc-spy
++++ b/src/spy/pcsc-spy
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#!/usr/bin/env python3
+ 
+ """
+ #    Display PC/SC functions arguments
+@@ -22,12 +22,7 @@ from __future__ import print_function
+ import os
+ import signal
+ import time
+-try:
+-    # for Python3
+-    from queue import Queue
+-except ImportError:
+-    # for Python2
+-    from Queue import Queue
++from queue import Queue
+ from threading import Thread
+ from operator import attrgetter
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
index 5e6084656..fb8c4a202 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
@@ -10,7 +10,10 @@ LICENSE_${PN}-spy = "GPLv3+"
 LICENSE_${PN}-spy-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 
-SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
+SRC_URI = "\
+	https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
+	file://0001-pcsc-spy-use-python3-only.patch \
+"
 SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
 SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
 
@@ -50,6 +53,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "pcscd.socket"
-RDEPENDS_${PN}-spy +="python"
+RDEPENDS_${PN}-spy +="python3"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


