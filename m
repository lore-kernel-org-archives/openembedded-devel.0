Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4456D114
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s089WhGj014536
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:43 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:42 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:25 -0500
Message-ID: <4350c06664508c44cd1e0be1cad4fce1ffea18d8.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 05/10] libsepol: migrate SRC_URI to 2.2
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Removed patch and ported changes to 2.2 bbfile:
 - libsepol-Change-ranlib-for-cross-compiling.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 recipes-security/selinux/libsepol.inc              |    5 +++-
 ...ibsepol-Change-ranlib-for-cross-compiling.patch |   31 --------------------
 recipes-security/selinux/libsepol_2.2.bb           |    8 ++---
 recipes-security/selinux/libsepol_git.bb           |    4 +--
 4 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 recipes-security/selinux/libsepol/libsepol-Change-ranlib-for-cross-compiling.patch

diff --git a/recipes-security/selinux/libsepol.inc b/recipes-security/selinux/libsepol.inc
index 8f0dc33..b7509e2 100644
--- a/recipes-security/selinux/libsepol.inc
+++ b/recipes-security/selinux/libsepol.inc
@@ -10,5 +10,8 @@ LICENSE = "LGPLv2+"
 
 inherit lib_package
 
-BBCLASSEXTEND = "native"
+# Change RANLIB for cross compiling, use host-tools $(AR) rather than
+# local ranlib.
+EXTRA_OEMAKE += "RANLIB='$(AR) s'"
 
+BBCLASSEXTEND = "native"
diff --git a/recipes-security/selinux/libsepol/libsepol-Change-ranlib-for-cross-compiling.patch b/recipes-security/selinux/libsepol/libsepol-Change-ranlib-for-cross-compiling.patch
deleted file mode 100644
index f2fc313..0000000
--- a/recipes-security/selinux/libsepol/libsepol-Change-ranlib-for-cross-compiling.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2ee1e9651ec4aa78daf15dfef74e0b6aaeb8db1e Mon Sep 17 00:00:00 2001
-From: Xin Ouyang <Xin.Ouyang@windriver.com>
-Date: Tue, 21 Feb 2012 14:47:45 +0800
-Subject: [PATCH] libsepol: Change ranlib for cross compiling.
-
-Use target host-tools to encapsulate any difference between local tools
-on different machines. For example, on local PC, libsepol.a's index could
-be added successfully by local ranlib, however, it will fail on some sever,
-so we'd better use host-tools $(AR) rather than any local ranlib.
-
-Signed-off-by: Harry Ciao<qingtao.cao@windriver.com>
----
- src/Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index cd8e767..beea232 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -21,7 +21,7 @@ all: $(LIBA) $(LIBSO) $(LIBPC)
- 
- $(LIBA):  $(OBJS)
- 	$(AR) rcs $@ $^
--	ranlib $@
-+	$(AR) s $@
- 
- $(LIBSO): $(LOBJS)
- 	$(CC) $(CFLAGS) $(LDFLAGS) -shared -o $@ $^ -Wl,-soname,$(LIBSO),--version-script=libsepol.map,-z,defs
--- 
-1.7.5.4
-
diff --git a/recipes-security/selinux/libsepol_2.2.bb b/recipes-security/selinux/libsepol_2.2.bb
index efedb63..b4d717c 100644
--- a/recipes-security/selinux/libsepol_2.2.bb
+++ b/recipes-security/selinux/libsepol_2.2.bb
@@ -1,11 +1,9 @@
 PR = "r0"
 
-include selinux_20130423.inc
+include selinux_20131030.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "980964224683fa29d4ed65beb94b56ee"
-SRC_URI[sha256sum] = "290d17f583635a4a5d8a2141511272adf0571c4205cdea38b5a68df20d58a70b"
-
-SRC_URI += "file://libsepol-Change-ranlib-for-cross-compiling.patch"
+SRC_URI[md5sum] = "41cbe38ea809b5752f520bdeac4d2cf8"
+SRC_URI[sha256sum] = "77a4b27006295805bdbd7f240038cb32a49be1d60847d413899501702933fc0f"
diff --git a/recipes-security/selinux/libsepol_git.bb b/recipes-security/selinux/libsepol_git.bb
index 1fa83a4..bc2bd8f 100644
--- a/recipes-security/selinux/libsepol_git.bb
+++ b/recipes-security/selinux/libsepol_git.bb
@@ -1,9 +1,7 @@
 PR = "r0"
-PV = "2.1.9+git${SRCPV}"
+PV = "2.2+git${SRCPV}"
 
 include selinux_git.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI += "file://libsepol-Change-ranlib-for-cross-compiling.patch"
-- 
1.7.9.5


