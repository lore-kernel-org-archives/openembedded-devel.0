Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 262EF781F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:14:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u62so16033870pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/TPXFn5OwQckIYRv6t4LRs86L9n1uvXuEnW0Tb9xhf8=;
	b=OQUQ0QPA3PhNEt1DQWAXgefnVUgkYnJnnwNwM7ib4NLoEiiQfSIVuHXqq/P/DtLEEt
	eKd5BHtGBPIdf+TaB5f1pVeROvyLa17NCSgwDXIj2HDqhYSvtDaXmTwCTDHx+RJMh7Rx
	MV1lbq+FlKcpfUzdPbqQUOBsgoJKMnCHASY1xXsC2XgmSznzzjfHM805DagfqWdqNjTT
	2s8Ssh3+GprElXPyMAV9cON2sSNr3IXkkoeoaV/TsjPGQFEst+616576P1hZOimjBVCv
	5X2ErOGoWDPm706YRHI/NRS3frJUXvkZ3quKRh697zCbkKeqrfrMV4uKzF+Cq0Si/hbL
	sjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/TPXFn5OwQckIYRv6t4LRs86L9n1uvXuEnW0Tb9xhf8=;
	b=Wu5WPdNWxgGfUiisgdVafJ2RgyWjIkKV1VV9MknZgT9YLClLXcakc92HQozenzQlXf
	1+MyOkMdLx2QkCMRirAH8RclYnBkSZvT1WZ68uKX7nhH9wIERYi7Xi+3fZjiD4M4KokU
	H6DyjVKfiF9eFQtRb3hGScy2Si0WmkfcWcvgmdSs8DGWfBh6Om3xQduuW2JAxPrxXWUR
	ardEg26YH5iwOFpyAJAlow6njs1Wg1QsY/RHqjwVvLfVR+vuG7VWmpu8cSkoUmiQ201f
	w6XecPUm0wnoxAhr7HQuD5p4/h/vxOCuIT9eDAY5ad8IGwTrhLQk66d4+Vl5DQTInOrI
	XY8Q==
X-Gm-Message-State: AKS2vOyCRN6HyvQUtg1MIdIosxeqQIOTzMANGp7UaYOiDWCAFgHbKbIw
	EjD38wayTVXQ7pWH
X-Received: by 10.84.234.9 with SMTP id m9mr35730907plk.41.1497968065593;
	Tue, 20 Jun 2017 07:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	b65sm28779505pfm.29.2017.06.20.07.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 07:14:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 07:14:16 -0700
Message-Id: <20170620141416.29107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-oe][PATCH] makedumpfile: Fix build with hardening
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
X-List-Received-Date: Tue, 20 Jun 2017 14:14:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Add-proper-format-string-to-print-a-str.patch | 35 ++++++++++++++++++++++
 .../makedumpfile/makedumpfile_1.6.1.bb             |  7 +++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
new file mode 100644
index 000000000..056a0bade
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
@@ -0,0 +1,35 @@
+From 0fff28f31aef9ad1d5a817216a3c98ba9d605106 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 19 Jun 2017 23:52:14 -0700
+Subject: [PATCH] makedumpfile: Add proper format string to print a string
+
+Fix
+makedumpfile.c: In function 'write_eraseinfo':
+makedumpfile.c:8273:4: error: format not a string literal and no format arguments [-Werror=format-security]
+    DEBUG_MSG(obuf);
+    ^~~~~~~~~
+makedumpfile.c:8273:4: error: format not a string literal and no format arguments [-Werror=format-security]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ makedumpfile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makedumpfile.c b/makedumpfile.c
+index e69b6df..8b8a6b0 100644
+--- a/makedumpfile.c
++++ b/makedumpfile.c
+@@ -8270,7 +8270,7 @@ write_eraseinfo(struct cache_data *cd_page, unsigned long *size_out)
+ 			}
+ 			sprintf(obuf, "erase %s %s", erase_info[i].symbol_expr,
+ 							size_str);
+-			DEBUG_MSG(obuf);
++			DEBUG_MSG("%s", obuf);
+ 			if (!write_cache(cd_page, obuf, strlen(obuf)))
+ 				goto out;
+ 			size_eraseinfo += strlen(obuf);
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
index dacc76b04..83bbf7f41 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
@@ -7,6 +7,9 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://makedumpfile.sourceforge.net"
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPLv2.0"
+
 DEPENDS = "bzip2 zlib elfutils"
 RDEPENDS_${PN}-tools = "perl ${PN}"
 
@@ -21,10 +24,8 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
+    file://0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch \
 "
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-LICENSE = "GPLv2.0"
-
 SRC_URI[md5sum] = "16c0ae9902ae57be4a603a6ab1e86c53"
 SRC_URI[sha256sum] = "0b6e73106998670407887de9e1a505b3a2dbb2fb517a4b968a665eda8fb097ce"
 
-- 
2.13.1


