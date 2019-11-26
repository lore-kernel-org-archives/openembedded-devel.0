Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 679D27F7B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 21:02:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j18so3318601wmk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QrbiKM1uSh91OcFANnRCRoj/WUf5AmBtaldtUlCzNjc=;
	b=yuHh1DN3mIgFWZ4poHV+uGv9Ehhf3ia7JV0W5URvc9qV12crHsYe05LrR4Hho7gcmv
	q5pSSUXu9dcxj89xWN5RWbtdc2gUR3PC2TZDU+spT22WsG1V3yr5LQ2fJJGKoWueed72
	gmK8jmwwAsVvgAe6vjTdmTEpPhKjhkykvktpmzaFpO97ME/TVpVl/2jfR84rNeWRnh3y
	dEgVuhJ0dH796WoDIBjAswQFy6KtjxN9PNlTk80uULq+/fTne5evxZgurMWlk49J3JD+
	G5TutqAJj3qVXNjUiDQdDOnsSFO8LG1q2e5JTQ0lPgjMR/LCaMZCj6T8CoWuJPUaHrQQ
	w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QrbiKM1uSh91OcFANnRCRoj/WUf5AmBtaldtUlCzNjc=;
	b=uksIBLyzTBTQyfOIUwGUY/oCGwbo8OxYN2oULIv2luLPaDcK9ndumLBmVhxuocjFsp
	q91vTzCMwFPiSlFAqN3ZZ4yiFlV7m7szOyJ+fXC6OoZuegBskiv7QUkuxQwbtJsFmtZ6
	5FWRGKnJrfrNg74nDl7i25rt/1KkWcLpkJDmyCj04wljO6Eb3g7ZUuRGOaWuJNs0EQkb
	an+Dpk/y2MpFEBNY9P93XVyWGXfAj6yN8ybDs6M1f//4pwQ++BTLSjij5Ty7g6xfU26D
	Ols6DcThzlMZu8tBQoogJXmgTE1np17VqfYePMbgGQLDj3RS+2+Kdqd29yLohKCVRu8t
	Y1RA==
X-Gm-Message-State: APjAAAWESbLvNcteTqMlI44+luuCFv4BipQoa6DwCz0iIIq2IsjvZmxS
	p3Mhr+QEV1mw8qeuJq81hEEQd9FQpeU=
X-Google-Smtp-Source: APXvYqz9oWj3ZYKJElIY8vgybKrCZ19/o5qmM6sHVLHkrxPH26uf4LwYkkck2dV6pZxpVD32CCtchw==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr961884wma.166.1574802131676; 
	Tue, 26 Nov 2019 13:02:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x205sm4907954wmb.5.2019.11.26.13.02.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 13:02:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 21:02:06 +0000
Message-Id: <20191126210206.15650-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] htop: use Python 3
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
X-List-Received-Date: Tue, 26 Nov 2019 21:02:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/htop/files/py3.patch | 15 +++++++++++++++
 meta-oe/recipes-support/htop/htop_2.2.0.bb   |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/htop/files/py3.patch

diff --git a/meta-oe/recipes-support/htop/files/py3.patch b/meta-oe/recipes-support/htop/files/py3.patch
new file mode 100644
index 0000000000..fd28d51d5c
--- /dev/null
+++ b/meta-oe/recipes-support/htop/files/py3.patch
@@ -0,0 +1,15 @@
+Use Python 3 explicitly instead of python, which we don't export to HOSTTOOL.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
+index 349531b..3336dea 100755
+--- a/scripts/MakeHeader.py
++++ b/scripts/MakeHeader.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ import os, sys, string, io
+ try:
+    from StringIO import StringIO
diff --git a/meta-oe/recipes-support/htop/htop_2.2.0.bb b/meta-oe/recipes-support/htop/htop_2.2.0.bb
index 01c856d123..5724c5b8c6 100644
--- a/meta-oe/recipes-support/htop/htop_2.2.0.bb
+++ b/meta-oe/recipes-support/htop/htop_2.2.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 
 SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
-           file://0001-Use-pkg-config.patch"
+           file://0001-Use-pkg-config.patch \
+           file://py3.patch"
 SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
 SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
 
-- 
2.20.1


