Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5638877FF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:35 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id f127so24199445pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+6W+3Uos+LqSwgvZAQv/IVCO479xPS59lrfKMs5PqEY=;
	b=DEKmSZLgOYNUnq2HPR9+sJom/mvuL7UwnQ2ePi9nnRgij7SrSuMOf4yaAiG8N4Jg35
	hGB4rh9vAQ3cTy6wc00425bcxGhDwD4m9nTaKAKfcC/ykU3BwbJZH8RXLbanZUyZgau3
	7NKY+WjQ0IEr7kmbPtg7e8szVQ0Tnsu8KMoOP1T2J8INFFIFSZfcpPSorq2CmOgYyfdX
	aJVUQxrHztkWpyhxAWDpQeXnZOQzhBW7XkyjYGPr8PHwEPRslCJGQY3LaWUPdbPNdVXw
	eJG35Ph0Bm2WmcEzIOyo9Rcz7fkH/1dIxyhlyOZfAFz3sbKfIWwU0kTzb88jsSj8GlAt
	vmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+6W+3Uos+LqSwgvZAQv/IVCO479xPS59lrfKMs5PqEY=;
	b=ry6YespMqnx1axDIWdaOAA9gJUrEqeWMKbGcwfbfvHvzib90dHl5QRH04D3MwPQM/W
	iJteM8q4kd0CZlCKDu19Nb6Oe+N+ZoVJZoCmhKe6rNQDjni2Ok6iMm5VeOuaY5Z5q09V
	OC4f5PhVb47ZH6lrzZhqKlakWlYPChuYhAUVW+qfQe8YLA5xXnMTguAHGHEIXgIV3mv8
	7XJPQ33X/Ix66zrkYrIWoaVu3o4o4ZrMtXBYEEgONCruW/YVVlKUAgCVO551ar+AUarr
	Tz7Xi/xWXp9MjWSYBuLddXEijhWrZ8GZVZcCUwMQBXdWCEtirnDFh43Wk68xfJCR/TQK
	djpw==
X-Gm-Message-State: AKS2vOzwOBglyIIsCVEGOP5EtXxwucyMQSzEsow2Xguv75S4g9ex++LF
	DF6PJ82Szs/q1OAV
X-Received: by 10.98.131.134 with SMTP id h128mr8175639pfe.132.1498615716772; 
	Tue, 27 Jun 2017 19:08:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:07 -0700
Message-Id: <20170628020819.17047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 01/13] Add stdint.h for 'UINT16_MAX'
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-stdint.h-system-header-for-UINT16_MAX.patch | 29 ++++++++++++++++++++++
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
new file mode 100644
index 000000000..c2111a2c1
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
@@ -0,0 +1,29 @@
+From 446fb15f79499f52ce01ca759dbdcfe635519a82 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 07:09:33 -0700
+Subject: [PATCH] include stdint.h system header for UINT16_MAX
+
+Fixes build error
+
+error: 'UINT16_MAX' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ interopServerProvider.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/interopServerProvider.c b/interopServerProvider.c
+index 23ae182..532febe 100644
+--- a/interopServerProvider.c
++++ b/interopServerProvider.c
+@@ -33,6 +33,7 @@
+ #include <sfcCommon/utilft.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <ctype.h>
+ #include <string.h>
+ #include <sys/types.h>
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index fa75fcc16..ddb1cba7f 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
 DEPENDS = "curl libpam openssl sblim-sfc-common unzip-native"
 
 SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
+           file://sfcb.service \
            file://sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch \
            file://sblim-sfcb-1.3.15-fix-provider-debugging.patch \
            file://sblim-sfcb-1.3.16-maxMsgLen.patch \
@@ -19,7 +20,8 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.3.16-multilib-man-cfg.patch \
            file://sblim-sfcb-1.4.8-default-ecdh-curve-name.patch \
            file://sblim-sfcb-1.4.9-fix-ftbfs.patch \
-           file://sfcb.service"
+           file://0001-include-stdint.h-system-header-for-UINT16_MAX.patch \
+"
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
-- 
2.13.2


