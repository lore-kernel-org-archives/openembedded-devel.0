Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 055F772276
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 07:11:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAP7B9pH023783
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 23:11:09 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 23:11:09 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Nov 2014 02:11:07 -0500
Message-ID: <1416899468-28398-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH][meta-networking] sethdlc: fix host contamination
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Nov 2014 07:11:13 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Clean INCLUDES to fix the host contamination errors:

  In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
  from /usr/src/linux/include/linux/types.h:17,
  from /usr/src/linux/include/linux/if.h:22,
  from sethdlc.c:23:
  /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
    error: conflicting types for '__kernel_fsid_t'
  } __kernel_fsid_t;
  ^
  .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
    note: previous declaration of '__kernel_fsid_t' was here
  } __kernel_fsid_t;
  ^

* Correct LIC_FILES_CHKSUM to checkout license infos from sethdl.c
  instead of Makefile.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../files/sethdlc-fix-host-contamination.patch     |   42 ++++++++++++++++++++
 .../recipes-connectivity/sethdlc/sethdlc.bb        |    3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch

diff --git a/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch b/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch
new file mode 100644
index 0000000..f25a02c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch
@@ -0,0 +1,42 @@
+From 9a9137c3df5309ac359737d6ebd67fb4ff5f3cf2 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Mon, 24 Nov 2014 22:05:18 -0500
+Subject: [PATCH] sethdlc: fix host contamination
+
+Clean INCLUDES to fix the host contamination errors:
+
+  In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
+  from /usr/src/linux/include/linux/types.h:17,
+  from /usr/src/linux/include/linux/if.h:22,
+  from sethdlc.c:23:
+  /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
+    error: conflicting types for '__kernel_fsid_t'
+  } __kernel_fsid_t;
+  ^
+  .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
+    note: previous declaration of '__kernel_fsid_t' was here
+  } __kernel_fsid_t;
+  ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 0492f2b..97dec22 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ CC = gcc
+ CFLAGS = -O2 -Wall -W -Wno-long-long -pipe
+-INCLUDES = -I/usr/src/linux/include -I/usr/src/linux-2.6/include
++INCLUDES =
+ 
+ all:		sethdlc
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
index cf74827..5e8d9d9 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
 HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
 LICENSE = "GPLv2 & GPLv2+ "
-LIC_FILES_CHKSUM = "file://Makefile;md5=19aada31930b2be84bf7138420d77263"
+LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+           file://sethdlc-fix-host-contamination.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
-- 
1.7.9.5


