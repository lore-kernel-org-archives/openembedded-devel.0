Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C11977E88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z1so1059196pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=04lNUDGZAQTA8w+18V3nh8+A8HJFiR7EyKYTMTKjL+o=;
	b=ZknbnfUNqzIUCx7laeRqZpTmljenlVaugozpnSMr8emdBMVwm19nD4HcKfoxaHdL/R
	nfJUTFnCcZXbDeeJUCcHIbIUAT9BHja+Ugs53MZ6S7nJDEEkfTTXK4ITD29Q5XEOuA7I
	eELCYMesD/aPWdfk5ERdJr6Cdpnh6qf74/7dNudOh91JZX2kF/2r5dOZQNGIsYCnf0h6
	BzDcv8oWL/DlVk5FKaOH3uI4tsbBoVTkGdBSljJqV/tNvT83CI7cqYACELYEZOuSLMh+
	/JxRR9E976IfX7nOoXENDBUwVah6ZwRM3+1wvmP3XMNpNoTn2SlSrYgSkn4VPMphjFhS
	m15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=04lNUDGZAQTA8w+18V3nh8+A8HJFiR7EyKYTMTKjL+o=;
	b=NccGOKjzU0kEm09R2ACss2la0ap1YyQgW5ZXUvRGHQrZrrMDCi+4quqcJmC+LbDK/4
	A40M8f68JgXr/Q0/mwHnolG39yilVvVGkW/Pl+NQAHkNMUM0aqbeu7UXNK44jl9wCveE
	ryVecM3CLV2BsApV6v/PboSpSoHPBOPkXtBL1t0i+fahD6C0btRqqpUOxw8r8wD30ZCK
	zVNUlU1rH0nizLVF81ebtRZPKkoSTeaLkZ3GRKk+c7AU6YWBrpsSGO11zwgk0q8d2bS+
	hwHpe+8H7q5O2hcgmE1NL4/UrXL583163/OM/cLtQyHGMqHQHUGgcfy0eXBHXbTluYk6
	OvXw==
X-Gm-Message-State: AIVw112n9OdN4aVOaxVyGFfnaR8M5+yXFzgitOQRn+ZVJ1tw3UfrN8y8
	ij0gxYRrlKu0i2uE
X-Received: by 10.84.143.129 with SMTP id 1mr820513plz.185.1500347425111;
	Mon, 17 Jul 2017 20:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:09:57 -0700
Message-Id: <20170718031013.44536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-networking][PATCH 01/17] igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xy.h-Include-sys-types.h-for-u_short-u_in.patch | 25 ++++++++++++++++++++++
 .../recipes-daemons/igmpproxy/igmpproxy_0.1.bb     |  5 ++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch b/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
new file mode 100644
index 000000000..82cdc36ac
--- /dev/null
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
@@ -0,0 +1,25 @@
+From a557651a08e21e3c7c7f5eca9f5405f86624903f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 22:42:51 -0700
+Subject: [PATCH] src/igmpproxy.h: Include sys/types.h for u_short/u_init
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/igmpproxy.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/igmpproxy.h b/src/igmpproxy.h
+index 4dabd1c..4454729 100644
+--- a/src/igmpproxy.h
++++ b/src/igmpproxy.h
+@@ -46,6 +46,7 @@
+ #include <stdbool.h>
+ 
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <sys/un.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
index c3d2f1afa..5424dc455 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
@@ -5,9 +5,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e995e2799bb0d27d63069b97f805420"
 
 SRC_URI = "http://sourceforge.net/projects/igmpproxy/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-    "
+           file://0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch \
+           "
 
 SRC_URI[md5sum] = "c56f41ec195bc1fe016369bf74efc5a1"
 SRC_URI[sha256sum] = "ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae"
 
 inherit autotools pkgconfig
+
+CFLAGS += "-D_GNU_SOURCE"
-- 
2.13.3


