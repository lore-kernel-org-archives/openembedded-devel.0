Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A69D978387
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 02:04:18 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m15so6292056pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 19:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vi43fk9yvySmbT4Y10dC+c5GiHl1hYjhWoaHH2VE39k=;
	b=tj+HAh5szAKeJ/tqbMk3xrM4d+s8lLmDoDLeWfDyXRh792fQzew9JW6TWE6+/IZKH+
	uJUBSBATOtJ2+hZJt6/xkvUSK0EHEOJcukLdGE8KEnWqfqi1ugdnYunfYZb5wxceV7Vn
	QWCIUmjezy5Bfiwf6yD2wrCu6G0beh1glyEDDjGCPdHXyhsVVZmkg6VihdEW67lfW56A
	2lmClA+fdqQ2DPNkERejyfyNZ5Jf1QmNbkMfjPnwR4IJkHN5oVyyeJDQHK4N6fc8FR8o
	lsH5dhhGmkRbIVh5t3Rc2P/9Ts/V0bhSbVYybnD4ArpPIIdwzo+jHlx2TJ+hy82TS1Se
	qEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Vi43fk9yvySmbT4Y10dC+c5GiHl1hYjhWoaHH2VE39k=;
	b=NdvltiOXLw8mTs6Z3rMK6xyJZloemVYFkvse5r30bND4oFkiuWy/mWe4OfF41QE/s7
	7wrkTMfySeAZQh9c4kX7riKwXgpoXr+GJYaEN/CiH+CWFBirsk3DNt7U5LitOKksiK9a
	ixhO7EISmuQRcK/M6xmADdnHE769qaDYGzGzhXubVpk9eVAwdF6NwjKzg1iqaqDSlaJL
	k0TAZVGrkDlLLyLnwBW8YyJSGFzQvdfGyFpStBfU7rtYa5SJbDXKxQ3hjg79ej9CuszR
	wvDZNZlW+sAm0B6OXz6vBFSTrHbCvkJ4Wi8YlfWhwu25c9TDvuJnvSFtmQseL+SaLGc3
	Namw==
X-Gm-Message-State: AHYfb5jEng8tNIwWlqKHdPPIDIRCvwDf0hu8kRWGs3o7a4za/03VozBc
	H6vPI4ynmtj4nZ0W
X-Received: by 10.99.113.29 with SMTP id m29mr630899pgc.39.1504145060124;
	Wed, 30 Aug 2017 19:04:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c10sm12347641pfk.101.2017.08.30.19.04.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 19:04:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 19:04:01 -0700
Message-Id: <20170831020401.6367-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831020401.6367-1-raj.khem@gmail.com>
References: <20170831020401.6367-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] netkit-tftp: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 02:04:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-tftp-Include-missing-fcntl.h.patch        | 25 ++++++++++++++++++++++
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb |  7 +++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch

diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
new file mode 100644
index 000000000..c5dcdb423
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
@@ -0,0 +1,25 @@
+From fa57e161fc953264a75d50a787cb83983e60acc7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 18:30:02 -0700
+Subject: [PATCH] tftp: Include missing fcntl.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tftp/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tftp/main.c b/tftp/main.c
+index 8c54843..5c9b698 100644
+--- a/tftp/main.c
++++ b/tftp/main.c
+@@ -63,6 +63,7 @@ char main_rcsid[] =
+ #include <ctype.h>
+ #include <netdb.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ 
+ #include "tftpsubs.h"  /* for mysignal() */
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
index 67a541d25..92c13e850 100644
--- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
@@ -6,9 +6,10 @@ DEPENDS = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
-    ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
-    file://tftp.conf \
-"
+           ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
+           file://tftp.conf \
+           file://0001-tftp-Include-missing-fcntl.h.patch \
+           "
 
 SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
 SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
-- 
2.14.1


