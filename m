Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C73760778
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:18:06 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id oz2so1312488pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e+qIkmfiVRjGjhdbe4FgpMC5XVr8vBb52RWMD+5yWlo=;
	b=Du6bDVyt20/UCdIIgiacqQGJWraB3bQ+o0Muer6VNTAjhDzVmKcPaScFyYhRa6ORoH
	89sTnuvfD5hlTACmV52qjZ8vw/W7OsjgZfdhsVCrGrBT/yQMUZU+na+OWFzdg9w39euZ
	iegWEvUVnY2xe16PWhS9I5pKQcpSQXpMac2bMYpvGCA/iWacvwTRGuG2GJGmkfnFL6bZ
	nSKuzWf55aYTgg93gdxmlVmEJaypSGJYVB+81Ohos8lUnKb0E4LyB5XmY8JPK7NH4DWt
	tp8vBE7rnqSa7b393bSXfE3d/fUJB8fT/XoF492ENpwYIoR0C6pcmo4hydmDGJqBSUlR
	0dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e+qIkmfiVRjGjhdbe4FgpMC5XVr8vBb52RWMD+5yWlo=;
	b=HGNwa0BqXfNlAK7tcQJM36QJ+jKL7EqNW5YdYTgIj5WZu9w/UZvT9DpBNSRWEbXnm2
	9xnrFMcWkivMRG7PEPZWnWMI/vVxoZ1Cgz2d5vLrbzM9MRoJe115o9FfLy2p3Sx6Sl8e
	+yhqzvzECj6lDINPoM0FvWZid3nzB8hma+WVff2jWiwpxDgci+VsS71JtJLVcmSFJc7d
	9f+fIkpLHwAehj2J81/Wbfy/rUHCbkvtieDePx3VWVOR2oS/yZVz4x0wXxA2ZcWb2g6P
	HSF8XzNe29FYfs+qb9RPfH9ummI01K0SxuRxYdFDjg6ESnyNi0dEG4GyEUsEywkgoDo+
	N0Xw==
X-Gm-Message-State: AE9vXwObNuPo7Y7rEppL6GRER+3YNouqyKa5iFJXPFTcLkU8yUEd11uvBmWAauIdPLmJdA==
X-Received: by 10.66.134.51 with SMTP id ph19mr59294307pab.30.1474402688401;
	Tue, 20 Sep 2016 13:18:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z5sm110645pff.3.2016.09.20.13.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 13:18:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2016 13:17:58 -0700
Message-Id: <20160920201759.28409-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160920201759.28409-1-raj.khem@gmail.com>
References: <20160920201759.28409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] gpsd: Fix build with musl
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
X-List-Received-Date: Tue, 20 Sep 2016 20:18:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gpsd-3.14/0001-include-sys-ttydefaults.h.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch
new file mode 100644
index 0000000..b27c671
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-include-sys-ttydefaults.h.patch
@@ -0,0 +1,34 @@
+From 543f79222520cc6ab65d20f9fa356dac5c848e3b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Aug 2016 02:16:12 +0000
+Subject: [PATCH] include sys/ttydefaults.h
+
+This is needed for CTRL definition, as exposed by musl on glibc
+this include file gets pulled indirectly.
+
+/usr/src/debug/gpsd/3.14-r0/gpsd-3.14/gpsmon.c:605: undefined reference to `CTRL'
+clang-3.9: error: linker command failed with exit code 1 (use -v to see invocation)
+scons: *** [gpsmon] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gpsmon.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gpsmon.c b/gpsmon.c
+index bee05b8..daed818 100644
+--- a/gpsmon.c
++++ b/gpsmon.c
+@@ -20,6 +20,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/select.h>
++#include <sys/ttydefaults.h>
+ #include <fcntl.h>
+ #ifndef S_SPLINT_S
+ #include <unistd.h>
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 6158e97..4ff6d91 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
     file://0001-Include-stdatomic.h-only-in-C-mode.patch \
     file://0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch \
+    file://0001-include-sys-ttydefaults.h.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
-- 
2.9.3


