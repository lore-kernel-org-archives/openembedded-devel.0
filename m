Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED9E6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 06:09:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB369wm4009237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Dec 2015 22:09:58 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 2 Dec 2015 22:09:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 13:58:25 +0800
Message-ID: <1449122305-441-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [met-oe][PATCH] pmtools: support huge ACPI table
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
X-List-Received-Date: Thu, 03 Dec 2015 06:09:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

For some servers such as Canoe Pass or Thunder Ridge, they have much
more entries in ACPI table, so original 1K buffer is insufficient.

Switch to dynamic buffer for this situation.

Remove 'protocol' field in SRC_URI as well which cause warning:

| WARNING: Failed to fetch URL git://github.com/anyc/pmtools.git;protocol=https,
| attempting MIRRORS if available

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...tch-to-dynamic-buffer-for-huge-ACPI-table.patch | 66 ++++++++++++++++++++++
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb    |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch b/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
new file mode 100644
index 0000000..7ccdab0
--- /dev/null
+++ b/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
@@ -0,0 +1,66 @@
+From 03a886252f6555d6b0af76b654e76459642b89da Mon Sep 17 00:00:00 2001
+From: Yunguo Wei <yunguo.wei@windriver.com>
+Date: Tue, 3 Dec 2013 18:12:50 +0800
+Subject: [PATCH] pmtools: switch to dynamic buffer for huge ACPI tables
+
+For servers like Canoe Pass or Thunder Ridge, there are much more
+entries in ACPI table, so original 1K buffer is insufficient.
+
+We switch to dynamic buffer on this situation.
+
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ madt/madt.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/madt/madt.c b/madt/madt.c
+index aed965c..8770cd5 100644
+--- a/madt/madt.c
++++ b/madt/madt.c
+@@ -51,7 +51,9 @@ get_next_entry(acpi_table_entry_header * entry_header)
+ 	return retval;
+ }
+ 
+-u8	buffer[1024];
++
++u8	buf[1024];
++u8	*buffer = buf;
+ 
+ main()
+ {
+@@ -75,6 +77,17 @@ main()
+ 
+ 	if (verbose) printf("header.length %d\n", madt_header->header.length);
+ 
++	/* if 1K buffer is insufficient for acpi table, switch to a larger memory buffer */
++	if(expected_length > sizeof(buf)) {
++		buffer = malloc(expected_length);
++		if (!buffer) {
++			perror("malloc");
++			exit(1);
++		}
++		memset(buffer, 0, expected_length);
++		memcpy(buffer, buf, sizeof(struct acpi_table_madt));
++	}
++
+ 	acpi_table_print((void*)&(buffer[bytes_read]), 0);
+ 
+ 	bytes_read = sizeof(struct acpi_table_madt);
+@@ -118,6 +131,9 @@ done:
+ 		printf("Checksum 0x%x != 0; 0x%x in header ERROR\n", csum,
+ 			 madt_header->header.checksum);
+ 
++	if(buffer != buf)
++		free(buffer);
++
+ 	return 0;
+ }
+ 
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 602da5e..22ed8e2 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 PV = "20130209+git${SRCPV}"
 
-SRC_URI = "git://github.com/anyc/pmtools.git;protocol=https"
+SRC_URI = "git://github.com/anyc/pmtools.git \
+    file://pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch \
+"
 SRCREV = "3ebe0e54c54061b4c627236cbe35d820de2e1168"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-- 
2.6.1


