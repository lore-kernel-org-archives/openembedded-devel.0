Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 176F377A57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so23968380pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fh0yCYMUMvNzVsyB4FjZz1CXUVAH20pVSMjhn30wa+Q=;
	b=p/no+VV6NFMVrApr605N6uXV3CYP52VhUn20mPEiWECAxQKPgHpp14/NxPXs+q2soO
	WisCSxOxSabpnyQYXf+fO27XOv+SR0dCaKROaWa6AnRcHjqB0u/hIu3gvCTM/c8lr26R
	62kJ2LaVQlNJHtxZfxC03HfuBemb61H1HUlxWFm2riOFDU6+kgaupjjVyuyzVgD6VGor
	sobEpNrQU5OSqGkSM0xnn3M3MqTdOCVkKeD8SBHlBA7XHEnOebmY30MrN5yZg3VC29NP
	u7OCNPducVoBAC97ucs8Waovp+E75OZvExp4uDNdYHzfhoL2vlGrz6je03fpLMNUm3X9
	bCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fh0yCYMUMvNzVsyB4FjZz1CXUVAH20pVSMjhn30wa+Q=;
	b=EuzGRTudVQ096DM075P9pgipywJYt5qzmrur5pkbuPfE6QKupRgB8jbP49Y7kyT7UZ
	ZvFFKDFb0zb5RsSOytkN5YzyMRMclREIXu/FrrGPQLv8O1vOp8JZGmgUp1RQQ679z4V8
	bMxEE5P360/p+vnMF1ZUyBTo2wWJb6uB7OOuVukDVV8BBrosyxfj2IWrk2j1emrGGVRT
	x/YTwcsaxA1zE/deTFX79xl+sK3kUO+hQlFggA6ztZJ4EUcRIMT3uvcg+XBfJlHc8Vx2
	hGFEG2IyesUEna3EjOC/DZT64lFYnqZ6uoNcGNHxxPrtq7HboAD016EvM2AqcQyr44QP
	EgXQ==
X-Gm-Message-State: AFeK/H0Y6s60E2DPQAAZd8YTJSFYMg2NxaCGrVG5ODjaqHUpX3EnePruuuKzAMELalbEsg==
X-Received: by 10.98.107.194 with SMTP id g185mr48288122pfc.22.1490208351028; 
	Wed, 22 Mar 2017 11:45:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:29 -0700
Message-Id: <20170322184533.6501-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/10] libndp: Include sys/select.h in ndptool.c
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:50 -0000

Fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-select.h-for-fd_-definitions.patch | 25 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb  |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch b/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
new file mode 100644
index 000000000..bafd916d2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
@@ -0,0 +1,25 @@
+From 33150de2d77ffb645da1a043933b12ddc0143cea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Mar 2017 18:59:03 -0700
+Subject: [PATCH] include sys/select.h for fd_* definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/ndptool.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/ndptool.c b/utils/ndptool.c
+index 1d96f4c..0fd4c4d 100644
+--- a/utils/ndptool.c
++++ b/utils/ndptool.c
+@@ -23,6 +23,7 @@
+ #include <string.h>
+ #include <signal.h>
+ #include <getopt.h>
++#include <sys/select.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index a35dff8b7..e06ff7f99 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,7 +3,9 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+           file://0001-include-sys-select.h-for-fd_-definitions.patch \
+           "
 SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
 SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
 
-- 
2.12.0


